Return-Path: <linux-arm-msm+bounces-76913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDCBD12DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 586E818906CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820BD23C8C5;
	Mon, 13 Oct 2025 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYJ5yHnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC452D6E6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321351; cv=none; b=dtP4LlcFSb3x7Uq5d6TY01CpOqdMRGrBwEwI4ax/dZ5ZO1ObB64lZTU30r9iHFEqMOrTwtwxee5z+U6pPqfCJyX2emxcTTWECXUw0XpEryu5x2V78886DN5+btXJaewg3r/S2N8Pg9n4mUPB/oUMzDPULpTbIOZwshOi9z2jqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321351; c=relaxed/simple;
	bh=mRLMpwKjgcnX/KXWGMaxI3d6ArbBbdWV/nBhx9iTa/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=InTLMDohGNcE0igDOcRdV3Kf7BTv15f/KKjgwS/x5fB0Yz2Qe2EmbWPVMcYesKom3CgCRO69ASiSlYw3Cs7lj7N5axbrmNE/m17draEAXvVM1NkI7wrWOcR7K6lbwJYjd+ODT5SV3zeRLu+8wMPQk8SixOGE6Q9jhV2B3rVDaMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYJ5yHnI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CMmUam013330
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pALJ3CG570LA+ya1f9jVtp0uqrIfxfXGHOTMwpge4w=; b=eYJ5yHnIVXP8EH4Y
	ThraHmXYGYWUvQXG7dBw9DUZwoZxS1B8LTLWRFxpiEm7ZJf7rBG6Tm/IloyL8Y5g
	+9E4pymy6yFDcQkQGIHMOtS5aZOSGff3NL6ym6TH5CZxoD8/0Y24xRYQ3/O0TSNx
	676+Aoe31r9wa+wYNSGC24AbH+tRe3/en0SiF1vKQGH27L/e4rXrH5oVyPEaXrzl
	cRYnfB6zI/6wKkFaIyV+cgQA7tj1uev11ZSjJjFiAkhbP9+UA1cjcQwh0BlMVpe9
	Kzq1Ps68ILzg080kjyHhz86yOuvT6W6i/2LKStR4Vu4oCosYtuFoieIMrgZY2Rzk
	YzKETg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbs2y2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-818c83e607bso106717886d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321346; x=1760926146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pALJ3CG570LA+ya1f9jVtp0uqrIfxfXGHOTMwpge4w=;
        b=F0S4pMazrwNybEtF8MJkc24VCAnPDaH55zwKg0G/+VOPLeFRcSAY8aykdHr/2nNADV
         VWM9EgtApoGxSj2vnkGv8dAXp6jEJgy6vAl0oPVYDXWoMF/hmXjw5MTWFw2H0+afuLhm
         L73WWF42pZM+Or4acCwqsezEftT3L2krknTc1dac6HXreeGCHFO/nc13odYnd+RyKun4
         IWBp/S78M6ZsTrJ5nCssq6jkeiEvdPWARF6r6Ew7rQJ79+ksrFUgLSrAmuZBceHXwP1O
         XBHEOprjulECibt2hgXD3AEtX2KQMqtKvZcYju3fdQ7EWnYuYDQnN7LsIdTFln19bA0r
         cz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTIXmUEZ4tHA9LSOgG+YtpQSyQGYmvof+Uh31hVghS42wM/5IDNEioKG07BW1D8nlJVHndfhCJ5bjRIpwc@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPA8sTg99lyNaFk8Nv77eloNu+GsushOUXxj4bvn6tieUEskl
	cJHuBsHDqJhgsffX0OJBsEk4bkGPSwiG/XJ3SauVrJrJcs0V+VMThoovE4SkyLAS4Wg1vbRlYca
	M/GBY2aujLQkfYT2VJCvLJvU2Iz1ZB3Rvq8Es9rGdW35w5dICzL7uYofZvxWBtQU/wwBu
X-Gm-Gg: ASbGncsy+lCZdmL7609OvQZX+6CSFwNt7AYq6D0/KG7nZTVRoHTP7+IdqTaMu5H+UUq
	zba0HxgX/ePNdwz5C/9bBT2B/uuZc/mfZlRXEbSbwPX1YIISKWhoOHh+Y74ct9MDidAkoq6nUnm
	Zl6+Yke2K60TfY3+67HdkF73SA6BImaCMDw0aAonOuI+wf4ROVsgI9Ii0MWXpyV6h771/jlQOkn
	aMz19H2nC1F2sDN/09234l7uZICcRYOoXxpNJyy2s6NZh1zY1Rs8JVTaDuiFVWArClBZagtSeHG
	XTyMFU4CbWKkIVhmrryjdDDeSc++9Az60WwgIi+0ZdHRArysw9xIAVh/FheQlPOKZ2H5LfMAanq
	XLwuLpIXYfO3rJnS2CsELcbQvXzMEgUpLSJrgfE/fpx6dDOfPkEXZ
