Return-Path: <linux-arm-msm+bounces-36354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8C9B59EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 03:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B2521C2095E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 02:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D48193081;
	Wed, 30 Oct 2024 02:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="izJGoUd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021131.outbound.protection.outlook.com [52.101.129.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E5919BA6;
	Wed, 30 Oct 2024 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730255370; cv=fail; b=javQY+dReIff0HXagRhnjLf6U6g6R7kI+I7yEwnc6oSRsewhoTaiYNyQnUHNUHh+PbYMRsqoMGmSyp092jGO8pZOksKaf2u7GEvyzVhQOO5KkSDWBVSk1VUSE7g6rscD4mr6FZFYedhm5fKUm3MugtFVafUomPlPIfPxTh/rRUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730255370; c=relaxed/simple;
	bh=9bNryjsieft3BISU91EPjJjOIfOL/w3oZKz9ek5dsYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qrcNPUo3HP4OQTet4gUE1zVoJ0bWHeGsvFtKkibiqVpUCGZh6UJJ47Tu+Q8HaVf4RZxo+NjZQXAdJWlEOKTtRMckShRcLm46d1GSostLnh6EEj28fDXvvL+w5lBqXWchd+p1ID/uHHy9cnJ27NEFy178rkoZTG4t72ogcL1al58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=izJGoUd9; arc=fail smtp.client-ip=52.101.129.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6qGTq/U+bt9fIVjxogFhTPtgdL+BCMI1iNULqZIjduHqtq2yNUTQqFxcOMCnpqlgxQWnJ8hlkLnwiD6/bDMh18fnSL/ccS1/qX5PT7GnHXeLI10x7DWJEk2QC1GBeGeMKzTVlHj2dpBdiEjqZ4+QJVksCLH/TVlOaCNIW6V3QON8Z9vFrx52g2Hw9wGkj5cLfUYKGsZP9Vy/at/d2bbrBRObrjwCzXl2YZ+aiatx8X7ka/et5Qjo7a4+RyM8YEO6zN2UwPsg4BPxK4D0WzHAbEzDpZa3cpvY3yP/bxqHcvBsWjMNnlTNjn9HLEq6JYzzYFKKcG7h87/uAv/80CHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbwSAks+3dx4pJDANxaQQtP07h3HmRJtgOz22VN3eQU=;
 b=MGHo/zCix9BJZgJuJek9YpoOM8mVS5aXcotTwcosDhsB6tX2XYk5iFIVguZ01XfHaaLtdi7wXDY2cRTSoI02y8JkG1pok9tKaZvCAS2EmnQvh3t/hlikzRF+HQlJ6vxmeFaUVp656Cw8PNmpiBlQKzr78xFzMn/hC5JLlawon77ajI0ujetiQdTBMACyZweE5bVjmddHOoIUNBHQgZ8V5oTPwX87yBL6q1W94RSa0PfLT3U8qy23GryVWo3ugYkCTZtM6bAAvGN9V5yTnZNXsIeFkmTZj8W46Jp9RjKqIuQnNxgo9y+tjpA0owx94GjyVMKQAO0Qvv0fqVxiWjkNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbwSAks+3dx4pJDANxaQQtP07h3HmRJtgOz22VN3eQU=;
 b=izJGoUd9MaerBVfmQWqZSkllBYw4w0Gj3iBDrlKjokoUbcrpmGJ57MaUUWALHMYlveqTVpHAibdCdMGA0njat1Xmcr0km3OHUKjtS3GBsyb4qRjK2r8yH8M/ZyyVOJkKj0zyCFPbF/tRMvkfUFkwaOYmqMlO9m8lPvbd/pN++HMaukbWB8PdDtWHEp8hZYfGro7CNUGXI16edIzx4YHYmUaHKq3myr8cxUBlTHG/nnKTDCe9RHkk/G6TyDfhj8TmYAeJZIkIVCmwXgiKsnVWhyoPRCr4f3vFn63OE19YCy+3iwoV+VG9efZqVlB9V3JuXkkiZ0ckbK0uBugYavI9RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEYPR06MB5696.apcprd06.prod.outlook.com
 (2603:1096:101:bb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 30 Oct
 2024 02:29:19 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 02:29:18 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: bryan.odonoghue@linaro.org,
	heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angus.chen@jaguarmicro.com,
	Rex Nie <rex.nie@jaguarmicro.com>
Subject: [PATCH v2] usb: typec: qcom-pmic: init value of hdr_len/txbuf_len earlier
Date: Wed, 30 Oct 2024 10:27:54 +0800
Message-Id: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
References: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0144.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::24) To KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5773:EE_|SEYPR06MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: f28f8696-0002-48c0-20e3-08dcf88aa788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m78cd12Je6o0U7Q9KJuvUclEsvohOSsp9CfsFyyuOlXQGCFvJyzuWsMdsbpL?=
 =?us-ascii?Q?QK4kVlDTankA+ml9Ns8zh1M/RVT6mjm98Im0pKxSwQULXREvePaQ3zslAgxs?=
 =?us-ascii?Q?1tEwTpUDaBwh57OolvocQRFD0qklVaPTSvl2yhNW9SZ1JeBwoLeZMvLQuyfH?=
 =?us-ascii?Q?2KRJE0d2FQH89OLHNUXnK8Iw2o6x/WWFOhAfWltWYTWf6kILs5tNecEAkqic?=
 =?us-ascii?Q?Q9OO9/BCM6Z+447hHJL4XfMVQ/xRMNRDRBZ88um8SOchT6Aeef53QrcmEWVr?=
 =?us-ascii?Q?84vJizHl0Ymm1pgSkyHQlt9TKzqWpX5y2FI+gFeaji1J4CTaeJ/ziM1MxcyN?=
 =?us-ascii?Q?1tKOCo2XFsAeZYsxQcYg7Eo4e1mzR6DNoReoI0Ayby6uQRdMk2tYkKqjwcA5?=
 =?us-ascii?Q?wAQltxrsSfHNaYptAASJJfu0/aUAYSFbkdjqJ378qtNIS5lWc+aKnvYSWfgE?=
 =?us-ascii?Q?JEVgRk8OrIJjWWuKiZY/dsw5b7I1Yyoe5Z5oDJbH3dxGMTnLrLphy/1SYUCJ?=
 =?us-ascii?Q?1mE9Yv6huedsd/lShxXt1pSICSzGbqYARLk35KEM2LWRKkQawMNpMP9bfPl8?=
 =?us-ascii?Q?PWMGvM2n1vznYN3SSyCGb0tazZ46pkgcS30gCcKf9deGVCh38cwdSB+JS/CO?=
 =?us-ascii?Q?4Nx8LWJ36NYytkWbLywwXrz10uU7iURswBICesdr+S3WBbkRvOKA5CTcWcSl?=
 =?us-ascii?Q?Jc8dOjzlhRaeRhTOcu2EbPYmMomBxnus2GmR5wZZ8QIgjPRlet7aF855y5ER?=
 =?us-ascii?Q?yc1nKXYpJ5C7fG1PjCCv79EP+ZahD25Jv40RDCAfnh50YHO6mjERe8tRpeUB?=
 =?us-ascii?Q?igyJ3F2yUKKxy8NQysDm5ioScwhbjj+hsTOFLD6YyoFDv5SpZYmHZ7v4rBpG?=
 =?us-ascii?Q?GGVOlhX+eEtuj2FlD5QH+BK14mCLt4n9fVWKWCi3xu0RGxg4sZ49FFhW3r3U?=
 =?us-ascii?Q?8mHCx/XlBNBOO0DSe/H0NFYK6EU1K9/wZAzsoHDSYyrAB1ObOPth8O1iGzKo?=
 =?us-ascii?Q?3kELXt0QUtKEZYgKh+c0R3Qjp8ZXtlMfEJ3zMPLX5rIQbTmf6ti1MUFy39/1?=
 =?us-ascii?Q?60cMPHHuhDIqSHofFs69lRobzFEkrJCiBZ8Xfs2dZRtVQDzL3bocsjdqbc5f?=
 =?us-ascii?Q?O/4f+7YlukfpfNW+C0o9RNVN9hZp5PyfGJKJKUb9Hu0d8sNYY+UlnmJdLcRx?=
 =?us-ascii?Q?caeLLBZlgpnxK/7P0thLFFfScXi1Ujw1rGUW598fFNYyEkENv0KwSCYwzPsM?=
 =?us-ascii?Q?JN7+nwOR/Likzk7xf7WttbN1NjiBqyBzEwBC3wBpGX0pYVT279R9zJ8cIPZp?=
 =?us-ascii?Q?AWYq7XCJR3UVQNP6p06Jx1a6J3FEnm/3wo45LvPrYFIPGcN41o+Px9AqBvmv?=
 =?us-ascii?Q?oI1SbYs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x/SvWP55hA0RC0+CrseiMXwzPl8b1vC2ymSSgqPMUiIVFjF88hroBNPvN/2d?=
 =?us-ascii?Q?WYM4xw8gVy6UJtWSIqN1/8LdiqWxxN9PpGImOs/2wrJ10LOD/opfEnCjTVPG?=
 =?us-ascii?Q?P+VgFFu9KjImZB6LxeUYv1Gomm4l8wL/Hw/78RImMr9O2uKfk8bSyLjSrRIu?=
 =?us-ascii?Q?gXMq9+CecLOscH1BaMpkNI73RquM2uHY0JbWY6LeF0uTG2wf6vTuVdt8o5QO?=
 =?us-ascii?Q?yRPEZ9VM45kWFbsJ0qDmiKmt+GlKz/I9JTgKzUXEY5ZTKN7Ze49cPBzX+f8F?=
 =?us-ascii?Q?RN4hT/6M8FxIOtgAyrkr9DqNdAOdxYME3z/y8wwr5jFptiixv3dSK84E1jXu?=
 =?us-ascii?Q?JQAjZ8TPBl14PQwkVq7tB+PKE4iRSP2lwiPIrgxwk//+qQjV6cYEey/h2wFY?=
 =?us-ascii?Q?ISqy5xc1WjYMDoK8+4O6bIEa76FFYMxPjMKnfLfM5RbuIAlfWfCV9CQS4ZKr?=
 =?us-ascii?Q?gw+jfzptsKma+knl59mXKVEFd/8Mwp3inFlzzSnYDQg+TEUX5wkGNz28PZlY?=
 =?us-ascii?Q?3PeepZLZkjbZ7fDs59vreQS1ldAv1+xtbdFWxLimX6U50ICei8BtautsIeFp?=
 =?us-ascii?Q?ofI+PpFHmJ1MYEw5PaA02kwr4KG9Jt/ulBY8okqJ4jzlztlVNlhfaHQjnLIf?=
 =?us-ascii?Q?TDFDlrqQI2n70wlQSXTLNhWT75P/wEZksg4OEHHS8kNHuAYWVpa//BW9IS4i?=
 =?us-ascii?Q?ay7u6DBm6hA+6Q3zcX/9wcCwQRxcARXYeawyvixFcu+LgZgJ3fctoW3cfwuL?=
 =?us-ascii?Q?3w0JUr/U8vaIEhhR0ypjw20Q7EWJe9RAh/+rqBd+Xke15oJNEj1TSKRiDup+?=
 =?us-ascii?Q?MfcD+p0AwBPV/1pleN6/mDKFeuDXelQOXIutHYfvxV22RZxxHgsuSyPksGDx?=
 =?us-ascii?Q?hQhlWoeeUcBl1puqM4C1sE7FU0ZQohQZP924iK1FRZX3njV5138qfZnFBb2b?=
 =?us-ascii?Q?hlw9QsDNjl2wi54Av5VK5dFL299asxlTezUMS/JzeOEVNbNu/SObbpsW/J71?=
 =?us-ascii?Q?TkVQoteacccFSDbf5oNJZJ+8Y1LD6SIxy7WJf7Vq6rqf8PAv+dQiptKQnTZ1?=
 =?us-ascii?Q?UdLexY61cmSCu5onyb2ZzLvjvN4PNzvfG9hSvlzI89uCUntD8kPKWpdxaCzq?=
 =?us-ascii?Q?FQhQbyg1VJtIwpUbDc12WRzZw6jLf3su1fofJd4kYWB+NsVmznBitotBqTjt?=
 =?us-ascii?Q?ZO8pfyDvpzCZlOhFuvMJIKbzUFfgQ78bYnGYT5EFB5vXtaQ6pJ4bAeoQVUE1?=
 =?us-ascii?Q?FB0mPhEqMhgNKqJrCFRofjlE77fe1bxy3Go4BzCJWVfHdGk9RzwI/enojtIS?=
 =?us-ascii?Q?ezUW14PwUEm6XdLTrqsOLnuKR9NEPnKf9Y2xbB+LUCVANPNBle2Qw/Ez/jyy?=
 =?us-ascii?Q?Yq7FoMySe3sBQnvf60DR4O86inCkvnwdEkBx8VGWeiswvfquk0GsZ3Y+JuY4?=
 =?us-ascii?Q?dNQ1iZXMWgS5B57sy1pEXInGp46bCmNpDv4+GKZlflezmxahKjMo8jb/ziBB?=
 =?us-ascii?Q?H1DBDXdYkV6zwtu2Xnir81P/HpDRIwNSIEs6WI2oWHmx7wLmCS9cisXKNoRc?=
 =?us-ascii?Q?spjjneyPS0/60lOfY9WddE3Noxa/G48J3S/vr9NrpzIPIOjzM1BjKyUvXLjJ?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28f8696-0002-48c0-20e3-08dcf88aa788
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:29:18.1807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Pqh27syFgnsMw7fFq5oZJV9IAVO2gK9H5G/ZeMgYjpwcPz0uAbKZk4IOqkzuCFEm6apMQYFmV/x7FyjhHMEhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5696

If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
txbuf_len are uninitialized. This commit stops to print uninitialized
value and misleading/false data.

Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 5b7f52b74a40..726423684bae 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -227,6 +227,10 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 
 	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
 
+	hdr_len = sizeof(msg->header);
+	txbuf_len = pd_header_cnt_le(msg->header) * 4;
+	txsize_len = hdr_len + txbuf_len - 1;
+
 	ret = regmap_read(pmic_typec_pdphy->regmap,
 			  pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
 			  &val);
@@ -244,10 +248,6 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 	if (ret)
 		goto done;
 
-	hdr_len = sizeof(msg->header);
-	txbuf_len = pd_header_cnt_le(msg->header) * 4;
-	txsize_len = hdr_len + txbuf_len - 1;
-
 	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
 	ret = regmap_bulk_write(pmic_typec_pdphy->regmap,
 				pmic_typec_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
-- 
2.17.1


