Return-Path: <linux-arm-msm+bounces-52051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF3A6A044
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 08:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB918A703B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 07:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE0F1EE01F;
	Thu, 20 Mar 2025 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="k6wlYXHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2063.outbound.protection.outlook.com [40.92.91.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375BF2744D;
	Thu, 20 Mar 2025 07:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.91.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742454825; cv=fail; b=qCHmfe6vS4/4aAstz96Go7RkfAoxxQ19fxqcpvRqvc8t/w+CBbfRO6bpUU6m/9LFzSfGEMiFAo5zdOGm3nI17GciONsrX39khseehFpn67SGNjzROwQAOyZK1snz4pHyeA+/LEdqG/tFoa15vAk8IqRMQGzOvHeKTwoCR2wE8VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742454825; c=relaxed/simple;
	bh=5a01wBu4bVzTENqxVQpZRdb4ww/OzgQubKI4zg6znBE=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uuQEyhAOoFufaELc+pDgCoP9cmiPXHhzO3SXOu6M4PkhDpmqlgvTSWtgWzGQNJ03uRqtP5lrymNQ7sNjdVeBir443RLGK044+3LddEopHTTGixfYp59IFD8XPlRoeZ4VAKPvqs7uuG+41PTJpQcyMib7f2PVKnARTq5dpUg2IoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=k6wlYXHZ; arc=fail smtp.client-ip=40.92.91.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEw/EDfMhIAaoNqW2c6LweVWso3jM47SoY3YgdZbV2yG8hQc1YEPtWoc6WgXg7h8TMigHA08ejMieTMiBX2aR5i213wmkAAuai3pycj/fyMZj2EDGqMyPLGsNeRGzkcv5O00xbL1PbNb2S1NCtVcrUjhH4r23r2tHKBM7Xm/SpWXLrKzEMkRS/RsLoFHDC/dnabIKLt5TVvrF3Yb+nwS8f1aitk8fUKxbEb+G018S26oJ+OJyKfPsUEr9umstVeHRJY9oImxZucJKOeDDaZPh68Y9AMWlFf10xUHytFDmidG/GkJZYpU8lhqE96dnWP9IWqm0Hky27FyGZLlDITwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxaD52peVeLXt89ABe4DLeFa5y43OuvuMTitXXlWIRU=;
 b=xPedFv6NdZjA1XxFX8TAG0XbMLgcoF25FxAcDfQc6tDmIAm+5Y0EpCBa8Gm7G/R52uDZihPMlgIT3yPtG5kfgCiMiCjC51WEpwb2OdzUGcC0ziSfIBNINSHHoC2O0E0b8meyyLlYaS+oVEtBdZwJ0Gz+6ah0vIJ/BI7Xb+YwEuzHqI/ivDHgeiX+94pMHT8Y+ymR+q+l/iifKXodNGaRVzZTkXjTlxrQrPNjaJ1VgH31KNg0Z1JEXuTTJx6F8pO/9WLlR5H0KMlgNFrUNvlXnEeZ6tgCmp/Okf0wDhFW7z/hw7P8ajVyq/MDeIsv32+HMgEyvkwEEHbIeoXdBYCqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxaD52peVeLXt89ABe4DLeFa5y43OuvuMTitXXlWIRU=;
 b=k6wlYXHZaUP6MdkqOy4+4nSqFGjk253hxSDRWFTler8nRHL420YgC25Zk8el0xG057bx0DtQY3/QlB/8SsjrGUVb3Q/1WfV6kQf+KqhCf61QwwgKDhnabLyA73MtSBL/jHK1Axdhf77QBD8IvfXcb33jDz2W3FbZZYJTy0kZ0hfqvr6y9Kj6+6DeaWkb191cQTQcR5uVWAxGakW0QcPCSgch+q/N5tsksOIzpfCBZjXfkypSKjgA/T3x86j2k1od9v1hjmSNhvVEHFNafa7NFFc/us4tXnGEovNo2QcPiELOY8GEXJ640eAstZ58GTj4udxoaXYci7FeRZVB4SRf/Q==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DU0P189MB2476.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:424::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 07:13:39 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 07:13:39 +0000
Message-ID:
 <AM7P189MB1009C6144E943460E1388832E3D82@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Thu, 20 Mar 2025 08:13:37 +0100