X-Received: by 2002:a05:622a:44a:b0:4e5:c50:54ba with SMTP id d75a77b69052e-4e6eada65ffmr262368381cf.48.1760321345801;
        Sun, 12 Oct 2025 19:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNiayHFUAFRg9GeafEySnh/+a6X2IPTx7offg1zvxmMm4+O2BU8AqJ1WFVuw01XCh8/Qz4pA==
X-Received: by 2002:a05:622a:44a:b0:4e5:c50:54ba with SMTP id d75a77b69052e-4e6eada65ffmr262368151cf.48.1760321345181;
        Sun, 12 Oct 2025 19:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:08:57 +0300
Subject: [PATCH v3 3/8] media: iris: stop copying r/o data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-3-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=30903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mRLMpwKjgcnX/KXWGMaxI3d6ArbBbdWV/nBhx9iTa/Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85+vyeh+j07kTYEsgMIVtCT6i8dJIVGAwgW
 AsUuOyhEBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1Yj3B/9/8KTqV50OW57zZhPDunuChedE2doWlrrZPvBv2+KQKm0kZU5Qf0J3zDpbaYrqciV+8+A
 K16sw/Ssg0UZhoh3vs8QyYHijMj768dC35SboLSnInbmv0dOAHATgIgA0Q1Ofi5iXI0cwFHmIzx
 2OYQIowL9BPoq5J2eBwT7Fg85vg97UEm1ciVnqnexSxQG0EL5Nw6QRYTYv5EPSbuhq7FhnpF8w6
 TQcec/GDICSrdV3qzXdLPmBIWIr/RTOFfrsC3d4s4s23qAkCQl5hl+GswsdQ4m6ZfFPU6i9MNza
 LatRqV/vZD9JxeWN5+IFRPJQlpqggAn3UpF2/gyGtBUAAtIe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+W1fVoUjpbBF
 xPWdHPYXtod58IJxO313iQsZHtM3oXJDbmXGNQAjXOdSi55KbUgDqjmv9uLc7yw2wiXZCJ/RF63
 hUiGGdV+Ev4Srr38AEh5h2acqJF1D4scgeB4eqfSOp7OSmH+zLTXm5Ytgmwnu4vwsZBTDjt4h4X
 dvFMMVZldsYYeO7GHZhk8tKmx2N8Q+kk3rxRjcvWOWyH0itwHRjPVhH5q08q+7tNuoZokny+JuD
 gd4aB/ioj/EtmZkYg9dBMMQBJUZ3Zl2Qrie19ucxpqPjKhPbTu+EFOXgehJ2829MK5+7mDvPOby
 HirGmOIWCIxkGjqHmKabiZCBAVOttydkImdtXU00F+REFcxQlx6DyNL0d7/wjICBgH5NDyuOwgi
 dnlQWQjKCNpsTnFCY9ISWjcDoy86vg==
X-Proofpoint-ORIG-GUID: GX0jmj_yVRtkjBmJfCHFcW3ta8OYrfEA
X-Proofpoint-GUID: GX0jmj_yVRtkjBmJfCHFcW3ta8OYrfEA
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=68ec5f43 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=qRUaz7MsY3PVI_3wtuEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Most of the platform_inst_caps data is read-only. In order to lower the
amount of memory consumed by the driver, store the value and the
corresponding index in the read-write data and use the rest via the
pointer to r/o capability data.

