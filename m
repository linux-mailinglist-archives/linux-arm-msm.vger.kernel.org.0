Return-Path: <linux-arm-msm+bounces-28912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B7955F6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C3CA1C20B19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D2215622E;
	Sun, 18 Aug 2024 21:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uLNKEpx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013058.outbound.protection.outlook.com [52.101.67.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01187155C94;
	Sun, 18 Aug 2024 21:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017835; cv=fail; b=iL7M3TIdwXVKpr2P4SHYnM5CgNnyhxovWKpSd70s5uy7//bUC8Kke9dfJhPkm1r6Ieh1QivS2m01SVLXfFztiOrQxiSyge/mrj6+q4xcAgueMt14VmqeX/yKExTZTAL91i752Dj8jS3A1xpEVTAqwiXk8cXd6v8by4kHXUfdULs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017835; c=relaxed/simple;
	bh=iRqankLAXuQiYNzZ8rtVhDwqW23ovkglwHZ4pD9nypM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SOZSuFizgKdMWA1E6p9xRuGrXfp8znWdBurCWUujprDzqveorIVkFDtAoPJk6csAJiIFz0lfLciWrbf7/nSljZuCL20zs5tE93yk1nPUqQhwyLUA2alOQzjXtzOtZkgWkiWEpuowvFebHnZtIDut6r8tWMX1v2nVX1v86cC9n+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uLNKEpx0; arc=fail smtp.client-ip=52.101.67.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvM2fbTGQZ5T+G4kPJ1qcNY86KKzAnUnsypD25C60ELiimpsG3XLhj7elEzuyJSsJEe+yWfQ67cs/n62VdvLmj8AV4FHF73z14b8I4tlB8IhT+Qh0shfh/NuMb75b8+ku1kG0pVHcLDQxKzTFpt5aZtj9l/nwIqj1jsJF+GC5IkbtlxNedrl4IjUA87fJytQqMWHFNruS/8J2k6jIa8BXIzoWyLkejpaQh7n2NyOI1lxP5g8NTCVdVwW+1aNFQgFWWRCO8qtCWwNSaWzaV1yjiQwL7SqflqO7ux3FX/hcHBnnNR65SKyziCJia9KX3WNKcedmkjOo613p5U0o1/nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfNkawFp1Rk9p112g0TRi12UXdfkHBlxgcWqiq1glDE=;
 b=MtYa2tUoGt7dTjb0cMi/84qcoEdiL5FFrRkwbLZCznmd/naK8w/Oqvmiw76i3LQJiW6qXReAmrVKOEC6JWTWvzn87BRpdrtVZyOHACtEyuCi0iUWM9p+gM9KAiShxMdVya2c9kLN8T3M60ZITmVLnw9k0CA2lNwXTyA6TzRM17mJUVpIr3VGj7pDnbRPOkMaK6ke3JnMTfj3GaSd5oWeZlLuYyIQQ3G22Iq2bJ92rFNducOyrfS4Fz03Zj+TWK56XDpZtReRwTYqTxFiwYzki0A8w65KFg+X7vun6kmJPt6fWg0F2xliIxYnC6NPYjXHBe3xG7lRxVhToDFL3Jyngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfNkawFp1Rk9p112g0TRi12UXdfkHBlxgcWqiq1glDE=;
 b=uLNKEpx0o5+QhrWAeGbQ10DpB56PDFWtvkTVOA4cDBSWIFQA6q/X5gik1aXuCBqvvrm4QmwJeU1cGsWb4iErt/zLRlOSXqzdi/OMhQgwkjFIqyv49JiH5g9POoUQN7v7LoB7s9+qlPjoRJs6DcvT/T1fle9t4hU4hBc4BHiLh4VoXhL+4d3XfPvGlpzIbzn9IExAtiAg+fmEDTW43rqIhTombd3Caf7vcOp/9W3JiOkzV5zqReBoQaURVv2duyXeKuTP6w7pCWZ63oIWkxESFzzVVH718w+GRUfZnwSt05FsMx7XwmcdqRm5nO93tCH4tv1kicxuOjoPoiyJCdTBCg==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:50:30 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:50:30 +0000
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
Subject: [PATCH v2 2/7] net: stmmac: Expand clock rate variables
Thread-Topic: [PATCH v2 2/7] net: stmmac: Expand clock rate variables
Thread-Index: AdrxtUOqu8labnA+TUKEes18Ol/IZw==
Date: Sun, 18 Aug 2024 21:50:30 +0000
Message-ID:
 <AM9PR04MB8506FFF6CFF156C2EB1C1AE4E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: 5978d163-af02-43e2-e460-08dcbfcfc73f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4A2gQpQPsMNFswy8qA9eHEJf4GN8U1TnyeeGi9vUQAvj+fjGNUAZI0eMGhb0?=
 =?us-ascii?Q?7HQnk4a7mG6aSWWvMG6lyWmlfqTvvcRinv86gqPGQaZE3xw/RDiAe+W54ab2?=
 =?us-ascii?Q?cHg2DiTNrX4FpKycbwQqzTqeY6n3Bx/2Iu7j08zCT99sW72BoORCg2dnCf8B?=
 =?us-ascii?Q?YUHwG1DAyPO8CT4kCjqf3djdwB30FId7bKP/NIQGnGhjBCb6k1MpPYQG8WXk?=
 =?us-ascii?Q?DwM70uRJS5W2BZ3bvwkkfgVvu013VJBGrZbCz6M7E8WeLJqoZbOa48ItVOaX?=
 =?us-ascii?Q?GBor0a2C/YL+qXDxqNWopg/PAZszs2YTv/QJ+9WvOBf+iAaSO1T5CKUjwunt?=
 =?us-ascii?Q?4HCDJ/iS08aTj3KDtFXrau7H095j/r2C77+2rQMZGdwFITcqH4O33qCfqqqf?=
 =?us-ascii?Q?7KtxRQ2/do0VeMXwQY49Y5QKr6YlepHGkMJelkcxhKaDldOkSmy4gWNOxjmp?=
 =?us-ascii?Q?EpIHgDXHjUoSFiEwqLY1JBA1sdu6zJ+C5REMQAX80XGbbyfEL0qi9bY3nWFH?=
 =?us-ascii?Q?BIRzkJTh6CYs3vNrop0YjOkxSoDUq6kmDPLkFwJnuWgTifm6sTMXCQySndqV?=
 =?us-ascii?Q?hon9FUpSmhdtLqxkZmrMpydaZJTDhoN7GtULu67ufk24b2kCAl4MG57AZQoC?=
 =?us-ascii?Q?nHACt4MMjtxlquotqxDU9fLYacOBNiIkMbTpEyx71TJpPswMf1ZFvuteJYwR?=
 =?us-ascii?Q?jqfyPQQMGv2n3dkaT3V8hWSzbLDZ/gyhUVYLglN5WPHghhZr2WWjZQEfwPz2?=
 =?us-ascii?Q?fnlQwD//1CaCQY2CnCMwJkAUiF4tpe85zbRZgnj7ZQ5PoMksOynpKTip/eyr?=
 =?us-ascii?Q?Aotqqk7eu0q7aTJyCqv6cZfnNnsmA78TObVXAZ71oyKaFvYwJWt2eAqhnWD5?=
 =?us-ascii?Q?IonMSoMh5mjVnqeiAAkuc8ZuoAN5x2VTJ8sKc6HqPi6MprusgWdZYXUL8agS?=
 =?us-ascii?Q?9jaZKVDKqI0ozGpqGCerO0VxSNE8APcaFZsS7OXBlo36S1X30iz7BKQ5UB8z?=
 =?us-ascii?Q?lXoNJUSnXPl7cNNWNwYj6S3ciGTuh/WHgMTamRIm7TxHekS3b+u7DXeIKOPY?=
 =?us-ascii?Q?71frlDsBz2GhAiqn6l9HCU+yAVqO2f2l7FY3hut/VV6OegbtzPMRBXa/7n3p?=
 =?us-ascii?Q?5EdgZzuYrD0PFExb9HwBaZqYD10IJTeJO+OOJdEqa30QX5OAxw2+LfzjTRFe?=
 =?us-ascii?Q?k1KG6lPjSz0clvYq/7JdFLQylQZd9GTuiyHpJhsoB7tYuw50hjs1oOupCu1K?=
 =?us-ascii?Q?+WOO414yaNUXTC3cNN/V/WaaazT3jxAa7+kIRUmX9zPXAudNcSk15S124kNx?=
 =?us-ascii?Q?WHpOlGPFUvDCvMmajWDUhu3eeJ/YRadInObUQSfufndkQgbSm1WfwVyynQq0?=
 =?us-ascii?Q?2U/DA+X2Zhpj3ATlisFBh5ckclMEy91qYtbjez+DyynrsmYyCrrhlUSreV6M?=
 =?us-ascii?Q?HjMqMP8DvKM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dSJcnkImlEfSijvLz/n2xmElGoEskDrHu6LmJDdaCgyKaRTy7OO71ljO21qe?=
 =?us-ascii?Q?iDqujC0FicREwg1XFt27KsH3E0Xn7iHTs+OgcBgK0aJ7oKlxQYmjE6q8xWdP?=
 =?us-ascii?Q?Oygi5cKo6J8gGQWllHLHcvURpUgAtIo7Cr6RM5t6U3tGN3vZdLOvI97E/3u7?=
 =?us-ascii?Q?T8+KQ45kYECr8lIqC/bznDkvwd1wXlM241VwtWQ0We7ZmFzaxmnXSVdq/Y9F?=
 =?us-ascii?Q?4ZbKy4SSvQ6geUSPqTuOMOL+9Zb7p4gtsDsW6ZacJ9joT7qwF5ada5jsnnUM?=
 =?us-ascii?Q?R2CzIDB/SHorFTFqHxPEN4fIYtJYBr5oolZbToXsxjLMgqj82K104/r4r/B3?=
 =?us-ascii?Q?pcdh+Gd/YlH/PbcaeEiXP+1Y/DH3EiTngCTsxk/AJ8hgkE1uSU1r1/7Aby11?=
 =?us-ascii?Q?BVxyMM5cSg3fBKCMnBm/lTMAWEmroAM6zM8DcxZKPA40VVUF8eyYc3vob+Oc?=
 =?us-ascii?Q?J/uU5702btECGyFdQZsL1HHIOrY1Q3xubB2tiqTZ1jGZrm3BOZIUfE6JAeQs?=
 =?us-ascii?Q?M8+fdGJ3aKdFl1BjEVmY+jsBKtJOI9wJWNVpT3OJnBWQZHd9sARXFh+pxqdK?=
 =?us-ascii?Q?zsOd/1cSPdva0t+e1/hEBun3gEGEDW3kx3deXduQIPNwEXaJcb4IjL+Sdqtt?=
 =?us-ascii?Q?QIbwuGdA2x9D8NsvYEfn4rmBG27WYosyLx/+/NijeiPB6mdQMYoqzOYEPFjQ?=
 =?us-ascii?Q?M4893OjA4VHL8D9qz9EsPxqAqLoE1UldjXQoceUZxe004pjf8apRlVk0PkD0?=
 =?us-ascii?Q?JYrKNQ3XorvjXYLnsbfd1rn+p9JhFeL5IlF64tahQQNPqhZ86aivDNgx7+TS?=
 =?us-ascii?Q?aV9rCCuApH8nhzmbDBljmWXzLVOnKtRxzCmtmbT26I/5mRa0CY/EHZtm9LnL?=
 =?us-ascii?Q?RcKMImWJ+IIGc7NI22jLNxt4+GB6oJb9fVMEvcirDT3YNQy/YodyMkpmCTQe?=
 =?us-ascii?Q?GIiI5BODpxrN7X5rovsCNI3cXnw+ZFXeQaYSdIyYtOkfBAphQKrbmzdo63uh?=
 =?us-ascii?Q?kHqtye8OmrSGp/aDSyBF7QiRknm1tQLokxlRCVG6MO0pRCz7kFqys6o4i8M+?=
 =?us-ascii?Q?6a2oWtPgMr+8L9U7A/BrYtZBUPnl1c7aKgvdD3bKGcaH6WvT6mO1B1yLVHMi?=
 =?us-ascii?Q?S2k+G7meOJ3cAUq6ZElO95I/D4DrxvRyeutISbzOiU7+axJ6I0i6jfq+6nbz?=
 =?us-ascii?Q?Wai7WovUymKFXz6ALz1pczsKxzviKYcge0fY8WB9A19k5LNlVUEO+SFTDpiN?=
 =?us-ascii?Q?v38JIVf358790DPK635osFdUpr51vOIi7aN3E3f2qraV3MFxY4ZdBO4SR+ju?=
 =?us-ascii?Q?bs6F6vQucupSdhJusXZjj7ud21QQAJnDG0FEm3WbJ55g/tAQB0UDPgQjDB53?=
 =?us-ascii?Q?OXv8LS+zk63w2OjPoYkIz3UbFKnr0owrjkAVdci0rd6rOt+4T6Ynyo6DJ74g?=
 =?us-ascii?Q?l5zOH6W1VK7H6WueqxXPRKE7QA506X+eOanSEWNv6MImuGsx7EGcq2mhhC8C?=
 =?us-ascii?Q?zOhfDGY07vnaoa3/n9aZQPraqFErEtUydpDKDMaO3bsLYDgtEaJj42ONuJtG?=
 =?us-ascii?Q?zJG1PWT7yFL/ZStIpift5nEPerm2KhMSkSI6pUeJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5978d163-af02-43e2-e460-08dcbfcfc73f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:50:30.1549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /GEy7FhY4lvA7zhtF0UYDg+dQsh/ChsiCOKS4iSgKFSPfuo/ZqnC6wyNI5gnk7LGXpD6VKMnDjJjkBFcDPKsrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

The clock API clk_get_rate() returns unsigned long value.
Expand affected members of stmmac platform data and
convert the stmmac_clk_csr_set() and dwmac4_core_init() methods
to defining the unsigned long clk_rate local variables.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 2 +-
 include/linux/stmmac.h                                  | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 901a3c1959fa..2a5b38723635 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -777,7 +777,7 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_pr=
iv *priv)
 		netdev_err(priv->dev, "Failed to max out clk_ptp_ref: %d\n", err);
 	plat_dat->clk_ptp_rate =3D clk_get_rate(plat_dat->clk_ptp_ref);
