Return-Path: <linux-arm-msm+bounces-60592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259CAD1D10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13B597A1167
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2991C253F1B;
	Mon,  9 Jun 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uv+qHrCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02olkn2028.outbound.protection.outlook.com [40.92.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3457FD;
	Mon,  9 Jun 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.15.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471632; cv=fail; b=nrqq4sBS5MEZ6d9FJIBy/UvFzN6hYsH6V5ltrsjvEI/32RcoMSaOqp4v94+MzPEuqhZSFGhSxZ96hYv4sDE70poMcQZre5taJtcklVHL/zUCUCFstPz9d/qdN6uZSfS/HdBaTJsBaxscSoulh/ywHZxOPkUckNRCx4y3iVuN/Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471632; c=relaxed/simple;
	bh=dCzaf2RsUtgkqHumXu1TxLmAZ7oGkKMNACC9dt7HZho=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e83OJ9+yThQRU10xW6JyuGF3sU8DAio/C1YsPDo2idrbKr53gZzMSDpwE0H592Oysb1IiBKjYjIFd13O/o5D2LuS0c7yGVnIopQxgFbX3jkDn8f4q6zJ64hd3LujdhbgXYRVUfXNMLiktSbAUe7jYnDkuNO3Cm5ck4L2G36cc7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uv+qHrCP; arc=fail smtp.client-ip=40.92.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCC42kF/m6Sl+iyeXcC4KxTPQ51ZG4Pa4B6/BNoEs+yDz4NzEuMClvNUnfsm/6rBGmp4msB9DssMgi2fDobPJstLiNB1iqbwMWva5h9XXoeoTPLobwA360Y4rCPABPPxvhKQB8sA7vMwJGZwggPegbeTChAj7TQ8DP12xH/JKGsLa322i2aNuy8BTG+UBn0nusp/UF85cyBKZJdaQRGhJseE+xd98/9skGgVDcvrfat+RYZ4q2kS1LcSp/Ggzn7YmeWLhJIsXnFbvrwtIXHuzEPM3loTbDVVYBTDUPdsWdykDpLzB5eHIPXC9nrXQw5L32MeahcH2/lgqNw31nYVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz8ShUxBL0t3dVR+JztTEQ+G7Hm83fWWFdXI3h713iY=;
 b=LhhFXbin8zSaEQT5G8+VSePUFHd1ubgmYf29Uik90QjbgLF44Bt32Hm8fkbWUoYwsDD2xXpGM7jLz9jWtIiTDdf6DN6ObYuYVHNTHE3zBD1ou2D+zE/k1R0C+fY4OMzhY9ZVM15q2P1BtEdO9zW8x28P+h0GKUTSXjWfIx9LWOxtdM5jH7iB8ku3cAGUa7Vmk9AwCQYFJboMg3XJ58hNkBdPmJ2Biy4bdwaN+jr853ZOJtZSJPLBOGXSKroFoMGn4nf9Qfz12w3uLy7aweFFrD89anqHqA3mROGeoBF68RPTYsUZ5bEohVpRUSaRUcPmALuqUre2ZMGohn3eXT1IVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz8ShUxBL0t3dVR+JztTEQ+G7Hm83fWWFdXI3h713iY=;
 b=uv+qHrCPtF5U1V1Nd2XY+k3x5+nC/bvyY+fiQ8LLVAtGj//yyEa9/LBXTMS0NfZkMIZsIlDzHv5gg+qa+gv+0faXaxLdtqzQPBFANg0g6i7SGhy5JXoDPl9SzYuNKxcJ6nw1NPbmc+9FVyHPhqP8X4hVcusEhuIkTgJNJzmkWe5ZLII5k9WyiuXQUJJNKkvmHQl7fPt8D6wIporTKYt68+esTtlg2+gNSn9/NLrAwcQmbEcLo5JoU+Uv5UA6Y2boWo5wS6jIBO3H/0+nqxVs/zKkk41r+BxB0xYn00Bm3uyBHbwNn/qij7rRGmg6W5UYYUzSgnd5DuFFWcsfcntw1g==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SJ0PR19MB4746.namprd19.prod.outlook.com (2603:10b6:a03:2e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.17; Mon, 9 Jun
 2025 12:20:26 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%5]) with mapi id 15.20.8769.037; Mon, 9 Jun 2025
 12:20:25 +0000
