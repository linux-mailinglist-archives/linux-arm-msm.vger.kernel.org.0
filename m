Return-Path: <linux-arm-msm+bounces-21115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D49B8D4D9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30DA51C2251B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEC9186E50;
	Thu, 30 May 2024 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CIfmfssS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619ED186E26;
	Thu, 30 May 2024 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717078372; cv=fail; b=VEcZHDyUyOeHMBMPLBcJJphl9PArxf/LNsV+Ih3IqGlY2yhQNYTSm8yY27bKTeFwtd1yNhwczDVmkd/S22AjSZEGDtfGJaN8hlICTkgnvsq7EWF5074CXjFPJVbqcgmz3ySH1w/MJW7dAAl2ZcmujKHqx1tjwGeNydnyOn8feZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717078372; c=relaxed/simple;
	bh=yAXk2X8xD6vw4g6rU7aXzrmuZrIV8AoY6qiLHHoe3ns=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d3uL8o5ra2o+HfKpxIN90FJPW0eEZUMhEsDrwuP10ChV1rzDpGkPUz8eJlVAf/c0LoH5i8TzmpKOp+fVLH9Yx18PHnffP/qIL73znv/g3DpNGwtmOz83AyayN7XWkQHpR165uP2AqlPiWErlKWFVvJNWJ3oRKYYSinadM55/JmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CIfmfssS; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXbIAgfGaKWyAWdGZQv7QWjYzSh0Lwkjh3PYV1yppXgxfZR4tOH2SPojOW5VRhGwLCvz5GkaPhPwVCCy/cyCgjvYXuSSBaI47kBp3K0sX1UINLP9+bxlxZpZ0wzXjGXYM2HuIblI/rpL191L72fqpJGPfl9/WGraZ4y1HGJ4sFG001BgCoawBQtFkv2jvxfoI5WqXX/EJ1wfwGxzHmbEsWwdNfKODD1ixprsoSWn/KeyG4HvIcyipZ5kkBa4RjD/6DF3gLh3JceoF2+nQ5IlGZ0RIcNyxo75LMkVHEUrTEvVebtt95YWjJY1JLMgubI2FJy1XF/WsH80VVtHSpL/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr0W7oULfUYCsxJiZ8zreVipRTKrSb/ozcngFs0bIWM=;
 b=garoRpHoMuSOo0J8HYZSK2tS6BRqg05c0erEIQlVqhTwfeysYoLb5Yta9xO9FSHCPsntk0BhAYRnIQ+R9Cq8mRgUpNYxpRbCcrluR2yCO9nUQUu3gDiKnmSCjM+gMtIgtKoCJcYpihoZsl0sTfYWKaDWuueCpat6z0iYB2F0mAybCpkfjWwwWWd/Yli/m/UE0yd8aBwpqrrz7szRBKYIdeTi8CG6nDXXVd/BLw727S/KcIzreBbkekmobvpTprD8eAcBt5E/0g5ZKEcOJvhwaL7EkN7FJLNvTHcWF49au6xYGQqK4RPEDrWEcl94els3ELM4NC0P9efqYtYcnCqC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr0W7oULfUYCsxJiZ8zreVipRTKrSb/ozcngFs0bIWM=;
 b=CIfmfssSIBpDILGWEtJiY1w+8QCsH+deCv5AxPac9Gzz80yE+2DIEeK3LSVt+q3IZrNUBYGiiAw7x9X+usM45vuaxkGa2Dq+F8/3sSxQgqGihaTOCtK6vtgjIt2OXE/Ygs1GXyWUVsktmmIiq8DkphBXHXIul1G/6vlnQXqK+YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 14:12:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.7611.016; Thu, 30 May 2024
 14:12:46 +0000
