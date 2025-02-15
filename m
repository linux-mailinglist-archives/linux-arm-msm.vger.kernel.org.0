Return-Path: <linux-arm-msm+bounces-48112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DAA36EB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 15:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED523B0868
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625C31A5B84;
	Sat, 15 Feb 2025 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=liebherr.com header.i=@liebherr.com header.b="gC2Fafqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-00701402.pphosted.com (mx08-00701402.pphosted.com [143.55.150.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9FD13DDAE;
	Sat, 15 Feb 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=143.55.150.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739629082; cv=fail; b=UO4RPW59CboZpR0m+2np4Q6F/UPohksw6dpLILR5wkh8Oi5GoIG3BRjxvZ7dvsPB6K3wxkCxOGafJqIyE3I2MnC2C6dAIGIx4p1GCJ4VkpxSakmxnDzJuwBbvGhUJLkEOF8m2BcSXUBYKHGKRbVHOqFc9FjRYK+4FWbFQDjzeY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739629082; c=relaxed/simple;
	bh=OtInwFM/k7jWWPcWX/X7c5BA7YgMbXc5m98/+syPpJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KjTtjYH4Zlk+i3mfi1bYY5KEAdXzaW0ZW7nvn9uRssutfsriuBxcADYr6Rbzyqd/shr8U59sbqz/usSRA/RJxrf3e+ibgUNwGMqLQpBKsfpMeJj+MuoASShcAfpxYcrSAfe7yMJjhuuZXNqHuyNI34aVg66rYccc8Ijvas3bLXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=liebherr.com; spf=pass smtp.mailfrom=liebherr.com; dkim=pass (1024-bit key) header.d=liebherr.com header.i=@liebherr.com header.b=gC2Fafqt; arc=fail smtp.client-ip=143.55.150.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=liebherr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=liebherr.com
Received: from pps.filterd (m0408744.ppops.net [127.0.0.1])
	by mx08-00701402.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FAj3Kv011767;
	Sat, 15 Feb 2025 12:31:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=liebherr.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=key1; bh=L9AXA
	xZOK1ybDiFwHfEP6NHaFTCMvu6xDFr0oQ9/ceA=; b=gC2FafqtYCoRNQuoTOwTG
	MyyrucWxo6gHbjlUt4VklN89n622EWKM5i9tD4p8hamsGBLsiSFhsZq9ALuc4vPr
	yytXFyKx5tSnz6hhmTAgSM/ByWIpv2x6HBQqLptWHPcm/3DVTk6Ds2g0BNUK7sMX
	6hKoxT2SwMaXvCntcYvmPo=
Received: from eur02-db5-obe.outbound.protection.outlook.com (mail-db5eur02lp2112.outbound.protection.outlook.com [104.47.11.112])
	by mx08-00701402.pphosted.com (PPS) with ESMTPS id 44ts8g015d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 12:31:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RV5qUG3ClMQ1JddEGP+9l0xsGlJZtRKvrxh6EqHx4MIh6KzBLWT4ZMfDZtp3bDCcbj7wPApMSollmM3OaJOWZFPQPbuPuPU7HlEs9nvrQ8JkyvfEVe/KuSk15oT/Tv+obmljhpKqSl8XoK3wb5BsXeHbmRQA6lQC/qs9a8/raDae8JS9fUxzCSmg8epN4v9XBYpL7hnxudwJ8LHBvI0SrtiVmVyolWs15s3GjF1qxwxlCbwrcBiJhunW6UTm1vxnDo2MaUTYD4QTFbWOgFgPG9H3rEgkMz+XeusHnKy6iCiH7/7GH8RxxYB9Y1S5wz4Udjb+ouzxwccKyROmuYdqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9AXAxZOK1ybDiFwHfEP6NHaFTCMvu6xDFr0oQ9/ceA=;
 b=YOandVRmdSS2ZTGHDvxmLiAIjyyd1xIAZkWlIMWWnMwN1VWH4UbyIepECyxR1p8+wpqyQ9gcPNYncxzLgapKAc9QOFnd4g+mDAxsLGb/9qsucmNsilO9JT7JRLMF8hcTExGgfNME3cwvLb7ocnRfxbLmmeGZRjoH9JD+HmczU4zo2OW9+sS6nJgDM+cYLz3dDhz6hFWzarWypho68+pt1bfvZK1N41yV+2EK3R8Fo5tpLvQNSvKENQd92TLj33hf36eKOLnwrXXlpHq/qYV7ZWzvo8w/m+elcJ7r5gA4VCNiy6gabtjoHSlOYgAZgObm92KdvGjTlPfhVtSb1ggsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=liebherr.com; dmarc=pass action=none header.from=liebherr.com;
 dkim=pass header.d=liebherr.com; arc=none
