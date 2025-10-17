Return-Path: <linux-arm-msm+bounces-77721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A9BE7517
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4561E1AA1C9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39BF2D7803;
	Fri, 17 Oct 2025 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pnZsnm0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9232D663E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691396; cv=none; b=jySYeskjBEOnYVQBXz31E2Q4jjW33p7gRE6Z9q7+vGsVLqrsaRMTwYMdl+p6lCTeIcT3ujYTGvW4KgkkjIsKTg1QWYhvOa26b8KAbxw3Iku6r2d34vcb3w/rCiObM3BEAyKxBVX9D3sVhGvz19sA6yoeK6d49FZ/+H498CFYRuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691396; c=relaxed/simple;
	bh=SejOUWbTAy/5ROULM2ELVlqM+FZ6nMOhFi6ugNEQavQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPnRxle6aA4c+4SzWmiGnG2tyfQb20hugcwzwSSl/l0JxLWHBHGbKsG9jPUeKZW7VTvnks3Udek9ZZvQlz2aQsUfYyGVaBYh37XxlbRY8d3847p3YmFxyBAysP19ylgkFPcjyYd0blCzkMbxgAqgT1Es4vGU26BqeHLPxjw5dBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pnZsnm0+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8IP31002098
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FajSm68u81z
	o6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=; b=pnZsnm0+Hb9oR1wbNi8+epvF73q
	OKaznn8WpO/oRbhykSLFLstqhHiO3x2ZwjOa7ZdSIlIygv8mXovtCDE/ziu1uF9R
	rTzteedER6JV0Pbc3uFee0uvk8SDWaKhxtmQn+BGM1nvBSoKsPMDyM6o9DwaPdqr
	ggWcZzojk5J65TQccRFEKQbAMHA/JeZfNoOQ/wTP2g7Nph/J+7B8V5LveME1vXdc
	db/8dKg6VDn6JzfhdV5W1i47GpUffrB5yTCz1UjonGjlnVAA7lxkaX2yap7IokGT
	S4ZW74LFaMR/s3oMrVA0q4q+3keU2KujX5kyG1uq+fCneU7pQzt5fmSC72A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8kk2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87a0e9be970so57958726d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691392; x=1761296192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FajSm68u81zo6yJDj0yJMvUAWFriu/OwYH2XhH8JyXE=;
        b=sG2sjkl6h52IvqG5MxX3QfeubbfH0Qd4M7G/MypdrcnnbBHJW9eicNotNAU8I7038T
         4xfpNb8iH6/MAnKsF2wKX8tCTY6ow8J65o62ONeI/FkDaHt25DkFlx20iFX9fbtAZWzt
         X+PcCsbU8cyk2E5rUbCTjGstsnwgNlaZog66F8yb7j8IQ3c2Xt/juDgfxQofZ4CZCRoi
         22gGOBSqiNXaOOZO+UewH8gjBaj5fgjQmB2yq6KhJHNtcpq2H87rLIRF7RGshIBYBlXp
         nBf5tmyfLaU6sA9z98MkluvfC3zPgqRXK1vilLhrwQDptMv0hnnwyQLR5OsZ0s7ZjhrN
         Q/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCX309Qjkz94p0cZff09CxpzVaCluMpBzl/G4F6TSa3tQqzn0D4O8nLup9+KrHnt2X90iVD4QRYb05gEek5x@vger.kernel.org
X-Gm-Message-State: AOJu0YwxshFL+3ghBaeHHiJmSCjjQtHBK7v2711uqLvt2F0TluKpe13N
	pvx8n0/BIgQ+5vvHCponm5a2hPy3jEjB0aLiWEZ5/j5eDPW1aJQaK/by4iPIkoeri3IwbCwd2fy
	ae8bY3fk/esOmWJcnCTsCN5EIcTrGDBNDX5ClU29122FWELm7jc8K1TpOj/L8B1vRtLuajpCKkl
	Xs
X-Gm-Gg: ASbGncsE7YTfT4wlrI3Ml7o/H8cHhfjv2yElQIol0Nwx42xx0CPLBnCgW7JPH1yNnQP
	JuB28jKMgib9ObtFAAVKO1DAHvejPJ373pQ7nP7zDKF+GdpMaDjA4QyAGo5oPsQuwjIZSNQrwjA
	WdIwel964jCs2ardjep2rzU7EzJdeWB3Q+AmxdWBWgojeebdbnEkzbBlPCvlVcnT+ETpnKRsnnK
	DIusyM3mMv2Z38/oDWAAlXjQtx+Xf+5MTCA2ibgaadV0EEbzUdOHu2baHFxhXufsJIxPWgytQzh
	CTmmL4ZSF6G5Pp7AWkFZZNc+Xq/yeX7eQfrSjXjwNWIPhy59zT30dEacDjk1BofmVqXVuUX+do7
	jrh00dDgwihZB
X-Received: by 2002:a05:622a:587:b0:4e6:ed89:c014 with SMTP id d75a77b69052e-4e89d3a24c9mr33927961cf.55.1760691392397;
        Fri, 17 Oct 2025 01:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpa5jj8b7IDxg5bOjcWoHZU0OyEot5cPPW8i+SaTkYNxJ8GuekLCvVvjpxwIH4XJzYIX1FWA==
X-Received: by 2002:a05:622a:587:b0:4e6:ed89:c014 with SMTP id d75a77b69052e-4e89d3a24c9mr33927861cf.55.1760691391958;
        Fri, 17 Oct 2025 01:56:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 07/12] ASoc: qcom: q6prm: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:53:02 +0100
Message-ID: <20251017085307.4325-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jwo8PbwOhOyPiTKtWnfCJEeCVWAtO5Lm
X-Proofpoint-ORIG-GUID: jwo8PbwOhOyPiTKtWnfCJEeCVWAtO5Lm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX3LGpgmuoqhoY
 WPw+Qoa53L/Nr5B62G6Ww7NIK1u5p8kcij7z6NALfjmlHA2h+s1/fWzf8b03aR+A4DhWBiyIunI
 HNe5Uav/Byf7WTkv5bjXm5ptGNYzqYqYqUFMKPUXsCEAWVbX7f6c6oOTHFt3WjiahmDGvP66tdz
 TtRkzt9q/JJrh7R1c3+hhXcl4VY7HuwqCM8NDDVTfkXEQruwZlGGXjvF33b8rZbyLDjH8GAfUj8
 KWuQorV6XKGTCSXnYB8AanTm2UqY81z4QITqmVb9Y630MhqKFP7F89Zz+MYzbvRTqzbzGbrJh7j
 SzO8e8Dk1tVICmuRA7kBBSZo9Lntoqyglif/k83T7ML6Wf8+6ULPIPcQXFSYGPvwSFwW3/u3VDp
 yihiW0jk6mZIFDJDJO/UTlnD83xDwA==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f204c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XDFA_cjcnCjOe_gdXw4A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

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


