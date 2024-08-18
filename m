Return-Path: <linux-arm-msm+bounces-28910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56270955F64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FEF4B20C06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D15154454;
	Sun, 18 Aug 2024 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a56GWnap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A812B93;
	Sun, 18 Aug 2024 21:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017816; cv=fail; b=BBQdwupR2OblmgqlboU9rcbf9ZlGCcPkh0nJKUoX81ghgiWMY7+mQs2C4KLk7p4O8w8+WxoV1SMxPcsH2ciKCV/dEPMLJrvtUekncuSulsgQDb6f0VodDtRTtIUnZeS4XZ5FK7rdgR1RqJMYlHwL0ClfFrWLZhcD9LvvnecWmck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017816; c=relaxed/simple;
	bh=uJoDxCYlffTBU2j5TOFomWY0IxoGT7oTkHCjaYRAilM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=H+KVtQG+XrC7oITqZercTRZf8pLWsSbBZ7lEcNPv5pOCYJdFDhujTcdihvrGOhSqNEpjuuUS0r5w8vEviPTMBtQm1JWRxRn49v0tI7oWCzCxQfogkRGdAj8GEHE7EYJsPKPmDKpvlTVVy8P1rq//H8+iCt15coUF0mvZb3V5JPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a56GWnap; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frzFTJyggfX0gN+5hq1zkWPjrDOevh3Cmd/T3DRgtI2gnkqO+XhrbCNZtnImCY8qhCYokeu2fU/LSY+B/yXVeW0CY1qfBKu9Mrtx3Z6YwPMxeZc5Vw23MukVylqh5D0huyhWS5pfPsVAPnxqzmMygcv7FRMCmRdys3rmKHoTXRgGapSzHoVqKSrbbv8FqBeMkaJEhATViEshqEFqU3Jwtr2n2KvGVGU6pf+rucB0RmGaC5shIbnS+X6BUjzZ5uvQ62Lol8XDbizcLVtvvC3Bap7Em2S9H6A1oIrDYcrPNQ4BxLoaHP/76qXjtbo7VShqWzI2hi8AQ0jK06+QNtW0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeGHiw6Ghl60knBj+BqgNq9zaj30hmdQARuSIwkAFC0=;
 b=Wcz5z44v4ai19zpvMdtSfRxv9rwV9SC6KrCVzNXicY/IKrN+lsU3r5ZRTM9HkKRjmQ982vqEDnr4ZTAdHGc16y0EECTSOZx5LQFhcFkxVo6yOFxNq9zn4Ovzu8JVgvIWUn1kiWyG5mciwdG35whJVSxpEiyy/v338BKTjO5V5FEQSMQ3itz3ms2w+FsDwYhJGySj82gfd9gtuXMU3hpGNouzZQPeS+Z9Um1cEFXzKjVc+D5YUKLXXgmsXtBkFpNcaZisI0g21LRtVyBsHSog+i1MA9VEJCQ0utZNH6PGB5OBlQAIEoSjLBBJJP2Rs+gkZo9Y2lIsRYgGcZVBoC5/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeGHiw6Ghl60knBj+BqgNq9zaj30hmdQARuSIwkAFC0=;
 b=a56GWnap0MDMTx1gib/T0uwgRhgeO3w9opFkKfFIBA7Kz30KA8Wej1ZhgwxNA1J69p9Uk53khp6/kKG04f+8Csd4/o5D4rVhtvTwXnLBz5sj8q7YfNXglXRLHARtwobfYiDOBVtZI82T1vXXKO0pI2GabNETLDtkwVSBXe12xnK+qMlPzLqCqQ1X5ldQk0caK4eYDCOnb4BElU5IvwUdqHbZrZ7f6MKXbnNwLm6mR87uvEMBQj5qOGd0gV47Pyc4fLkobjYW01NXZ4mB6eSyeHD0q3Qf1TzSle3kWba+etSJ/PD/TX9B4ejIFPTYFnOqPA0lEVHRyMqGEq6sUhqxcg==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:50:10 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:50:10 +0000
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
Subject: [PATCH v2 0/7] Add support for Synopsis DWMAC IP on NXP Automotive
 SoCs S32G2xx/S32G3xx/S32R45
