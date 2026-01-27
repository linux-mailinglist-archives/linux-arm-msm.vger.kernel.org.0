Return-Path: <linux-arm-msm+bounces-90644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCWoC5kveGn5ogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:23:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8FE8F844
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1E25300E1A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EF230AD10;
	Tue, 27 Jan 2026 03:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEfLoWp7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMhJBWSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333030AD02
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769484164; cv=none; b=B6NVjSaMKcV2v281xEfDA8x6xBew1Oms0z3l1inoXdCEYZX1uaRiM7q1DEqcxRW78Do97vnUuRfJ4aVGZX6C0nu2ckaeXOWssLueUwpQE6PooYpd6drQZjvvdLvOOriBlifwJ0E4kgFcI6oeJ2bOVkxG36/NX1ErzKjlPerC+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769484164; c=relaxed/simple;
	bh=PGyU7zC1OgweTH7uihsfCjypZ9CAWazTXAAr3xoSfIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwhBBOxXONIGvYxrDGCzazmQA7Y9g7g/Khrw5QvIByVdFIjDG0vaxvqqtdH7eWAk9aA+47X5FQiPZmsFqgC79DPfSiiLul+hAYoLZqGdsi8TyHasr79qOgDGHkqsSxyuRa7c0JuIIpI7vJj0DqINh//Kz7mvhJe789AG6Il2cpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEfLoWp7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMhJBWSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKg9Jj2879718
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRWtTSxZKt9shz1rrr3v/9A8UR0BGn1xkHJq01jFs8o=; b=IEfLoWp7HbnQ7ce+
	xVoxqzxmVyfb5yK4r2kavQBfvE1H/Rmap3ZpJaN8VS/8JtQ7ViAMpvoOmcGwHumy
	65Y83DnQLm/93R72MeeyojWvhmXrMC5Hs8+YjlpNLx8ga5I/Ilb4skAuTZUp54F8
	PWTCBBU/lPqobpmhZ4gRnpHs9fUqojvpI7yBk0cST618p+gJCeuLLqxYQPil86ud
	4SlDEa37PErp+kUaotMIFTN1BuLwoaShu0gPZvJ5WoILsKwW7mrSjSjmWDDNNS69
	Wx2NJq+r3jGNwNiF9piac4i086bRhXkwq+zOodFXqU8J3j6hEL3rfwNsy4SR5Wzo
	t7zBkw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs0wdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:22:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso94306655ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769484158; x=1770088958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRWtTSxZKt9shz1rrr3v/9A8UR0BGn1xkHJq01jFs8o=;
        b=jMhJBWSdX7wldatwlUq6Dft9ToqJJqD/cyF/XJEhiNTRO48CCVlRLzAOLtJdzeV6tB
         sYEmlZUpAi2yPBBMGnFsmvTOA7iTJchFsJCbuV06yNW/cwX578UVeu9CjEsqMg7nXk3y
         scSJCMrtwlNoWRvFH9LJPWnq7RvyVfmKeEwjjA8VHZD4mKGJuS5H3bPVe3oyMmNB6mUs
         lawFnpOmDb6Rp5ocURZoosEViLHBfXSn0bFwYyqSjRX9E/EgoHCqbh+MDaYRYQ2k9/jS
         /Chw4WvOzJvFK7PGpt7aQcrhessBlXv1Z00cGDsIYGZxS6ZSGcU7Yl8GtXD8L19bA2uQ
         QMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769484158; x=1770088958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRWtTSxZKt9shz1rrr3v/9A8UR0BGn1xkHJq01jFs8o=;
        b=qg2+oHMwhWMxWCp0JUliGeFpNTpxz4drCeMgoVEEyF+11GsB0N+eEqkdqfKp1eIiV8
         IoklPq6CEceJa1dYwpsSv33QH57ZDTrpdsJXM4InVVDeVzMKZEm39YV2mbpR0kCYnWoR
         9VoxK380vYl+YWWZS9DMGCRUQVJ1t2MqxeYgkQKdS1UyoSpnau6DxJQLOl7PeETpOlRq
         PD1cnYeUK7O73PFLZJ5MI05wzgn+wB9A4DRJn4MM8gblbR+Tns1UaKk81KJYOOOhMdgb
         oFlPT7Lk14bzg16IakUtRqm4LoJpnD0VnB3PSX9TARv8ahQUNuIGKrfusnlvxrqEpsTI
         dHAg==
