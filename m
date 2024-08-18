Return-Path: <linux-arm-msm+bounces-28916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD7955F7E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1521F21B36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BFB156230;
	Sun, 18 Aug 2024 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EmjBMkaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64115622E;
	Sun, 18 Aug 2024 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017901; cv=fail; b=AEZmX0lk+qiv2kaZQjBkajA1vagySQz+0Bsa6n/ueY4Qr+Hl8pI/7ugaiGF8C3X2QlxLLc07IEp1O48zbcMH21uwe6Mx4bVxx64IuasWaAWPK3WZDg/BjxiTMkRR5zx0lQ38NZ0gUtG3yccITCM7sdNBEPE1JzuT8WXrNJRtGx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017901; c=relaxed/simple;
	bh=xc1833uow6TZS9SxVD90ZO2PTONyLtHE9saJ8Lbc8O0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZdROyINjBNG3wtvgP61NtBjpqi9ZzXvF4YQgDfUayclEfM/E9toLS+o0Mah0JQf8MaC14xxdmEDYDiFjV3iIM2whVfXlLGx8utegZo9KPva+F1+1PnaLewxeDBZ1N4rCIo+CUJDiQv9/0gNB0VbYDcaTxyCpYGMnfx/EuuRHnHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EmjBMkaD; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFq8Hm7d9pQUhCAY5dCab3s3SC2EwUwHLDVjvTsLGz19RYEVRvVEN0sd0ijX0zUbzhavbQID9txcawKkGbjK1ocC4LMrnBl7y6uEfq/UvYuQjYfBXQpTyAUH7fbObcHsw2q252n1b5BkwhpVXb2/++OtviRA8/NI7C6zsh/GZzKZYnXbgVs9BJa6IX0jHpD0CQ2n/bMiFamZeRa2FV4ASK7rKX+iWxdCJc4tHB/kY7kDI+x7KKCtPn2azhx/OmLRE0w7oKKXZ6da2VS93/h0IO338tSdZg+/iGT8r4caFDZedTnWCPH/ucIRaD50/a21hv9Y2wwmkhmLOYoqXWLOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49LtjNIpKPxyY1OYaNx66JFFNLMlW0AMvclijvGrjxE=;
 b=SZhLjgmyVgko10+ledRy1lGeExgzvC6qrMRT6SppKyHCwj1aLDiE0VqGMjPjHvWVKEeQklmoTFVZfas5WB/ROO7HAP5Io9CR5hmzDCIxOlr75jc5K8mSDAFG6PHaT7F/pCLW5B60JZXbMKfZLHE+Htj/eK2TFujq78nbKmvVqgO0dfdwEz33XGYJ4Tu11Pxc+WYBuUTvHxXF64LDCEo/dqOXDK1n0s39rFHuY8gDGvNu2FuD850rDz6gtVGCrqdAuv+zxTQ6qxeEfirDg1Bycs9rk7EaKD3v2/HMcEb//dxyE0/CPEMLhUViD3Or3zbQwlMDsnWNTemeWEzPzO002Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49LtjNIpKPxyY1OYaNx66JFFNLMlW0AMvclijvGrjxE=;
 b=EmjBMkaDmgdNy+ffKJTMYJ/tJVCCeMPmKxAtmLLXu3rrJv9JnJJH/fv3RldkLN1eOJjywwng54amCFwf36IpLun89nhTc03v5mD5JT29ZReLmEBqNprVnm/jJAT3yCVIz14yHCiaLwihBfketWl21g87qEJdVGfiWIffQ7Z9jNylUXk0NXMJTyut71iDzHdKpku9dDlpkFmNfhMutQlysk+dyP8KqnkUIw193h4WTk4g2eX9dfwsyQAts4RhduUy3jiCifm+V1AEM3dSwczDiJceSJV+U30//OO2Y/PoPUGVY8MYsVa3GZNqIiYxAAc5/18zmT2eo2zOd0jZYJz+8A==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:51:35 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:51:35 +0000
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
Subject: [PATCH v2 6/7] MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC
 driver maintainer
Thread-Topic: [PATCH v2 6/7] MAINTAINERS: Add Jan Petrous as the NXP S32G/R
 DWMAC driver maintainer
