Return-Path: <linux-arm-msm+bounces-79843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65CC24461
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1B641B20BA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57B03358BC;
	Fri, 31 Oct 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pa8v88KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqOK8pNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A43335565
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904309; cv=none; b=Ad1MvH4XnecLx3Z5ycOWPdzhtjZ8XvlmDhxMrtyJ12Okn95cSYGsFLIORyHhZ5JJaq+KeDqGiPji8dRLAQF5hi6j+BPdJ/5MTzsjGmK4Ssc4f8GlmxrCbm1M/oJutZuPMiHNp192f4zMkgLmzvle7A+uQcrmhevzg4vOutaAzsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904309; c=relaxed/simple;
	bh=4j/d/pgw1rmbCsB9i6CZ160Pv6XuxPt6j/us2SNkP9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sui8kHCy6tLQfTxRPhv7pDet5VRbcQ7zN87QqwLca9cTfPc1ro7au4yLmhz30NEjY3VWyvI3o449XagKO1TvqvVyhNRr7bAUuaA0kEUFDOF+dZKKkTudsWj8pr9Fkix/iN4GEtcmPGu8jXi42oEJ5I1ntWaADBhzfmCnREkSxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pa8v88KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqOK8pNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73IBZ2058364
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPhIJqCd2mQmF7QvFn4r9ulDVIVPowx4bLFC3ensrDU=; b=Pa8v88KJlOMmgEBy
	y2gLsYyLouMzVZlG1Le05UnRtfnp4+niCeDdgC32tfLRysDqDCPiL7Duar3BV/5m
	PV/ZVsok0EDujF/MMKrFFrgAINOMwbWzrrlZne9Z8FeiJQUIIrER7x0C8IbYvLNH
	sfTFyVKttAY/6JRpjvM/e/++mWa5dKADL7XHtqm4z1KznHNJJB0M6t7pIHZ64vVb
	atkf86IkMJgUjjbvPfW/7dsnvu3he6CHGwG3ReflsXa+r6H9Z31rM5Xp/4OB+pNX
	zY1cZCACt7zQwojhcur3ENPLTp5Vsv/iSBXdgSreNUPn4VRArDF1Qnr1kSOyu2fI
	oHzl5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvgfs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290bd7c835dso22651905ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904306; x=1762509106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPhIJqCd2mQmF7QvFn4r9ulDVIVPowx4bLFC3ensrDU=;
        b=BqOK8pNrxEJAj74J30ZlokjN8WMKv/MH8yJc7f0kkSfQRkeA0m7MrvKx7IgOiGMUdE
         8qocvPcpNpvbwNsiP9FISjZKliMn2iEV7hWEk1HuJJu1SW91RLzP02x1L37YGJFCGvJ6
         m0wbZchHWfLBSLVmAtwr5uVKa69meXrR1DqU6uKsqiHDLc4mp9HfOja6BV7q+LjtR4KV
         yNMhOm9QabCg6ilFHB5u6+gx+/RgM5e+UvmFZU2pML6i7x13hYd3Rn1wZlXxl3KfzkxI
         t+L5m9ITaRaK1ewJPaoCacNWwz/DiFhrP6S9uIDeUWsWmY9VA46cZ+1EVDhLC4J+L78l
         j+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904306; x=1762509106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPhIJqCd2mQmF7QvFn4r9ulDVIVPowx4bLFC3ensrDU=;
        b=LQzXOb+u+8tiSir7rSKSRjnZvq9bO2BMa1QSL1CHA3eTAgO4NnNH0QR/oSJqYHs6vZ
         1en5fHhcHHfaxUl+KodKnFWYwEFikuI4b0736Y6xUBzpMLvoVOE7czsMK1BmQQvH23SR
         5xL5J9wKflymEpD6XaqlUMWFNZCU5hrUI4oKNjRJd3tgMMhWqiosrAVMHwH8V/A7lkkC
         E8AzniM05n/qIEN3/HsqQY8De7kiUAX27pPezONr1P14ohGyh+vQA9VlSNu9AWNeE/ay
         4v3latb3ejm9bNY+nuvdzoyaSH3l4TdvWMHKnvWNGrrTvuo1JVdTXgGpaG+PgOigfyh0
         iwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGtdHXI8aQQ7whnIppKr6L0bzX3o92P/GfK38UmnhVN9NwvL3oyZhkhtQbRjOtmRqvU8JIV4Na/44Bjw7U@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvsADxkUW04LwFIB4tJWnTvJJsf5Gpd/Smjurkv13cVomxm0D
	zclZKpNNIJRAidSF9IJ6VeFjCBNk3d/X7739Xai7R8cWKz+8ck209WBXXL1reeSS0WRT1HV8Ie7
	KAD6kDioE6IkRR8bY6kDWEky+I5SHrI2hO5CJ5+wOOKW5N6ZoDl4pnjJBXTJeqX4N6lZw
