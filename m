Return-Path: <linux-arm-msm+bounces-59545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BB0AC4E88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5398C3BCBD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A856268FF1;
	Tue, 27 May 2025 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="POb0RdHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2045.outbound.protection.outlook.com [40.92.23.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C015267B9B;
	Tue, 27 May 2025 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348013; cv=fail; b=LB/zdPmHM73nTKagEzmxyd+5opgIldkydaPx0HwlHoePBJgWqQOQJhXRFcMUqbuXOtntwh1eyztg3fH/4+FOvfQltUKEfTOWdZPpaZMVIgWUc8+RccAbz/0XWmRyVhBxnddb+LvlAmlicooV0BwBKYlo7vNWeDF5fy70ZDngAU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348013; c=relaxed/simple;
	bh=AeY4ZjVp/y6vvUKlppxXQgEMVhUb7VbSrKq23mcmqp4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Aag8nFUeOiAqG98PCg/mjWdG/9pGkqgsj9ENKoz0Ca+7FQhZp/ITxMGU89Ea7AF0efd2R9fHWY/yJJGvGYfJveDIH06bcZSYHO+v88VmVBX0injCKB2AhqMI87fpnKFwzb5SKa2H18Ri/tNDoh5rygRQzjgQL+JyO/Z1T0VjVtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=POb0RdHp; arc=fail smtp.client-ip=40.92.23.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8z8Bqrn/9o7NIFRj2ItWQxFiRY5mPq4yGkD9zNtBWNUGW6ijrdBPFuaqu/NcQ5YtO5oBLoUso+S/xo313p11WA1rgcOHfpN6HrJHCdT33hMn4OItp7EEbF8DAibZhVzk4R+sbCXKmAZPFmMsLeYtw8euhPm0EebH2EyrSl85pb+vCVno4Zch9D9ae7VlqmsuEXKhmrMjBMoA25zaRp/z1UL2WhpzNV/ONwcifMIZ6EKCItXzJnOjV6J2q9VMKGIF0ZRiWygK6ixiAU3M1damw1DQT9BLGbkiBF/KhTxaPbZKOjzQgMuVfRyyJ5isuE/8pCtahkth5PFyvexIFY+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeGg6LD7tR2W7wJJwZ+aMWLRU7ZgoPLzS2tIQJRS6oQ=;
 b=vgv5zw9pRY7bgqQ5r7GCaaPhrBDuxD1wvpl/ad9KPju2F5Xmc5xydb3z1+v53As5rlOGJm2B2yzlvlrn7iqhmQwZvOkMz6FYj/IJlOSNrkgI2nX9uRO3D5gK9Gg5M9uWk2Y+k3+E8eiERUfZ5KCSdigt5pinN+iasqRLav2kj/IIpRKIZU/ObzJQ4+jsXPKra7JXZ8IGgQPBiZUxq03X7MS8EwEqDDboPeXTgXtEFyea+gKcUQYmpyg2rN3KdU6CwmN0rxW9oMOA/CgVGYIwSapW8MGE5M03qSYuBVxJu4hSkr1/KFcK7+WdGtBbOQd4GbmlSUQMLZaNM/XkcLMsGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeGg6LD7tR2W7wJJwZ+aMWLRU7ZgoPLzS2tIQJRS6oQ=;
 b=POb0RdHpGbN42VVZOhYQuppgGOFd5MMWof92L9hN/jGcS2vROH2NYfZbP7iwDwa6SxLw+do6FehkVt51cq6Cx+eRr3YKGW7D/V3ZK1AaHHCVjnbeLEcZLEwbyQ7XpKhm2NLmqFYpBGLXcYvXjfelKoelAlxEnGLyhgRuaYwTg/P/R6O0iBDjmun/WKG2/qS9kKa6+xDKH9VUKk2eLVLjJy3Es1MynpompnSzalGwA7a1ChxN8FCZvaHJ6CkT3y/IkWQcP6oDeP0840FI3chNaS8jl+TNI8gzeV3zLIM0+e+gNjQSyf1CVc5s6fNrR4cwmgaB9bGlqsSEoaNjesp4jA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DM6PR19MB4184.namprd19.prod.outlook.com (2603:10b6:5:2be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 12:13:29 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:13:29 +0000
Message-ID:
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Tue, 27 May 2025 16:13:16 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
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
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0060.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5a::13) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <2c37d412-bc62-4d3f-be64-db61d9efc3b0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DM6PR19MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb6ccc7-6244-4e1d-5ba5-08dd9d17e37d
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBu6m38okHpoNWln7NSyvc1VJ+D275Wu8xLXQIyouslJPYAeHdlU/eWe1b7P4zA0+nHPkSs3R4ulN/Q+7eJ75egY9CK0rPfylwWw/Li/3Og1XLTgQVF31ChP2Hf72/P3sEclD8UqNthuQNbqEtpwSsYi5aQItkH0MHI7gOPsdlSMAJFMkMflgSbf+fqGA1cjSzbzyxQ6izgLf7840ecETIjBomXKpPw+Msz9t0ZZ6tLZK+VyUM4ijhhQTAlm5hhDfyP/hXjXxgRziF2oXTJqCChyZcteXjWWfmU9ooB8UQ1bqvaMpgMz75kzI9Qxm4DTCkAW2/qj5bYHmkVKE3CezYRP0pSVY4lxWUbe9DVlTZ1CG7vLVomGE1fyUtYUdZrDin/5JTraStbQ2RRh6CNyI8zNlP0KI0CL483P5F/xawDXYwZU2gH060KFwZts3Tq/KlWTuUh5+4BclBgeHrYVJiAwHmpH3m7u/FVykbX8Ahx6kC+k+QJ8PjbM2iiuHDh8YALGPlIGK4HruwFxN21SZ/NIXEHwUmgt5+iSFDbPjUQ73he0wUfrp52EpBDagPOfI7nH5mEHvDXXMiZPegwe8hM1Rv5pWUU3x0PNq3NMCTvJ9iugRokzWkqbYdYBwlRJRMCWExu4XNSZhNAm9lHiO5JerIvrJ9j1N5w2xtL+GCWkFwZ74ZDhwUlS8RbWEAFEmFTDXqoeXcGmMfR6rFksRX+1NTzWVR41/A/QSGBsqiuQYc1/IXkla10yf27u08Q0UFtZD0yEu9nmhsoPlj9bPP+i
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028|12091999003|10035399007|56899033;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVRtaDBnVjR0WmFPT1RlV0hZZ3VqVFFRcE14TU9ETml3MStYWG1nRkFieFJW?=
 =?utf-8?B?R3ZiNjh2Vm9hdFU4MmxjbHV4U0pDR1ArdEtXUk9oTSt6MzlBZk51d1hZY1o4?=
 =?utf-8?B?NUZITW1mM2h4Mkg3UnFEZGlTOU1FS2IrcWNoZm1sdHdDSU0vNXFWeStRYUx2?=
 =?utf-8?B?dk1hT25OeWNkQkVyNGJsaXJmRWlkcHRYMG8wQ3UzU29Vc0N0Mkwvd1NjZnFI?=
 =?utf-8?B?ZGZoMXpYQlV1cCswRnQxWXBvOThDaHR4VlA0bTFQUWJ2blBhUHFjNEJqMWll?=
 =?utf-8?B?alRBNVhmcU0vSXlGME1XUzNVL2IxNFdoSEtzTDZKbll2akYyNFZrc3NiTDkw?=
 =?utf-8?B?YmMyUW4xbkFwYnhkS0t4byt5dWs4cmZyNitxVE9oMEc0dm8zRlg5TnVQQVVs?=
 =?utf-8?B?ZzRFMWJPV3ZhOThYSzJkZkZUMFRsWndEVXhNYmlYbThiQUQ3QlNNUDEyQmJV?=
 =?utf-8?B?MlptRlNvczBWdXdLaGJCc2RNVDJOeVQ0aWxtOHE4dTlxMEhtL1hBSTRSVVEw?=
 =?utf-8?B?a212NFdLYUx5eEdMTGtxWUh6K0tjTWtubDJhc2tBcGt5NnVKQTBscWsyWXIz?=
 =?utf-8?B?WDVubytsK0tDaTA5TE85SGY5KzV6NXF4UWE2ZFZ3SVNpTjlYVmlMTlgwZ1d4?=
 =?utf-8?B?RFcwdU94QldVM3pxU0ZnbWlMbEJPYVA5Nm1PbVRkZ2w5bTEvdlRUcXV6UXRJ?=
 =?utf-8?B?aDB3U1c2TVRRRHhWdkpnVFNFY28yWkZMVDcxN1dSRDdmblVXTTl6a3IzZjlu?=
 =?utf-8?B?VWJ2Q0o4dmhsdXdsbkZ0bE8zSk0xWHdwWGllQzNZTWxzRTNINmZZSnB4eFBQ?=
 =?utf-8?B?OVlZYlo0TkdlN3ZGS21vbFN4OGhhb0NSTXZnbHdoMkVGTXJIMStkeEFxeXN6?=
 =?utf-8?B?cHJUWUV5ekdWbEV5TGIwZFpja24wcGorTVJ6TDRuQktTSmJyUm91SWcxOTkw?=
 =?utf-8?B?WkwwaC9VZHVsS3Q3VkZnVzFXd2xueFRIK1N0d2VCVHhibDJiT1ZyTXZFc3Bl?=
 =?utf-8?B?RXVLbWFJR3B5bm5McWxUODRaRXdyVy9BdlMwU3JzT21DeXdRMzIxc0tka0ZM?=
 =?utf-8?B?eXZoWS8rOGV4ZWJ2em9TUEFEUTFvY2czSHRVb0hNOElxeFBkeVppVUswSzFa?=
 =?utf-8?B?Z3dkSDdoMmdIN0ZXRzh2YmN1U3h0Wkh5aW9WWU1TSnM0eTJWelRuUzZZVXlU?=
 =?utf-8?B?SlZKT20rb1NyN0pXNHpQcDBQT2hsVjd4T3dsZlVFNEE5eVFrZ3JoY0RtWklS?=
 =?utf-8?B?Y1VMZHJ2dHIzQW1TQ3B4b2hiTVArZ0RuV24xUkZNRUpTTlovdEJ4cHN1SkJX?=
 =?utf-8?B?ZVY4UGF4QzYvWDJoZ3VKbW1hUURnR2VUZCtIM3FJanZwcTNNMWNLTmtkdElL?=
 =?utf-8?B?OUZiRWc4bCtaUEdzVVlna0RoUTEzcmNwM2FrYkllbW9rY1Urd2FmZkZ4eVA5?=
 =?utf-8?B?a1REWkxhVE85TmZjUTl4Y2hmdzQ4M1FPZzA5NFA4bmFEczlBWnMycTl4Z0g0?=
 =?utf-8?B?ZlhmNko4b1JqR0M1NzFRNE5KbXJ0MVdFQTZuMGNtb2JLUm9rYUNaVmF2M204?=
 =?utf-8?B?VVljc2tjQy9GSi9YbmJzb091UkVNWW5YbjRZQ2loYkxpQW4wZyt0WDBrSkxU?=
 =?utf-8?Q?hBjFGBC2gGU++9ssrqeHHirAkK0ms34FAhrHh5YxjyQE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUFRNlBWd3ZFbXBHWUdEWTJHMjlyb3E1ZDd1bXlWY3p3QVd4bUJpZEFWWVZY?=
 =?utf-8?B?UGR4V3hHWk9VdTU4b3lhZk9sMHBTTzNCblExbjZEMmRzQ2t3Y2l5OVcycnI5?=
 =?utf-8?B?eDhUNHlKcUJWWmxGRXJJditZUlhRa1RJdEM5cUJjY1lIelU1SUxpVEJIOTBh?=
 =?utf-8?B?cEZoWklzYllLQU5PbFl5RUZTMDk2QklGVk45M3FxUVlRMm1XZzdKRWhYUEVU?=
 =?utf-8?B?amZpK3lUU0hVWkJFQUFGOWhFRE93aWNEWkVSWkV4Q0dCSlU2R3JDaUJXNFJQ?=
 =?utf-8?B?aVB3ZWUyTlBiRDBQb0FFZy9SU3llYWRmMXJ1Q3BCSlJwOTRnQXZGcGNSRURR?=
 =?utf-8?B?cHZBa1RidkZ4cDZDanYvYnVpNkNWU0xOc0s2RUZPYjRQOHVRM2dUTU5ZbXRs?=
 =?utf-8?B?Y3A1a3d1WVpqOVdpOTdXK1E4VFVXc0srSm5Cc3Y2c3pWUzFERlNvSmR5TEZ1?=
 =?utf-8?B?c0poMFhmQldoR1F5YkRIUDlZOXZzbUhtZENLbnluYW5IKzZ1ZUZhb1pPejZB?=
 =?utf-8?B?UW5uN0NLKzY2bzBlOGxJSjNlamxQckFDbVJOM0hPamQxaFNJMTBGRXpudkcy?=
 =?utf-8?B?OVNiUnBxM0QxV3poL2lBczZMOVhQdGxNWk15bjdEdXRZdmVXVys2QWxrK2Er?=
 =?utf-8?B?bnVuc0Y2cE5vbkFaZXlyeUtGZGpIcEZKN1VBVGwvRytwV2FKYlhXbzE0amoz?=
 =?utf-8?B?U1pwK0RCOWNGaXRXekg3SUZyT0x2YzNlQUt0YWNnMldPL1JiVXlkblhGdUEy?=
 =?utf-8?B?WTZ6VTlMQUNMeXhMUDlmMm9Xb1lHYzBFUDhSSGhpZkg1TlJ6d2Zmamh3NG1E?=
 =?utf-8?B?Vi9XdzlZQWFEc0hpNUd5UldmUDRKMXJyYkFuWUt2RnBZTFUxSmNGcmtMZ3Uy?=
 =?utf-8?B?b0oza2tFKzJoY2pQOG1lTllCdk5YSnJrSllKVHpqNkNnUDlaOHlCOGUycW5t?=
 =?utf-8?B?bVVHc3FySWd6Z29BeXdwVVJlV29tbmc0c2dObXBHOFZoZ2dlNW9ldXptV0N5?=
 =?utf-8?B?bXZJWW1oTElyVWZjci9nMTV4UC94R2ZCM0xVWnFFUnBTZXdsN3ozR1VPZHhQ?=
 =?utf-8?B?WW9FcXZnRWZ1Y3FabEc1SzEweDJrS21IYzk0SVFXV0lSMnZXMTNoWllvS25n?=
 =?utf-8?B?SUFYcVgycWxkZlNKOGw1cnRPcjJhdVVtczRicFpta3ppdytxMElUT3BRenZI?=
 =?utf-8?B?dkRzVzhTTXFHMlF2ODQyVVllSnJBU2F3aFhqd1dHSzJmcERDSXlUcFQ0a2My?=
 =?utf-8?B?b0kxY1ZrMHYvdy8zTHo3R1RQMC9mVnN0VGVIYk1HUFdQTDFwL0ZpK1ErajFz?=
 =?utf-8?B?WmhGVytBQjI4UE1IbUhZN2FLMmhjd2xOUlhua1FHbWd1Wk54TkhYckJPYis4?=
 =?utf-8?B?YU1hUUNYTzhVMW00VkVya1VGOWtaMUVpYVFoZmU3cnN1MERtOURtVWk4OFY1?=
 =?utf-8?B?aWx6MC9IbkMxL01RSU0zemJqV05yRjRhdEhuS3JxeVNhaXBheFQzVnNJVC9r?=
 =?utf-8?B?SU10b1F5Q3RJaVJpTzRxMGUrS0RLUXprOFVkeGVJdTNzdWVBdGVwNi9OWVh2?=
 =?utf-8?B?cGpIZHRoUFpSQ0FjaFAyTFdWRkt3N0ZyWksyanFVUmhIdndCaUpMOVZuSmpn?=
 =?utf-8?B?d080M0NLcExmUzRYcklVTCtzbHRLOUdFNk9uNHhXMHBXMUROemkxa1Z4b0R2?=
 =?utf-8?Q?LnAPRdt3lAjA9OxFq6Wi?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb6ccc7-6244-4e1d-5ba5-08dd9d17e37d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:13:29.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4184