Thread-Index: Adrxt5rDI92WVLvSRZGBnyb4KDvPEA==
Date: Sun, 18 Aug 2024 21:51:35 +0000
Message-ID:
 <AM9PR04MB8506ACE99448BC4482A30B56E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: c2d85e3c-ef18-4aff-0913-08dcbfcfee5c
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yNJIPjAlR6M1BqUprRwkMQdiJOsUr76dy1FKAuWqNwb5D1ltS9I+WstS9GJ6?=
 =?us-ascii?Q?+Ppte9WLUTr7VmM7wsttUMB4pngpVF8Pw2CvMGgVtwH07fLMs9z726mFw3w+?=
 =?us-ascii?Q?XJvVdM8bZ56Va7dHIG4Ni20GU8/hnaxhO4qOCNkzG4VDVl0ii+lpThB8LxUG?=
 =?us-ascii?Q?ugFUegI/UfuDEiBRiei+zuzsel3J47YkutiskLBUuocVJL/ShcuKbu5QZRgP?=
 =?us-ascii?Q?OtvionylpB9ptLnO3ss3y8aV88WrpZJ/lMbI221zY87w+Dxcwz6gxG4tSv9k?=
 =?us-ascii?Q?HuRMDhNrrj/ad0GIDWMchN/SO/dYzq0/fRV6ijoKC91lr066wp3gV9vX8L1F?=
 =?us-ascii?Q?tuwZuRPIe/Z5kv7kUyQszwQk7LmJ7HbewYPe82xTi4Rmz7tEiXPHJIuu5q+f?=
 =?us-ascii?Q?+M4MM36E1ZWC6XEFNczSnzUoyLpi1jRqcgnJsTbftq824G5Bg/sdN947C0J7?=
 =?us-ascii?Q?6rooZmNnIOFMWIOfO1geEIHtn2Qh9XUA5fyVxlA3eSjVvZZ8w5qoGcyttgBO?=
 =?us-ascii?Q?5axQXu3HbKKpJL4iNhtqfxQo63vP87iwqEHlARIjOB2pu8VbMl/1v0nEdI6k?=
 =?us-ascii?Q?YOurKR/krrNX6FesVfN3wM6/kHBFtxVlBKZ6fYqJ0QX3dqO6UxOCJPrOsxHI?=
 =?us-ascii?Q?VsL6HV3biCt2qS5Tf/GTDw+t8ZihlCfeOBeRfvx67Z3ZXwTsOGxusR+RcWCj?=
 =?us-ascii?Q?MvVxP6csdDhNqMuy1BuPIoBg0vfJhjhQ9gXMtoxzJDQvkhTr8L3vVaf9sxDj?=
 =?us-ascii?Q?6xSmfH8OmhY8T5lAQgEetPi+gNei0tVIuXF1bD2VZvf06Yd2Z7Sh/4FUt9tg?=
 =?us-ascii?Q?/FY69L849vLFxL+v0NGoaGbTooSAVwDyc3WoP+BDRtDCPQZ8y9Cauuwyn6bY?=
 =?us-ascii?Q?yD+Pa4r9cmcYVAJ92Xlzir12ERk46D3huizD2WD7xqFf8CsaptHeUC9IMFzP?=
 =?us-ascii?Q?bqV+dLTZdmZcLO6HzyU9qodeMNN3mVKAr1Oka7FX14vR+ZzYHhf7DkSkgOP7?=
 =?us-ascii?Q?bk/aXtxt8RYgZ4c8pTiEw7B2d5/Oa08aVFZl07DgWBNFSKxBGRv9/A8AcOQV?=
 =?us-ascii?Q?JDI1z5Fi/ep7hgLNYXyNh/Afk14Hj+Dn3xEjhqb3qhk1IXh5TFDAHfJNwhxb?=
 =?us-ascii?Q?9mjyI9yMt8vsI73zrAT3FIrTMklClkhdb78aVc11OXLML4riqGZEraQBxFY6?=
 =?us-ascii?Q?x6J2CS+nqSkxsd+CorSkMYnOfzZjWoj1QGgJrPAC26C+BBSfOYsDDF7XGpce?=
 =?us-ascii?Q?BkbPSShSLAUF6aIrsJ4ucF01jJ5uJjKh3CUJAksn/Qr3sfmBrrNBdO9jyIxq?=
 =?us-ascii?Q?d5kZ2qlwTfvGG6FZokl/2FEByHU0GkcO0eEJwQJxdMwx/mrEcXnVInh8daLH?=
 =?us-ascii?Q?TTKmxGydgVsX5lmoZ3SQFsOIXL57y7UmNbqbhbrGQbZ4syzUP2fmNQQp0XDc?=
 =?us-ascii?Q?mHwm25FUcKc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O31+46uS0VlgrczDTwpXLQShnimZ0SpTod56eVr/GqYktyja0EltoJh+BrB5?=
 =?us-ascii?Q?Jyx8MBwhwl10k0zcWIfxO8LRju1EJimPReOK6mm5n950CnHbZ5TRCxJ8AzC0?=
 =?us-ascii?Q?SFhUUrfcwgd7DmBETt742oiGbf5AOwMwdYsVU8qEYMrJR9z+SxPBRoC6RAuD?=
 =?us-ascii?Q?pFVIWLuEc6vV+l55qZNrSCw2aXB9qp8Ar6u37M1pFugXlE1GFYGPpiZAb1dP?=
 =?us-ascii?Q?kGOUfRQlTZQoBQeAqoLEaUvWqEi0AdrGuqOuAxdA00M0LK3xxIXZPIgPgjgz?=
 =?us-ascii?Q?9G8XcDNFuupSIoiVvP7LjIbvnmOguycRDPOzzJSR0SEISQdBmynF79EpmZxQ?=
 =?us-ascii?Q?uYYH6NSR6wH73qN6YQ3V22Ze1QYzlLEyx35aM+nacIXsIe0zotf+PT/Vea4g?=
 =?us-ascii?Q?40ddvQgZmNWhLrY/QHtw0pR6rx13/RpHLf52dRKRfitxTXbfGWXSO+/vG5dN?=
 =?us-ascii?Q?jY/o/uxra9A9KGLyX8TuxZwi/4Hz38QB72GnWdhEjs0z7c6IYKV6a3wfO6AX?=
 =?us-ascii?Q?5nCEz7To1BEo3QbaTd84y5c40yGnFsIYvhFUTJeHtKIQxGPfPTE9kiqOF44B?=
 =?us-ascii?Q?/q4LVXFgmDtvbtGdVlD0fBkfH+vuILjywOFGBlyOmcIM9MnyTmy/iIdcYOpa?=
 =?us-ascii?Q?Y7GEsXpW4xTaeZfd2a8ywRLi1JZ64aJYZ9Hea2cOq7E6IuvrYlsvFUH+MRVa?=
 =?us-ascii?Q?X5qndPyriDhCx7rF2T1IWi7oteG/421xjfIYEIOew74wg0EHLpNvqr30Dlkv?=
 =?us-ascii?Q?+HAwNsSYG6Yc85NIFM9Y8nurD3rIfHMOVK7lYwR7alnY4UUS3SeJigfAhwQ/?=
 =?us-ascii?Q?Z4ZAzTFypI5H4qGnXZ9vXAgWJgP5/vrajksv16sLDmeMo48jazzTBB8ILF7v?=
 =?us-ascii?Q?pj9OLBnBkR9jOOykp4w6WtxuKnNJhGHgkrRVttI8+u35bEUc2hlUIP71qcCy?=
 =?us-ascii?Q?4FrV8rppkBw1jtVtIG9kih4ImR3nTVWn3v0E2Lu+2kFo5lirZe9yyoc3XzfX?=
 =?us-ascii?Q?Lct9Rm2FPj3Px13i0LUp89VIC9V2mVIoFESRe6q8tCxdYEgg1YL3BmBfQ+/c?=
 =?us-ascii?Q?8XNnJ1kvjSepeYZIePubUZR+RRCBRZtxopSRuwZbsMoISLYR+Q2/MEQvmjik?=
 =?us-ascii?Q?Vzo/xeScVJG6A56LNdEvNJcnEfwhwIf0z00D1DHhOfR4s2KDF+B/NGrZKVDc?=
 =?us-ascii?Q?6jhjFvy5wglgxDH7bIlcPiPBMJdTocKfUKgAKmtRx/jFP2NlLC5D3Aru5Iot?=
 =?us-ascii?Q?cAtCGnTEKHB+brpDfRAychhGVF784/hJXRyDrDm+h53cJ+Frp+aXlsUMMTWO?=
 =?us-ascii?Q?jXku/9Yqmf+Hga0cUinXWd4QpGYrECf6PyBhv5vYkwQWsAC5/zYcozcDr9zZ?=
 =?us-ascii?Q?4ok1AlN9hW1kGxV6VVDATevPojS1bI+mYG4brI7D+T9Gg26syi4wX+oWo1X/?=
 =?us-ascii?Q?quF3rKu3FyXfcVODuPLwTsMPFZuWHBBgTiKnuHZZVqdI1Ct82uG0/pCy5tLs?=
 =?us-ascii?Q?CPicd86RfjQkRaH7hPLmgxUeGAVM3D3oLbZBKCRqD0Orq5/3S0xsJzy+g65H?=
 =?us-ascii?Q?dhE364SglZASqX8upR4vBUxDELwIwjrlNKFM3QqW?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d85e3c-ef18-4aff-0913-08dcbfcfee5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:51:35.7440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ImzLH04iBz7Gx/vZREaF+XDwmKZoIQhEa1CdoeQL6UOdkZj/giPi0K+1BltDj4nDrkBhZwWbnOYzRL1eHMydVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

Add myself as NXP S32G/R DWMAC Ethernet driver maintainer.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..372dc4305f9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2692,6 +2692,13 @@ S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
=20
+ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
+
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
--=20
2.46.0


