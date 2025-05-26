Return-Path: <linux-arm-msm+bounces-59439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B0AC409F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027C43B12B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 13:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5041020C006;
	Mon, 26 May 2025 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="jElCy0xW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2023.outbound.protection.outlook.com [40.92.21.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D1C1C54A2;
	Mon, 26 May 2025 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267026; cv=fail; b=s1Kz7+sozaHM02oBt1doT6YUE5UkJUbDmdTCl6aaokU67ysb+pQOTxVrO7kvxZAXSmXPbynsJIhu7DXghwo+JyyjuegcsxUONCC11LVPrtItwez/jnN8qi4Glb/SIadZunzfmSN1EKYUhKkgTbMLfYDp85r731LKTYAvJXpH3aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267026; c=relaxed/simple;
	bh=+AA4mKu3HbMVxUjbR7gqNTtMTTT9atLQWUFC+ui4HKI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dTFtwRYGYJJx+ax80r6U8RIckOj8Usf6/iN5YXNg161YHA7SLiOQc8db7qYwmoYqyiVI2wy2dSVA0eo6BIOQb6QC65xJr8gRqlCYt0r57HvzvQa6NYb5JG7Xny2p+32rXdfN+vIZE/2POSC4giYRBn6YGMv54jyucOo3svZDdaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=jElCy0xW; arc=fail smtp.client-ip=40.92.21.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWaygJfHhNEyD5leVVgF6gaSp0LvnICPPg+AaifqHFJRB6j2PCFRmRWd3cKjTweMJIH9gNCdhUznybzZuMXNqpKBTX6NS3iVrI2Hv249NZtM/ABTI5kibCWmZjYHxCcOf/Y/JX8f0VSeZv7tR4e0DvTBHTRbFSeWaRpGwcv1VdOABlFzA/4aYdp3q018wc1LGnHqyJ8O5F/5jim/+ZoSN/D+yFBZcEEp2geT/ncU40D0/uKpxgIMWglGuWFe/geq4UJOWJxZS4/qK2Oy5YKH5vkuxzkWZuP85GmZSRtwwoYKUtYSay6rvSfr2bINnITm2Yd7P5inKjJBQN9AxtA9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp7xiN/OtCwh7tjRPswQgbv6JwYuGu4xxgVIRYX+yiA=;
 b=uGhGFXLkXg/B69Zfc71c/g/CsmsH9Er+cC9JBpVpoLHuWX/ExuoExevPhQc8ZmurKTFUPsRJHy4MzRkguUtEUiIw5dPpckeqrRSndEe84YIuJ2AF2iHbk5yJ7RDL/8cPkNU0QNirFWkWupThrYFvWvtqJX1QzaC0SZkve3ajAHtWzT1ivR8aw2/Bs35XMPPxfq6ezuckqxTD9EHQyFXK0o+NDQ9GuyFkGEKWe6gMQQVz5UNHeBjl2Ei2rmTLd6HNySKXNQJivQM8NZ+wbwyO2uZkMG1RXF20HHy64cSEDk53E6zlaV6pNGhuUEX5WJpTE9KwGbgEdtLNgAeYT1JfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp7xiN/OtCwh7tjRPswQgbv6JwYuGu4xxgVIRYX+yiA=;
 b=jElCy0xW1RCZKkxD8EenHRaNrptIaQ/wH6Uhm4CZ8EmnjDu5TpqkcEikOKVOcUEX+vjCTiX55ozOxnTs30O+eS7/YTsjtv6aR4GRWAeXITeZNd5fTL1iX94dy57Ac6MN1yQctnpVKL+/EVbfx3z6jl2yJed2IcTCBv9/jNnyY/qTz4WNh0z/bXRX1zP12VrpZ2gZ8ZNx7IQ3uIxXsNIu27N65et9oKBRTk7i5hqnHQ2hc/PaLkmrTfm//1AP/9IjQWfOZbwGuf2oyC2bxnVgvxOcszQvbHGYC3/A09ha6Xek5B6ddtLE9UybatfVq3JuzQr7idJ3jz20p52fPPv3/A==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DS7PR19MB6133.namprd19.prod.outlook.com (2603:10b6:8:87::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 13:43:42 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 13:43:42 +0000