X-Gm-Gg: ASbGnctJW9P+YE+0EXMK/7Dl88JRZua3bWm3e6r1XkS1sIIb4oLr/ABX1cjLrS8FmGk
	GLgkDIf0H41ybV9rRoNiYyKinPfNwdmKAkVuq2TZmMmh9yWb/dIOyCMqDIH17Xz5mX94k1oibYf
	VRZohBEFPAPrIncHbDSPi3PuONrX0KrDTrX4iV9JjLh4Qn5ZVObAJWuM6ZQBjT8JyJJikjcRnji
	bh4+EIXWy0onepNfaCTf+Hx40d0qR/GLHmM581c4snlYVX1G5ksqRGrFP7dIaceHrgVEU3cDU/9
	3hi+fvQy0WKp0ceq6GjQ2uzH+cq/r+lNd/gH6tOzR5vkiLFV2ao63AyQR8VkCjHiQA6/ilGDukx
	SOGGqbgRgY9/PPXKYGxSP1vaD5QMV+q1c1PO+oA9tlzdQ4raC2t3zEFcsKZJ7IeqpE8QA4q57Yg
	==
X-Received: by 2002:a17:903:187:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2951a493547mr50083575ad.29.1761904306318;
        Fri, 31 Oct 2025 02:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcwvrl1I7qxNeYEryVUMYrqSv1z9PleeEoojLZ2brTfSaunxdHLPOcKbGHXAqQbQ6maNXaOA==
X-Received: by 2002:a17:903:187:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2951a493547mr50083195ad.29.1761904305708;
        Fri, 31 Oct 2025 02:51:45 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:45 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:50:41 +0800
Subject: [PATCH v2 3/5] media: qcom: iris: Add rotation support for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-iris_encoder_enhancements-v2-3-319cd75cbb45@oss.qualcomm.com>
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
In-Reply-To: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=13897;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=4j/d/pgw1rmbCsB9i6CZ160Pv6XuxPt6j/us2SNkP9Y=;
 b=97igKe7GDWK8kaNnR3drUYkQHGk1Y3GA0tnniDb2FzTcSuZGckvCzIuZYipuYVKgWWIec9S3P
 ctOZGGT7FMJBkO09BS2/DVv9seQNRLdhDaNe+O1Ts58wwS+8CKAUjvJ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=690486b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XuHcMD-VqflyE-QO6owA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfX3zGf6XhdJ/Pu
 3HbYTDaM7tY1ZYD5VV3Tb0BqealJcWtT6HPnu0uw2qdd7TRqkCpIK+i8usLU+kfNUJRga6wihDP
 T3iMU+rZbl7eU7fNF8eJebKWx9OnBSifea3JGCRRZXA78zDdlFM1V34KY9GDN9F7rxheuirrTGd
 uqFQoFsBU+uoba0+b6g9l4DzB2iAj0aZD8o9+a+njdt9iOzbSw+cncPTiIyTlpfKbT+DFHmPZ9P
 E7Lrjs9i4s3zsD/uKPDcadhWWJozDS2LkhG0wpszp1cfYdQkOzERvXJwfeW69ddsf7wL7YjBEat
 5QE6NY5ilvNnCxHyycK187/c6C+jrl4VC78xtRUMDGo/4570hAAMGB1VolZ5v4QqUapLU1kj+dh
 Hm4DZgOSPPRTlukztkmZr4ZDsWOIAg==
