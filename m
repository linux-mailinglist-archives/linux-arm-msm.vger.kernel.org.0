Return-Path: <linux-arm-msm+bounces-111451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +FhEHdr/ImoigQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:56:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F159649F6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:56:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="R6INA5/R";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111451-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111451-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05B553004607
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 16:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E4136E46F;
	Fri,  5 Jun 2026 16:51:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011001.outbound.protection.outlook.com [52.103.1.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D713815CE;
	Fri,  5 Jun 2026 16:51:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780678311; cv=fail; b=Ti45TcQHhk8zouaFOlYDSw9NG2FAT/MdRX26QxLx/AOh30x7F6f0ypguNFPu9C9Rh0DQj1NmGSik6ynllUJEHGdM3hzy5m8eyCoAhHDZr6LD/EQ3/rArIKepIwf43zvv+hrIo+UmaqDKKVoETMjDcZh5RKG8QKeMm5eTU1MQZk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780678311; c=relaxed/simple;
	bh=sIIp3efw/U33Otiz1tSpkgQAQ3KwwzNyfO02zhhIFVE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LOWQCKBxzVzl1bJ90QQ48W/mPIN5i2mHXKbwN/2N1ZPwcnG1g9+OpPdLtNBBh6l/cJJdklaaRSiIZ4QJlHblIIX8E3kGtbaHVuAqdaFkU/TmrBX7v2TOUB8Z7IHVoKPRgJ+CDBFnHJn4NdB0RBuJrIIe8hDHGe26s4u661Wcs3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=R6INA5/R; arc=fail smtp.client-ip=52.103.1.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A23k5OhkCFqdn9Vs35dYQP4QAmVlx/j6TcJz5Gp+kFce7Ll70O7zLByshTHrPdOKjkS3uCxwPCV/T+QYY2CPIjDKmy/w1VucWlrCCoCgG+QuwVww9ZM80vwQ8rQooQU9iXSpZUi6DXDvp0XYyuZmiBYbD1iaYO+TVKONYFtifNBLlznUQaVB7Cq5LHe9859RodZz5eR7bc64xVKS9ZXReN7LJC1OPI9RgRO6pu5SNsnDS0hd0iWJO0TNgVlRlN+tt8h/LdOLAwBhWXdyG2QciRRW4FsSyJV2NkstlnulAJLJ3UU7HouK9EHNVoZrze4u0Cxtu/Qblmy6oLlO3lf3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlU3Lgf7lap5CKPBmK9SYFjTkGSKQYmckyyW73KwFH4=;
 b=qglt0trtJKcODmA6cT4IcZE7AIMl1tJMBryDo7h0KbuweaY7RZmMm3f2E9EoZo229mRWALdbQnM9q69wc6ZkYvoBN5bFh3jaVAX3fizzlbKrF2ZKNy9kzdcCLefe9kI/LKhNaF7E3N4u4uStbVmuc3TSQ0l/svhnNlle6GjwRDHPClmm1IUSOUWss0K2NNHKxRctFy0ONyyunl1VlBeNWUgVSWyPsBXYcUAYKk39ELsm6cZYSBIvCXYw3zNy+v3GcW4oTUkcPFrhCnIszrItnutQqSZhjXdMyIjzPXNnKEE/2pkCxbNZcR8K0hRbC/Yinmh1wqFiyHCWh0U6IcgisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlU3Lgf7lap5CKPBmK9SYFjTkGSKQYmckyyW73KwFH4=;
 b=R6INA5/RJliJEnW2W+P3VMpF5ObTN+iNpxdZBPhMQes21s2p/kLwym4UjzUC4E07ZqlVMPXAaghUfNi8wHKKD0iWnxDZipHvGZDtG4gfmCx6HZLKOTCt6WoB1UIJ/zyw93meQzjmc7zgLVFQ3Y7VXdMxHqa4oUZxTlKK0SnAPw2nkKucyvPG4hDu+ybkIdDyj8Mzd/67D8zNNcpXZVKt6kl1nLUcbLGpHu0ALj8WNshLItku4z4EHzeOWYTFdyZDGpyizMdWvJvcH0jGtiTpp2O5s9rr1ylRV3vWVRdzSsTOxP9u3I1JvA2ioNCwAnmxS308jUj7V1K0w/ofo31LGQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH7PR19MB7098.namprd19.prod.outlook.com (2603:10b6:510:209::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 16:51:44 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:51:44 +0000
Message-ID:
 <SN7PR19MB67363B4F852FB37071637A299D112@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Fri, 5 Jun 2026 20:51:33 +0400
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
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <471a21f2-7ab0-410c-861d-5722a94b127d@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0013.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <10ee9bb4-3104-4a14-a008-faec69de1f70@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH7PR19MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 66edefde-64e1-45e3-8369-08dec322b91d
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOeUl1GXz9pBEczOX9FX++RfGS7fwwWHKBup0xuR9RAiR+WFnZ1U/tn1fhG2w5TeNzgrmy5OpzlWDsj9SHf5sMrApPKQwJI7m5iOaak03cO3Q8NOKRkPxxOEvdqGCfNsbqk8Lx2t96f68pUs80JsYc3AoNfFxe8L24UxILiaEbJMgYgdUzRgFKaoetPlkVhaDRaxLRrYM+AzvGwpN8h53p6oocAqzMBNJ2buj0FWS9OOBfXMNIZRtHUKcQJS7DcKHQl4jpBLD5myW6ov3Fhw2OnwRX7NcbgYCredD4jGdmCqojBdnD18PlD+tVbxTGqhBj7892mJ0FwfQ6TCNyfHQ54U8dotamr121h2abhbbzk8Vmsw33h+gkHtUeq5eQMheldBiMn8BBsOMP3AO+GyTQQpUFdPgs5ZIqdMad7mlCvMTw2k2+zyyby1KrXlkN9JuybKP24MOEavJKAJFhLEE1W7YbjRinKPoQpYuQyeMNoBAOrL+yEXu2btYRV2LI35GUHUDxo+MphSCnTZQxhKx8NaVSW4ql2U1cmIx0HbNAhw3x7giOa5GqQuzvCvmeoUuO6ZurcTW+RFVe6Io6HieZcSMjKHf6jgA629y/vjhrVVKnt+I16YJUsnSg5GU4LQuVgM6GaxyTr3O5cK+DTC78BvM3ftRgjUZOgiDl9W1jmqNI98HqgAwzUI0fxRC6GMdipuCUWHpT+sjX81RAx/rAfR9Fw1TaBzq6p6lNXZ1s0Ss=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|23021999003|15080799012|6090799003|5072599009|12121999013|37011999003|55001999006|24021099003|19110799012|8060799015|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0ZpTHBlWkRONWxRRXRZakZoUmhpVVhoQkp1dDBVRGwycHpCN0hjZi9LbHc4?=
 =?utf-8?B?NWhOMlBuTHo0WENvK3JpU0liWExWdU9wbkpycjZOVzl6K2lEb0xQb3pnTFZq?=
 =?utf-8?B?eTBSelRxTllCckpOMStBQW5PVFlFOTc0RVJ0bWhGclJoVWY0WWt5MmFIdU5l?=
 =?utf-8?B?cnNqdHRXYXJ3MnZuVHE3akZLUFgxMzN6M3RKcTVaT3ZFVE83dVJNYmxLNDgx?=
 =?utf-8?B?Mmh2dlBBTWdmOS9hKzRwamdJYXl2ajg5LzVZU1lldWlURXMxSGJ0dE5MZzdl?=
 =?utf-8?B?b3JkdGhmSHRpR2xwVWpRekVCMERRcndWQ2ZpSGJEQWlxQ1ZVNDY3cGZiajM4?=
 =?utf-8?B?R2c2bzB2dkcxREtMbW0yVG1Ga2FPMmpQbkxmZ0h3MUNoVEx2cFVsTERUaUJB?=
 =?utf-8?B?QTlHd2R3MjhWYjZwY3g5VVFUSzYxQkp1OHZLMXhnUWdNMkMyRGpGellnTTU4?=
 =?utf-8?B?NFJIUStMc2JyTEo3cUhQM290R29JeElPbURLdGl1TzQzSit6QW42K3pXdnI5?=
 =?utf-8?B?ZTd3czFkNzFpb3d4Q0hpTElYbEhPcmt4Ri95dFd0TkpKSkduL3FOdDRram5E?=
 =?utf-8?B?dEVtcW5aRlRVU3paRmRUc2ZHTEt1bnQ5S0hmUVM5YllKNWRXVHdrT2hLdklq?=
 =?utf-8?B?SzU1a3RpMjBhbjBsMWJFeCtTVDlGSnhZZTdRaHhKUjlOTWVQWi9LZzZpL2VE?=
 =?utf-8?B?RWxSd2xhRkxaYXhWWGdHNkMrVTVwY1RXSUZtY3F0Rk42SFdFZE1xK2hRUzdR?=
 =?utf-8?B?dTRxWUloVE5OcXQ2ZWVoWEE1elliUkh0ZndBNEFMWEY5SFFpMk5kdXJaaUlO?=
 =?utf-8?B?Q2prcTZZMlBSQjRmTVpFb0UzL21LbU5MWTh2VkJnMkN3UkFVb2lLVGpQaDlj?=
 =?utf-8?B?bUNHdlVqSUZZVnBrMThnNVA5MWpDME5iYUNEbi80di9MeW91aWFYakZJREpV?=
 =?utf-8?B?NVZ4aHRyZW1KcXlmNFpVemwrQ0ZRZ29SSEYxTHZmVmN5S08vbEJjYWZDT0xz?=
 =?utf-8?B?QWdlbWMwb2RyRFFUWGkyb0hWUnFGUTMwS1RpSTJmUlVDWDJrbjhmSVQzM1Uw?=
 =?utf-8?B?dDJxeUZOMkpaY1dBV1NKYk9OdWhkMVNnV0Y4endadWlSaGRpYnNYNW1Vdzlt?=
 =?utf-8?B?WFZkMkNvNjRtcVZXZE55SFd2alVPcStEOENDSk5VMGU4NExlMDd1WkNQTEVL?=
 =?utf-8?B?Wm56TU5ZbnU1TzBOeStUNExtL0U2WHhjRFJFVkd0VW55QXQ5a0QvQ0NkU2JI?=
 =?utf-8?B?VzkzNnFEdjkrU3JMVUtEWkVUdGxTYlBTNDlZTHpySE82TWxBb3pXeU1MZXFY?=
 =?utf-8?B?S2FSUk5NRXJZY0haa0JMUk14Tm9xL2Y4OWVhUkpIQVN6Zk5DVmwzUWlFYjRm?=
 =?utf-8?B?eEExYnpqcVlPdFpUNk1tZWU0cFVZejcvUTJRMUZlSmhSMWhIcWFSVVZaU09K?=
 =?utf-8?Q?F0u62CzU?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVZzckEzTlkzcWxLY2xnaTdFd1NrUU9IZ0V1enhDd25sZW5pMjllbFVKNm9Y?=
 =?utf-8?B?bnkxdS96ankzZEEzZlFJNW5ZVG1mc0xRNno3dExscHBNb3NCLzhSMGVSenlo?=
 =?utf-8?B?b3ZQOTAwQVhvVTZhb2IzQkU0SEV6TTQ4NGYzWHkvTHRFcExTcXUwVUhlakQw?=
 =?utf-8?B?c210UDlvMGhPdUZjSnVaam9WNWt5K3l4Z2h0SEhsSGZaQ0FiRDhwYThrMHlH?=
 =?utf-8?B?RDRkUWJ4SG5kRE84RndOOE9oOU9ndUx6SFdYajFFSVdJNjdCVkIrVUhMSHZ2?=
 =?utf-8?B?U0o2YlVPYzNJNGd3TWQ4TG5JNldNZWRjL1JuNVJFWlR2cTdubnFxTTBtMjgy?=
 =?utf-8?B?YndLYU05KzdWZStpVlg3elY4UG50cmd3bEVEWDRycGRkb1QxK0hqUzJXWWJm?=
 =?utf-8?B?Y0Riemw3eEF6U0M3MlphQklDYWtQa1ljNEViRElDUXNmc1g0UmtvMjRnM2sx?=
 =?utf-8?B?VUVWZURVM21ISmF2Z1puMC9WWWp1ZUp2UjhuOTR0RHJhWXR3bU5UUGlRUVNl?=
 =?utf-8?B?bnZRdUY3NkkvRjdRUHhoYSszUkN4dHRIVXh3OWVORUFjL3lGZjAwdVptZVAx?=
 =?utf-8?B?SzlieTlQOE9wT1JyWndnd0krTHNsM0VFQ3c2dGVWQTlPSEgyZDV6NnplcHV3?=
 =?utf-8?B?Rml3aVRML3MwZHJ3OGMzN2Q4dytGOURzaUQ4ZDg2RC9laEk3WWpJeDFDTXBi?=
 =?utf-8?B?UGEvWllOUmNNZG5OOFpKOEZVRVI0elRyMFdoNXBWb1VuR1pwYUpOUEU5eGY1?=
 =?utf-8?B?WHlQNlM3Nm14VS9obGYzT2VZUnZqNkxpUk1Wd1BvTmx5Um5XMVVCa0VrVTVu?=
 =?utf-8?B?dWhLbXNQdEQ5UUs0b1hzcXBqbEhLc3lsUmpTOTZ1UWxrUWtBNU1vUzA2VW8x?=
 =?utf-8?B?SHBkR3Bsa2g1cWFqanZUY1NoMElqdFZwZGx4SEVOcmc5ajhyb3Z5aGFtMlNv?=
 =?utf-8?B?dzRFNTViL0xUT2N1QmhHUmJMdnhhVzVJSm9UbTRSMGJoWnVOb3BlVC8zUHBO?=
 =?utf-8?B?M1R4THY0NmcrSlJ6RU9yWnlxS3NudWVZUjNIUzV6Vi8zSVJpOFlRUTllaTV4?=
 =?utf-8?B?Y1VOZ1NMSnBneHJDOU5rRnV2Q2tyb05UaWRSbktLNDlZdzF5V3JGZmZ3eDZo?=
 =?utf-8?B?cWNVRVFQM1NpemJSRE1rZGZ5M2NGVWl2WFFtdWlhQnJlUFJWeUlUU1VFenVh?=
 =?utf-8?B?SzRrSk1CWTc5UDJWbkpxZDliREI0bnI3d1NmWUFHbmJuMnVISStLQVpUU3RR?=
 =?utf-8?B?eDZyT3A4MWdRS2x0THdWbDQyYlh3U3FQWVozZEswU01OcEM4R05KNHlTYkxr?=
 =?utf-8?B?Vm1Zd0hmVXhTZy9IdEFSQVVDNzVuWjNJTDRjZEdRVzhkRlJzNmNYUEhaZ3BT?=
 =?utf-8?B?YkhsRXczci8wWDVxVTZzNklzK1JqdGl1YkRYcUNubnJDVU9FUTZTcUNBeGJi?=
 =?utf-8?B?WUNvOWJoa1dLTzArR01pTmxHbmROU2xzS2xjQmxEZGhoN3p3TFFMYmFxTkxK?=
 =?utf-8?B?VVIyY3I1akQ2bmROSW9XdTJOZmlzZVVuZnlCeGF2TmltNHJPWkRlSjF3Rkxs?=
 =?utf-8?B?ZitMZ2dHWWduRkpISXI1Sk83MFhhQmNYRDd4cytRTk8xdVhnSHJZT2RMVnJK?=
 =?utf-8?B?aDZVSFo5R2tzWXdjTTlxQzZwWWRnYXl0ZmJXaEVQWEs5MzZmM0lhVVp1dVYv?=
 =?utf-8?B?enVvR0RXc2F1S0tsclJ1V2RvV0tzSjUzaEE5QzdBa0F2TE1aQWd0RDJ4SFg1?=
 =?utf-8?B?Wml3RjNnZ0IxbkV0UzNnYXUycm1HVWNHQzhXeTUvaVhNMkI4TzB1WDlJVHFR?=
 =?utf-8?B?dEJoNEx1SmcySUNzODRyeFZUVkg4dVlma1pHNnRaalBMNjRvSHh4WmNOZGc4?=
 =?utf-8?B?TlljUERVRUphWVNvNHZlM0N5S2dUTVRJemNVcTh0bFpPa3c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66edefde-64e1-45e3-8369-08dec322b91d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:51:44.2336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-111451-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F159649F6D

On 6/5/26 19:01, Andrew Lunn wrote:
>> Link state detection works without these clocks though which
>> explains the approach to enabling/disabling them upon link state changes.
> 
> It would be good to add that to the commit message, since it is not
> what i would expect. However, ...

Sure, I'll add it to the commit message.

> 
>> This PHY is integrated into the IPQ5018 SoC, connected to the first GMAC
>> (GMAC0) and probed upon boot. However, this PHY is not used on all
>> boards because an external PHY or switch can be wired to the SoC's
>> second GMAC instead (through a PCS). So from a power management
>> perspective, it would be better if we can disable the clocks if there's
>> no link detected.
> 
> Humm, is link the correct criteria? If the PHY is not used,
> .config_aneg should not be called. Why not have the probe method get
> the optional clocks, but leave them off. When .config_aneg is called
> for the first time, enable the clocks?

Will check if config_aneg is called and test accordingly.

ip link set eth0 up/down and cable (un)plug do trigger
link_change_notify, and based on the link state the RX/TX clocks are
turned off/on properly. I also went for link_change_notify in the
scenario that the PHY is wired up but the port isn't used (cable
unplugged) to avoid these clocks running unnecessarily. Thoughts?

The if checks were added based on earlier comments in v2 to ensure the
enable count isn't incremented more than once.

Could you explain why to use _optional variants of devm_clk_get as these
clocks are required? There are currently no users upstream.

Kindly advise on best direction.

> 
>     Andrew

Thanks for the guidance as always,
George

