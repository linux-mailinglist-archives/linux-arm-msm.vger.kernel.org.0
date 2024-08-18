Return-Path: <linux-arm-msm+bounces-28913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3491955F73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84B48B20C39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F6515666A;
	Sun, 18 Aug 2024 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ElkzTPH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA74155C94;
	Sun, 18 Aug 2024 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724017844; cv=fail; b=J94fG3mkIIh1JzNc0cUqTYc9+rzt4E14QS12ueaeGSMiJRUTaKcMYR6KZxjZmDnU6NeUcRojh6wKcnZyvC6DqNZcQzZ6Dc0fz2yX3ZeO84Pe93EBZCtWasXvqSEBY6Eiikkvd5znewsEGdkGWpSpH6VrXO4ctw+xxfadD2zkLmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724017844; c=relaxed/simple;
	bh=9N0hCa/Wq2TX9bE3yhxBz9FulLKgd3egsgkJoonrbBw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GM+Z9wTKgg8BV7DNoZ+gYp2m5uObu7YLOiN+wM6QCY0M4yr7ZU97dLWAxgRdbx5HlyPfMa2wJK3fHLbUzK0MDeyTxgXfZQHr8sRzmztCCmARY0w8wJZYsdTyuAP+VSTRwHcTzN6y39bcGxcYw79uMdU+u2/wci1a6N4QoUal1G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ElkzTPH7; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJXKJE1oTpHu3ZyK59rrTFQnIsGJ15ol7jfxUwrKxE97rKvmegICi7UCHv9SWtDKhSVDCG9FBDW+rCawcWAxikJJSTNrNS+sd9rSrX0UIdJ2aPPZYkF08n4nNHqNgiLKWQXgBwfPRZGf0yiQHFNzphQgaqIgHTOpajI9tdbGjpIuhr985of5TBTWWnkkbFFzLgygTJOC43vDX7DPY5Zxt6C8+rY0q71ked4j2Krak2ogRLwO63Z0lbBWw2UgQr2xRAgz+n28AXxh+t6H8DxoS7FaDJaWofl1JaBKX9r2Kpq20s0Xeck/wFzA5yFzZx885mNBkR6xLPJnKS3Uf8FDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/ZDtX2BkysGxJ2ScBhNQ9MWWpo4etrvQpMjxVjEk3Q=;
 b=PiW0IcLmZ+e3wjbhdKSjN3ZISz72fNK/VxZh6Jg8KXhOeLpIPncV2KPOLGUBwDUJPowgcPAFB5kMYFRTSd0LyzFEYoCMzBVYF3WVSn/mCjOMEY39EdkMKG6i+a3dMFPpMAxEobDGnKFUeGIFlmdieUPtVjGzw6vNm0OzaDfmxjpEw33DUeTussiGKSSamt1uCn8UWKWyARMTB2UjvZHMY8wCEo0MzvFmNqmeJfQoiQ3HLvwqSBSmIbZIvoDZvBOCTtHe7taVl3YoPl280/XGGDFoxOmk1SUI4ogmg7/6nQ4DYPVmyrC9T/3rRF/JQh5sjNhDoTSaxqrly1WNMOsXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/ZDtX2BkysGxJ2ScBhNQ9MWWpo4etrvQpMjxVjEk3Q=;
 b=ElkzTPH7spzZR0Vd9sXrFJHBqKkVHsfh31epuSSD/UYp5Q3y39poNUukSCTDBzjw7eqlOKUHfTpXJUCBCQJ3AS/xDRcluzALmqRZwol6rbFXVVbZC+bNabg7A9V2hPtjorIw+kZ801dwrMp5g/R9oQQR6wnlZ9r2kfUFATA5ktZRtDzzAhAoDsPWUZqeaf+ZosuzPvw+P6SCZUE7GuHIKQmx/HAQQ8UBA91b4nIHtkbiBFaMh2j+RE2zlzUM3D7hrkCLpwcWASwMUldpsC+zlqtgBnJSP9A6YVnQpvrQLDJIk1TUhoGB/F9ILNroD+rd2KiFwOZGkRxaQyq62r8InA==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:50:39 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:50:39 +0000
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
Subject: [PATCH v2 3/7] dt-bindings: net: Add DT bindings for DWMAC on NXP
 S32G/R SoCs
