Return-Path: <linux-arm-msm+bounces-56676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66070AA846D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 08:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4703BC3A3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 06:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B68F186E20;
	Sun,  4 May 2025 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="V+Me3clG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2035.outbound.protection.outlook.com [40.92.42.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5629A5;
	Sun,  4 May 2025 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746341956; cv=fail; b=fACaqHLE462RMns8CCxkWLPV9wMdam22NAuDsydn5USAdlqbSOVhtNxciIOsXW5E4FvILbQz+eVDdG69OlBEpOcBh6QstVxL21lKbDlA3Cwpv9bT4gUk9ZZ9Nc8VUpp+4u0TnJVaZhJity4IRBIHOWKrab5mWK2rBgD5MbyRCyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746341956; c=relaxed/simple;
	bh=/faJgiYXZoAxelgps4Z7AbVJ9TmaGnJcX7yNIy5vZ88=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PL0rEQ7mwDdSR9bTERup0NgRo7k0Nn2BnDmdA2dsggXxsWFAdWdTy6x23FjTUAuI6qtDvCbvUVg1HwjPwXOZVtEKkdDWNqGRf4R45cW0mIdBm1uN6a7yIq2JJeYCp6JWht8XG5EmCLzBEsTcCdkRpe4a11BAoZnslThrQMzSrnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=V+Me3clG; arc=fail smtp.client-ip=40.92.42.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTpGQYE8SmjeC/TKakGI6SNMIByRNog0+rPqrwh+3IPeibhxhSQn+LEQ1u9GAVBEuPhp0xP64qXU9YS+R9iYti2LeGO8KajHsIzT7xwS+hNJ3NFFOgEb8TYtAdpoMH0/qyy4MH8SgpuC6YpKvA6nham6LnbD2LMHb2Lk19nkt7FMhddFxeVJE/z7LrYqv7aBSdBGyvBFUtovVaTGQmEUIvv9ajMrFdaoH6EBGbFtZ4ZcH2pc+EVNl2a+Nw8WGphUbRKG+5mA8Jtz3dwZNDne5gx9zb/a3bANUVE89lrkIgTasNp6xE26F6BBeRdwSmOUVUVkUaRiKc737mun24MWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjEPv93+ctgIgytIZY16IDfVoK4o0ViEtUTwQYF0mPU=;
 b=iTNzAU+gO9GIIRbUV2pcuY56t4ytO/HoVbpOybeQYfSGvkVQxZCjf4kwZl+OvRLVpT3Y17sKFmASAwP/RHVbHK8f6S6IoKDxWc8/yItBJ4hEc+U0CrSymZuM3aOlhV6pxJAnggO3WPcGnZ197triVNNIPjDBpRfIEttic7ATTWOUtnvc9p1n12KwdhvY8XJ2D4Pthtm86gfYdYtYsCAWtRhmkLuCgQ73+ZUSmMjHHyC4HxvzOebxJV6JCIQp5D2kfEPO8uUpsP6rO5joPt5hpjEbIoRiiOu2MOfcPnkG/4Yv5Fb8BqpIWGykLZQiAhGa/7mVg+toWZ3iDbF4GyYk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjEPv93+ctgIgytIZY16IDfVoK4o0ViEtUTwQYF0mPU=;
 b=V+Me3clGSz3B5MfYxiL22oZzClCV16ad0FmWTE61TiU9OaNFO2C/akrB70VCaEUDHz6GCcfFY04dZnf5suvTLNV7lyD/myW40+MuTstiqe4WfI+JvuKeofdeQZjvrHgMelmCDsZYXnEJEKRphRiyv9WmvP7EijxMNgZibZQdNOKhoCS44pTCfUpD4AgX+UtQ82rU3wDU+o3ME7pOrXSKVHKi5j4UUJTco3UXbQ5ASDcaG7AZDkLqEak0FoJBw+vTI4UD/b6FUjZSUmUwv6Ds/HtVPYSxxtWwV1LowzxfL59SnQWGNiPH+AH1gCONyq5Ipb3H4ErgzfOhioMNk8ElRA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by MN0PR19MB6360.namprd19.prod.outlook.com (2603:10b6:208:3c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 06:59:11 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.026; Sun, 4 May 2025
 06:59:11 +0000
Message-ID:
 <DS7PR19MB8883995CB86AE2784CAFF8AC9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Sun, 4 May 2025 10:59:01 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: ipq5018: mark XO clock as critical
From: George Moussalem <george.moussalem@outlook.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
 <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
 <b05d9351-cc79-4e60-a6e0-de2fe698098f@outlook.com>
Content-Language: en-US
In-Reply-To: <b05d9351-cc79-4e60-a6e0-de2fe698098f@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0078.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5d::19) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <59330b4f-5d64-40cf-9743-26b266163b73@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|MN0PR19MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: d98138df-c56b-4a91-59ec-08dd8ad92bfb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|5072599009|19110799003|6090799003|7092599003|461199028|10035399004|3412199025|4302099013|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2FPNjhoQ09KZkV1bXA3aGVJMFhyc0NQT0NtN21QNERuUmlSTkdmOTFFR1Bo?=
 =?utf-8?B?NW56Y3BBSFFnd3RjQlplY0dUSVF4VG51aXJDK05wQ2pqeTNvZUJONElqajRw?=
 =?utf-8?B?SzNMUFlaZm40NkNNWXZ1TXBzUDhmZm1xUU5vN3FlZHhhclpVWHRDTkFReGtl?=
 =?utf-8?B?SjZpNG5IMlRVLzVDN2dnRmRiVFlCd1Yrd0JxbmNZbFRJcGYvQTc5M3ErU3NH?=
 =?utf-8?B?K0RTUjRQTThleUJMOHJ0NE9ocWFEcnk3YmpsRjhyTG10aWZHc2tSV0J4dFRz?=
 =?utf-8?B?UkV1Z2J4S25NdG9GVGl4d1J0NzhpNnIzSExPQlRZUGkyRWN4SUtiSzBFR0th?=
 =?utf-8?B?c1NGTVQva21Fa3FJVHpCdHBVd2hrWHFEb1RIdG0rOUlXTmRBMGErSmJFbWR4?=
 =?utf-8?B?NXpvQmtPbU9sN1Q2Q08yVEgzaGM2R1BNRXhDZUtBdnZnaUVjWlFvMFVwd20v?=
 =?utf-8?B?QlkvL0hBVnZjbVRVUHVNaVU3Q0Q2QTBINjN6clljRUR1SDVDOWY2MUxyNW94?=
 =?utf-8?B?cTRGMlhTZmJrVnl3dVQreThHc21vVXp3RUY5Y3VIK01tR2RuRmFxb2pIa2V2?=
 =?utf-8?B?OU1PdzBybVVlQTFlQVNySXZiNDEwY2JZMUs1NHY1OFVFa09BdmZNTERsVXZr?=
 =?utf-8?B?NW5xRktxeVR1dTdOeCtYQityRnY3WWIxdWJsbGxpck9lZTRWZEl2dWxxVFYy?=
 =?utf-8?B?NFlHdjl5dTh2QWRlbTkyY29ZL1N5Mmd1VC84cDRCdEdHeGluZlRXSTNyY25G?=
 =?utf-8?B?QklPcldKazNmOEY3Y080NTFJRVlEZXd3U25Hb09tRXB1MVYxMGJZUTh4Ymtm?=
 =?utf-8?B?ckRqY0RXYWcyTUQ0YTNUR3FBVXNxakJYWXM0N3dLaUl2V2ZqU1FmQzNFK3Bj?=
 =?utf-8?B?b01CM1dLb1Q2UkwxaGpCMTRIMkRXcUc5bzc3MXNSM3N2M3I5QlZlSnB4UEYx?=
 =?utf-8?B?ZmxUNjFIM3A3Y3ZiSU5TRUkyWUZ4bjVDZGw4YnJvbDV3VjF1SmJjdS9wVURl?=
 =?utf-8?B?MEUyQTNGb1o4NlpkdnJ2WVI2NmxZZ3MvUGdRRS94dWJEaWwrSDB0Vkx4YlJX?=
 =?utf-8?B?V1BuK016ZjhLOVVaVG5zVnRmckhKMTFzaVcyM2pWanB1Qzl5cXZ3TlBIa1R6?=
 =?utf-8?B?cDhZTkwvNjhJSFJpa1paOVJ1UFJrN3Z6WHg3bEtjd0k5NnlreWl0T1dwZjQ2?=
 =?utf-8?B?NkpXWlBtelZzb25BYWpuYkwvRk5PZEduTmpPUE51SFpnRzFHRW1EL2s0end1?=
 =?utf-8?B?L3pHd0tBczh4bCtiREoxSjBmSjdwVXZ3eTNvSFN6VnhySmVua2ZQZm1CVDA5?=
 =?utf-8?B?a09zWFJjYWZOcmU1TjAxTzAvWVNjcmlxNWQ2a0FqR3ZFMk04Tlh4QTdnMjhD?=
 =?utf-8?B?Vm1YdVdCcTdnK0sreE9VSnZJczhHa2QxOXNBNUp3elFVejVrNlQwdURYK2RC?=
 =?utf-8?B?cjFnSCtTZjljM2VxSStYaFJMN3dLcEd5bmpabVV0c1Uvd0wwY0Ftbi9sOXNt?=
 =?utf-8?B?QnV5bEh0cnVSeElDRU55N0JjTVZwNnE2a0VMbWJuYUVhTFpmcWQ0ZytrR3J0?=
 =?utf-8?B?eDN3MUZCZ1hGQmlIbUc1ZTRJUk1CSVVFRkZPeG82U2oxbGZHc3YvS2d3QXBL?=
 =?utf-8?B?djgwUUVUemUrdmlIVjgrMzFBZDA1Y0Z4ZWk3Q1Zxbm0rWklwTXhRdTA4Nlo1?=
 =?utf-8?Q?Jqa+03UsSzQ8LS4OODuZ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5Udi9CM0UwQUlEekkzSytQckNnRHNLQWt3elZuemVtMW9WWjczdHZmWlUw?=
 =?utf-8?B?VmJaNHBtSnlyZzA3S1RwcjdtSnk3TllLUXhnNU9CVC8vMVJQMEZUYTRBTlZ4?=
 =?utf-8?B?Vis5bDF3TCtSelpKMUJoS21IVVV5Tk01by9ibVFCRHV2TXdWTmlkempuVzZp?=
 =?utf-8?B?TStremlGeEY0UXZJVncrYy8vaVRGOHhYbGtXSW4zcHl4SnZmVGNVYVg0YVZD?=
 =?utf-8?B?MExmdXhaYTlKdkttZlJZbWxvRHIxNHZ4enpjNlBJNjRvN29ZQi9mY3BIYkJX?=
 =?utf-8?B?dHJrNUxqNFF2SmdsK1hRTWw3Y1lDUk85SFRKUG1PZ01ydVJPMElkMXhkcHpr?=
 =?utf-8?B?RVVscFNOMCs5Smx4dDRrQkc2Z3ZIaVg1citXM3lkQW0zT3ptcEgxak9ld0tw?=
 =?utf-8?B?MWtiSmZSREtVUXRyZWdVSkt2Rmo4cVFyRXVBak1zMCtuaFYvUWZzcEpqZm42?=
 =?utf-8?B?UkovVjBBckxqV0pRWnNScGRrSzIvWllORFcvVEdJeWVMem5odkZxN2puV0JT?=
 =?utf-8?B?aEZSUHA1V2VEVWlTaStwMXZPZzlOYlFIUFFuakIrMEdtbFdNUUlLLzNJWGlB?=
 =?utf-8?B?b1FmRmVYU0xzQUNkQlRxUmtTekNHd29OdnJEWU0yclBhWEFlc0dkV283RGs0?=
 =?utf-8?B?SWUyQ2pDNFVqZjM0bjhBQk9uNWpMTllhdlR2T0NjSlFtTXNqUy82YVVJK0w0?=
 =?utf-8?B?LzdPMHRkM3JEdUlGcmVuampiMXRCdGxXUldCWUcwNXRCWExheDBla3lSeG4y?=
 =?utf-8?B?UThQTnUxN2IyOUM1cGx3TWtRZ3lPT3FkK215dTdMSXhncGpiMTRmU3JYQ3B5?=
 =?utf-8?B?anFMTHd3dnBQTGRFR096UDZFS1NTNHpJUmF5ekNwbUE0V2hOdnlVWEkwUGhx?=
 =?utf-8?B?cE96c2JIZDJzUk15UXlxeDZSQytjOEtBd216MVZDUzZZZzI0ekdZdElYRXlP?=
 =?utf-8?B?L0N0anpFNmVOWko4RDBFZGZPSUtWOHdXRTk2MEpRK013S3lrSk9jNVo2a2Zo?=
 =?utf-8?B?a0NkMFNERkNiQ21iSlh1UlY0Y0FOTTVZQVRtdHlEYVNTYk1GVUxFMWRTdnhZ?=
 =?utf-8?B?SkZMOTVFTlpqODV2TmdDZHZvM0RCT3YvVmlFSHpSMnVlSnBudXRHUGtBL0F1?=
 =?utf-8?B?YXk1OWdQVHBoMFNwVDRtT2taUHhaYUVyRXFrMm5KbXp6dVd4WndlU1loTzlm?=
 =?utf-8?B?dG8vbW1VVk81QUYzSWpmL0E4ZW9KME5ic1R3aWR5Qmx6TmJMZTZINVdZMjlj?=
 =?utf-8?B?dUpSUHhpQm5JSmVDMy8raWtuclR1aW5ybGFJci9xUXMrZEZEbnNENFFKd1JL?=
 =?utf-8?B?Y3lSU0VRcmg2cUEvSG1McFovQm9ES0UyMG9xZVhpamlNU3ZUWFlDVzRUcEtJ?=
 =?utf-8?B?ZW9wTDJBZ29MY01hVFNXZWJ3cTFzSEMweHBReHczMUNqUEV0MTZEem1yWWtW?=
 =?utf-8?B?RjNUUWZNN3c2clV6b3Yyd1ZVZm5lclptNUNnTS81VndoNTF5RkVUZUZwdHIz?=
 =?utf-8?B?cSs3WThnT2daS0NTV1dYQjh3Uk9tR3ZPclI5ODU3M2hCSGlSY1pIalVqNFU1?=
 =?utf-8?B?RmRBdXBSTWJRWU8ya1J1WmNyeE5GcUhFWmtjNVdiUGJyZHQ5UDQrcFJ5ZlhZ?=
 =?utf-8?B?U2gxdUZiUW1TQU04N3dWWUJ6SERUZThIWnFFeTc1YmdlajBxNzlJRWlxaGJS?=
 =?utf-8?Q?rHnDLoiZ6czuuDhavpBy?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98138df-c56b-4a91-59ec-08dd8ad92bfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 06:59:11.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6360



