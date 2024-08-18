Return-Path: <linux-arm-msm+bounces-28911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 833F6955F68
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A724B1C20A4A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49724154BEB;
	Sun, 18 Aug 2024 21:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gEDO0sgf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F2F12B93;
	Sun, 18 Aug 2024 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017824; cv=fail; b=LXW9hgRMhCCkFPrJbpBmhnl/8CRE3Pwf+buZJdMtxLwM1MqHf20jPMP/py0vu9fsMIINu6bi+qUYzXTDPk9thX3JpuTBPB+mK6l8DepcX5s38sbUDmbmaz3O1t51EZsNWS0UxRDvjCiu+hwleji14hP2CokBWGnXSAQ27pX2Hto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017824; c=relaxed/simple;
	bh=A2VdpNMrkVyCiBoKzgPuQCz1UndtZRwYf448cq+nS/A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LOKK3rgdVSP1B0oBVoGmOkd1HPdpBvC7viX9uWjugwwOaO6TKtD9HKf38y5nI7Edi3BsiwEoXbT58PXJTe2k1FxxWkbB9xIDmqV+fZDFVQWwCKptbFFJAFpijWGxoMjLNaPwJ7omK3hGtK0LMLO6MwTgGRMJiPmwuUwHmmHH7BM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gEDO0sgf; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAXZiMQm0vuUuVGt3HL4wRW+gviIviT2im4ExV2sw+zedBR/pY2Nr/SxT7DvUDib9cqROmVj5XYavvDiTAIUetbvnYPh8yGKDBAm0t9g+P4ve4O680JY0tAYr+506McY5YZZ56gZeFuhiS/WDY9UssMBvQEaeCI8Ateefje0AenD6fDr/DoDuG258geTcKlSpzDAbNwlY5CZwdAPfgMyJLoXdKi4OjL+ckVLn+JutlHag58lYmhXoLCpsOI0Wc6rKNGLLAFBC/Sr8qHwTU1zBuqST4x5Zfl+zWie3MLkdoQXYMeysUZPN/v3qHK5l84PvUo7Jp52ZAzEPKovG/rA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3Pksx8KqxVNKrFJRl+o68DtVs5WwvMiJQOuFvqMRM8=;
 b=RfJpmgminC97RE6hw2HH4anql65Ydc6uTqJJsedJLpSUU5bqW8g1S23LgjxjlHOfzjsxHz2ZZbB+mHG0foIgruiKmIwPnA6oTE3fvHAVkhgEg8kd/JJAgGhgFu4il4rlIF+IBpGSsw9MRpgDlecYZE+z6vJGbHOvdD8LPMnR5/LY5EoG9FVt0Jv+l3Tx4bHVnoE5SlTusNofFzPFxzasAN0oxM970uGxUL6nEKIUJZvvHmgdKzbgmqx2rzZZVNR+cuiiXC2cM92A/6tlEPgeZn9eZY7o3W7Waz/0iRaVY6nhpUGxbRhqrca/8maDfAps24O4T7RLD0U685z3TPWEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3Pksx8KqxVNKrFJRl+o68DtVs5WwvMiJQOuFvqMRM8=;
 b=gEDO0sgfiLVb1v7rI709J3uer103jLUw0iiz5xUC3+HBeZ5vZLATtfJr/XG0jNug5hpnnCCQP+kJvaTky4WvwnzIyOvX33hxetjf4oNPm6lKsXt72xG38+1rYPq1d6ASRNRNdJSYx4OkWj6nULRuQZHNtd7Gns+2qhP2JpEyjjv/Ba6CI1piHgoC08+TI1Z1dvvA1gdshUQ4pEPGfrn8qhsGRzAuGSflY1uiQgKspicDEQF7vaa4/0HDOUbnxvAPTUg6XW/PJa19RjCJdeuRsNdKoyv5cZuoLVKX0Oojh0gn5t9lg6C/qceIGZWysP+LG9HDQQpDjUSJW++9EBEs4Q==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:50:19 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:50:19 +0000
From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard Cochran
	<richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, dl-S32 <S32@nxp.com>
