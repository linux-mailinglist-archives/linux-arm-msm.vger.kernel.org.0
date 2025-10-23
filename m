Return-Path: <linux-arm-msm+bounces-78542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4747C00792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A6D3A39CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA87330EF94;
	Thu, 23 Oct 2025 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2dLk21D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA330DD2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215178; cv=none; b=XqdiN3SOcwEhFxc1emiowMXfoEc73ebhbMUcla0YyOERTrcHm5bFuipBulna5ZQiRPWbB/wJMxJuIWmb3XlP7QzxAODEojmip9OaALL0bGPY0r79Azib/CSAVf4jGlvllzEMiyCtfU1ijr0YgsaysZaQO8Z65KxkF5mz/nRPeKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215178; c=relaxed/simple;
	bh=SejOUWbTAy/5ROULM2ELVlqM+FZ6nMOhFi6ugNEQavQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o99Lc9+BtjoJ7koRzWLnud3pOcWllIoTPlodrxldqCD//5FswrqK2OSqsCO9hhYxafK8eofOIhuAxheMO25OPwbjGWNDe+AKNSwgS4ncV8rjlXg7fbvJLc08rxyZQDlssHLjXJgwHhxji+sb+RfLgOrAoe5zHdN74tGcRxAKvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2dLk21D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6MC8a007454
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FajSm68u81z
	o6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=; b=D2dLk21D+aPzeguIg6XY3m9IK+x
	vNKSrzGTtSzyNDixO9MQPNzn9eQr4EOPkOMJTYKcSVHBzyYi/Mw1QlOprTyAYB4L
	EAoZVidPNo8NvmCdAyu81ha9+g1GCd80AiTCJg2P4PhEiDvAHWkxZOUikzaS6cxt
	cdoi9GDSlDrQTT60zYx9g9DfHuEpc4hazA5wFhhHoT6O3IDyuZj2D1NdUwXNFVos
	n8Vc546wV4VhKUm5h87Xgu96Gq8wTmTwbRD6QI2ISEaJ6oVV7vNPle1PiSUYzswU
	CJ1xTP+K85TjZQnwIk3g1IOfdkClPCzu827lapjBlCf1XICqIxQO8IVuFDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v34483ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e895a6ca73so4731061cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215174; x=1761819974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FajSm68u81zo6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=;
        b=l/MkMalnehQ9TsZ49rUBN3wTTUDKW2T58dShP+Use30sAjYESZnx0RrDXqg8tJ45W3
         Ox5z2T4KMgO16ZFAka+0iBatmZLuhsAZEiTZEkKomVW20cPuFnx0Qts+CP/3mBKwhUop
         avGY8zC6Pn62wTvytJ5wYKbtG9/VwtaF2ilk6//1Ty1RHU5Jb5IUw+yLlkUj8oFBI62w
         zPmIURhknqVZ9c/4Dvdz0w5pkkWRiS3goQpB5YO41GvALrUrcJxi6vAN73gmX3QauEkL
         Rdqu4a43aVOIM/i1+1yESsDiAhcDWLGpQ/Y6jp9bAKi70qLew6MD5FaWxJE6beDiM4sE
         wn9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU81947M0l9dTjaN3p4XsoYCXLe1QMtdjefD0q5bUHkOHHYJcDQOsunp44zxMzXUcspuNx77+DlTi/GLBTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTsev+QDsj8iBgQPRL5+T0DcqjIVyM/4jbWvqwlugVMB9oYim/
	gtVZSEZRXMNmIH2hPiTge5ACsrH36KgkhLYPrn/I0+hxQSmLrXCMxJ1RsGPyrA40Bsfs+qe4d/9
	nUdSId7mSbJ4zl1K/1pSct61TDc+NlGKIbahKYGQOxY7i4q3OWFbrw1hWOuvYVLy29rG/
X-Gm-Gg: ASbGncsBURx0OpidmyxoJIfJFO0jWhjb3YGxcp5X0h1VkTlvu+sOY1Opg0JuXz9TowI
	cHd6tX8HD+s9tuGo1mVfRbVclkzpFrR6yJqR65O1L3DUUKhoJe9UGTke9oXmr0qPXA6D7YT4m3b
	u2H1V6nNPINTOJ8MADlp7J5xGthaL8e3vW+VAxp/bkIqepew3Pujs7YAj4bzi+faP0pTB+GnUgo
	uoa9EzRLycrijHHklyOh5txeZmREQYJVHoyPIA2X6K+2wa9Cqm5dECncKhB8rlVGx6zbNbBKJy1
	SAoZ1ea/TpsS0ryhA7+P496D/mu8gE0WgzYH58I5SurTQ6NttUon8R7eynwpPQ1n2eiAaAiH+1a
	3ic8TLt8VvngV
