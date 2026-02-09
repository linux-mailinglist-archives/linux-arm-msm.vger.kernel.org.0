Return-Path: <linux-arm-msm+bounces-92235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEitEXKkiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:10:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BAF10D5EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45ED13001A43
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B3134402D;
	Mon,  9 Feb 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="JU15pdQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013083.outbound.protection.outlook.com [52.103.35.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B243431E9;
	Mon,  9 Feb 2026 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770628205; cv=fail; b=rnr3t/FPKDVy3en95sYqT/vXS3aqGQi0t705nA06BQDgeLr/nWa2OkvkPCfC5TROU03FSqhExkWPVgjyfQmUze4qvom+vd1yYqCD7mKKsh4wQurkqQMrNjhYMyTSakRXyZWbwXeMgKHEGBUHDXHSQLsKfViO5nR8CeIV1j2KVF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770628205; c=relaxed/simple;
	bh=K4rRrENKV+x5yKbkPYbbSJ1gKnmHwBuGhaJY8CUtuCo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cc+qpTWh0eCz2PBH1eY2XtAFFfNiSjsjkb62TCmZ5SrDEL2mk3NYEMDuTxT3QM97uDQpXYGlyO2h7BZJhZnINrdE7nlOMi9LUW9rXLT3UPI22JU+murFV2fP4N7rz4QuthYg1PopW5C+rb6LiyJWvhQ3nT2cAmTsnPxDH7yCN4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=JU15pdQg; arc=fail smtp.client-ip=52.103.35.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIW7k+6H5XvxHClhnHG4xpYn93grRiMGPlBvsJrPLL/Q7d44EJnxY+Dv50HiCiymBt7XMe0TXghaj4QBdXdAgJxlGQHDO09ilw4fxPH+tH2eIhedqnzzhBgJIrMcwVoEf33Z05UlK7k4MeHf5InzmnAhRXMYMgYNj+BnkajpbEL9Q6dq+v+AyzpUMRJhy6EZMTPyfoU4PwmXZ+pzx4tgpqqXr6k/E/yMcJvY5jcMc27i01Fa0Q+cJX/KIjUkx06EkdYqL+YIONruihdVYI7jv3oFxukXvu4BZqFD9q6npZ6c86uXEJfVbWAsnDcN248bzijnKOrS8rXL7QwEdCrSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUNra9Yj4iCus+JhRxd8kLZ8voVLJzmsImXcGW6uyw4=;
 b=FHuyV8zN0yMiu+0xWFmSxtGPL1I+wSFfoB5nxOMQrxP6rDgDhCW1VcZKWVo8yMssshyTCNvPQ4kxVWre2ZPWjT+iXUqtWYeb93W9dceSG4ZTsoEUWJRpBuplcfIHrr1yw3wzZAiYo6FEM3zGbM5/XdH+FmZXst177q7vgeZmRfoF3nXjfeNQYCVQDq9OvAjSndKYe8gR+8dbBCGIgdOwxCHQf7laFGMtLsoFcSbjkN7Yk+93Mceti8LtXhXnd9W8M99Fl8E4/68H2oipCeSvTkx/NbrtqNxo/lH2xQWFQEDPThCO60furbiWxUYAIg9ItBO1VVivRAZ/2KjcpdrP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUNra9Yj4iCus+JhRxd8kLZ8voVLJzmsImXcGW6uyw4=;
 b=JU15pdQguFooI7tZtaD2mli8WTBOhbhNb8299bUIREPfN+XCnBpdGmO3uqVlDYvPj6Zo7hNhZ8HP9ttlqOm3FGVa4qyxs+7IMDKHphO0s5T19M1hRboBW2frMGgDvOt4kBcAczM7Emza9XMOwJMyoswlkhu+bBGsyPi3NlgFnLb3y4O3fiSI2T1MJkyKyNwlBtPYUhwlLmIn+6oaToeFPDW6owYbkDEuZJy3yK/G02572TGSeCshh24KJR6fLA48QjCN0w/XXoptdtbHf6P08GfjOgIfY8Qm3AuN7Xv79QIki4U1mPhxXQyO62QZ5TPRGQ4FRAI8gVxl6JCaxFSP6A==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AM0P189MB0819.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 09:10:02 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:10:01 +0000