Received: from DB8P192MB0838.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:148::24)
 by PR3P192MB0715.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:41::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Sat, 15 Feb
 2025 11:31:29 +0000
Received: from DB8P192MB0838.EURP192.PROD.OUTLOOK.COM
 ([fe80::5952:3024:60c4:b090]) by DB8P192MB0838.EURP192.PROD.OUTLOOK.COM
 ([fe80::5952:3024:60c4:b090%5]) with mapi id 15.20.8445.016; Sat, 15 Feb 2025
 11:31:29 +0000
From: "Fedrau Dimitri (LED)" <Dimitri.Fedrau@liebherr.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        "davem@davemloft.net"
	<davem@davemloft.net>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
        Andrew Lunn
	<andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Russell King
	<linux@armlinux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Herve Codina <herve.codina@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        =?iso-8859-1?Q?K=F6ry_Maincent?= <kory.maincent@bootlin.com>,
        =?iso-8859-1?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
        Oleksij Rempel
	<o.rempel@pengutronix.de>,
        =?iso-8859-1?Q?Nicol=F2_Veronese?=
	<nicveronese@gmail.com>,
        Simon Horman <horms@kernel.org>,
        "mwojtas@chromium.org" <mwojtas@chromium.org>,
        Antoine Tenart
	<atenart@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Gantois
	<romain.gantois@bootlin.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Sean
 Anderson <seanga2@gmail.com>,
        "dima.fedrau@gmail.com" <dima.fedrau@gmail.com>
Subject: AW: [PATCH net-next v4 04/15] net: phy: dp83822: Add support for
 phy_port representation
Thread-Topic: [PATCH net-next v4 04/15] net: phy: dp83822: Add support for
 phy_port representation
Thread-Index: AQHbfgBURKBndR7rdkWvdPBEKVm8oLNIN45w
Date: Sat, 15 Feb 2025 11:31:28 +0000
Message-ID:
 <DB8P192MB08386B9F0FB342EB7B0FA785F3F92@DB8P192MB0838.EURP192.PROD.OUTLOOK.COM>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-5-maxime.chevallier@bootlin.com>
