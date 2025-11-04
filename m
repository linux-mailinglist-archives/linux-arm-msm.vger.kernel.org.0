Return-Path: <linux-arm-msm+bounces-80265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA6C2FC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 09:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45F79421037
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E9D313533;
	Tue,  4 Nov 2025 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wk9uq8uC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIUGAf3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD7310784
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243944; cv=none; b=G9hk4Ize9Xt2UoJeh160s/Brm1I7YFV1o4YuAJrK7D2Gvb+b6hPne5frPR52zsCxu8Wmbn4aOF8UT71sa0SXcNa3FMXwx2tDNcrGKvP7A1R705ART5kW3f77nj9Co842CMfRpl5cFtdTB+fX6bXzcMFr0dyN1/Zorbd3QqbX0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243944; c=relaxed/simple;
	bh=JQ5iyKLsbTvW1G+rebQp49wNfxcQrPn+UClBYzR7ixg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6QNley8wXyBktN32io/wvW6vTAvZ03x4sM1L6ABDfBY1+p1O+DgEJv+gPldhSlYFUUSBEhBjitaR7PXt7mYe+cl2N4OfMbKpbcEQocOrRam3yzdhXKzdf5GsrgUvXpIQaKoouG3QgJnDtjDJZ2H5BQZOds0YJxiwcufQ/7n+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wk9uq8uC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIUGAf3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A45GNUZ1060068
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 08:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugBW9Cv+1k8WLRXW2Hz0UY8b2KE1oQhBmaVaCghLSSQ=; b=Wk9uq8uC72ytAPiX
	ougrlx5Is1NjUU+RJ6Hi4rbssix+L4/ftfskr5BdyVJ9uxPWtEzZFuISmCTNblXK
	YOrrxbfut8+yQqz1Wm453yYjc8XmtGFbl25agKB0/BMVJ8lmF5xJVmjV94rwMcYg
	IVNDlNs1GjTp+Lo8nKbh4iOn/JtaxB9QEKiLnBA8RZHRFfoIHnVoUUGg0W0Ymez4
	hIa9xD8PcEZTqW8n6TMp4FC4JmDhgskR6wDSZZTKdXxrvwLDqnHz7oETu0tuuyT9
	rCEeBLek9j0IQVSKEgDehVpHhCMTvetbnHYtIm7HXwqRNa6aYoZjsrEuI/s3X2RY
	U4crBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7b6prex6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 08:12:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso2246006a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 00:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762243940; x=1762848740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugBW9Cv+1k8WLRXW2Hz0UY8b2KE1oQhBmaVaCghLSSQ=;
        b=CIUGAf3lWTplDFUpC8Uv4VNe+UUkkM57viVgkRuvChiJFmz/CnvXpgqAJZPdgVnUcr
         QVdkAQCgnNLIbkrqBU5x1mAwtGsReqW0S+5LP8eRDwRR3fayngNSqFeGzJdCkaiE//O/
         O6qut2Byu6wirA9ZX6XoJhIC0DzAn8IU0qkffsM9tyxNWHBGz/+oDYCpHJXODk3SzTeR
         wIP81pS5fEJIp8KlkStHkZEC8vThkcEDegDB6BBhY8snZCPIiySKNdnnU3xW7DpGXpXj
         /GglpoJRNIn2KseTqjGnoDtMk9GEsF4A9Q+HB7OiuTP7wl7EPqt05OiV5U3X1xg5JLp9
         oLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243940; x=1762848740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugBW9Cv+1k8WLRXW2Hz0UY8b2KE1oQhBmaVaCghLSSQ=;
        b=tO3pbb32+PyZ7UR22MjpG2L+EZifzzQ8enDgAJ4lXJArKxucPV/ZpU8IzuALy59VZf
         FTiGV5+b+60c7Afgm2cWaeab3PIbALnIr6wmZ4tLEMJfBK318yxJ1WzN3G0SqGrGPKF/
         eGWzDL+IJHQ9mRUpy2iVIZdH+PoDZofuzmlD+WyAQKP6w8IJEqagzzHTIJj5D5kRiEny
         74onymJ5IX7lL5ErnNQdaQFGYASFLOgeO+htkGqexW0SRJ+RFnz7svGH8XiUTqVf70IM
         n2Rcj/34+AtiWrPaCm0qNoGHV3y8cGl0LYWmJS6d/mMUWPCPShOGa3kp9GzCnZ/H1KFb
         C+rg==
X-Forwarded-Encrypted: i=1; AJvYcCWfXafbpEQw0Q7RkMpbWdDZN8vkUfqG3KiIpF74xtFl5rCcoLhTNtnRaChRhuozBY9I9kTAsGkkBxYnssVb@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDgRbAz0f/FJ21DSkm65ZA5ypFdAnBVk62r8BL17KAKRX1law
	3SM+E2qklD2Ddkh2X4odFn1gdMMxeXjHrVkFV8E304PJPY4b9xdy8OqslY7IKg+ppBJRZNs9IWm
	G+gdYBGPzfjV897Tv5spIuvRWIT5Cn9Ulg1THgYxMI5yOqIHpbJRlzdMs8I9UuiyIgvKc