Thread-Topic: [PATCH v2 0/7] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Thread-Index: Adrxt0q6n4YzrDyuQQ2gRM/4umb8Hg==
Date: Sun, 18 Aug 2024 21:50:10 +0000
Message-ID:
 <AM9PR04MB85066576AD6848E2402DA354E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: be45e14d-ae65-4a9d-23bf-08dcbfcfbb81
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zCe4wABEA/MEthcY0Ns8TKcQ9+8aXuyinJfIt9Oys7YrikBUSRJx4pSn/nf8?=
 =?us-ascii?Q?Weq4Y3LF8OxaBE+NOh9JFRnxYYISiiuctfWkSVPQ6tvYbhUBkJox/u9XKxcb?=
 =?us-ascii?Q?5tpEP2WEuaIrMuVs/kazdvE7hyGqfT19FDrIbQnokvmrw8j0Q9/jCrH8H7a0?=
 =?us-ascii?Q?0ZoU4nmVtHxRcfty6c621d1tggP+FZjz1zanxaUpMeML84gyG5OycAtrPS3n?=
 =?us-ascii?Q?LsLOzmD8H7+qVSJaNChfwSJR6G60qXRxmO6AoIVzHXjWeeN/KJ75x3LHa/Xs?=
 =?us-ascii?Q?2GxUTFaRT6HK1coiyfPIFrT0vt+gq3hpp7qaOkTo0sci7wYt1s89cNYv29Ne?=
 =?us-ascii?Q?f6YKNMhu1Sf3K6Yxa0VzIwJq/tetM2JbVkM7voxCp7vnW6GDWDYkF8edXn1M?=
 =?us-ascii?Q?xYyhMwNgdDsmqnbqlI6Cr6jiUDXBINhLIzSlKo91aZVdEloFpft9JDZRkksx?=
 =?us-ascii?Q?gGFR2jvFX6jLT4hhukL6cQk08fLtj5XMTkvLW/0nnxrm4K34JoO8sDFeZWyX?=
 =?us-ascii?Q?EEV43oynWW+E+2v9TFZj+3PAeH19UxxtxlB8ELIbvSloaePKLspJVxIyVjaj?=
 =?us-ascii?Q?WSK/HQNUK6LcCWtXD09YbveSlu08W1zwbN7ptoGnROO+ECftnbjei39Z93Wp?=
 =?us-ascii?Q?MpeuKGt6XEVNNQhkArBkpCVavDpIawurZ/heklramFmAz57NRmfRFLZaEAW8?=
 =?us-ascii?Q?yhdsKg5W2ZRLkewY0uFxhCZH9pf95RsWrnapMz+dGLp2KchnLin8j1F9y5B6?=
 =?us-ascii?Q?8jHD3K8eqdRPw+4E5SdYljyJbPgz6JpL3qKTEkM2WdUFjVC1OZ9NVdqpANGI?=
 =?us-ascii?Q?9KcPz7smsqiMWQpIk0Or1XZO/kr3Jay0OIiirvwQC0uFNiVx5bJpF/9RmoKA?=
 =?us-ascii?Q?z52kPOCF2opvVwH9Q6pBpdqd8iu7de4rQqCW6SP7OUErM5btwdM65N6IwchR?=
 =?us-ascii?Q?XfxWF++tmHyKiDeU98ewzGnTY3PqyudAe9+PZMXoK8ZayZFk5WEno1rORprj?=
 =?us-ascii?Q?/5NqhD6lZxS1quGWu/5b/WAraa2xMlSVhVu4dXK0RinltOVM1Vy+PJnzEfgc?=
 =?us-ascii?Q?arJaLtHyxLtFufLo6u/TMOzRk3nqmrQ+ArKdhjF1Qs9EFFVhHeMatNUVUnsJ?=
 =?us-ascii?Q?uMupC4FDk05ZrGr9lywqyqtybeRY4jfRhthkbnxgorxsorq+laF25+9ONTXi?=
 =?us-ascii?Q?h1aIe3x9eOnhMQ4tpvqylQ+0krFnZHNOT8z8/N4yGwit5tmflxvChadOBfE9?=
 =?us-ascii?Q?lBttsEh0u56e/kLFIhcggxUToN/1wFkVijafaOfFKZ81zdQymYQsPzuZ4nsk?=
 =?us-ascii?Q?fuc2xOuzrZWtXYXu02HnvaAjTqIwt1TKsENBQ635gVpGiB9N6pB5Bim/KvfM?=
 =?us-ascii?Q?YrCtMKI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EogGcbuKhbsGfS7SARZO68wDWngp1y0nnKfzWq4pG+aClBYI7H50MjZ7eK9L?=
 =?us-ascii?Q?7WfZn72AAd4F0ZJm3/OXpZee/2v9/ZoMHjb4efdsm31gFE4ytodXZg+A5fyW?=
 =?us-ascii?Q?/8zTyjfs+fv5o+tVgimxpwDDuJNGCxgzOwFyt39NSjY4iYhSasIIjtlGiAIp?=
 =?us-ascii?Q?QW0d/jBe6Dha4t5O9j0PsKmOZSHkuxP1dd8Wr4HFgIQ4d8L7DjGRuVqhf9U2?=
 =?us-ascii?Q?L5Y1ulJYaSshmFnwIx5kRXuXVg2Ol+gBQBJcF3yKxsIbCHMgIslr/ZagSv0G?=
 =?us-ascii?Q?khr6a228ojVkCsKwbMd9LWK6i/hVO6MyoB+nofZYUgzCL6uvp1F48oQoyakE?=
 =?us-ascii?Q?tfpvrqWjQX3w1HkJZLOWSkzL2v77Efing2gwmkACaP22arzklBNkLts/GWa4?=
 =?us-ascii?Q?umxd4xUKc2wNaxp+eh+zIkmDUHsaHP3NUeuoQwaTw2woqNVI+qVgmiEoMzAB?=
 =?us-ascii?Q?WcrXuRLYoIX9lPghKYxunXcYPUbt7Zawf1rIjT04X2QWepbFkUHp5KGykNNY?=
 =?us-ascii?Q?To8udFTdwWFnq53h+q221EIyC4B2omSdAzyzwXZWEf+rj0gBZSHewAbzBJqG?=
 =?us-ascii?Q?XAj9ikCofjjxMIrViAaEzXFTmV8OFD58gobMP5jcE5EIh4Xp6rz4Dqnx3Vzz?=
 =?us-ascii?Q?/UfllbKysvpbF4md0xyDDEr2Ava5uK1seohcEBXFH7Bg4mVaOeL+m6MnCw2+?=
 =?us-ascii?Q?gaN1/o4uAxDPLOtC8YgsaIRviYiMTVDClCMOQKrcGyjWzfYtNQ0nUWgDazAk?=
 =?us-ascii?Q?Us1sgzNIHKcnfaXxvwInnCFtqsMz78jVJTYHmZ5ga/WY8zrl/C11J29cZ3R7?=
 =?us-ascii?Q?9ADpj5ElaUELcb3p6MOJxVuVqBv0RUJz9vdOeKZtqtmVoDU6h7d0DNikycyd?=
 =?us-ascii?Q?jV+YikFlQJBtTJrLp4gk/VfA7XtBFBBFdsUJiZq+vJYNYcs9Q+22gZDtdERZ?=
 =?us-ascii?Q?DWIk0rStTeAW3ZqORZzgDo9rORuPF8A45u7fYBSCgfYJGm+NtS5/TTzwm0Z7?=
 =?us-ascii?Q?+lFSHkBWmKDCP1cZkG33ZYHZgU8cCcdglZd8E73N3gq1oWn0uL0+GyCNokrz?=
 =?us-ascii?Q?rJgDAkNDVMUYz+IqD+mD9r0Kda0hZQryuhEPVO5NvCMB7clJs8yo11zgnTWW?=
 =?us-ascii?Q?fXDJpA8rO6ksgjrJRADwkXYH2rX3UMmESeMplFp+f8birqw3GiyXMZqGDmKz?=
 =?us-ascii?Q?4A052Jq8a55Vxxq/wVbRc09dXwGU7eED02QMuneCRza/EC7/ZHBYn/d09DS8?=
 =?us-ascii?Q?5UpV2LLa2PHP/RTHqiUr2Ew5T5mVMSBoR9/aaLX96ZUVdsBw9ZtEX1RKmjmu?=
 =?us-ascii?Q?bplDGW1KvPA/WeQ6qR7J+ql/hbdIbvubF78JReAqi3CNVaKkbxpjcT91EK1U?=
 =?us-ascii?Q?ah2rIbaYjl+Jaumn06kqb398Quw3kb8L00x+viiiDLGNBZQoAPQMK7C7yQ5y?=
 =?us-ascii?Q?V+xFi5id6OZcboEgQlSQ5vXVkn5AmCyofuKDpj9GfTIl4rkBDeuncG+cUR8o?=
 =?us-ascii?Q?dimT85QiyVW3y+7e1WA7LsO0nXuGRvJkc2IPajBKUaKZsg4hWwrJuJQ7Lufc?=
 =?us-ascii?Q?U1wfEqI+hp3tSwrdD2Y8N+9hZE9Cb+fwIHDmQ/Hg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be45e14d-ae65-4a9d-23bf-08dcbfcfbb81
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:50:10.4566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDP4Qv3tkVMvKqbgzgoOnARmTZ3qf3eoCMBSiN1XlKkiIcFu2ewOxMuc1wxtfvJFyopInvo6Za9e5lgmPd4ETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
interface over Pinctrl device or the output can be routed
to the embedded SerDes for SGMII connectivity.

The provided stmmac glue code implements only basic functionality,
interface support is restricted to RGMII only.

This patchset adds stmmac glue driver based on downstream NXP git [0].

[0] https://github.com/nxp-auto-linux/linux

v2:
- send to wider audience as first version missed many maintainers
- created rgmi_clk() helper as Russell suggested (see patch#4)
- address Andrew's, Russell's, Serge's and Simon's comments

Jan Petrous (OSS) (7):
  net: driver: stmmac: extend CSR calc support
  net: stmmac: Expand clock rate variables
  dt-bindings: net: Add DT bindings for DWMAC on NXP S32G/R SoCs
  net: phy: add helper for mapping RGMII link speed to clock rate
  net: stmmac: dwmac-s32cc: add basic NXP S32G/S32R glue driver
  MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
  net: stmmac: dwmac-s32cc: Read PTP clock rate when ready

 .../bindings/net/nxp,s32cc-dwmac.yaml         | 127 +++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 MAINTAINERS                                   |   7 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h  |   2 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-s32cc.c | 248 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   6 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   2 +-
 include/linux/phy.h                           |  21 ++
 include/linux/stmmac.h                        |  10 +-
 13 files changed, 433 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.y=
aml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c

--=20
2.46.0






