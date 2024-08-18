Return-Path: <linux-arm-msm+bounces-28915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FF955F7A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E75281CF5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E539156C5E;
	Sun, 18 Aug 2024 21:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kkx4gYUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F6158DA9;
	Sun, 18 Aug 2024 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017860; cv=fail; b=FGQEr4Px5Gq5Ov4rdnj6oBgySlNU+WxnK0L6KdPtnE+lB7ueaKUl2J8N2oG3bbkuVOZXYwqAeANjFlMJTkzPMJ0RIaj0hyuri1wN2GLMEe/n9EcRdPyA5Dle3xeIMngNYqBxU7OL2IvAEqQhww2HPBP2sgykfCiNV+B/UMOCk5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017860; c=relaxed/simple;
	bh=Ke2PYi5lHotnYKyHRsQLvOqtsjVFqVnn4pjZH9ypI8o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gAnQ1xNTmbEw5OnJU6n6tXT7LhPeQ0ICW2oA+Gala6eTWflFPL7si2Ye2K1Np5zIjYhC1BqAbFZEDchDAjPkl1tCDuVMrOoM9SfB5Vt/EgY07CVwotDgKGUZr4pxzTlHEzip0ctDZOKT8k9oaLQMC27uL9C0kX0LLgXpGPKQYSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kkx4gYUv; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glhbd4ZT6H4F0mLAK5h1iT/cN2whUIEPxgOF6YPb/lNinTD7UJDeH41bEioClBrbtAU8HmKGZArFYhMVxK2E08b9z0qy3ogaV0tOX18RFEZyWl2xvl4/eKPyvAZQeC9YJ7iHg5vN4lxMUJkdhHxcLlsRAHXtlL55lEXiJecSdOrHceeGqasbpnYoj29U/ZAJCn2Ua/jlgUvj9/0mp6n12UiiDgph6lGYwkd0zVeio3/BSsPjJb/CfiGHOXz8Ks8xGR0vK1FSLdub9jDi9lF5g8ZZF5Y3k2SezqnXVGn6hhmawbFrnA0oMQqouTI3uRp2scs/HUktRlUev4qncRG2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riL7IzsqVcPW/+gfOKKOOovR33BBnPDeeIsjyUQFllo=;
 b=ywMkxmsO80bfH/oJkvoI2QlUnHcCDgKYBc67a9KfKFd50ydJtXc1Gx2CmK9rEoAU/jnLJUaWtD+N1roKfxk/2ivmd/RK5zALLneTDu35sYsDHWBk5eOII1uYVcb96PwbX8Eqfpqb9XeN+X5J/EbJEEr6UQg0Fr2NeGbRw++n2AbRm104OiQ3XlakBJvv+FUD7crNZAFd14BsLdpch2ZzWR5RLgxoXH32LN5CIkAjfIFCggtaN3AMrFMzkuWaW3HjHMwz42A0NFiAN2Nr10NdbIMx/LwVDbnilSwFBJ1437usJFBjtLmuFp6OPKYpZYNsqB7GJQQcSL0qL4fC8UBkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riL7IzsqVcPW/+gfOKKOOovR33BBnPDeeIsjyUQFllo=;
 b=kkx4gYUv+Z+TCEhnR4L02by23YhHvtOpFWjaJzzf1bXTqvKmWkNEzMRsUGI3KV3pM+UXWZPSiL61gGPWijPM3+ZeSa0gydr++qTo3VxzNicJyOOlqRi1wgsyTlZBUAX6jLYOU//xQGmuSHPnD/Sr7bj16m02XCD6/BxwKXHL2DBYsp1xNlW4gqaTQSItvlHIH0Bd44e+peRBQE0wE4UiNuXK/it2SafgJw9X3RaW6yIuSdz8LY+Ute8Y2/9S7SX2u0MXTZP0PIIzfq6/w/LWUvXwpL8CKm5gfW4URMkvyaWYBiFxxNOklQkWBs0O3GZ2brqsFJLtrdEojoGZ5xBsEg==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:50:55 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:50:55 +0000
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
Subject: [PATCH v2 5/7] net: stmmac: dwmac-s32cc: add basic NXP S32G/S32R glue
 driver