Subject: [PATCH v2 1/7] net: driver: stmmac: extend CSR calc support
Thread-Topic: [PATCH v2 1/7] net: driver: stmmac: extend CSR calc support
Thread-Index: AdrxtQ4W/YDQwJHKRK6EOcoVPCOQ7w==
Date: Sun, 18 Aug 2024 21:50:19 +0000
Message-ID:
 <AM9PR04MB8506A4B49180F34117B93655E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: df9ed5b0-c600-4139-d499-08dcbfcfc0ae
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?88jzSiI6QX+9qXYbJEHRs2zgxvKX09Isszp0z7dBqrLts5V+gLusEli/IupH?=
 =?us-ascii?Q?aMkaRrGhTjsnWk/3uVH1BSz4f6vnFRCGZ9/eqSCjmtdz3R9OM4SLH2W2fJtH?=
 =?us-ascii?Q?9vWd/7wWZHYnmITrpaC3wudGWqklVar0LJZ7waGivnVEGBFdSwNUpgPWIQBQ?=
 =?us-ascii?Q?TQS3y7M8UDZvdAuKNpAB76JJSaUGHl+pZ1bYen0PdxYuNk66+HoUhBcpL5vE?=
 =?us-ascii?Q?H/JZ3keblGz/vLn7PxdLK+AMslY69/cxq5m8f3kYhPqDakbAoS4H2tOiCP/X?=
 =?us-ascii?Q?7Srg6qMyxB6w71sMDMjMU9aMwoASwkYYBRSUSVCZdnYN+RgyawDdR8iDs6VZ?=
 =?us-ascii?Q?u4vk0nPdyGLqNh0L2gH1FtSusP4wqdGxqI2S+jIheHppB9tOAKsNrUkyGCc7?=
 =?us-ascii?Q?bs9gJop29afqOMd4iTSxUpz09E2c9H/CRml7B4iMIL7lQRzqe1iShQDPCmCI?=
 =?us-ascii?Q?fBqDEeroorrOpPJX3xWEAwJ6ROz7MOgigBx9LkRl1Wj5V+/f7ghponj9+YqN?=
 =?us-ascii?Q?yZIVvgUkQnhZ8BnDxbDUEmw4RXMhXj6z2u52t+7zakZnuOvWV90qlvpclD+E?=
 =?us-ascii?Q?X2C8KJe1fLUp+YkRC7HLd9RSrrKkt2b5srPwZjxJHySEk5My/VKK+0VouJUq?=
 =?us-ascii?Q?GkWai6FUrDWhal54iSyjknMy/9kmQmX7rDPiUYCzeeD6fiRrYUSUXv5iJgvY?=
 =?us-ascii?Q?jvr7jyeuSHcUv5OEv75mzvqnvX0DOCduAZiD7njcsqPOxAYR94Vzbsx/rCd9?=
 =?us-ascii?Q?eyG3d+t9TMysTJ5XU7s5yS0dKaOxf2LTdHTErqLmQRu6qzs8tuNxjg21iQDY?=
 =?us-ascii?Q?+Ztk+8BJ3f7gZfywbdmpzu61ugzwluOiUqL0DcL30KF9gQ2ACM+9b8L8y7T7?=
 =?us-ascii?Q?7JJUwcCNpI5/pL3g2EyAJbn9oiXn51iq24MuszGrY+nfro+xXUKS32WvKhG1?=
 =?us-ascii?Q?4awcUuZ/6lCFIC6NJgOVhw1eh/MsP3VXzPy6n9BVZowmtzSpm1fWbmkzZCvA?=
 =?us-ascii?Q?OxMDBlV2DOKJGT6/xnZrBUDYUJeWRJmNfL4K+ELODqiM0JPLjE4R1LCZq9LC?=
 =?us-ascii?Q?UIdAilqWHmsuAtdwR2ovvdkZfteix50G6shfXUzxzj6B/xYltnvNOqrmdjae?=
 =?us-ascii?Q?AQvm/iVDMKnVyNQyYXibdOllToMX4Vlh0HlndFdOxsbxsSdJ0QNvudweLE3X?=
 =?us-ascii?Q?pFNJegOHosxuCmvEsj/EpZKe7yCcRhFJhtygoLSXbkW3UaRquZjZFGd9zEhj?=
 =?us-ascii?Q?e42SN4wL9jQTSqx2E3iKbRSWrL8rKxDBiNZNL4g/k9Raz2x4Ok6N9zaQiYa7?=
 =?us-ascii?Q?AnsEFPWkLVNAa+P1Oc1N7JxqRp4rLt6Fz2ML2P3U3DCHV0eCCYBb/NeQGFEC?=
 =?us-ascii?Q?OOYKSIS2uU9An2sEFSe6KYikVp5ERDwQ1dSHhd5+MFe+UfXNVPcL3gzVVYv9?=
 =?us-ascii?Q?XPRMm/Xl6j4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xKiziUD2oAGZImQYxAbW3ESWgCV8vFX0qcZNPYPyiVcvJ7/KXA8sjiGy5r8C?=
 =?us-ascii?Q?cA5Sb+Zo17tLDnjlAsDzbhLRA2hGO0c2hp5uY1vNeuhRyZ3U8j5yh2wAt43W?=
 =?us-ascii?Q?WKi2Rm/bp9K1/UTWMsk1ut1wkFMaCW+Ps+XfuJKsYes1/bpAgcBL92YRUeM8?=
 =?us-ascii?Q?VAI6eVl+5QDhmVogWzvoWoF9lr32Ny57TLcClyphqSGpP2SCNbVY5dJs138I?=
 =?us-ascii?Q?HuBlze9mio2WfyPu2hbJAKwbhY3RQ+5hsA5oylt+U9zKe3k7uIwhsFQxiqDE?=
 =?us-ascii?Q?IH96DgoSZLZE3Yn/Lr3jSabHbuL8KEXwwPa5aZLXxxjRvMxkDd62tEyxMSmm?=
 =?us-ascii?Q?kHiea0KFUF3kIQ41Lv0MOL+ulZRwWshiA956Olx+8OgMoJrjVXSZ2erqfYDU?=
 =?us-ascii?Q?9BEukVl+jOlgPxH2PFbXRrGsLTCfzi7oXh1ehMVmALg1UuCc6wLE///DmCG2?=
 =?us-ascii?Q?vMtoeHkiX9AoG5VkEixi99jVKrWz3PztIIn9j/dpRERAdf1ESDBMLDTFMf98?=
 =?us-ascii?Q?HP6tYXdu0ESUEU5+pRA7nA9H0QT84h8UPnq6o/Gpy0k84wcpuxxhKRd+mTcb?=
 =?us-ascii?Q?XL3lnbHD3rCBi1laKaqXNXNeNlrWEb/ufo402YTHmfFuLOXpKkQoElnyKsdU?=
 =?us-ascii?Q?+7AhKmjTdmtdyFB/RVzy0Qs6VyzvT2EgCVugjWy47YEa5ABFG4CFvT1Bqnt9?=
 =?us-ascii?Q?yZcZhZaplg3yx5BHBUzYnLEMR5b/Bw/HAHEH2vhMpVAlpa5jUl8pER+5vq+Z?=
 =?us-ascii?Q?aPktIBDDXuDRNugXxlKbDgLgHf7q0nBaSontf4l6EWMcxQDejBU4AInkVUY5?=
 =?us-ascii?Q?x+mYxQXf/51rNmFU1wHFp/AAV/3PGWsGLMFvfye7+UbVO6a0cN2AyJBDouft?=
 =?us-ascii?Q?GF1ExG88apQRgNJRTkMJTFji9BJMqg6dT9F5fWznP/GGNMDeQvKWRPZxoItf?=
 =?us-ascii?Q?QN30uD/YkmRr5IL1eHW3BBTiKpE5hL+7y9CsAqdX9dato0sHUKFYz1j5TLiX?=
 =?us-ascii?Q?lI9tN9uQ6ouxlOYwUK30Xs4q0wIgoKIs8T/WpyshsMtV9FAjc4udRiqCyVo+?=
 =?us-ascii?Q?725FBJrJb/vZn02rU47UZIWNU04/FTXcG5/mAdiO9qAprPZtGlE73lmKkfEV?=
 =?us-ascii?Q?EDkXNpzU98zQQ820O0txyDGx/rvvMX5dfbe5IyZhhL1Uc95ec4DxshFJW6O3?=
 =?us-ascii?Q?7EdbBmDlUwLadLwZbbBfSRGAZuw5uq2HJmQ/FBS/8KTlogYoRpxOdFN/zpuq?=
 =?us-ascii?Q?AevcnGVAkjt3V3Izi8RKEszZ4IZOWj228vp1dMuDxmJ1rVs5i1jzEdF5obFW?=
 =?us-ascii?Q?RATTgl9DFG/ZfuThFgYlaLBBf/P7doJcn1duWaTuSnLEp1WLSZORbo2C7Sj1?=
 =?us-ascii?Q?O0NeZvZTf9kSV8AACYk+MPt4uVYFiCgbIVvbyhF2VKJvB/1+S+X10afniLrc?=
 =?us-ascii?Q?kUaLdxps4ubuoO00kWBOTtQ3Y8N2sGBZRIaRM2zPXaPCYqufJif+QPMGY4iY?=
 =?us-ascii?Q?xPKwFjUy6Gos90r5Fy2MPPi/ZJZGEf81Neef/PJXleQYxLeYezFd146IgBk6?=
 =?us-ascii?Q?D1JtaVoY3J8MRI9dg9s2+XMJTsDBCBvBtbRj3PNW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8506.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9ed5b0-c600-4139-d499-08dcbfcfc0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:50:19.1222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYABlX4saHOzFm43DdnntjJRD5c6HqieBYalzJDXjvt/vXffwKftQJCowlxe6XGdegqbnPZXS6Nr95QUaqjNOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

