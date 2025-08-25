Return-Path: <linux-arm-msm+bounces-70625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F6B33E69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 13:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB9B3B0DAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AFF2EBB8A;
	Mon, 25 Aug 2025 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y75BQMgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374842EAB7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756122741; cv=none; b=YsussyWa3ZPXyxeIfbz2WhRT6FiPt8we2qL3qwpucMOPLnf6cVKYjI9KIslPhkvr+z9ipVOueWv+DdOOP4hhjqb35tyFbetyeWz/m8JqMNWZjvNs5tGgX0PLi9vEus6F+Z9/RmENpsDJhFqgQC+XhluwB08R2NqhL09Dd/tgKp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756122741; c=relaxed/simple;
	bh=QRUHF590CJTXODjs7DSRBmvWmre1qQeoCo95qiT9cFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddwpJYckIbR8Wz7vkEitL1t2/4oj8nKnX9s8lssXQaMeczp0NDNl4jeQVGPJ8QpxIpatTXeIHyzZBsAKVtCdNj+6/QX68mPAWuS/fEdiQOOpRauPMGNX/YMofeW+01UlDuCc+CNCxgep5J4a7O8QruC3FFS7haDHM7L4H11O3u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y75BQMgk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P83W8K010555
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXrtefYV/rer8ZU996F+Maf3mwsdsfGt4Sxy4lj7V/0=; b=Y75BQMgkquYZ+pgg
	F2ynAc8+RMPiKmquViVF2QxHh70CDJXLrJzJ86Y3bfXYQUtOGypUjMLrc7/zVgFv
	qlQpEj48Y6FKRm7QF1h+vgQniFpMRjJASqPsE5ex9MXfjTjO0mhgTG3C92uNrxvu
	714JBAhq/dgicuPZhNbVSHqob3gRxydW7Atcnk89vRF/hZxNb0pgJntqKew876Wr
	bKtELG4f3A/fCQaD8mxHzaQ+GNhmyQwAcM4VRIvmgPjxDhjMI8t4SGeFf/NkFGCj
	0K/Pt+iHn7i7G92LccGN/F92mK+0gaIh1gZxTzSrZqA6h9POdKiLWhn/7J3zeW+M
	wUj7Lg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfcych-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244582bc5e4so53897425ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 04:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756122738; x=1756727538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXrtefYV/rer8ZU996F+Maf3mwsdsfGt4Sxy4lj7V/0=;
        b=r0GIPR/3LsEts8W8fwXPGzXWr7bqt7qjQb0YZEhNnYBoMJ8vx3RHgtEKTxF3J9FE1G
         IMrmIEhHAjsFZCPhcxzPdNgFITHou4q7rwEYa3z+sRwZ0wuEy0ZpCVxaBYcioTaClAYh
         NuhjnQJqW4NFevtUGpYlgJX97nP0b3me6MtCNr3QKrz7RvVr0SR7FABZmSqouJ9ZKug0
         v/JEmVuzswon93AmQXZn/fY9iOCLOiJW4FP6KqP2VTi206T0gUr5YvEt9Wk1mUMlp7Vu
         bzT0dZpy9QgFKoY6Q70Mna1NZKHkO5zkOWLhPgFlMWA7+LlbYWubSsDTKg+KKO6g0eCt
         j1ag==
X-Gm-Message-State: AOJu0YxMLy/K2qgU2sEuVtA0HZPCed4cGCh8r1n1uBq5DbuA/X+85E/S
	TOLLmhKkaFrVnt7/htGWBOOmxLKySPfoqBGVBdQv4cinlxzraBLBKd86J3N20SoRWWfEdRMlqtD
	wdNyej5X7Dd/zSxnVMgVuNo+JS4V3xzaQLDALX62JN1z7YS74xv9wf8L6tGXfDcyxjHd/
