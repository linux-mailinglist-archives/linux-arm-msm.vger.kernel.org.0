Return-Path: <linux-arm-msm+bounces-112764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eSjkKTeyKmrFvAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 15:03:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6997067224B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 15:03:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=oiL2foIs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112764-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112764-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8758E315DA2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E4B3FADE8;
	Thu, 11 Jun 2026 12:58:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010094.outbound.protection.outlook.com [52.103.10.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E93F88BB;
	Thu, 11 Jun 2026 12:58:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182723; cv=fail; b=CCfz4oKmOXE3lyz8n8L9aoHZiSFdMWPjcyYCgi73lqnIQlSXAwhtSagyrRZRzDB6l2ONMJrNVGoJyCAuLMvd1PWwWgsmtCZocSvSVFoObF2Jtz2JsGcwO0ooGw6E3tncny0+JNYqM353rJjtaMf8ABBCOqTRaDieLLwZK77+FrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182723; c=relaxed/simple;
	bh=vJt7BpIh7RJJZRDLs6m9zLGaQp8CKQfgtrUo+cZUoLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u3ZM3ACkEJGUA7O2+skJ45dMi47jhf9nl8+ixt2lGY4S4iGppk36PGHcF62kxKtYEOCS+n+XySaOgFjub2CDlMPrMK4JpXQDfB6X4lpsj+0l4lrK6HP83TEAbaFmpGCCJL7y/8yl/KNQrAOIrqhPXc/IC8Y+ImDExzykRjgxJjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oiL2foIs; arc=fail smtp.client-ip=52.103.10.94
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdJq3OfU9ZLOZmUJym4mSq9ELDsKcJ4ktqMmOZ5QJ0iTHHZJAjuMr3/Sq4mDzSrmQOBp60ABdlCRKvHM99Hrs6horOnvTY9lUu974sHGRs0U93yhjoUJ6Zmj8p1azTtPymvbI3cKfDzp3EpYengelz6FtsUUKw738B71RaMaxb28OrxvjdlUN3cLSh1O+LdoCou4tBluH1Cw9DeXvfI8LVbVu9lKgwJppR3Wmn1O8QL7TZc9UNmlf3IZ9EBLIUXVzy34mPGBOVDoy/6vMTcBjuJWN6L16f1RAASOlduzpvHKNR0AckYj0lvhK8qbmgIZ6JU6UbAszttHRop2ku3BFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgmSbDqoDwXNZN+QFcSvce9nVWqH+LaWOSs+iwwylnM=;
 b=wx9QOHarNf1XjzXxBZiVKmW7Qzf310I7GwVkfz0Sx/7GPgUodive8ec9/vq8N6DSTCybi7VJ+vG8YW+Sd09NXHnIbEBxz3XhgOoj/te5VbLkV5B0FrVJeMrZ/DgsVF5bKSwD3SSRaStOmqzkFmBCa+psRi+Azp01uSRTGtVx37iy5SfNXNoXja2KIiE6DdTQonoLgvPi+sqFg8hOTJw2+fhFs+LZoE0Ye0aYmeRHywVxZ32t3yvxNoNpr+5iftlq4IBG1nK8s8f/NVKIhKtggS/INukKKwN6jVfOi7JCbUruz5GgHA0j8XVWccMBJrtJypbGJFN4hdaMLSI16eP0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgmSbDqoDwXNZN+QFcSvce9nVWqH+LaWOSs+iwwylnM=;
 b=oiL2foIsiiR21c2G95qbdzmIg7a4/nyPlepEijRS3bo1w7uiNCptwYQkj3Tif0LCwekQE1pF9Hwfqndh4koDbz0EWYDaKkN0GFdHDZNeDeYC3VYMdOsjqyHz6ZHo9fYKgVTLABC+p49HoWLTy7Dmjoxgd6edeeLf2nULOCXoVJh1X0aDzGEfWPlEORLsE8HAoetG3noHjEUXTmnzBuQQu0V1orE7rVM/zCgS2kE1a3WoHy3Om7jy7aDCgHu2Dvo+xMDAJsaaN5RhdS+26iue8WZEa4vNQUvxAEB/7togQux9UBX3iKLdG0gygeOkwBWaEUkK+56ZgFMWunxqNroAEg==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SJ2PR19MB7529.namprd19.prod.outlook.com (2603:10b6:a03:4cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 12:58:38 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0092.017; Thu, 11 Jun 2026
 12:58:37 +0000
Message-ID:
 <SN7PR19MB67369F7DD02F702437C0F1919D1B2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 11 Jun 2026 16:58:28 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
To: Andrew Lunn <andrew@lunn.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
 <36cd63f4-749e-4b09-b8a6-cbf6924dea88@lunn.ch>
 <SN7PR19MB673634FEEF98FB8BCBBB15979D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <471a21f2-7ab0-410c-861d-5722a94b127d@lunn.ch>
 <SN7PR19MB67363B4F852FB37071637A299D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <afdced5b-73b9-4214-a94a-c13fadd39dce@lunn.ch>
 <f492327c-7ee1-443f-bb11-b78af0eda207@oss.qualcomm.com>
 <10f2c054-3d5e-4a80-adc8-2e63c655b3ae@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <10f2c054-3d5e-4a80-adc8-2e63c655b3ae@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0194.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::9) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <2958c778-b054-4e00-be0a-f351f24674fc@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SJ2PR19MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e23b8fa-0202-4eee-21e5-08dec7b92721
X-MS-Exchange-SLBlob-MailProps:
	obhAqMD0nT+6TxoHw5fNkboUl/ASnSn27jrbZS3Z3jyIxkd1GwZHWu0RDsTZ36PzwYEkH6GG9FR7znKEdaQj7OBP2CUT2lFVfkxH3t79RLxg0xIr/36jT3IDEyRq77WJKKZx1Det5ZvZJmDMg5bNSWaGmwqX+I7nPsDG5NW0S+6FCcjbizi7HPD58HUfLUVA1o25rkDmAUYKgxMr6CABR50eIfKB2GVC6tmTPy2Kl5voBjlJ7EiMFPG61jJvNQdPdKiMyzjmIB13vECaQgEiHuy/gCdH+q7DuHhiOHwOAfekvn6T8UorOeSesMMZVZxAw9SPz6cnUhJ2LYZc066Ls1HkuA5g8JqWjAIhc/w1f2eA+nIB+m7SaC60MwtboyVtZYQyA0NeE0lyQ6qRVNGFctnOtGUry4xJZNZ/YYwfyVqKkbAsLQuSwAYMStGssTUyYSsQlWhEfOUubUHE8NqJBHsZDyyozDBryfPx6LB8ZxJWI93dLM1Db3dlBbzhL1DsG/QHieAGY8jtchnZXRvceLpM84DZJS4hIr1WsJihBgExy5x3gD2m7xPwcJviH+XFEAzqXufyz71jOwytiHxfhwdxWXyHIKCM4RLpx0rDVheTbyiJ3rRscmHzMJ+7ed0PNZnJhKvXyyRWYEDPr/5hvpcF7T6Eb58pyBtXVpEE8KwUKcbgtExrutU53vSOYpn33M93/UYxeFCuX4EfxzrqYv7EIn3/QjpoLwmTSJ5IZ1H7LvkLBhR5n+k9PTd34VxdKH47S0gX3ufFpAdZ8sD1MuHadSgCYD743NY5Wd1vkmorwF3O8x2O5k+JFDsNoDK2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|5072599009|24021099003|8060799015|19110799012|51005399006|37011999003|23021999003|6090799003|40105399003|440099028|4302099013|3412199025|1602099012|12091999003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGFqd0Rza2o5dkNhbDlCOTl6OG5HUFFRT1AraFEybURkTGp5QjZwN3FvbUEr?=
 =?utf-8?B?Z202UDJTa3BLS2U4TFRlZ2tsMUpoY3hxSGV1cnE0T1dsN0t4dDBIWDR6dlVw?=
 =?utf-8?B?WU1mcG4va3VlMUJLcjF5NkQ4ZnJYYmthU0hBTnRNd21ITXdsQkR0YjhyWmlz?=
 =?utf-8?B?NWdQMXRxaFJ3WWs4MGRCRjJWMEI4US84YnZoRllaeXhnaTNtNUYvWFZZYkNt?=
 =?utf-8?B?eWloZVpkK2tFejQzU2xvUzIwdHRWZEtlcnFwOUpKbE5qQWdNWjJpejJVL3B0?=
 =?utf-8?B?Nks2RysyWEZHbU5ubTRnK01EUVlGbzUvRmZBRkExbXdVTUIyRXBQcHJaTTNt?=
 =?utf-8?B?NWJaWlFudkpVTC9IcWpPeXlXU2hKS1YzaTNlNkpYYXg4STh1K2tyM2pPTjVw?=
 =?utf-8?B?ZU9PZ1VFMTR5c1NDYWxGc2x2SkpmbEo2dGVSZzk3RjRhL0NYNGpqQUE4eUdR?=
 =?utf-8?B?Y1FzQUxGWXljWjR5M2VKRHFmcjRnMTNVSDdVWmluMVk0WGNtaVdmSVpNV3pL?=
 =?utf-8?B?T016Wm93bnZJYWI5VWpacDlES1BUanl5VVhNaG9Rd2xQekRnektEQkRSdEht?=
 =?utf-8?B?N05KaGowZktCalI1QWljTmpVTU1qQmE0eStqaS85RnZodXpqMy9pTEt5cFZp?=
 =?utf-8?B?VTNvVUxNRnFwcmRmbGNVcTNBUUJKTEg2S0c0aWtxZ0lmWVN2S3N0cFJpL3BF?=
 =?utf-8?B?TGRyVWpHVWFEU3ZmRU5NVzlEaG5ObWRsK2N1aXNYZ08zSUhXOFp3d2lCOFM4?=
 =?utf-8?B?dWR2NEFyVG56K2U5TnFZeWRmMlNNVHRVZFo5aUlUL0V3cHhhUWpZNVZVS3l2?=
 =?utf-8?B?QXZ4N3gzbVFkZVpQRDVjK3JzRWtqeWUydEdPZG5HcUJPNzZLZS9DZG1LMWJ1?=
 =?utf-8?B?eVJvYmQyeURRQmJhODZ1c1E4TnY4a0M3dnFYVk0wWlFzNFhZcG1FMnIreUVC?=
 =?utf-8?B?Z3RPK3laaU1xU0RlLzdQMFpyd0w5ZklGaEZFODBVRjlHdzZVa0h1WEVId0t2?=
 =?utf-8?B?Q1IvclZpekFrdTJFOVlOeGpaR212bjBkMC9PK3pJVHE2Mm5UTThUMUZpYUFY?=
 =?utf-8?B?Tjkwb0xvVU9SZ08wVnlmUG9Pd1VQbFR6YmhqMElCYm1pZU9GM0luc0Jsb1Rq?=
 =?utf-8?B?a1UxdytNVFlnQlBuQmU5ZU15bkpWNVA1U3ZYT04rakwvNnFiZkI3c1NMR1dr?=
 =?utf-8?B?cGdxYitZTDlldmNCZEZzUUYvL0dabGdZNzRzTTNUODBKNmZOYW55WE9oM2Rl?=
 =?utf-8?B?bktHaGVGcVJackNrMHhJczN6VHk1VU9FMi9FYit5T2tob2hSbVVIdytPb0RW?=
 =?utf-8?B?TWxXSytleEZBVWZWODBHTjEzUFN1UGR4eGQwOUVjeGJrV1k1bXVObFUzZEdK?=
 =?utf-8?B?dVJ5Q3JlaGdoTUxlYXlMK3JOVTVBbXQ4VWxUMDhYTTJEcXlSVjY3UzBOemVp?=
 =?utf-8?B?cnd1aEhaT2tVZ29zUCtzb0ZVSGVMTGNNZzJqQ1NOQm9jL1ZnTjM0Z2g3RkVt?=
 =?utf-8?Q?U9kXDQA1+0WfrWkdtYetiVsL/w3?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3BpYWhNQlZHMTNxY1RLLzREUlJPSVNpMmQxakZ4eGViZW5LRWVOM1ZBM2Fs?=
 =?utf-8?B?c1Vaa1RXRFhQckM4TVBESHozTFlMR2ZiNWRvd0tWM2w0K1hzOGJYRWtDWjdR?=
 =?utf-8?B?MVUxUXI1L1czNENBSE9IT2FJZGpidGp2RlVwT213d3FYbDlRTExJT2o0bGd0?=
 =?utf-8?B?SlBwV1RPWkh4VUptQ0p6V0pDMy9nNmZZZHNpUVZIdktURG9iVWpVVFlHZXhF?=
 =?utf-8?B?MDIzencyeWM1SUh4azVRbHBpTDhjRE5kOGgzL1VhQlFkU0FXNVZ0SDNhUUtS?=
 =?utf-8?B?dHdSTVh1QUtTRU1WMnJHVzJnTGtOTXM2ejc3VmpHTkt1MUdINCtPU2hzQmlZ?=
 =?utf-8?B?WWdKNXBhOURldXdNMGMxT2daQjZOSVArbHBXdU4zMUJqTTF4bm96TmZhRGdO?=
 =?utf-8?B?c2JmREk5d1BrdkpmSVhjYWt4amJ1eWFaQkdTWEVBeklBN2N5VUFHclM4VUkw?=
 =?utf-8?B?bjlFbi90KzlMeVFWbktmaU9OdlhFNnUyZzA0azNsNVlWWFNVSHRjNllzb3Mw?=
 =?utf-8?B?bGFLd1NBb2lwb3BUdkgwUFZDdU1wckQ3OHZPM3dCQkhLMFZRTG9IcHU2bGZh?=
 =?utf-8?B?L2U2djVmNGZPYUFOS2ExTld6aHZNaGsvRHhVQm4yS1ZjQkdIbytDZ1FaVXlM?=
 =?utf-8?B?MWM1bFY2TWs2eWEzNTNQeU1lZHFQMWNDbzRHcDlER20zWURvNWpWQXV3b0s3?=
 =?utf-8?B?d2VZVmNmOHFqdEp0K3VETDhuNGlmamZ2MGdiNWdacUQ0aHVNRFJ1QkhZZitB?=
 =?utf-8?B?SW0wWU5CMWxyanNIODcvMmRCNzVVS3J5TE1acWJVaHU2K2h2Rnhmckh4SS85?=
 =?utf-8?B?ZGtJZHNVK3JSUk5ERWY2bnRHS0xQSForUCt0d20zRm8vaU9wUjI2b0Z2T2li?=
 =?utf-8?B?UXZRaVBkbDJ4MS9FWnQ2cGhTOXFScDJhRkQzZjJkTFZYWVQrR2xQUnhyVVlx?=
 =?utf-8?B?VWdaZ1BLOHJKQm1SZmYvQUQ2OFYwMUJzaVBUckVkWFU3cmtGd2plaU1maWlU?=
 =?utf-8?B?TEoxK1l4WHd1QjVPNXdjOWhScVpoWDdIOUFKM0NnbnlBRG01MFpOQy8rNTVm?=
 =?utf-8?B?SXBlNnlvYkFmaE4zNXFrWW5DbXdib3hyVkQxMmY4UUxOY00xUlJSTjZyRjE5?=
 =?utf-8?B?STI5cjhmeGNZZys2OFNyQVZ6b0hDclpMeTZRZm9KZFVPaEhzOXk4TVpJb0NI?=
 =?utf-8?B?MVl1dUREYjc5YTVORS8wbVZMY1Q4dTdBcTU5a2lLd2k4VXFUK1NzVlQycHRX?=
 =?utf-8?B?aTRKeWRYbi9wNXdFeGF4dHhGRHRFSFpEc3JHK2pPMUVVSy9sdGV1R092bkc5?=
 =?utf-8?B?ZU5ibUFMVEcyR0JkUG9uU0tBRWl4WFJrUW0zMTA3RTF2VFNSMFI3eGxQQ1Fa?=
 =?utf-8?B?ZGtJZnVlUzJGOFdJTUhpaE85bENhRGFVVVlWTGQrVHBjR1FKTWM5Q1RuVGd2?=
 =?utf-8?B?SWJuaSt2b1pxK1RqWjhpQzR4dDFWdmVqM2x5TzZsRHVtWWRoKzRxbEEzS1lK?=
 =?utf-8?B?ZktUelFwWkcvMndTZmgrUUZOMVZXMWNtM0NLRzRMb1pKVFo0UEFGUVNlT2gw?=
 =?utf-8?B?dmlBUTdaUDZuZk04c2dsRWdTTHI5Qk8vbkdoZUFnNnhtSUNITSszWXFGNEo1?=
 =?utf-8?B?L3c0QUtObzgxSW01SWNBM2h4d0xyajBzeTNlVkw3NHJoZ2FYM3B2NEpMb3hq?=
 =?utf-8?B?QXNNZWJ5c053VnJ4RllzTmszaEo4WE84T3VJTlFaSDdIM2VUM1hOb2xNRHVD?=
 =?utf-8?B?bGtsMWdBclVoTnp2enFhamlqb0Zpc0RYcERpeU16L1VaQmlBVm93YmlsNXFx?=
 =?utf-8?B?a0p1cGhMNFNETUdvKytYNmpweUZHbUs1VUE4SVg2bzFkTDRoR29RU3VaaUpp?=
 =?utf-8?B?UUtKcFl0L3FXcGplL1p4RDBpcnBtTElzQllQZ1FwczFvOXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e23b8fa-0202-4eee-21e5-08dec7b92721
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 12:58:37.6747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7529
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:konrad.dybcio@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112764-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6997067224B

On 6/11/26 16:52, Andrew Lunn wrote:
>> Is there any prior art wrt enabling/disabling the PHYs (not necessarily
>> clocks specifically, but say power supplies) at runtime?
>> A quick grep only points to this very driver, which gets the regulator
>> during probe, enables it and never turns it off
> 
> Not really. PHYs which care about power do their own power
> management. They can sense the line and know if there is anything
> plugged in the other end, and only then enable parts of the PHY. The
> difference between an active and sleeping 1G PHY should be around 1
> Watt. I don't think you will save too much more by turning off the
> clocks.

in v4, clocks are enabled in probe using devm_clk_get_enabled.
There are currently no users so there will be no backwards compatibility
issues.

Kindly have a look here:
https://lore.kernel.org/all/20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com/

> 
> 	Andrew

Thanks,
George

