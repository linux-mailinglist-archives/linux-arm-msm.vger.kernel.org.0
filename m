Return-Path: <linux-arm-msm+bounces-88053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6ED0462E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD3EE3478F04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C26356A38;
	Thu,  8 Jan 2026 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GDG6vsz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012014.outbound.protection.outlook.com [52.103.23.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD337FF4A;
	Thu,  8 Jan 2026 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865395; cv=fail; b=urdi6t+Jx8x0vXt96QMMF1eISWMT7rThbI7NCNWr1spDkhCACUZIjin9Rwofgjz/6FdMOLzrjQoYKi2dOlYiBrtfD+hKttQvdUBYnzKo5Ytq6rpxES0AoozOmJNxKII1BJiupoaaVz/F6c0IQcG1T8FTnegaH03agJA5dOBA9Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865395; c=relaxed/simple;
	bh=jBqRHXPRHOfNCoOsEJwPlwlcSXv+ZYk86PL17dxxeHo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uY4M4bSoI7kjfWGgy7vyibfirjZlgDjLI1UBjEps3bg/QjIUQNjDUrftjdcvU7K1EYyycm3+/56TKY6qrVDHUDEg7ay4Yh+Leg2UxzyDmX3ZDYjN3U9NeyKykpjy58bI9uThqH79ADppLXqzgKdUKZbLQBB61eck9VElYZzetnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GDG6vsz9; arc=fail smtp.client-ip=52.103.23.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmZrcttE/DCZz5MvzlfFDIX5jpHqghTh1S29j7epjpYzf6sChYesO8pLnkh5wb8bS13KLWeKhybS2qic5FyF+GvKHiU8pG/Gch5T43+11WUTVqV+ZMB7iVSmQYB5spXqiAnBzPCSMVlCxuVlE+GQWS1HQOLTN4YUxc5F6rDaTAe0G/Cqht5Ygwwy4DcrQrdod+JPpCWbvUlJdI/8XXGYC2Lo9z5dXqsVKiTnHyBxRZkduMCB3KuHWcZZQg2A2s/Jgz4EBALxbdjDFYOUZDR07iH/AzmQF2sMmFAFsnApzGZKMmcX4wCMoirtKISl5OT0Gv0plyZYDwaaiXOdU76MNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxqtDbKj7ozx/sckMmH2jkC9K71EeA/Eazn8JbjwZqQ=;
 b=bGE3/R5GOkOClquuozB+u1YJoGZv2zmqG4ys93C28AakcG1pgUxEqCNYPLbcu/CMTq9iCWK1FlicbuzrZMCpcDy51yyKxEGE4tBuT/ilTdGMtfgAyEicL1L2LlTxyj5qedu/rjmPTBm+KDVTxh9cg3yj8/fVdDUZRm95kV80jNKFDoW3lnIGtGIMb1Us5dpd8fj6tN558bGnOdgDHYrthufa5jNOtiA5umdftMRHCV/I7u5nax7CZSQwlZEPOhf9TMcIyM1ZroxPFvq3K7pvNPRXzRXt2lKDYnOUmL771R+3znXJ/Taw8XxLK8BA2FrrHnrNF0/LhdER58XjujkjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxqtDbKj7ozx/sckMmH2jkC9K71EeA/Eazn8JbjwZqQ=;
 b=GDG6vsz9o9OvPr7+XlwsqLanDCZFZHT07VVstRBKxZti4QERtGkZUDJnsPCxFPqorpzF66in7O5XvXbC/cctRGd6u0kNTVCsfFcQmakBzAN3nI3E/qxfI963W4C4tQT47elTY2cg+jCY8vz1t3jDJaCMC+mEe0cOwccy4FkSkVu/y5lGZrrRbyzmclHFrax37af687YqSaNeyEwRy9PgrzLu8niYG4ejuFB1FkgoL+Tt7S/bifPxzO56btIcMvsOlX1oEotQFbp0re9BO8zci6+9OE6D2HLcgzPYuh/xgdL6VNBUEBueQ7iIzFiW+rjrPeU1SaWFb6hfweVcPhznRA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by IA1PR19MB6273.namprd19.prod.outlook.com (2603:10b6:208:3eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 09:42:59 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 09:42:58 +0000
Message-ID:
 <DS7PR19MB888371A31B691C9FD9E9042F9D85A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Thu, 8 Jan 2026 13:42:50 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 1/2] arm64: dts: qcom: ipq5018: Correct USB DWC3
 wrapper interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106185123.19929-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260106185123.19929-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::9) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <3e6c8457-05e5-49ac-9344-9e539f32b1fe@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|IA1PR19MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: c45037b1-b04f-43ec-0dd7-08de4e9a4e6b
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrPy8Gg0T1tV+ubdyTLMpos/f6pyKjb++3UDP/tiidd124pNQ2UUNUvG7/CNT/kr7htoX3SekVP+z7GlcrIaJBeW64s0ByF96/PY3vsY4vdAQq4oeSFGIAI8tJyqk2JRYeqVgljeeZxalEnHdLErZ3Pg1I74gk85lAPXeY9g+7ziC+6WV6tVkh1optHNaJ5Y9WPbLeczoRJzOhS432rmcToqAT5urH5GyXrJA1jfNLqNSXdYPd8vJpiy7VNU6wXjHOUchm+QBxr5a0c1rGEEHgDEJXI2CXgLXyZtD6IcirKva14E+ReutiY8z29tI+gxwS/tDXkR465P500uaOQSwq/7iRzOfDx0fnuLni/UwUzB0R7jbbqsWqKwQ+TcssySDcc+COmt81vEKGNbumZe+lRFT6ghr4Oj/qSIGbQxcFrvAHIrYHmDQ6TIxZhBHaMIEtGvsMlDmTi6v7IAYsX5pvaEoou/rCZADzpffXk31fBZKiWPxshLDpNm/RW9Dp0FBn3xv4BaxTvqWONNmVu1+6Yh72df1TsSYSsjtFbedD5MgLmRZVT9+d453VoFmP2FXIPBXORMBsqD7c50FJ2CfqeESGbjPYC3Lq0e/uSpNPCln95rhs6lhZ+48WesM5WWlGlaHyi21HfkgkSIvSTT2OqgVtWGPod5j0KmufaGrfn5SiHqMUgF5tRTwOLsmA7ao9I9fsCnLyPIZxqt12k+8PLnzw1skHHRBlRbZuSBxFLoztyjP/rIRLrWuwFsZfH6YqU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|461199028|51005399006|8060799015|12121999013|15080799012|19110799012|5072599009|6090799003|1602099012|40105399003|10035399007|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2pXTC9xRCtSMGFxM245TmFCektsRDc0MmNkWjlXTk9aUUJ3MlVTZHpBaGhw?=
 =?utf-8?B?dzd1NlVMa1ZMTE5LMmYrNTZIR0xNY0xhV2Y5aStBMzBQSkh4TjRWTjhobHlp?=
 =?utf-8?B?M2t6ditoUmhieWtUb1FCWTdnaUlFbmhMQ1JWZ0N4V3NUd0RMT0gwNXdwa0xa?=
 =?utf-8?B?UmNOTEJlY0oxcE9ySFV0anpWakppUWJKZWhuL3VqWnJmT0ZVSlRJOHFlOElY?=
 =?utf-8?B?MkNaUnM5a0RBNnU1Y1cwa2lEb3FZN0F5WHVTNCs2V0xReFM2aGV6dWNXUVJz?=
 =?utf-8?B?MDdQRllBcVI3c0NRcDBqeUVqVExUeDl0dDN2NXVJM080L0FkYjdvbGJ2WVFh?=
 =?utf-8?B?Sk9QUXR3QURLV2xXeVFYYXBQdGVvcmg2ZmMyQ1ZrM1JMczFkVXhPZHRFSVo5?=
 =?utf-8?B?dVgralVMKzkwRW1CT2lVbDBKWG5PbHpjRkV0UFhFUW9HbDYyR3NaYXpyUThH?=
 =?utf-8?B?L2h0Ukx5U2JuVlVsN1BPRnhOdklvYXF5OGVaS24xcWt6a2xpcWM1eS9GSEJa?=
 =?utf-8?B?Q1NYTU95dElXZzlWMmZRdTFTNGpkVzlRT2YyZHdoVXpGcE1sZU9tZXRjdXds?=
 =?utf-8?B?NHI5ZFFYczN5T1psR1FQL245clMrRFRodXJwTDBtNWFOQ0xUdk56N2xBdTdV?=
 =?utf-8?B?enh0dnVzS3p6dTk3Z250WE1rSWZ4YWltanZ2cU9PUnJsM2FoQ2Fva0RVR25M?=
 =?utf-8?B?djNNNzNuWnlWQ1RSQmVYWUtIRzFReWt6TXBjUXUxcU9wOE5aNWVLRXFMUVJy?=
 =?utf-8?B?ZUMvRHpaNGMyUkNsNDNTTzZrdis5b2M3VUEvZVRjRkJPUGFJVXVicXA5QnVV?=
 =?utf-8?B?TVRHblE1czJuc2UxMGMwTUdFM2hadXNjcHlvbW9nOFdXbVFLZnJ0aTVwSFlj?=
 =?utf-8?B?NWMzSDFTZWlaRFJrS2p0dDAwdWlLeDVVL2ROSGJOQVFZaHdzcjRSWm55L1l3?=
 =?utf-8?B?L1FIS0dpdVVoRnlkdUhZWHVJbjJ0b3oraDRyRGJKTlcrNjBybVV2clRYUFdS?=
 =?utf-8?B?VDBKck81OWVVdXZZdWVHcmsvTmdEcUgvWGFnN2VOTUcrblhNb0RSV25mbzlY?=
 =?utf-8?B?SHFmQ3daWncxZHdMNzh3dHFHTTJEMzZhcXFsVEU3aW9oMVpxSjBlK3FMRjFO?=
 =?utf-8?B?UFRWenA2ckdDUVAxZ3RWZXhqWWY2QjQ3Uzd5YlVFWmtRSVlkQjB6QVpiQ1lX?=
 =?utf-8?B?aG1wWjF5ME8rRG80SzJsbFM1bGJocjdGcHgzbmxBUTFTQjNmSHVoMlRVcVpu?=
 =?utf-8?B?SUdDVE1uMENwT2V2QnJXejBsUGpPK1FxYTROOHg3Rmhtc2lUZEx2aEJra3JM?=
 =?utf-8?B?eTA5WmhQOFEzUjBqeVJacTlaM1p2YzNlNUJxbFpPTEZITmptMzZHbXdEenEv?=
 =?utf-8?B?OHlyQXJDeCtwdU5wdlZyQ2t1YlRDN3RDMXZjTW9zVVgwZ3piQmszWkxwcEdX?=
 =?utf-8?B?ZC9PaG1jVGM5WVdJUHp6Y2hJUGRzZi9NbE8rOG11MzRmTktSSlltMzIweVoz?=
 =?utf-8?B?N2puZjU2aHB4bHNnUXZBVlpCVXkwVzVjcHBtL3AwZmJ5cXZhNk1iVFZKR2Uz?=
 =?utf-8?B?dmtpdG1mNXZveHlnaW15dy9XNEFoY3NiYUNJVkJZZFBpcnIvYVBXTWJhZDdK?=
 =?utf-8?B?YnF0a0ZUM2Vubk5RQmFPaUhJdDMvK0lBMnE1U0cyL0RGbHVUNlh4NWlzQnlm?=
 =?utf-8?B?cjJRWDF3VHYvUmwwWVBPVDkzdHMwaXhVWW9XQzY1QjhBeXJBMVcxQlZNbVgv?=
 =?utf-8?Q?RAhHHD8fWrVcBzauWhCVjQbcExONtbSI5Qs3w6l?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aldIWVlQcklnSjdIcDRwMG50UEtOcWQvVVNQOW1ZK2Y2MGpuNm5CNThCTkgz?=
 =?utf-8?B?YU52QUFlcGgvcHczWG9HVndTT3VGcjFKS1hzUjhXSSt0c2cxb0hvT1dJVDk1?=
 =?utf-8?B?bW1xTjlVOVFPUDRNYnlLTG5wT3Z5ZGh2dFhFOEtmMUtNSWFieUxia3ZreFhx?=
 =?utf-8?B?V0lmTWp3eEZuR3kySXRrMmhhbHBkK21URXV2YlBhMkJ3WDhLajA0c0lueFV4?=
 =?utf-8?B?WUZEYS91N2VuRzlrVXZrayswbmV2SHEyL2JONDlhb2NFUlY3N2FZOWo0dVVP?=
 =?utf-8?B?My9TTEZuaW5nUWhnMTVESFBpdzlJWm1HdUx1YjVnbkFGZEU3TGVUSWZtL2hC?=
 =?utf-8?B?OTdaVEk4VW50Z3BnUUo4RXZvUmJlK0wwNlVMZnFXY2dicWpOYXFmaC9oYTVv?=
 =?utf-8?B?QXBaZHlzS05FaS9XVVpHUlNNamQ0VDBwM0VxdC8xR2VWekZJYmE0TlhnU1pI?=
 =?utf-8?B?ZUtXSzdOUEZLSTM0aUNGNXMvNW1QL1p6NHVpVXUyTVNhWGhUZGRwQk9JcDhR?=
 =?utf-8?B?RkpmeGJhL3hoeXVuUTQxcmtSVE5uaWxSNkx1a0ZyUkJua0FsdHRSdmZVbXc3?=
 =?utf-8?B?eFVOa3NtTDhJc1orenUyRFUvcG9tRC9YZ3lwNDNyS2FscFdJQ1lReGhLcjVP?=
 =?utf-8?B?Q1RiYW0xZEJlN1djaDkrRGJ0MFRHUkE5MGNEN0U5Uk1Dd2l2UVdVS1kxTFZK?=
 =?utf-8?B?Y1lqbEpHcTY1VXNaNXBHbmdMWXgrR0d4NGNJcDhFN1d4ZWxYWmNlVDNJclJx?=
 =?utf-8?B?SWJlVG9DNWZpVVRwRENHNzl6Z3ZrMHc2M1ROZXZUekVlMFdaaFJkTE9PMk5r?=
 =?utf-8?B?M0dUaWZBbnRvS2lFLzUzbDQxV0ZsejByc3h3eHo4TmFsRHVNakVSWDFIeCtY?=
 =?utf-8?B?aFMxeVBpajdQTS9qKzBtTFdwdWUzNlh1M3R6Sm4zcmcyQTVrVzRCdFZlWEJp?=
 =?utf-8?B?L3Q0N2pHUllhVGpranVWV0dyYUFZRXhJaFhOY2dnRGVqVWlNYnpYSExjSHhJ?=
 =?utf-8?B?WWcrZHpFSFJaN2w4NEdDOGE5RUpoeStyeHJJRW5uV1VHZUxPVGhIVXVRUyt2?=
 =?utf-8?B?Q0ZZVzFnaUQrbVhRUFdPTFU5UkRLbHdLelorTGZLSWp4S2RBWXp6T3pRWUdt?=
 =?utf-8?B?bG1EdFJQVGhraGpRdW4rb2lDVFFENERUa3VXd0p0M0tZbCtNSlkxbTRLVDUr?=
 =?utf-8?B?aCtSSnc0cGMwL21heTM2ajFnMVZZWnlCaElLcWFsck1oMzZVZVZCR0hOZkxm?=
 =?utf-8?B?RnJTUGFRTTFsTzB3alVmVUczNjVHcFZ0TXBzMlNXaXJ1UlQ0a3pYdWRMSHNZ?=
 =?utf-8?B?S25xb0dpRXBFR1orMG5jZ0xoOUpkYVNhenNJWWlKcityLzF0cGRmL2FsbHNm?=
 =?utf-8?B?aVUvUXc5eXZuTkxwQkR2R0tZRlU4WEhVbnRXQ05BZGpSbVNpQ1gwNDR6SExH?=
 =?utf-8?B?Y1JvRlhXYW9ybnNHSUgwbFJ4TjVmdGN1QVJ6eFE3bVZSamFCSlZOQXVzMjd4?=
 =?utf-8?B?S3F6TVcwNVpaOEpwdjJ2UWdmYkNTamhRalVlL0g1L1BSUzlSdUE5ekNPTWsy?=
 =?utf-8?B?c0ovV0xwRUdnRGVjNC8vL0VOOUdrc0s4ZUJienViOC81N1pHWGRGWGdqWWFC?=
 =?utf-8?B?cjF1U0ZUTTJidG9ZNWx3NGovVTdGYlRrQzB0eVRzRmxrb2lvN1FjSWJGenZs?=
 =?utf-8?B?OFNCRlA3MitKSHk0M1Q3Nk12M2RLaHpOdllRYXpCVkhWdndxWVQ0V1ZNSGNv?=
 =?utf-8?B?Sy8yRmViS29jZnFILzF0UWhCcWhKZ0VsNDJXcS95ZEQvOXNGMmRNUE1DQlN4?=
 =?utf-8?B?cFJaNHFWZDd4YjY0WDVFcS9rNXV1aUppWG1oYTVFSWFZSUhickRaM0JvWGIx?=
 =?utf-8?B?UnVDRW51NVN6ZGNub0tMdDltYSsxdXJndVBKbnU2Q2NKeGc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45037b1-b04f-43ec-0dd7-08de4e9a4e6b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 09:42:58.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6273