Message-ID: <7e29844c-43c1-4d41-b0e0-8686975664f8@amd.com>
Date: Thu, 30 May 2024 16:12:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Amrit Anand <quic_amrianan@quicinc.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 "Humphreys, Jonathan" <j-humphreys@ti.com>,
 Sumit Garg <sumit.garg@linaro.org>, boot-architecture@lists.linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 "Skeffington, Wesley" <wesley.skeffington@amd.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAA8EJppYmVMmhgLSiSEGA_r4hFbQYriOLjNK9b6VXUYEYiZ6Zg@mail.gmail.com>
 <c875cd34-d09f-401a-8c57-45deddf65c9a@linaro.org>
 <218c63fa-5582-4f1b-8a02-da7ec66a45f9@amd.com>
 <20240529081032499-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240529081032499-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0182.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::39) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d859d87-ad00-4254-1a8c-08dc80b29461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUlHZDlVU1N0TGQ3bUE0SG1Bb0ZzQ1RhTDlTeERmbHIxSVFXNkdtVTNoNytn?=
 =?utf-8?B?eXVkWCsvWHpFektqMHMxQTZoYVhETzJnN2UvcUFJRFdlNXBrOFRLaTVpaXUz?=
 =?utf-8?B?dER2MHRSZXFVNUxIZzlMTU9yVElUMjhZbURPanZmQW0raDczYjc4U2haeHYz?=
 =?utf-8?B?amNQelpVY3BZUFVFOGt0M2tmbVJIYjlnSnRKTkd6NGc0M1RYVDgwZ1hPcFVp?=
 =?utf-8?B?OFQraFN0VnhQOTNqZUh1dEU3ZWpDUXRNUXQvWlZ5OFduVHFKRjIvWVZVK2tz?=
 =?utf-8?B?dm1UYUlnV1VmN0NSTFFJSUpQWWxWeGVBLzdqaFI2RjJ2TlNGcDl3UWZXd3p4?=
 =?utf-8?B?d0dFOU00NkJhNENJUWE5VS9qN29JaHRkb1BsTkM4dkRndjhMNnVzdi85N3Fz?=
 =?utf-8?B?UFkzZGcyRTlzdk5zbDJPUjE1TmpLVitOYzlQYkhFVTB2RXpiYWtRcUFJVVQy?=
 =?utf-8?B?aWFPQjdVSUpWc3Y3YUFZUVRLYnRzYkorS0Q1R0l1QlFwVWp1ckJNQXVTdis2?=
 =?utf-8?B?VFI2L01Ua2hWdjFjQUhmYllRTWVwT2w5N3EwYkpoc0pLSDJma3gwV2tidVNJ?=
 =?utf-8?B?Ty9SNThtQVNhOGcxa3VxWUk1WURNNVBBR1BQbklJSzVacXVqZ2libC94R09H?=
 =?utf-8?B?NFlsUXhPUW5ISWtzTWY0aXQrZmdsY1ZyQVZLYkRnc1JwNFQxZDRpbkJLQStm?=
 =?utf-8?B?dGk3SHlJS2tqMkh2VHNKdktyWk5HQmNzOW9kTldTZHZtQzNGSUc2akZVT3Mw?=
 =?utf-8?B?TGhHZ0M5dVBjWGxvc256TnhaVzRPTVdIUGF6RUhTL2xia1FnMUNFUW5JVmhJ?=
 =?utf-8?B?UVZiZlh2cDdKbjdpakVscWlZUUR1bk1VRWw1VmcwK0ZqQkJ3WXVsdzUrUTJK?=
 =?utf-8?B?R0V0enNCU0t5M2VFdFJ2djh3RWkzWWs1L2FoZXZWVU5KUkwycTdhVmhqaWxi?=
 =?utf-8?B?SGN2bHlWZW9FQWxzUHkzZTlYb0FrZXJML2VZVjNrNk9lYVVKQnFBVFhiblFa?=
 =?utf-8?B?ekNQWWFITGdrVlE2OE42bXU3c0tMZmdpWGo1MEx0WGxBL2lHVHRPcWQ1bEZE?=
 =?utf-8?B?MHhPa0xxZmF2Tkh4TENNekFMK3ZXV1dYaE1KYUJUQWxvVm5XbmVzNy9OZnlG?=
 =?utf-8?B?bDdXT3k1bWNQU0tZM2ZGSUc1MDdTRXBJMDNRQklPLzl1OXo0c2pITW83bE1o?=
 =?utf-8?B?NS8rNzYrNjBXRk1CaFpEelJrT0ZFVEZIdGtCM0JRc3VVZk5TdzBLNGhkcTVH?=
 =?utf-8?B?M2RuMzROSXo5Vmg5WXkwVFVoT0w2UzA2eGozRStZRGZUSitaM0cvUmVyTGRx?=
 =?utf-8?B?QkVpcmRpZFlqZ0srUmxFdGVXeWRBRm0yVlJPTUVHVnNYbjhGWnIzSzdqTXRk?=
 =?utf-8?B?YXRhT2REbE04U2dlT1dQdmN2VUJieUhmWkhUYmZmTXFaUGhBV1U1MnJGcHpo?=
 =?utf-8?B?UFE2Tml3WlR6R2NIRGRoU0VVaVZ6RUlNTmJsb2lvZDdYN0NCQUg3ckNxVnVu?=
 =?utf-8?B?VlN4bTZDWk56eGcvVWxxZm52N2ZXbjgrd3g0V255LzMrTFQ3UElVMExEYUZP?=
 =?utf-8?B?dTk4NlV1MUlXNVRua3dKNWpDOFoyaGhLOXZOcUhlMGphOVh0alRXOWEzcE5s?=
 =?utf-8?Q?xihdf63/yLps5TbkNoZ0bA7bRrpISuoMa9CckTt2jxrY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlFUWkp2UXhqdDZaS2g4QWRyN3FGVThPL2ZqOWZSK1dNMkZFbmplaWlwWTQr?=
 =?utf-8?B?dTc5NjNqQ2tnUUVWYkJCdEhVZDhnOERyRDZvQVJHZmVBc1dudHZDbXpvdUpi?=
 =?utf-8?B?R2NsMm1FUkIwK295dlE1d3JqSzErWVpOejNiMW5OTnRmT0w2dURncG82ZVpV?=
 =?utf-8?B?aVU1Vkp5NGEyWUF4cUlyb0dzaWZSOWh5cE5ybG9LNFVYVVlmR2hhNEs5OVN0?=
 =?utf-8?B?U1E1R2NLSjZhemVSRFBoZHNZNVdFSXpxcUQ5bUU5bWJZMlF0Qk5meHNqV0ho?=
 =?utf-8?B?VkJWOHlkZEFrR0VnLy8rd1lrUzUzMUphVXhwdWhyTTM2azBmN2I5UkNMU1ZC?=
 =?utf-8?B?MHh6UENZWWNKemdsTGF4OWEwYTl5Z2xhRFppNnNyMnBxT01WWmkzK1pURjRG?=
 =?utf-8?B?MG9Vc21kVG4wSE5PVmR4bys3Ykl2Nm9QYmlIc2psMzluMkd4YzBmY3NaVDQ4?=
 =?utf-8?B?Z3ZKRjczekw4bHB6SXBtSXlBdURkUFFGdmt0aUMzNTJ4eE5ieElKZkhjT3By?=
 =?utf-8?B?Tnl1TUVjK3VWTU1BalRYV1FTVmMxa0sxU0dpaGp3bmZnb3Rzb2xFdDRTSEhW?=
 =?utf-8?B?cURBNmdNcDJEWWh6VVZobWtMai94VXhJZ291V3FWWjQrZG94NlRsVXZuK0tW?=
 =?utf-8?B?QndpaTVlZXpCK3AvUXZQeEVkRldsMTVuMmYvNUdOTC94SGdpKytRVEtQVHo1?=
 =?utf-8?B?VGNtR3N0NDVQcHhvTnBGMTRtN1RSTjJCeWIrc1h6UEtsZWVrSXpJQTJxUG9p?=
 =?utf-8?B?cksrM3dSV0xKdzNQc2E4SmhKUFJCOUZVamU5TDFJNUlMQWpSMWpBc1RtTDZN?=
 =?utf-8?B?WWwydEQybVhTbTBaOG5MdmFzODR5bUpZS01wSEN5dEVuZVc4TUhaeWJEMmRX?=
 =?utf-8?B?L2tIbUtjNCs2dWxFRk9Kakx3WmN2UGJ1cUNJK1F0dU5sdUZBc3ZZQll1dmU3?=
 =?utf-8?B?L3dKRG15czJJUTNuKzRwckF0T09PajBGSHVBd25yOU9peFdTVGNnVlFrbUZH?=
 =?utf-8?B?OGZzUzQwaERSYytaSGFmR1BEcTZtcEI2OUpYU0RaVTFjZHUvYjhYY1I5L3hM?=
 =?utf-8?B?WlhlN1ZLNUFBeDJqb3Fha1IrOWVNZXQ2dGw1d2JnSWc4SUlORGFXLzdCdDNR?=
 =?utf-8?B?OWxlNHp0NUpSOEJhcVZqUmY3TlFTWW1sQ0puZWptZlR0emVFRXR0UXpNb0JR?=
 =?utf-8?B?TzNoWnJObHgzdjlVRnRPYmp3bnJVaExUeWRjOUNjZXY3eXdCLzloc1RCalAz?=
 =?utf-8?B?dTdld0k4aHRSN3JhcnJmRWl6bTkwK1N2cTlLZ01KMTA0bmtTcXZhS2xMdjIx?=
 =?utf-8?B?QVlkMzZpaU5ObTUvV21nUXJITjJnVzJMYzMxZ3BaTTZ6N3lZY1dIVFJuSGZp?=
 =?utf-8?B?WGRiWVk4bE5uMWw5L2tNVDhiVVFka3ZoTmxkWmM0Z0ovNDdUZndFcUROaDRH?=
 =?utf-8?B?a2xueHExM0hXTERkdDZWNkVoeTB2c1JzMjFZSlFLVC8yaDhReGRNMWJGL3N4?=
 =?utf-8?B?d0h2ZWdscmZmRkRQT1d6VU5jTnNSMmswTVpla3JqR0pzaWJEQ1BGZWIwTmh5?=
 =?utf-8?B?bS84MUZoSzJwb0Q3VDZnNmVvWVJISEtPdWNLS1V4STJ0US9XcEZKMzN3Zjc3?=
 =?utf-8?B?TE9yRU9zUGRqN1RCTnpFZ1o0UFRKeEx0ZGlIMUF6bkxNUVdpMFVEVmFLNjN5?=
 =?utf-8?B?RGQrN2E3blpLWjBRTlNTRDVZZlFLemlYZ0lmNVVhNUxMVVJ3dU5ZdHlpRWlh?=
 =?utf-8?B?VktJbkhkN0RwcEU1VjV2aEk4VllRVk1LYnMyMjhMUmVsOWZOZ3MyRjJEN05I?=
 =?utf-8?B?TXVPOGhPc2QyYnZKcExxUEYzM1lSdSsyV3c4b3U1UjJRWGFwbGNoTlhFWW04?=
 =?utf-8?B?VjkvV2pPWVRENUpGeDN0dzRRSXpHMk9JQkJ4b0ZReFI2cFlRRTFHZUQyeGFo?=
 =?utf-8?B?eVgxcElScHZPUkg1Z05BUGk4cm5QZmxqU2N2c0xFMWUvaVlRVG90OWFVN0th?=
 =?utf-8?B?TitVU0lDcEtHVjRtYnNnWlNJai8ycTRTM3grOGg0OHY2cUlwUzRPU3VnLzFp?=
 =?utf-8?B?OTNrK2F5MnFrdHVmYVh3VGZ4OXU5RjN1RHRjRjV5SWtMYzJDU1hIREVQV1lK?=
 =?utf-8?Q?5JpjfDW9IH33ga5AP4H62bzq1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d859d87-ad00-4254-1a8c-08dc80b29461
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 14:12:46.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NRppdxwFE6aILVWfZkbGZPbPN1oj1U8ZrRQcpovJBLxw1CXILkfY5b/9yNexWmG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954



