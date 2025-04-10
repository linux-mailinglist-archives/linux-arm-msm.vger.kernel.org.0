Return-Path: <linux-arm-msm+bounces-53760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C59A8387C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E129C3B70EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A8B1CEACB;
	Thu, 10 Apr 2025 05:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="CEoyvqoL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2033.outbound.protection.outlook.com [40.92.91.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3782A1372;
	Thu, 10 Apr 2025 05:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.91.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263451; cv=fail; b=QwNtpgyFSApIZgKmHpOu1q3MAF0v46quCOEaSMUqcq1WMunh7wUO/Xr5KqpPrjnIXkc8dkCDpyR/AQU3hkvLefN6sY5UbkR3dQnmKjLEObtCe6NsslBsMJ7uTjdTMtokLMr0k8uszdAEjal4Ok4ytjJ/m/PuwmZuWplZnMu3Xqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263451; c=relaxed/simple;
	bh=yrKp/gALgyWMp/lKlc4IESa1+KabrCv0ora+mLh7bMM=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QwSxHGbHalBnfU7AZ417FuYI06wTxrp7VejtYlYwEO0t1m+1K1eZkcD3AaQ892qZp424pgwhF3Hmr/4AwVUfKNY1YNn00omhziUAZNcNlO8Qdq7i4eKShcSVsIuw8bGlsBZLnJSJVSKfz9QDyyqCnnWSIcTzzDyFwnNTpuIlhzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=CEoyvqoL; arc=fail smtp.client-ip=40.92.91.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5BkY1ci6KGM/oB7aZ2ArXlGJ2tbCiSw3Z1cnfE5ehxNWV2M5kQumUx70af3Br9kyA+JDWP94hr5T5HDdLQQk7W/XqNHVwTiAk79GBd3tDVK0Kl39XBN+YTP1Jmye10e6bs5vfiiLlkKl0awOFGOGCwxt72yNgUe0vrUm1t+upjDOCdJ+YQZpazWX1PsOspY2bCmDH1uUZyd+IQSTZ/v2jWkIjXkBTTUTveo8GbzuqMM32v4ynpaQmWkiZG8ROGuCCIvpZ6f9VtU/N//zZCj6ATVEkEgSJUPXVKsAnKdKDnz0cPvghCgcZQe7IggAFUV5n4OQ9xi39H7Yc5r2K+buQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTshExKZ6jNU1qYHk0v2E89nLE6efKRHdYU65Cef8iM=;
 b=YCMtkD2KOuNqNqw/UIa6CmpzAeKj/eORsvSF90rXRZde/SMwYHIcZ94gfbWIndgAWl/p7I6FjR70cQ8NOo3YLv2DyZ1JXsXRcayifcBzKwHUu1tPMm5zXIP2cSgFlE2xr4EQn67tXnTtTea+Dgi1iuBaMtm2zIiBgaQyEMbJfqQRIRfOVuIRx35jrVQ7e0UAWJA8iK75UyK2W0w9ARR5nLYQnmU8Vt5JqbX+FIl1cdvgBmfcnA1vUiheL6jIC9OYcrwIfZLg/AQU854xmaGAfYHixKIq28Tn94n6KTh5tQyafC+aCc9w7JP0PbefjTqNTAaByXTvVwaNySYOh5UDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTshExKZ6jNU1qYHk0v2E89nLE6efKRHdYU65Cef8iM=;
 b=CEoyvqoLa89FRbGa+tweLoH9ud+V2/I8L8WjRSxwzX8ozvujGvnvx6kvOH5RoHbzTduPU34AT9feg3RsY8J7XiPXtO7r0eb/4RlrKVsNT/azyFEfuFKaC4AAFj3jgz8Lo+bKIy6JYycqJTI9y9dBrJ/gkZ/JFOhAVIletiCd/XHHWk1vYJbX+3ZJ72LT7D3mU9nUrAUOgfkcd9LNfBaerOu43m2hMmRoI8wdVsB0WtG6HOUDfPqR10TEkpVEZCaq3T2dSlD1cnZqVIF1kMixShJJcLy918ioRjn13KLYFOmX5AtiLiAjVgaTbvr4+js8JWWV0282CQ6Xd8ZfmWqPQQ==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by GVXP189MB2080.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.22; Thu, 10 Apr 2025 05:37:25 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%5]) with mapi id 15.20.8632.024; Thu, 10 Apr 2025
 05:37:25 +0000