X-Gm-Gg: ASbGncs6j/I6IfIACXJf/4HdfRkDAuy/hX4JHcDuqgGATcDP4J+i4TX5+Y7g3mT03dZ
	27tLGcFYA+oFDUr2zPArTNyhfaLBtUG5cxWKqXHYInj8tG9yXlCuhwKwG6ektrePDnrU1GkLsX3
	AwisSCcETSkHzVldygqlOEmwKFb4xQpgHLp30HsqypXBTAHPdiX2vIxJ5zfVK82Ln4Ph2sIezkc
	KWUt6UZmxnBsbPXERTDhJSYdAI1cU+I92QjcYml8kr4dnrMtGKAtdiHaTESVh5icyqInawQgSf0
	RM0W/SaSYODTxxXl/XmpdohBGTd8hU3003U1DemV3JWTunI+N1ot1Pj5udGBIjp6Gx2So1GS96n
	4NJ46FRT6SAFV0KPhZm3IUvdrAqc6hani3l0OObQ6DaAW/Lv19Ise1oiLGlHu3vwyZ8QvnfPRCT
	A=
X-Received: by 2002:a17:903:3843:b0:240:44a6:5027 with SMTP id d9443c01a7336-2462ee86251mr166388005ad.15.1756122737944;
        Mon, 25 Aug 2025 04:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZOHnBfa/nKEGaRv/PuhU1McCgGtecSv7aj2G8enwYdVtrs96Wb/j+o1Dlu9hGwpL3t7LJBw==
X-Received: by 2002:a17:903:3843:b0:240:44a6:5027 with SMTP id d9443c01a7336-2462ee86251mr166387635ad.15.1756122737478;
        Mon, 25 Aug 2025 04:52:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b521bsm67081015ad.60.2025.08.25.04.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:52:17 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 17:22:03 +0530
Subject: [PATCH 2/3] phy: qcom-qmp-usb-legacy: fix NULL pointer dereference
 in PM callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qmp-null-deref-on-pm-v1-2-bbd3ca330849@oss.qualcomm.com>
References: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
In-Reply-To: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756122727; l=1673;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6HKGGM9psY0kba5AoS6bL64REDMzFHyQyl4L0oj0wGs=;
 b=t9gbOuOWuPqyzh7BJf8Tkb8XTnTkURC0r0G+IhLlOAg1S8ZTgM4215mON2iWWPFN0bRGo3D0s
 QNu3E9YWadHBLCgGCGnNoYtvIMzJK02K+1zZ+Way7rxOPfGgKP7DGPj
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyjouw+5cJz0t
 nlRBCH9PR+uNZUolJUPkzMO7cLVP2gDFtaQIraAhARX5QGJh/DuATT9/N0fEwAskGJOoSans3NL
 xFuuW8N6fEuBvkgT67nCFjm2kLNp5e4kjCiVg57CORCxbxBynS6EqgJjfzdgISNqu/JxH3CEBRB
 8PABd6OmHVq4ldMif9CBOOpMa6axY385J27S7tfCB6Xf8LZYntKPkBFEF7D0Z72LxLwt45zUQI0
 67WYFD2DS3+iU87mhL1aKCBg8r/ptAH+sZearTVa+oMfQHCmIr1n6g6Vu/TCT9sP8XwNwwnDT1q
 hQEh2mAkiwnJregZsL2jAISVgAR58G5ebP0pTGMfoM04gN/yWPNs1S+Hd8HlHfIIYEfjFBdbw6J
 Bqy1nrAh
X-Proofpoint-GUID: M00tQzWAfBxINWowKrX9HvcZtl_dNw9W
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac4e73 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Jvf624gE4dKDwD2Vql8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: M00tQzWAfBxINWowKrX9HvcZtl_dNw9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>

The pm ops are enabled before qmp phy create which causes
a NULL pointer dereference when accessing qmp->phy->init_count
in the qmp_usb_runtime_suspend.

So if qmp->phy is NULL, bail out early in suspend / resume callbacks
to avoid the NULL pointer dereference in qmp_usb_runtime_suspend and
qmp_usb_runtime_resume.

Cc: stable@vger.kernel.org # v6.6
Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490cfd811635df8940de1b789e21b46c..ef28e59ffd58a12d6d416a553a3a478e9691b8c5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -988,7 +988,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy || !qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1009,7 +1009,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy || !qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1


