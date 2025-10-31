Return-Path: <linux-arm-msm+bounces-79840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAABC24464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B6464F1CC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9038333443;
	Fri, 31 Oct 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1yGHZWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrROctxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A3334685
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904302; cv=none; b=h33Ud1hoGdTFT2W2wEaCVXEALYjNgjcmzGD8mN1WSxWuoviAvmLh2bny7eKt/29R8cYNAnsogk09C+zPCp6At9n7q1pACN2AaYNk/gGP8jsXjxA6ktZa9/CL1z/Cifss2ObM7nZzmdWqOS/SdxS+4mQYhY07qhId0Zc+cuCQ+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904302; c=relaxed/simple;
	bh=tNK3w71T6e4PjaLm8LNoJvsCCYX65B4pzJT4mQrjvDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+nUWMbVGtYnP6VGapyeMirkMI5Iz1chfTUUD5Mztud7tMCOlnZZ1iQOTJ5r9AjQWFl7btVyfGlsYh0VlTVzYevWC2iQlIhbHn+g3EAlYNuWOnHI8PAnaJdp2up76+bvMgIskWdLViZ32bFjFJBLoApCz10Iil/6uwHcpzQ4LqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1yGHZWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrROctxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V85KWN833768
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/JpM/Paae13Jto15iFYVyEhtvAI0lxD1SeWwHVnZ0fs=; b=l1yGHZWL5FHO1Vvi
	5790VGMjHeDsYlGRilqTSoA11tDP6dCzUtqeUvaOnRkYyI8obRXOw93XowpCW/EE
	6HxSASSFh/qCM9iEdq0kN9RPFuGmCz2cPMYLUGQy1xb/ra9QVU33D66A207AuFuq
	X53Y4Tz89fBE1I0q8Av+CXuwoix0YVnDgohkIhQQyhLqEVB+Vc4xU00nu+Cguk+N
	xy7J32FJy/gMuBFNyszzNdUSYMjTareBuJzIUGhb2+GfwM++eVpkpyR0kxyapcr5
	J4AGRVRu6CwqLWruOqMJWWJ2H63Z52i0tTTBUmLh5Q7L8/GrWkMJhs04Cq8HXByS
	9neqnA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb1sew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32edda89a37so2042198a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904300; x=1762509100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JpM/Paae13Jto15iFYVyEhtvAI0lxD1SeWwHVnZ0fs=;
        b=XrROctxbXhWqoVTNy3pLN53SchzLcKz/jZ/3UlS2T5wZvpyo8+vdp2h1IHErqO2OTX
         WGNWM/QQLA6ZmFLPUGpYrqSfTPEnaJl4iOrAFIGhM98YtKShYgdDUPtUX3k8PmjlaDh8
         QUWkssMClFuvKAYCyfTvla2Ujli5KlssTIQn998AQFZgywqwnxgK4fEdWIyVTdsV70Fi
         KaYwh/pQFJBC/J5YFfJxJFFD5YU/CpBSz8E7ldE0JmL6TLPdnXRo1rgbxCGO1eS9gMGl
         /IOeQFW+BPSIesJKzg78BnlufKBTNfkZy963oy4CtQgDm2y0vwAscNS512ifvsUGj5nb
         nlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904300; x=1762509100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JpM/Paae13Jto15iFYVyEhtvAI0lxD1SeWwHVnZ0fs=;
        b=mHaCajQhKBXSdwksxzmKymBniEI/u1iUYwrWmTrs8DsAYrC5GPo19iPJV2vlmj9zG7
         j2/WrpfUe/kbJ90OadJRuwEetrWKJ8rEZBxDrLzW3WSiFKZOJQcD30X+Sq3nYSzjOPVg
         9yMKC0b0TNQmltZi6g2kmiAvQ5hEVdV+vyiA2PqueP6/rCBpVje1AytcX7DPwkEqB5u/
         g8hIkJCz84ExiSIjSDOpMbPqtxz+34219SJ6v+d5LZDNcwo3l0UFRlTeLBcd6YHTPz3g
         FfkWrxRcV48Muqoti6HmFJLBSWHO6KG589xuJkvJHr3H2Yt1rXDg0EqyPvVrevvRSx4h
         FSRA==
X-Forwarded-Encrypted: i=1; AJvYcCUNdc07UPpRaTNYiO2iwcQ+vR+IrgpReBzNKXnWB3nB3h/OvTww3j7yNS87KztVmWcJ80nWKLDZl/7sS+x3@vger.kernel.org
X-Gm-Message-State: AOJu0YyupdNhA8tDXmOanKHRIYyOfDMvdPHC+igX4/0CIc7cW1cButqV
	E275vIgDTPK7DKkoH7cziduuq7b+YI5tI72ilyMY6bcHuwBkgDYc1MpbhbwEecPEJ/I89sVstIr
	PHq89p6p1WzmKQVriTnGv1waRFBP7LLh04tjAflPUKgIMRlRGw6KuNUDzd2rSlbiYMl3S
X-Gm-Gg: ASbGnctfjJAXuMrsEAiSzmHedTzsvNiqzlREddCTwtFQeDEY+dvcww9UD6WVb+CBSlk
	QWjFf9Y5jtHFi5jpRzc1lHUP5jy+33fV6mMJJUMx4+a4CzpNirH01kFLOwPLZODa544Dsy8mjnM
	w9VEXluVFW3EgQHOZgi5xIYaa3ersFxcnuTnu6DpUVQaF1LvGs7/cL4JvN+iLle573eSaWrTn6/
	oyK90ttp2JK+nZNt5NrzgZsq1zSL1PNbRnxRHWMGmvReRhE2DhJheuTVtoU/QU7sEaJrB263EG2
	m6W5eM9mtxvUTYfnScKF3j+UDuoIeLC2hxNh1zlBR19Q6pOKbJlJWh6yEN5WxcNotN/kkX+v28o
	mbWPEgxu1h5aTuPsArFsFbG7gXBY5pQQL/dprZhdSs+8J/SCKW2uIu3q27nFf5kYZ9m1WpObkQg
	==