Message-ID:
 <DS7PR19MB888391F2D9675F1067D551659D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 26 May 2025 17:43:30 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
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
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <579b0db7-523c-46fd-897b-58fa0af2a613@lunn.ch>
 <DS7PR19MB888348A90F59D8FEEBB0A9509D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <1a6caebd-251f-4929-a7cf-af7c38ca30ed@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <1a6caebd-251f-4929-a7cf-af7c38ca30ed@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX2P273CA0003.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:8::15) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <f5d61265-98ad-469d-92c8-2d8a64c4f216@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DS7PR19MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a54eea6-8ebc-45f6-35c3-08dd9c5b537c
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwVu6ov8hlKZu5ytU8AWxKlxKS+ouW1z7cBMDUuYJbJmzKHWYX4+GM+7JblLcg8wk20AHGuMHrDoWD256Ti/oyS61sCWi7u5yyjM6cCjbs6kGLWFWDiwnNug3sD0gT4ouR9nt8GHEqggoLZ2h8Voe+S7EWqJXutcqz7byGSEXP639MR1+XwoDeiuU7C4miHgIsgzci6xgF0LF4M2Ffb3X2vTgp2rxItN/a6ivYedIH46zBMSj48KfV4hyQrKZ6g0JW8tessp0y4afoNsDn1Ees5pfPnJZudCNy1EmPl97UaMxMO1l22bTzfh3TFR5tK48Y6Lnvlc5i+/aaU/ZXrAxro+fnDuBD9ZqfSD3ORD8ABLENmgp4OqFvbfposedBogn8WaneLHhHIISqxNJBMYaTIpHK4zFMW59j2o7gEp/n+OFbEeuB0UTQO8ilQB7OaCBRuG1lqiGfCRiODdMJ8sYHo7dmioCcLTmIzJPPx4U+EsHZ4cBTDhCBvmfc02IjdAbRxnj5WtUVN/oPuvVAH0hYncp4iPC2ih8EAorgCX24l537sf5Qjp6iSAfT+e6cnEozcD87tRG18owxn8gi/GY8armEKmH67I0WVcShOPUME0CKTfdV7c4XEQZCfMyASxEItk2aFc5tXwHamzw04EZ1wHi/wZlIjLu8A43TxKGq9PD5biAo9Nx1H9VhP5d91Zqy5mgfmcbd4id9cCOLvX4yss0FObAxB1xjId13Hbl7CCKoxvru7hM9emjDiInSMhHps=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|6090799003|15080799009|19110799006|461199028|7092599006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnByWlljMGtheURtOVl3SVJzeGlKMnpqdEVNVmZPNkZzSEpTZEpUenYrTnNu?=
 =?utf-8?B?S0t1bzhpbkFISVZ3KzVyZ3NvalBtdGUzL1NiWkZFa1U0UngzdEJyQ1AwdXBa?=
 =?utf-8?B?MzJCMldWcytJRm94Rmk1dUIrSmY5NGNlbXo3ZmNFeTlWbEU3ajFhQVJ5dWFt?=
 =?utf-8?B?MWZNdytqVDZlenBVT2w2eDR4QTBRNjdTWmlFVnZuQVVqbXNMMkxpQXYrUGZp?=
 =?utf-8?B?TTZKbm9xdWFleGs4VXlQVHFSNWF3SWRVcS9uWXIvdUF2S2JwVGZ1THk5Wm1O?=
 =?utf-8?B?TFVQdW91VmFhQVAvVUphamlxSXV3bHZHS0NaZFJVTDM0aXpDaVhsTXBnVGNM?=
 =?utf-8?B?SndRL21oRlBkb09ySytBWXNyNGYzRGJGQnZ5SnQxRmJ2bSt2dG5rLzdDMStI?=
 =?utf-8?B?RytOWDdIWVR1amU5N21YOFRlZDRjUyt2WGJzbnQ4dFNOcW1EU3hvZmpScjE0?=
 =?utf-8?B?Tnd6OVIxUmJRVjNoMjFWQmUwRGk5LzRGVTM1TUNQdDFWd25uSlladCsrUHRt?=
 =?utf-8?B?eEQ1RWJnQTA1VXhPLzlPOFI2enpXaDJ2ekFCNCtFc3d3M1dYWng0VjhseVF6?=
 =?utf-8?B?WHkxNStjR08wSDMyZFNxOGtIRkR4K2YwM3BXVDRUNWZjaG0vSndVNFViYjVp?=
 =?utf-8?B?d3BFazNPVGFDclBjWnIwRHFCemEzL3poTGF6NzZHT0ZSdHU4NU54b2xpcDdQ?=
 =?utf-8?B?RkJZZ0FWQWZIVk1rczV0clpQbmU3V3Y2TjJzN2xxZ3VkZFFBREZ4c2hzdFBY?=
 =?utf-8?B?Rmp0RGZ1OFVhUjh0R2tnUGU2VHhNV2pJRGJzMkw1Z29INlIydHNjM01Uc3Zu?=
 =?utf-8?B?Nzhid3pCKzNyOUc3ZitUTzhERHFmYnRsN2NhaGpOc1YrdDVtSkRMbmhONC9k?=
 =?utf-8?B?WXdWZGp0ZkRnVW42VzVHZC8yRmEzM3BYWUxCVHBRYkJxMTZRSlBQMzdORVFq?=
 =?utf-8?B?Y0FlNFN4WDBranhzdXcxalU5NjNjY3VtQmtZS1VQMm5xRVJkaWFuQ2hsYmxD?=
 =?utf-8?B?N2I3WXgzTXpWNjZ0a3pZQ0liT3I4dHdFTzIxTVlDbS9MZ0hHQmM5Q3BvWkFz?=
 =?utf-8?B?c2NpdUJtcjk1R3pTRUxobEs0UUQyZjZpNDBxRUVRNFJDUjR4TDVENUhDczhH?=
 =?utf-8?B?akZBdE02TloxakZvb0VUb2RGanMzajN0ZHVMOS9GUEozaFFjUmk4ZlJKS0FN?=
 =?utf-8?B?a2FGS1F6TFhOalhDZDJmYzBhd0VjcllaTGdOVXlYQUl6U0ptQ0MxU0tNdjZa?=
 =?utf-8?B?bEFWTnhOMDB4NWpOWitMVFpuS004YzJQMmQwMkdSYW1NTVBaNjVkbUhHaEZH?=
 =?utf-8?B?SDE1S2hxTk8vZnhLc29YWXRhRmxyQkFoNEFPcDBaVkJreGRwUzh5SEFCS1Vq?=
 =?utf-8?B?MTNhMW1jZEdZbEJSc0ZGSEZqeG5vRGtjT3FHZnRENjRGeHJtMUExZ0wyd2dz?=
 =?utf-8?B?WGJOTXAxWkFCR3ZkbXVsTzlSNG91Qk9ob0hyMVpybTdWSWdLVCtkMHFnTGxI?=
 =?utf-8?B?ejhyRGU2VFZ0OWtmN2ZiOTVVdG1pN3luVXhNWmkzZHN2QXUyQ2ZvVG5rNnQ0?=
 =?utf-8?B?eEx3Zz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M01VWkZUK253dUQvKzF3KzRJQ0ZDV3VzUWdJU2l1YXhEMldGdTMySFdYTDk4?=
 =?utf-8?B?VVYxVHkxbDJjeWNYTWxQZ0NSK3I0V1hoT01KL3o1Y253WFBwM01qY2tpV2tr?=
 =?utf-8?B?UG5VOS9hNisvUFdUYnAvbTAxYkcvdTlJUy9tRnpBbVB4OEsyT3FuU3RuWG5x?=
 =?utf-8?B?dnVObmdjMU5ubEphNGdUQzV4QmtjL0dFTnZYNjc4Y3JTWHd3bHYwZ2h5SnE1?=
 =?utf-8?B?Y051dHh1VE1NWndad1poR0hhaHZnRnFlZ2RiQ2xraEM1Q2RMS1EvQVFvZ0hk?=
 =?utf-8?B?b3plSEU5UzUyc0lxbmNreXRwcU0zajVPVXh3S2NNL0p4Qk1jUXlsbEdLWlJV?=
 =?utf-8?B?L2lXbjBoWUhLdnU5a2RvZDdIRVJsUFd6bFJjMXdLVmVlNit6N2RqRXd0NkFi?=
 =?utf-8?B?aUs5L0lLZ1l1YjhMSjI3RFA2cWhSc093cDN0c0htcHNlanViajRQMXFrblpR?=
 =?utf-8?B?QVpabDg5elgvS1ZPcEhaQ0dWWVRHMzRycHdrUUo1MW14b0t4YzhwalZITDdI?=
 =?utf-8?B?RnRZMk94NlZGb01kei9vOHpEK1M5OHFSWlFPMnhXdTcwYVB5cDdrVmQ0djdR?=
 =?utf-8?B?amxuNDJCSzVESlIwNVRqY2dKZXBZUjArQzk0UHdLL2dVOHViM20rWTExU0p3?=
 =?utf-8?B?dHlyckZ3L244TjFOeXg2T1J6SDNrL21YWTVyb1I2U0RldWJKSzlkb0RRWURv?=
 =?utf-8?B?c3IxVDh5R29Xa1FvZXNmZHNLNEZxL0hHbUQwYkxvOFpCbXNtd0tCcWZuTWV2?=
 =?utf-8?B?Y0ZLdXo4NktZSzBXT0VlRncyWHgrQ2xIR0xvNFdId2F5U0NmSGg4TWRSbXdG?=
 =?utf-8?B?VFhQMTM4RWdieldLUXBPSERxQ0VtR29DNGcwanJBejBTdXJ4RGNpMlMzaUth?=
 =?utf-8?B?WmdyMHpRcDNobVo1WStMSHhVTWRkVTk4Z2JldFJGdUlXMm9hcS8wbFFnQVEv?=
 =?utf-8?B?ME44NWdFMnNNd0RrUjJFVzRCbWM0U1RUdVpzaHJWcWxJYmFOdEdaYmpYZE5C?=
 =?utf-8?B?ZldQeWwydkRwTWhSYXpZcVdPaFhzRGcvMVVqWUxocVJBMDVpSkFBS2NKaTlx?=
 =?utf-8?B?dVJOdFBIdTRuV0IyTlh1d1hhVTVncm1Ub3cvNmkzTkc3MnNlbGwwVzVuYm5j?=
 =?utf-8?B?VytieWFZYmVuYWRtUFNQMS81STlPdFVwNTF5Z3RsUTFmc3dxV0RxUU1oTm41?=
 =?utf-8?B?QWI0MDR6MVFtM0d0dDJZUUo0MFV1UDR4L2k0ZjN5L01tbnJFUERoMTkrcC8v?=
 =?utf-8?B?QzFWQ0lTd2dUazA1d0R2SnZPaVJURHF6TGx4bFkzQ2M1eHFpMU9hT045K0Mv?=
 =?utf-8?B?U0hVUldIbEhVZlFiVWJCbWI5ejRFY2prVXZReHVvRTBwMmVQT3NIaTlVWXpp?=
 =?utf-8?B?Y3ZWTTZMcFRGeHdYdml1dituWDVXSTZDNzA4Z1VuZjIzS0w4UWNhZEZ6OXRk?=
 =?utf-8?B?N2wyNWduMGVja0taVG9mb1NrMnRpRThpUTA3d1p5clVKQlNGc1VqYW82cmpx?=
 =?utf-8?B?Ui9XSTdsU0ZsU2tzMUtjbi90aHo0MVFEVnlEaytxbEd3WnRVcE42VXhKaEVG?=
 =?utf-8?B?aXZMOHFBU01Wd3ZCZElrZGJwT05zNWpPa3JCL0hWK09nai9semRvOUd0Zith?=
 =?utf-8?B?Qm9mY1ZtN1FFUVdkaVlqNkZEUmwxQVhEOEpjWEZpQnJjeWNPakFGanFKK3BN?=
 =?utf-8?Q?di6GUmXeXgA1qTMRAf2a?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a54eea6-8ebc-45f6-35c3-08dd9c5b537c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 13:43:42.0711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6133