X-Gm-Message-State: AOJu0YyVubzWx2ooTke1p9vEj8wAg4nxyb8z+5fuwWeAzjoPQqksFxWt
	lPK1M2eTGvbJD5BndZvgWJm/uP7XUUeF6a3pQrma6zgJecEJayI396ZIN2fxKoBAe/SdkdA2UZ/
	wBGODwNylemrZN/tHXb4mTP5cNiNMXWd4RQCBCtGUzDZtZEZCs1H7yMAq2Pp5rxqNRAI0
X-Gm-Gg: AZuq6aL9EaI06KIyFbmSDBujlRwQJGZu651IwnUbRFI8ax3h5c9EYxVhTbxTToIH7GI
	05NSVqCPmIlrPpu7qgWhY1GbjgG6XykInIdkFXAAbpc2S34U+4zp6YT4K6Kvu/c51Hu38YucIZA
	7spcV2UN9l5yyttKDQHmrpvzi2YtJYKrSwYUmQ76fd4eYXXFcd/T8DIQLDN6mDz7plkU8FQIXrx
	AxH6FK9jkiv1jbyxstbHZKZqjLZWY0IP1BvtDpU+GXVAZqG2xi41jpHpY0VL5VlLutlBtbSRNgs
	9ddshjyE5i8ioNYBifIGK7DdLpfOJ5Ogsq6ZhYKDo+Al7n3gexzFtD1hJ7ivmKg8kp07Z3F+bpj
	fy2rdoPH5+rEhzXVNQovI0q41B2NTPTMc
X-Received: by 2002:a17:902:c942:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a870d32b82mr3996975ad.2.1769484158212;
        Mon, 26 Jan 2026 19:22:38 -0800 (PST)
X-Received: by 2002:a17:902:c942:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a870d32b82mr3996805ad.2.1769484157710;
        Mon, 26 Jan 2026 19:22:37 -0800 (PST)
Received: from [169.254.0.6] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa874sm101341625ad.13.2026.01.26.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 19:22:37 -0800 (PST)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 03:22:07 +0000
Subject: [PATCH v2 2/2] interconnect: qcom: glymur: Add Mahua SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-mahua_icc-v2-2-f0d8ddf7afca@oss.qualcomm.com>
References: <20260127-mahua_icc-v2-0-f0d8ddf7afca@oss.qualcomm.com>
In-Reply-To: <20260127-mahua_icc-v2-0-f0d8ddf7afca@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: RAnf40L8DNT1TZTpKhy44tM1NUuIDgTW
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=69782f7f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=niA-Db4sJa1Ec6H3ubUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: RAnf40L8DNT1TZTpKhy44tM1NUuIDgTW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNSBTYWx0ZWRfXwKnsFv5K4Yqg
 0wJ3YpogKSULRcMv4dBzL3wqMzsgpRS7JwBmICZg2R8rQou9sfv7Pew3LkCfKYtzbkeNY9Z23MN
 35MoGOuKf6u8agSVjJqsRhSAWQDswvjlW1dJ+kjYmy3fYZfAmf7hFyUWW8f9jJVExOYOYTJjkeE
 D2pOgF1oAsCDLzJei4iTe7gAKtTxNEMP+ecSBUQcdzneRUy2yysu5QOrxUZY8iajHhAoRWXLChM
 yB78XV4ZeUhn+CXD4c+pYB1AuX447taBgE6f6RSGdK36/8nZ/G9vKmfdqXAUyKdi8qm9d98OCCX
 kbtfxoRqZxOR/zsyDSeyZ4KH5LmrR9me/BLX9h82Dps4hrWxXKOVDp8LeuS7udkscdhUIPsnUSB
 tYaX8K3/kh0clBjRfFPB/f4lk1RWgwPJrsRqcBPbOTplxgEgDrpJSLjnvuUpe1ZYsbvpOtplHyt
 rVhlTSlCOm+5EytQbsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270025
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90644-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F8FE8F844
X-Rspamd-Action: no action

