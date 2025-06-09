Return-Path: <linux-arm-msm+bounces-60638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDCAD1E24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00E3C188B848
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62222571C2;
	Mon,  9 Jun 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="u/pn3P2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2050.outbound.protection.outlook.com [40.92.40.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E1C13635C;
	Mon,  9 Jun 2025 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749473610; cv=fail; b=HaFR73cLRzf/jglhIVfOC1KKsDweFmd3Qgd4HYhw4y/XcuQYr6QPipUjNAE/7qMaUDr0V2zl8UWCqQsL6VRJ+T8misDX/zRTwLxxz62+xpmrZ46uQuo9wELVXP/LBbh+HzGzp93Nqcm0xUkLDyjZf+3HrlElgvqEO+qr6bHxXTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749473610; c=relaxed/simple;
	bh=9bn6VP+K2HAmRjIqMEjjKIZ44V1Ym8rGLRtvi7dwETg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aK8sV3acs/LMfGM5tMytc+307jsOp+yO8lXNr/u4aM0eaPPWxaF3ZYX0trskeTjAPe6DuXB44oUGxkJdPLE00Us6mQXNHWWeuOwnt3VljQ5zzIlLZbFBwaQHIfjCPcrJ/qQHz3JngjFLFP9Z/SCk1fwlCaXrNwO95Kv4cCaHPYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=u/pn3P2W; arc=fail smtp.client-ip=40.92.40.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFPW7p28dOI/MZCWyYIY9z2Imqd0dpK3p2fQp4XjJctOX1nT4Aphbg1JDnN3/hc5iyGHm6PzKTJ4yXpbjTSnZy894RZ+k6v976Zo3eZAmCUOdAQctHO2yHBim7Hd9iPlyx5PFLWxr20w7rWuvsfPkfeRJdPu3s10HzC83ztgd2+RNctK1mxM/Cb9ARBXN+YDA2paJQPyMBd755K543dkkEAxVWPVCHFFhg7QdzCp9HZetDcd0izdeedODcHeaRgvoCHQLQiI9/5XbCv4cKtb/9l8rtl2kbMX18UfN6Gn9EY/NfOF0SnhovRzhNQpmG03YdyDcv8eneqVhkJt6TAtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MFSQlFDsY3qQpcAbAlJvrZiUGOX1eSwxOkZX4+Y3gs=;
 b=jOTcSYPJ4xBxn6Q9WVLHZ8FpVChBNmPKd9mxSIxDT/dfs4ny4EGxFarxpcVRbB5JL8ykS97R4JfPdyDi77cNxdKQbqw6HR9wylDA1Nc28XkZtt/Iz20YnC7i6ve3Wh+T0WyA/tpcyTFdqYY4Mk+3cR+vfiIi2pxCNMYAd8nn3xszFZRQztcuAg4RX8ki1v7DjvIuHBPXo74mpDMQasoA4WsuPVJRGUnmcqq8T3W67O7oB3lXS/K3j02DvJoQekAQLQu+MsoZ2j2qWA4LioibizqD0SsyLFlaK+xddiyF9AdwbEhNJSMH48zM//F0spILULHiDdJb9i9yKCi94xjqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MFSQlFDsY3qQpcAbAlJvrZiUGOX1eSwxOkZX4+Y3gs=;
 b=u/pn3P2WwKhBPAd2HPpN00xlDnWK5pBm6aB7nzTn9ub8nW9RY5imoL42imkThjMSfxX4OtxfcjYNVgiMDDtB/MlPugWqcpRHii+/Gn0OqQ8KQJPuSwuG2wD0xIRUxCqYe0nr98LURJOTXnPFp/23imj8+OOt0QoqTknZn6n4duoX+27MOCed7hK3ab8h5jyJa7C17qyW2suD24GjihSKCCQmoWgm1f0EQ3HklHRC9swMGrheK7t4qlhSmcE61wqSWIErQpb9U2xWEv67/vOOIz19smTn3rBwycAisqA/qwr9Dt8+BZ1kMia0fC7MAN78lAi3ev8YmvY2ToQUQSVTVw==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by MW4PR19MB6981.namprd19.prod.outlook.com (2603:10b6:303:21b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Mon, 9 Jun
 2025 12:53:25 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%5]) with mapi id 15.20.8769.037; Mon, 9 Jun 2025
 12:53:24 +0000
