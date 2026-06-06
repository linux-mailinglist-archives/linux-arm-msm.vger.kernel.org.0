Return-Path: <linux-arm-msm+bounces-111471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DnKyFvL3I2rv0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 12:35:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD464D19A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 12:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="oB/uDkBQ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111471-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111471-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48BAC301AB9A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 10:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B859F384232;
	Sat,  6 Jun 2026 10:35:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012068.outbound.protection.outlook.com [52.103.14.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863C382F1E;
	Sat,  6 Jun 2026 10:35:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780742126; cv=fail; b=shXOZMOXC2xO7X8jVLlEd2hz94e5epJz07DOlStZIw8bOBdru0g9vRE+vX6QKUwMb3UbmJo1z5bc+tkXXgzPp8yuVZ5Y/LSDverChlWNy7m8SnuF7BM6/L6WCphqHYIKIfqCM0m0P64s+/WFBkDctVrwP0nmFWvhXCVm5tidSNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780742126; c=relaxed/simple;
	bh=z3EMxlVyW33syzMzVFpyHHpnE6lUA7Bez3PwfNrEvSM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=azKymWZq3zR8A/i2ntGcs0CsUiROfLrP2yQbJ0iT5gOwB73QQ+0dufCCuSMqxuWbg7xdZtPud8CDEb85vG5QTS6UDrcDEBzhC0kOdVdyxK+NovBvA6prN+7julUxV9VWwA3lSLUl69LZ3gNQ0A6YB/aAfpRJBEXJsDww5ajtdOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oB/uDkBQ; arc=fail smtp.client-ip=52.103.14.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRUIYTk0MbGI84W1Ls/ysEAsuXq6ILOkNzImsacpSRuHWTYY8PrR9pcRl4rTV65o4mmAw/fbPoRx2Pi9iP8TazDnO9PkXnNliShjQ6K8CbVVW/MJRX80ddIwUxdLIPQCitdo/e/clZkTkGi79iNiklHVQyTyMi0I+CxyQKPWI2VdTDMtCJWBb2kk7Q7HwrnEG9mED1sB5jaFX0D0jP8HW+9PGyZJBuwJjUHH6hAp9Fn0OdH8tZA+/Uh5AYfTJrcwJ3Tx5ihKEZGNuX9OwoviB/DWIicrCI4qgs84p3BqB9nI+bQljvzC8Ls1Qw6cqS/SCQyIdZ4g7vVaVcuQN5gvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kGL0Q+WxXtzzdixAU2U0TU8i+mfTvtgqewXRXNFDPI=;
 b=saCujehGeeceiolXyJjbGrj189tvxG24MYQblCXOldi4j+jBmGZwQUO4bZMRg16b32NjBu75UWJnmKWI4jizKywyV8Xz9xlRUbEfKtf3ETwLJlflwxg5jrsweHzKZuGZxt2GwxoaneabDfxvn3GL4AjQ8goJFAhl3/0blKCG/nMKkho+O/BRjs6yNUM3mHTzsq29hkSk+lmJzz1o9pnJFabMhQjo+1L6BqpylDG7jQ7aJ8xJYtQxL6GufkAG3mnbXX3love4Bc3a3zbRMFNl1KAKVPxphmj92pv0rm1BQGvlff8GkBSoyynNw/lokNdIVR2c2WOfsyNCkobqkA6yjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kGL0Q+WxXtzzdixAU2U0TU8i+mfTvtgqewXRXNFDPI=;
 b=oB/uDkBQzdNsIeSOZF1Dzi62pEQxyNaxqnGC7W0RcxxUw8k6EAzlZ4flOm2kh699mjYDIrAvXegOf2INtOfRB+Yw0AG91oDqnXLoec8b4gv5vcT7IrKUxjG4G3Gp8zlR/2+LYWqFonF/tyX/XG5lMl17xP65nIzZGk2duRIMHhnkRd1sONNbvvTci2vCcYI1knkWsIcKpi+O0j75bkFWhBIIKHyt0K21bFUJS1iw4cLHGxFCz1bwyUQRt0JhA8CjpMZrTzQnCbVrxOshIvEco+7XPRIJiqgdN8D18SxzdVU4aMs4U/5vng953dXzdD96gFCgxc+vtTLUXZG6Mv/EKw==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DM4PR19MB5978.namprd19.prod.outlook.com (2603:10b6:8:6a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Sat, 6 Jun 2026
 10:35:22 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 10:35:22 +0000
Message-ID:
 <SN7PR19MB6736B93ECA27FAB6A990B5539D1E2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sat, 6 Jun 2026 14:35:13 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
 <36cd63f4-749e-4b09-b8a6-cbf6924dea88@lunn.ch>
 <SN7PR19MB673634FEEF98FB8BCBBB15979D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <471a21f2-7ab0-410c-861d-5722a94b127d@lunn.ch>
 <SN7PR19MB67363B4F852FB37071637A299D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <afdced5b-73b9-4214-a94a-c13fadd39dce@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <afdced5b-73b9-4214-a94a-c13fadd39dce@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0008.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::12) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <a80aedb2-bdd8-4e61-8ca4-f8a660f43e07@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DM4PR19MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 5480384f-3406-4a4f-627e-08dec3b74ffe
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|51005399006|5072599009|19110799012|23021999003|15080799012|8060799015|12121999013|6090799003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3JrSVUzTmxWU2s0TVMweXp1ZllWb1pXeWVFRzZyS0d5UlRHa2dUb1VWWUor?=
 =?utf-8?B?aWEyaVFRdjNyV3F0R3lRWWYxcjRCT3JYZk4rd21GenBycGRmdmlSNVNZNFJi?=
 =?utf-8?B?QXBybDBPc2tGeks2dUFvaCtVdmdVbmIrNHdSS3M2WjQ0eU1ka0VqQWUvV1dw?=
 =?utf-8?B?cnlnM2JZZkkrVFNmWG5leEhIa2orOEVqRzI0eUpPZG9BbUprMmljaW9NM3R5?=
 =?utf-8?B?ZWNlU3gzcmYxOWo1SnUyRzd6NUFFRVFlMWpVMEo1TXNvZ2RDR05ITzZwVGo0?=
 =?utf-8?B?WEpXaXB5bVNWeVVUZWN0UTh1WExzVXFYNTBVcWRhK3didlN4dXZSbDVJK3hJ?=
 =?utf-8?B?eEZ4T0xacjFOZUlqVUtkSU1VdGZLTUU4MVo3cWcwZmRBdldLYllGMVhMR0l3?=
 =?utf-8?B?ZVoycTlPcGNKUzVXeVlLSzc4TlFMNW00TlZnVEd0RlIwZG1ENG9hQTlxa3Iw?=
 =?utf-8?B?bEFGQThRNTVNK2JZUHFXWEpPY0x5RDZ0QTdvbStHQnlZOWI3TGxjekw5UUJK?=
 =?utf-8?B?SUpDWU4wK0hWRWNwQmtaT1U0aXArcTRySFc0TGtBQXEwdEUwWnNqVU5uVkc3?=
 =?utf-8?B?TElCd3FtMDNKd0cranNZRjNtMlpRSWJuclBFRGszYUVpRzBZNkJyaW4ycDgz?=
 =?utf-8?B?RU9Fc3lqUGE3YTNlWXJaclQreVpQRUZ3aDFMbTM0cWcvNVZ3ODd3UjhoOFht?=
 =?utf-8?B?SW1ZbGExM3NvVm1JZERZVzBOQXdnRW4xQ2VZeUpiTURUdFJnTkNSOEd1ZWFB?=
 =?utf-8?B?a2hRNklRcitjNzRkU0lldEZFeDFORzQ0QUxVdGtRYXNIWDVIMkZ5cmhUb3Ez?=
 =?utf-8?B?M0JYQUdpZUs1eU5LYSt6N3F3VTVOMktsNytyajJCdW16NkRSNzlldGErc1JU?=
 =?utf-8?B?QlpNWDQ3MVVTZFp2TUdjN2h2cStteUdYbkRoMm5VZVo2dFNWVWt2WlBDZ1Uy?=
 =?utf-8?B?WnpHck1aamZpem9nVC9MRFlIL0lNRUwyeit0R1JwRmhKaVRIZGNIMHBLQlFW?=
 =?utf-8?B?d3JJVzdTWnVxMHhlSUg3aHhDbWxiMHBqNDNqaXlDcjN4OE94OU12S3N5ZDN3?=
 =?utf-8?B?enc5T29GY09xaWk0UkFFKzBlVWhrejNuMXB5L250bmI2RTlBOG04WmtPWVpF?=
 =?utf-8?B?WHg2eHRacWRKTEt5ekdTMWZDMkRuTmNteHp6Y1FWYWFVVzA3bktsWDk1T0hh?=
 =?utf-8?B?VDNXMFBNUmZJSVF1anZvL0RmWHZHOXRoUHU0MGVPTGQ0YTlBakp1ckIyaGND?=
 =?utf-8?B?ZkwybXY0S0xrY3RmTytlL3RsWjdxY01XQ3hHL1pkVUtvZlJUd1lDcDVIMVdU?=
 =?utf-8?B?K29jTzRHYjdtV1Z1eldnZUQzdVlGOW5oV0Z4RG93Q1BoVVhrNUhKK2VIaXZL?=
 =?utf-8?B?dGxqc2UrSVB0UlE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU56ZHcxNEQ1d3lQaTlQcW11dVZwcklBZEtaaGozVjZhcmhPV0RaVytmbm03?=
 =?utf-8?B?MG8vZlNlWW1naEVNNGcrVmhvZTErOFJOcDg5dUFNQTZySklwWW9VT2VuNVJE?=
 =?utf-8?B?ZXNpRGJRV3VzWWg4UGYycThwMWdBYUZQODVhMjVNaS85RTNMOHlUd1JKeVo0?=
 =?utf-8?B?cnk0U3VQdmwxWFpJZmZ6QllyaXhVck83YmhHMEtPd2g5eTBhU2Jra2JhdDRD?=
 =?utf-8?B?KzQyT2pyK0dDOVFhVnFZeXo4NzJzdjg0S2ZCRXR1UGhMNnZucmlnQnhaYjV0?=
 =?utf-8?B?UjM4NUV0Tjc3Z2haY29sUE5pQUdaa0lQSWxnRXN5VEdUSDFYcnNJeS9RZ2pL?=
 =?utf-8?B?VkFjNzRHb2I3eC9qRmw3TDRmWCtUT01KcGVLckVJQjE4dTdXbWkrdVF0cURQ?=
 =?utf-8?B?NmdYbWxrTUVwRjNBblRDWnU3bmJOb1B0NFEwMEIxazZZeXkxVmI2YlhYYVF1?=
 =?utf-8?B?K2diTzZlL1dHdkY5ZU9yRVFnRTkwSVZ5aGoyU0RvYVc4N3BSM3hwUjhGTEFH?=
 =?utf-8?B?WGowREN4RTNNVFlHWHMweGVKUkFNaStNb3REckE4akhRU0ZEZDljYWlMQ0pS?=
 =?utf-8?B?VGNlSHF6cW5NTXlPYnRkcWNJdzhxRkRteHpuMHJWTE1VY3JacEZOaXRnanNs?=
 =?utf-8?B?eWdwejJ0azkvT3oyeEd1L1AzQW85Y1BYOVFIVk9KWFdhU2l3cFVpSktmOTNF?=
 =?utf-8?B?OWZ4V3FENUNlRHk4WC9Ka0ViM3VSbjdsRmRXTVg2VEdXK2tLKzJqRCtvUzhD?=
 =?utf-8?B?VzdxcDdWaVdiK29YQlgxRUExU3dYL2ZMZ2VkRTlGWUo0dHBhRjdvRVNyN0hP?=
 =?utf-8?B?bTE3V2FzcDJiSTdVUzduN2tIQ2FmV3pWbXROUXg2bXViUWdPRzl3Sk5OamUv?=
 =?utf-8?B?Qk14U0NuNnlBdnQ4c005Nmg4dW5aY3RJMEo1c2VtU0V1VlpHdGRMVGc1c29m?=
 =?utf-8?B?RFRZV2Z6WHRnODdkMjAra3VpcEQxQ1JTWG10K2FaVVA4TDNlMEFRZ0RrRStn?=
 =?utf-8?B?b0tSc1VObkVvbUx5dmUwMC9nS0hvSUFMdVlQdlE1M0lMQW1KYmNNbnpaSnV0?=
 =?utf-8?B?UXF6VHExQ2tOUCtoSG9HWGhXZGY0YnNOemp2THd5MmxDb3Vzb25KL3ljSGZw?=
 =?utf-8?B?MVltdFd4ZkIvMzZ1dUUrYUgzdWpBU3dRb1dxMGQ2K1BJMFNxUGYwdEM2VmNn?=
 =?utf-8?B?R2RyYXBaRW0yekQ2b0R1VlVOdVpqZXhZMnlnSFNZbUsyZUtpMkZZVktvcVVO?=
 =?utf-8?B?M04xMW40TC9hU2taQ01PNG9ya3g3T21FU000T1hzUExmUCtuQUR6bjhRbzh6?=
 =?utf-8?B?TUdGM3dmdU1yRHJ0SUJZV3NDYjNBYTNjSEhtRlBqUlYyYTBZRDViQytXTEFF?=
 =?utf-8?B?bDNTS0RjR3BkVyt5VjdveGRpdTd5bG5TcVVrMjZWcytXeTB5TzdxMlBKVTg0?=
 =?utf-8?B?ZEJqbEh2VTlYTldJaFZjcVBkaS9WQ1pHYkhvNVBMS0ZaRlB2SGhHNDJJMHBN?=
 =?utf-8?B?ZEN0V1FzUkp6dUdObUd5SFFhWFNBaTIwaTF5NGx1dFNTaDRlU0VNbUN2UzdI?=
 =?utf-8?B?dytnaHdjVWxyMWI2czBWaXBhNTQyakZaYldZdFpZbTdZSnlpVVFQN3VwUmFY?=
 =?utf-8?B?WkV6UUEycFdWWWM2aUFzMXhKV21HQ0tjV3dBQ09mOGlJdDZ0NXRJa1YzV2Nr?=
 =?utf-8?B?dzFTdUJzaGNRdSttSEl4TzhWbFE2SEpvQWNDdVN3VVhjSkY5KzV1dERTSjZ0?=
 =?utf-8?B?dzVPeFdIVWRNSXd0QUhsY3M3TFRnS0tOVTlkaTB6RkUzS01BNm5EeXg1Wjg3?=
 =?utf-8?B?NTlFMjArbjdtM2p0ZFNVaWp3Q2FhSjZPT2xRWmRJSUhXNU9ORkFIZEp5QWlP?=
 =?utf-8?B?QXEwdG1GRWFqd3NGd2NlQkpEYXlMQkQzRFByODlxdUNyRkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5480384f-3406-4a4f-627e-08dec3b74ffe
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 10:35:22.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5978
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111471-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3CD464D19A

On 6/5/26 22:14, Andrew Lunn wrote:
>>>> This PHY is integrated into the IPQ5018 SoC, connected to the first GMAC
>>>> (GMAC0) and probed upon boot. However, this PHY is not used on all
>>>> boards because an external PHY or switch can be wired to the SoC's
>>>> second GMAC instead (through a PCS). So from a power management
>>>> perspective, it would be better if we can disable the clocks if there's
>>>> no link detected.
>>>
>>> Humm, is link the correct criteria? If the PHY is not used,
>>> .config_aneg should not be called. Why not have the probe method get
>>> the optional clocks, but leave them off. When .config_aneg is called
>>> for the first time, enable the clocks?
>>
>> Will check if config_aneg is called and test accordingly.
>>
>> ip link set eth0 up/down and cable (un)plug do trigger
>> link_change_notify, and based on the link state the RX/TX clocks are
>> turned off/on properly.
> 
> You are talking about something else here. You say the device is not
> used. If it is not used, .config_aneg should not be called.
> 
> This is a second use case, the device is used, and you want to limit
> the power it consumes, when there is no link. Do you have any numbers?
> How much power is actually saved?

I've given it some more thought, I think it's best we just use
devm_clk_get_enabled on both clocks during probe. For devices that don't
use the PHY, we can disable it in the device tree and we don't have to
store the clocks in the priv. It makes it much simpler. Would you agree
with that approach?

> 
>> Could you explain why to use _optional variants of devm_clk_get as these
>> clocks are required? There are currently no users upstream.
> 
> This last bit is important. We don't want to cause regressions on
> existing systems by adding in requirements which were not there in the
> past. But if you say there are currently no users, that is fine.
> 
> 	Andrew

Best regards,
George