On 5/27/25 15:31, Konrad Dybcio wrote:
> On 5/27/25 1:28 PM, George Moussalem wrote:
>> Hi Konrad,
>>
>> On 5/27/25 14:59, Konrad Dybcio wrote:
>>> On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
>>>> On 26/05/2025 08:43, George Moussalem wrote:
>>>>>>> +  qca,dac:
>>>>>>> +    description:
>>>>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>>>>> +      link architecture to accommodate for short cable length.
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>>> +    items:
>>>>>>> +      - items:
>>>>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>>>>
>>>>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>>>>> Drop entire property.
>>>>>
>>>>> as mentioned to Andrew, I can move the required values to the driver
>>>>> itself, but a property would still be required to indicate that this PHY
>>>>> is connected to an external PHY (ex. qca8337 switch). In that case, the
>>>>> values need to be set. Otherwise, not..
>>>>>
>>>>> Would qcom,phy-to-phy-dac (boolean) do?
>>>>
>>>> Seems fine to me.
>>>
>>> Can the driver instead check for a phy reference?
>>
>> Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.
> 
> I'm not sure how this is all wired up. Do you have an example of a DT
> with both configurations you described in your reply to Andrew?

Sure, for IPQ5018 GE PHY connected to a QCA8337 switch (phy to phy):
Link: 
https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq5018-spnmx56.dts
In this scenario, the IPQ5018 single UNIPHY is freed up and can be used 
with an external PHY such as QCA8081 to offer up to 2.5 gbps 
connectivity, see diagram below:

* =================================================================
*     _______________________             _______________________
*    |        IPQ5018        |           |        QCA8337        |
*    | +------+   +--------+ |           | +--------+   +------+ |
*    | | MAC0 |---| GE Phy |-+--- MDI ---+ | Phy4   |---| MAC5 | |
*    | +------+   +--------+ |           | +--------+   +------+ |
*    |                       |           |_______________________|
*    |                       |            _______________________
*    |                       |           |        QCA8081        |
*    | +------+   +--------+ |           | +--------+   +------+ |
*    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
*    | +------+   +--------+ |           | +--------+   +------+ |
*    |_______________________|           |_______________________|
*
* =================================================================

The other use case is when an external switch or PHY, if any, is 
connected to the IPQ5018 UNIPHY over SGMII(+), freeing up the GE PHY 
which can optionally be connected to an RJ45 connector. I haven't worked 
on such board yet where the GE PHY is directly connected to RJ45, but I 
believe the Linksys MX6200 has this architecture (which I'll look into 
soon).

* =================================================================
*     _______________________             ____________
*    |        IPQ5018        |           |            |
*    | +------+   +--------+ |           | +--------+ |
*    | | MAC0 |---| GE Phy |-+--- MDI ---+ | RJ45   | +
*    | +------+   +--------+ |           | +--------+ |
*    |                       |           |____________|
*    |                       |            _______________________
*    |                       |           |      QCA8081 Phy      |
*    | +------+   +--------+ |           | +--------+   +------+ |
*    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
*    | +------+   +--------+ |           | +--------+   +------+ |
*    |_______________________|           |_______________________|
*
* =================================================================
> 
> Konrad

Best regards,
George