=20
-	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
+	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
=20
 static int qcom_ethqos_probe(struct platform_device *pdev)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac4_core.c
index 31c387cc5f26..82b102108478 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -25,7 +25,7 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	struct stmmac_priv *priv =3D netdev_priv(dev);
 	void __iomem *ioaddr =3D hw->pcsr;
 	u32 value =3D readl(ioaddr + GMAC_CONFIG);
-	u32 clk_rate;
+	unsigned long clk_rate;
=20
 	value |=3D GMAC_CORE_INIT;
=20
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_main.c
index ac80d8a2b743..398a33bce00f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -300,7 +300,7 @@ static void stmmac_global_err(struct stmmac_priv *priv)
  */
 static void stmmac_clk_csr_set(struct stmmac_priv *priv)
 {
-	u32 clk_rate;
+	unsigned long clk_rate;
=20
 	clk_rate =3D clk_get_rate(priv->plat->stmmac_clk);
=20
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..b1e4df1a86a0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -639,7 +639,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8=
 *mac)
 		dev_info(&pdev->dev, "PTP uses main clock\n");
 	} else {
 		plat->clk_ptp_rate =3D clk_get_rate(plat->clk_ptp_ref);
-		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
+		dev_dbg(&pdev->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
 	}
=20
 	plat->stmmac_rst =3D devm_reset_control_get_optional(&pdev->dev,
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 7caaa5ae6674..47a763699916 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -279,8 +279,8 @@ struct plat_stmmacenet_data {
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
-	unsigned int clk_ptp_rate;
-	unsigned int clk_ref_rate;
+	unsigned long clk_ptp_rate;
+	unsigned long clk_ref_rate;
 	unsigned int mult_fact_100ns;
 	s32 ptp_max_adj;
 	u32 cdc_error_adj;
@@ -292,7 +292,7 @@ struct plat_stmmacenet_data {
 	int mac_port_sel_speed;
 	int has_xgmac;
 	u8 vlan_fail_q;
-	unsigned int eee_usecs_rate;
+	unsigned long eee_usecs_rate;
 	struct pci_dev *pdev;
 	int int_snapshot_num;
 	int msi_mac_vec;
--=20
2.46.0