Keep all read-only flags inside platform_inst_fw_cap.flags and transform
CAP_FLAG_CLIENT_SET (which is being set per-instance once the client
changes any of the controls) into the boolean field inside struct
platform_inst_fw_cap_value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
 drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
 .../platform/qcom/iris/iris_platform_common.h      |   8 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
 6 files changed, 135 insertions(+), 128 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..b5037ae8c71921753c165a86a277a4a4b5083b30 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -115,8 +115,8 @@ struct iris_core {
 	struct delayed_work			sys_error_handler;
 	struct list_head			instances;
 	/* encoder and decoder have overlapping caps, so two different arrays are required */
-	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
-	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
+	struct platform_inst_fw_cap_value	inst_fw_caps_dec[INST_FW_CAP_MAX];
+	struct platform_inst_fw_cap_value	inst_fw_caps_enc[INST_FW_CAP_MAX];
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -194,26 +194,28 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
 	enum platform_inst_fw_cap_type cap_id;
-	struct platform_inst_fw_cap *cap;
+	unsigned int cap_idx;
 	struct vb2_queue *q;
 
-	cap = &inst->fw_caps[0];
 	cap_id = iris_get_cap_id(ctrl->id);
 	if (!iris_valid_cap_id(cap_id))
 		return -EINVAL;
 
+	cap_idx = inst->fw_caps[cap_id].idx;
+
 	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
 	if (vb2_is_streaming(q) &&
-	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
+	    (!(inst->inst_fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
 		return -EINVAL;
 
-	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
+	inst->fw_caps[cap_id].client_set = true;
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
 	if (vb2_is_streaming(q)) {
-		if (cap[cap_id].set)
-			cap[cap_id].set(inst, cap_id);
+
+		if (inst->inst_fw_caps[cap_idx].set)
+			inst->inst_fw_caps[cap_idx].set(inst, cap_id);
 	}
 
 	return 0;
@@ -225,13 +227,14 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 
 int iris_ctrls_init(struct iris_inst *inst)
 {
-	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
 	u32 num_ctrls = 0, ctrl_idx = 0, idx = 0;
 	u32 v4l2_id;
 	int ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		if (iris_get_v4l2_id(cap[idx].cap_id))
+		unsigned int cap_idx = inst->fw_caps[idx].idx;
+
+		if (iris_get_v4l2_id(inst->inst_fw_caps[cap_idx].cap_id))
 			num_ctrls++;
 	}
 
@@ -245,9 +248,11 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
+		unsigned int cap_idx = inst->fw_caps[idx].idx;
+		const struct platform_inst_fw_cap *cap = &inst->inst_fw_caps[cap_idx];
 		struct v4l2_ctrl *ctrl;
 
-		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
+		v4l2_id = iris_get_v4l2_id(cap->cap_id);
 		if (!v4l2_id)
 			continue;
 
@@ -256,21 +261,21 @@ int iris_ctrls_init(struct iris_inst *inst)
 			goto error;
 		}
 
-		if (cap[idx].flags & CAP_FLAG_MENU) {
+		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_MENU) {
 			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
 						      &iris_ctrl_ops,
 						      v4l2_id,
-						      cap[idx].max,
-						      ~(cap[idx].step_or_mask),
-						      cap[idx].value);
+						      cap[cap_idx].max,
+						      ~(cap[cap_idx].step_or_mask),
+						      inst->fw_caps[idx].value);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
 						 v4l2_id,
-						 cap[idx].min,
-						 cap[idx].max,
-						 cap[idx].step_or_mask,
-						 cap[idx].value);
+						 cap[cap_idx].min,
+						 cap[cap_idx].max,
+						 cap[cap_idx].step_or_mask,
+						 inst->fw_caps[idx].value);
 		}
 		if (!ctrl) {
 			ret = -EINVAL;
@@ -312,14 +317,8 @@ void iris_session_init_caps(struct iris_core *core)
 		if (!iris_valid_cap_id(cap_id))
 			continue;
 
-		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
-		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
-		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps_dec[cap_id].idx = i;
 		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
-		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
-		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
-		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
 	}
 
 	caps = core->iris_platform_data->inst_fw_caps_enc;
@@ -330,29 +329,23 @@ void iris_session_init_caps(struct iris_core *core)
 		if (!iris_valid_cap_id(cap_id))
 			continue;
 
-		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
-		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps_enc[cap_id].idx = i;
 		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
-		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
-		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
-		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
 	}
 }
 
 static u32 iris_get_port_info(struct iris_inst *inst,
-			      enum platform_inst_fw_cap_type cap_id)
+			      unsigned int cap_idx)
 {
 	if (inst->domain == DECODER) {
-		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
+		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
 			return HFI_PORT_BITSTREAM;
-		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
+		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
 			return HFI_PORT_RAW;
 	} else {
-		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
+		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
 			return HFI_PORT_RAW;
-		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
+		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
 			return HFI_PORT_BITSTREAM;
 	}
 
@@ -362,12 +355,13 @@ static u32 iris_get_port_info(struct iris_inst *inst,
 int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
 	u32 hfi_value = inst->fw_caps[cap_id].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
-					     iris_get_port_info(inst, cap_id),
+					     iris_get_port_info(inst, cap_idx),
 					     HFI_PAYLOAD_U32_ENUM,
 					     &hfi_value, sizeof(u32));
 }
