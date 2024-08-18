Return-Path: <linux-arm-msm+bounces-28917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3547955F87
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702411F21F8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BE8155C97;
	Sun, 18 Aug 2024 21:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q5ZjGJ0f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A219155741;
	Sun, 18 Aug 2024 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017979; cv=fail; b=SA/3sx39158yNXHdHbDI9AZrdggUb5DA2zIWdbLVTEbj6+YxoXnZ4SuaCT1Q2SS/hwqFfDySCqdsalY1gau872FqrefomCE3aeIk3bMn3szE2prazibzeRb84QcxgX0uw9kK93VqPXwcL2MvGcc2RlG+dyNCHygxA0bzKriGHWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017979; c=relaxed/simple;
	bh=J2/b6M2wIRbl0bTlXhn5Uu9a7DjjemTTeRo9tdedMBs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TULRvyshv9ZEC9trrhwiOfrG3jvyRZCPBRnkb3o0vjR1LFwugz8IKdNdVBca/XoW3UIAyFq7h9+yZcoB4TRYqKAL53nMZRoDUMzeejmEOGPhTAZFd8i++RvxI5TMqZ8H0yfKgHrgjHOUlTUCIPLzLVvF8hrshiNyvberwQVxs70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q5ZjGJ0f; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQQPOm6D+FbeDxfHcW0jjXeKtlmC9wQeOe7h7Ka/523ukgV4XL4bMtucFm9RFBCpqJ1rice9UCPSshvVcOLi2JQn+/ISptTA5tuoRxmmyf3qeOeI9pVPEcXosn7jFWO+SE6F+urlb0m8iIS77c5FSY09Ewg5e6wvb5hNt9NDQEjdjtAbjoKgGYFckkUB8Trj28Eh01lLzWksluyZ3Piol+So6Qy3bmZynL5aWX1ulYcpFLOIAkyjo49Tb2TjTNvIXZAe4DRlRwmj/R/qSBT8x4Mha4p/+pFC0vmE31c0gs8byjPcc1cMpccslCbZDrpM9lZ7YLqLn75LuS7ePNkQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrgaenJF3Vak4aJ1hkHd01mPCEuY/EYO0gYmy0g+HI0=;
 b=X7SMj6CjJbW2jyKPDFu5Oiov2XFxBBNxUpeWOD7xQL5hrD+JicxrM3nIru4sjKlUHyuwfnRKYvnIkEQ7arRUvvWQRMC8iFyLdHfiDzxsdkMWtA+onj1Gt+ibji9+NpeCS7smcbP10bxHTNPfj8gt6pVqKTIvM/5YMxGjwu4tcahgo73fofodLxoeUjLUITr8aOEVa4ZXYD219Gyut6+rduFfLDBw/AauPi+oRn7u1S+mNT8snBKh/oGXIecfy3JE7Rq1Vksnl1Jr0GPWRlSyKKn2Eceqh6iopSDu6Jt/s6NbZbOUgKPFNgm0eM/ZeWmylAoMb7Mit3VtOvev+/h1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrgaenJF3Vak4aJ1hkHd01mPCEuY/EYO0gYmy0g+HI0=;
 b=q5ZjGJ0fBZEpWW3GVoGJTqwPYIrwrQDpVHQo3yRo3KNqIO1nF2dDdFskYFVlAtEYT4R9gYyIJVx9yBinX18KCCBfoYiwZwcpaL0ZWdACmkPCeGOKQnz6jbhw1h9AVrCJTtSCvLHfHoNkpa4Cnp5D7C0H2h+38vD3zM0cqvyLb2PPtsZt6Lf4Pu9t348eDjX7ZQu10XMOn28J6IjrvG7CMqGYrRoF39idGOQTkDTnY15n4xJDrF+Ac6eULdMd9C0L4A8m19tDzl718jRz7qioL0NPvMgMF37IzpReTuL9cbZ5VnwUtS6loe05xDGfLdnH1z0vaeXIphGD3xkGeG9+6Q==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS5PR04MB9856.eurprd04.prod.outlook.com (2603:10a6:20b:678::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sun, 18 Aug
 2024 21:52:53 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:52:53 +0000
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
Subject: [PATCH v2 7/7] net: stmmac: dwmac-s32cc: Read PTP clock rate when
 ready
Thread-Topic: [PATCH v2 7/7] net: stmmac: dwmac-s32cc: Read PTP clock rate
 when ready
Thread-Index: Adrxt+I1bcYKj11CSHK5cfqUXnIxlw==
Date: Sun, 18 Aug 2024 21:52:53 +0000
Message-ID:
 <AM9PR04MB850617C07DDFFEA551622F58E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS5PR04MB9856:EE_
x-ms-office365-filtering-correlation-id: 143b2633-3059-4e06-e238-08dcbfd01cbb
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?62f6pI54jnimIx0+UtnIM34bn+/5NeUE+3jXm/aBat4j4ZJJfEUwox6Ecvev?=
 =?us-ascii?Q?npIbt47jCoH5PRbMDuTEN1qzQHcwPkYD8YqQyzS+/pukDhWKFBeq0CUr/UL5?=
 =?us-ascii?Q?E6lYAii84hbqFXzbatPqHdafpAlfzJfcyxLQ6Wug1qPLJTZf7diFlUU+ssti?=
 =?us-ascii?Q?kcgMrl9kcuzB0qgYpSkn1k+v0R9/ejM2nArQw+pXpW8l11Zk7xXB3BUv/34x?=
 =?us-ascii?Q?rqPXITJvp6g9/hKJOLoxWO55LOyLQ0hvQQc8PCDPfXw5hHo+qcWLWUzlniLc?=
 =?us-ascii?Q?YFYgsHsMNjbXGIqKfN18oeh6Vtri7+HxxNoTEm6rskCe8z4NBuRNWEL1WaT2?=
 =?us-ascii?Q?assqhiIV0TrUcaxwJZdUkMzrWytcULeNCzUZpJ/rK0bw9/oEPDAkoGXzASS8?=
 =?us-ascii?Q?qpgNKnLdlMlxlG/AnF8Qkwvre+98ZSkwYPzh9+zTi/+3FhZMFAwr2QM5O1Nz?=
 =?us-ascii?Q?oXLbMS3cI6mSPlaE9zi+CSvdH9qYM50bSL22+UdrYamWbfd2ghv54vpu7avW?=
 =?us-ascii?Q?bovR6Z4LovpKi1diYfwer9usY2dMrsgvpylulr0hxfTLGMpH8B541IJA92GP?=
 =?us-ascii?Q?20KtZwUFy9lb00n4N/Smg4PCVgvt4+W+ITHCq+En40B9Luv8nRBcY9QZJjQW?=
 =?us-ascii?Q?aFp7sPd6NRiVwJQqPnXXpMW6/V17KXohywbEkRR50rPso125UkduCoVXvue+?=
 =?us-ascii?Q?2oYcPuegbWfLsSHIDIbNwrjvTa5WINQXflL6pLzGhEpUE70jmrrxItUduyF8?=
 =?us-ascii?Q?jwtC3p8KYqXgsKa66/iO47Df4HpxImd3s4A+RZzmENVRNTSgwFyzy63jgML2?=
 =?us-ascii?Q?rPNnHBgq8RT94QJDgJycXJgN/CikWmuS2REPU0T0NHgum0uZGFon5fer3mf4?=
 =?us-ascii?Q?EndoY7cvpugI5BgeytZDouw8uIgICa8XaAg8stjr76CUGKYRa4zZwspA5fwk?=
 =?us-ascii?Q?lgpUv2LAKVwUl6CGoQRzTOJJ2ZCGvL/xgaqDI5q/I1SjjQRPrv7Xe5AJSLKN?=
 =?us-ascii?Q?LPYbk3itEpG5i6HxnojX0PMF6mEP2DHQQ9QWHFXr3aFqTQU1XNA4jzp7tLY2?=
 =?us-ascii?Q?GxBXxI4HUR3MsOC7nukqAaPEK61wvi28rCabcMww5+ZY2adAs8YsOXREid18?=
 =?us-ascii?Q?bC8rndThpwjPY0I+37ItpQR3P4XLm180MfGuehjPghGt3PlUqlRB6DjNzfyX?=
 =?us-ascii?Q?gBPRNjsF6O5kqIi9ymJzcAZcN09XGcskRKx08xNclExwGVa1dr8zQlBUsSWv?=
 =?us-ascii?Q?hASaRDVwsIdUEIFLsEVfbdpYE9j6z9QlZcuHlVtBThPOUomg6IzRa/OulMeP?=
 =?us-ascii?Q?yCR1UhpQttA1+LWShcIaD/C48XsDokWo1/SsQmuj/fNxeANTcamGwbFeT4b7?=
 =?us-ascii?Q?UXpgcOpY5wyvkMKAdDKrRA09XmiGeAi8uD0Xkml3sHjjV3AIoUiACbm4Xee9?=
 =?us-ascii?Q?MMWbhLxaFKo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?seufR7ruVI/5jIz30dwBZrSRQz1YxTz2LGDqPxtyUgisVsx0FIdT+kISjWl7?=
 =?us-ascii?Q?MB1G+OnSvLvABrkPomrSTfH/10HMoyQsZ/qACzHDzaXAyNH/G1OHMDRGQhKR?=
 =?us-ascii?Q?WpUGKIAYcheFamAXKY7/Uc7PYfU2evpvvk8nfVTGrnPzsI8J9vkJbij2c9Ku?=
 =?us-ascii?Q?5Rezkw0+jGokfKNrB5D5vlR8qENiVevUP4MMKWk8LvAoKR3D62ggKPa9zsTK?=
 =?us-ascii?Q?tDzSbjNfn7SPkaEyadtPk6D8KFdGjPPXAWy9QvaM1gvTiXpqncTdaT3UWwiV?=
 =?us-ascii?Q?sBIYMfqxvd3bm2VDcBiIxJR2Nd6CPF8ct0xEZwUo42m+Xm0P5iAOlb59sQC6?=
 =?us-ascii?Q?cewXABJs26tLSfWU19zr+SaNg7vhgTJzF2w3mGsxHUroI1AsybgnrH/OYenm?=
 =?us-ascii?Q?xgYx0/5L0skhpblX4hb3JPMmO8juhIb7NBObfQbJdWgSv+NYLSYMzS9Fw+Z6?=
 =?us-ascii?Q?6UWypkyKNeiRGxeEUqvDYu0aS/FjXrby41c02PwNr6POzkb/6L+G0xnW9ks8?=
 =?us-ascii?Q?hBF8lAx9wZh/aTGD0yoRZswOBn+MRcQ9QsCPEhxQVi2FSvHm8mZ4FjrEICSJ?=
 =?us-ascii?Q?omlGTsGk/ACdxYJtcjPCnxEEXEKUG08xnnln0awb6Di2oV+24+wJdPW3kcSf?=
 =?us-ascii?Q?In3ICjcxHDeYimdX2oPANi2L6PiLIoefOHXN08+VA4+f/99ej7j3UK5pweMd?=
 =?us-ascii?Q?/rRizwZLyX2Dh3qbsMIElgTWvdzC8ewk/qfCRB8EX+Pa50NAoq+HcyPgOiMW?=
 =?us-ascii?Q?1kPdk8lY5AoUgjq9xolySF7Y+eLc/uj8AZsoFNexFaimUdxq72ZxigA0Qw19?=
 =?us-ascii?Q?LNk/iFgkVASElEHpu1lZs3C2sBVrcVppoO0zpbhOcoUTv1VOOvj2qSiwVyqu?=
 =?us-ascii?Q?98aOoGjYQ7TR5DbBGE7GEOGyq4xdkvL3lOalIe9bbcp+kVzbXWtRblBwR3uP?=
 =?us-ascii?Q?rA92dSD+FSq0BXWdqZ+WyZmsLpERS6zNB31TT2VKz2GKa2GAmF52cmXLbCzq?=
 =?us-ascii?Q?8gPOgetBfFWlaoHtSbLhnIXwlMlAOd4UYdGUf1oGIKnNDAcf8bc3gjH9hYXV?=
 =?us-ascii?Q?ecnk2loEN4BSFI+rsxBJxuCCs/c8PKqbBkFtbVwrYlQmzXCyqufAnba561G0?=
 =?us-ascii?Q?f6zhMZCBKBcSmK/1qAfiHfqsrUqM/EDkB9f/ruHARCtw5yEuaG9ZxmbrS1Iy?=
 =?us-ascii?Q?uFtmCQN/2go8o6sXAdmSkoeBd6UVqqtz62Zq3G74XvD7Gy6oYDlPoH3KUE4o?=
 =?us-ascii?Q?0cC/1eIMOB3ghqZa4w0ACKiukYdWbjZ5y7LNB/Or4uqZNQk17f+ppF106m3m?=
 =?us-ascii?Q?hS+VAk8kW74VVQP9vhg6PUxbyWezM3Mnx+2OIjIevlVfvE+TG1vybtk61THV?=
 =?us-ascii?Q?RFKzNdQcVe/iWtxcq7T5qT4+VapGsSKlWeiykLBfvpHEKfWks/+7I01az8h2?=
 =?us-ascii?Q?5V5M3UwvjhTUDh5P7G7d3iwqnDXAksy6SDI7yDNoXv/X3da11fVpUxsJBqez?=
 =?us-ascii?Q?z1ybCpTq8gn8m5ni2/ExznpmUur9q6DMFvFqzH1R+pmHaKF3IISsSGc59sN5?=
 =?us-ascii?Q?Swo1KCtFJXvuswJcUwvQKsqjyxSP0mU8Nfwvgo7U?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 143b2633-3059-4e06-e238-08dcbfd01cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:52:53.5811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGu8oogTPlv1mNWXfp7l8IOulCmE+A3sqq0sZCPTnWrFoughJhKtVE0wiy0kDKCkJZEdulYHBePP+lYmK5EQCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9856

The PTP clock is read by stmmac_platform during DT parse.
On S32G/R the clock is not ready and returns 0. Postpone
reading of the clock on PTP init.

Co-developed-by: Andrei Botila <andrei.botila@nxp.org>
Signed-off-by: Andrei Botila <andrei.botila@nxp.org>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-s32cc.c
index 8daa01d01f29..92c51005cbed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
@@ -149,6 +149,18 @@ static void s32cc_fix_mac_speed(void *priv, unsigned i=
nt speed, unsigned int mod
 		dev_err(gmac->dev, "Can't set tx clock\n");
 }
=20
+static void s32cc_gmac_ptp_clk_freq_config(struct stmmac_priv *priv)
+{
+	struct plat_stmmacenet_data *plat =3D priv->plat;
+
+	if (!plat->clk_ptp_ref)
+		return;
+
+	plat->clk_ptp_rate =3D clk_get_rate(plat->clk_ptp_ref);
+
+	netdev_dbg(priv->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
+}
+
 static int s32cc_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -204,6 +216,7 @@ static int s32cc_dwmac_probe(struct platform_device *pd=
ev)
 	plat->init =3D s32cc_gmac_init;
 	plat->exit =3D s32cc_gmac_exit;
 	plat->fix_mac_speed =3D s32cc_fix_mac_speed;
+	plat->ptp_clk_freq_config =3D s32cc_gmac_ptp_clk_freq_config;
=20
 	plat->bsp_priv =3D gmac;
=20
--=20
2.46.0