X-Proofpoint-ORIG-GUID: wvljhOp80X-n2RRcJMArjyVzWNsg6w2m
X-Proofpoint-GUID: wvljhOp80X-n2RRcJMArjyVzWNsg6w2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310089

Add rotation control for encoder, enabling V4L2_CID_ROTATE and handling
 90/180/270 degree rotation.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 34 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 41 ++++++++++++++-----
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  9 +++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 +++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 +++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 46 +++++++++++++---------
 9 files changed, 121 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 754a5ad718bc37630bb861012301df7a2e7342a1..00949c207ddb0203e51df359214bf23c3d8265d0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -98,6 +98,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
 		return B_FRAME_QP_HEVC;
+	case V4L2_CID_ROTATE:
+		return ROTATION;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -185,6 +187,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
 	case B_FRAME_QP_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
+	case ROTATION:
+		return V4L2_CID_ROTATE;
 	default:
 		return 0;
 	}
@@ -883,6 +887,36 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 				     &range, sizeof(range));
 }
 
+int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val;
+
+	switch (inst->fw_caps[cap_id].value) {
+	case 0:
+		hfi_val = HFI_ROTATION_NONE;
+		return 0;
+	case 90:
+		hfi_val = HFI_ROTATION_90;
+		break;
+	case 180:
+		hfi_val = HFI_ROTATION_180;
+		break;
+	case 270:
+		hfi_val = HFI_ROTATION_270;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 30af333cc4941e737eb1ae83a6944b4192896e23..3ea0a00c7587a516f19bb7307a0eb9a60c856ab0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -32,6 +32,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6ec217268a2bc1f939fa33820c1ae19adaad2e96..4e88239351bb5adf1ed3260ad4d3ba2fe1df7555 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -180,22 +180,36 @@ static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static inline u32 iris_hfi_get_aligned_resolution(struct iris_inst *inst, u32 width, u32 height)
+{
+	u32 codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
+	return (ALIGN(width, codec_align) << 16 | ALIGN(height, codec_align));
+}
+
 static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	enum hfi_packet_payload_info payload_type;
-	u32 resolution, codec_align;
+	u32 width, height;
+	u32 resolution;
 
 	if (inst->domain == DECODER) {
-		resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
-			inst->fmt_src->fmt.pix_mp.height;
+		width = inst->fmt_src->fmt.pix_mp.width;
+		height = inst->fmt_src->fmt.pix_mp.height;
+		resolution = iris_hfi_get_aligned_resolution(inst, width, height);
 		inst_hfi_gen2->src_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_U32;
 	} else {
-		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
-			ALIGN(inst->enc_scale_height, codec_align);
+		if (is_rotation_90_or_270(inst)) {
+			width = inst->enc_scale_height;
+			height = inst->enc_scale_width;
+		} else {
+			width = inst->enc_scale_width;
+			height = inst->enc_scale_height;
+		}
+		resolution = iris_hfi_get_aligned_resolution(inst, width, height);
 		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_32_PACKED;
 	}
@@ -234,10 +248,17 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 		}
 	} else {
 		if (V4L2_TYPE_IS_CAPTURE(plane)) {
-			bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
-					inst->enc_raw_height);
-			right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
-					inst->enc_raw_width);
+			if (is_rotation_90_or_270(inst)) {
+				bottom_offset = (ALIGN(inst->enc_scale_width, codec_align) -
+						inst->enc_scale_width);
+				right_offset = (ALIGN(inst->enc_scale_height, codec_align) -
+					       inst->enc_scale_height);
+			} else {
+				bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
+						inst->enc_scale_height);
+				right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
+					       inst->enc_scale_width);
+			}
 			left_offset = inst->crop.left;
 			top_offset = inst->crop.top;
 		}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index aa1f795f5626c1f76a32dd650302633877ce67be..4edcce7faf5e2f74bfecfdbf574391d5b1c9cca5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -83,6 +83,15 @@ enum hfi_seq_header_mode {
 };
 
 #define HFI_PROP_SEQ_HEADER_MODE		0x03000149
