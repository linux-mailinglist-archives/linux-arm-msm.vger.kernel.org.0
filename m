Return-Path: <linux-arm-msm+bounces-59727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE2AC6EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 19:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDBDE17FDDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 17:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F79328DF25;
	Wed, 28 May 2025 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oTfi+u0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2096.outbound.protection.outlook.com [40.92.42.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD628850E;
	Wed, 28 May 2025 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451602; cv=fail; b=Z/yOD2g6fw3C/TQ5vFAZgZlvztlHHxuINJVtX2Cg6329BEN4Nq6Il+Um/k1vcEFG2KJqlvcGqXD9BA9SJcmevxMUw9NfWFbbDkKKx8V5HdOnA83xA0aIpQz+354TNFLB97kQwHDP+bgxGRyoM1/GpT8nwCnybGHajABk7D7Zqqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451602; c=relaxed/simple;
	bh=IyhnJ+Jkmd+56z0EnHMUhZh1/Ij1EQdrQd7CWae2dAg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aZ8Jq6JOG+P/OQsztM+vE2DJdXDQoJ5TU7Lx/pg16G3vTT2lh5n+e64YzyyMXIr2DmASXY9egphwPk0QYozK6HT604sACtvao+jx1p8slq1/EQNYkVkIRIEG0RRvNBQ7NvddXc0m0EnZ0MNiejfCo89oB66CEzCdwJigElRdgy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oTfi+u0Q; arc=fail smtp.client-ip=40.92.42.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPVBqOvAQXMb2XrvyMcX7IgJHL42bqE4fRzFuYxBxICBfkRcUGr6oLgDs7cxyc/+UrwZrmntdYsc3j0KlGi1SBbyF7RiLan8cGK05ry961rcFCiGzl2ao4V0P/qP9Yuh3ZH/1pn2dybjPAlQTyRthTHBbxOkHI2wUbTKIpi+1g0c7Uvbp3ELuhypSK3oFtlarHhjGBsXx7TswNFAQ8XgCrimPOyChgTx62zbZYXCj+kDKg27PS4q1tid3p8MAiJIa17G11DMLImdkLoBxmvOKRMghLX6CTNup4H8sdwH/UFd9mVN7tvZSNgSBnC8KWZBvFUsSXUSH3aTl41bjElAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2a3pzE7TNIc3H3R4xPtmVoyu/kFbcDx8IAH0gl/pts=;
 b=rj0VpWaYWiGYFmuAzxFE5aXSQG8xz0dHMDfdDZQ5EbXydWZOtxNuoI88IyVWS8gknSJ4G4bSdnhNiQ64rsFsXdsdLkTI0aybvuVOvAbmsXiKRK8qmnZYALNBwExpC4rR/fnr0Rxo/Y3ja1QfeGu5FfGIlAqLLXXWXdyEjjpeoUkuUGF59mfqXmeCdcpy8ikSs8JfTOZFjxrkm1JB1rwTXwCap3P2cMOlX/Jh+z4Lr3YROpQkwY8LqN6u0+J3+sDh/pMMqco22uuEU5Sjuxs/1xlqR+38gxs3hxQ5mxGFe8Un62kMvDnFZxxf5gefmb5Z7fCHnBjdMAZEqATPhS+WNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2a3pzE7TNIc3H3R4xPtmVoyu/kFbcDx8IAH0gl/pts=;
 b=oTfi+u0Q2v/uQcmjYPNxJYSMlpeS26M0n3oYmMq70ghqLHwhGuvz7X0NpzM2OX60FHKBGhAjW0H84QpeWGxoZ8HAi+uBtXhPIjfJ48LOCQEfkqlWwTDd460AJixfrcADy5eblpWcxCEG6ndnYsSFc0YQHwOdDv3k8wdVFGgxqH09M9C0x9asDruR6yckB+Z93nwPpUr+awX5QPu6G36+2+p7z5z2JQIL/SCkw4PzIrRl0V187bO7TpZUE9cWvqEONJc3Lg/QlBXmXtlrCg/j5YvU2R+LjM/W4cq8BqHw5RQ9YUWg03J4fCOzCrHScdei4rWR3kOU7Thv2T13Xg5ybg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by MN6PR19MB7867.namprd19.prod.outlook.com (2603:10b6:208:46f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 16:59:56 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 16:59:56 +0000
Message-ID:
 <DS7PR19MB8883581EF8CD829910D3C1C29D67A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 28 May 2025 20:59:45 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com>
 <174844980913.122039.6315970844779589359.robh@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <174844980913.122039.6315970844779589359.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MR1P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::29) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <b962c878-99e9-403d-a6c7-9e0d4242e5b1@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|MN6PR19MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: f5522a47-3249-4499-fbce-08dd9e091213
X-MS-Exchange-SLBlob-MailProps:
	f3ElpFvzDvb2LxyFZ7GGNdRXwolw/3DRxzCcLV/PgO7hX6bvxq0o0NvuJsgYjpWDEmQkYaRq3BPO3iqx5I9VTc9mJ9twA/5/TDv+T+1F/+kupAlaWUpmwblTzX13BzY8GHDU9+juDRdel+t1zDIB0GwIvwPrQXYyMn78Jl1KYX/ET3sFfmyH2VIXPcfwYA/vXvc1rKq2xThwkZUTi7p6YcrZxWcKjGp1j6xPR6gb+AL4dRtYZeX1g6t4/EkiWUTVHYAM/Mvvu8JVjMXCoNphkszC0++BkG5qpwEh9T64hlETUherF6O+lYniMnxTFCsVju1v3dpXxLR5n4myDobT03WgOk0M0l4f3ph4j4qajeL9T8fYgHcmQO+SAtZcyrvvJpSV3ZawODm4odKE+TAIWT1z9GjT6COS3jAdS4cojZcv2NcpC/ipbxeaZO+H/+uCcs2sWIX5+XfYMBqeOR1VL1XpqP9TvQcWvLTA4zuSuGxljnSKunNQ5x2Ke8YVbu/Rb9qnGQtbLQwQh5Mww8ioyQNINgYkHP9Dm3+VCum8jIeCZRDuFRfLHuKRJv4vk/9BVZfNHE324ko3lIoiLtLDXVFRi0kYWEJwr3wTAAxicwIg+cxF65bPQGFbrCffg42icKawK/axiwrbvbKi4kq/Aqmu7sY41BR3DVjNZS2nXZDQZ+cH7qLC/J/vXd1IZeGQMwpZjf1yjysH3uqIDtECkZx1YPbtbEtDiA3katTVCyHBeY4baYsWrn7zbBBvFlFCUZGU0jvI02enDnz3IbXNKPImwU0cMO2EjGsiZBH3If2wZCwH3ra1+a0v0Pe4A1m8M5cIoD+TjB5t/afoSkHp2jRWL5cX+b72tQE7oTr+PV6o3/kfrjvByWXhahwwb8PnwgnJGWCI65g=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|15080799009|19110799006|7092599006|5072599009|6090799003|461199028|4302099013|440099028|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm5HNGRxZUpmc3ZVQVY0OElpUnY2alBtVFNiMDE1c3dyVnp5T0NRNENGT1Nv?=
 =?utf-8?B?c1IwRGhPSVpxZUNGRVRHVXNVdi8xZ1hSQ0V1VjFGWEVNdXJwVWpLTXd2VEZq?=
 =?utf-8?B?WXFuWTRFY0dyU3FQbUxqNVJHMFlwUHg4Zk9yZkJKNmMrbzhSRVJZYWJ1YnVx?=
 =?utf-8?B?M1h0b2NGM2VUUXNIM0xBTmhjZ0tiL3dMNm1sVkpYWFdoV0RPVU1QejlQTVBa?=
 =?utf-8?B?OFBTN1JnTktlK1ZwdFNLOHZMcFZWRmRtaHlMcUw5MG1GRjdCQVN6SG50Rllt?=
 =?utf-8?B?c3ZWVi9vbmI4UVdZUE9qSUZVakFEU2JaMk1aMm1uMmdPeWRtejdpZ0ZYUXFS?=
 =?utf-8?B?d3dvWFpnZVkxc3FERmF5bzd2MGRIMXp0QUsrajRwZnVYbUhFaUFybG9UakNT?=
 =?utf-8?B?ajhnTm5rUEdrZnR4WTJIYU9QdDFseEZUeGdyL01BSWM0THhkK05Ca2p4dHFF?=
 =?utf-8?B?Ry9vUFRrOXQ0c2lVeHFFSVFvV2dqaUtJVTl5dVExNUF2MUFDODNISDdaY0Iw?=
 =?utf-8?B?OUJkZHZqUms0WWhrQTVCaCtLa1RuaTNZSVhqQWpqdUVCdHpwTlFkajFzajk3?=
 =?utf-8?B?bzUwSk8wcWUrc3JlQy9icUtOWVQ1ODlVdkpTQnd3Rnc1blVKdTNMUE1lY2N5?=
 =?utf-8?B?L1FyMHZmK00zYUluRDNZNTNLVkx2YjZtR1ZWNENrUjRGb1l3cFJuUTZ1R3Za?=
 =?utf-8?B?VzNlUG5mUzdFc1NibVNQY01PbkM5cFF4clpWL3orTXNjdGp2OThMTE9TenRx?=
 =?utf-8?B?aEpBSm83dFdGRy9uZWtLZUVUUzg0eE5xNlFVdnEweFFSSFBROTJrNG1RMlZN?=
 =?utf-8?B?MXpTRUY0RTZlaEJwakFHeEhaSHNSOVJGYUFraWt6NEJxY1haZGgweUdQYk5W?=
 =?utf-8?B?M29NNVU0WEVDSmZoMmlZckphV0cxRVdjLzdZenNDUitmdStKMi8yMU4wMVpK?=
 =?utf-8?B?cUoyODBRYTloekp5ME15dkJkZnBMa3dIZ1Z2MjZRYldhZWg2UFZFMVdqaDhJ?=
 =?utf-8?B?Q2lucTc4YnY0RlZnaWI2SVluSzNtWEc0L1B6Y04weldMN1NqMUZ3YUxFdlZG?=
 =?utf-8?B?NVhUQTRrUlhoRjFwb2h0S1ZSVkVCWFJJOUsvNVF2Z2RySjdrWDVSTDlVdXJp?=
 =?utf-8?B?a2FGMWxHdXB4MUwrdndydllEYWdiZUkxUU1LRUhLNFo1T2VVTDRqTzMxREF0?=
 =?utf-8?B?VUk5TTJaL3lqWmc5U3VNdFMzRXVUWEdNMUY1US95ajlFdGNpZEc0bWdpN21i?=
 =?utf-8?B?Mnl6RiszUDFhcGI1S25jV2F0MU5IRE9WdnNiR1Z4bG9GTS9KWlFJVU5MRCtZ?=
 =?utf-8?B?SVZHTjBxR0Q0cnI0bTVDbU1CSFhJZjl3azdHOERYVW0rK3B0L0xROTBnMmp6?=
 =?utf-8?B?YVZQM3VMNk9MWWl5enpBTDE3QnE3OHZuSVdsejIzcytrVDRtS3VMTFRXdEkv?=
 =?utf-8?B?VkxXTnhocmR4SUVRZEQrYmtXVktQNkZKWW1YYlNhajBRNUVVcmtSNlBUZjZC?=
 =?utf-8?B?Q0dGeDd3TWR5cFIxNFVQN2dUSzQrRXQ5ODdIS1p2djlyVWxyaE5CZThHcnRp?=
 =?utf-8?B?MisyT0I0Wk1uWU5PZjhkUmthRlE2KzFlL1cvbWZLQVlMdXlPUkg0dWkxOEQ1?=
 =?utf-8?B?NXljLzlTUVVFRkVvenZWcFk3cWVPcUVwMk8wN05DK0YwU1ZPaXVoYTlGeW5t?=
 =?utf-8?Q?z36Sdrb9KGO88OMYOqoB?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjVFZnlwWTFzaHR0emZ5L3AwNWMyOUk3ZVVmbGtTM0ZTZ0ZGbHhqZnlhaStF?=
 =?utf-8?B?bWx2TmVSVGdVTzZDcjlhVHdUTlpEczFRWjlSWGFKOFA1K0JHTjJMbkJNdFdz?=
 =?utf-8?B?ZHZYSUhGaTdUbUJ1TFlwZnFTNytQZ3ZTdGZGVWNORlJWMEU3WHZSRUJqeW1G?=
 =?utf-8?B?WDZVb1ViQW1NbnZFeTBQU1JUU3J4TmN0eml6MTN2SUQxczNHR3g1SjVTVjBK?=
 =?utf-8?B?UU9vNUhHRjV2QUszQytCZHlYVVpjY3BEQXNjdDFUWS80MGRtamJxQ281cVhy?=
 =?utf-8?B?V2MwYkxvRjUvbG5UNVpkaFVUclZsOVJSWjJubGdCVjRVcDNtYlR3MFkyeFRJ?=
 =?utf-8?B?QWx2a0UyQ1FsTXdtejFjY2I1RXJaakZRNXlMTUlkL1R0U2ltRHVIR1hkOWh4?=
 =?utf-8?B?Q0l1azJrbWprV1V3bnkySDMyM2hacHhzTG1GMzhwTzlIL1JnUEVKUU9MMVNy?=
 =?utf-8?B?WjFWOGtDbXk1d1c2aTVFbzhDRUJPRjR6TnpkZ1I3L3dpMndPRGRSVG9VRndp?=
 =?utf-8?B?d1RmUGJHdFNoVDZkNTVzNHYyNWJLZC9zZlhKOWN3dGJtS3ZrbnQ4NjlER2Ni?=
 =?utf-8?B?aGR1TzNXMU9WVVphcVA3ZitRU0RuakhIVGE4aHJoS1VZRnUvU0lRMnlrSURs?=
 =?utf-8?B?bkU4NWZTM3RveXpndGdMRDlLZEc0QksrdHFndm1yaFhmTkx2REtLRlQ1NDJF?=
 =?utf-8?B?ZUNUVlpxTUtLMW1GcVRMWC9uTGJWRCsrZDdmL3dXdlhPVjhEaUMvcEYyenpn?=
 =?utf-8?B?dGtHa1B5aDc3V0hNNFpVUUU0eklLSnVPNGFDVHprd3d6L3liVWVza3pRZ3dx?=
 =?utf-8?B?eDVCdTBlSlIzWTFKc3JOeXo5T0RmdkJQYXFia3dsdXpqcENQMTR0YlYvb1Nx?=
 =?utf-8?B?Q2d0RlhSWVFLK0JvODVHV21kMjUzTm9mTzQrbm9zMVNvUllyRHNLRjZTWk94?=
 =?utf-8?B?VTFyUy9ZTldjR202NFQ1QVAwdnNWT1pKOVM5N2Nld1pQaUZoRE5ZT25CK3hT?=
 =?utf-8?B?ak5reVBzeWM2YVM3K2s4d2s4MXhRSlVjOWpsTWFURExhWHFRU2ljWVJsaEM3?=
 =?utf-8?B?eG8wWXlSb0x2Vk5MQjk3bHNkaWJ0Zm1iV1Z3RGhNZ2NLZEp1ZDNWVjlocFE4?=
 =?utf-8?B?VUgxbmV5d1B1aUdNQVFpbzBXc25vTWVBSFZaeEZZWXdLaHlDdFhlcUVyc1M1?=
 =?utf-8?B?QkVORS9FMUEvekxtNURIZUwzaUN3R1RiQ29nMVRrWSt2TGJ1R0tQWkdEcmJH?=
 =?utf-8?B?QVZ5N05hK1ZBRGh5OXBpdmNmeGJUblEzNU5EMmJvUTgxRnhPcVIxektQOW12?=
 =?utf-8?B?a3dwbWxyUmw5RFNkVVV2bTc0RCswdEMveVBsNHFJcjgyRTRBRjdlbDR4S3Vq?=
 =?utf-8?B?b0ZWam4yWEoxTzMycTNnRjZBb2pRQXV1RHdtRmNpTkJTckdrRk1Qa3RNM21Z?=
 =?utf-8?B?Z0pVMkpXeXFVVnBhZFV0VzFXNXJhQ2FhM2JPLzF6dUgxeS9HRmpBSjgxclJR?=
 =?utf-8?B?ZGdxZm5BdXY0YzYxMWhsRUhLdjQxamFqOWFKSDlMTzR1S0V1eDhIbEZlT1ZG?=
 =?utf-8?B?ZWZiYk9GVk1JVkwwRGQ4a3FocHIwTVZPa0ZhYlVrbjV3eDBVS0VKZXQzYlhh?=
 =?utf-8?B?RWNmeWVjVlYyTXR1Q2NyUUtmYko0RDV3M3Q1WE5kR21rYmdwUXA4M3BoWGMr?=
 =?utf-8?Q?dWI2Ln4EVRsONqWYjuKJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5522a47-3249-4499-fbce-08dd9e091213
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:59:56.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB7867

Hi Rob,

On 5/28/25 20:30, Rob Herring (Arm) wrote:
> 
> On Wed, 28 May 2025 18:45:48 +0400, George Moussalem wrote:
>> Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
>> SoC. Its output pins provide an MDI interface to either an external
>> switch in a PHY to PHY link scenario or is directly attached to an RJ45
>> connector.
>>
>> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
>> 802.3az EEE.
>>
>> For operation, the LDO controller found in the IPQ5018 SoC for which
>> there is provision in the mdio-4019 driver. In addition, the PHY needs
>> to take itself out of reset and enable the RX and TX clocks.
>>
>> Two common archictures across IPQ5018 boards are:
>> 1. IPQ5018 PHY --> MDI --> RJ45 connector
>> 2. IPQ5018 PHY --> MDI --> External PHY
>> In a phy to phy architecture, DAC values need to be set to accommodate
>> for the short cable length. As such, add an optional boolean property so
>> the driver sets the correct register values for the DAC accordingly.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   .../devicetree/bindings/net/qca,ar803x.yaml        | 52 +++++++++++++++++++++-
>>   1 file changed, 51 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qca,ar803x.example.dtb: ethernet-phy@7 (ethernet-phy-id004d.d0c0): clocks: [[4294967295, 36], [4294967295, 37]] is too long
> 	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


Really weird, I've checked this numerous times:

(myenv) george@sl2-ubuntu:~/src/linux-next$ make dt_binding_check 
DT_SCHEMA_FILES=qca,ar803x.yaml
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTEX    Documentation/devicetree/bindings/net/qca,ar803x.example.dts
   DTC [C] Documentation/devicetree/bindings/net/qca,ar803x.example.dtb
(myenv) george@sl2-ubuntu:~/src/linux-next$ pip3 install dtschema --upgrade
Requirement already satisfied: dtschema in 
/home/george/myenv/lib/python3.12/site-packages (2025.2)
Requirement already satisfied: ruamel.yaml>0.15.69 in 
/home/george/myenv/lib/python3.12/site-packages (from dtschema) (0.18.10)
Requirement already satisfied: jsonschema<4.18,>=4.1.2 in 
/home/george/myenv/lib/python3.12/site-packages (from dtschema) (4.17.3)
Requirement already satisfied: rfc3987 in 
/home/george/myenv/lib/python3.12/site-packages (from dtschema) (1.3.8)
Requirement already satisfied: pylibfdt in 
/home/george/myenv/lib/python3.12/site-packages (from dtschema) (1.7.2)
Requirement already satisfied: attrs>=17.4.0 in 
/home/george/myenv/lib/python3.12/site-packages (from 
jsonschema<4.18,>=4.1.2->dtschema) (25.3.0)
Requirement already satisfied: 
pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0 in 
/home/george/myenv/lib/python3.12/site-packages (from 
jsonschema<4.18,>=4.1.2->dtschema) (0.20.0)
Requirement already satisfied: ruamel.yaml.clib>=0.2.7 in 
/home/george/myenv/lib/python3.12/site-packages (from 
ruamel.yaml>0.15.69->dtschema) (0.2.12)
(myenv) george@sl2-ubuntu:~/src/linux-next$ make dt_binding_check 
DT_SCHEMA_FILES=qca,ar803x.yaml
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTEX    Documentation/devicetree/bindings/net/qca,ar803x.example.dts
   DTC [C] Documentation/devicetree/bindings/net/qca,ar803x.example.dtb

I only found the same errors when removing the DT_SCHEMA_FILES property.
Is that because ethernet-phy.yaml is a catch-all based on the pattern on 
the compatible property (assuming my understanding is correct)? How 
would we get around that without modifying ethernet-phy.yaml only for 
this particular PHY (with a condition)? This PHY needs to enable two 
clocks and the restriction is on 1.

Your guidance would be appreciated.

Best regards,
George