On 1/6/26 22:51, Krzysztof Kozlowski wrote:
> Interrupts for DWC3 node were completely mixed up - SPI interrupt 62 is
> not listed in reference manual at all.  It was also causing dtbs_check
> warnings:
> 
>   ipq5018-rdp432-c2.dtb: usb@8af8800 (qcom,ipq5018-dwc3): interrupt-names:0: 'pwr_event' was expected
>   ipq5018-rdp432-c2.dtb: usb@8af8800 (qcom,ipq5018-dwc3): interrupt-names: ['hs_phy_irq'] is too short
> 
> Warning itself was introduced by commit 53c6d854be4e ("dt-bindings: usb:
> dwc3: Clean up hs_phy_irq in binding"), but this was trying to bring
> sanity to the interrupts overall, although did a mistake for IPQ5018.
> IPQ5018 does not have QUSB2 PHY and its interrupts should rather match
> ones used in IPQ5332.

No functional change, but USB port confirmed working on IPQ5018 device
Linksys MR5500. Thanks!

Tested-by: George Moussalem <george.moussalem@outlook.com>

> 
> Correct it by using interrupts matching the bindings and reference
> manual.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Not tested on hardware.
> 
> Bindings for this change:
> lore.kernel.org/r/20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 721b642acf8e..6f8004a22a1f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -571,8 +571,12 @@ usb: usb@8af8800 {
>  			compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
>  			reg = <0x08af8800 0x400>;
>  
> -			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "hs_phy_irq";
> +			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq";
>  
>  			clocks = <&gcc GCC_USB0_MASTER_CLK>,
>  				 <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,