On 5/29/24 17:32, Elliot Berman wrote:
> On Mon, May 27, 2024 at 09:19:59AM +0200, Michal Simek wrote:
>> Hi,
>>
>> thanks for CCing me.
>>
>> On 5/24/24 17:51, Konrad Dybcio wrote:
>>> On 21.05.2024 9:00 PM, Dmitry Baryshkov wrote:
>>>> Hi Elliot,
>>>>
>>>> On Tue, 21 May 2024 at 21:41, Elliot Berman <quic_eberman@quicinc.com> wrote:
>>>>>
>>>>> Device manufacturers frequently ship multiple boards or SKUs under a
>>>>> single software package. These software packages will ship multiple
>>>>> devicetree blobs and require some mechanism to pick the correct DTB for
>>>>> the board the software package was deployed. Introduce a common
>>>>> definition for adding board identifiers to device trees. board-id
>>>>> provides a mechanism for bootloaders to select the appropriate DTB which
>>>>> is vendor/OEM-agnostic.
>>>>
>>>> This is a v3 of the RFC, however it is still a qcom-only series. Might
>>>> I suggest gaining an actual interest from any other hardware vendor
>>>> (in the form of the patches) before posting v4? Otherwise it might
>>>> still end up being a Qualcomm solution which is not supported and/or
>>>> used by other hardware vendors.
>>>
>>> AMD should be onboard [1].
>>>
>>> Konrad
>>>
>>> [1] https://resources.linaro.org/en/resource/q7U3Rr7m3ZbZmXzYK7A9u3
>>
>> I am trying to wrap my head around this and I have also looked at that EOSS
>> presentation.
>> I don't think I fully understand your case.
>> There are multiple components which you need to detect. SOC - I expect
>> reading by some regs, board - I expect you have any eeprom, OTP, adc, gpio,
>> etc way how to detect board ID and revision.
>> And then you mentioned displays - how do you detect them?
> 
> We have a similar mechanism to what you mention below: we have a ROM
> which encodes information about the platform and that can be read by
> firmware/bootloader/OS.
> 
>>
>> In our Kria platform we have eeproms on SOM and CC cards (or FMC/extension
>> cards) which we read and decode and based on information from it we are
>> composing "unique" string. And then we are having DTBs in FIT image where
>> description of configuration it taken as regular expression. That's why it
>> is up to you how you want to combine them.
> 
> I don't think this is a fundamentally different approach from my
> proposal. Instead of composing a "unique" string and using regex to
> match, I'm proposing that the information (bytes) that are in your
> eeprom can be matched without going through regex/string conversion.
> Instead of firmware/bootloader doing a conversion to the strings, it
> provides the values via board-id. I have concerns about having
> bootloaders to contain a regex library -- probably easily addressed by
> standardizing what terms the regex processor needs to support. I'm also
> not sure if regex strings are an appropriate use of compatible strings.
> Using strings limits the usefulness of comaptible strings to the
> consumers of DTB, since the compatible string has to describe only the
> boards the DTB is applicable to, you can't mention compatible strings
> "this board is like" such as some generic SoC compatible.