Add support for CSR clock range up to 800 MHz.

When in, fix STMMAC_CSR_250_300M divider comment.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 include/linux/stmmac.h                            | 4 +++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/eth=
ernet/stmicro/stmmac/common.h
index cd36ff4da68c..e90d3c5ac917 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -256,6 +256,8 @@ struct stmmac_safety_stats {
 #define CSR_F_150M	150000000
 #define CSR_F_250M	250000000
 #define CSR_F_300M	300000000
+#define CSR_F_500M	500000000
+#define CSR_F_800M	800000000
=20
 #define	MAC_CSR_H_FRQ_MASK	0x20
=20
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_main.c
index f3a1b179aaea..ac80d8a2b743 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -324,6 +324,10 @@ static void stmmac_clk_csr_set(struct stmmac_priv *pri=
v)
 			priv->clk_csr =3D STMMAC_CSR_150_250M;
 		else if ((clk_rate >=3D CSR_F_250M) && (clk_rate <=3D CSR_F_300M))
 			priv->clk_csr =3D STMMAC_CSR_250_300M;
+		else if ((clk_rate >=3D CSR_F_300M) && (clk_rate < CSR_F_500M))
+			priv->clk_csr =3D STMMAC_CSR_300_500M;
+		else if ((clk_rate >=3D CSR_F_500M) && (clk_rate < CSR_F_800M))
+			priv->clk_csr =3D STMMAC_CSR_500_800M;
 	}
=20
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 84e13bd5df28..7caaa5ae6674 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -33,7 +33,9 @@
 #define	STMMAC_CSR_20_35M	0x2	/* MDC =3D clk_scr_i/16 */
 #define	STMMAC_CSR_35_60M	0x3	/* MDC =3D clk_scr_i/26 */
 #define	STMMAC_CSR_150_250M	0x4	/* MDC =3D clk_scr_i/102 */
-#define	STMMAC_CSR_250_300M	0x5	/* MDC =3D clk_scr_i/122 */
+#define	STMMAC_CSR_250_300M	0x5	/* MDC =3D clk_scr_i/124 */
+#define	STMMAC_CSR_300_500M	0x6	/* MDC =3D clk_scr_i/204 */
+#define	STMMAC_CSR_500_800M	0x7	/* MDC =3D clk_scr_i/324 */
=20
 /* MTL algorithms identifiers */
 #define MTL_TX_ALGORITHM_WRR	0x0
--=20
2.46.0