In-Reply-To: <20250213101606.1154014-5-maxime.chevallier@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8P192MB0838:EE_|PR3P192MB0715:EE_
x-ms-office365-filtering-correlation-id: 2e8a7833-5029-427a-b714-08dd4db44a24
x-pp-secret: l9btit3ms7a.tlaangawwjp1g9smhjqpmsmlcnax
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uwlBx+NMhSwPED7QGWX9kW3RowbNUZDWgvEnfQ/ulDon1S5wyHQb2J2BYE?=
 =?iso-8859-1?Q?vEiizIPj1mKZmpnqCbHJuCjvzpM2zfjbYNvwKnmfuzXBb9XKOe7TtdpP7B?=
 =?iso-8859-1?Q?gBVIZo+nvoZsckn7Pfu/ozaQtE0tP4xtY+a4EjcobVZqca1FACADfW601K?=
 =?iso-8859-1?Q?wdW2LR5JLeizb1wHICwMaH0uERbpRxFh2k3ZCqpCf3cs7KtJbXv/47ba5o?=
 =?iso-8859-1?Q?9xg7FaZywQtcGgt2YIj0Qyg63afxd9P5qVeNV/0LrgTvbdIO6wB4hEf/WJ?=
 =?iso-8859-1?Q?oWpbG0pPm3uYufHGEWTGusFZZFcnM7IaF0D2zHgm1s5pvv0BhKeHKRFezG?=
 =?iso-8859-1?Q?lgLlB721ob6UOIKLw9Hvy6mS5dgEIkSNmrgrlFE5B61ZCtuxFDaKLZBVtk?=
 =?iso-8859-1?Q?F4im0VMKr0yKeUWp99QoKdD7fiHq63+5dhh5HA9vJIrTqZZ/k+4Ni49wGo?=
 =?iso-8859-1?Q?fIDCaVawSkyV/113VkyDNgRkAaNDkUKWr5CemTpPrxz2dImCX8SLTGQmA3?=
 =?iso-8859-1?Q?TQpcNvx3tO1s0nCi7BlEjZgqVtWOMP37P0diyGAda0ThdS4bB2rqk0F9zR?=
 =?iso-8859-1?Q?8YyfLgu0ipbVuxBnCX7enmD7FjGMKJWwdeIJkOMxlGDmiS1ubvlagCgdK3?=
 =?iso-8859-1?Q?NJxGJuMr87CnoJC/fypEu69UFPOHBwMQO4stnyQE6F7TM5tyZnyoXB/jNq?=
 =?iso-8859-1?Q?u3Z/6k9wbH1PsI3KUhP82BFlgNXZbzTaQ3AKJlBz41e3jSCeZmW4dc3LTf?=
 =?iso-8859-1?Q?FCngQ9RDZq4MAQAM7S0PpGStir4d65o1GqYJ/CHvdb1OQnBpWr3GQkzfPZ?=
 =?iso-8859-1?Q?43JwB6wz0F+yBwql2bxDQcub18IOaqrq9hQqrVB6xCqTM0nElhKEjGY55A?=
 =?iso-8859-1?Q?2uN4xHJTMvxvHsgtxhT6x9gaoIchJSGXSrk9o3Xe1eYcxp+oMJKiZMcyRD?=
 =?iso-8859-1?Q?XHFk4YNTOLa5MHkUn8MtNrM0INRP6QHAN7V9uH968bgbokrzqgt3iDauNe?=
 =?iso-8859-1?Q?s2lvy7Zr42OLxD7gzfd+9oKiCGpVxF6oDOTY8OhksnR2j/Om14cZDbdOJo?=
 =?iso-8859-1?Q?ZaNHREwxMCWZSGD9NduXFAlFTD7FC3tqJ1CRa2eBI7+Y1jCDzVBMvsY2Ba?=
 =?iso-8859-1?Q?I8PZirji3QrZKVZz+NoWrVTUJadKfnJ6YRsypWebhpmjtjT0lOkfysO8r6?=
 =?iso-8859-1?Q?YZ6JVbapYD9F1/ZBfwrzHMmkkIxHzOvuR/3JLIp67uK1hz49V5s9RR+Goo?=
 =?iso-8859-1?Q?50Qu7Hn8qU8r/NU9/NATlxqyzE/tGc+svKrj6crIZS/Jn7Fv7ES9m0Vdz9?=
 =?iso-8859-1?Q?23rlwQd4LhWxmnwqhi93HJ9LOz/gLCRN5zaJ1fXyzaN4mqTkmbSdoXtfgw?=
 =?iso-8859-1?Q?EOflDTqikzxOQD7FREbnbUXL4gQ8LiIGLCO9N2fEfpvsw4OfhivBoTIbEH?=
 =?iso-8859-1?Q?+9TIn5wVEwAZFYhZzPl9ONcIdrLNQj0HlOtPq8omRiIzkZc7DbURJvSSVl?=
 =?iso-8859-1?Q?/bJ1zXOBACUQdcX6cbI4qZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P192MB0838.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3ftY0xkQsaORUXPz/gcQ0AZfS6FnVB5t2J0eelHeUKwK05yfnEAhtECgMd?=
 =?iso-8859-1?Q?gHpbpver81jmS1Aza/eyjfbqA2/zmq4MwSSDEwMo1gefFAvbRMmefyjiSU?=
 =?iso-8859-1?Q?zaoJlK1hyg/RAAviLKZyRhz+IPxzdGbkIGUostMCEqIblDb+iHG//5ffHB?=
 =?iso-8859-1?Q?eEm4UdWSrlDko8/fwhu5jPJSejhldDGyw8QiHG2fvBCiqggtnMtGmpObxS?=
 =?iso-8859-1?Q?py+ElXqn0v2nsv/06Pza5iq7BR51v9cf22APohy5QuMWEsbvlc+2SIyZQ4?=
 =?iso-8859-1?Q?OK9cWy71JaUMX2OumqVjlGB3fOajnRHI3jP8S+Yg0AZ/5SATEMBx8IFcvp?=
 =?iso-8859-1?Q?URn6/oerRa4SupDvgzI+/6bZgHDRFqfbXw89EpVnafWGSAeEu6yEvAdGaW?=
 =?iso-8859-1?Q?+REg5TnVLB+iBMYiWLgvgmK07Hn4SpGgC4p6PB7QdGr+2nb1yUrTe0DLz7?=
 =?iso-8859-1?Q?QRYEn3ddyB4KEnJmFnbb1Cul4gUuLXVU1N1XwYx4C33207lk5zSybCDBg8?=
 =?iso-8859-1?Q?453XaK6ik23uTrY16LPpZ641Lbe4mJCux05DO2Hoy3iC4PLyohCfFE9z7a?=
 =?iso-8859-1?Q?wTFkYgRWJX+J1zfxIgc/TKaxOld136FNCdNSrr/sV1o+bmBDsT2lnYhDeL?=
 =?iso-8859-1?Q?DHyuq/FZM3Qvb6SBIPi2d8yV2eyEzqJ9uDWMsL9cTPMcZ3+fehw859tv6Z?=
 =?iso-8859-1?Q?fho8nfwdWFL4RTs9xY3lsELirS9O/VoQcNqQBVnYq3IYRWYew/U6wpabVT?=
 =?iso-8859-1?Q?7Dpz2628pYpygK/ByIE75dZMvlhVZcnQQE6RVH63W2nLi+9UNkfsktL9DI?=
 =?iso-8859-1?Q?ZGNH/eSjlbiqR4qhB3dMkSt082HbmbB155NLVWbM3TYSRQ31gf/fjHIwij?=
 =?iso-8859-1?Q?aKA4p6ddAz0IsJNXvu+2tgLj9owQ6+uxr0Gb2v8gLqM/LwCk4A5ghqHyPS?=
 =?iso-8859-1?Q?X761+IeXObgTRKTcTojS7l1Km7InGp0LAMsw4vOTd49cCyEsI2Ny1azjqw?=
 =?iso-8859-1?Q?hrAkAnFe18e2rCVbnVWciAKQ/Emczzz4fedRam5XL7Hhi6ebW3ZUo+KX6L?=
 =?iso-8859-1?Q?a7udpAXNl44Ee3ZKEIUZPx4soBNPWGLiCR/PYTizF63lUfZGcPm9W9gC0A?=
 =?iso-8859-1?Q?UQglslU6iehdj7vAfVRkt89dgC0WiOo60ySvUFKZ1OYDsojbb/wzsmyqw0?=
 =?iso-8859-1?Q?iCnuKwJeNUllcuZX7mL8h4NABzbwDDbkCOk/5wa+T7fqrW6ViS02w4o3NC?=
 =?iso-8859-1?Q?vXO2xrcEumTD5orOahPQcNSI1RRX8cnoGwjyCnCo235sha62oQKUqzdDDw?=
 =?iso-8859-1?Q?DWXG5bZcGC2hpsB0lBVDlhnUXwrmhHKn/dmPNuExJ5SGz8wf/ffUkbwv/Q?=
 =?iso-8859-1?Q?JkdRq2cx6vs73elTPawPltFC1Wu9P216JSM3Kcxw/S+94uHD8X98oeR98H?=
 =?iso-8859-1?Q?5TEywua+uNHTgs4GPr67MIB0YjneSMR7JmBcA3ztWXhG4x/baltuGY1A7T?=
 =?iso-8859-1?Q?mROdgArn2jjLEJ0t6oJrOf8HZUvb/Q6hIsjK2HeGDMEpboznhOwaGE2R/x?=
 =?iso-8859-1?Q?lBm4ZvsaGA4sFr//Cd+a1OXQ8mnK9HdvpiYVGzqcp1O8qOLwoNOCmruNZZ?=
 =?iso-8859-1?Q?1LNjMenUXstw494QY8FwQYqMRTroc7qVez/9GpXIcBz2MbbVYs4XwDdQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6XjSJXRSYkE2tlyN0KOPR6I/FMIJFPM3qb5BphlRr04B58YVp7PRyrseF+dzDDdTsLRfCUs17Z7Xyg/v7QUWAkQJPHpsN8I3wHM6pxkTbTgvVoOUKzrSG5g3BiQTFWLpFBWqQk4LHMYSp6fC3qFsbse+xW/JYZ36GrhgmT3+LBcfudVXXwSb+91waT29cytrL7kWuWuId9gLT5JmSOPvoD/gJ/hOa3I7huOpS4ERMiBlY1ecndBV5KJ6tebpTLixMFhcSjIaJEKGZSRDpWH1cA1730QvXhPKc4vhb716xt70YQrRS2SbkWaRCQSC8b0bYPRPxypj7+C7KqjLxyJuj0cGxpEZ/AHJm7Bw8NI3LWZHfXj1tkNz0HSoSo0/tINUvGzXEJ+nM2KQkwL+gVyjMmW4h6LpOAJTfEndLhn54lTGLR7wtD4lAnbPxjmr2LvFH34JU3KQxjOrr3LurQhW9tFDax24gSHfBv+shMyQvDOOLQx/PxLt+humALFL4x/v4nWB5C1EFktrykTYXoz0R/bD7zQndTyR+0c5AHYVXhg3D3MrCcWH12wkQE6uPxGTKxT8Xb5oyNB+ytcLCpz35SahFBXHc7vKrWdTmuS44DuYA4ktE4YcAWXVJ2dJ6gWwqCeleu2h73ZHlYEUzGXKiA==