On 5/26/25 17:34, Andrew Lunn wrote:
>> I couldn't agree more but I just don't know what these values are exactly as
>> they aren't documented anywhere. I'm working off the downstream QCA-SSDK
>> codelinaro repo. My *best guess* for the MDAC value is that it halves the
>> amplitude and current for short cable length, but I don't know what
>> algorithm is used for error detection and correction.
>>
>> What I do know is that values must be written in a phy to phy link
>> architecture as the 'cable length' is short, a few cm at most. Without
>> setting these values, the link doesn't work.
>>
>> With the lack of proper documentation, I could move the values to the driver
>> itself and convert it to a boolean property such as qca,phy-to-phy-dac or
>> something..
> 
> Making it a boolean property is good. Please include in the binding
> the behaviour when the bool is not present.

Thanks, will do.

> 
> What you are really describing here is a sort cable, not phy-to-phy,
> since a PHY is always connected to another PHY. So i think the
> property name should be about the sort cable/distance.

The two common archictures across IPQ5018 boards are:
1. IPQ5018 PHY --> MDI --> RJ45 connector
2. IPQ5018 PHY --> MDI --> External PHY (ex. a PHY of a qca8337 switch)
Only in scenario 2 (phy to phy architecture), DAC values need to be set 
to accommodate for the short cable length. Nothing needs to be set in 
scenario 1 when connected directly to an RJ45 connector.

if not, qcom,phy-to-phy-dac, perhaps qcom,dac-short-cable or any other 
suggestions?

> 
> 	Andrew

Best regards,
George