User-Agent: Mozilla Thunderbird
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 ettore.chimenti@linaro.org, ggo@tuxedocomputers.com, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <20250319143613.11177-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-tuxedo-14: add sound support
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250319143613.11177-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0219.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::26) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <4293f580-6ecb-48e7-9f78-bcf06cb84d0c@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DU0P189MB2476:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a54997b-615f-43ba-8faf-08dd677ebc82
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|5072599009|19110799003|461199028|6090799003|15080799006|1602099012|10035399004|4302099013|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zkg2WUpQNWQ1SGdPOUZGVWQ3OTNuS3ZYZHlLUGRQcG5tQzJIWVh5aWdGYklE?=
 =?utf-8?B?L3FTTDNGS3E1NnpKMmVRWHkwcDRyelN5c2dlcFRrWHgzRmt0M05nZWpKRWs3?=
 =?utf-8?B?UENRVEg5aFRrMlVSQWd2ZWpYZUt1RTBUMzFUelV2NG9oNTB0Vzc2Z3RXdEVz?=
 =?utf-8?B?ZW1CYkpPL2xHeTRWeGVEc3FCNzNRejNlbW9uK0dLcVpDNEprWWVETUh2Q1Q1?=
 =?utf-8?B?ZnAxcnJteEFrR1pEakhMdG5VSVVWcGFwSkZXRWFkOUN1cXFMRjM1S28yN3Zv?=
 =?utf-8?B?YXpCbnBGNEFLQnZqZXRpZHFJbW1JVU43cTk5NnBsZUlFeWNBVC9kZU03K1FG?=
 =?utf-8?B?N21TZGNoR1VKVEVhMmlNdXNNY1VvUUVkaWdzbjB1SVNlSGZ3THQzU2J5clpS?=
 =?utf-8?B?RWNqV2c3NWl0N3U0K1ZtQ3lqd1NvcWdOMlVVNGwySkZzMDk3em9Sb3B1eU43?=
 =?utf-8?B?NlliOWZ0UENMMFpsa3o2TU5vVjlBWXQ2ZmxHOHgvOE9SOGhuZFRrY3d3UmNT?=
 =?utf-8?B?UjgrTTFaWkx6dFVudkNDd2pvVnhXSVdqZVhQSm5SL05PYzlob2VySzhpbXJp?=
 =?utf-8?B?dkc4WFplcXE0VGNvUjAyc3czb1c0WWZjTjJsdkdOOTBhNDJJanM3QTBvbmdv?=
 =?utf-8?B?L0lQMjY4RWVQNGJpOTZta2t5b1Y4TllmRjFMTllGUDkrUVZPSjVucC9uZUdq?=
 =?utf-8?B?NjBZQTBWZzVjVm00emJuWUZsZ2ZTR1FRdXRxeHd5VG4rdXBRaTRKbjNER1Vr?=
 =?utf-8?B?cysyb0xMemRSTFVFK3FEbHVoZm9zZ1ViSlR2TVVtWmxJNG8vU0hxZ2ZVdGwv?=
 =?utf-8?B?a1hTcmJDVmJpQW1VM2ppcmFpUlJzc29uNlhLNFVCUEFCeHZwK3N2NHpHRlly?=
 =?utf-8?B?cld0SVdUWWRORGIzbUJ1ZjgySEpEWkdOWkRMZzE1VnBFVFUyVWdOcTVNOW1Q?=
 =?utf-8?B?RFY0R2hQcTMxM2dFZnQ0aDNyVzVxOUFUYVZ0Wm9ZS0lxODF3STVqL0d3eG1G?=
 =?utf-8?B?ZVhSdEI1dFcrQ2FoR0ZoaUxRL2FTMXljNWhZbC92NUh6citjTXNiS0wzcUlG?=
 =?utf-8?B?eGJsR1FwR08wS2w0VndrektUUGUycU5qYUNlTTNRYkNBd2RvNzlZaGZhM1BN?=
 =?utf-8?B?ZGdtL254eXN1ZlpxdkNlVFM4YXFUYkxDWWZodUJHbUgvdUU0UTBVMjRMbW15?=
 =?utf-8?B?OUNRQk53UlM5MTcvQkN6VmhTbEUzcWlQWlpiZHNDNkJxWU9QL1JCaG0xcDEv?=
 =?utf-8?B?ekV2K1hoUlZYQWdOcjFWYkMzL2x4ay9mYU9VOFpZQk01ZXhqUWdiZWRuR1Qz?=
 =?utf-8?B?RS80dFEyRGFvZ2lNc0d6L3VRbWNrWktqQ2FWK1FycHU1aGVwT1BVNEJsYkd3?=
 =?utf-8?B?UEJad2pZNEpTYXJiYWJJY25hQkg5TGxrUzJUaHNCZkJRWWVyQVBoYVNkRmNo?=
 =?utf-8?B?L0JTUmRPdFg2YWNDakJrSEhBclRoa21VekFkMERBcHlPTHVINFd3TXg4d1M0?=
 =?utf-8?B?SkdHeUhuQ2Nmbnl5ZkJQYXRadlhDTnFFVkZCaVh5ajdOQnlGbmxoNDE0dHFY?=
 =?utf-8?B?SzFrS2lSSXJkY1VPZlBZU2F5S0hwdURrRlNPTjFxSE1WZ0ozQTNFeUJ4RW83?=
 =?utf-8?B?VWp1Y2tJZjlJTzd1Y3B5MGM2Mm5sOGd6QUdveUltWTUya3FvSXprNm5MbWZr?=
 =?utf-8?B?clVzSURtM2FTTUYza2I3OHdmOFRubUwzVlpaRy9OVHRuMGt4bzE0TUhndjUr?=
 =?utf-8?Q?eMtDpmj4N/ESc/GlNY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RktWRTBsR04rbHVtQ092SEQySjlGNlhNemNjOGE0MWpGbEh5QlRVQUcxcWVB?=
 =?utf-8?B?Q2xMeG9DUXFmQnBtU1lCUVRiTXkxaWNpdTFPMXVFNEtBM0Nsb2pRbXhSMzZt?=
 =?utf-8?B?Z0laS011dkh0ODBPYUgvVFhkSEVkMHdFenBSRW4wdDBLY2NGNTYvdFdxSzVG?=
 =?utf-8?B?Qkw3NUp0YndoOW0yUzlLQ0NkaUtQbHp1akdVMnBpT2hGS0dKRjBNc0JPQXZa?=
 =?utf-8?B?VDRsak0vTHVyL3dDZGJHT0ovOFlBUUgyeDZvTWdkUzFpM04wMEkxR2J1cDh0?=
 =?utf-8?B?T2wvQ1pjRTkyY2pUZE9BTGp2Ym1RRmQvT250ck1tM29JdmJNamIvWEs4WExh?=
 =?utf-8?B?Z2xyUzZiWEFSTnl0eS9GSGhEM0NLSmQzVFBza0tUYVk4WUVHVnlqMmt4MVFX?=
 =?utf-8?B?YWtJUHFmaG5rV1dVUjRVcVEzb2tINWdZalRqUFBGU3h1dCtQYnF6cFZTRWdp?=
 =?utf-8?B?ZE0vdmhOclNFWjVhZW9CTVFxdVJqR2Z3RFlHS1kzcWVma2IrSFhlL0FYYVV6?=
 =?utf-8?B?L2F3dUVESlJtMmtoREpxZGNLVk9MT2p6ZHQrL3FVbVQ0T0svZ2pMVThOUXU1?=
 =?utf-8?B?RTZoVGlKWmQyQkpqNE01a3FPS1QxMzZUa3ZsbDRxNWNLOUlOcVMxamVBVVBR?=
 =?utf-8?B?YWM5TUJLakR2RG4xVW1qcWJNcjRPM2Y1TDRBSTl4bDRONTlxZWROejdLVzBh?=
 =?utf-8?B?TXIvRXJmM3NtOG42Z0UvWVY1Smp3cWZ1UGUxeGtpWDZGK1pyeUk3T2tla3VR?=
 =?utf-8?B?aFhITHo3OHFxQnM5N2t0ZVR2Tkx0TkozeVRwVTIyTEdqOTdpWWh3TkxNRjdH?=
 =?utf-8?B?cXZzbWVBaUxuOGNWZ2FUU2lTQjltT1p1WUJ4ODBzOG5Pb1FENVlnbGI0ZkNZ?=
 =?utf-8?B?aEdHdXFKcFBTLzdnc3lEQndGV3R6UkpMQ1g3TGEzK25nYjBrZmVWRm5ZYnI1?=
 =?utf-8?B?TmdkNE9IU3plUVFZRko3VHFuSENoblR2aGFvUkQ2cCtudUtyUm0zWHE4NUxo?=
 =?utf-8?B?d2JaakpQUHBqN2NUY0sxelRwc0JETkp3aFpkdS9LdlpZWmp3eTM3K1l0S2l2?=
 =?utf-8?B?ZVJqNkNZTjJJc3Z4N3hWanR6RWFvZlZPNjlra2ZnbTIxMzRUaCt1Q05PdFNa?=
 =?utf-8?B?eWt0alRWTVZwRjlhVXdGbHpJTldpalBYVk9RT1RLWisyUlU3cW9TcTlmSGdK?=
 =?utf-8?B?eEU5UUpVUnV4STdGRkU3MzNzUmJXWmhjdnRZaFpBMGVTc01OVFRaZlVPYUpK?=
 =?utf-8?B?OXVNdzYyL3MrUit4dENPYzNpbDVuQzZIT1lITjF5WDZ0blJVMnIxRURxM3ZE?=
 =?utf-8?B?cVlVV3hnMzRPclBuV1h6dUxhOEFNMmcyZUR3MWltQi8zTmVSZUdZeEhJWUYv?=
 =?utf-8?B?QzI2YlVvcHZpL0plMDNWWFZqdlYvQVFsU2hkekNPY01QQU5YRmJicG00UWpn?=
 =?utf-8?B?TDJXdFJNVnV3c05QSkdFK0owSkhsUGFmbmQ2bWtxaFBCZTZXUnZ1RjEzWkhk?=
 =?utf-8?B?SUgvYnFQdmlnTUx0MGh3Qkc2aTBxTXppZUk5R2t6TzBrSTJBQUNUeitFQjBJ?=
 =?utf-8?B?T1Z0RHpmSXRnVGdyd0dKUFdSUTlGbU12bGUzblkzOEh5dyt3M1NTY0JIYU1I?=
 =?utf-8?B?YVpIVkNxT21TbWxsZXpSVCtveEYreUxvaE9lSW45NnlFbWZSeWdZUUEvY2xQ?=
 =?utf-8?B?YWZnalE4amxXSzdXdkRvakRNd05aKzFWeVM0S21nZ3pQdng4UU1aZGRsa1ho?=
 =?utf-8?Q?Cbfp9dV0RKRaMNvUTZTw1Y7dklleusVjZKvNBgm?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a54997b-615f-43ba-8faf-08dd677ebc82
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 07:13:38.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2476

> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patch adds sound support for this platform,
> support includes
> 	- 2x Speakers.
> 	- 2x dmic
> 	- Headset
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> This patch depends on
> "arm64: dts: qcom: Add device tree for TUXEDO Elite 14 Gen1" patch
>  https://lkml.org/lkml/2025/3/6/867
> 
> ucm changes:
> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/x1e80100-tuxedo
> 
> tplg changes:
> https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/tuxedo-elite-14
> 
>  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)

<snip>

> +&smb2360_1_eusb2_repeater {
> +	vdd18-supply = <&vreg_l3d_1p8>;
> +	vdd3-supply = <&vreg_l14b_3p0>;
> +};

This seems like it should be part of a different patch? Or should be 
mentioned in the commit message.

> +&swr0 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-names = "default";
> +
> +	/* WSA8845, Left Speaker */
> +	left_spkr: speaker@0,0 {
> +		compatible = "sdw20217020400";
> +		reg = <0 0>;
> +		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrLeft";
> +		vdd-1p8-supply = <&vreg_l15b_1p8>;
> +		vdd-io-supply = <&vreg_l12b_1p2>;
> +		qcom,port-mapping = <1 2 3 7 10 13>;
> +	};
> +
> +	/* WSA8845, Right Speaker */
> +	right_spkr: speaker@0,1 {
> +		compatible = "sdw20217020400";
> +		reg = <0 1>;
> +		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrRight";
> +		vdd-1p8-supply = <&vreg_l15b_1p8>;
> +		vdd-io-supply = <&vreg_l12b_1p2>;
> +		qcom,port-mapping = <4 5 6 7 11 13>;
> +	};
> +};
> +
> +&swr1 {
> +	status = "okay";
> +
> +	/* WCD9385 RX */
> +	wcd_rx: codec@0,4 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 4>;
> +		qcom,rx-port-mapping = <1 2 3 4 5>;
> +	};
> +};
> +
> +&swr2 {
> +	status = "okay";
> +
> +	/* WCD9385 TX */
> +	wcd_tx: codec@0,3 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 3>;
> +		qcom,tx-port-mapping = <2 2 3 4>;
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <28 4>, /* Unused */
>  			       <44 4>, /* SPI (TPM) */
> -- 
> 2.39.5

Kind regards,
Maud Spierings