X-OriginatorOrg: liebherr.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P192MB0838.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8a7833-5029-427a-b714-08dd4db44a24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 11:31:28.9746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3336d6b0-b132-47ee-a49b-3ab470a5336e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsgKXQdqKRiomcM/HF0Uzj2jF3rN0cptX9D6p7Vv7xvrwJCbEtoCoQA7ic+9SwDmjWMMc0Pjpk16Bd7r+d3ykcQUGOZjp2KKDCgPp/8GQqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0715
X-Proofpoint-GUID: RC4qKJz_h63CJq-LSudNXfCTaMSLkIi1
X-Proofpoint-ORIG-GUID: RC4qKJz_h63CJq-LSudNXfCTaMSLkIi1
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1011 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2501170000 definitions=main-2502150102

Hi Maxime,

> -----Urspr=FCngliche Nachricht-----
> Von: Maxime Chevallier <maxime.chevallier@bootlin.com>=20
> Gesendet: Donnerstag, 13. Februar 2025 11:16
>
[...]
> =20
> @@ -781,17 +782,6 @@ static int dp83822_of_init(struct phy_device *phydev=
)
>  	struct device *dev =3D &phydev->mdio.dev;
>  	const char *of_val;
> =20
> -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> -	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
> -	 * is strapped otherwise signal detection is disabled for the PHY.
> -	 */
Does it make sense to keep the comment ?