@@ -375,12 +369,13 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
 	u32 hfi_value = inst->fw_caps[cap_id].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
-					     iris_get_port_info(inst, cap_id),
+					     iris_get_port_info(inst, cap_idx),
 					     HFI_PAYLOAD_U32,
 					     &hfi_value, sizeof(u32));
 }
@@ -389,7 +384,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	struct v4l2_format *inp_f = inst->fmt_src;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 height = inp_f->fmt.pix_mp.height;
 	u32 width = inp_f->fmt.pix_mp.width;
 	u32 work_mode = STAGE_2;
@@ -401,7 +397,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
-					     iris_get_port_info(inst, cap_id),
+					     iris_get_port_info(inst, cap_idx),
 					     HFI_PAYLOAD_U32,
 					     &work_mode, sizeof(u32));
 }
@@ -409,12 +405,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 work_route = inst->fw_caps[PIPE].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
-					     iris_get_port_info(inst, cap_id),
+					     iris_get_port_info(inst, cap_idx),
 					     HFI_PAYLOAD_U32,
 					     &work_route, sizeof(u32));
 }
@@ -422,19 +419,13 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	u32 hfi_id, hfi_value;
-
-	if (inst->codec == V4L2_PIX_FMT_H264) {
-		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
-		hfi_value = inst->fw_caps[PROFILE_H264].value;
-	} else {
-		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
-		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
-	}
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
+	u32 hfi_value = inst->fw_caps[cap_id].value;
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
-					     iris_get_port_info(inst, cap_id),
+					     iris_get_port_info(inst, cap_idx),
 					     HFI_PAYLOAD_U32_ENUM,
 					     &hfi_value, sizeof(u32));
 }
@@ -442,19 +433,13 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	u32 hfi_id, hfi_value;
-
-	if (inst->codec == V4L2_PIX_FMT_H264) {
-		hfi_id = inst->fw_caps[LEVEL_H264].hfi_id;
-		hfi_value = inst->fw_caps[LEVEL_H264].value;
-	} else {
-		hfi_id = inst->fw_caps[LEVEL_HEVC].hfi_id;
-		hfi_value = inst->fw_caps[LEVEL_HEVC].value;
-	}
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
+	u32 hfi_value = inst->fw_caps[cap_id].value;
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
-					     iris_get_port_info(inst, cap_id),
+					     iris_get_port_info(inst, cap_idx),
 					     HFI_PAYLOAD_U32_ENUM,
 					     &hfi_value, sizeof(u32));
 }
@@ -462,20 +447,19 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	struct hfi_profile_level pl;
 
-	if (inst->codec == V4L2_PIX_FMT_H264) {
-		pl.profile = inst->fw_caps[PROFILE_H264].value;
+	pl.profile = inst->fw_caps[cap_id].value;
+	if (inst->codec == V4L2_PIX_FMT_H264)
 		pl.level = inst->fw_caps[LEVEL_H264].value;
-	} else {
-		pl.profile = inst->fw_caps[PROFILE_HEVC].value;
+	else
 		pl.level = inst->fw_caps[LEVEL_HEVC].value;
-	}
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
-					     iris_get_port_info(inst, cap_id),
+					     iris_get_port_info(inst, cap_idx),
 					     HFI_PAYLOAD_U32_ENUM,
 					     &pl, sizeof(u32));
 }
@@ -484,7 +468,8 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	u32 header_mode = inst->fw_caps[cap_id].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 hfi_val;
 
 	if (header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
@@ -494,7 +479,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32,
 				     &hfi_val, sizeof(u32));
 }
@@ -504,7 +489,8 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
 	u32 header_mode = inst->fw_caps[cap_id].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 hfi_val;
 
 	if (prepend_sps_pps)
@@ -516,7 +502,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32_ENUM,
 				     &hfi_val, sizeof(u32));
 }
@@ -526,7 +512,8 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
 	u32 bitrate = inst->fw_caps[cap_id].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 max_bitrate;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC)
@@ -541,7 +528,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32,
 				     &bitrate, sizeof(u32));
 }