Mahua is a derivative of the Glymur SoC. Extend the
Glymur driver to support Mahua by:

  1. Adding new node definitions for interconnects that differ from Glymur
     (Config NoC, High-Speed Coherent NoC, PCIe West ANOC/Slave NoC).
  2. Reusing existing Glymur definitions for identical NoCs.
  3. Overriding the channel and buswidth, with Mahua specific values for
     the differing NoCs

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/glymur.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/qcom/glymur.c b/drivers/interconnect/qcom/glymur.c
index e5c07795a6c67ab8a59daf2fc4b8a5fa6dd014d6..cfe061c1a75a692c252c4a0d4ea63e71308223ba 100644
--- a/drivers/interconnect/qcom/glymur.c
+++ b/drivers/interconnect/qcom/glymur.c
@@ -9,6 +9,7 @@
 #include <linux/interconnect-provider.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/property.h>
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 
 #include "bcm-voter.h"
@@ -1985,7 +1986,7 @@ static struct qcom_icc_bcm * const cnoc_cfg_bcms[] = {
 	&bcm_cn1,
 };
 
-static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
+static struct qcom_icc_node *cnoc_cfg_nodes[] = {
 	[MASTER_CNOC_CFG] = &qsm_cfg,
 	[SLAVE_AHB2PHY_SOUTH] = &qhs_ahb2phy0,
 	[SLAVE_AHB2PHY_NORTH] = &qhs_ahb2phy1,
@@ -2093,7 +2094,7 @@ static struct qcom_icc_bcm * const hscnoc_bcms[] = {
 	&bcm_sh1,
 };
 
-static struct qcom_icc_node * const hscnoc_nodes[] = {
+static struct qcom_icc_node *hscnoc_nodes[] = {
 	[MASTER_GPU_TCU] = &alm_gpu_tcu,
 	[MASTER_PCIE_TCU] = &alm_pcie_qtc,
 	[MASTER_SYS_TCU] = &alm_sys_tcu,
@@ -2377,7 +2378,7 @@ static struct qcom_icc_bcm * const pcie_west_anoc_bcms[] = {
 	&bcm_sn6,
 };
 
-static struct qcom_icc_node * const pcie_west_anoc_nodes[] = {
+static struct qcom_icc_node *pcie_west_anoc_nodes[] = {
 	[MASTER_PCIE_WEST_ANOC_CFG] = &qsm_pcie_west_anoc_cfg,
 	[MASTER_PCIE_2] = &xm_pcie_2,
 	[MASTER_PCIE_3A] = &xm_pcie_3a,
@@ -2409,7 +2410,7 @@ static struct qcom_icc_bcm * const pcie_west_slv_noc_bcms[] = {
 	&bcm_sn6,
 };
 
-static struct qcom_icc_node * const pcie_west_slv_noc_nodes[] = {
+static struct qcom_icc_node *pcie_west_slv_noc_nodes[] = {
 	[MASTER_HSCNOC_PCIE_WEST] = &qnm_hscnoc_pcie_west,
 	[MASTER_CNOC_PCIE_WEST_SLAVE_CFG] = &qsm_cnoc_pcie_west_slave_cfg,
 	[SLAVE_HSCNOC_PCIE_WEST_MS_MPU_CFG] = &qhs_hscnoc_pcie_west_ms_mpu_cfg,
@@ -2470,6 +2471,28 @@ static const struct qcom_icc_desc glymur_system_noc = {
 	.num_bcms = ARRAY_SIZE(system_noc_bcms),
 };
 
+static int glymur_qnoc_probe(struct platform_device *pdev)
+{
+	if (device_is_compatible(&pdev->dev, "qcom,mahua-mc-virt")) {
+		llcc_mc.channels = 8;
+		ebi.channels = 8;
+	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-hscnoc")) {
+		qns_llcc.channels = 8;
+		chm_apps.channels = 4;
+		qnm_pcie_west.buswidth = 32;
+		hscnoc_nodes[MASTER_WLAN_Q6] = NULL;
+	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-pcie-west-anoc")) {
+		qns_pcie_west_mem_noc.buswidth = 32;
+		pcie_west_anoc_nodes[MASTER_PCIE_3A] = NULL;
+	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-cnoc-cfg")) {
+		cnoc_cfg_nodes[SLAVE_PCIE_3A_CFG] = NULL;
+	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-pcie-west-slv-noc")) {
+		pcie_west_slv_noc_nodes[SLAVE_PCIE_3A] = NULL;
+	}
+
+	return qcom_icc_rpmh_probe(pdev);
+}
+
 static const struct of_device_id qnoc_of_match[] = {
 	{ .compatible = "qcom,glymur-aggre1-noc", .data = &glymur_aggre1_noc},
 	{ .compatible = "qcom,glymur-aggre2-noc", .data = &glymur_aggre2_noc},
@@ -2477,12 +2500,15 @@ static const struct of_device_id qnoc_of_match[] = {
 	{ .compatible = "qcom,glymur-aggre4-noc", .data = &glymur_aggre4_noc},
 	{ .compatible = "qcom,glymur-clk-virt", .data = &glymur_clk_virt},
 	{ .compatible = "qcom,glymur-cnoc-cfg", .data = &glymur_cnoc_cfg},
+	{ .compatible = "qcom,mahua-cnoc-cfg", .data = &glymur_cnoc_cfg},
 	{ .compatible = "qcom,glymur-cnoc-main", .data = &glymur_cnoc_main},
 	{ .compatible = "qcom,glymur-hscnoc", .data = &glymur_hscnoc},
+	{ .compatible = "qcom,mahua-hscnoc", .data = &glymur_hscnoc},
 	{ .compatible = "qcom,glymur-lpass-ag-noc", .data = &glymur_lpass_ag_noc},
 	{ .compatible = "qcom,glymur-lpass-lpiaon-noc", .data = &glymur_lpass_lpiaon_noc},
 	{ .compatible = "qcom,glymur-lpass-lpicx-noc", .data = &glymur_lpass_lpicx_noc},
 	{ .compatible = "qcom,glymur-mc-virt", .data = &glymur_mc_virt},
+	{ .compatible = "qcom,mahua-mc-virt", .data = &glymur_mc_virt},
 	{ .compatible = "qcom,glymur-mmss-noc", .data = &glymur_mmss_noc},
 	{ .compatible = "qcom,glymur-nsinoc", .data = &glymur_nsinoc},
 	{ .compatible = "qcom,glymur-nsp-noc", .data = &glymur_nsp_noc},
@@ -2490,14 +2516,16 @@ static const struct of_device_id qnoc_of_match[] = {
 	{ .compatible = "qcom,glymur-pcie-east-anoc", .data = &glymur_pcie_east_anoc},
 	{ .compatible = "qcom,glymur-pcie-east-slv-noc", .data = &glymur_pcie_east_slv_noc},
 	{ .compatible = "qcom,glymur-pcie-west-anoc", .data = &glymur_pcie_west_anoc},
+	{ .compatible = "qcom,mahua-pcie-west-anoc", .data = &glymur_pcie_west_anoc},
 	{ .compatible = "qcom,glymur-pcie-west-slv-noc", .data = &glymur_pcie_west_slv_noc},
+	{ .compatible = "qcom,mahua-pcie-west-slv-noc", .data = &glymur_pcie_west_slv_noc},
 	{ .compatible = "qcom,glymur-system-noc", .data = &glymur_system_noc},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qnoc_of_match);
 
 static struct platform_driver qnoc_driver = {
-	.probe = qcom_icc_rpmh_probe,
+	.probe = glymur_qnoc_probe,
 	.remove = qcom_icc_rpmh_remove,
 	.driver = {
 		.name = "qnoc-glymur",

-- 
2.43.0