Thread-Topic: [PATCH v2 3/7] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Thread-Index: Adrxtw3iVWAiNiK/RnOHrO7OVzo9Nw==
Date: Sun, 18 Aug 2024 21:50:39 +0000
Message-ID:
 <AM9PR04MB8506A1FAC2DA26F27771D039E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: 5413048a-27d7-41ce-d5f8-08dcbfcfcca6
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mvr9iYM4Stou2a4MSU+bmB9qMKWmWijYChDVUhmV4AU97SITtEA3STJqpcHv?=
 =?us-ascii?Q?xFWAuTVvfl+HtRDqFsfT2eIvoO+a9mAf4hSbm/BY3SoOG3gxqAIWU3hSdqH8?=
 =?us-ascii?Q?xnsAw8XtOyZrmRGB1/4yOGwMB7ZqSYW95Sbl2K3HmJSzjj3piN++EyNEG08H?=
 =?us-ascii?Q?3hNoa7MoWB1yRWRsG5G4IVO8AS8H3hPrj73Wqr26EZex4puUPDIIbGvp5FHf?=
 =?us-ascii?Q?QnxxezyqMNPTCkn+KHmn6X47XMr9xY6ciiT+9guSwSv0lZsIbgYadIGd9S1H?=
 =?us-ascii?Q?d4bLmS7yCprQ0+RBiMgiYI41P3KFVvbdZ64V52Yh2OW+xsdXw0Cv923QW6CK?=
 =?us-ascii?Q?9iV3H0alsVVHyEd1dr2rtMhEU2b5pS2EEgEtRVs/ovTOXwMWhdc54H5WDQrx?=
 =?us-ascii?Q?CKYkZoMgJK0pMgzw5wZkvIYc502LY9gQ+OAJEHyVPmfelFWJuXYzMkqNa6zt?=
 =?us-ascii?Q?gQpSsudewSvEk0zZLIK1FTE+0e62HZLmSlNGZ5XorjActDm23Ne4yET9/LSj?=
 =?us-ascii?Q?EENqObQMwmPRxQoj3P4PNFDDVJbAlFegQ0rsDNztKBH+0UIu+kE9deTa9rod?=
 =?us-ascii?Q?AJi8V8bwPYpRjbwxfygLIZT1oYV+qb1v+EyafiJNYuxTWOhFmweq2zdJq2T6?=
 =?us-ascii?Q?3wPQDiAN3lRQOMPX/1JsBcT6uFsYS+OHCJhhLQJZXoaVxOOqeqHD3Vx7WXSj?=
 =?us-ascii?Q?kGQ9M23v6y2i+en80K9L9rMeuQpMFEIUpSqjHR/5xBsFIwjlU7XPIxL13GGT?=
 =?us-ascii?Q?WSxE+51uPxODxIcZxzwvvwKP/G0BlP+wSP2ayakAoJu3hngMUmYM9/74E0J0?=
 =?us-ascii?Q?UHE1sSGyYo534qCDKpbVYz4fJFzpGU4Vx0DO68W+zpRWvqpAFgWBUxK7Sp58?=
 =?us-ascii?Q?1FbuJBgIGSpE/fZp2aNPty15FJUWbe2qtW8ydDIu6TbBoy66wlrHKWoimcyg?=
 =?us-ascii?Q?ZVKlNsap4+BbvJe922ZzzhD6ws1vCE1LaYA/lheArNOT5AsWzp5/PreJvDjf?=
 =?us-ascii?Q?DUOxryLWfJilean6D8g6yHUZrb62QnIm5YP8FK39kYQXYZdCyvfcZpC+UgDE?=
 =?us-ascii?Q?2dNfhalImNO/yy4V+Mm75eUP+0IxYQnYinQ36d2sKc411q07yeLGBxI6dTyi?=
 =?us-ascii?Q?L3tjFbKwmrvMkSFDytHSuGg7mRCOBF9QI4erzlyM4yw/fB18qFC2GhAz16TG?=
 =?us-ascii?Q?/ns9UTd7w7Ip7BBoG6z1vCsbPAeDgbS/PeKDNgmqqr0W7JwecBwMALoHQTe6?=
 =?us-ascii?Q?xIYOp1txCQNbMkCfaxf6fqFqioHom/5ETSyLkqgwsw4g4bZxudeV/CdseuW2?=
 =?us-ascii?Q?DwLiTIf9QZ8llpR9ynHlshV+InTA6QrmKanZ7SgCvkJUVH/7BI+Cf5U1wEgo?=
 =?us-ascii?Q?E0hfVPyA68ccL1oio37YkoT4fXyC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8506.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UjwtStTbFOiKFkNB+DhtKAz9/0tyqHCqCnSvcz1ICpvc0mt2iIxRMfqpiHHJ?=
 =?us-ascii?Q?QcN/g25kh//yT0s1EOZAnVSyoFQEJYS9zIVo5LNXunaUth8hz+lQ9j+/vUlQ?=
 =?us-ascii?Q?j4mRi2qF8leQwuoGnSQGeuZZxTXudDi2WVCmZhoIXKFeAWgJMXO+OHzFPv7L?=
 =?us-ascii?Q?8G7/FkWflqfrcjw1y3x6agS5gKpl+VkMiYtJ5vXIWxg96HVMmW4HRGLQO4/R?=
 =?us-ascii?Q?1Gcav2tRJuu9okaxU9XF70vYq4Khtgo+EOCv99tCMoA35aniTCvu0KJGt/qX?=
 =?us-ascii?Q?Em2dgLGSLXAry2dNpmuDa2f+rwGaJxPK2Nya0Kq6UDVbAlJVW1O0SM1agq47?=
 =?us-ascii?Q?css65Ft0sJz/snXDfVai2qayQnjzCKl8vMh/le1+nGg0V/3W5JrSYGs+Efse?=
 =?us-ascii?Q?jD8NsfEqqc5TPT530rYR6cjzOHQ9YVksHoWsXxn+b0KqxUZDMTZD3fvaQMlt?=
 =?us-ascii?Q?h23KlalBIJBL9QcVBLOxJ4icnPfvD25nrR57YNoAAm674O6n38BSrYfJzTvo?=
 =?us-ascii?Q?v2POh7/xAwyGzdQjdtgWI/uoslJgITZ9EsLiSa7ntLVt992bzD8+kwxaD+zB?=
 =?us-ascii?Q?5urSJoNiU7hw+nN9AygVklfpFuF6s6cmL5xSD3e4rD3j84T6tUpHxgP/wYp1?=
 =?us-ascii?Q?7UzHLijnWN/0TNp6YuQ/m80miLFYyFaTOpiWQhh1+EheuaUs+jmt0loavNDm?=
 =?us-ascii?Q?hATP+GHi+W2b86Qj0/VBIY76k8/tNoLbUioH9YVmdNZQg2UR24IbRFlOumqu?=
 =?us-ascii?Q?dSVOJLlCJ11QRR8nQYqh4F+8M22c4/Q1Pu9CFUrl4XCHV+dS6bYAsDWc1bqD?=
 =?us-ascii?Q?00aKMR0kbLnC9/72ic33VSLZXTb2mzpWs7Wfnj+pbP1gI1W1htdttYM4WDau?=
 =?us-ascii?Q?hnSMemR2fmNVdCxxw8RHHtWRgNjTruSUg6gp8cf4HaeolDScJrCI6o2Pp7jn?=
 =?us-ascii?Q?rMQ0wUWRuFMzug1SXOxCKZqPH38JXVvwjoZqFms5C+/cCYU5GIAd+DuRqOPT?=
 =?us-ascii?Q?85mJNT6S0gLQ+pFPEGOSIXuuUZq4bCVMdWN9AAwQ4GCLXCObuAMeIos7CftN?=
 =?us-ascii?Q?h66bMSl4RYEzLmdRSoCJ0Q9NVpNe7kqGd0kPC8ElgOeXSt1tfQSzW0vKwdX2?=
 =?us-ascii?Q?ch/L1qrpVTBsyJMcOCPdyTxaUsK9pW35kaRopgytBd2eHkNIagOQJWv4siU6?=
 =?us-ascii?Q?hmBIkIPko3pQ1hpQpXvoEeVkp6A6GqUSd4yP7lax/+pdNnoaAAnkhhwrYr64?=
 =?us-ascii?Q?VWnxfxImRGfxFoow0S1jGzC4sZJGAvstxVQVwVur43EsJzwOzHAas8WMZcU8?=
 =?us-ascii?Q?s1Oy4YImXi/7fEUqi20tt2yGfTbElq2aMKPKAxix+gmvwLB33S0lBUFOOzxn?=
 =?us-ascii?Q?8JiRVJPFykmxrrX/PFucMHukO8RmipZk7hISyNbF9do8wi1s5+IP+I/JeS7T?=
 =?us-ascii?Q?s/dp9reTWyPXAUFxBwj5AE8VnF7SCoBgrcXPa8el8/Ye3qSPzHtYR/rj0mmh?=
 =?us-ascii?Q?86qzrXCGkPU7lP1JHZaH/e1w8pmoe5ctfBbv0ADMNjuTSsHB/+LDSvg6OwWA?=
 =?us-ascii?Q?xj9y8Ta68AwXnI2TJaXru0LNDDYoOBqLAt16bmua?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5413048a-27d7-41ce-d5f8-08dcbfcfcca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:50:39.1807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JrljW79P3vm0Uv57aUihAh71LrpG9k/jL3E8QtRU68CF/ZNNFtlxj81ajZPPuOV9fFUMSy0YKqEbpiuMvQU3EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
