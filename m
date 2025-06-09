Return-Path: <linux-arm-msm+bounces-60635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C369AD1DF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E527188652B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7701F255F3C;
	Mon,  9 Jun 2025 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="N2Kg3YhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04olkn2036.outbound.protection.outlook.com [40.92.45.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367747FD;
	Mon,  9 Jun 2025 12:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.45.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472755; cv=fail; b=SeRwuTyUK8Rli4fRjv4tFi/0mUfOH+m7ayA1tAw08m1QofgRoEaUiuhnxsW50rJhvGFkAu1PFmXslvcbm0GplM1KFttllnxhImW78O1LOBXJBp6TSR+WooJocouFlbc3nZU1nCsYc2HZ6B0ZPW8xJms7qBCpEX2GiSiZ033fgIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472755; c=relaxed/simple;
	bh=xBpb99xOd2Bd/s+xCwahoZQ0XiG8LE1eN1n64cZQUzk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EbzuLRbXpIUEFb5fXWRO4NE5tPtMEgnhxO5t4FeKhgaT0DpyBYBYrxYZHewtQybWGdSTED27wQ7xCZS24bR60rdt5MVhCf2FYG3Iv+twkrFcqkOC+ISBnK3fW//l4AFtmx2t+t7qWKLEzeTeo0cm75yKWvOq8YI51Rc76X//af4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=N2Kg3YhS; arc=fail smtp.client-ip=40.92.45.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyRR1QN5BDGPGWX9FvZBdx7crI2T2LAxygrVa3vqQv0HgnYIu98X4iCjzbkLesJOxrNAgxAm3FYGmMmbkoKoZMmNmRzgAMITHmyHzWVS2cOYrTZ8v2jfRU+jHyVpVuNpqU/JMEvlQ40j+rqp1oPcELgZhxPPUNTVmJuNcUUJDRjkG/CAR1bvtmWqp10CBMtiq6COmlOuSV6S/Ifwd0neJMH6Ij2Iedo98+pbPHSfxs56IkUaxe3oEkwrdKZiaVUw6FgAT/vOM4KmNLMTSWbBxGHfYPOn5yHnR8qz+1v1yWHhUP90N/YALzX2IhKJkPY503sOIUOWwDYDau8JthMFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/t9Wj2UUNt4HNrGJ2xuvou5viBK1LADSbFXqf6FHCG4=;
 b=D2rnpso84x51fCeWRL1lfRZXytZ8R/F2MinmrAye5I7/MemZL0waxFhJoyYRSGhc+zXQFruxT7MS712o9XQZVWQsjA33tg0xL34iNQbBK6Y3YlcaIVfkzr1lpMqOEC6d6bunnn2DUsJzl8wxnAHQhqt5cgq2O/cC9+GiCUUDOuqJwPtTamoFMNOPQROwK6qc14QaDbrfO6RiUgqwwb1nDWnFa3j+v4d34XqqG1eVIDcm48hlxrGTtjJtdd30KhReQ1wXpUeRkISNogx7u0MOt/Mo0e97LU7jiJjWQtXpyeAjCuNsaJLXmLNzPp6lfxf6Y1VMIlrvRdSf95uWqujamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/t9Wj2UUNt4HNrGJ2xuvou5viBK1LADSbFXqf6FHCG4=;
 b=N2Kg3YhSgsoLOQlNPnS+b37gvAuL1Ur9RAPxyyD6geJGw0lNuGq6I5l057ypjy8FS9FFluV0pXRoinoJ7At1K/b7gvwbDZd+i8K+Nsz+yJIOhR4SukIzNw5JuojCE/2DY5segcDeAKcpvO9iZkcjXXP2RJ+KUuCyNMq26jK9vRHeKG5aDdRI9D55UtyxyEelIf3jv1MHDZciaCL45LpRHcbQT3FqaHsTRyBNNtp8VoEF2cCpz+CqMphz25cdZtwvwaAKVKAckpqvjxmkP8Itut+ROFWIvAKQS8W2l+2Rimt1+YXX83HCf7NCPez1mJqd6XQX2ihBoKUxtDGhAynCEw==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by PH7PR19MB6755.namprd19.prod.outlook.com (2603:10b6:510:1b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.16; Mon, 9 Jun
 2025 12:39:08 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%5]) with mapi id 15.20.8769.037; Mon, 9 Jun 2025
 12:39:08 +0000