X-Received: by 2002:a17:903:2f10:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-2951a3d0d1fmr35683675ad.14.1761904299425;
        Fri, 31 Oct 2025 02:51:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExWdhj8g/jlNPdEPwEK4/kCn2ilRTx48miAgHuZAI43lKz3CQx0hdppvLjoYedmB04jEsTAg==
X-Received: by 2002:a17:903:2f10:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-2951a3d0d1fmr35683345ad.14.1761904298813;
        Fri, 31 Oct 2025 02:51:38 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:38 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:50:39 +0800
Subject: [PATCH v2 1/5] media: qcom: iris: Improve format alignment for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-iris_encoder_enhancements-v2-1-319cd75cbb45@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=5100;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=tNK3w71T6e4PjaLm8LNoJvsCCYX65B4pzJT4mQrjvDk=;
 b=Q4iIB9stru17MD9UZUYytGkrWrUBUyuuXSktuZYZYOqDim0VX168jtjnEXBefVLUYccPi1hM3
 7S6Ym5Adh9eDox4MDWXxS+H8rDvdS/4OhqMBZ4HTCLE6XwXI/BfDZkm
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: A_aExvFFd_FrlQZlIlNZtX1Hd_m6C7wy
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=690486ac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ua5b2oKhh2CtpjQe1ZYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: A_aExvFFd_FrlQZlIlNZtX1Hd_m6C7wy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfX3FawYaCnyVnA
 uHh9ZKvu3AFd1FC/QvpSgWCueI03pNMCYh9780ZuvltcFDr06udA3/IH8U9JcY9RpxbLZsD/jK8
 jB2x8z1Q8ovlUO03GLUGXxfwUedLkSRcmPxYYBshEd28FRYNDCGCL+Il4SC0w3G1AVi7QjV46ue
 qpYrgKQ4BgTdYW8NTJI33J3isoQ0Cl+2oOxRaA1/tPpPYy4m+7WyHDFJA60MlL8rLXzC9m1lWg8
 YxKNFJYoi8kFFUEop40HerjgxfyA0QRFB6v1fyiTGA9xMRCOp21AC7Q1seIe6kzI7JxJetUO+CD
 uusbDoQdq6kQA9ZAHT07RVZ05tIYTuQk9i+j18Er781Dd7gwAn0qNBidy+eo9mC4YgiKNF8LmL6
 IWVUUiwpy2UEJ+zvMf8QyFBznviDKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310089

Add members enc_raw_width, enc_raw_height to the struct iris_inst to
support codec alignment requirements.

HFI_PROP_CROP_OFFSETS is used to inform the firmware of the region
of interest, rather than indicating that the codec supports crop.
Therefore, the crop handling has been corrected accordingly.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c   | 18 ++++++++++++------
 drivers/media/platform/qcom/iris/iris_instance.h       |  4 ++++
 drivers/media/platform/qcom/iris/iris_venc.c           | 10 +++++++---
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 4ce71a14250832440099e4cf3835b4aedfb749e8..ada9b4d298ef10ac47a573061369828a1e150f85 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -168,8 +168,7 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
 
 static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
 {
-	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
-		inst->fmt_src->fmt.pix_mp.height;
+	u32 resolution = inst->enc_raw_width << 16 | inst->enc_raw_height;
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 
 	return iris_hfi_gen2_session_set_property(inst,
@@ -216,8 +215,11 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 bottom_offset, right_offset;
 	u32 left_offset, top_offset;
+	u32 codec_align;
 	u32 payload[2];
 
+	codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
@@ -231,10 +233,14 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			top_offset = inst->compose.top;
 		}
 	} else {
-		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
-		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
-		left_offset = inst->crop.left;
-		top_offset = inst->crop.top;
+		if (V4L2_TYPE_IS_CAPTURE(plane)) {
+			bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
+					inst->enc_raw_height);
+			right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
+					inst->enc_raw_width);
+			left_offset = inst->crop.left;
+			top_offset = inst->crop.top;
+		}
 	}
 
 	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 5982d7adefeab80905478b32cddba7bd4651a691..fbae1662947df73bb3d10b7892839fa1076b7e61 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -64,6 +64,8 @@ struct iris_fmt {
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
+ * @enc_raw_width: raw image width for encoder instance
+ * @enc_raw_height: raw image height for encoder instance
  */
 
 struct iris_inst {
@@ -102,6 +104,8 @@ struct iris_inst {
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
+	u32				enc_raw_width;
+	u32				enc_raw_height;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 099bd5ed4ae0294725860305254c4cad1ec88d7e..6adadc89e360a6e4bebe1f839d38892990e10fa2 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -68,6 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;
 
+	inst->enc_raw_width = DEFAULT_WIDTH;
+	inst->enc_raw_height = DEFAULT_HEIGHT;
+
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
 
@@ -249,6 +252,9 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
 	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
 
+	inst->enc_raw_width = f->fmt.pix_mp.width;
+	inst->enc_raw_height = f->fmt.pix_mp.height;
+
 	if (f->fmt.pix_mp.width != inst->crop.width ||
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;
@@ -329,9 +335,7 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		inst->crop.top = s->r.top;
 		inst->crop.width = s->r.width;
 		inst->crop.height = s->r.height;
-		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
-		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
-		return iris_venc_s_fmt_output(inst, inst->fmt_dst);
+		return 0;
 	default:
 		return -EINVAL;
 	}

-- 
2.43.0