Thread-Topic: [PATCH v2 5/7] net: stmmac: dwmac-s32cc: add basic NXP S32G/S32R
 glue driver
Thread-Index: Adrxt8FapI9v/GsDS1qUz5lqcPWX/w==
Date: Sun, 18 Aug 2024 21:50:55 +0000
Message-ID:
 <AM9PR04MB8506DECD381225ACFB311329E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: 55e642c0-b11a-412e-f0fb-08dcbfcfd626
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qJQ5+gIBahzx5n+AdsNpNrHR6qnmfj0zIEsPfARewhVEnF2zpkcQZwmMy1TF?=
 =?us-ascii?Q?HM8NswU6n1+n6PO9dKnEwgGsMzgghPbFX6DxM628dATJTXLoUZD17NT5jfO6?=
 =?us-ascii?Q?kzeAKz45V2uMpuHAbLcQD53h9apSJWRbLuOniE0BjCdmAAePgljxjsQuY+S0?=
 =?us-ascii?Q?LJgtUzXCDESHOJJ+zs5r/78EmPRaxGFFbKHREeuClB8V+SWzdfE6BaNg4Taf?=
 =?us-ascii?Q?bCIX5FjUpbDHWunG3mI1PJBjx+paqVvgkUp05f0qCjke6yXMr9XleP+fE+Tb?=
 =?us-ascii?Q?7TYBDDNpGyX9YLFLLKlZt8NielIy3c6AzbN0OfJo495iIaLXWbyTkXHnwAoD?=
 =?us-ascii?Q?e0eLBZ8Hh75wC04eQloQa1EwAuu98rFR74xFfPzRtcyvc8FGnrNvYwv6fm/p?=
 =?us-ascii?Q?Uh6EpaSzjkPnqwcBxAGT9n6UEZAJltd2y494Cyh3kJ3I8hG8FEsPqLNr+Rt+?=
 =?us-ascii?Q?3FEzS2S4YGZRRCW7wfaYqKgIsBP4N3QXxh33FaUVB+A8D0KD96pWs1AaMwa9?=
 =?us-ascii?Q?cnxiAl4M1xIPdoSsKohJc4shJan5CKuRVF1+DiB8qF3bl7SppDI8nLUB+H/Q?=
 =?us-ascii?Q?4ERuOYZYBIa30fJBmQa1j5j+/LMAnQxkFf3viTah9ApTU+vNqNIXZZ4Pso/u?=
 =?us-ascii?Q?sZx+cxDYlIYbBxa6XyV2CWwfDyCjxFx6eM0LQu2XGu5siW1YO5GUVmYZ1sUm?=
 =?us-ascii?Q?qDoEcv06JjKsRXCrga4cFzvFzxiw1kFW7Tki9cpNsjXN+EnIEsCIj6F+BZSD?=
 =?us-ascii?Q?rBCrLaGC7k/VkgVIHS8r0ew++AfpCjrnOeHzsZN+xcmNfwvd/Oej8CWCvXg0?=
 =?us-ascii?Q?2Kd0mt/09AeQ21Ztf7Rj5YIx+RmZOdmHLNALIxsPq0qMj0wuYKVD9j9pih4+?=
 =?us-ascii?Q?iRRrZjLDlpNawLeTJobG9JGOFzFljWiUVoNVihEtoViu9jHEub23DlOFkLMj?=
 =?us-ascii?Q?DQ9CrKimyDLw/1JZMdXfqJBgCFtMkhfWiCL+o6hZB3ZkL21dcv1+8comyKRE?=
 =?us-ascii?Q?NDV2XPNJ2bKMMg2EQBRw26LMQgeFN+qZbuGgAMuvLnwRU7BtN478SnL+mF0o?=
 =?us-ascii?Q?tU7W++C7lsiSLj1gK8ZglciG+uTfpiRGlDvPhACrNB5m/0TRvuJKWUnTREfy?=
 =?us-ascii?Q?tFoPw3OgpWNhG8vi4ul0orvXzOXtJ9XZ7td1OR0ccVADpLNQgSC+dhKqUd1O?=
 =?us-ascii?Q?Lt19xH3nRBzyLNk/exBCmvxm8pI4YZ05tn+8NoLZJTTOVsjpGFCJ+Y1J71Rk?=
 =?us-ascii?Q?ZNOpaEnGEPEi5d1+JSZae3xxNVILlsN8P/A6cWkInMbI84d601R5+f2XafD9?=
 =?us-ascii?Q?H7v/88Mx0hFHcPprjb3N8n4sKRpZ+b3Nh+6YvYMFHzi682njSPmJu7E7i7wS?=
 =?us-ascii?Q?XZtIxhgJxfXqWwDdxVHeFoB7lTgR6bG3WI6Pc9DzK6kAKWIm5/D+3XREePf4?=
 =?us-ascii?Q?jhjnU27HHvY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fDSTZxICpWMQBE//pcGu0AXTZzGOXWedKjhmd6Ch1C34dyBGeirlSwSd0fiQ?=
 =?us-ascii?Q?es3ygErCQueFs5aExnqBbV4fm2A8sup224Wz+kMgduxvZxFW6pLcc8dPsglk?=
 =?us-ascii?Q?NRQo5VtmbKFR4eYU3jXSvh9+vhuQk/A9AyO2To3Eg6DbjYCSS6BO9bTtlQJ9?=
 =?us-ascii?Q?wit+ynV61lZNsgTmV9MyEzivEJtcRwh0AL5azPqYvNnPKpJwXs3RE043SmGr?=
 =?us-ascii?Q?A0TPNl6yKQywOlbBqLg2z9pD7Uci7taCSNoDvuoimVfiiKkzJ7diVlbRi5GA?=
 =?us-ascii?Q?JVkC+PeuGcEjd6twTy+vnboC/HCb5ktmNXA3M0nFfn0HUn3yrPAMEF8W9ztF?=
 =?us-ascii?Q?yXCnZi7/D5zXEHMp+aNS+e3sFfs+8kiOzPytc2H4Ir/ZMiegqK5XmiOM7jXF?=
 =?us-ascii?Q?+qMmbg8hGFD6ZX63F7gXh2kKHRzyKbh7ZbNuAOZv+lmvmG/m1m/I95y54Clr?=
 =?us-ascii?Q?OKD5TmxQlrMdjDN5hqnZULhXphVs2Q73Kn+tqs+yZEoK3GLuWgyAYp8dwiMv?=
 =?us-ascii?Q?8YtUrGFKUlSsW5zbLj4NOQ6Cudl9Hka8LbzznoOjtG2AvQIE03SGgaHtdSUh?=
 =?us-ascii?Q?hC8xCEo5NSbwts+dzigNk0dQYYtU7t2XR4K9yQ2HW4ZalcQKZu4rQsVxxGK1?=
 =?us-ascii?Q?V8QSmBZ58Dz1YQnMjdxlPjzX/V8kt3tu/PLd3QIIYJxDXYciEYchMPThoqum?=
 =?us-ascii?Q?FD95iUW5BhVBRTP8lGw2C3jH7AeuOL82wPG8RR6zD3CuBd5ydeSnmeQnVnEl?=
 =?us-ascii?Q?J1eqx1XvkuqsR4HdSLgT6FotADu8g9ArK2/mzCW8hsQg+KiDATUVjf8aPYFh?=
 =?us-ascii?Q?Qh/Nw4cCVy/78xz29dRsY05N9PmNQgHokgf6xJ/e0nknFqt1vE/pYgOpEaY9?=
 =?us-ascii?Q?M/vj7TqJCxg/c3y1LAcHF1Byr6RqZnF1ZfpABJFy8Fh6O6+DYdecrychDRS+?=
 =?us-ascii?Q?QeImvQPA0fD50HtVoal+9jK8ZPpJzI3dVyq+V/6E+0cz7XWOHTJhwb04UNXd?=
 =?us-ascii?Q?AlAqUvYlQ/ocXYyY87ZwKrLXq+lk820b704lLPXZuhN1h9VNONI4HlD4gnGa?=
 =?us-ascii?Q?UYBiw2ybj9mbvahwVzzW7TwgPex3D8nI4wju1eMIPqSCKnIT99k3YTicluN6?=
 =?us-ascii?Q?UC43UKeOb2JJ/gtwMs6u9SM7jpkKnK1VGQjlvuJim0qNxK6SPf0i7JRTywy9?=
 =?us-ascii?Q?/U0OUg6j9hLh4yXPHK+F7kFnCibOQw15lNur5nAbF4GCSBbj5Z9Pk//IeD90?=
 =?us-ascii?Q?SubqT1mugnveUQco+EYvr6LYmi/U16arGCN/3/wNkgOoDA+936m2clufbdfj?=
 =?us-ascii?Q?mR6d3tkd35i90RMjJyvLCePSnkz4pCrGEbEkFWQf0FT+nY/pF3gkifBi1pje?=
 =?us-ascii?Q?TpMIcMW6PijzU9wNWkW3MgfRNYrKgUhhXa0MzQhS5iLzB8jFUh8VM2L4CdsK?=
 =?us-ascii?Q?JA1+goyMJMk0ky0VcFIqt8iZyjAqJW5sbkpnBXztUHQosFx7x5Sj0SVyYeVs?=
 =?us-ascii?Q?8gNhNfO3tvabmPEaBqJ0Jh9er9vfmcbhslgp8UyNFi1+hWrFgTDwzBUiKUae?=
 =?us-ascii?Q?G+AybJnYtNpvybNVlQBAeqbmET2ZbXImilcwIdcu?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e642c0-b11a-412e-f0fb-08dcbfcfd626
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:50:55.1252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghAcSUHXXNpdfyAp5OZNxsWdj8tOdxQeTe7ARLfykZEfeADjDuzyySYBDgNYqQKoHycY2nfWtZviTrgye+d4SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.