On 5/2/25 16:45, George Moussalem wrote:
> 
> 
> On 5/2/25 14:29, Konrad Dybcio wrote:
>> On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The XO clock must not be disabled, so let's add the CLK_IS_CRITICAL
>>> flag to avoid the kernel trying to disable the XO clock (when parenting
>>> it under the CMN PLL reference clock), else the kernel will panic and
>>> the following message will appear in the kernel logs:
>>
>> Remove the struct definition for this clock (and the assignment in
>> blah_blah_clks[]) and replace it with:
>>
>> qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */
> 
> understood, thanks for the quick turnaround!

Tested it, but then then the issue is still there. This time fixable by 
setting the CLK_IS_CRITICAL flag on gcc_xo_clk_src. I was looking at 
removing the struct for gcc_xo_clk_src too and use 
qcom_branch_set_clk_en, but there are clocks that refer to the 
gcc_xo_clk_src as their parent. I'm a bit hesitant to tinker with the 
GCC driver without access to the datasheet. The downstream driver 
actually has the CLK_IS_CRITICAL flag set too on gcc_xo_clk as initially 
proposed in this patch:

https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5/drivers/clk/qcom/gcc-ipq5018.c#L1457

Are you okay with this suggested approach?

> 
>>
>> Konrad
> 
> Best regards,
> George

Best regards,
George