Message-ID:
 <AM7P189MB1009ABF52F221F738F98E230E3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Thu, 10 Apr 2025 07:37:24 +0200
User-Agent: Mozilla Thunderbird
To: maud_spierings@hotmail.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 juerg.haefliger@canonical.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
References: <AM7P189MB1009B07E5A67B1B16298B3EFE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add
 sound label and pull out the model
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <AM7P189MB1009B07E5A67B1B16298B3EFE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::40) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <4e141516-4720-41fe-9374-2a4a7969ea76@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|GVXP189MB2080:EE_
X-MS-Office365-Filtering-Correlation-Id: 526bcc88-7b7f-446c-fe4f-08dd77f1c63c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|19110799003|461199028|8060799006|15080799006|440099028|3412199025|13041999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkdOUkRvUHh5ZlhpQlRDN1NHR0puUllMTVcyRmlIMTFkMHcvY1duUVY5OFZC?=
 =?utf-8?B?NnM1RDkybmZhdU1TS2QzMVdlOE9RRmNmblcrUldvUjhVbmprZW9xZE1BY3lY?=
 =?utf-8?B?UnB1R2JJWFl5bFd2Q0pqMEUwR1NlSDk5UW9FSGw1bGNBY3J4TTU1Nk5CUmtm?=
 =?utf-8?B?VEIzWVd0YWdZY0s1TkFqTU12eFZUM3BHNlhQTEEybFg1WVA1MzdIazR2VzRh?=
 =?utf-8?B?dzJuREdLZXJIajZOZTFaZnM5Wjh3S1Jjc0Z5WEFMb2pSdFBJbFRsMDJCWUUx?=
 =?utf-8?B?K2RZdkJ0M251U2w1ZGFmMkJXS3czWkp0bnJqaU5JcVAyeGw1WVd3YTJaMy92?=
 =?utf-8?B?ei9HWjNwZXBZd0w3bGdTd0ovb1pVWVpGdTE4RGo3dkhwcE82Q1E4dTRvdWF1?=
 =?utf-8?B?cDU2MXM3UmE0TWtLWEJTOG9JTHdMMFZ3T3dqMGhyOEZZRUFVVG9NSGdvYm9z?=
 =?utf-8?B?VE9RSEZSZk85Q3l6VnF2SUVQOFJpL29oRjRzamZOVFBzK2tTSnhZeWpoVStq?=
 =?utf-8?B?eXAyaUROOWU4Sy8vTGIyWXNPLzh6UG9kY1RuVjRCOG1JUUxQR0RMTTlUT1RC?=
 =?utf-8?B?VzBvTG5qbWtMY015NjRqWVcrQ2lJTFZKaWFTZy95ejFzdTdITmZaYWhRaStT?=
 =?utf-8?B?WWJ6UDFheW9DbGJld0hYbVVzc2UvQnBJeXI3S1ZVTGRKYy85ZG1PblBPM1du?=
 =?utf-8?B?VnFVWVZnU1NlWGx5T3UzNkpzM3l1Vmg3MEtvS21FWXlzNTZMMDlsQm1iYzBJ?=
 =?utf-8?B?RGZNUHY3dGxUZDY0S1pZTUdGMlY1cnZKc1FKV1hqcys2RER1UDdTc3ZUbGJx?=
 =?utf-8?B?R3lCWkgxT2NPWkduU3Fsam9vcnZvVXRkOXp5d0ljK0ExQUhaR29hbnVneEh2?=
 =?utf-8?B?TlR6M2Z1VHF1Ukl3MHB6WFBVaGtySFAyc25xSGo5L3BDQW5YbkUwS2tlTy9Y?=
 =?utf-8?B?dmFWYmw4V2VQWFRPdkkzeStCdjVRYjlybVpUSlZiZ1d5TDQyeFFBck8rSHJY?=
 =?utf-8?B?c2UrWlhreEh6UkIxYUd1eW1wZTBGK3grcVNKbHZoaDdleWRsT0tOZS9ZZC91?=
 =?utf-8?B?QkNNKzVTSGhMN1FRMzJicDBYQmpKZGJQZ2NhZm1PRTBTSVdIenVDZ1NLMDh4?=
 =?utf-8?B?ZWhzaGRFTS81OFRaRXEwc1JiVSttdmQrWkhCMFN3WUgyU0xFcmhvSlhMSTFD?=
 =?utf-8?B?ajBVUkNwaHhLSWdISlBFaU4xbWFTRzlYTXVpbUZNT3o0ZXMwS0d3UWZhZ2Z0?=
 =?utf-8?B?WGhPYnJaZHhONG1uNmVLZEkrTkhPY0pZaGNYa29rTUpxb1dPMHNMVmVTbVJJ?=
 =?utf-8?B?NkwyeVVKdjY1eXRhOEJ4T2F5cVhLM2hSZlQ1aU9lVXlqWFI0TkQ5b2xxaFgx?=
 =?utf-8?B?K05VeWJwVWpFRnJqeWQxeWlEQm9zeUNEZjRxbURXZ3VMa3lFcEdYeDQyRGMz?=
 =?utf-8?B?UjY5SVNzZTRzSmdvWW1oNXp3aEZ0bXpwN2lrSXV4UGZub2t3RUVDL1ZqNjJu?=
 =?utf-8?B?dXVqZ2VMaHV6UDBuTFc0Q3BLUUFzWmd3OEVZZ2o3N1crbDN3TzhWcjlFVll5?=
 =?utf-8?Q?pXkPE4viqfdc1vovZnHT4m/ss=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFBIWDdzdE4zc0UwMlVtbmUyZ0NQVjVBU2dBMUx1bkNtcGF1T01TODFnYkR6?=
 =?utf-8?B?bTJLeTdOK1NmZUF2Sms3ZlMwczg5VGYrSWRZajEvUDlyT29jOWIrT3NRZVRI?=
 =?utf-8?B?NUpBYmNONzlhMWxSZWZiT09VMndOM0E1c2Q1R2hNSTQ4V3FVZVZycmRzenhn?=
 =?utf-8?B?QWxUYnZqeWVDRjRMY3VkY05PbmUvN3ZQU2ZvUEV3Ym1hdHhnQjdwdDR5TDI5?=
 =?utf-8?B?ZVRGdTV0YlZnVjFCQVYzUUZtT09oMzFKYU5ERXVFa2RwR1dvNlFzZzR0ZWln?=
 =?utf-8?B?MWpHdmtBSWtYbHhKQU9kaExIcXNjcjVrSkU4YWp6cFgyWUkraHA2T3F6eER5?=
 =?utf-8?B?QlJuSHFYSFg2a3VJSTB2Mm9UM2RqMURTbG1ZMVhyZ2R0TzdScmZSMWg5UnZX?=
 =?utf-8?B?U09iblpwMlV0eFVvbFdWT1lkZzZaNmozbGVkRUVkWm9WUDhtUm1FQzJOS21B?=
 =?utf-8?B?K013L3JGdzllMVdiWmMyS2Z5VW0xRVQzVnp6REpJNnQyR2Q4azNmRkpWVHhQ?=
 =?utf-8?B?STdGS0xOMzJ2RXgzZjU0ZXRQYU1LNmdkR2ErclZHU1hXaFI2TXB0MDhBSllH?=
 =?utf-8?B?eGV6Smk1ZHBuL3dtTlV3K1dnNGtDbXJMZnJqRjNlTUl5WjBISFdkUUJJek1P?=
 =?utf-8?B?U3BnL2xtcTNkZEJ6YnJuN2xHOTl5SnREWUN1amZkR2lzVExvaklaRUJybmhj?=
 =?utf-8?B?WWw3NU9SVU1ocW83UnZxL3gxNE1lOG9OWWpTcmE1Nm52bUZ1UG10YlVUdEpJ?=
 =?utf-8?B?Znd2SGsrTER0SStDRkN6T2tNN3U4UW9ucWpUQUFxOXBLNkgvU0tVdFg3dnNE?=
 =?utf-8?B?UGs4UmpGclZQci9tdGlzSWVNOG9DRnM2TmZtcGJicU04RDR5K1UrTGxUMURH?=
 =?utf-8?B?c1lOYkMzeHRJOUVFZnZNNjR0Sm9xVFJhbmVhRTZFaEVSb3Q1eWFxc2pIdURQ?=
 =?utf-8?B?U0k1bDdGZEdhb1Y2U1RXT1IzWlJnNnQ1cnNSbm5hakhvMi92NkE5UDVPRXhB?=
 =?utf-8?B?NWcwU0hwWWljV2tDdFd2RHUrMTBXd0JLL1NIQndOZUxLOGNCc3UyZVFxa2Fa?=
 =?utf-8?B?RTdWTTdPMFFsNnMrUFN4Z1dWWkMwbWlFSEdvZysxcVdNeStuVE5RVkFNbzFN?=
 =?utf-8?B?MHpKVzd3a2RzN20xVnVKTmRXcFYrVWNtTW5ZWFZiMUVwUzRCSFFJVm0vcUVI?=
 =?utf-8?B?d3dSQTBhckJsb0Z5T3FZaHN2VVhHMlFLQmVHbmxXZWxaN05aTzVRR2lweHBW?=
 =?utf-8?B?Y0tzVmxIQ3B3bzI0ci93OUdRS3ozZlg2aGlYQi8yakFWTTR5OW5rVDlUZ2F5?=
 =?utf-8?B?WElXdzFmdVJ2R08rVGNOWW1OemFZSkRLNG4yTCtLcUQ2b2xoSnNqZmtkTXJY?=
 =?utf-8?B?NFNsNExWMUJkT1phUUR1aGRsYldZUFROSkZxbXBIU0NGNnd6SWRxUFFPQjVz?=
 =?utf-8?B?SFFNWnQ1TE1kQXh4MVBZRll4cERZWEQ4V3prY1Q3NEhwelFURUZxcFJaLzJD?=
 =?utf-8?B?VWJCTzkvNXJVYmNDbitJS1BhMEE3aVJNQ0hsZUQ0Si9yVldlZEdNL2V1QnBP?=
 =?utf-8?B?UEN0aWZGa0tJZHpJVUhwUUQ5QXBoZW1UOExsSUFveTdtSTNCVzRWc0htNWVU?=
 =?utf-8?B?cGZUcWU3NWtMZUd5UEdZYjl2ZU14NU1XbGJrZzMzTE5EbVc3eVBTS2tPc3lW?=
 =?utf-8?B?V0VVVVlvQVI4Q1E3OGZYUWFMTWRPd2VrelRaQ3R2VmcvM3ZRbE83aUJvczM3?=
 =?utf-8?Q?aO5TQytbWbwWus6C1Mv4vcTMNQFQQMnqHvszcd5?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 526bcc88-7b7f-446c-fe4f-08dd77f1c63c
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:37:25.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2080

