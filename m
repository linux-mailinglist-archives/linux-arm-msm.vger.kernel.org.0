Return-Path: <linux-arm-msm+bounces-74709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F2B9C789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D02F178FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1961629992E;
	Wed, 24 Sep 2025 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKFMVGGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249222C08CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755771; cv=none; b=us90ALEMRtebc3EAZYD9TKs8JlUhb1QZi+C9nC7gtTnWPnjcY5VobheNbg36re7XH29NtNEhzm8QJVp0CMrFvQuHmEKdZkeQ88VabC7/q3+U7LSZvR0lAstTBvICL/P6E3+3KOP+/KcBsVKZcLI+MHlVWecg71Bm+YCO/JvHLSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755771; c=relaxed/simple;
	bh=ppls4KptIXUAnbr8YzCnaUXECY2PlrwPrkwXd8ZGceI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaO1B8zn61t5dHHAjMFB7dFBE09jj5OK3LDs2rpFROnSjelqlJFBUKykiNYVYXXDAsuQNwfJSWw/hzWt7uvMG8eFy2j4Tjka9S+rkVOM2r4XijoY2j8vfi98ousCnpVPcN09U5boElo5hnITfY8Cbt6unWEyPCvTEuGAYf8u1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKFMVGGR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCrF5u025084
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GEDeivwnoupRBh4KA9fIhM4fZUdxt+JJ2VaHDnPYCM=; b=UKFMVGGR7poGhfkF
	dSwoHnm3FuIBL7SHFfG1M6lfVS636O3j3e68OOse8vGi/Z24tUBybz1IcmT9t0BR
	fTWSruwQaQ8XQKOEWrzSdgCvDU8saf5zt3/d1+u1nJ6oVejINdghoZKGM9/Mllab
	8yJDvgBh6puzQvqfLJTdoAWKuJq7N9dRkYaENmpqRq5Q3nmRyx+tlb9eo0B9nefU
	TpxBwpgcVPm7Q7NJ62BTDCrXIXUwAK8RYGACqwuAzEVDcOgRnJz+bReqw80nelwD
	uBUhzkp47vo8GMf0OVByGKYyB1FCbQKSP+AwV+m3iMWW34CWwc4VehuNUZsHSnEl
	obomsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexarw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269880a7bd9so3279755ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755768; x=1759360568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GEDeivwnoupRBh4KA9fIhM4fZUdxt+JJ2VaHDnPYCM=;
        b=WfjoaueFA+bOg4sUpRkojKmHqCdq7Tbz6EL5xlqYtWAcvzCXpv6rKWazFAdcFDreWC
         V1vphSnVbc9TwmQtzMZWBqom4MGxbcIe0iTCTnJ06nTMvO5O0qkTUGULu0YxRgeS63sb
         r2dzDeRe8eokOAtbnsj2DNtcImfa9kcDy+bjtgmcO8mhXeI8wPlDW4biJT2eeDCjkbHf
         fYbgTzKKCRg0g9khaGVXw892T48KSw3EpoK6ttMNDTuL+ERfTCP9r1kaV/+6QcoHA8uT
         c+QTtJIJNwf85Ir4Lz/iY83JiejUNCjDK5qzjKqxHEdTnvbgSVfOSXOzos/RhPKJ6NxQ
         n/Gg==
X-Gm-Message-State: AOJu0Yywux8+Enwy1vAIkpBTawoAtRUC6dPxUjKndPuZz/2tBi0u/b+6
	j50ouFCiV2SOve/73VzZaiwZ31CV9HWbwxHB6iP0VUVct/SNpKUsWTHtcOFUQkgDWxa8Vz+3vyU
	A+lWTVvN0tXUbslWb8P+DqVVyOIUQEsb6Ubi1j1hnnZD1bVLiHg1022JC5QcYTpyDI6g0