> -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> -		dp83822->fx_signal_det_low =3D device_property_present(dev,
> -								     "ti,link-loss-low");
> -	if (!dp83822->fx_enabled)
> -		dp83822->fx_enabled =3D device_property_present(dev,
> -							      "ti,fiber-mode");
> -
>  	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
>  		if (strcmp(of_val, "mac-if") =3D=3D 0) {
>  			dp83822->gpio2_clk_out =3D DP83822_CLK_SRC_MAC_IF;
> @@ -884,6 +874,43 @@ static int dp83822_read_straps(struct phy_device *ph=
ydev)
>  	return 0;
>  }
> =20
> +static int dp83822_attach_port(struct phy_device *phydev, struct phy_por=
t *port)
> +{
> +	struct dp83822_private *dp83822 =3D phydev->priv;
> +	int ret;
> +
> +	if (port->mediums) {
> +		if (phy_port_is_fiber(port) ||
> +		    port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX))
> +			dp83822->fx_enabled =3D true;
> +	} else {
> +		ret =3D dp83822_read_straps(phydev);
> +		if (ret)
> +			return ret;
> +
> +#ifdef CONFIG_OF_MDIO
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =3D
> +				device_property_present(dev, "ti,link-loss-low");
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =3D
> +				device_property_present(dev, "ti,fiber-mode");
> +#endif

I think this is to make it backwards compatible to the dp83822 bindings,
is it worth mentioning this in a comment ?

> +
> +		if (dp83822->fx_enabled) {
> +			port->lanes =3D 1;
> +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
> +					BIT(ETHTOOL_LINK_MEDIUM_BASEX);
> +		} else {
> +			/* This PHY can only to 100BaseTX max, so on 2 lanes */
> +			port->lanes =3D 2;
> +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int dp8382x_probe(struct phy_device *phydev)
>  {
>  	struct dp83822_private *dp83822;
> @@ -900,25 +927,13 @@ static int dp8382x_probe(struct phy_device *phydev)
> =20
>  static int dp83822_probe(struct phy_device *phydev)
>  {
> -	struct dp83822_private *dp83822;
>  	int ret;
> =20
>  	ret =3D dp8382x_probe(phydev);
>  	if (ret)
>  		return ret;
> =20
> -	dp83822 =3D phydev->priv;
> -
> -	ret =3D dp83822_read_straps(phydev);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D dp83822_of_init(phydev);
> -	if (ret)
> -		return ret;
> -
> -	if (dp83822->fx_enabled)
> -		phydev->port =3D PORT_FIBRE;
> +	dp83822_of_init(phydev);

Keep the check of the return value.

> =20
>  	return 0;
>  }
> @@ -1104,6 +1119,7 @@ static int dp83822_led_hw_control_get(struct phy_de=
vice *phydev, u8 index,
>  		.led_hw_is_supported =3D dp83822_led_hw_is_supported,	\
>  		.led_hw_control_set =3D dp83822_led_hw_control_set,	\
>  		.led_hw_control_get =3D dp83822_led_hw_control_get,	\
> +		.attach_port =3D dp83822_attach_port		\
>  	}
> =20
>  #define DP83825_PHY_DRIVER(_id, _name)				\
> --=20
> 2.48.1

Best regards,
Dimitri Fedrau

