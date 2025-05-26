Return-Path: <linux-arm-msm+bounces-59380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EEAC3A19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 08:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40B2F3AE0BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 06:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BB11DE8B0;
	Mon, 26 May 2025 06:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="u+ioteaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2015.outbound.protection.outlook.com [40.92.42.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B0C1DE3CA;
	Mon, 26 May 2025 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241825; cv=fail; b=j6lUOWj3ZDWxmds3XyI5rkH0IACpAXF9HOtwrwxjdA8sC/5DNGpCHLBiONDdFSnYEGyAfNkcm8r6/GB4GP7b4orxygZZCyikgCeQ7VmWKw5Urt7YpA9LMbYna9fLoR/n2NUHbK0NcVCbFDvbjPYBWVyk3yLY5exGc4sZttOzk/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241825; c=relaxed/simple;
	bh=+NW8t3CC5uft5b56Fjc38KR6VqSUkvJJ18a97PJUP18=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NvDYmY9IaC9RppIA3abGZMG+a5lux1rEvuBW5yXlFAoWxF/OBNfdT2gojZ4wteIokl1JIbOCEiRTruzn0SEnXRSs5I2lQyxbDWnhZWOx2lh+a2fNE9yLEucI1SAyserj0qha2rKNOuwz/7jDSBtSHcEa3BDy1JrcALar+I3M2Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=u+ioteaV; arc=fail smtp.client-ip=40.92.42.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I75XiKGsmeK12wpwlWa7VjXeQp/B/Ie8SqoTrJIEuTT0qWa+Wew5hc5Zn9FidlkSEeBrrQy43z32wtTj3//bvTTIsDVDzUq0ZrDEzv6sS+cvqgYQtlBuwbNYsRJcUq3y6qjnpoTuS1PQfLNRpxRBiY+t3KjRqTAolcPjoQFHd89eXNw+pdJCxuEGcwu4ayHBpaTS8LlqonokhSZ7QL2CP86R8Bwla4mgSszPt1/usrhj6/jdwjH30XwsPLEy7V823WcVxAOxPNESPh8x8mbKJ798uYmVWjf3QeSXZWF497RfA2C+9hg2Z3LKjrUewvFsxj9NSonvq9IGiEdyjcwnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P41zjMhTMAsCzm5acKLAITZ0khZkuCSVukPhgYOCtJY=;
 b=CJcQ8Jnk9GHNSVsE/TM7aaoKUE47FdOGH3eB0BX5mSxGzud+vO3IPBxuMBMBgm+Z2vuyg8UuLOVygUFI1ibxKGsvksqG8exN0QQaFGkWJZhWP8Pnp6sFN95H0t7HZ5vul3pIHGDJ5c8b4PF3NSw5VeShyNEjt6j7gyf1w0XSnYEEzSM0oaWmfPU3AKgJ1Nv6iNl77wEfSHG/DH34+MetZ+faLVJQTK8OQs9kufLD6l55NWTfPcVNQWKacHc5pxm/O+S4R21FBci5VF092LhWuy4gZP5JSAJsHJz8NmBCxIzeBHYJv1rMlxGVrIJdPxdV3TfW8cevrVCL3UcnGHUDDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P41zjMhTMAsCzm5acKLAITZ0khZkuCSVukPhgYOCtJY=;
 b=u+ioteaV1JhSHoyPXPrNSG3XZQwURroPSbzKPpezEK5CjV+WGnv1lhmbdcRMwd+gHaL1lCFZhWF+G4BcY39XcVk6tVZGjzKFAUYIAkVVNO54kOLTJ+RiO2c2to1/vUgqMH/Gj7E4weeXzSPpx/rml4rUeLPGfhZDOMLyqSp88IUpAwFGvI5ihNWfcGo1HM5GWFFde1U90jTZ1II4qBd1B3ggXB1rOR3UZB5RZS0Yny3qR23Oy6szcPctAvN3llULfVETpVZL1gQeGO0SczFGtCHscEn74cNBYAM1dMg927IYzYXJjqYyHKDyt+qEp/lZXCNMqRQg2BfMk5RAtEDOOQ==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by IA1PR19MB8866.namprd19.prod.outlook.com (2603:10b6:208:59b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 06:43:39 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 06:43:39 +0000
Message-ID:
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 26 May 2025 10:43:27 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
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
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0199.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::10) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <66fd4642-6415-4d2a-b6e0-de405d34b22a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|IA1PR19MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 318f5510-596e-4fee-3dc1-08dd9c20a58a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|15080799009|19110799006|461199028|7092599006|8060799009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aURsL3phQjhTYncwSitvbDlQVEJDVWFMSDRabWljdXg5OGtJVmJoUGcyUzRZ?=
 =?utf-8?B?QTl4bmdyRkdac3FsQ0haeC9WTnZTaVB3NWE0M1Jkclk1YXNybFpGb1B1Ums3?=
 =?utf-8?B?MFd0Y0NkZGJMSXlSanNidjhScU5FbVFuSzluUUhKaG1qRURncXloNnJwYmcx?=
 =?utf-8?B?amhyOUpyYzhxcEZaUm9Nblc2c1AzeXBWSG9FZWdvS3ZKNm5BMmF2M2xLZjZ1?=
 =?utf-8?B?NmZucWU4VXdJdlRtOVE1UTdPOUFwSEJWVjBxUjdJOCtBK0xXTjdGbEIvZzE0?=
 =?utf-8?B?OEc2YkcwS2tYL250OVZCSE4wM3Zqa0t1NGVyT2dYd1k5Y28vcnpUSTA3SFFJ?=
 =?utf-8?B?azFhcDl4WkFIYUllUHQySnl1cHVWcHpUd3ZkZ3JTajgvYUdPcm1xYmgrUXpM?=
 =?utf-8?B?a3AzWE1JZGJNTm1lQ1RsN2VnTlFUeXlmb1JVMjhzY2JCRjdKWnk5anZFeENk?=
 =?utf-8?B?ZzNhWlJXZWZvYzF4L0lMZ20rc0ZmUUlyOW5BZ0hSYW5wQmlyMHJtN3J4N2dY?=
 =?utf-8?B?M3JaTGx2a3VXbCsyTXNhY3AzZzF3cTVxVGVEWUJoOVE3RWZ6RnJIZTJDbGtt?=
 =?utf-8?B?L0txVWRMbytzckQweVNzZ04xOWRuMktOL3dnYWorSGhoTUJaTSt1aHRzSWFi?=
 =?utf-8?B?VUUzRTlHUmtGN0Y2b2xXd3RIWjJJUTVCMVc1YU5iUUpueUhKRXdXenhMREZH?=
 =?utf-8?B?bWc0Wk1reE5KZG9MVzRNQzZKc2FUdVEyVDc1T2pzbWkwUGk2UkZubWlRSGwz?=
 =?utf-8?B?M1FLaWtxK2t3SU1lbXloYk9uZjE0UGRJWlV0cWk4OWRySWQyTmRneXZwZ1Bw?=
 =?utf-8?B?bnpjUlRLMWFIQ2ZhOGExQXRjU0Fuc3BsbjJUdUNaL2xOMG1QekY5aUNiNDFT?=
 =?utf-8?B?S2xmeHZIa2lqeG5KcHpDMWs0dUJpcXN2bzB5QUJLdjFtb1lyT2hBdm1Wdlho?=
 =?utf-8?B?azV0SmtRQmpmbFE1UFk4YmNoQStpTUEyeUVDV1hGaW02V0NmM2NRZjFvUTRj?=
 =?utf-8?B?MW9SbVRmNEdocVNaaGU4blVGaDFkOWZtcEo5RVdxU3VOUDA2bGhYa2FjQ2x0?=
 =?utf-8?B?cVJKVXA2VTdsNE1tOGFIU2Nld1JWdVlZNlFqbkY3cEgzRzhnUmpXNEdNRUJ1?=
 =?utf-8?B?RXhKODJrU0dIOUhaTzBzL2c5Nzh5TUhHeCtVZXQySGthdlJHYmZmL25QRVNr?=
 =?utf-8?B?ZGZiNDZqNml0UlN3UHNlTzRyUkFNYll1aUtrNzhmNWJTcFcyVGxYVmxhZSth?=
 =?utf-8?B?a0N5UElmZ0lJU3dDV0NKdlgzMFdFQ1YrQlJCU2xiN2c1bFZCV3hmb0dXTE1V?=
 =?utf-8?B?Kyt5ZDd6a3pHRnpiaXZFS291N05uY3dISXYzMWhVSUQzSkFOV0tIZnlud05t?=
 =?utf-8?B?Q0QrR1p4OUUwMk9XWlNGZVFRdkFJZFZ1TWFEVXplNm96Q2xJOFZaWEVtSnlM?=
 =?utf-8?B?cmJldmhNTVNHWG5nTU1UV0lQUys5bzc2cFZXUG16emNYYmxIMzNkbzFGaE41?=
 =?utf-8?B?QWdKSThCY2QzbEcvMDBJVTZtNVc1OVJhZHpTMVFxVEdHbzBoT0szYkJ5TFMy?=
 =?utf-8?B?dkd6QT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG00YjA5UGJMN1kyRjM2WUNlQkVPMllaQjMwUzBYSlM3L29xMUJOdGpQajNl?=
 =?utf-8?B?eUxOQ3gxMmxJL1JzUW9QUVY0VGFJNjd2UkhmWGZkcWk1ZDhsWVptWlRRTDFL?=
 =?utf-8?B?WVVPZVU2eGN2SkhkT2hJZzE2L0s2ZmVrd1owWmcwTk8xN2pLT1kxVWpiNElV?=
 =?utf-8?B?NVJJaHkrUkRVS2o3T1E5NVBYYTlrTUQ3N2UrZ2JsM2ZpL2U1YjF3UG1vK1RT?=
 =?utf-8?B?ZEl0M1hzcVpQVUxzeXI0RS9zNDdjUmVNSkx4ditMUjF2SG9aSHIzRk5aZ0hY?=
 =?utf-8?B?TnRCRnJJSWRtUTErN0tYK2p5UTZ0eWtzZGZwM1RBbm1rRjJTLzhVWUxRY1JQ?=
 =?utf-8?B?TFo0L29KcGNqVG1JamVOa0JmNTJtN0R3RWpwalROc0c5TzBHUVJoSlc2Q1p3?=
 =?utf-8?B?bDdmNS8yVGZKbktpcklscmFzMHczR0tFZnpEZ3lCZnRsMzF1WmdIOHBoK252?=
 =?utf-8?B?NUxzYkhGbTRNamN0TGpYalp1bVE5bmxvdVM1VzFjSGdCSUREdXlXcXNsaldr?=
 =?utf-8?B?OG8rOEx4cjh1aEcyRnpNQlNTcnNwdDZ5QUh1dkVOMEdXa094THlQeUFWWDk3?=
 =?utf-8?B?a3hpdVRLOWtHaWhtTmp3aDc3MnhFeGcxWkRxTFRuS0MwYmNYSThBbHZTdzdi?=
 =?utf-8?B?b3M4aVo0dkh1eDlTcFBveGQ3MVkrMEpSdkNQcGdROWI1dytsanpnNFpYalZB?=
 =?utf-8?B?cGRRQWVJYUpBN09WRC8vdmpaYjlTYi9kZ0lZN3p3cDV6ZFd5TCt1QVNQSis1?=
 =?utf-8?B?VzJlMGo2enNNZkxFQURPZmx2SzhGSjFBZmplRVFwSkJubUdxQTdDWGtkLzU5?=
 =?utf-8?B?bFI3Y3FnTmQ5RlN1RGhTaXh6MmozdU5JK2VIMklVUEJZMGtwMVZpdXdZdFdp?=
 =?utf-8?B?TGtmTElpR1JuaFVHZ05RcE92M08xSkl6alNCYTF2NnNGT2NiM2k1K3VBVDJP?=
 =?utf-8?B?emNZWU02S0N0aUprYWxPQ2ZlNm5FVkJIZ0ZSRkE2N3UyRWtkVExFdnpFUDZJ?=
 =?utf-8?B?aXFTaXUzemgveUtLc25UTjJ4Z3VSdUJBaXVzaHRyMG81cmx0VFhCQStDOTQx?=
 =?utf-8?B?dUlJcHVRV28zckp2SHlCclN4RC9KcEdTRGZhdUxRRW15RjdacENWc0J5eklw?=
 =?utf-8?B?RlVEVUo2SmZkNDdhZjNrTW1acCtEam0xYVROYkxaNytSaXUxajlNa2c1Q2VK?=
 =?utf-8?B?OFJqTXhpMW5wekprYXRtM0Q1eFNLUTlnQStkQVFycnpvSmxXZHZhR012VlB6?=
 =?utf-8?B?MXZZK014VUZzMnBDbG56cnE0TFFYK3NIMitablltVVVZTG1WK1llNjJrWEly?=
 =?utf-8?B?bEd0VGdHV0dva1R1TkFmYVN4ajlxaHFSak0vNDBlK053eFllUjhjN2VOVkEw?=
 =?utf-8?B?NEh0RkQrS0xVdUJSUlI4WUhnUEt4Q0JKQ1A1Q1FjYm85NTVTY3IyYVFHZUxo?=
 =?utf-8?B?SlByemQ2WktvYlFBSFNTSWRzQzczYWxka1RQaldhaVlJaHVlSGRaNmN4WGNT?=
 =?utf-8?B?dFQ5MDEwdk5Xd2dGMFJNQ0orZ09rTmdOL3h5dVR5dnIvR3hmVmswcnZXL2Iv?=
 =?utf-8?B?NFYzMkYrR0UzKzNvVkVsdFBmdkx2aDcxVE1EUzdMbGc3eUl0czFSSlpaV0lD?=
 =?utf-8?B?bWFZYVJ6eE5SclpkU3l1czhaY3dKMjdJZ3NXN3hFanI3bnh5YkpMSUx0dXN0?=
 =?utf-8?Q?1ReMnTH0e79d7S1z0noM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318f5510-596e-4fee-3dc1-08dd9c20a58a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 06:43:39.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8866