We use regular expression to match fit images configuration description not 
actual DT itself. And because we have base DT for SOM and overlays for CC we are 
just using compatible string which is coming from CC only.
That's because fdtoverlay works like that (pretty much when compose them 
together compatible and model are rewritten based on information from overlay).

In past when we used applying DT overlay at run time via OS origin 
compatible/model strings were used.

I don't think we have any need to try to look for DTs provided by generic 
distributions (generated mostly via make dtbs_install) and we tend to provide DT 
directly by firmware as is required by SR IR.

And DTs for programmable logic are coupled with bitstream itself and for it at 
least on SOM OS is fully aware about base board and it's revision and chip size 
that user space loader know exactly where it runs and which bitstreams are 
compatible with that combination.

> 
>> Currently we are merging them offline and we are not applying any DT overlay
>> at run time but can be done (we are missing one missing piece in U-Boot for
>> it).
>>
>> In presentation you mentioned also that applying overlay can fail  but not
>> sure how you can reach it. Because Linux kernel has the whole infrastructure
>> to cover all combinations with base DT + overlays. It means if you cover all
>> working combinations there you should see if they don't apply properly.
> 
> Mostly, I was referring to a situation where firmware provides an
> overlay. Firmware doesn't know the DTB that OS has and I don't see any
> way to gaurantee that firmware knows how to fix up the OS DTB.

In our case firmware is providing DTB to OS (own or via bootstript).
99% of our DTSes are generated via our Device Tree Generator with connection to 
HW design which is used. And it is pretty much unique based on used 
configuration that's why I don't think we get to situation that OS will provide 
correct DT for us.
That also means that we are not doing fixups in firmware because that fixups are 
coming to device tree generator aligned with particular releases.

> 
>>
>> Also do you really need to detect everything from firmware side? Or isn't it
>> enough to have just "some" devices and then load the rest where you are in
>> OS?
>> I think that's pretty much another way to go to have bare minimum
>> functionality provided by firmware and deal with the rest in OS.
> 
> Agreed, although not all devices can be loaded once you are in the OS.
> All nondiscoverable devices would need to be desribed in the DT.

 From my perspective IDs you are talking about can be find via different 
channels then just reading it via DT. They can be passed but we simply just read 
our EEPROMs again and also chipid via nvmem in OS and used that information for 
dealing with DT overlays.

I don't think that we have the same need as you have but it is pretty much 
because our programmable logic needs to be handled differently.

Thanks,
Michal

