Return-Path: <linux-arm-msm+bounces-36246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341849B4051
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4299A1C2135B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 02:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18CB126C01;
	Tue, 29 Oct 2024 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="CkYNiKle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2117.outbound.protection.outlook.com [40.107.255.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91E40855;
	Tue, 29 Oct 2024 02:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730168326; cv=fail; b=rxiHxd86vVp/2IFeB47j31AZbJ+gtBBSCXgm8KkjJ9zJaZAOvUYGmOf9gz1qmq4yflVdqPcG2Bty2H7pqRpzRpQH1hTlU3Qk6LkBVOWVy7R6T9TPqLupxerfyIgEhQwFC3bPAUBpZHEFPWjQ5HwpkZvsJUGcBXUifebcvoF87cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730168326; c=relaxed/simple;
	bh=j4FGRgchj7if3UgZk/+KtrAhOeSTmfkU279jik44/go=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=esds+KXGcnsJIw7uQCAMoVOgZ6bYJr3LxLsuHKVgWgW/baS0wIuDXPFVmF39PssTWBXtusqVuUIlLupEq8TV8oV/QqOg89PgUNGAUbAsROb6BybSp1dTlSVl9jgNJq11+5IdOBqi3mXZOCW59jNCSyhbKIr9RQ4x7Ig8QiWDefI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=CkYNiKle; arc=fail smtp.client-ip=40.107.255.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkxjuU+FKUhbg0IY2VcZdMbrEwGo0+M3ppQ/UrWoepM71/h4l8WO9IAid5IFJ0186I6//oAPmGK/EqLy7LdEMhFN+L7ENY6E6yOSGxD+JBBNHgizxX2oCMfqI7rVLiowkgsansjMp8oeRFr9ffb0AaEaDwENaUfCeI8+cCBpA7cRej9sJbRcMqnDkGAW3Z4x1a6xtgbtTTKeIzCfQEjl+43YHC0J7lXYTTlzEolzn5cKooHC6Vfo8xl9bMCdDcu3OhxqFmZNgRym0dHQOYdxdKQ4CvQEfFtx4ztuajATfOOCmlcJmSsf1X3rFDTNWW6lw0SKuu90CD2wa1o/pKTieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6NDFIj0G/oDeo/VBHs364mgkaOeMo7ynN5Yngwd9tQ=;
 b=feWRp6IV9zcJwmtoyjMRbYtiJ+aAgqrzUQA3TqukavVZ6x7+T431C51GCQjcT0RM6jWNk0vsehNtp270sYF17Lh8gKWrzhsdAAwokcP39FksHKe2Cjcs2ST++GVimDEfbOfD/6Yieu5CjsSSGpfHE4GMXz1ehPCzqovnqKWqMDjLKrTrCwwDkHVFMZfSxxfznZd2YdJbE/qXnb63DmB3beT7JLcu3H8fZzBkmrPYEswpFLEB8yuNin+VM9YzfZoIr/g+XgvarlooDOQ9JKAVrBo9Gghvbm65gEXhQTZllIucgAfgv1SvVZ0KVnalmmjiDKWw8xwQ8XWC7VsZ3/3C6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6NDFIj0G/oDeo/VBHs364mgkaOeMo7ynN5Yngwd9tQ=;
 b=CkYNiKleC0Lto5usGBj72D/4GwiwY2T0noBPxZRd2i/3xDB6Ufoe0SEcPNOK0t6E2n3vyz1/q2oNqhwt4RUzD5xJp6pOhamxLlLBZnLT6RJiO1q87Isg9E1dkN/quCS26PKaMq7z6bUC0xc1o7kpzG62vxJCrGagDjgYKIriMBJW/AoDIwbdq54gTtoGxhwnrtXxqh12xMavaLsMOmR37zmpLk/Z6KL+47CPJxCzm7KCNI3ItW7ympR3fdyAX7wnPVkUxUifzZXW06xZ6zvmuv/3O1mo3XLT8tjCa4D/nUBaDkeS8OBZZdsSEK8NshsF9Jm9yFdLWbsuo5nwIYnjxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by TYUPR06MB6193.apcprd06.prod.outlook.com
 (2603:1096:400:351::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Tue, 29 Oct
 2024 02:18:30 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.012; Tue, 29 Oct 2024
 02:18:29 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: bryan.odonoghue@linaro.org,
	heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angus.chen@jaguarmicro.com,
	Rex Nie <rex.nie@jaguarmicro.com>
Subject: [PATCH] usb: typec: qcom-pmic: fix uninitialized value hdr_len and txbuf_len
Date: Tue, 29 Oct 2024 10:18:23 +0800
Message-Id: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
X-Mailer: git-send-email 2.39.0.windows.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5773:EE_|TYUPR06MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab0ef60-e7ec-4c35-0544-08dcf7bffaa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T76DSg8rLgLYvZt++Rq/7AxGNlAaHTTsV6WosrEyNIVCqoJYp0aMFK7v3TJq?=
 =?us-ascii?Q?KxfqIPde+fxwVxf1nvHbFI5KZ/vtRQwVxOLdRNtGu+sGBX12lna3f4VH2h9v?=
 =?us-ascii?Q?hNQ7LegpRwwRHArtReWNzJf6Rls7ONs5MX1DZJHsAMiqD5X5rC4jVEz3DrC+?=
 =?us-ascii?Q?CeuR/j6xjxFRw8hgki00LD6XL/jDELsywAPyVxR3oUbk2lu41uXEBF0Fl55/?=
 =?us-ascii?Q?bmcJ6xPBp1/OkbmgwEgjF6it1ltc5jmwLnOgT7aLqaZtCCt+yldlwsmpkBKh?=
 =?us-ascii?Q?10I+jzgro4rMc414u06BRLqnY534RZovI3uODYXUTBzaKt1TC0fYWPeBrDG1?=
 =?us-ascii?Q?OCYa9XjPBqCxk6wUwy1KFsogqS9OEzh8lxZIeFmRe9h91r+ENNq5DXpG6aC8?=
 =?us-ascii?Q?klgfzPfWtqJkLUvT0E7LQiQSja4FE6ICfE/GFFDvEiBxzSLY9sFvwtfKTxMt?=
 =?us-ascii?Q?NrpVKutljgfjKC7RFw0+4rPZJD1k2FcDMpuzVBSvbB5uheFn8hjZfj81OAMO?=
 =?us-ascii?Q?0lM+7WYq3YZ+QsmF0mjy1SKat4z6bOfMftRKY96FgmurN2TzFOnJiY6YUcpJ?=
 =?us-ascii?Q?xolI4K/RDuC19bviIm2p/ib8PXrlLUVmfNrt0nIGzX6B2PduQ/c8KJRX6/7s?=
 =?us-ascii?Q?xehm9g1RAuBpCm4zyGbJ3qUfcQlz24E0JaOmvCy79eZu0pU4A5N9g7h/wXKo?=
 =?us-ascii?Q?qCeuX4lhcmQafP1eznc1JEHcuZvoe6u5vdD4UVk884C7nD7++XC1iSzXYRvA?=
 =?us-ascii?Q?W1ghTyynBAX3BkyrDvc4pA9txfpResX6ck1RwShQ9vISJ4ogw+JHDMiCxdBm?=
 =?us-ascii?Q?J8H+wS6UrFsZO/E0B4x/2CNrCaa8hVuNsj7MpvFhQgMaNizBb/tG1d7+dqfW?=
 =?us-ascii?Q?uQDzIs7OIfzPEh+nDJ0z2U5gl0klKhbRVVyuzHCPCRykdB//Jt6oT1I01eoE?=
 =?us-ascii?Q?5G1rlpGAx/0yGCvc+UOzna4zVxwWrVcvGT9rsX1dKSbfMzqDd1YuDqT5uNp0?=
 =?us-ascii?Q?R+/4zH3/f2OfIwuDLQMtwruQ1ClRimVtHrG4JFz5GF7SZWneYBnrhd8NoecB?=
 =?us-ascii?Q?+oqsP8c8JzqaFYyN8KLLuXSSVzhh1uFvk+sT2vRqI66CbApeV9aLXojYWiBn?=
 =?us-ascii?Q?1NHnNNYz+7jA+5fQzUm8VusqZ59XZ6X9hUV1vpjv/ZoYe5bOPt64ehjUadTO?=
 =?us-ascii?Q?MqyzRhszsjJx+C6qNiVXywUsogQdtk0QRzNoa7pR0FMc6kD+v2T2cc6XQLKI?=
 =?us-ascii?Q?rUOqcntOTtkuW7xk39axtQmN+cNPvJPImZGgfQy+UxISuFupE26Tj6xwt6uc?=
 =?us-ascii?Q?XWbAFpphR6yh5RHzCk5qhIwMLCOPLIYHjzzwyGa24B+9rFf08a5cl8w367fo?=
 =?us-ascii?Q?zXliHnY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FRA+XvvTntn1yg90w5H0Ox6zJsO/Y+isy0yJpmJLuhOJvf3VohT1KqM7cI+p?=
 =?us-ascii?Q?7EuBloMqfRqXqV9pXbSwhtNTMh1khR/QL27JnmU97HPiGo7yyvLd8N2lYGEt?=
 =?us-ascii?Q?9a0onUfcg5wgG3Zz2CsCMsCktA5o1KMDwDZThuUvYygfjmyQQi5psroWYbcw?=
 =?us-ascii?Q?yTXXmIOFLTda9qy6xqtju0ZPYrdv1Dris2T6Ux29x3Vmi0QzbRxPPie1YOXe?=
 =?us-ascii?Q?YBDqGqBzvQpLFV+BysgICkFxBQGmpGQEkvQOcWlTXOa2ZxjKjRo6ulCTCGUC?=
 =?us-ascii?Q?y8SSmt7aT2gglDSpwjkQrOzr4F4YF5nfqqtxnPXlNzkPIxrUt0CjL9CCgECT?=
 =?us-ascii?Q?iHgUgFgRD/sC2YP1OWwGi3MgiP9dcxicMfKg5z+ZhtbZSkaU6W3qOCJjMmKK?=
 =?us-ascii?Q?BqjnX0MHNEsXt+G5ayuIRBmw3oCAys0o15mnn0gC9srrYos3S4gN3ViTv12Z?=
 =?us-ascii?Q?zVxJTKsPHpg6+BMjS+DgqFkMuRuAl+HA0KElKN9mdyThkO1nvy+5FILFdbgy?=
 =?us-ascii?Q?0tDECuAgrid1hvjrPTd/aGfu7LtNHEocq4/BNPYgJ6Tpic0w8hKnjOJ5N3Am?=
 =?us-ascii?Q?jpBniuxGJIsbVSWZLzVe7TvOIvlqdrB461Izr+7Yyf5kApfwHDBbcvzfpxX/?=
 =?us-ascii?Q?9QKOagBRi6/IcVdbGvrysYvmfqSw380rkZU+RPS47C0lEnPf1Y1oNNISSQH+?=
 =?us-ascii?Q?Mxz+7Saf/Ptt+bDSWRT/hJn1mOM7V6y5/dVYhwiu7xS6toX7U/Ihpi3BEOAh?=
 =?us-ascii?Q?ItkZJT10CvR0WbMDzgGLmcNo0N3jdrKO1AN03LUOs4x9L4HYWDDMX/0JmIGc?=
 =?us-ascii?Q?OaO/GRdPew/3jAsP18jWskddBIQ2mUIIvMMF2X8klHMM48hHhIYmCzZz9ncm?=
 =?us-ascii?Q?h7pV0QRK+krzdQujHupecTR6vOYCRvPSCa4XcDzP/wakmC/a4H89inppC1wq?=
 =?us-ascii?Q?YFPE7vo0EN6YLsi1ViHQ6uO9rZyAfUkct8oOLSN0wn21ps0tFlfzEfC1SQuW?=
 =?us-ascii?Q?42mef5zfaSeb9DwbT2ZsCVYsvrvSiRvrNS6RGnvNbZlBVJbedFH/1dk+aVM3?=
 =?us-ascii?Q?LZnBtl8xAomLzUVzuEvuZLV8tB++mXQXGkMumMldO86mfm1IzQSgNjw1FZfb?=
 =?us-ascii?Q?DCWFYYNn1k44ZrSS57iVPwyU/zaQYS+t1ik1q/VaXQg31dYUfv9Jfb4sblLW?=
 =?us-ascii?Q?QarP6trZyR/5n0yZlVtUN9urQGHdfxrjJq3z9479uQWgznjgE/21RKtA9uIs?=
 =?us-ascii?Q?Sn+Y+qnOsVnq1xstUObmqmEuK3c0SIvf3hc4PZx5Oc2dP2zaN9yoyjY05fcG?=
 =?us-ascii?Q?jQUyLIs0sah/1R8SMbS3V+8LWES5Fd+sBsvc8t9JxyvfrJeWc8UKrDgaCL2Z?=
 =?us-ascii?Q?+bzbKWLpLe/qd4P0Q28KyI3ZuPYiDN4ZnqBV5TgmPJeb28Kwq2gpxbuOoAe/?=
 =?us-ascii?Q?c6NMhfXFOlAX0rtDqdrLmKtsNDcCn38ip8Y5Q3JdmOKd08QjoUuM9p0eyWt+?=
 =?us-ascii?Q?9goin9uPhE1+UT0UqTwnA7rkBXSmKkcYgZ+tQRckPzACWo5dk1BmNNcZ6xwU?=
 =?us-ascii?Q?B4OG0Shu18CH8Y4/1jWuToCy/ATse6+WEhG83QlMh46bfIMqMIogNmMDghAn?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab0ef60-e7ec-4c35-0544-08dcf7bffaa4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:18:29.8337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FL8XeiWTOlu2ySkzbWXexKWxfXJbMPNaSHZoKVln47PeQmjCDDYFLO4ICJyGylwz7LrHEI2tM6AT+/6RHjhtlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6193

If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
txbuf_len are uninitialized. It makes no sense to print message header
and payload. It is also not safe to print uninitialized length of ram.

Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 5b7f52b74a40..53c2180a773a 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -221,7 +221,7 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 					  unsigned int negotiated_rev)
 {
 	struct device *dev = pmic_typec_pdphy->dev;
-	unsigned int val, hdr_len, txbuf_len, txsize_len;
+	unsigned int val, hdr_len = 0, txbuf_len = 0, txsize_len;
 	unsigned long flags;
 	int ret;
 
-- 
2.17.1