Message-ID:
 <AM7P189MB100920A2CE773AEFF62CA6E9E365A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 9 Feb 2026 10:09:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: x1-vivobook-s15: create a common
 dtsi for Hamoa and Purwa variants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
 <20260208-b4-vivobook-v1-3-3a9b5e153909@oldschoolsolutions.biz>
 <efac4464-6bed-4507-9c7b-a95863f15213@oss.qualcomm.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <efac4464-6bed-4507-9c7b-a95863f15213@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::14) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <d1e0d196-0557-4b85-988b-8a38e6199f10@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AM0P189MB0819:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee07084-016f-4895-14ef-08de67baffb5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|19110799012|23021999003|51005399006|8060799015|15080799012|461199028|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmxEenZKTldEYVNNSHMyS2NOWnpuUE96V0tFcUo5aUxVUXVKc29obEpYaFM3?=
 =?utf-8?B?MFVrdmxSZjg0M00vdzNJUkVwTUEwZG5TODZJeCtNajQrU1lEY0syWUlZb0lK?=
 =?utf-8?B?K015bm1IdHNRaG5leHJkMk13ZXdFOWpoNW01ZEdmUU9pWnYwYVQzU2tKaG1k?=
 =?utf-8?B?VTZtR3FvaXhUWWNIamZkSGNLTHI2ay8wVSt4M0JQc1BkZDJDTStDMTlVTWI5?=
 =?utf-8?B?REdRbzFXN1NJMmFOVjhLaU1OY2F5d2FUTVowRkRMY0hFS1UvMHBWNVl3YkhL?=
 =?utf-8?B?VGtFNEZaTldrKzk1dDVDdGFQZ0pZdnFNb3I4NUdOblU1US9ybUU2aEJDTHI2?=
 =?utf-8?B?UHdqYmUzdzJWRVQrdFBqdzZaYnpNazZpSUE0dEJBNU1VWEpyTVlyUVF1aVNt?=
 =?utf-8?B?YU9oODFVUjNmVk9JWkRQNUpENk14Qjh1bjM2TUlZcmZpN1M3OTZWK295WnZY?=
 =?utf-8?B?QTQ1ZVlLY0JJVWExblBicG5BeUhmVEhqcytYS2NzYjhPajBJZHUwNVhWRm9H?=
 =?utf-8?B?eWVCWlBBTTlmVElycHdMU1NVc05oOVNZeDJOWm9ocVg0R1BQQ1BvK1FCVitP?=
 =?utf-8?B?cHQ2dWR1ajBPNWVxa3BoeitwNEhqY2UrMjFQL25jVkl5TzNCT3FkQzl2QS9p?=
 =?utf-8?B?QXlobWhTdkZlRXE3UUdYTGRyNFZBOWN4WUU4YktLUXZMV2QxMlZudmc2MTRO?=
 =?utf-8?B?aTd4THRXZU1FMGVVYjNFcGdCSkZ5T3lMU2VubE9wZUN3N3F6YXg5MldKaUMv?=
 =?utf-8?B?WVo4QXVvellUcnZIYStnODlDM3FORTBNUnNoSmdhTGZKWndGUjl1dTNCVk9N?=
 =?utf-8?B?ZEgwTmFHdFJyY09SM0E2bWhscjBHMjhUVUZSbjdzakdzN1UwSHhZRm1OeHhH?=
 =?utf-8?B?RVNRN2p4bExhSEtyZEU0VlhkUkpQaDJCeFF5ZUtueWxBa3gxUmtjdnNxcGdL?=
 =?utf-8?B?VWh1SUZPbHBMMUNmdjd1eVdHVmV2ZW1zRFRZVGJsbGFqbmFLZTREbEF4NlJM?=
 =?utf-8?B?VW11aVZtZEhtR2VrSWV0VWJwSFhBMFIvQ096bkZFUGllbjhUd2cxQlQrMjNE?=
 =?utf-8?B?c2xySElHRWxQdktvbmdKT013VEltNVk4MnR5a09lZjhDaFlwdXRmY2JIVHNj?=
 =?utf-8?B?ZkowNndocmpGVkUwazRrWFZYT0sweEhQaTl4Y3hNbkJvY1pKSXJjTTRxMjBY?=
 =?utf-8?B?aG55OXg5WllBODRZQ1Ewc2NMamJNdlNMSE1hZjdvRlZjKzdodzkrZER0K2tK?=
 =?utf-8?B?eUwyZUZKTEVENkgxSFMycWpndWlmYnRLZmhxOHVINisrN1NPVGZ2NWowcTl4?=
 =?utf-8?B?MnRuN3psLytvYmlNOHVqNm5yMEFWVm5kdWx0NHg0RkFSR0FxL2JnK0diYzc1?=
 =?utf-8?B?V1VYL2tFeksrS0lFWWdVS0xTZmhGMmRjdUpRcjBNTDl5VHgwV1RkVFpmaUQy?=
 =?utf-8?B?TFRjS2FZcE01MzNHdkNKZzRiVmNLZ1lFZlFKZ0wwL1FuejBncllBcFk1djVw?=
 =?utf-8?B?RnFwOXpHOWg1emxHRTBTL3djaE9kSGp1NmJ4Zm5hUGlDaFRyNytqS0hkeVJa?=
 =?utf-8?B?TGVwZmtyWnM1a3g4MkRwV0ZHNzB4T2JJYkJTZm9WRXVqa2U5b1prMnZyMzlU?=
 =?utf-8?B?TnY3NG1ubFFEdllZdEFZei9HaEhzRnc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0R2RnNuckZrR2R2Q1RkSjdaUzV1cUhLQVJ0V2ZsRlRQdkpSRkhONGkvQzI1?=
 =?utf-8?B?QkNPaUV3MDh4c1FZRVJ0bThMRDFLMXdXNlFiWitTdzB4YURXdTZDdlFzWXp0?=
 =?utf-8?B?QWNmRUFadytMTGo4dmJZL1JKT2RmK1J0L3pja09jTVFZK0lSSUdCdHlBcHNz?=
 =?utf-8?B?WkFjNm52SGdDUFk5b0h0YlFKUHcyVWxaUzd2OEx1K1pwQ1ZhVGlIbVF0OHYy?=
 =?utf-8?B?M3FLcTFab3pDQWhRTGtuVHArek5lWUU4MUlISGFlMDVid0xaaHJoRE9Wb0Vr?=
 =?utf-8?B?YUE4dnlVUnZMaFU3anRYVk5IRHZSaGlVZUZGOFBMZlNuaEZwT2h5T0Uza0JU?=
 =?utf-8?B?bjdwTDdVUDVlQWp1TjcvT2dHQldyOEZ6UTZOMlN0ZWpXbjB2YVZsam9ETEdt?=
 =?utf-8?B?QlliSE1SdDlyd2ZETkZ5Wjc2eGFqYlMxNkxlTTVUQXVtYkJZQ05IM053NG0w?=
 =?utf-8?B?V3I2dERuWDhXSCtHU0J0VHdtSFUySy9USUpDUWFZd0x6N1BiVFpaR1NYR3NK?=
 =?utf-8?B?Y1lBQkhpVGJobUNyUU1QNEhING53VnJBbDltRzFmOUFCQzZVR0dNRUJQU1dD?=
 =?utf-8?B?eVpDYnl3ZkpibmFFNEdSQXlQVFhweDJMbjBDdkhnMnRyTzR2d3hOcVN1b3pk?=
 =?utf-8?B?STFYemZaWml1R25oRmdqZDNTUnFHY2FYalB0ZENpK0dCcGhUZXZ4dTdFYW5h?=
 =?utf-8?B?WGcrYUhzUG1YRzREVEZTbW1XbUJ4SDRQQ2hLdzRkdE00aGlzNFlXQ2xrOTdn?=
 =?utf-8?B?eFYwNzBua2Jwa2JnYWFyRUxRbExRRDg2WlcwZzQzSWUrMzRRS2h4T0ZvYndY?=
 =?utf-8?B?MEU4MzM4UTR0SGRMelJ5QWNheXZ5OVgyWW5KZCt6VW0wTnEzaEtDQ3R4MnRr?=
 =?utf-8?B?SXl0aGZJWk5MRUJOd0sxQ3lFa2M3OE5sWjVtejVNQlRyNXhiRkVuZCs1ZHQz?=
 =?utf-8?B?Rk9YNlpHay9xVG8ydkszQkxtN1lEWngzak5UWlJYMUZXT2ZLSWZkb1F5NXpK?=
 =?utf-8?B?Tk9Sd1VOeXdIV3N3cDhYeGtSazhtMlY4OHdxaXJpRHJNSjR4cEZUOVhONXBS?=
 =?utf-8?B?NG1IV3hDZkJhTkdOWGxMYWdMYW1HdVVzbExyK1dRb3creENMR2hXVmtzdnVw?=
 =?utf-8?B?OUlCRGlrTmdmQXc1bUFiT201dHM1YStLY1Y2UWxVRjlZYzNRMGZTVjJMMFRx?=
 =?utf-8?B?cGlOMkdwTHVQQUVwYkJTU2M4eGF2Mnd6Ym5DZExCZXhDUjZza0tKRE9RNlcw?=
 =?utf-8?B?VElVcCtOYjhQOFlqaG00bStXUnQvZTNlNGpVdzc1WEpOc1ZSZU1uMjQ4WDE3?=
 =?utf-8?B?Qi82TW9oOU9GSy9QZkR3aHVjTVFZcFNWQUw3cHA0OC9TN0djY0ZMcFFKUlNI?=
 =?utf-8?B?c1YxallIMXp1ekJrWmdzYWszdHBqQWkrNXUza3VWSVJwZThScklCR0txUHJL?=
 =?utf-8?B?TGZCYkR4QkhZZHdpdy9wZ1NoQjVTZ09iRi9KaUh1ZGVSMzE4T0hnSnVvM3dB?=
 =?utf-8?B?VWMvZ0piYXNSRy9FaHY1VmdkdFk0RmJQRVhYTmNOYk40ZW50bmdCOHVoaTRt?=
 =?utf-8?B?L2w1VllsREVwcXdpdmxaQW1XT3ZOUFFpM3FjUVV4NTkwV2hmampDUHhGa29D?=
 =?utf-8?B?cnBoY2FQMExTQXQxMDNpQzlaOHZGb3piZnhiajRiTzlQeXZoSnU0ejlsWmlM?=
 =?utf-8?B?SnA1bFJ4Zlk1NG4rdThEbnBiYzUvVjZQaFB6S0ZxSEh5eXFZWlVHWnU1dDJv?=
 =?utf-8?B?bUgwdG5DWEI0QWc1bmZUeHNncDRVLy9UQTBDOUpMUXBSckpTMjlXZ0oyZlB2?=
 =?utf-8?B?OWQ1WmkyQkgxbDU1eVVJV2FpdXZaNnZEOHQ0a2Nsb0k5eHlHdHNxbXYyUGEz?=
 =?utf-8?B?ZnRFdUh4ajRWY1UyeGVpVDhWYzltOEtRdnJiemc5ZXZWZEQ0L25leHJQR29P?=
 =?utf-8?B?WVJLSnAzZG9jMVZXZ1FxNmk3cm5ycWZJcURqZkl1d2lyMTcrL3FTQm1YcU5S?=
 =?utf-8?B?dmgwbUhramRnPT0=?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-645de.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee07084-016f-4895-14ef-08de67baffb5
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:10:01.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0819
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[hotmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[hotmail.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92235-lists,linux-arm-msm=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hotmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maud_spierings@hotmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[hotmail.com]
X-Rspamd-Queue-Id: 91BAF10D5EC
X-Rspamd-Action: no action

On 2/9/26 09:57, Konrad Dybcio wrote:
> On 2/8/26 10:25 PM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> The Asus VivoBook S15 S5507QA is sold with x1e-78-100 and x1p-42-100 SKUs.
>> Put the common part into one dtsi file to be included for model-specific dts.
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   ...-vivobook-s15.dts => x1-asus-vivobook-s15.dtsi} | 28 ----------------------
>>   1 file changed, 28 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
>> similarity index 97%
>> copy from arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> copy to arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
> 
> I'd expect the part of the next patch that includes this new DTSI in
> the hamoa-based DTS to be present in this one
> 

I thought so too at first but I think this works pretty well, make a 
copy that is changed but leave the original, then edit the original to 
use the editted copy.

Though I would argue patch 4/4 may want to be split between making the 
x1e version work with the new dtsi and another one to actually add the 
x1p version.

Personally I like this approach, but then I am not the maintainer.

Kind regards,
Maud

