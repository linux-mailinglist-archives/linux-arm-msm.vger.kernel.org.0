Return-Path: <linux-arm-msm+bounces-59367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7E4AC38A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 06:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2473B4F3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 04:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8DF1CF5C0;
	Mon, 26 May 2025 04:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RUBpDtEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2049.outbound.protection.outlook.com [40.92.41.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662761B4141;
	Mon, 26 May 2025 04:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748233755; cv=fail; b=NcWjL3vXCMGLbeNB00FfXvPR1BjQ6E+D9/ZuLx9D/AoKFj9uMMvTLWv1/D/WQuZKL/2GIkjFjOG10vQ2Jc01rNAwVGCxuwXIvPXj8ihXpNHUdn1XbFDavMfA6lqdVDLB9CHkUwwOJMuLk4YQAOwm/0dkv/E4M3azlRqaEND7Big=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748233755; c=relaxed/simple;
	bh=TleH26UM6X3WsMmlJFQLhOMFwjlS6jT2YOd6xt2y3Pc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mFUJw75KBQp5WqYlcimM8aOvT7z3GPBUJG5Ew+loo8tyLLmWx291yv+/hfZEhrMoOQoc9y0xlthqyiqgZnN54NQEiXznf2elN0sqTyKatCdk41/N4dwwcwmoQTC4h3aMB2vky9S0YUPlTIgoulVeNCaBwbG4rmht+o9BXIjxTGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RUBpDtEa; arc=fail smtp.client-ip=40.92.41.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOBZDy36yM7tSCs8EiAb7dZ8xxaiV5SocgApQPFKfaWdNOCRlbeSt8gTNO2PVqk+5Bps/1tX6kGQ69xdF0Hbw5ZOlZxPzwMuuNarBRf76yqDpFfA8cilOIx8yw4Rj8HS1mx4Fa9tnV5pTwADByhBsUScJgibaW1sDuGP5zmUKAtJfe+SrsQ0tSBs9evcvwFgWcS/E07sKJdEErr6sXRJAeiyyf3UG0OM7EkIYQ3SFJgNKP6Woo1+DApLaftiDKrhvng2eIiYKGdeHkj9+sWhAO9cujs1ydTTW0IeIr9hFBL8nQEgRjgE+qVK4thTidKKIDC9BYH1/Ly35e9ZJl87Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDCYH0FFLQiCjsblBG1yilzyPlzQZWpD+RAPT36tyUo=;
 b=GHLQy8zAeHaxb+Akg65jR1mAt+iHGDSbpeVfJcKrZ/5b/qI2My9M2l/EW/zKhVujmHXeGglOAsXObn6kHahn00XZ2+t8uzWCPNRXs/KsePtHIb2ewRwawUtDNzdlSPa2mhrF+q3l4aMpiS4QndKSQbxDT8BTdDiZRxeVwsodJKq2plBlHr8sXUqnE01wldmiJHxeGHQDoapeqaYT38dkzegW5izWv4gLN/sg17Kk7oraVJs/GnHJj+dQMj8dDCJ9NluU3x3rhuQEnxgi4EVW/UhCXT6fhSDQAVBV/gHeeBSvSGq31RNX5LDq+e7KImkzDB44v8mkEln8iUnm08xtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDCYH0FFLQiCjsblBG1yilzyPlzQZWpD+RAPT36tyUo=;
 b=RUBpDtEa27ddNh9I7s1tAq0tstEnTVnzmiNH6o4z0JEpaVN0Kr03tqIZad+hT91oeB8w0keNwnS1ZsKgOeHCf+/HKZ99XGun3S+MMlErrXniKtXzvbYVcXw0upjA3mcP7mYmoY1tdZGb2pt6QBomvmVh52BjhuJicGfbP7ksx1dG9lwLU/kEo9NxokXrKtrrLaL2I7roed88ALvP7zfkaH/eyUgQSTzcO9vZI/gfEUdDqXUSkYcgk4aBPGsPmaNySof+Pf+9aiar9rcuIo/9DBhTRpvWpU/e7Nsmy7fgu0BhJkOvpPc6BVTyjCrlNGqo9hBtDTcCuUhi7FoH5WZg3g==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BY3PR19MB5059.namprd19.prod.outlook.com (2603:10b6:a03:36d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 04:29:10 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 04:29:10 +0000
Message-ID:
 <DS7PR19MB88839F1DBCC15D6BF90B0CE79D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 26 May 2025 08:28:58 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal
 PHY support
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
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-3-ddab8854e253@outlook.com>
 <40b427b8-b0d0-474b-a7c6-46641d1940b9@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <40b427b8-b0d0-474b-a7c6-46641d1940b9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0062.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:59::10) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <1d5acc88-311a-4dd5-bf02-45f4014d617f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BY3PR19MB5059:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f97c173-e5e1-4dab-a3dd-08dd9c0ddc08
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|8060799009|7092599006|5072599009|461199028|6090799003|15080799009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkluRW1icHlzUUdnRm1xcVUzSnpDblJkQVRMTjZjRmFkL3k1NjJIVXNYOGxr?=
 =?utf-8?B?c3JMeE5RbndCbFFTNUhkRURtZWUwSS9MVTJ3UzdvMGswa2Q0MFlWanFMQlkw?=
 =?utf-8?B?NXZiSkRoTGxPdWEwUUc4QTRFWHFuUXdrS2hNNENSaFFyV3JKNTJ3S2cxa3Y0?=
 =?utf-8?B?VW5PK1lyTVQra0tZd0l3cHJIUnViaU9seFdnNHo0a3FEeERCcHQ0YjVQQ0Fw?=
 =?utf-8?B?Mm9KaHFrbFpJODFIM2RiYXEzR2pyZElsSU5pTWova240R3R1eHF0ZmRGa29z?=
 =?utf-8?B?TTJUY09nTDZiWVBiMzBEa0xvcGtkUHBXWDZwQlFabmE2ZlF2b2JMTG9UbXBa?=
 =?utf-8?B?L0Vaa3JVUHc3MXpZeUR3Tk9lTVVEc1F2dUI4R3FZemRGSjFIb3FJMzFZVWFE?=
 =?utf-8?B?UUxzeFhYOHRCUVUrcmFhZU11UmlScG5WMWtsa21ld2VXM2xGQmlrS2tFV1RY?=
 =?utf-8?B?cjFKRUpBYlpnYkJXYXJpdjNENWozSXZhajg2QldUaXhxYWV0M3RSVVJDZDZU?=
 =?utf-8?B?VHA1Mi9WZU45VW54Z1puL3FjYWVhUExaalZnbjZOeTFTTnNFUmtzMkVLSE1C?=
 =?utf-8?B?RDZlZ0xlVk1BVldaYWY1QmFkZzBFSU1sZ1dNcm1UbDRMODQxRG5iZ2dVaDVt?=
 =?utf-8?B?NHVzelorN3gvaFFsWHhOTC8zYW9oL3llaE5uTnAwc3phY3lyNHRZbDhET0t1?=
 =?utf-8?B?bzNrNSs5endkVWk1dWF5OWUzTTJOZ2IxQWlib0syWlFpb3Y0NnY2QXM5NDBw?=
 =?utf-8?B?MmFrL0tydFZnbWM4RktBSlN6UW9EcG84a2pYbnRIVVhucGlZaXVpUHhaZ0Z1?=
 =?utf-8?B?QmExY2pwYndmYWVFSWk1MFdIL0FLMjdPeFdzdENEVDlwRkp5ZjAzVkZUTXdl?=
 =?utf-8?B?YUgrN1lyRDZFTVg0WExxeTFrcW5HNzZXNjNCb2JROXNpeXdPQ01QcHczQzkx?=
 =?utf-8?B?ZFA0ZHhOLzVRSk9Sd1B5NU52a2JPM0R3NFE2YWZKL1F1UThzMDJOVnlyYXdl?=
 =?utf-8?B?VWUxMHZHUUNWREVLZFp5dmpxZTFzdUNtWk1zM2VUcFI3QWxqdWkzN1JrTDRj?=
 =?utf-8?B?NkhVRzRhUW5IQitNamM4VHhRcmtSVUhBT3RwbUN6N0NpdW1rMmhDZU9paEdF?=
 =?utf-8?B?emo3czNHTXZXcW9BZHgyZzlUQjFCRlprV0JXenExaFB3QmVDbWFvbnBPR1BB?=
 =?utf-8?B?WEtHc1NtUU92L2Y3bXZVWUtkOU9RSGhMOUNOZ2xmUXpJYmpHdkVVdXJVYmVE?=
 =?utf-8?B?ZkVqOXVRTkttdm9BYjhuRTZvSW53T0VZTjNtTm9janRNU1J6LzJSMllCanZX?=
 =?utf-8?B?aTlzSGtQZUZMTVE5YUM2S2U1d0tpS09FOGFCQzZwR2d0RUh6U0xIV1R0RERy?=
 =?utf-8?B?elhvWE5mUTJQVVh6RkNvcjEzRkZGSU5IbERGMEQvY2ZjUXZNK2U5QXJpbUhj?=
 =?utf-8?B?dm5RczNJM1JoRUk4elFjTGE1ZjBZZXdrWjBaRDVUSVg0R0hYTzA4eklvR2Fm?=
 =?utf-8?B?UWVvQXQ4TEs2QVRDaFNYMkMrYnI3d2pOV3ovejJTVGpqb0g4c3hXT2QvNldy?=
 =?utf-8?B?MjBpZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVN2bWFnOGVERDUwSFFTR0FYc2txV3EzRjV2ME5CM3FSZEh5cUx2Y2V1UERN?=
 =?utf-8?B?MW1ic2g3dCt6SnM0cjZ3VlRjMHJ2K1o5Y3Rsb05tbkYvNmRtWXVsWlpmNGFU?=
 =?utf-8?B?cTd1R1Z5cTNCaHBYOGVOeUhpYXZoYzZMcWRwQzNzRjBraU13YWlwVHNzK3cz?=
 =?utf-8?B?QWI2R1dQcnZ5blRDVFI2ak9PVWlOVi9JRy8wSitMeDNWSGxUelhwd1pTbEQ2?=
 =?utf-8?B?Y1NkVk5STXhOZ2ZCbHRDUGJrTEpydFhtVmd4ZVJCSGtxREtqaHlveGd1M3BC?=
 =?utf-8?B?bnNSNjNnOTZ5VW41MFlyNTlhSURyVlVOUmdmRUY2cDJuLytTQ1h1UE41dWdT?=
 =?utf-8?B?VUlNdk1VMWFXR3dzREc1bDNTdHJYcG1FV0VlRlhhdEFWalVoZmhoRkxpQWtm?=
 =?utf-8?B?dFFsU0JVeXV5WlJScmllMTVnb2EvMVdKSE1CWnBSUXppQ04veFBPRytKN0Zt?=
 =?utf-8?B?R2xsN3MwU3ZvZFlOY0MzcFIzYkxKUDQ0SE5aVXBDU0c1aEtUUFRNYXFnQTN1?=
 =?utf-8?B?NTlBcmRsSlNSa243VkxpOFJMYWk0SG5hVTFPZmhQcklsUTU4Q0wwS05yTWNB?=
 =?utf-8?B?SmpIWjZ5TkxSRUFyalFwV01uakdoVnpGQmhvWUl0U1lwR21xV1NiRjM0eEdx?=
 =?utf-8?B?S3RXZzNVdHlndFNLaExEUW5YYWhQUHg1Wi9vZms5QjV1YjAyeFVFNi8yS3l1?=
 =?utf-8?B?TWN2MVhvRFJ4NUFOR1p1NGYrWDI5YUdVcFhFMmNJbVhsMTIwbldibWVRVU9X?=
 =?utf-8?B?L1JERXdnWDNNdTBoM0VxUktScU9YYjRqeWpsZ1J1cTBvUzRrOUhOdEJadFll?=
 =?utf-8?B?Y2RiaXJyY3V6QVVpOWhTSUZWT3lrcTNuZmZCNzh5eFFhRlRnN1NCTVo4Zy9o?=
 =?utf-8?B?ZVlWSnE4OEhGVHBrY2Y3UWQ4MStUR2JweXYyUWJIK3RQdURkMjJKR3BBU0VU?=
 =?utf-8?B?NWdXWGkxU3dlY0pwQTFTVUNvQWN0dlVJNmgra21mNU1mRzM1THhya0E0aVp2?=
 =?utf-8?B?Tit5aHh1b0RuRFAwWWZUSytWd3ZkN0lBUEtTczVaQVpWbG5hcXRPMjBrUkJp?=
 =?utf-8?B?NHZLQnpZcmpYeGFJVzB6bmpRM1FYTVBwZWNpcEJHb01kN1FiNEYyQ2Njc0dB?=
 =?utf-8?B?aXJxeUM3MXlIcWphczlqdG9ZR0hSOHNuOHhXTGgzUm1acWlWTExwZXRYVVdQ?=
 =?utf-8?B?b3BqTVlMQnZiWTFmTS8zVXdneWJmSVZaUGdmdlYzcThNcmxvakgvZjNicXV1?=
 =?utf-8?B?bjZ4RHF3NTVvWkVyaEZ4bU9ERW5Qc3djTldiTDNYYUNLUHh5bFY0UUpha0M2?=
 =?utf-8?B?VHkwK2Y0RzkzMkJBeitUVnhEbG54WFVXelhxNHhMaGhVTHFUaU9EVjcxSlJw?=
 =?utf-8?B?SW1yNmJUSFVoNWpUWUtZZzF2WGRsR0FXbjdObEZ4b05ydjA0Q1l4S2h6T0Mr?=
 =?utf-8?B?RWJMSnFGRi9pMElqMWFzTlBSVko4clZDY2FqdjZEbFRPdnAzK0V4cVJwdjJo?=
 =?utf-8?B?cDVaT1E1alk5cmFBQUw1ZWsvU0FFem5JbUdicXFUTlpmd3ZhUGx2TkJCbVFx?=
 =?utf-8?B?OGxzQ3ZtallRRzdMWnlGU05VclVGTmdETS9tNjlLNXJlT2hBSWdJNnlUWEhU?=
 =?utf-8?B?STR6dVJSckMwU0RKalUrWTBuVDZaZ0pWa2dPMUdJTDkzMHRoOVBlM0hUUXJq?=
 =?utf-8?Q?ct42ibblKxo2Q8Df70Ap?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f97c173-e5e1-4dab-a3dd-08dd9c0ddc08
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 04:29:10.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5059

Hi Andrew,

On 5/25/25 23:42, Andrew Lunn wrote:
>> +	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_AZ_CTRL1,
>> +		      IPQ5018_PHY_MMD3_AZ_CTRL1_VAL);
> 
> Using MMD3 in the name is a good idea, but PCS would be better. Not
> everybody knows MDIO_MMD_PCS == 3.

Will rename all IPQ5018_PHY_MMD3* macros to IPQ5018_PHY_PCS* in next 
version.

> 	
>      Andrew
> 
> ---
> pw-bot: cr

Thanks,
George