X-Received: by 2002:a05:622a:1114:b0:4e8:aa11:586a with SMTP id d75a77b69052e-4e8aa115bbfmr248237611cf.53.1761215174293;
        Thu, 23 Oct 2025 03:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLF+Hw8CW8MbahSfA8tACDLOuC6rzyi9L5cROc7gcuF/UeO13IMGr98DKx00AXgM1vVR7AVA==
X-Received: by 2002:a05:622a:1114:b0:4e8:aa11:586a with SMTP id d75a77b69052e-4e8aa115bbfmr248237361cf.53.1761215173810;
        Thu, 23 Oct 2025 03:26:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 15/20] ASoc: qcom: q6prm: Use automatic cleanup of kfree()
Date: Thu, 23 Oct 2025 11:24:39 +0100
Message-ID: <20251023102444.88158-16-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZSXockFTFeaQHmnsDOsvryekWGzgCXOa
X-Proofpoint-ORIG-GUID: ZSXockFTFeaQHmnsDOsvryekWGzgCXOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX0W6mPuvvCkZu
 s2Ptup9X+3oDMR+JSVLe/P/tE5zMDTEpAlBo4eKpE40cV9nw0NFuWODKEVM6cBRbYIWaZ2e0HWv
 p/qjq7ZdD6vyOEHRodnmYUHM1+AsoiSMLX6/L7moBjiunPQ0GHQ8ZCqqSUjmCUiujh9WY0zxE5j
 SAi07S2ZxHRCFQHm/TRLn5nTW+qcC7obzu4HUkRxK2B3XxrtFXe+kq/Df7g0H0mtvknxX4ZjaAM
 9MYf3xJmG7KDTt06EjTIIAZEC71ewlXWXfa8HUgWtJb2jNAXS1hxoBl2wfdrb2dWgS54IWdeqbt
 g+77xDF4o2MhbsIdluO4V0ENZ3RoqAxsdh7gAiPKZKMXyjeKvc1AnTDVyS5DUrZk3OB5Kv9usZH
 u8QSkgu7AI7HX3WZhsFHgplkEeDRLw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa02c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XDFA_cjcnCjOe_gdXw4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 81554d202658..0b8fad0bc832 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -62,8 +62,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 	struct prm_cmd_request_hw_core *req;
 	gpr_device_t *gdev = prm->gdev;
 	uint32_t opcode, rsp_opcode;
-	struct gpr_pkt *pkt;
-	int rc;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	if (enable) {
 		opcode = PRM_CMD_REQUEST_HW_RSC;
@@ -88,11 +87,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 
 	req->hw_clk_id = hw_block_id;
 
-	rc = q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
-
-	kfree(pkt);
-
-	return rc;
+	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
 }
 
 int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
@@ -116,8 +111,7 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_request_rsc *req;
 	gpr_device_t *gdev = prm->gdev;
-	struct gpr_pkt *pkt;
-	int rc;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	pkt = audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0, gdev->svc.id,
 				       GPR_PRM_MODULE_IID);
@@ -139,11 +133,7 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
 	req->clock_id.clock_attri = clk_attr;
 	req->clock_id.clock_root = clk_root;
 
-	rc = q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);
-
-	kfree(pkt);
-
-	return rc;
+	return q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);
 }
 
 static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
@@ -153,8 +143,7 @@ static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_release_rsc *rel;
 	gpr_device_t *gdev = prm->gdev;
-	struct gpr_pkt *pkt;
-	int rc;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	pkt = audioreach_alloc_cmd_pkt(sizeof(*rel), PRM_CMD_RELEASE_HW_RSC, 0, gdev->svc.id,
 				       GPR_PRM_MODULE_IID);
@@ -173,11 +162,7 @@ static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_att
 	rel->num_clk_id = 1;
 	rel->clock_id.clock_id = clk_id;
 
-	rc = q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_RELEASE_HW_RSC);
-
-	kfree(pkt);
-
-	return rc;
+	return q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_RELEASE_HW_RSC);
 }
 
 int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
-- 
2.51.0


