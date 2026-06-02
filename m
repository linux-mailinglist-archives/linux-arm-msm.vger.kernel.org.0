Return-Path: <linux-arm-msm+bounces-110724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAWMOs1/Hmo3kAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:01:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E915629480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8740F3039C99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B4B3A872C;
	Tue,  2 Jun 2026 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OUpbLoe6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19011089.outbound.protection.outlook.com [52.103.23.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFA3A7193;
	Tue,  2 Jun 2026 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383313; cv=fail; b=aH9rlUCJIlOziEwPHzSaWqZMnkM/PGLFEm/D5gcJwNVLkW3NBN848G4s/EQfMcmNBWMfQZ8WRR/MkYojMyNWsgHZhHb46N/FJQ3Rrik0Ndz97bLoXnt5kqZ24UCvbZxHKNMWoD+nQWaboOBsLLNXiQjkg7FaK5OqPxZm7LqfSx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383313; c=relaxed/simple;
	bh=rXc31PvlLtgALLXPBI2q3M+GrKAGuTB7zpHMluZtWXs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c7gOXjXOrkQCWR6p6MmZQetsNfwuM5tDdeleVWotGYzwaIh9Gz8hldHdAsKZdqLOQE71nbB798517HLnj3WAyTNC2Xi0wyJnh5o127NC6/EE0FI16t7QL6gaAEOTzoQw8kGs6K8wC14G1/K+jXTOj51B/HHBq5MWAB1ty4HujKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OUpbLoe6; arc=fail smtp.client-ip=52.103.23.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoQuYWyzr5ihOV8G+ZVQaoacxU7xVkfK+pNxXg2UPNZUg7mpS635rTQT9IARCn+3bf9em5VcxEuqWiNPaEUKtdrYZ/EVBC6sTg0D6mmXtyyz1vTzDVdc4H/OexfA2Z4qnYclZ7rh2xQgP0jIKX8L+cDktDnhXhxABXEHEBwHjrKqC/lZ0d8LP9eylEUBKEqyXP+TtRMe2n1s925TNp/MxI8CIADr77mwkLjxp0Ayj/xHlR7fmcG1rAOkPh9hc40me5T4pdw/W6ho6XJKn6WqG7fvcrf2cDCbcXAnl58MS6LW7ClyDfAMDu0DfC2siE2dQwCnWF0OPK9QnwKAd1QUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zID1E5BWcE1RVvlt1i9gOVXuqcmkTXzqqd8WWLNXSss=;
 b=jXfoWhr9GkEqAxadQT6/IWS1wBbYKyUyaBalSMkRl582PBi6wyRnkmR0odprcxmjpkM4lPdVBi5tgwQ5241pUhqygSlqz8Hf4mecthRU1iYK8AJ/ro6LpKmDqWDtbo2b+UWrFmrfJVz17/YeTufV9ABOcDoELLbueyIiuFfRHP7Bs8sjfEe2SvY7h2u2Etx2Z3wvque9nhOSLbh6Fgz5iup4g+x4colKaG99+NQnNuI0a5IKLdXF2JudJfcc4i69lWkFPYpo2bAwwiLy7A8soJ26foNxMgl1nqZrgljKM86H7+6f1vliquv9Yl+BhNVCHy5r2+4TH8CLRTLaqGxC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zID1E5BWcE1RVvlt1i9gOVXuqcmkTXzqqd8WWLNXSss=;
 b=OUpbLoe6cs5EqaYIleEr6NG073NGiKuY51USsd/iyyXvFxECLx/MK0RbS2jWIs78W7LjPngW8b0bTCAiXPKP/eH4PRlYB4z+W4qkRUZYCtVemCEfsHdYgx+0bwy+YrJI3cIf2qIBcLWor0RH7X9RGEqWyH0iMD/Kx0PZLZzFZEc1eH+4U09eze1DhS9r/GpYEp5gHnTBuskw1b1rfVVnNYeVcOYAbQmydqHXJD/bCOhUTGv1uKeUtcMSawHCXgAe5+cxrALHEqryihEv/mTn+RxEMrGx8YyTyqSRfTYxcHTTnTao+b2lHhsuScOCYd+6v1f+5Pelaaa6bCVFxZva+Q==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by LV0PR19MB9212.namprd19.prod.outlook.com (2603:10b6:408:327::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 06:55:09 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 06:55:09 +0000
Message-ID:
 <SN7PR19MB67366D77B57A0325A4F3B67C9D122@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Tue, 2 Jun 2026 10:54:58 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: qca,ipq5018: Split IPQ5018 PHY
 bindings from ar803x
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>
References: <20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com>
 <20260601-ipq5018-gephy-clocks-v1-1-2df8287712c3@outlook.com>
 <178033592356.3996739.1050010038980629699.robh@kernel.org>
 <20260601204925.GA4132990-robh@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260601204925.GA4132990-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: DX0P273CA0009.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::17) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <4b8f1baf-a808-4b18-95f3-fadab355422b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|LV0PR19MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 044df9d4-82c2-45d6-3c08-08dec073e222
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|12121999013|23021999003|8060799015|19110799012|15080799012|5072599009|55001999006|6090799003|24021099003|37011999003|10035399007|440099028|4302099013|3412199025|40105399003|52005399003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDBXaTJwVSt0U1JSUENpV0x0eEVRVmFZRzVHRkwyOFdBb0xSNzIyZnBQNFV6?=
 =?utf-8?B?dGtrMGNYa1ZaWWhrS0M2bTU2ejZ2VmJyekZydm5yWExQcGhHdjlxdEZUaTVO?=
 =?utf-8?B?YUJ4YURRUW1MUWhlbFNFWm1XZTk0d1Y1TUhVZXFTa1V2eUZUYU1rNlNsdU1T?=
 =?utf-8?B?b2NmYTdwWXcxbUpjeW1xa1hwVVQ5R05pVEtWczhvczFBeHlzTSs2anp1OFlC?=
 =?utf-8?B?aE1abEl4Z2l0NUdCZ2JOalZVTFBPUTgwano1SEgwYlZyaHh1OGovdFZIVWRS?=
 =?utf-8?B?bjZGT3Vya1lES2t3ZlBTTGRDakdnWjh4bitJRHNGcHhhVWV5WXhscDhhN3V1?=
 =?utf-8?B?elRNeXRKMG9xVld3b1VZa01wZXZ0TDhQTGtFaWU3U2NKdGlaL200WCs5RWll?=
 =?utf-8?B?WEJodVhScXZxL1RJUHNpcnpGWWdveDZnWnhDVFZFenh5bFcvSDZwczdONEZH?=
 =?utf-8?B?MFZFd1NvRExmbWU1MU1xUVNpUmEwQzUwSExFSFdXQWFxZWY2V1RyYlJTSXpI?=
 =?utf-8?B?WW4wQW1NRzZWeHk2Wk9naytYNG04ZDY0LzIvbDJSdzg2YWtqc0ZGV1phdjY3?=
 =?utf-8?B?M2IwcUR4WkdERTR3L29yQ2EwT1pVbllBZnVCMVpKMWNkZnFyUE5oOFBXL3VR?=
 =?utf-8?B?ZDdpTEFWb1M3b2pweFA2dm1NNHlycTBSVzZrR2ZCMnZPYVR4U01VemRLdC9v?=
 =?utf-8?B?amtWVlRUb05VcVVjZkRpK2JRc0xTdWxOWmpjN3BFVmdzNGM3ZXprOGNiTVhX?=
 =?utf-8?B?K3BkalNpN3JwQjcyYVQyNTVXUTVXS2dDUDVqMitQMHRKeENYL2MxajhJOFZC?=
 =?utf-8?B?VUxYSUVON1l1QVlpMFhYSEpOL2dRZXR6Y3VadGVPT3czVk9iTmZ3bGF5cU1x?=
 =?utf-8?B?a2p4cXc2UCtZR1VXQjhjV0JRb1FMa0RCaXkvWmNUR3gwM2xWYWdSYUVaNlhv?=
 =?utf-8?B?QXhrWXFwdHl2T0xPR3EzK29TY1V4UktJU0RzY3J2QUZSK2t0a0Eycm41NWlJ?=
 =?utf-8?B?Snhhc0wxZFhvSEZSNzJKYmtIYURXRDMzZXh3UWVoa3dJUFd3QlV1bzR6STlu?=
 =?utf-8?B?MHFVZllnaEpJNUsyWVV0a0thMkU3eE5sbUdhZUovODNpS1U5L045TTJKMEZS?=
 =?utf-8?B?UmFkanBubE9iOGlKTXNMdGdoRWs2T21YS3QyQnExYUtHNWpvcU1XcGI1Y2lC?=
 =?utf-8?B?WmhyQmlDWllKYmhxRlZ2eGU4YmEycjlDRzVqSE94dCtwUUh4a1NzeFRQck5t?=
 =?utf-8?B?V2ZwdHdqbGs5Q3gxWkFzeWhpSUY4Y2p2R3hpWGtsT0dnSmpsbHNWQ3FITFBx?=
 =?utf-8?B?YmxCY3diMHA0elI4QldqdTRQN1dLK3FYb2xCTUYrOXdERGJWaVVsZVlZQklF?=
 =?utf-8?B?QmYvK2JiUElBUnRWUHQrVGZqcW1BK3ZpRkQySnpGN2hHUkU3emhPZHcrcTgr?=
 =?utf-8?B?WVR4Y0E3LzdMT3EvZlZKanBmcW9uYm53T1hrcVFTU1RsSThXR0NhUFhldEhr?=
 =?utf-8?Q?/2x838=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjhXUitRYXNWWjJYZXpzMmliVFhPSUxaVW1BYTN6amxXV3NCVi81emdOTDZE?=
 =?utf-8?B?K3Z5OHMzMnd0eFVzQW4rNGtmNGhvQldJU3RwRUNDYmsvM1kybU5KazZ5ZDNN?=
 =?utf-8?B?R3lFWGdGU0MwQ3YwWWdEZjU2OG1YZmVyYTZiVkljRkloQzFhYzY3NVhwQUNr?=
 =?utf-8?B?RlB6SCtYOG5zSjJTZVc0dlM5WDhCekxnWm1zOUFNQW96bXU4bUhTS3dVSlJq?=
 =?utf-8?B?Q1pOZFZMK2pRYWM4ZC83cjFoYmJrdVBmVTN6bmttVjlaYmE5MS9hK2h1Vloy?=
 =?utf-8?B?Y0RwdHkyOXpod21EV0cwOE04RUxwVmNWZmZIc1lXWFFJaDk3WmR5ODd5S3J5?=
 =?utf-8?B?bFgwdHVTK0N3VXVObk54QWpXbGdjaHBQeGlGTHZSWEgway8xUWszNDlxL2Rr?=
 =?utf-8?B?c25oUXBjM2tOUThRcFlCajhSaHpsQm5TQmFCNkdoS1B3SC9lb096cFdNYmEv?=
 =?utf-8?B?NTh0MEUyZ2I2bGZOaEltd0ozeGYrUnpqeEVZaGJCaUlBcE51TnNyNllleEZ3?=
 =?utf-8?B?ZzVPQmdFVHppM25iaW5FYTdpZVpTbFNRN3FaMXRvaG9PSGtVVnlnZkZkMHp6?=
 =?utf-8?B?cVBjUmxia1hHc3JCSDNLdnVLeVM3ODhKendUNDZhSHg3K0FhVzNnV1dLcEkx?=
 =?utf-8?B?U1NWR0x0bnJQajIzU2ZtUDFwOWVrUGRFdkNlTlQ2b09IQk5GeTJZVER1VGJW?=
 =?utf-8?B?aVVUMTdPQmJSU0t6N1ZZaUMycDRRRGltZlZlQmpVMzlDK21adllJaVBHM3Zs?=
 =?utf-8?B?YkwwNzdGWU1ra05qelR3b25XWllCUCtZbVVmMHBYTGxKcUtjOFlKdS9GeGtj?=
 =?utf-8?B?TjRwWlA1dHl4T21neXNyeEc5WS93cjN3MXF2WlFKd1dXdnZoRTBmQTFBTnY0?=
 =?utf-8?B?SGZOM0RmTjNXcXBiOUY3SE4wOE0ra25nTE8veEV2eXRUTzEvMDJvQlhod216?=
 =?utf-8?B?OU80RHZYU0lGbnpsdlpsMWE1WDQzY2V1aUlaRHQvdSt4clczeXFGRkp6Qnpx?=
 =?utf-8?B?TFNIQjRJMlVRZTVYWW43RXpXZ1hLTTRQU3VQaGdySEo4UXg3czBmZmN6ckU1?=
 =?utf-8?B?ZVhvVnRZRmdWY1BzOUgyZURhbThQRzlQcGxRMldRR3U1N2N3dG1Md1luTndF?=
 =?utf-8?B?SXF0UkZYUERVQUVOMHpxTkJSL2FUM3NkVkxRV2lad1IyR0M0NjA4dlB1U3ZO?=
 =?utf-8?B?STVYZnp3UmM3U1ZLOUhZZURSN2MvWXo1Rm9tb3BBVitiNit6T29NTFFxOUNX?=
 =?utf-8?B?OEJOSHNzREo3UUdnVnBtMlZBeEdhRG1neGVoakFZOVpsUitVNHJJdGEyNWJj?=
 =?utf-8?B?bFNDdzBrdjZYQnZOQkpVaVBtTVpaZnlYdzhRZEFZbGRhVW5XU3RaMVN0ME1S?=
 =?utf-8?B?YzhNUWcxcmVJbWsrWlhOWVhzTTV3UlF4SkJMVFFmVmZGWm1Ga09MdHVSSXV0?=
 =?utf-8?B?eGhUb01yTkxML2pBRlZ5M1B6WlFyWVZibUR2T082RFhrblhXUWFaeHJTM2xh?=
 =?utf-8?B?SGVHYVJ1eVFObGtJVXBSOUJQcVB4dVZqZFJTTTJyWW5ub3N2VnV1aDh0RmZB?=
 =?utf-8?B?ZU54bk1UY3M4R2JoajJQdFQrb0tVVmpja2xCUWE4ZExhRldURXdkZzZjOU9N?=
 =?utf-8?B?a1Qzd1hNWS9FVUNRVjV6RCtUd3UzNzF3K2JtOW5Oc1NoUWJQbDlrQVdmWWRa?=
 =?utf-8?B?T0t3VUsyU1JDSFFqRFBpSGhvTlVIdlUzTXJQWnNZd3B2MTZLaXJmWkVoQzdy?=
 =?utf-8?B?eHZGd3VGaXFlUmRRbTErdTA1MnFPZld5YlJnalQzSktXU0hNcjRFYzg0akNm?=
 =?utf-8?B?eTNxNDZGUnpOUWNmRmZZeW5FMWJSYUlsWHp1TmpHS3RFZU90ajdxVzhxS3pE?=
 =?utf-8?B?NUcrazdQT3hTbjRETTJvNytzNm1JY01adDEvUUZ4OHlMenc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044df9d4-82c2-45d6-3c08-08dec073e222
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:55:08.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9212
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110724-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,oss.qualcomm.com,davemloft.net,google.com,kernel.org,vger.kernel.org,lunn.ch,redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.1:email,SN7PR19MB6736.namprd19.prod.outlook.com:mid,0.0.0.7:email,devicetree.org:url]
X-Rspamd-Queue-Id: 4E915629480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 6/2/26 00:49, Rob Herring wrote:
> On Mon, Jun 01, 2026 at 12:45:25PM -0500, Rob Herring (Arm) wrote:
>>
>> On Mon, 01 Jun 2026 17:19:08 +0400, George Moussalem wrote:
>>> Move the definition for the Qualcomm IPQ5018 Internal PHY out of the
>>> qca,ar803x.yaml binding file and isolate them in a dedicated
>>> qca,ipq5018.yaml file. This is necessary due to the restriction of max
>>> one clock in ethernet-phy.yaml which ar803x references as further
>>> testing revealed that the RX and TX clocks of the IPQ5018 PHY need to
>>> be explicitly enabled.
> 
> Just splitting does not solve this problem as you can see with the 
> error. You will need to drop this constraint from ethernet-phy.yaml and 
> add it (1 clock) to every specific phy binding (that uses 'clocks').

Thanks for the advise, Rob. I've made changes accordingly and sent out
v2:
https://lore.kernel.org/netdev/20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com/T/#t

Mind you that you'll likely still see an error coming from running 'make
dt_binding_check':

  DTC [C] Documentation/devicetree/bindings/net/renesas,ether.example.dtb
/home/george/src/linux-next/out/Documentation/devicetree/bindings/net/renesas,ether.example.dtb:
ethernet-phy@1 (ethernet-phy-id0022.1537): compatible:
['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

This was already there and I checked against master.

> 
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>  .../devicetree/bindings/net/qca,ar803x.yaml        | 43 -------------
>>>  .../devicetree/bindings/net/qca,ipq5018.yaml       | 75 ++++++++++++++++++++++
>>>  2 files changed, 75 insertions(+), 43 deletions(-)
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qca,ipq5018.example.dtb: ethernet-phy@7 (ethernet-phy-id004d.d0c0): clocks: [[4294967295, 36], [4294967295, 37]] is too long
>> 	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.kernel.org/project/devicetree/patch/20260601-ipq5018-gephy-clocks-v1-1-2df8287712c3@outlook.com
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
>>

Best regards,
George