X-Gm-Gg: ASbGnctivBDqq/epgdf5VQmK0damG5Nbge2iQzhuOjjPC1ZBQyL4ospl2lcSZs7oLOl
	Mjer1vtWviruc0wJ5OU6ZdgqXuBhsfoL3+IVZ+y1Puy7ReK5yLhBMmMruMKrInbuU0zUJ71AtLL
	XbzqVP6A/i1RjUnGxlnLHAnMwcLaWsilHD30QU4Xd+Fp5ygS1sdx1vX6fIn7i+FCNC/5A5OHH8Z
	+2yzJo+F8RGywz4TUECWvSRuWrkop4Fg0wUQIKQJ5H5BKlh1l7+ONfaYPWg+BTWZyMXBp6zW09J
	rHHOJF8ZmK3mrMk/MoXtoSQ18eIPP5AOTUFrwQAvenqH/tYf91EXyNA7Gxs5+8zXZjJgNKRwb2Y
	=
X-Received: by 2002:a17:902:f786:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-27ed4aab57bmr13429615ad.38.1758755767496;
        Wed, 24 Sep 2025 16:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzVNcRtT1eBCINmtjmHuN9pW/p/gbrm6WcDGutfWr3vWVOHJrKh9qpxIi7uRXaK0TdO++aeQ==
X-Received: by 2002:a17:902:f786:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-27ed4aab57bmr13429345ad.38.1758755766984;
        Wed, 24 Sep 2025 16:16:06 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671c156sm3964175ad.50.2025.09.24.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:16:06 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 04:44:42 +0530
Subject: [PATCH 4/8] media: iris: Introduce buffer size calculations for
 vpu4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-knp_video-v1-4-e323c0b3c0cd@oss.qualcomm.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755747; l=15172;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ppls4KptIXUAnbr8YzCnaUXECY2PlrwPrkwXd8ZGceI=;
 b=ZHGi918ZDBylcHq+8zkNiGjhPtp4ltLVReFLXvLES/HHoKFKJRtfPV2xR0lLEZggTRTTCKisP
 6Ghr/0jM5ApDhi1HFKxZ/XusObvCjGSOYtoPcQHz6suWMgxDOz7Uj6Z
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 7EVuVYgTGrYA04geaKXYmFwsh9SzrHR7
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d47bb8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4W5KxJk-8h1sou3zigwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxCRtKEqEpu0n
 pqSdkO4brcDjJN5QMxsPLu52gJ5oGvsZ5Yz7zX0YQMlemrrzPbGzdGkbDnPwt4CPY9FTEb77UXc
 xYGdrzYUdVuMIj4zB/60QLhaQYWP97eSWESfqR2K2nik9aoo8228XSBXx6SJiZlW1w7lGSt5d4I
 QMIi0gHKQVkr6Vh1ip8X4/Hdn5Kftx1U1jpXzqMDsYOSSQonCcAaeCmuYTkpplrGOreRW/ZnqNe
 d1pv8zVmuxYeBB5MEx4IRKNQWJSF3j5KHrIOCqec/Wuv4agLZ92WGcmUofiE51nHOKcfzcw+yx3
 1ZzoU+uEJk+f0D8IFSUBByOHv/goc/ngSo9btdWTAoLlSZR5qT8emik1nmb9N+2HMXQWLbvLW9J
 vTBT8cqt
X-Proofpoint-ORIG-GUID: 7EVuVYgTGrYA04geaKXYmFwsh9SzrHR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Introduces vp4 buffer size calculation for both encoder and decoder.
Reuse the buffer size calculation which are common, while adding the
vpu4 ones separately.

Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 289 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   5 +-
 2 files changed, 293 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..a08925e941b34d6df86b19ca52691327c020c811 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1408,6 +1408,251 @@ static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
 	return hfi_buffer_vpss_enc(width, height, ds_enable, 0, 0);
 }
 