The basic driver supports only RGMII interface.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-s32cc.c | 235 ++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethe=
rnet/stmicro/stmmac/Kconfig
index 05cc07b8f48c..b2ba72a0b8dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -154,6 +154,18 @@ config DWMAC_RZN1
 	  the stmmac device driver. This support can make use of a custom MII
 	  converter PCS device.
=20
+config DWMAC_S32CC
+	tristate "NXP S32G/S32R GMAC support"
+	default ARCH_S32
+	depends on OF && (ARCH_S32 || COMPILE_TEST)
+	help
+	  Support for ethernet controller on NXP S32CC SOCs.
+
+	  This selects NXP SoC glue layer support for the stmmac
+	  device driver. This driver is used for the S32CC series
+	  SOCs GMAC ethernet controller, ie. S32G2xx, S32G3xx and
+	  S32R45.
+
 config DWMAC_SOCFPGA
 	tristate "SOCFPGA dwmac support"
 	default ARCH_INTEL_SOCFPGA
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/eth=
ernet/stmicro/stmmac/Makefile
index c2f0e91f6bf8..089ef3c1c45b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_DWMAC_MESON)	+=3D dwmac-meson.o dwmac-meson8=
b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+=3D dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+=3D dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+=3D dwmac-rzn1.o
+obj-$(CONFIG_DWMAC_S32CC)	+=3D dwmac-s32cc.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+=3D dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+=3D dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+=3D dwmac-sti.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-s32cc.c
new file mode 100644
index 000000000000..8daa01d01f29
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NXP S32G/R GMAC glue layer
+ *
+ * Copyright 2019-2024 NXP
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/ethtool.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/of_address.h>
+#include <linux/phy.h>
+#include <linux/phylink.h>
+#include <linux/platform_device.h>
+#include <linux/stmmac.h>
+
+#include "stmmac_platform.h"
+
+#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
+#define GMAC_TX_RATE_25M	25000000	/* 25MHz */
+#define GMAC_TX_RATE_2M5	2500000		/* 2.5MHz */
+
+/* SoC PHY interface control register */
+#define PHY_INTF_SEL_MII        0x00
+#define PHY_INTF_SEL_SGMII      0x01
+#define PHY_INTF_SEL_RGMII      0x02
+#define PHY_INTF_SEL_RMII       0x08
+
+struct s32cc_priv_data {
+	void __iomem *ioaddr;
+	void __iomem *ctrl_sts;
+	struct device *dev;
+	phy_interface_t intf_mode;
+	struct clk *tx_clk;
+	struct clk *rx_clk;
+	bool rx_clk_enabled;
+};
+
+static int s32cc_gmac_write_phy_intf_select(struct s32cc_priv_data *gmac)
+{
+	u32 intf_sel;
+
+	switch (gmac->intf_mode) {
+	case PHY_INTERFACE_MODE_SGMII:
+		intf_sel =3D PHY_INTF_SEL_SGMII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		intf_sel =3D PHY_INTF_SEL_RGMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		intf_sel =3D PHY_INTF_SEL_RMII;
+		break;
+	case PHY_INTERFACE_MODE_MII:
+		intf_sel =3D PHY_INTF_SEL_MII;
+		break;
+	default:
+		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
+			phy_modes(gmac->intf_mode));
+		return -EINVAL;
+	}
+
+	writel(intf_sel, gmac->ctrl_sts);
+
+	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(gmac->intf_mode));
+
+	return 0;
+}
+
+static int s32cc_gmac_init(struct platform_device *pdev, void *priv)
+{
+	struct s32cc_priv_data *gmac =3D priv;
+	int ret;
+
+	ret =3D clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
+	if (!ret)
+		ret =3D clk_prepare_enable(gmac->tx_clk);
+
+	if (ret) {
+		dev_err(&pdev->dev, "Can't set tx clock\n");
+		return ret;
+	}
+
+	ret =3D clk_prepare_enable(gmac->rx_clk);
+	if (ret)
+		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
+	else
+		gmac->rx_clk_enabled =3D true;
+
+	ret =3D s32cc_gmac_write_phy_intf_select(gmac);
+	if (ret) {
+		clk_disable_unprepare(gmac->tx_clk);
+		if (gmac->rx_clk_enabled) {
+			clk_disable_unprepare(gmac->rx_clk);
+			gmac->rx_clk_enabled =3D false;
+		}
+
+		dev_err(&pdev->dev, "Can't set PHY interface mode\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void s32cc_gmac_exit(struct platform_device *pdev, void *priv)
+{
+	struct s32cc_priv_data *gmac =3D priv;
+
+	clk_disable_unprepare(gmac->tx_clk);
+
+	if (gmac->rx_clk_enabled) {
+		clk_disable_unprepare(gmac->rx_clk);
+		gmac->rx_clk_enabled =3D false;
+	}
+}
+
+static void s32cc_fix_mac_speed(void *priv, unsigned int speed, unsigned i=
nt mode)
+{
+	struct s32cc_priv_data *gmac =3D priv;
+	long tx_clk_rate;
+	int ret;
+
+	if (!gmac->rx_clk_enabled) {
+		ret =3D clk_prepare_enable(gmac->rx_clk);
+		if (ret) {
+			dev_err(gmac->dev, "Can't set rx clock\n");
+			return;
+		}
+		dev_dbg(gmac->dev, "rx clock enabled\n");
+		gmac->rx_clk_enabled =3D true;
+	}
+
+	tx_clk_rate =3D rgmii_clock(speed);
+	if (tx_clk_rate < 0) {
+		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
+		return;
+	}
+
+	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
+	ret =3D clk_set_rate(gmac->tx_clk, tx_clk_rate);
+	if (ret)
+		dev_err(gmac->dev, "Can't set tx clock\n");
+}
+
+static int s32cc_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat;
+	struct device *dev =3D &pdev->dev;
+	struct s32cc_priv_data *gmac;
+	struct stmmac_resources res;
+	int ret;
+
+	gmac =3D devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
+	if (!gmac)
+		return -ENOMEM;
+
+	gmac->dev =3D &pdev->dev;
+
+	ret =3D stmmac_get_platform_resources(pdev, &res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get platform resources\n");
+
+	plat =3D devm_stmmac_probe_config_dt(pdev, res.mac);
+	if (IS_ERR(plat))
+		return dev_err_probe(dev, PTR_ERR(plat),
+				     "dt configuration failed\n");
+
+	/* PHY interface mode control reg */
+	gmac->ctrl_sts =3D devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+	if (IS_ERR(gmac->ctrl_sts))
+		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
+				     "S32CC config region is missing\n");
+
+	/* tx clock */
+	gmac->tx_clk =3D devm_clk_get(&pdev->dev, "tx");
+	if (IS_ERR(gmac->tx_clk))
+		return dev_err_probe(dev, PTR_ERR(gmac->tx_clk),
+				     "tx clock not found\n");
+
+	/* rx clock */
+	gmac->rx_clk =3D devm_clk_get(&pdev->dev, "rx");
+	if (IS_ERR(gmac->rx_clk))
+		return dev_err_probe(dev, PTR_ERR(gmac->rx_clk),
+				     "rx clock not found\n");
+
+	gmac->intf_mode =3D plat->phy_interface;
+	gmac->ioaddr =3D res.addr;
+
+	/* S32CC core feature set */
+	plat->has_gmac4 =3D true;
+	plat->pmt =3D 1;
+	plat->flags |=3D STMMAC_FLAG_SPH_DISABLE;
+	plat->rx_fifo_size =3D 20480;
+	plat->tx_fifo_size =3D 20480;
+
+	plat->init =3D s32cc_gmac_init;
+	plat->exit =3D s32cc_gmac_exit;
+	plat->fix_mac_speed =3D s32cc_fix_mac_speed;
+
+	plat->bsp_priv =3D gmac;
+
+	return stmmac_pltfr_probe(pdev, plat, &res);
+}
+
+static const struct of_device_id s32cc_dwmac_match[] =3D {
+	{ .compatible =3D "nxp,s32g2-dwmac" },
+	{ .compatible =3D "nxp,s32g3-dwmac" },
+	{ .compatible =3D "nxp,s32r45-dwmac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, s32cc_dwmac_match);
+
+static struct platform_driver s32cc_dwmac_driver =3D {
+	.probe		=3D s32cc_dwmac_probe,
+	.remove_new	=3D stmmac_pltfr_remove,
+	.driver		=3D {
+			    .name		=3D "s32cc-dwmac",
+			    .pm		=3D &stmmac_pltfr_pm_ops,
+			    .of_match_table =3D s32cc_dwmac_match,
+	},
+};
+module_platform_driver(s32cc_dwmac_driver);
+
+MODULE_AUTHOR("Jan Petrous (OSS) <jan.petrous@oss.nxp.com>");
+MODULE_DESCRIPTION("NXP S32G/R common chassis GMAC driver");
+MODULE_LICENSE("GPL");
+
--=20
2.46.0


