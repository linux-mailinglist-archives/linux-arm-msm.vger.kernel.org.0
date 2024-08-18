Return-Path: <linux-arm-msm+bounces-28914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E12D955F76
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 625C81C21163
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E142158D63;
	Sun, 18 Aug 2024 21:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NNIyv90a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1F2155C94;
	Sun, 18 Aug 2024 21:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017851; cv=fail; b=E5r0wf6GFj7hHWUelHYilAWrCrV9EuBdYqMj/Om9z6EGwYDvchbjOmk3GBseyWm8/rTlxicrgmmRqi2VzeTfih8XD4MhPuTjMYJJwXTBCas5j497eLB0GR1CcvhH9BL9nS2nxplrwb4Kp8KZmN8yhBqzaStSL7YZt+pcx13Dy8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017851; c=relaxed/simple;
	bh=oKCfR80I+yFW/sz7oErM3eB1fSK/+A8xK2voiyyop9A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YRJaTS5NsdQtYKw/1YCykE1npxTF2zhFaZe7BxyHLhElWXrorjPWJh1T/GFzb7/oUfi8SuEYbg/OLC6GRU9lyFdxwszQYfijfM19x70qDyS4qUPUSPXwj6IPUi+D67MNPMUo2xDg/OHBdmsINrK2c2B55+ecCC5RdU1UB7G/nDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NNIyv90a; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvRUlX0RkHA2ao1gWY+5I6Bii6HrmeWanIoxH+u/GiUMXZQNZdL2ICBE8HcrXVyoKMrrd5MJfoOEiISru85nPzaucb78FAXRtSG8Hkb1/z0SkVTV1yRg/dZCMGSGQnWMROPJe+chBFjo1FdU+sjFEYXu1RYsW5wf4ThQemCEI3DPmq48IsAoTcx2LRDrXEH2w/4ufbRGc/0oRMMK7ataSFELFazcfro3Njd6kjgzK6rqsw88mHSdWBfmFAJgxoIPHKTn8geelrZ7sbdinViOKWX72HmTus5dNfhBrRJBaVYDvcekJS8LN6EIAMWX/Qsoh4pNOpmz1Mk9Kfh9zWBnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e/A8FIZQaHkh4tVpBQ6ccEOQsPH2pXsQibQfnMmdmI=;
 b=e3R78aiLToc4B36ffEl9NKXpPmuM9fdpJuYj3lzWpprfuIo2Tt4bjqvQ1Ddn8vWiRY6D2gzRjfjfyLOUpgEOjgcP5sAKKwTFVu+2fZ/8TKb7w1ciAqwOpP3VvQv0dCKOTHzhS9/IuZnQshwMUCXz+PMm72SZ4pLG+wozL/xyAdmNiwhvgGsPlHnosTqUhNjO37XDyo6RFwDlXrDLRk4qyk7ZxOiaykyOa5iKfuC6PMs5p1xwhsvP2PLCOvIQzc2ov10jwMVIkrxfQg1ejhoKZSwLr3Hq/WuXfQEbr9ubak7auh8y5d0gY0Wxkmw0bFGSKVmmnrMNbIy2FeRI59DsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e/A8FIZQaHkh4tVpBQ6ccEOQsPH2pXsQibQfnMmdmI=;
 b=NNIyv90a857Mrd867rkxkZcOfOB9hF90ZFXushMu8/R7dAzR32VCu1Jb64doBCWiGfkixoEjz+GAdtVPWh/8MjZciLRES1we2XZgHALZy2xRzssQd80hB5UVvu1++2iN7ly84Ic2P8p38V3uxJIIlWHMJfL1Yv4JQ4KrGj8mkzrbNvlkb/cAoc3QY9dNh8IHc+ujk6addz6rgGRaGLWL7EPakA4T306ZQ+Ix1TsCE56Ng/o9ssVmSURksgx6u+kh42/gWJY4BUW1bvAjg+Qx+KKCcpniJyPh4ryxu672bl/8PnkRawJ/D+VRuJ+CqwD4liwUaTI5iBz0uqM3BwVevw==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:50:46 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:50:46 +0000
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
Subject: [PATCH v2 4/7] net: phy: add helper for mapping RGMII link speed to
 clock rate