+static u32 hfi_vpu4x_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 max_value = max(frame_width, frame_height);
+	u32 size_vp9d_qp = DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
+	u32 size_dpb_obp = (ALIGN(max_value, 64) * 192) + (256 * 6);
+	u32 size_vp9d_fe_left_lb = ALIGN(max_value, 64) * 492;
+	u32 size_vp9d_top_lb = (ALIGN(max_value, 64) * 190) + 256;
+	u32 size_vp9d_se_left_lb = ALIGN(max_value, 64);
+
+	return size_vp9d_qp + (size_dpb_obp * num_vpp_pipes) + size_vp9d_fe_left_lb +
+			size_vp9d_top_lb + (size_vp9d_se_left_lb * num_vpp_pipes);
+}
+
+static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
+				      bool is_opb, u32 num_vpp_pipes)
+{
+	u32 lb_size = hfi_vpu4x_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
+	u32 dpb_obp_size = 0;
+
+	if (is_opb)
+		dpb_obp_size = ((ALIGN(max(frame_width, frame_height), 64) * 192) + (256 * 6)) *
+				num_vpp_pipes;
+
+	return lb_size + dpb_obp_size;
+}
+
+static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	bool is_opb = false;
+
+	if (iris_split_mode_enabled(inst))
+		is_opb = true;
+
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
+						  num_vpp_pipes);
+
+	return 0;
+}
+
+static u32 hfi_buffer4x_persist_h265d(u32 rpu_enabled)
+{
+	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + H265_NUM_FRM_INFO *
+		H265_DISPLAY_BUF_SIZE + (H265_NUM_TILE * sizeof(u32)) + (NUM_HW_PIC_BUF *
+		(SIZE_SEI_USERDATA + SIZE_H265D_ARP + SIZE_THREE_DIMENSION_USERDATA)) +
+		rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA), DMA_ALIGNMENT);
+}
+
+static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
+{
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_persist_h264d();
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer4x_persist_h265d(0);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_buffer_persist_vp9d();
+
+	return 0;
+}
+
+static u32 size_se_lb(u32 standard, u32 num_vpp_pipes_enc,
+		      u32 frame_width_coded, u32 frame_height_coded)
+{
+	u32 se_tlb_size = ALIGN(frame_width_coded, DMA_ALIGNMENT);
+	u32 se_llb_size = (standard == HFI_CODEC_ENCODE_HEVC) ?
+			   ((frame_height_coded + 32 - 1) / 32) * 4 * 16 :
+			   ((frame_height_coded + 16 - 1) / 16) * 5 * 16;
+
+	se_llb_size = ALIGN(se_llb_size, 32);
+
+	if (num_vpp_pipes_enc > 1)
+		se_llb_size = ALIGN(se_llb_size + 512, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	return ALIGN(se_tlb_size + se_llb_size, DMA_ALIGNMENT);
+}
+
+static u32 size_te_lb(bool is_ten_bit, u32 num_vpp_pipes_enc, u32 width_in_lcus,
+		      u32 frame_height_coded, u32 frame_width_coded)
+{
+	u32 te_llb_col_rc_size = ALIGN(32 * width_in_lcus / num_vpp_pipes_enc,
+				       DMA_ALIGNMENT) * num_vpp_pipes_enc;
+	u32 te_tlb_recon_data_size = ALIGN((is_ten_bit ? 3 : 2) * frame_width_coded,
+					   DMA_ALIGNMENT);
+	u32 te_llb_recon_data_size = ((1 + is_ten_bit) * 3 * frame_height_coded +
+				      num_vpp_pipes_enc - 1) / num_vpp_pipes_enc;
+	te_llb_recon_data_size = ALIGN(te_llb_recon_data_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	return ALIGN(te_llb_recon_data_size + te_llb_col_rc_size + te_tlb_recon_data_size,
+		     DMA_ALIGNMENT);
+}
+
+static u32 size_fe_lb(bool is_ten_bit, u32 standard, u32 num_vpp_pipes_enc,
+		      u32 frame_height_coded, u32 frame_width_coded)
+{
+	u32 log2_lcu_size, num_cu_in_height_pipe, num_cu_in_width,
+		fb_llb_db_ctrl_size, fb_llb_db_luma_size, fb_llb_db_chroma_size,
+		fb_tlb_db_ctrl_size, fb_tlb_db_luma_size, fb_tlb_db_chroma_size,
+		fb_llb_sao_ctrl_size, fb_llb_sao_luma_size,
+		fb_llb_sao_chroma_size, fb_tlb_sao_ctrl_size,
+		fb_tlb_sao_luma_size, fb_tlb_sao_chroma_size,
+		fb_lb_top_sdc_size, fb_lb_se_ctrl_size, fe_tlb_size,
+		size_per_lcu;
+
+	log2_lcu_size = (standard == HFI_CODEC_ENCODE_HEVC) ? 5 : 4;
+	num_cu_in_height_pipe = ((frame_height_coded >> log2_lcu_size) + num_vpp_pipes_enc - 1) /
+				 num_vpp_pipes_enc;
+	num_cu_in_width = frame_width_coded >> log2_lcu_size;
+
+	size_per_lcu = 2;
+	fe_tlb_size = is_ten_bit ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_llb_db_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_db_ctrl_size = ALIGN(fb_llb_db_ctrl_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	size_per_lcu = (1 << (log2_lcu_size - 3));
+	fe_tlb_size = is_ten_bit ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_llb_db_luma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_db_luma_size = ALIGN(fb_llb_db_luma_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	size_per_lcu = ((1 << (log2_lcu_size - 4)) * 2);
+	fe_tlb_size = is_ten_bit ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_llb_db_chroma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_db_chroma_size = ALIGN(fb_llb_db_chroma_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	size_per_lcu = 1;
+	fe_tlb_size = 1 ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_tlb_db_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+
+	size_per_lcu = ((1 << (log2_lcu_size - 3)) + 1);
+	fe_tlb_size = is_ten_bit ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_tlb_db_luma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+
+	size_per_lcu = (2 * ((1 << (log2_lcu_size - 4)) + 1));
+	fe_tlb_size = is_ten_bit ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_tlb_db_chroma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+
+	size_per_lcu = 1;
+	fe_tlb_size = 1 ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_llb_sao_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_sao_ctrl_size = fb_llb_sao_ctrl_size * num_vpp_pipes_enc;
+
+	fb_llb_sao_luma_size = 256 * num_vpp_pipes_enc;
+	fb_llb_sao_chroma_size = 256 * num_vpp_pipes_enc;
+
+	size_per_lcu = 1;
+	fe_tlb_size = 1 ? (128 * (size_per_lcu + 1)) : (size_per_lcu * 64);
+	fb_tlb_sao_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+
+	fb_tlb_sao_luma_size = 256;
+	fb_tlb_sao_chroma_size = 256;
+	fb_lb_top_sdc_size = ALIGN((16 * (frame_width_coded >> 5)), DMA_ALIGNMENT);
+
+	fb_lb_se_ctrl_size = ALIGN((2020 * (frame_width_coded >> 5)), DMA_ALIGNMENT);
+
+	return fb_llb_db_ctrl_size + fb_llb_db_luma_size + fb_llb_db_chroma_size +
+		fb_tlb_db_ctrl_size + fb_tlb_db_luma_size + fb_tlb_db_chroma_size +
+		fb_llb_sao_ctrl_size + fb_llb_sao_luma_size + fb_llb_sao_chroma_size +
+		fb_tlb_sao_ctrl_size + fb_tlb_sao_luma_size + fb_tlb_sao_chroma_size +
+		fb_lb_top_sdc_size + fb_lb_se_ctrl_size;
+}
+
+static u32 size_md_lb(u32 standard, u32 frame_width_coded,
+		      u32 frame_height_coded, u32 num_vpp_pipes_enc)
+{
+	u32 md_tlb_size = ALIGN(frame_width_coded, DMA_ALIGNMENT);
+	u32 md_llb_size = (standard == HFI_CODEC_ENCODE_HEVC) ?
+			   ((frame_height_coded + 32 - 1) / 32) * 4 * 16 :
+			   ((frame_height_coded + 16 - 1) / 16) * 5 * 16;
+
+	md_llb_size = ALIGN(md_llb_size, 32);
+
+	if (num_vpp_pipes_enc > 1)
+		md_llb_size = ALIGN(md_llb_size + 512, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	md_llb_size = ALIGN(md_llb_size, DMA_ALIGNMENT);
+
+	return ALIGN(md_tlb_size + md_llb_size, DMA_ALIGNMENT);
+}
+
+static u32 size_dma_opb_lb(u32 num_vpp_pipes_enc, u32 frame_width_coded,
+			   u32 frame_height_coded)
+{
+	u32 dma_opb_wr_tlb_y_size = ((frame_width_coded + 15) >> 4) << 7;
+	u32 dma_opb_wr_tlb_uv_size = ((frame_width_coded + 15) >> 4) << 7;
+	u32 dma_opb_wr2_tlb_y_size = ALIGN((2 * 6 * 64 * frame_height_coded / 8), DMA_ALIGNMENT) *
+					   num_vpp_pipes_enc;
+	u32 dma_opb_wr2_tlb_uv_size = ALIGN((2 * 6 * 64 * frame_height_coded / 8), DMA_ALIGNMENT) *
+					    num_vpp_pipes_enc;
+
+	dma_opb_wr2_tlb_y_size = max(dma_opb_wr2_tlb_y_size, dma_opb_wr_tlb_y_size << 1);
+	dma_opb_wr2_tlb_uv_size = max(dma_opb_wr2_tlb_uv_size, dma_opb_wr_tlb_uv_size << 1);
+
+	return ALIGN(dma_opb_wr_tlb_y_size + dma_opb_wr_tlb_uv_size + dma_opb_wr2_tlb_y_size +
+		     dma_opb_wr2_tlb_uv_size, DMA_ALIGNMENT);
+}
+
+static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
+				     bool is_ten_bit, u32 num_vpp_pipes_enc,
+				     u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = (frame_width + lcu_size - 1) / lcu_size;
+	u32 height_in_lcus = (frame_height + lcu_size - 1) / lcu_size;
+	u32 frame_width_coded = width_in_lcus * lcu_size;
+	u32 frame_height_coded = height_in_lcus * lcu_size;
+
+	u32 se_lb_size = size_se_lb(standard, num_vpp_pipes_enc, frame_width_coded,
+				    frame_height_coded);
+	u32 te_lb_size = size_te_lb(is_ten_bit, num_vpp_pipes_enc, width_in_lcus,
+				    frame_height_coded, frame_width_coded);
+	u32 fe_lb_size = size_fe_lb(is_ten_bit, standard, num_vpp_pipes_enc, frame_height_coded,
+				    frame_width_coded);
+	u32 md_lb_size = size_md_lb(standard, frame_width_coded, frame_height_coded,
+				    num_vpp_pipes_enc);
+	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
+					      frame_height_coded);
+	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
+	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
+							frame_height_coded);
+	u32 size = se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
+				dse_lb_size + size_vpss_lb_enc;
+	size = size << 1;
+
+	return size;
+}
+
+static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
+					 lcu_size, inst->codec);
+}
+
 static int output_min_count(struct iris_inst *inst)
 {
 	int output_min_count = 4;
@@ -1503,6 +1748,50 @@ u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 	return size;
 }
 
+u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_dec_bin_size         },
+		{BUF_COMV,        iris_vpu_dec_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_dec_line_size      },
+		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
+		{BUF_DPB,         iris_vpu_dec_dpb_size         },
+		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+	};
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_enc_line_size      },
+		{BUF_ARP,         iris_vpu_enc_arp_size         },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
+	};
+
+	if (inst->domain == DECODER) {
+		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+		buf_type_handle_arr = dec_internal_buf_type_handle;
+	} else if (inst->domain == ENCODER) {
+		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
+		buf_type_handle_arr = enc_internal_buf_type_handle;
+	}
+
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 04f0b7400a1e4e1d274d690a2761b9e57778e8b7..fb544e8b3bf6b9ce86920a18537fd0a2c21cdc31 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -46,7 +46,7 @@ struct iris_inst;
 #define VP9_NUM_FRAME_INFO_BUF 32
 #define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
 #define VP9_PROB_TABLE_SIZE (3840)
-#define VP9_FRAME_INFO_BUF_SIZE (6144)
+#define VP9_FRAME_INFO_BUF_SIZE (6400)
 #define BUFFER_ALIGNMENT_32_BYTES 32
 #define CCE_TILE_OFFSET_SIZE ALIGN(32 * 4 * 4, BUFFER_ALIGNMENT_32_BYTES)
 #define MAX_SUPERFRAME_HEADER_LEN (34)
@@ -66,6 +66,8 @@ struct iris_inst;
 #define H265_CABAC_HDR_RATIO_HD_TOT 2
 #define H265_CABAC_RES_RATIO_HD_TOT 2
 #define SIZE_H265D_VPP_CMD_PER_BUF (256)
+#define SIZE_THREE_DIMENSION_USERDATA	768
+#define SIZE_H265D_ARP			9728
 
 #define VPX_DECODER_FRAME_CONCURENCY_LVL (2)
 #define VPX_DECODER_FRAME_BIN_HDR_BUDGET 1
@@ -148,6 +150,7 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.34.1