Message-ID:
 <DS7PR19MB888335F938BA5A8F19FAC8F49D6BA@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 9 Jun 2025 16:53:12 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
 <20250609-ipq5018-ge-phy-v4-3-1d3a125282c3@outlook.com>
 <a46bf855-e9fc-44c4-9219-7d91651b30d3@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <a46bf855-e9fc-44c4-9219-7d91651b30d3@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0012.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::11) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <391b9e0d-8bf7-44c6-8b85-6367a5e610df@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|MW4PR19MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a2096e-3179-4fbf-1b55-08dda7549e6d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|19110799006|5072599009|8060799009|7092599006|6090799003|461199028|4302099013|3412199025|440099028|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2ZLSEpZZzQzWjE4bm9RQ2RuYTNWdHplYVZkZkVlakUydVFoK3VnenR6NHhn?=
 =?utf-8?B?a0ViYWc1SW92czVSVGhvN01RVHQxOWlqcGpqdjd4Z0pUZmdBOUJGMWl0cFBW?=
 =?utf-8?B?bGtWZWNsYjI5V1g2eU8wY1FZYUVCTFRmS0VRc3Q4OExyWVU5T3lpQ2RMZXdz?=
 =?utf-8?B?RnNlaUdaRWtNR1FscmR6aHcyM0RaWll3WWkwYkd4Nk9QaENvbzhzYVpYaWVS?=
 =?utf-8?B?bWpnbE9ka2hGcm5zTUlmeDVnNzlJV0lrTC9HQ0JUWU93eHRvcG1ENDhyN1ky?=
 =?utf-8?B?dDhXaUdYZTBHZURuTFNHNmVqaEVXWExMY3BNUDBnUUFzVWlSeEpFdlhGaExO?=
 =?utf-8?B?UjgvR3lqV09rblIxeDVFZ1lDVDdVTGZ3aDZ1QmZQdW8vNVNjam56L0dPd0du?=
 =?utf-8?B?MG1HNHRaTTVhSlNhUzVrWkE2alZoOFNtbEJBUnU4MThBeldlOEF2RG5LaUhm?=
 =?utf-8?B?NG5KeDdtdU9mVDBLNHdLWmx2NktuQ3gyRHNLTHpxSm1BTWRtOHhwRldRWENM?=
 =?utf-8?B?NGhueTdCT1Y3Y2E3ZFczbEpWS05PbjZ3cFB1V25vcnJQbmNRQk12VlVLU0o5?=
 =?utf-8?B?YmRUSFI2QW5PQTNuTHp0YVhYWkppVCtZQWpaZU01cVN0VWlSc2puTSs5Uzhk?=
 =?utf-8?B?Wlk1WUpTbTdNcThRRzdObEtTbER3eThnb3J0RmdnTEtCcWhJem9nV0Y1Vi94?=
 =?utf-8?B?cEJWUU05SThzVVBhU2x2OHlaU3BJWDBpRko2U1MrVGdjbnRySE1vR0xGTFZp?=
 =?utf-8?B?T1ZqUS9YNFl4MzhNaDZzWDRvM0wreXFpSExiU0QzMmhzYTJ0QzNmUDNhYmd0?=
 =?utf-8?B?dXYxZVAwMmExbHpnSmcyOERHVVBVMVNqZ0x2ZFhSeEU2ZmFlL1ZEYjl3cTl0?=
 =?utf-8?B?YUtRM2RCTlN0VU04WDZweXh1d2xJeXhMdzRUY0s5K05CVEZTZHJaS0pSblVP?=
 =?utf-8?B?RE9scFpaRHQycjEvYTRiYU9keVRQZFg0OXpLZ0s0MW9KWDBkN2p2eHVZRGFs?=
 =?utf-8?B?R0ZwWHBTRi96bUFnMjJiTzYrSDZjR2FFamdPelBWT2Uxbkttd1AvdUozdkdu?=
 =?utf-8?B?VlBtc1Z0Z0wwN2Y1cDgrKzNTY2ViKzNmWkxNUTVsOXpIeWRSVjRNeDNXRlVX?=
 =?utf-8?B?SUcxSktoRkVBMENMRlVUNGgvdEt4aGFCeTE1TnUwYTY0bDFoTFFkY05iYTJu?=
 =?utf-8?B?ckt1a1luVk1Kenh0WHJjRWJkWTVNbGp1SXBIRnBOOVh6UkpSMmFQcmZWWXJz?=
 =?utf-8?B?UE5MMEJxdWlxc283Tzl2OHdBYTRxZm82Vzh2TmVDVEs2ZEw5NDZhdHFyRENE?=
 =?utf-8?B?S3FselVWUTJqV24rWXF3ZGs5OENBVWUvR2syYUhrSzRYbmg1MEUrMjZZSmtO?=
 =?utf-8?B?N25wc0ZWNzYzREdPdktqYjRZWFc4RUF5cHRrT21FM0lJaUltU3ZjZGhUVjdp?=
 =?utf-8?B?NkpQeVZlWHR2cG1ZbUoyMFNPUmlIeDBsOEdOSW9OQmpqakRpVHRXR044TlRz?=
 =?utf-8?B?QnR2aC9OQlE5SlZUcVN5ZWllcXFBUS82TXN4TWNUSXNlZE56cDBHR1NWR2xr?=
 =?utf-8?B?dmdVenNmOHZCL3ExOGgvWWdXRlI0YUs2WDB0K2pxcWp6OGRXdW5HbWoxcUtB?=
 =?utf-8?B?S2VuWDZRbHhBMnZ0akhIcFVHSnM5N1NDNDh1YkwzYmkydW11RERpaEdLb2l2?=
 =?utf-8?Q?l9YLmEm5WlJtepmPCt5O?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEUvUW5YQzNycjl1R3VqamZhdkxNL3Q2Qy9wQkVVR0VqQ1A2RDdoOHZGcVFO?=
 =?utf-8?B?bm9aZ3dMZENHM0hxYUVEU1l0bzR2a3UyL2FNZ0g5aFhBTmxWT0NkYmZIbys4?=
 =?utf-8?B?bzA5VDZ2d2xWdG1VT29pNEtaWEprSjRuQitWWjFqcEdZY1FrQUkwY1J0OVpQ?=
 =?utf-8?B?N0oyQWxLOUxUaXZxcmFvUkRXOVhNdUFhNHhVVERXQW1PUXlLWUdsMTd2UTZC?=
 =?utf-8?B?KzF4S0tWdTZYdkNoN3J1cnR6YXhUWkM0N0VGeVlXUWpNbWw4Y2VNN1BqWXIy?=
 =?utf-8?B?VnptOTdKQmVCNXRtTVJsbEdWR3VTeU1rNUIwTzVvU1E1dTFzTnVuY254c0FI?=
 =?utf-8?B?T2ZhUzlUdmluQjZkZzkxb2huWXRtZkZ1NnVHM0pZL0xXVVJ5RGVwWHZvZ2s3?=
 =?utf-8?B?SE90THJNdXpTS0U1b0RLU2krVzh1QlhIQVlydlRaNk9WRlVZSWxtVUNkVWFi?=
 =?utf-8?B?dCtONG5OaDFER3dTNnhMWVp5VzNHQVplZFB2dHQ5Y2p6c2dWc0loTzdsUFRw?=
 =?utf-8?B?Q0hxWGN6Q2Vjai9kQ1lOeDJBU0paN0VYS1JVaXB5dEU1c2IzdzdyNVdtUXkz?=
 =?utf-8?B?UDRqNi9PRUxpenltSE43cEllVzZ6RS9xNENldzJmVGhmNitLQUJkcko2TkxZ?=
 =?utf-8?B?RVZhNExFNzc5K1hSS3R1WkdwK0JZdk5hT0luazI3OEVDNkMrSFNuRVVWeGp1?=
 =?utf-8?B?dWN3ZEdGTXNxbE84amdzNkZhT0FpRFhWMCs0M1NXWUlkc21uNXlMdk5EN0Fn?=
 =?utf-8?B?MkJQRkUvR25MNktxVzVvN2tNdVBwQXpwV2ZTZVY2aWltYmFmcnVOYlkrR1Rz?=
 =?utf-8?B?M1NBdldaVGVJSHVyZCtxeGNoL1J1ODRMYzVXSzhPeVR3bHJBYUFLRTZVR3VU?=
 =?utf-8?B?OWVxOHB2OUV5UUZZWUFLcittRDhFdS9neC82UDM3c3ErSGRNUmZxaEtlOGR2?=
 =?utf-8?B?TFdWTnRzanBLeWE5V1dXQWNEbkRrZ3A1bDB6MkI3dUY0TVJsUXFxVEtWTWxQ?=
 =?utf-8?B?dGZlWmtuRFZzVzFLbmFGaTNDNW5TbDdWRmxKeVpxRDN3UkpZVEVVZVNERFdh?=
 =?utf-8?B?VU1XSlJXeVFDU0dRc2NZaVJ0OXZGTHdyOE1Ec2c0YTFwUUJsOWZJNVdUT3ND?=
 =?utf-8?B?eEd5S3VPbk9KVVkzVDR6OU5aVVNNMVpya0QrdFNiZW54aVpiczhGUDJWS1hH?=
 =?utf-8?B?K1c5bTlqREhtSjc2d0IzOVpkb2xGSU85OWVUV29kQkQ2WTFoQ2lPbitDSVlM?=
 =?utf-8?B?SERQcnQwVkJ1UWo1L001eTEyakluYVVUK2tIQ1orSzVxb3VYSE1DSCt5WEFY?=
 =?utf-8?B?azBYR2dsejFxbXY3M1lqQXYzUWNjMUhRd05kLzJyM1cvNDRoOG1sb0VGd0pq?=
 =?utf-8?B?TEFVSEtUMU9YTjdsaFpjS1FDTTI5LzRpcFRoeE9uK2Vtelg0eER6NEZMNEZs?=
 =?utf-8?B?MnVySUQyZE9vam1LVmZNcFVFbHRQSjVlN0pSUHp2a2twbnRiOU4xWTlxalF2?=
 =?utf-8?B?YjZwTUhHdFdsUDVHMXI1ZjdzTU5yWDBxLzhpY0FNMmFMYVB1TjIrSG85MGdk?=
 =?utf-8?B?aC95NzlzVTR3MDErTGk1aTNrbHFzc0laLy93cVFwUHBlRXl6TkZ1WmRtQTFS?=
 =?utf-8?B?WVdrSEFVUlA2MGwvQ1ZnMVdKZmVlaHkyWTJZVzZSQ1ExaWhULy9xd2lCYzJK?=
 =?utf-8?Q?++Rq1HYD2g1Hz8JZrrUd?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a2096e-3179-4fbf-1b55-08dda7549e6d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:53:24.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6981