Thread-Topic: [PATCH v2 4/7] net: phy: add helper for mapping RGMII link speed
 to clock rate
Thread-Index: AdrxtrnuvZ0fK2vxTE+ePeStPoNIVA==
Date: Sun, 18 Aug 2024 21:50:46 +0000
Message-ID:
 <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: 43ef6c50-52ec-486f-5685-08dcbfcfd11f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?N0UMW6KWNyfrNo9lhb3klqJAMOwBnKTNKddbftNb0S2Gh3rrNelzUntAk/7f?=
 =?us-ascii?Q?1BI2w3I0ecJ039DeDeuUE6OgwUGsQzJZY66qKjIc/bTm9H6cjBM6ZWSUuDdB?=
 =?us-ascii?Q?0/YGF+DNp3UkBg/huGkoi0eTJO/G3LNYWGY+Nm9zRIwmNoymhy+TnitzbAsh?=
 =?us-ascii?Q?A6z2/nBevzdbxTQ0c9EKbe5fxeSu1iE2KCpNKVfnrVYdE2RNng3eGv+xlflh?=
 =?us-ascii?Q?ovi4k/ejLOXJ3yUpZXzdgzxP6hu7QtlaLRjRx3nwAX+3wFbR6Z/wg4dAo7rk?=
 =?us-ascii?Q?CHewYzsvJn7cIbtQgv1OZXkjsNfjpIay44CklO3qyPrLl6f13Jbmt6YQTjgv?=
 =?us-ascii?Q?QdBy4EC+uMbQQUO0UiEmkVr35XwCLH99ZDF1wNVQCjxeMvsr/ZdhVyLEFjme?=
 =?us-ascii?Q?YHsFyjoWia15BkAsP1KAkQdbCKf0cCI+sFqEjNbHw6qSjEcFe06YC44jCPXq?=
 =?us-ascii?Q?85F7XJtcpDtBMFvLe319jKXThQLQbG4eqWj0HLIZfv9QHWlutBem+1pg2mzU?=
 =?us-ascii?Q?50bvpbTST7LTxitflY3hY41GbP6GTKQeQoJ0UUIe/3OMECcc2z75h5vhocyU?=
 =?us-ascii?Q?eEhnEtM0lFoR01+l/DioKnuC0mUCoIqXksAlJJZW56277zyvak+HOi5oR4dT?=
 =?us-ascii?Q?gm6yczxa67g26S1bRAmA42lXXUVl0K/Fne/7IyCQIqfLo0rONlhh9rl480KF?=
 =?us-ascii?Q?syNXweW10WOibiICex/uvwWnk7PpmV4j5FgKhBgOxtz0XZKquAfHNVLIL/0I?=
 =?us-ascii?Q?vhXuDbayyFn4jkldM86arMNMU7vosTrdd05ehN4xE7H5AyHUrZ84fy8s9Dmc?=
 =?us-ascii?Q?OCbRQ0SVpJIPastMhKNpfzMjg79d85Jr9bm40jDmWLK4fsK5shbmxZ8UCfBS?=
 =?us-ascii?Q?SgjnuEQnC/7IGpuQpM5zyWUTy2YZdnqte02zdPp8EqdiS/FrVNONiCQb9l+y?=
 =?us-ascii?Q?fkDTUuO2pFBoeErT8gwAxCbZqhe4f8Hrz47q9zNejRcUnjZGEaE8gj63dRlV?=
 =?us-ascii?Q?F9NQMImlq/A+jcErphJ1hYiRjHO3nwIhjR2RRDvpi74CI8/kgLNvFooWJwpA?=
 =?us-ascii?Q?FEqcp3sTsoXhFd62Gd4Newb2MfGWstNvmJfLeR6X1euIQidYjCUFkZH8fSqm?=
 =?us-ascii?Q?JeUovfktb1zkfYCqu1ZIR7AsZ0dsaQnVfscD24b9U6PirMHWmBc0zAcnl+b9?=
 =?us-ascii?Q?gGTOoQWO4q9m5xN5rgdas64vSgIbiSMcGpl1Cu8hh/t9UPvm+bg+LjxVckcl?=
 =?us-ascii?Q?An8vRZiSci1lmmK2y7S8JNVIRK2gq2nd6LNDMgexrb6LpqsY5hLFEiTFjByJ?=
 =?us-ascii?Q?sq2xSnPHF/uAUomxr7N0Esuu+GKqkaLeAbuNlzB4Ug7o53njAwpeZfph/93l?=
 =?us-ascii?Q?zPty0BiaWP/vsbwmrGC5N1T4ukneTk9RW8Ych7hJMg41idhELp6q9qJxL5Lh?=
 =?us-ascii?Q?GKZy4viRDZY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?54r+n8AWobCR+WLHZTmEVnPjPxetnWicclmcnYcvmB3LGl7Hjr8XgfSrYxqx?=
 =?us-ascii?Q?srdI1y+b4+zTAEhWTV7kcXN7/NAfDIRLDdvHm0OS82stAxhbzufv9eYftJNu?=
 =?us-ascii?Q?aWeOiDi9CXIyWvoCFWymRTAqr0u5QCVQodC6jLX6io2zb1jzEFwjw91KOvId?=
 =?us-ascii?Q?fw98EEQSjzm0jlLZBgujA9qOK11Jbjq8qrMf6fa6XFOpSBEQnMFenhajljkg?=
 =?us-ascii?Q?qapa+lldVCDK8NXpS4lXHoJjtYPxzXkFldnqhAgr7ebI44bnacFoNR+v1+C2?=
 =?us-ascii?Q?vM0YmA2ukUr4uwBY9WWXOJEPatMo84rtCd8DzBhnqcv5fgdrVmH/pVRjZi9o?=
 =?us-ascii?Q?/JDuexq0xQAEwRK7huURMJpTYWMt+XxbBjfIBQwm9Ar5j0qw4nxblU1Ckkuu?=
 =?us-ascii?Q?Mciljh1n9DKO0eCRjoHi3lXpdInLuU0356JgppdzUORhWMD8Sj9BQKPbP5+d?=
 =?us-ascii?Q?CGTPo+e/5RF+01DmqQ/Q/0iSs5V96ctOfReM9KKjCPNwGDSOMF8ZDjHCVg8A?=
 =?us-ascii?Q?NsRrvGbepFJnKjiqbRRzcRyCPaSDkRdEOlzj/MfD0ZcjOxpwjX/wGvZD0/yB?=
 =?us-ascii?Q?XGyGYeh7f1id5v3UiIxgVDyaQZ9ElfkAZAGCSZvF9eGiM+ro2SB1GSoz6dpK?=
 =?us-ascii?Q?UA5DjeULGh1Ns/iV0UIePB4B4LbLf6zEzscVvFmOtgDQkXH5U0ZukoTOdp+1?=
 =?us-ascii?Q?WhieFEiQ362z7gTiU5ny7gJl1or/S9PzC0tpCaMgONjtSPZ98wGFfg8PViqV?=
 =?us-ascii?Q?7HCj4jdNESpqDkeGr+yH1uJdz6sfBDcCMmjbv+dUo5JaiwUN45ahPKkRuBQo?=
 =?us-ascii?Q?peexALyYwenlYq1ef+smEGIUndQBrf2fPvDKJAe7+mcCGWR7IG72Mac3Nig8?=
 =?us-ascii?Q?BgoaFpNmBnCMhXibVb9VlpSz8NeoUIVUUF0KyAVfO2FJDEWfHRdZVXXUyNwd?=
 =?us-ascii?Q?ecfumAG6YdCORjVwrVJi4VruJZ/xbBlRGTrWMuZR2odzMLgbYEu0bz6zf0OX?=
 =?us-ascii?Q?l3bqDB00pqRfI6BHHLoprl8ym6uoCXDQQHjHgA4FARasv2/asMbhyJsjqtMA?=
 =?us-ascii?Q?Q1D7S/q185E/EXpx56FRtrt/Ud578RVzbSpTNzXHdTYNTsatGt1OM5cmz0OR?=
 =?us-ascii?Q?CYfGDjEDJ4KckgGecmbUOIxorH71n28G2+UvsgSp7R8sG/9I1dYkmVqA8dUO?=
 =?us-ascii?Q?uPrC4ioegof1J0dqIEJSpPM7/KuXMrqCAeRdE4shUM83Lz6jh/JJGGtAVd95?=
 =?us-ascii?Q?AHFtzoTO3iIjhlDML9pkJ3YIYWLFf71bqsJBm+gRtRl0BlMMkhDqHYQ1qi6S?=
 =?us-ascii?Q?m+0CQLQUL7khu9UlD8zshMnW4DUY7bnnjHtTwt5UUNWMQsDjnM1AicjBGwXr?=
 =?us-ascii?Q?WWuBg35fP1Y5597P64OnBw4JDi7KP43hQ0/TEE5Ftf47yVJDYRucXlxLSdTe?=
 =?us-ascii?Q?2F17EjyzhSxA7CZ1ls+QBqTcobmwpG334Z45dMxUOojQrLPTKYus2tKiBirA?=
 =?us-ascii?Q?0Qd9VcpPmEOXtO0VuRZYmemC9MjyFQbHsRU6V0Zo5498q56Sj+T6Oxfv4lCD?=
 =?us-ascii?Q?EcjeXwG9wH4/8Y1F+fttdnBgrLaVmsaCUfjNLK4B?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ef6c50-52ec-486f-5685-08dcbfcfd11f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:50:46.7086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dYnMJQKRu2R9yba/XVzKGbWBgtGQpkxcjMXj3M1vebvWNNW+eCLJj+KOtO/drU/XWoIMnDowEdeBeb9zd9+L0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