and S32R45 automotive series SoCs.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../bindings/net/nxp,s32cc-dwmac.yaml         | 127 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.y=
aml

diff --git a/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml b/D=
ocumentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
new file mode 100644
index 000000000000..443ad918a9a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2021-2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nxp,s32cc-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
+
+maintainers:
+  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
+
+description: |
+  This device is a platform glue layer for stmmac.
+  Please see snps,dwmac.yaml for the other unchanged properties.
+
+properties:
+  compatible:
+    enum:
+      - nxp,s32g2-dwmac
+      - nxp,s32g3-dwmac
+      - nxp,s32r45-dwmac
+
+  reg:
+    items:
+      - description: Main GMAC registers
+      - description: GMAC PHY mode control register
+
+  interrupts:
+    description: Common GMAC interrupt
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: Main GMAC clock
+      - description: Transmit clock
+      - description: Receive clock
+      - description: PTP reference clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: tx
+      - const: rx
+      - const: ptp_ref
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phy-mode
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    bus {
+      #address-cells =3D <2>;
+      #size-cells =3D <2>;
+
+      ethernet@4033c000 {
+        compatible =3D "nxp,s32cc-dwmac";
+        reg =3D <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
+              <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
+        interrupt-parent =3D <&gic>;
+        interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names =3D "macirq";
+        snps,mtl-rx-config =3D <&mtl_rx_setup>;
+        snps,mtl-tx-config =3D <&mtl_tx_setup>;
+        clocks =3D <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
+        clock-names =3D "stmmaceth", "tx", "rx", "ptp_ref";
+        phy-mode =3D "rgmii-id";
+        phy-handle =3D <&phy0>;
+
+        mtl_rx_setup: rx-queues-config {
+          snps,rx-queues-to-use =3D <5>;
+
+          queue0 {
+          };
+          queue1 {
+          };
+          queue2 {
+          };
+          queue3 {
+          };
+          queue4 {
+          };
+        };
+
+        mtl_tx_setup: tx-queues-config {
+          snps,tx-queues-to-use =3D <5>;
+
+          queue0 {
+          };
+          queue1 {
+          };
+          queue2 {
+          };
+          queue3 {
+          };
+          queue4 {
+          };
+        };
+
+        mdio {
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          compatible =3D "snps,dwmac-mdio";
+
+          phy0: ethernet-phy@0 {
+              reg =3D <0>;
+          };
+
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docume=
ntation/devicetree/bindings/net/snps,dwmac.yaml
index 3eb65e63fdae..3311438f67ee 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nxp,s32cc-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
--=20
2.46.0