Ignore this message I reply to, I replied to the wrong patch 
accidentaly. Sorry all.

Kind regards,
Maud>> Introduce a device tree for the HP EliteBook Ultra G1q 14" AI 
laptop. It
>> seems to be using the same baseboard as the HP OmniBook X 14 so just use
>> that for now.
>> 
>> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>>  .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
>>  drivers/firmware/qcom/qcom_scm.c              |  1 +
>>  3 files changed, 38 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 710879d94c00..3d98bb95e8b1 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -294,6 +294,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
>> new file mode 100644
>> index 000000000000..9f3aac1a83fd
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
>> @@ -0,0 +1,36 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +
>> +/dts-v1/;
>> +
>> +#include "x1e80100-hp-omnibook-x14.dts"
>> +
>> +/ {
>> +	model = "HP EliteBook Ultra G1q";
>> +	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
>> +};
>> +
>> +&gpu {
>> +	status = "okay";
> 
> status should not be needed as it is already set in the omnibook dts
> 
>> +
>> +	zap-shader {
>> +		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
>> +	};
>> +};
>> +
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
>> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
>> +
>> +	status = "okay";
> 
> same here
> 
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
>> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
>> +
>> +	status = "okay";
> 
> same here
> 
> Kind regards,
> Maud
> 
>> +};
>> +
>> +&sound {
>> +	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
>> +};
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index fc4d67e4c4a6..e7262ad11509 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
>>  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>>  	{ .compatible = "asus,vivobook-s15" },
>>  	{ .compatible = "dell,xps13-9345" },
>> +	{ .compatible = "hp,elitebook-ultra-g1q" },
>>  	{ .compatible = "hp,omnibook-x14" },
>>  	{ .compatible = "huawei,gaokun3" },
>>  	{ .compatible = "lenovo,flex-5g" },
>> -- 
>> 2.43.0