Message-ID:
 <DS7PR19MB8883447735B1E7E1BE7985A89D6BA@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 9 Jun 2025 16:20:12 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
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
 <20250609-ipq5018-ge-phy-v4-2-1d3a125282c3@outlook.com>
 <6bf839e4-e208-458c-a3d1-f03b47597347@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <6bf839e4-e208-458c-a3d1-f03b47597347@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:205::42)
 To DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <4402fdd0-ff24-47c8-9ee2-461d99350927@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SJ0PR19MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 25034dd7-0537-4780-baa4-08dda750031c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|41001999006|7092599006|8060799009|6090799003|19110799006|5072599009|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTY2UGwvUnBvRjdpT0NhWTByMnkrVHF6c0Q3VUhWRERuUGIwanBiYVEvS0JQ?=
 =?utf-8?B?a0xGekIzK0FDTDNxWm43d05qMDBDLzhReWhaQTJsTkRwcWhLYldENlJpOHIv?=
 =?utf-8?B?UHowSk1XK1VVRmpZanBUZkE0YjFJZGNZZlNvMVZJa01wbEt1OS84QmlTdGxs?=
 =?utf-8?B?aENaSEd1cnRFdi9mQkRGTW5pbEJkbEoxWEQ3RWJnQUM1QngrQitrVlRscDRn?=
 =?utf-8?B?NVEvKzhlelJzNlN1TGF5b3FjSkYvYnpGUDl1NGV1V0RCSnQweFVreEhFaDZK?=
 =?utf-8?B?TndtVlc0WTFSc1hOM1pIZmNYRmdKSXErLzJTMDg0cDVMeWRYWEg3R3BCNitk?=
 =?utf-8?B?Tk5CRk9OT3VNNVZIMVhkTjlEc3pTWkZyU0tXMUZ1aVpKYmxXWktMblZYbWdB?=
 =?utf-8?B?WE9jMzQ1QXBERU9hV3VSbWdiUFloNXhmdWhrYjBoTUV0UkZrRGxWTnFSL0VC?=
 =?utf-8?B?S2JvWVRObTJCdGxNYU5wSnVMWk1JUGFmaFIydFYrZVdUc3JuNDZ6Um84VGUr?=
 =?utf-8?B?WEVTampTc2FWWnFUVEhMM0VIODd0V1NrRmwwc0dPUmF1eHZobnhNVURjdjl2?=
 =?utf-8?B?ak1iSmR1bHVONjFZajhYcUJsSFVIMnF4VzE0SW5jdis0dmZ3OUR4aVpyWXZL?=
 =?utf-8?B?SXVEVzcxZ2Q4MFdVM1RMbDBMSndTb3VhcDVEdzBZUmFXNmNJOFlrSEhJZDdm?=
 =?utf-8?B?Z0t5Vkh4VDNUY0JzSzRYaGlVMkVHQ2h0L1I4ME1MV3Vzb2ViNE5PeC9LWXpD?=
 =?utf-8?B?ekpxcGY3UGxzVE5iN1hqSVh2RHVrQWdIOUNzakFyVUxBOHFrb1hMdUFEaDhH?=
 =?utf-8?B?TDVhRzBVYkdyLy92bjNYWHo3ZnFjWkdzcmVXZUJmL1ovVFRIbHRzdFRFRXBR?=
 =?utf-8?B?WnVsY2F0WWNRVTc2ek9DOUZBWlR1d3NRWlBGNEVlcnlWZ0h1eXNQM3ptSUVp?=
 =?utf-8?B?bkp6aDYzaWVBVzF2M1p2VFN1dnh1cGdySTNEVTV6TDNLUjBxUUFaL3UvN0Zz?=
 =?utf-8?B?cjlGZ3hwU1pWYXBNeE5ONlVKU0RuMjVKV0ZNS2hXdzR6MzRaR3QySTFGT3ll?=
 =?utf-8?B?Ni9kV3dPem8vMkJmU1lqOWhBNDN2UG03Mk1PKzlWa0NQeENkRmZQSmVKT0lq?=
 =?utf-8?B?ZkJWTmoveUt2SGprMWRiR1ZoWHdCQWp4ckxvRWpPazM3cWZ2WTUxdkU3TkJR?=
 =?utf-8?B?YkVHUVg0bFNNeVZaVzFWQzc4RUJzcVZRWFBKUU5HcytvVDB2cFRCTEVrQkhP?=
 =?utf-8?B?MEg3NlNWZWxzeHk5Qy9tTU1SL0tvTVMxb05PM0xHSXFpaCtiTmFkUFNNb04z?=
 =?utf-8?B?aGwyRTE3N3lvREg5cmlmNDhNZFhSeEhQeEFWeE03S0JHY3NmQ1BhSHdXWmgv?=
 =?utf-8?B?bXFBNDFsRHErWmNVQmtrUzAxMndkZ2N2MG05NUNVNnBDSXFoUzBEcVFYTGFi?=
 =?utf-8?B?Rmo3YXRLSGdGd0RSVjBnbkNLYmVDV3NLSmc5ZThmeXZqTzVjYXpPekFFa2Nj?=
 =?utf-8?B?Z2RReWcveWtKSXlJTllRZ0Q2MCtNaGlreS9QUTVDNW40emY5Mys4bnArZnR4?=
 =?utf-8?Q?08Oyh39y3FLyb/Tw6A+a8oLHs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkRzVjBDWVFvZXBmaVdNSitzcW1WUnMxZzA4T3dyUFRMd3JQVHFTQkFmR1kx?=
 =?utf-8?B?dVU4VUVLeHY1anRXcXlQbEhJb3dWTkVmNHppbldxN0RXS3kvV1JSdVFTREdC?=
 =?utf-8?B?bHY0MVRxRWxiM0tRd2VEb1VxNFFPVWxWSnBJSVNIY0VFSEV5Y0RtOXFkS3Vi?=
 =?utf-8?B?TmxFdFVkMlJGRWc3RjBNcEI4TXJXdk5LZkd0NTZMZ3JVVEs1TFV5SW11dlU3?=
 =?utf-8?B?SXJpZEJ5VHJ3N01obTZTL2xLMnFFM1VFRGRET0YreWFERUJndzEySVhveFRp?=
 =?utf-8?B?UDRKbmJtM01SVmlUeFBEcnlscGdBUzZuQW5DUHdHQU5saGxlODFFRVg3SWRC?=
 =?utf-8?B?UkFyemtaejJxU211RE4yeWlUWWNXMkk5ckNBYUQvOFhaVEYvbGVUUUVKMkNt?=
 =?utf-8?B?ejFodXlUYmxPM2pCdjgxTFJwWmFpWWV5aDFxeGRrTjZnU2U3MUl5TlRhQWNW?=
 =?utf-8?B?cTFvbW83RVUyNzduRjJvR2FqVmlMU1E2UXEwb2hxYWFIeDBUajZ5OFNkL0VC?=
 =?utf-8?B?Um51dmZyUVNiS0JtVEtSeXJOcmRpWkVrRVBQVXU3WG1KRHQza2t5blFCQ2tx?=
 =?utf-8?B?RXJMMUFZdkpTMWlQaGVFT09FZ29WeHFJNVFBbHlBb2R1Zzk0ZFpyMS9LUk1V?=
 =?utf-8?B?VG0vbVd2SzRtZkk0WWFaalVzK0UxSHV3WUhLOWVGaE9rVmhqemQyZmVKVENo?=
 =?utf-8?B?OWhJMmcxbjdHQzNlelJVUVNSd1ZvenJUeWFQR1N4cWVPeTVhYzNLZFZoVVlp?=
 =?utf-8?B?S0oxRzB4UmFTTDViNHk0V3ZHZGR5R3RRMW1jUDh3djFOSXVyN0Y3cU9WM29Y?=
 =?utf-8?B?NUNEdWZOQmVwcHNzRjQ0ZXdDR3c0WHdtK1JXbHdJZG9mS2JITGZxaUlGaG9h?=
 =?utf-8?B?M0xsWVUyWm1hMkZBWGEzNVFPc09JMTJxelFWb3FmdUNSRFVQM1htVWlMUU9K?=
 =?utf-8?B?V1YveDl1bGxGZjhoY2pHOFkrL1c2Wm9ZendTWWxSZ2dwa2RIWE95VThRdnBE?=
 =?utf-8?B?TUlxc09yRTVJbnc5ZW1lc1JUWGxUaWo1K1pQdisvMitFNnMrQmN3aXdxYzhm?=
 =?utf-8?B?WUtPTkpQNXNzMmdRTEFvaE5talNqSVdwSTNELzVOaWNNRGxMSVoxM3lRaTlt?=
 =?utf-8?B?YzBlSnNiUlZZK2VDdVJGWi85RGg5NFg4ekdXVG5jV29ycFdxTmxoWE1YUHpr?=
 =?utf-8?B?ZlB4Sm9PQU1IUU9uNnE1YTRhamw3a0pjcGlVWXFEVW9UM1ZZN2R2WlFqaXdL?=
 =?utf-8?B?VWVKdCtPYmxCVFJURkRicTYvOUliR0M4WVNrNW4wM01ScmlXSlR2SlBjamZq?=
 =?utf-8?B?MkN5ZTAzbTlMN1Y0ZVFGTk9CdkQ0VHowNnp1RGRYZVozRStmNXk1NU1GL09Z?=
 =?utf-8?B?YXU0dWZzZDNTUFVwT25hTnp6MXBkc05paGo1eGZabHhnQmp6YTJRd2xmTkR2?=
 =?utf-8?B?YXNvUUN5VUVLTEdxMjNORUttR0VyOFdZRFNwZXBqZTg3Z2NVSlFvN2NUVG5U?=
 =?utf-8?B?L0tDWHVrOEdLaTBXekF2eitJWlRReVZzRHIvK0Fkc0hnNzU1QTNid21MVkVH?=
 =?utf-8?B?bmJ1WndGSXBRVzNqZzd4UlVETHcyS2kyNDlvZitRL0xyTERnc2d6V1lIM0Vr?=
 =?utf-8?B?WE9IQmQ3NFJjRCtwVFM1RkcxNlIzRjZWaWYvZVBzRWxxWnAxZTJWZkwvZ3hT?=
 =?utf-8?Q?SadJq6pJkE4SlTpalAfZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25034dd7-0537-4780-baa4-08dda750031c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:20:25.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4746



On 6/9/25 16:16, Andrew Lunn wrote:
>> +  - |
>> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
>> +
>> +    mdio {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
>> +        ge_phy: ethernet-phy@7 {
>> +            compatible = "ethernet-phy-id004d.d0c0";
>> +            reg = <7>;
>> +
>> +            resets = <&gcc GCC_GEPHY_MISC_ARES>;
> 
> What do you mean by 'alias' here?

I mean node label. Since it was asked whether it's needed, I added a 
comment to say why, so that boards can reference it to set the 
qcom,dac-preset-short-cable property in the DTS as needed.

> 
> 	Andrew

Best regards,
George

