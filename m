Return-Path: <linux-arm-msm+bounces-56530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00971AA767C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90657980EFB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FF5258CC3;
	Fri,  2 May 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Svj+AQPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02olkn2060.outbound.protection.outlook.com [40.92.44.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD472586C3;
	Fri,  2 May 2025 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.44.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201252; cv=fail; b=iDWJJh7WtVbTd0fqoyj0jP9DYuTz1trIkt9NJY+J+vYgqgudYy1gbR+A+zpDCZ50vblC9Tl+O6ZlC5JPdKTLz4us0EshK2N7ouQknN6vMmCABiHZxS+4E18qR8z3t7vVLleDJUI/Qnj8YhSp6QmO1yrI+4NItpzFRFwTaP/v6FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201252; c=relaxed/simple;
	bh=5RQ7GLD4htKBdsA+8XfWeAGETDoTYEvxFdtClhqt6PE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uFa3jK19dne887QVwULphZm/fV6sirrPQoidNWB8Nek8W3PuInfeqB6o41RMYM4EV/K8/N73fuRkGG163V3Cymy0gQduSxD+o8TKABTBjf2rL7DincWoQp5xVrxR7flguzYa5eCH8WR6LGVQC2JhFc+PV1SYRm/nq3xeVKefEhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Svj+AQPD; arc=fail smtp.client-ip=40.92.44.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x986NI9cxZrcYvZueHdN7FCoDOm4hU82imNycOEjevbW/3f9Fj6grW9GaJKUDqQ5M0UtsGSK5M0ri1PYp7XatiUbNxu/O6Hr/TpGYEisiTc3UFycEX78OzvBrDSOiUHrwd7ri+ahbXZ+M7cr4csQMjRFgPGFtZxGbEGGd6nv9ZRoaYQRc59ORLrOwG/Bce8cba7OgorOiN6sJFgRmFIc7ypHfMyysLBHbu8KmnmPj8QmKwJ8vwdjv6ldhd2xOx525WMnIy0c7BPDMtvQkwKjMKx9UYNbG/3ZmWSzpEMwPnCWJogUBqsj46OU6GtrJC9BPcDmNgGp5HZtZr3aRjle1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDxxyUfMAqdreDfdBp6b02kCn6ZonN8yVz8bStsQjI0=;
 b=kJrsLYtjskk6neJGu49xwIj+gKanF8qQTrz4lAKxhYTUWOdXUEX7KzyknpAC3aWrM7n76GQRonH02HddyFUBgOxNAwaqF6Q/bb9bx8scb6vK0v4daeAcFLdQh6nqcI8LooOXEK5pzxTbK8rSU9u1QrbR+yKKovEX3OsAV7oaWdVgkvLUCrIEFVWAT61IeK4nlbqdjJLyeGRC335g9R04Uc//RC9r7nyiqe5fnicDNlkKggWPoNRW2CAWztK9SkU/BlhyhGMwhUUo9WgDtv/1O/pPtbkFJnNe7qcn4HO1KGvVKmgiRnQZ9L7+Q7GMCRxJMSOQwhMDLgvXIhk7DQXA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDxxyUfMAqdreDfdBp6b02kCn6ZonN8yVz8bStsQjI0=;
 b=Svj+AQPDAV/ib64XfBw1YBXVViZOp2keGWm7yvucFr5fd9W78oC7tRVnbnc2JFod4Dh8PPBSa12IWO9UJ61AvRcN7htt1FSZUbuvYJ+psgljqijw7LgP6Lzpfdoe7oqboR/r33n6u5mA6oho12OtcZZyKh7lLuaSmRlka8guo4+dWYqtyE4h/UDXmpvXQ5clMaDncqwlVqshkdCL3Tax/bL3bvslmZtwAxJCsZxzjO+oPgnyZg+bkz/T2dad1o8Lww5ofrx0DcLlInQaXeE35KhLp0nvZXu/WMU5bWbXc5I2jN045ZsKNqZkDyCWOtvcFDUDQa4Sg8FwOlh7J3ULKQ==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BL1PPFB259EA841.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ecd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 15:54:06 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 15:54:06 +0000
Message-ID:
 <DS7PR19MB888312EBE14582523C3B95209D8D2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 2 May 2025 19:53:57 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Update IPQ5018 xo_board_clk to use
 fixed factor clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-6-27902c1c4071@outlook.com>
 <frlw5n2fxu5wxrlaahiuwlgaeg4rsqk7ushpcgvc2q4mzorrzf@e4axknhir4el>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <frlw5n2fxu5wxrlaahiuwlgaeg4rsqk7ushpcgvc2q4mzorrzf@e4axknhir4el>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0033.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::8) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <a14be748-de11-422e-980a-43263c50cdbb@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BL1PPFB259EA841:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe695bd-605c-45e1-e46e-08dd89919156
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwVu6ov8hlKZu5ytU8AWxKlxUafNq//T3FANklRKe3Br9kjVDLIv2IhK5LSmEBbtjbDByZhR1dWy+OtTggHzDWHhTGvjxTswdtZ2f8AHy8YliJRjNSroVq+4Xm5fXrMsoz7a2J1L9Z0a7r9jPRbcvtKFL1zATmGeEEaJoID/nOu3pFe5fol7stTlJvRaO9aYFNWS70Kj86j5VuCp/A95zKAAoKgoLktjtyH4z4GEHOKrf5IvEnCFEyTmQ3ZqgBV1H4aOxuRicudtJ1XbAZHTjvcKvt5+XTQIVgVp9L8oVUTJdVvWsH6F+vEpLHOBwPb7mygSb2A8TF0p8wzvsp+MypEnRtKs8yNSCEoPcJV0vImQ4CslSpqkWAF6EeLIkJoTtzEDbTlFZJ04OF7BCb+Uz3JNKO6/34BPFKgFMmmmN16ZrLqldgBT3YZqn5nha440mxHABF/zIQlxF4Lv8UtFL4X3D4ni3vwsaJmmVQgF7zTupyFYu4wVm7AUtwCspkrgz1YDluhCl/x8ByaGQz24CTSMPsVc4mCaNh1SN85gbvGsSmzyYb0G2YRz9ae+oESUE8xLzFAgMuefCsGadbGc1QvaSv/ULWBOZSQGL+YXc1u19CCjHwk90/hFJHt1V6gb64cIn+/edsYaRsmZIRxAB95GIguXFkD58gXzz1fKJgHYjWa3OPUA87LBqQsvz9vyw+8rii1K9hg8HtON2cZcR7b3cYN1kitMrvU2FNSowT+CAqEU+5+2ogE0VitlCAjtOeU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|15080799006|461199028|6090799003|5072599009|7092599003|440099028|3412199025|21061999003|12071999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWFQYlE3YWM2VThvVHQvanoyTVB6cU8wVk9Hb3RtNXVWcjkzTndNNEZjWGNG?=
 =?utf-8?B?RWpjVmRaeXorWkt0dmVaZEgxMFk4L1g4SDZiS2R5Nml3MkNYdW9RTDVWeldG?=
 =?utf-8?B?RTNDcW1zaVNTeFhZZHhhOGloYWlHZy90cmtMK254azI3eU1lclVPeGEwb3Q5?=
 =?utf-8?B?SHpycTVraTR1NTVZbFI3cXU4ekhEZkJmQ2JvbGRLODEvak12UjhhZEx3OHZN?=
 =?utf-8?B?YWU5eXFQYTBHTndDYi9HMWZKeTFpWWExZkFobmtsTlpGWHlxWFhGMDJiU1Yy?=
 =?utf-8?B?TllCbndRUExGb0s5K2cwcFgyUVBVRFhSNTk5d3lrUDI1TFY0UE15WTZQbGZY?=
 =?utf-8?B?cHAxdHB2R0FGdVYwSllXaWlnSmxLcjVmZ2plOHFsOUNub0xvdDNGS1FWZkFq?=
 =?utf-8?B?NjB1ekFJSFRsTG5VSk1EL3lPNmtNZ2ZjSzdjY0V4b3lmYllDa1F0L3lxRTVL?=
 =?utf-8?B?YU8xTktOaWkwWjdZb05vd0Q5dmROMS9sK1lmZE5UcjJYZUNwY2ltQkx0ZUFS?=
 =?utf-8?B?OFZ3cU1YWmV6WVlTNWFtMUpLTDZSOXRhZm5NYjgyR3lxWEdJaHpPK3ExTldh?=
 =?utf-8?B?TENKNzEzVjk5UXp6OS9yY3ZiUXZvdTgwTnV5aStMZlNwVWd4OSsrQUtDUnBv?=
 =?utf-8?B?TU9NeVZrS09Pb0FwMnc4NkV1TTFJRFdTUUtSYXQzZE9lM2Jqc256T1V1dzds?=
 =?utf-8?B?QzZYMnBxR0FUQU4ycENlTnBSREFOWFQ4RXRuWkdWUWFBQlBhQ3lRYWp6ZmFr?=
 =?utf-8?B?aHc4Z0pwOGJjNXZodTZGQlh1S1FRK3dSb2t6cGVwclkwTndkUE9KSUNZcFdn?=
 =?utf-8?B?V3JsK2dYY1Bmb2NGZStPbklJR2diNmVMaGsvZ1BwZlZpTXpULzh6Q2dac2cz?=
 =?utf-8?B?Tm0wRWUrQng4SzhnNDl4eE1OYVpBVXNQNDgyUnc0cXhnck1aUmQ3d3UzcmJL?=
 =?utf-8?B?QmwwbTkvQUVjS3BacWwzUFFpLzFqaVVZV1c2QXYrak9YaTJxOVIxUFE2bmQ4?=
 =?utf-8?B?N2JyV0ZxY0dDZVg0Mmg4bzhrcGx6dEZPdExnSWtkYVNQcE9oOHZZQVZnVjJ6?=
 =?utf-8?B?Z2gyemdEQVBBYVlpZjRmVWxQQ2VEbzZEaDVLTjJoQTVmbHVlYVZMT1ZpbGFx?=
 =?utf-8?B?dUJxQVdZQktNWE1nN1k2TDBTM3k3LzQ4aFpmZTNxRURjeUwrUlJwRzVuMTF1?=
 =?utf-8?B?NmM2Yno5SHNLdGhlSUpkb2xTYk4xMWxES0RzT1NKZWFVbkFKa0pkaDllNUMz?=
 =?utf-8?B?cEdULzRoeE13Qlc1REI5VU5sbDhJdVhuSitKYitPZGhyb3YwZ2U2K21KRCtD?=
 =?utf-8?B?a3F6WjZvMUJHVWI2NTVYSjRFOXYybzBPNlMrNXJweVBmR1ZLWUZKZEJJQ25t?=
 =?utf-8?B?cDRxQURCL2xOc0M3SmRPN2UzcXRLd1Jibk5BaEJiallyUDRUeXpKRmZvdGQy?=
 =?utf-8?B?eXNqWGk0UzFPSDhZTGZ4elMyTGF3bVpjeHl2VThCa1NxVjlrN3lQYkFEK3d1?=
 =?utf-8?B?ZTJxNkRaQmRvU1JpTTRYTmJSZDRMbkJ5YTIwNjkrK0dqR01OSVg3MFY5Z21k?=
 =?utf-8?B?TjI3VzIvNHdKQk9GYVhJTU4va2hkalZNS3lzMUhIV0wzWVExbzRUSDVSZnly?=
 =?utf-8?B?QmJUMm5nNEwzUFo5RWQ0TldHcXhyQ3c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlI2OXRMYVc4KzNsOWw1eVFCckd3WVpxZ2hrdndYYjR2OTgyb2ZiVm5icFor?=
 =?utf-8?B?Q01QdDQ1ZFA3NTBFZ0E4QWpHTmd0a1EwQkdSdHRWQ3F3YjZjOThkQ2tWbm0x?=
 =?utf-8?B?a2E3YTBkcEFBbFhpb3pkOFljWXJxODlITEtrWm00bVE1a01UQ3YwZDZldGI3?=
 =?utf-8?B?anlVTUhBZmdMWThZdXBQbXpEcmZpYkxiVFVpN285N0o4OVgxTnJyYzZINUFq?=
 =?utf-8?B?Rk1tc0tDKytJZ3l2NzAxaVBiQm5IcWp0cWl4eHdvZWZsK3d2Zk9YUm84bzV1?=
 =?utf-8?B?S1pBSG84dE5KZGlrZkdUWEFSelJ2UkJQQU1OK0dxYWFzcmZyM1JmU1g5RmVt?=
 =?utf-8?B?aDdRYjZ1Z2UvZTNDYVg1SXlGMEdlMkZCSlRscThLYmU1YmViRVl4ekxXak90?=
 =?utf-8?B?TmZJYnE1S0ZjeEM0UkdBSFdDYmdUa2gwMmx5dkp0NDN5T2wrRS9FTUtaYXE4?=
 =?utf-8?B?cnUvTGVxT0ZYN2tUamc4TW90M1hNdkQrYUlHcDgxeHNXaklmdHI0aHJBQXVk?=
 =?utf-8?B?WTRNYnFiL1hERUJiNWtydFVXWWZnc2xkeE1UV0pla0NVUktma3FOU1ZIYk16?=
 =?utf-8?B?eURKSWtWd21Pallwak81SXh4VjBHMXZKVCs1Y3U3SkJyQWFJUFVZbTVqMXZp?=
 =?utf-8?B?cHZzZUR0RFFlSWRvU2lmTDg2d0tmSEFkd3E1Wjdmd3p1eVhBa1gyaFAzSEhX?=
 =?utf-8?B?NnBUMHUrb1BYSHNQWkRRNkUxbE10cmcrcFJkR3MzMlJyaksvdXZaYng5UExU?=
 =?utf-8?B?c1dkZDhyaUIrVkxscnpPQTQzc012dFZBL1poVHhkZThlQnBsNURVSGFmcFcv?=
 =?utf-8?B?UHRlem5vWTl2b3NYaFlneGRkQmJ0UUNla2JpRlM5MUc0WEhWZTJTbjhleEpD?=
 =?utf-8?B?ZVNhYUNieXdMZk9wcHRZbnM2ai9wdWErQTlNY2t1TW44V0RPTFpCOEl3aG15?=
 =?utf-8?B?cFBTYlVka3lvNlU3SVFZazVXN3RrNmt5cVc4MGxlR1dqeEc5NVM3UnErdmd6?=
 =?utf-8?B?VklOUWZnQ0dldVdja3o3K2Jrb2pEaXhZWnd1TTViREQ1MEtGN2xkMGdNNXpy?=
 =?utf-8?B?MDZ2TWd6a3FHWm94bHEyUGlrM2dKTHNyTUV2UkJwc3kzYit1SFdEQ3lxU2pm?=
 =?utf-8?B?ODRCVkxqZVlDZFRydnNQNS9zVW5pUzZHRUE1bjZsR2hmS2hOUlBzbjQ2M3Qr?=
 =?utf-8?B?TUs1d25ueUlianRha2FvdVVldmlLYnJDclBlZ01XdVZYWkJXUE9XUERyWS9M?=
 =?utf-8?B?R3o5UUNSYjNMVXFjRE80Sk41SExuT25OQkpDdEp4RE1HQmhJN3l6QXlEbmpH?=
 =?utf-8?B?ZEZNU3lMR2RtTFphSWRFU0FuSnZqeWJkemQyckdGK3M0YUNVMjEwK2c1eno0?=
 =?utf-8?B?UlA1QTBXNG94THd5VkMyM0JyRHd3WS9KS1k0SmV1cXcvZUZndm9SaERDdVBj?=
 =?utf-8?B?MTFYa3RYeTd2OTRYbDhCVER5cEFBdTFuYURERlZmSEZYSWxvcU84b0ZaUjY0?=
 =?utf-8?B?ZXZ4cG1MS0ZUcndYU0JJdkNFeVA2amkwMVpYb2c5dUc3dkZ0NXNLNGVJSW42?=
 =?utf-8?B?UHUzaXc2by9ycDZoYi8vWFpQTDNoSlNTbVU1NkxLbzZTOFlYOHc2Rm1xbkx4?=
 =?utf-8?B?ZTZiS2l2d1dTVVJZWWlzNDR4TUlTM0kxQlQycFpvU1EzaEg4MVNnSlJMV21p?=
 =?utf-8?Q?RjhgzJsaUbvBY3hh0pW+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe695bd-605c-45e1-e46e-08dd89919156
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:54:06.6333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFB259EA841