@@ -552,12 +539,13 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
 	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 peak_bitrate = inst->fw_caps[cap_id].value;
 	u32 bitrate = inst->fw_caps[BITRATE].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 
 	if (rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
 		return 0;
 
-	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) {
+	if (inst->fw_caps[cap_id].client_set) {
 		if (peak_bitrate < bitrate)
 			peak_bitrate = bitrate;
 	} else {
@@ -568,7 +556,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32,
 				     &peak_bitrate, sizeof(u32));
 }
@@ -579,7 +567,8 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
 	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 rc_mode = 0;
 
 	if (!frame_rc)
@@ -595,7 +584,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32_ENUM,
 				     &rc_mode, sizeof(u32));
 }
@@ -606,7 +595,8 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
 	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 rc_mode = 0;
 
 	if (!frame_rc)
@@ -622,7 +612,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32_ENUM,
 				     &rc_mode, sizeof(u32));
 }
@@ -631,7 +621,8 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	u32 entropy_mode = inst->fw_caps[cap_id].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 hfi_val;
 
 	if (inst->codec != V4L2_PIX_FMT_H264)
@@ -642,7 +633,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32,
 				     &hfi_val, sizeof(u32));
 }
@@ -651,7 +642,8 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	u32 entropy_mode = inst->fw_caps[cap_id].value;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 profile;
 
 	if (inst->codec != V4L2_PIX_FMT_H264)
@@ -667,7 +659,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_U32,
 				     &entropy_mode, sizeof(u32));
 }
@@ -678,32 +670,33 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
 	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
 	u32 min_qp_enable = 0, client_qp_enable = 0;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 hfi_val;
 
 	if (inst->codec == V4L2_PIX_FMT_H264) {
-		if (inst->fw_caps[MIN_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+		if (inst->fw_caps[MIN_FRAME_QP_H264].client_set)
 			min_qp_enable = 1;
 		if (min_qp_enable ||
-		    (inst->fw_caps[I_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[I_FRAME_MIN_QP_H264].client_set))
 			i_qp_enable = 1;
 		if (min_qp_enable ||
-		    (inst->fw_caps[P_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[P_FRAME_MIN_QP_H264].client_set))
 			p_qp_enable = 1;
 		if (min_qp_enable ||
-		    (inst->fw_caps[B_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[B_FRAME_MIN_QP_H264].client_set))
 			b_qp_enable = 1;
 	} else {
-		if (inst->fw_caps[MIN_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+		if (inst->fw_caps[MIN_FRAME_QP_HEVC].client_set)
 			min_qp_enable = 1;
 		if (min_qp_enable ||
-		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].client_set))
 			i_qp_enable = 1;
 		if (min_qp_enable ||
-		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].client_set))
 			p_qp_enable = 1;
 		if (min_qp_enable ||
-		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].client_set))
 			b_qp_enable = 1;
 	}
 
@@ -731,7 +724,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_32_PACKED,
 				     &hfi_val, sizeof(u32));
 }
@@ -742,32 +735,33 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
 	u32 max_qp_enable = 0, client_qp_enable;
 	u32 i_frame_qp, p_frame_qp, b_frame_qp;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	u32 hfi_val;
 
 	if (inst->codec == V4L2_PIX_FMT_H264) {
-		if (inst->fw_caps[MAX_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+		if (inst->fw_caps[MAX_FRAME_QP_H264].client_set)
 			max_qp_enable = 1;
 		if (max_qp_enable ||
-		    (inst->fw_caps[I_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[I_FRAME_MAX_QP_H264].client_set))
 			i_qp_enable = 1;
 		if (max_qp_enable ||
-		    (inst->fw_caps[P_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[P_FRAME_MAX_QP_H264].client_set))
 			p_qp_enable = 1;
 		if (max_qp_enable ||
-		    (inst->fw_caps[B_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[B_FRAME_MAX_QP_H264].client_set))
 			b_qp_enable = 1;
 	} else {
-		if (inst->fw_caps[MAX_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+		if (inst->fw_caps[MAX_FRAME_QP_HEVC].client_set)
 			max_qp_enable = 1;
 		if (max_qp_enable ||
-		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].client_set))
 			i_qp_enable = 1;
 		if (max_qp_enable ||
-		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].client_set))
 			p_qp_enable = 1;
 		if (max_qp_enable ||
-		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
+		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].client_set))
 			b_qp_enable = 1;
 	}
 
@@ -796,7 +790,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_32_PACKED,
 				     &hfi_val, sizeof(u32));
 }