Message-ID:
 <DS7PR19MB88832182FE959CA0D15C3AD09D6BA@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 9 Jun 2025 16:38:56 +0400
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
 <DS7PR19MB8883447735B1E7E1BE7985A89D6BA@DS7PR19MB8883.namprd19.prod.outlook.com>
 <d56f57a7-79f5-4cb2-b4af-fdb88db69ef4@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <d56f57a7-79f5-4cb2-b4af-fdb88db69ef4@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0080.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5d::12) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <cffa32f1-ce55-4e0e-b81b-21633c2fe769@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|PH7PR19MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e321589-f8f3-4d48-86d0-08dda752a06c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|41001999006|8060799009|7092599006|19110799006|6090799003|5072599009|461199028|10035399007|4302099013|3412199025|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUVHMGwyNklCSGJ1MnpqOXZReXRoY2FXbDhjcVkzWHJ4MTdwanQ1OGxqdXBv?=
 =?utf-8?B?cnBtMk1nTlQ4OHo1VElaMEFYalplVS8zRVkxVU85dTVqRG52UVI5RDU1cHVh?=
 =?utf-8?B?b1dtTW9OVDNXQ1Y3RDEyejhKRGFUNUp6TklsNEdnUEdoUjYyYU96VWxubzNX?=
 =?utf-8?B?RCtBdEtESkcrcFRHSHBya3dRYXd3bnArSlN4UEVoeEpzaUwyM3h5Y3ozeEly?=
 =?utf-8?B?THpuV3pCRXFGMFpwR1lJck9MeXJHOHBEY1dKMW0zZjZmbkdnSDJWNTRaVzV0?=
 =?utf-8?B?Tk5nbTU0dWdBZHQxMWI4U3RDRGlJUEVvekQ2TXVMemEwMWp0NnVncEt0c1gv?=
 =?utf-8?B?bm05bExHWWczSmZOMWF5RC9GV0NJUkh2bFpTYzhKU0wrQlBNa3VxOGNhaW43?=
 =?utf-8?B?WExDR1JLOVZjUFJicmxUaEVJZjFqeDYrNXV2T1FwUTZZeXR2TWwzOW1CdzJy?=
 =?utf-8?B?cFNBZTloK2NhM0V6SkdmNEVIRjkrU0tsRmpaVGhZOEtQbmh2bDdzaVNXbndh?=
 =?utf-8?B?cTlwaExTQzM2bFBEd25qYmxVM3o4Nk5YRHYrSW5jbm5JclBHc21EUUU2dUtN?=
 =?utf-8?B?VnV5MVpESUR5MEFiNVNKRzBZSzhacHdKd0VnZHpscFRRbC9LdWEwUjU5dkNk?=
 =?utf-8?B?ejN3NGdyUHpTZU0vekVCWEZGRXJsNzhBbGdXdkpxQU8zbFVsSEdWYmFpUFUz?=
 =?utf-8?B?bkcyYmtONlR1S3oxVkEvdzZMZlJZQ1hpL2l4MjIwV05uamkrN0hmZjd1WkJY?=
 =?utf-8?B?R2VHQ1ltZ3d3TzZjcG1mZTYwNlp2b1BqV3c3T0Y4aXBiV0NwWExQcnRHSEZ5?=
 =?utf-8?B?Z1pveGlYV0R5bWJlNitJWjlSMHl0TXgrYXB5U212M3hVWTFxNHZ2MCtyZ2ph?=
 =?utf-8?B?UWxnUStLSDNwOHEzSU1YbDd2anl1ZC9VT3RXQUZqNEZUQS9UeWhYYmY5ZVhX?=
 =?utf-8?B?ZlcrL2Z6OFhDYnJBN0hxcUIzQ1paV1loWFN2RjQzTFdSaHhkdG9nZDJEb0Fp?=
 =?utf-8?B?Vk81aEcrNjB3RUdGbnoySVZHazJXNk1nWjJzc2dZSDNRL3NrYWdsRVY2Y0dL?=
 =?utf-8?B?R3lZM3dWbjlYVHFsZWtOQmNGUmtmMTFabGpwckJoVU1vNm5lOEREMFI2M2J3?=
 =?utf-8?B?Y2VmS3pCaWtoV1IzUGFWOTlSSEkxa1NRNFZaY0VjUW1LMHFPcjhMZ2I4MEJq?=
 =?utf-8?B?cHNaYURvSHpPV3Q0VnlkQVdlNjB4LzM3eEVTUFRTMXlsWTVXT1d0ZStidHFi?=
 =?utf-8?B?RWl5TGRZZit4M3VNTkpTQlBqS3BianlJSDBhQ2gvTUlKbk54NUxUMXZTOWcr?=
 =?utf-8?B?dVpmR0FFMVFjNm1BRG5TUUQ5NFhmSC9oU2JsMXlxdzdtdmlpZjJsSmZGL28z?=
 =?utf-8?B?UnJaTEVDS1hWUTZwVmNwdlYydFdwTEFxTGxXYVJCVGlRSXhVdjdWQjRKdEw1?=
 =?utf-8?B?WUNqUVpIRy96bVhubjlISCtjaytmTGhvSjVIeXVnYTJ2NVM4cE5xRmt2ZDRQ?=
 =?utf-8?B?Zm1iNCtMMEtlOExBcCtyeWduN1Q0b3Q1eVFrVkxRTG82WU1OMEhzOE50Q21F?=
 =?utf-8?B?SFV1K3ZpbFFjank5SEplU3ZsWjBYTWhHU2ZKS2FFYXA1WGNzTjdUNWk1eTdy?=
 =?utf-8?B?UkdwZTRDK01MRWRaeld6MVRBcjFMekRHejZCeDhqZi8xblgvRUh2dy84MFQv?=
 =?utf-8?B?M05oN2tsR2F6M1loR3c2dmltRHhCSkRTdThtY1JlSmlCY1hlUG4rNnNwcURk?=
 =?utf-8?B?dDJDMG1wV3p2ZGV5MHpxcGc1RnhMUnhPbXJHOFdnYnV3VTdsK3hXOFdLekpK?=
 =?utf-8?B?a0VnZmFldVMrd0Y3Q0dHUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzRwMDlDTFMxa3ZzSGl0N1NIUnJIZFhqbVN4aWZlekhsQkgrcWRjY25qVlhy?=
 =?utf-8?B?UUVpTU1DM3B5SVlsWUw2L3lHdlRUamp3TmIvRFFMT0x5WGx2NXJGWHBLTUN6?=
 =?utf-8?B?QzBsdDVxNGhOU0pCQktFaHlRaEFIZ29INmxacHRhUGJvQ0lFMnlEeFJzdFNP?=
 =?utf-8?B?UUdFdlozUFdJWlA5alFjODE0TGw1bWxKTFRsWDVqRjIrN1dWaXRoelhNOVBi?=
 =?utf-8?B?aWFscmY0dWMvWW5vUldpWnIrWEt2RExrekFEYXhIaEFLNWNOcEtvc1VCcmlR?=
 =?utf-8?B?c1Evb3I4S3dCN3ZuaHRTenVrRjdud2lQaWRCSkFKS2VWd241ckd4ODNiMjJ2?=
 =?utf-8?B?MXMrT1FWajBrTjdHMjZkM2tkM1FVNHVERzJVQXpqeUpYMytPNzdGR0hEZ2pG?=
 =?utf-8?B?ZEo2UEpVbVRUOWlLeVBlWkJsdFZ5bzZoRlA5b1pCYzR6QU5aQXZCYXozWm9Z?=
 =?utf-8?B?MHo1ZXBYMjhFWFp5ZGhaNnBSaEwyODlvNzFQUER4MXBiMnNhL1dJd3BVRG5V?=
 =?utf-8?B?dlJGWnFldmxXazNPTDlBZVlOc3djZlFYazFkbUY2d28wSCtNVThzcWJUOFp2?=
 =?utf-8?B?cHRSYWZzK2ZISVl5bVV4UFR4MTBrYzVEQTdYcHVNakpJVlJNM01SbldhV2pm?=
 =?utf-8?B?bGVQZTNPNmo3UERzU01idjhabTRkM0pPMElURGF0YWFXSERQd1BXbko2NWhk?=
 =?utf-8?B?UzV1MTZmdFlmOFRIZlNyZlQrMWdzd3I1USszSUlXSjJ6WEJGVHFYcHI5QnUr?=
 =?utf-8?B?akZHeGhiVFFQV0svNUFBRmR0R29rSVpGU3lhSVh6SWR2VXc2ZFBENnZFL1M4?=
 =?utf-8?B?OTA4MGFPd2RxdGRkUzFrSGtMblNkQkREaVU2eS9sa2lrK21TeUlzOXZxOTIv?=
 =?utf-8?B?SU8vU1RXMlpwajlYOXU3S1NhbG1leGJramFsMklaczgzdlZIOERHeE9HVlRF?=
 =?utf-8?B?bjhVU1lxcFVCc0dpL0Z4ODNOQm91NXc1Wnp5TGR2L2NJV25kTEsrdmRlMlVS?=
 =?utf-8?B?ZnF3VHhmMHU0R1NMMFE4TTVhK1dCVU9NeWtEVHp6TldhYlRSUUNpbHNRbThl?=
 =?utf-8?B?MU1XREFoK1JFV0hySGo1ZkZDZVBpTjBpNE1odXpEaWhHeFczNVV5eGRnNGZi?=
 =?utf-8?B?eCtOYktPOC81SDV6MDZXYlNva1dyTmZGZkZsM1B0Y2FiN1c1eGlNa1dJekNp?=
 =?utf-8?B?SDlvSU9vZGV5dXRSMCtxUHlyM0tNMUd4QXZzN3BKSWYvckIyOWNUS2dPVGs2?=
 =?utf-8?B?MUNkMUFha3p0cnA5TFVLdEEvakpLOTRBR0Vld2RUQW92MzI1L1NlVW5hNFVu?=
 =?utf-8?B?VnFXWmdDQ0Y0dFB5K21wZ2Jpa25WOWsvWkJxUTNuSDg5ejNHNGVKS3VBcFZ6?=
 =?utf-8?B?cW4weG1TNU9Bd3lWNCtwdkhDenZXbHRGeS82WGNzeTJpYVIwcStlY2xucGtl?=
 =?utf-8?B?b2dkTVJrM2NPMHZIcWY1aGRPVEJxVHBSUmJ2UGJ6LzZvUng4aTdNVWQ2Ulo0?=
 =?utf-8?B?VS9STGwwQ0NWTFdwTVc4WC9lWXhvRWQxVW9VRHcvUnBSNkJUUmlSN09GcmtN?=
 =?utf-8?B?OUZ3dlM3N2tVcmhNc2pzSHJ0enBJVXFnaHc4alpZQUJMeFhMVWdvYnUrRkVa?=
 =?utf-8?B?ckpMNUsxVEN4WTN6STRjOTlZZDV4WW5sNENwOTlPSWNhekJsZDRBOGJTRmJO?=
 =?utf-8?Q?OdoG8LcdJ1Taq230byke?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e321589-f8f3-4d48-86d0-08dda752a06c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:08.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6755



