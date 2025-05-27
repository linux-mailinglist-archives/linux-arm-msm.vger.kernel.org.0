Return-Path: <linux-arm-msm+bounces-59533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697AAC4D58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CFC2189FB6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9E9259C82;
	Tue, 27 May 2025 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WS0yM7Ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2094.outbound.protection.outlook.com [40.92.21.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1BE1DF270;
	Tue, 27 May 2025 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345315; cv=fail; b=oQ/0sgkhDPFdvmGnmQq7uhXTzbOaV5ofV54YXBmA7GUpiapMVc/Hf7lgm/e0MGwwVEsCyZB8dtYkRtpZANliTIfjzjlnEf6T5HH8Rpz1ZweZTRw1ibCdTEOSMJtg4eNtGByPZeeFd7D1Qkhlj7DsLwEeY3qOQXqPCkLL6Hcsv9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345315; c=relaxed/simple;
	bh=zIMgOqGFuyMhGmNgMApaY5H1Bi9fhKts8IJlc5/XDAQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XH2SOb7gARxTt5nY/FnkK2BIC84uqIS/Spr7qfxVFzQPgCWWjYk486BUgsexEOdFmCIlw4VBsAEjrqND7vrnZl8njnzt+Sfq2+zvoz3j+Odudre4FaUR0bh1HZp4VAn9UfQ60e5xn1LK4mvkmkuthGUWMZh9ddnOoS+QyBaT7d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WS0yM7Ms; arc=fail smtp.client-ip=40.92.21.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCI4RMhffZvj7bmIB3fZx7u//SBGzj3PqDmI1DFDtGKcSK3/UZoBjKWL1GmdO1wFJVsVaKZeQNkIJRNMXbaHucUI8el8SZj41eK44E3Hiyf9oJTd/3M3gxFZfa42R5GJeGQ0cf0gv3k1C0jNHX8XkPyjP/+dqVV822OqRXcEXR85vwRNgxRKAp+LuDveWItBs3yk3u/lM9zjttMnGdZ5CgDIA/Pr8KcZkduP+zgLlMsLzHEi212IsOKXFndyRHWkJQKz30wus7rrFRn4FIeLvNxNGe2qoh4G/LNTPOVMVPvomRg/uIYB6v2G/bR78ngr1wjm1AO+cmQxTKk3kTo1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzHI+MqVp0FcFV3ZAEJhQv0QvaLanfKTfAJrtuvY0yA=;
 b=uFAji+p2r2tTeR6b1mSp15IVIdjWuLQ4bRkZG72N79RAOqSr69w1eZAvF4/fI+Mkgi0yYeR3mUmxH1g5GIzk2fHhAofgIRYIZlyYby3lj4VrFH64Ea1vN/Qfk9KlAAzlq+Z8/3E9gOHv+4CUISVMqicqVXQIgeK9kblVvh7f5W8wGqe7kYW0goVqqwgfw6rNzAS+N9NYi68pHDUveZvf8Ilrk+DVkTDy68AaZPN4PmlJH3eOxrpDvQ+ZdajZE74Kfi+zSwxkLJ7jUcyykLgVYiR+2aGZ/jHUumAoJNoo2hhEhpuriGZYWTDAu4Zpq0k0ZtMSZZYJdR2YDXRcP4I5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzHI+MqVp0FcFV3ZAEJhQv0QvaLanfKTfAJrtuvY0yA=;
 b=WS0yM7MsWh/P/vLtbX+OutZjGLzL8UDu56eBSmQq7tTk36s+MaCPceFAmQVlkcrpSZfNXhWHF2T5b1eRvGX2dmdmrMfouOderqOafdl2ck8b6ccDKMqv2a0VT4ZFOovhGl7g4TOkmCDGWvHT49dYZ5vH3DVSSK0Ui1Ptnu3PP9r+BPzDerYVPTDWvdrl3F3OmqUc1BfSsEOr1sWBDv2c4XseV7NCp4I2ngJ7VII3oSn3U1N4iowPNrw7//UlP+flworuKLWretNqS4CSWtLNYxJ+Db58xvIo0pZmIMdFXIvMZPgsxYKATpLkppO0+yjpTyqNxMAHckj2ngqcVgY4ug==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by CH3PR19MB8331.namprd19.prod.outlook.com (2603:10b6:610:1cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 11:28:31 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 11:28:31 +0000
Message-ID:
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Tue, 27 May 2025 15:28:13 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0099.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5c::15) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <db6c6eed-7344-44d3-8a9b-574ec7547426@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|CH3PR19MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 9156ab17-3285-45ec-67be-08dd9d119af7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|8060799009|5072599009|6090799003|461199028|19110799006|15080799009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWFUT0pBNk5LeGpuUDJWTDdURFdnaFN1WWpucHFTT2k2OWRBckhKaVJCRkZE?=
 =?utf-8?B?QjFnai9QSVRlZ21vaExWN1E4UlVwNC84eXBNdjNpaTFCZkErbTFZdWdScWZZ?=
 =?utf-8?B?eHhUOTVKaytkMXJBOVNGTjEzUmphbUc4aVcxcW1qQWlvbXFIVDNqMUxBaVho?=
 =?utf-8?B?OSs4YVdBRWhnV0N6QXdBRUR5enBHTlNGQmJsVUVueTVMMStodGRJY01reXJE?=
 =?utf-8?B?T2N4NWFXNDFIZDJpMkN0MHdrTHM2OHYxeFRDVXVaTVJzcCtsbkNQbU9HK0tV?=
 =?utf-8?B?eTBzVnB6TVM3RjMyNWFDdWZtKzJ6ZGNCRVVMeHFCZmVpNHBvdTJOenJhYWF2?=
 =?utf-8?B?blZxa0g0RVFxbHpiRy9XUkJQbjcxMWJsMGRqN2FSTTJaRVUvbHB6M3BmTWZ3?=
 =?utf-8?B?REF1elREUCt5SnN2aHc3UXVsMUpoZHBIOG5mZ0I3NU4rSDVmSmFjVDU1Vktt?=
 =?utf-8?B?YXdwci9Id1U2NHpLbm85OTlmck1lWFVpQlFnMkgvVDVkemtkMk5FZVF0K3RG?=
 =?utf-8?B?VndSSFhZMjM1SnlyNng0V0xLdFlmTW9wMWx6eWVsR1FqOXl3R1NHT1pjdzY3?=
 =?utf-8?B?UEsvYXhsODF4M1U5V01taUF6cXlVSU1QNWtLWmRNb2ZNK0VpSUxaa0t2ZS9m?=
 =?utf-8?B?OGZ1Y0RRNTRKSEppZG1MNGJydUQ4bktDVlJSNks1cGZ5Nk5kSE1ER2ZwaUtK?=
 =?utf-8?B?SWlqS0d5RXhhZlM5ajlnRXZiYmFsWFowR3dzWHFOb3drd0ZMUjZjLzIwSG0r?=
 =?utf-8?B?R3hUWG9tRWw2WW9JNlJuemxKMnVYcERVRUFtcXFCN3o0ZTdlTGIxV2RRZHlQ?=
 =?utf-8?B?N2Rrd211Z3JXK3JCemtKMUFSa3lkeVMyMVhvKzA5Wm1BZk1ENFV2c1hWQ3BL?=
 =?utf-8?B?bmpYUE9TWEZJSTFaM2p6NElxVFAyMkJicTNZbDNtakZQT1dxcmxhTHFIRDBC?=
 =?utf-8?B?RUkvU3BZenl3WDBRTGlWQlN0Sy9GY1Fmd0dNa3BjZE5GWmR1M0JVY2VmcTVG?=
 =?utf-8?B?cGJvTWV0L25yRmJXbDl4NTZFY3piOWFqZFpndWxDNjlOd21YcmhWcXRudksy?=
 =?utf-8?B?Y1RuR3JSQVBwWUx2MXJDaUpwRzEwOXI1c0NSVmRoaFdLd0IrNXJ5RllSMUFR?=
 =?utf-8?B?Y1RoTVRkVWtwYkRCanVDZzgrTndDKytQSlUzMU5pd2J0UlBuWXpReDdpa3lZ?=
 =?utf-8?B?amJDOHFGU1NwZkhBQ3ZTQUptMFVDVGxiZmM3VTk0ZEtSRXRjUGpQbUVjSHNY?=
 =?utf-8?B?bzRHcG8wOVNZa2ZNQW1qcTB5TlkzQ2lYMEJkYy9YR2JQREtaMTFteFR6ZVFH?=
 =?utf-8?B?WkJSalMrWDJRUURia2drSWQ4VnFoUHhNZkhwU3ZuVE14bGdOVjZCeE9oUkJp?=
 =?utf-8?B?c0ZUQ1V1UTdpMTg4TzVVZmVORzFKbnJvTVNBcE5wTTJ3SGF0d0hjVlM0T2Z2?=
 =?utf-8?B?MlpWSHRqQWZQLzZLT1VNcEJIYkZxenhoM3pxdkdtd0V4US85SHhYZ2p6cU5F?=
 =?utf-8?B?U3NnYWppZzFZTlR3UFRqTW9WOVUwcWdmMWFkZnJ6SWw2YW5jK21iWVBodFls?=
 =?utf-8?B?Yzl1UT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFJ3U0xrZlRBcW9XZkJsTVdxclV0N2F1QnlJSUxPQWZnR0dqRkFpZlIrdFdu?=
 =?utf-8?B?dWw5eW5BcWN1eFNyQUxOWVlUMlFVLzZjNVBxeUd4azZhOXI2VzFFWEk1bUNq?=
 =?utf-8?B?YTdlTlFnSGtXekZ0WlhMQWhHR0dhSnlIK3hVTTEvanRQYUNSWk84YU16d0RQ?=
 =?utf-8?B?VTNxc1VZRGE2WDVhUXpNd003bEFJTDBNSU05VlZSZnVhczVyV1c3WUx1dWhS?=
 =?utf-8?B?ZWxjM2V0NXdFb2U3VnBNNzA2THUyWkV6L1lUS2Zod0FiNVdsUHIzZEJkZTZo?=
 =?utf-8?B?ZVRBZ2FJZWJEY28vQ3RTM0lHNXVVek5udTlXOWhnR0lxNUhQczR3elJyVzNU?=
 =?utf-8?B?L3l2dXlZODFoU253VXRnNHc3c0l6a3NxT0xHRVhCMGFvbU8vdTZFVDFHay9C?=
 =?utf-8?B?UllqeVJOOHBJYU5pd2xJRHJ5M0g3cnVTdVBwZDlFcy96MEc0UDN3ZXN5eGth?=
 =?utf-8?B?V3R0Mmo3UGlWUUpKSWcrbys1VlR1cm9WS1M3OG4zQXRVR2NWdGc0VldrbFJN?=
 =?utf-8?B?YVFtVTFSek0xTjYwYVlxZUhqRXlpMFMrR1M3Y3pyZnZzaWVNaFo5NHFTRCsz?=
 =?utf-8?B?SStaL0lmNE5pUklJVXMxb0xPdnBraUo0SzNpYTlMNlQwSTM0eTNzcEU2bGVO?=
 =?utf-8?B?WUFoY0JMTVlzamptOEZnVndNdlBsZkl2dzBjTWptdSt5NFhHOFZMMmFIY2NF?=
 =?utf-8?B?bEtvY2dtcE9zMm9zOGNwNGpVd0hraWRWd0Q5OWFaMThzSG8vdGRud2UwdmVj?=
 =?utf-8?B?R1RNa2VSakwxcVl1ZmVmQnRCMWpjS2NoY1ZBd3grcjZUWm02T3lsM1Ryek9t?=
 =?utf-8?B?U282MmlMMk1sZDZNelNnWW9XN0RzMDFPWWVYRncvL01scGR2c0pvc3Z2L0lT?=
 =?utf-8?B?TWVmd0IxWG42M3pacVQxQWJDajYxVUtkTEVjak9rQ1pTMTk3emtJenNxTWhK?=
 =?utf-8?B?YlNFNTkxOGE3YUhocXh3bFJKWHhVQXpNUGlJcGRJMkNBSDJlRjl1S0VNaGVp?=
 =?utf-8?B?eFNvcEhSRi9obGhBTzUxVW1uQVMzb0JwelR2OVJTR21BWCs1UldWZUltSHNW?=
 =?utf-8?B?RENSSnFSaWhYYk1pVGxrL0U2bk81YXlNZ3hQNGNxZE1YSmRVSGd6RGdqS0Np?=
 =?utf-8?B?VlkxajBFa1Y3TTlRWEpBSXd6cmtjc0VnWFovRVVIR1JpaE42WlYzVTRUcmFo?=
 =?utf-8?B?WVI3SElMQVJ1QnhyUFZuNmVRb1NvMEo4TWNGVE5DZ0NQYlVEcW01VUVKTUtr?=
 =?utf-8?B?NnNza2VHelRCOGppR2hwanhuSEdxRTVvWVU5bkl5cXpoeWtaQWs1bCs5ZDEv?=
 =?utf-8?B?eEs1a0graWpDUWdndzRPcHNVMzlhbWhSZ1N0QmM0bDlaM2Vzd1oxQlp5T2RG?=
 =?utf-8?B?T2VQZlpNcHR5d3doTjFVaTcyWVhDVFp2d1QyUHNTZVl1Q0JLRzVNdlRCYjF1?=
 =?utf-8?B?dFB2QUNUMUJwQStEMm5UYURUemdXZG11amJGNmNYNFhKQllaS2tMUkgwakZC?=
 =?utf-8?B?WnBvSE4za2VqaWcyNlg4MlVNakR4d0NwK2VXZkdRaXA3aDJ2d1BudXZJenBp?=
 =?utf-8?B?WkVKSnAzVU8rN2l4amRkYjloMjNtNFgwSDJaVGt0TjF0OGt6a3dJbTZuRHRV?=
 =?utf-8?B?OUNjNlprQ3RoQjhwTGRKYzE0TlVyV3lOckJKSE8rYVJ4ZkhETkhDNmVLdVpN?=
 =?utf-8?Q?Zhj4Y6oP4zANmIsOfYT9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9156ab17-3285-45ec-67be-08dd9d119af7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 11:28:30.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8331

Hi Konrad,

On 5/27/25 14:59, Konrad Dybcio wrote:
> On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
>> On 26/05/2025 08:43, George Moussalem wrote:
>>>>> +  qca,dac:
>>>>> +    description:
>>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>>> +      link architecture to accommodate for short cable length.
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>> +    items:
>>>>> +      - items:
>>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>>
>>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>>> Drop entire property.
>>>
>>> as mentioned to Andrew, I can move the required values to the driver
>>> itself, but a property would still be required to indicate that this PHY
>>> is connected to an external PHY (ex. qca8337 switch). In that case, the
>>> values need to be set. Otherwise, not..
>>>
>>> Would qcom,phy-to-phy-dac (boolean) do?
>>
>> Seems fine to me.
> 
> Can the driver instead check for a phy reference?

Do you mean using the existing phy-handle DT property or create a new DT 
property called 'qcom,phy-reference'? Either way, can add it for v2.

> 
> Konrad

Best regards,
George