@@ -806,7 +800,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
 	u32 i_frame_qp, p_frame_qp, b_frame_qp;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 	struct vb2_queue *q;
 	u32 hfi_val;
 
@@ -822,18 +817,18 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 		b_qp_enable = 1;
 	} else {
 		if (inst->codec == V4L2_PIX_FMT_H264) {
-			if (inst->fw_caps[I_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+			if (inst->fw_caps[I_FRAME_QP_H264].client_set)
 				i_qp_enable = 1;
-			if (inst->fw_caps[P_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+			if (inst->fw_caps[P_FRAME_QP_H264].client_set)
 				p_qp_enable = 1;
-			if (inst->fw_caps[B_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
+			if (inst->fw_caps[B_FRAME_QP_H264].client_set)
 				b_qp_enable = 1;
 		} else {
-			if (inst->fw_caps[I_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+			if (inst->fw_caps[I_FRAME_QP_HEVC].client_set)
 				i_qp_enable = 1;
-			if (inst->fw_caps[P_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+			if (inst->fw_caps[P_FRAME_QP_HEVC].client_set)
 				p_qp_enable = 1;
-			if (inst->fw_caps[B_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
+			if (inst->fw_caps[B_FRAME_QP_HEVC].client_set)
 				b_qp_enable = 1;
 		}
 	}
@@ -857,7 +852,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_32_PACKED,
 				     &hfi_val, sizeof(u32));
 }
@@ -866,7 +861,8 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	struct hfi_quantization_range_v2 range;
-	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
+	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
 		range.min_qp.qp_packed = inst->fw_caps[MIN_FRAME_QP_HEVC].value;
@@ -878,7 +874,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					 HFI_HOST_FLAGS_NONE,
-				     iris_get_port_info(inst, cap_id),
+				     iris_get_port_info(inst, cap_idx),
 				     HFI_PAYLOAD_32_PACKED,
 				     &range, sizeof(range));
 }
@@ -886,7 +882,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	struct platform_inst_fw_cap *cap;
+	const struct platform_inst_fw_cap *cap;
 	int ret;
 	u32 i;
 
@@ -895,7 +891,9 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 		return ret;
 
 	for (i = 1; i < INST_FW_CAP_MAX; i++) {
-		cap = &inst->fw_caps[i];
+		unsigned int cap_idx = inst->fw_caps[i].idx;
+
+		cap = &inst->inst_fw_caps[cap_idx];
 		if (!iris_valid_cap_id(cap->cap_id))
 			continue;
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 5982d7adefeab80905478b32cddba7bd4651a691..39d74bef4d188abb919c372b7529d1d0773bd96a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -82,7 +82,8 @@ struct iris_inst {
 	struct completion		completion;
 	struct completion		flush_completion;
 	u32				flush_responses_pending;
-	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
+	struct platform_inst_fw_cap_value fw_caps[INST_FW_CAP_MAX];
+	const struct platform_inst_fw_cap *inst_fw_caps;
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;
 	enum iris_inst_state		state;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5ffc1874e8c6362b1c650e912c230e9c4e3bd160..104ff38219e30e6d52476d44b54338c55ef2ca7b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -148,7 +148,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_MENU			= BIT(1),
 	CAP_FLAG_INPUT_PORT		= BIT(2),
 	CAP_FLAG_OUTPUT_PORT		= BIT(3),
-	CAP_FLAG_CLIENT_SET		= BIT(4),
+	// BIT(4)
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
 };
@@ -165,6 +165,12 @@ struct platform_inst_fw_cap {
 		   enum platform_inst_fw_cap_type cap_id);
 };
 
+struct platform_inst_fw_cap_value {
+	unsigned int idx;
+	s64 value;
+	bool client_set;
+};
+
 struct bw_info {
 	u32 mbs_per_sec;
 	u32 bw_ddr;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..72559497e81c30373711e9b113582039f1fb5153 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -55,8 +55,9 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 
-	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
-	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
+	memcpy(inst->fw_caps, core->inst_fw_caps_dec,
+	       sizeof(inst->fw_caps));
+	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_dec;
 
 	return iris_ctrls_init(inst);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 099bd5ed4ae0294725860305254c4cad1ec88d7e..3d1d481f8048305ef9a9bf0cb435ebca68563105 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -68,8 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;
 
-	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
-	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
+	memcpy(inst->fw_caps, core->inst_fw_caps_enc,
+	       sizeof(inst->fw_caps));
+	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_enc;
 
 	return iris_ctrls_init(inst);
 }

-- 
2.47.3