X-Gm-Gg: ASbGncuKwHYQ8wsisWqhxTqzGCV/5XiV6UHM/7M4EkwizCByjXuZ+0GsqBGnz8IMA22
	QXfEgx4Qe5V/ZoIKa9lp9K1VuW2hNFaqRKFgH8nOzU4sGTemVp2xnS6jLh4Y37qYEs/JyUpVY9a
	dWP2x2J6QyopR5Xy2otdqtCBNxts8vXiTD47xq11tDOSYYxLxp7VY+OUd4kFSEg+xSwad928qGN
	F6T43plntuta5jgrhEpzvF+K/B7KBbtyzCjl7SV8WgZkBswRfWHzOuP+JEv4fgg+CvqbEfhQydY
	Lb63esAzK1hMMjZKYpIV5/FVXUC+pQK70jefB6BYiLnbkW+Z35nIv0weJy6tcU/hemdtcd66yGW
	F5swXVUbTGCD0TTWhed9n4SFR/9R1wF0u5VPGfbafmqUFf5mQFGoJ/+o9uQSbOOlnIG6Ta9CDHA
	==
X-Received: by 2002:a05:6a20:9148:b0:347:5ce0:6dda with SMTP id adf61e73a8af0-348cab898f5mr20573604637.14.1762243940176;
        Tue, 04 Nov 2025 00:12:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5bfFtNBYqevdkYDfgf7ExrTqBd5tClyrln0y016wZSMF6sJh7IQ9XqH3IOPfFY1XSFg/aIg==
X-Received: by 2002:a05:6a20:9148:b0:347:5ce0:6dda with SMTP id adf61e73a8af0-348cab898f5mr20573558637.14.1762243939679;
        Tue, 04 Nov 2025 00:12:19 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415a1c2f12sm3601755a91.5.2025.11.04.00.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:12:19 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 16:11:49 +0800
Subject: [PATCH v3 5/5] media: qcom: iris: Add intra refresh support for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-iris_encoder_enhancements-v3-5-63b0c431b4d0@oss.qualcomm.com>
References: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
In-Reply-To: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762243916; l=6329;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=JQ5iyKLsbTvW1G+rebQp49wNfxcQrPn+UClBYzR7ixg=;
 b=TcK//9baQOw2TlSEFWyDTK/iUPbdeGNoVkJeKYT80uYvrw+VWtJgVt8a+NWPUMQolPWRBifcc
 kYREASxZLX+CE0/x/albrrqVgEf6dptdKQFNcPUbFBNJ600x8zNras3
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfX+gDI/PQoWvX4
 PmkIkpzjcrHTpJyUKWIULMZeEceS0yz4896C7cuaWzDwmaxYhNCLr0iwio0ELiozMxvbFRzyAeu
 8AO7TLr1dLvOyF/Ee14/f7M40xsIfKxOa6B6yxo7rzAd0fF+BuXBrmKXfTsAkmzf/vWMIaDyjMQ
 dMMuPE2u5hDnE3olyWa5LDWiv1TeuLNJhGCHi2xkcs6ESl1/ecfIQepiWnHx6D56BnxJjr2unAD
 0a/uV6W7tfxhU8XcPytxWYxCTk0cXDcc5B3x+5Sa91f7J0BbtKAMCJdgSH7iceMA6vkrsNEo97R
 xDU28E5gTM24ub241O/X79YrY9bhOrmXDqUUE8DvGgq3T18Cv6zI9ldFSAi8AYJX3pzOoGHa4su
 Aa8pnsw8Gqj13vjdA35Pog/mBXqQMQ==
X-Proofpoint-GUID: mB7MsAE7wTbAry1Bo_yOL1pBC3Skvf_P
X-Proofpoint-ORIG-GUID: mB7MsAE7wTbAry1Bo_yOL1pBC3Skvf_P
X-Authority-Analysis: v=2.4 cv=Y4L1cxeN c=1 sm=1 tr=0 ts=6909b565 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=-vM60OG-bLC5KXgFrusA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040066

Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 33 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 19 +++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8f74c12f2f41f23d75424819c707aff61ea61b33..14891569247318aaa7b2009b737f077d1cb45095 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -104,6 +104,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return HFLIP;
 	case V4L2_CID_VFLIP:
 		return VFLIP;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+		return IR_TYPE;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		return IR_PERIOD;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -197,6 +201,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_HFLIP;
 	case VFLIP:
 		return V4L2_CID_VFLIP;
+	case IR_TYPE:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
+	case IR_PERIOD:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
 	default:
 		return 0;
 	}
@@ -944,6 +952,31 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 ir_type = 0;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		if (vb2_is_streaming(q))
+			return 0;
+		ir_type = HFI_PROP_IR_RANDOM_PERIOD;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		ir_type = HFI_PROP_IR_CYCLIC_PERIOD;
+	} else
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, ir_type,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ir_period, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 355a592049f3fcc715a1b9df44b4d1398b052653..9518803577bc39f5c1339a49878dd0c3e8f510ad 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,6 +34,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 0f92468dca91cbb2ca9b451ebce255180066b3a4..9e8fdddf2aef439e7f133c9bb2fafa6d95062b02 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -70,6 +70,7 @@ enum hfi_rate_control {
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
+#define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
@@ -108,6 +109,7 @@ enum hfi_flip {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
+#define HFI_PROP_IR_CYCLIC_PERIOD		0x0300017E
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 284d6bde6d6bcdf70016646d1c92e6ae7f067efc..30b98e769ad34c2b63dd63e7714bfeaa5b4f162c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -143,6 +143,8 @@ enum platform_inst_fw_cap_type {
 	ROTATION,
 	HFLIP,
 	VFLIP,
+	IR_TYPE,
+	IR_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e74bdd00a4bb2f457ec9352e0acaebc820dae235..ce54aac766e2bf76fa2de64c884724ca63f05dcb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -620,6 +620,25 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_flip,
 	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_ir_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

-- 
2.43.0