+
+enum hfi_rotation {
+	HFI_ROTATION_NONE = 0x00000000,
+	HFI_ROTATION_90   = 0x00000001,
+	HFI_ROTATION_180  = 0x00000002,
+	HFI_ROTATION_270  = 0x00000003,
+};
+
+#define HFI_PROP_ROTATION			0x0300014b
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
 #define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 58d05e0a112eed25faea027a34c719c89d6c3897..9a4232b1c64eea6ce909e1e311769dd958b84c6e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -140,6 +140,7 @@ enum platform_inst_fw_cap_type {
 	P_FRAME_QP_HEVC,
 	B_FRAME_QP_H264,
 	B_FRAME_QP_HEVC,
+	ROTATION,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d3306189d902a1f42666010468c9e4e4316a66e1..c1f83e179d441c45df8d6487dc87e137e482fb63 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -588,6 +588,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = ROTATION,
+		.min = 0,
+		.max = 270,
+		.step_or_mask = 90,
+		.value = 0,
+		.hfi_id = HFI_PROP_ROTATION,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_rotation,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..97465dfbdec1497b1111b9069fd56dff286b2d0e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -124,3 +124,9 @@ int iris_check_core_mbps(struct iris_inst *inst)
 
 	return 0;
 }
+
+bool is_rotation_90_or_270(struct iris_inst *inst)
+{
+	return inst->fw_caps[ROTATION].value == 90 ||
+		inst->fw_caps[ROTATION].value == 270;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index 75740181122f5bdf93d64d3f43b3a26a9fe97919..b5705d156431a5cf59d645ce988bc3a3c9b9c5e2 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -51,5 +51,6 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
 int iris_check_core_mbpf(struct iris_inst *inst);
 int iris_check_core_mbps(struct iris_inst *inst);
+bool is_rotation_90_or_270(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150..be8b8588a39fb02d8dd9f1f1f6765ec76dc7d08f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -556,6 +556,22 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
 		iris_vpu_dec_line_size(inst);
 }
 
+static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
+{
+	if (is_rotation_90_or_270(inst))
+		return inst->fmt_dst->fmt.pix_mp.height;
+	else
+		return inst->fmt_dst->fmt.pix_mp.width;
+}
+
+static inline u32 iris_vpu_enc_get_bitstream_height(struct iris_inst *inst)
+{
+	if (is_rotation_90_or_270(inst))
+		return inst->fmt_dst->fmt.pix_mp.width;
+	else
+		return inst->fmt_dst->fmt.pix_mp.height;
+}
+
 static inline u32 size_bin_bitstream_enc(u32 width, u32 height,
 					 u32 rc_type)
 {
@@ -638,10 +654,9 @@ static inline u32 hfi_buffer_bin_enc(u32 width, u32 height,
 static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 stage = inst->fw_caps[STAGE].value;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
 	u32 lcu_size;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC)
@@ -676,9 +691,8 @@ u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
 
 static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 {
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = 1;
 	u32 lcu_size = 16;
 
@@ -958,9 +972,8 @@ u32 hfi_buffer_non_comv_enc(u32 frame_width, u32 frame_height,
 static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1051,9 +1064,8 @@ u32 hfi_buffer_line_enc_vpu33(u32 frame_width, u32 frame_height, bool is_ten_bit
 static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1292,9 +1304,8 @@ static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
 static u32 iris_vpu_enc_scratch1_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 frame_height = f->fmt.pix_mp.height;
-	u32 frame_width = f->fmt.pix_mp.width;
+	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_ref = 1;
 	u32 lcu_size;
 	bool is_h265;
@@ -1390,9 +1401,8 @@ static inline u32 hfi_buffer_scratch2_enc(u32 frame_width, u32 frame_height,
 
 static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 {
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 frame_width = f->fmt.pix_mp.width;
-	u32 frame_height = f->fmt.pix_mp.height;
+	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_ref = 1;
 
 	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,

-- 
2.43.0