On 5/26/25 08:17, Krzysztof Kozlowski wrote:
> On 25/05/2025 19:56, George Moussalem via B4 Relay wrote:
>> diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> index 3acd09f0da863137f8a05e435a1fd28a536c2acd..a9e94666ff0af107db4f358b144bf8644c6597e8 100644
>> --- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> +++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> @@ -60,6 +60,29 @@ properties:
>>       minimum: 1
>>       maximum: 255
>>   
>> +  qca,dac:
>> +    description:
>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>> +      link architecture to accommodate for short cable length.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    items:
>> +      - items:
>> +          - description: value for MDAC. Expected 0x10, if set
>> +          - description: value for EDAC. Expected 0x10, if set
> 
> If this is fixed to 0x10, then this is fully deducible from compatible.
> Drop entire property.

as mentioned to Andrew, I can move the required values to the driver 
itself, but a property would still be required to indicate that this PHY 
is connected to an external PHY (ex. qca8337 switch). In that case, the 
values need to be set. Otherwise, not..

Would qcom,phy-to-phy-dac (boolean) do?

> 
>> +      - maxItems: 1
>> +
>> +  qca,eth-ldo-enable:
> 
> qcom,tcsr-syscon to match property already used.

to make sure I understand correctly, rename it to qcom,tcsr-syscon?

> 
>> +    description:
>> +      Register in TCSR to enable the LDO controller to supply
>> +      low voltages to the common ethernet block (CMN BLK).
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle of TCSR syscon
>> +          - description: offset of TCSR register to enable the LDO controller
>> +      - maxItems: 1
> You listed two items, but second is just one item? Drop.

What is expected is one item that has two values, in this case: <&tcsr 
0x019475c4>

I could move the offset to the driver itself as it's a fixed offset, so 
ultimately the property would become:

qcom,tcsr-syscon = <&tscr>;

agreed?

> 
> Best regards,
> Krzysztof
> 

Best regards,
George