On 6/9/25 16:30, Andrew Lunn wrote:
> On Mon, Jun 09, 2025 at 04:20:12PM +0400, George Moussalem wrote:
>>
>>
>> On 6/9/25 16:16, Andrew Lunn wrote:
>>>> +  - |
>>>> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
>>>> +
>>>> +    mdio {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
>>>> +        ge_phy: ethernet-phy@7 {
>>>> +            compatible = "ethernet-phy-id004d.d0c0";
>>>> +            reg = <7>;
>>>> +
>>>> +            resets = <&gcc GCC_GEPHY_MISC_ARES>;
>>>
>>> What do you mean by 'alias' here?
>>
>> I mean node label. Since it was asked whether it's needed, I added a comment
>> to say why, so that boards can reference it to set the
>> qcom,dac-preset-short-cable property in the DTS as needed.
> 
> Ah, O.K.
> 
> Since this is internal, it is in the SoC .dtsi file. A board would
> need to add the property in its .dts file, and so need a label.
> 
> The example itself does not need it, but the real version does. If it
> was one of the DT Maintainers who asked for it, then O.K.

Konrad recommended to drop the label unless it was used/passed 
somewhere. So I added this comment to explain for future reference. If 
not needed, I'll remove it for v5.

Link: 
https://lore.kernel.org/all/f2732e5a-7ba9-4ed3-8d33-bd2b996f9a1d@oss.qualcomm.com/

> 
> 	Andrew

George