On 5/2/25 18:45, Dmitry Baryshkov wrote:
> On Fri, May 02, 2025 at 02:15:48PM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output
>> clock 96 MHZ (also being the reference clock of CMN PLL) divided by 4
>> to the analog block routing channel.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts             | 3 ++-
>>   arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 3 ++-
>>   arch/arm64/boot/dts/qcom/ipq5018.dtsi                      | 3 ++-
>>   3 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> index 8460b538eb6a3e2d6b971bd9637309809e0c0f0c..abb629678c023a2eb387ebf229f6dd1c30133b19 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> @@ -80,5 +80,6 @@ &usbphy0 {
>>   };
>>   
>>   &xo_board_clk {
>> -	clock-frequency = <24000000>;
>> +	clock-div = <4>;
>> +	clock-mult = <1>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>> index 5bb021cb29cd39cb95035bfac1bdbc976439838b..7a25af57749c8e8c9a6a185437886b04b0d99e8e 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>> @@ -124,5 +124,6 @@ uart_pins: uart-pins-state {
>>   };
>>   
>>   &xo_board_clk {
>> -	clock-frequency = <24000000>;
>> +	clock-div = <4>;
>> +	clock-mult = <1>;
>>   };
> 
> Is the divider a part of the SoC? If so, please move these values to the SoC dtsi file.

my 'best guess' is that the ref clk for ipq5018 is always 96MHZ and the 
XO board clk is 24MHZ, so it should be safe to move it to the dtsi, but 
this is purely based on the 5 different board types I have.

@Luo Jie: can you confirm the above?

> 
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> index 78368600ba44825b38f737a6d7837a80dc32efb6..7e40f80e4795de25d55b5a19c1beb98e5abcdef3 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> @@ -31,7 +31,8 @@ sleep_clk: sleep-clk {
>>   		};
>>   
>>   		xo_board_clk: xo-board-clk {
>> -			compatible = "fixed-clock";
>> +			compatible = "fixed-factor-clock";
>> +			clocks = <&ref_96mhz_clk>;
>>   			#clock-cells = <0>;
>>   		};
>>   
>>
>> -- 
>> 2.49.0
>>
>>
> 

Thanks,
George