On 6/9/25 16:24, Andrew Lunn wrote:
>> -#include <linux/phy.h>
>> -#include <linux/module.h>
>> -#include <linux/string.h>
>> -#include <linux/netdevice.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>>   #include <linux/etherdevice.h>
>>   #include <linux/ethtool_netlink.h>
>> -#include <linux/bitfield.h>
>> -#include <linux/regulator/of_regulator.h>
>> -#include <linux/regulator/driver.h>
>> -#include <linux/regulator/consumer.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/netdevice.h>
>>   #include <linux/of.h>
>> +#include <linux/phy.h>
>>   #include <linux/phylink.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/of_regulator.h>
>> +#include <linux/reset.h>
>>   #include <linux/sfp.h>
>> +#include <linux/string.h>
>>   #include <dt-bindings/net/qca-ar803x.h>
> 
> Please sort the headers in a separate patch. Cleanup and new features
> are logically different things, so should not be mixed.

Will do in v5, thanks.

> 
>> +static void ipq5018_link_change_notify(struct phy_device *phydev)
>> +{
>> +	mdiobus_modify_changed(phydev->mdio.bus, phydev->mdio.addr,
>> +			       IPQ5018_PHY_FIFO_CONTROL, IPQ5018_PHY_FIFO_RESET,
>> +			       phydev->link ? IPQ5018_PHY_FIFO_RESET : 0);
>> +}
> 
> 
> link_change_notify is pretty much only used when the PHY is broken. So
> it would be good to add a comment what is happening here. Why does the
> FIFO need to be reset?

in the downstream QCA-SSDK, the phy is reset when the link state changes 
to 'up'. And as part of that sequence, the FIFO buffer is cleared. I 
don't have access to the documentation, unfortunately.

Link: 
https://git.codelinaro.org/clo/qsdk/oss/lklm/qca-ssdk/-/blob/NHSS.QSDK.12.5/src/adpt/mp/adpt_mp_portctrl.c#L1150

> 
> 	Andrew

George