The helper rgmii_clock() implemented Russel's hint during stmmac
glue driver review:

---
We seem to have multiple cases of very similar logic in lots of stmmac
platform drivers, and I think it's about time we said no more to this.
So, what I think we should do is as follows:

add the following helper - either in stmmac, or more generically
(phylib? - in which case its name will need changing.)

static long stmmac_get_rgmii_clock(int speed)
{
	switch (speed) {
	case SPEED_10:
		return 2500000;

	case SPEED_100:
		return 25000000;

	case SPEED_1000:
		return 125000000;

	default:
		return -ENVAL;
	}
}

Then, this can become:

	long tx_clk_rate;

	...

	tx_clk_rate =3D stmmac_get_rgmii_clock(speed);
	if (tx_clk_rate < 0) {
		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
		return;
	}

	ret =3D clk_set_rate(gmac->tx_clk, tx_clk_rate);
---

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 include/linux/phy.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 6b7d40d49129..bb797364d91c 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -298,6 +298,27 @@ static inline const char *phy_modes(phy_interface_t in=
terface)
 	}
 }
=20
+/**
+ * rgmi_clock - map link speed to the clock rate
+ * @speed: link speed value
+ *
+ * Description: maps RGMII supported link speeds
+ * into the clock rates.
+ */
+static inline long rgmii_clock(int speed)
+{
+	switch (speed) {
+	case SPEED_10:
+		return 2500000;
+	case SPEED_100:
+		return 25000000;
+	case SPEED_1000:
+		return 125000000;
+	default:
+		return -EINVAL;
+	}
+}
+
 #define PHY_INIT_TIMEOUT	100000
 #define PHY_FORCE_TIMEOUT	10
=20
--=20
2.46.0


