Return-Path: <linux-arm-msm+bounces-80958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1571C45E83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2AB3A4DC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8864E3054C4;
	Mon, 10 Nov 2025 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImsWChlx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcgG1jPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D1F3054CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770231; cv=none; b=s3EwXpi05CD4k7KHOE54if+nLHI90bLwg7XLTBDGmwwK7D4eNgqEPeuMisjnnPO/fKCIYhwIUUOKCvz83+3Sum8TIMDtQ1lP5TWuX3bEy6iUD6kB3P3glHst/w9fkz1a7N2uYhC6xCADqXTqcR+JhhBh+xDS8hkB+56KwEF5Lo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770231; c=relaxed/simple;
	bh=LveUk53QJ3dHRW9HSIyjWavI4gMoswfbMNluOzdNiO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pg1xmE/vNsOsSIcorOdNLmVHJUj4y15RvFdE4LXRlBENUPPFCgDYzdTxbS62invqIP+wpT0MozXUbbnt97FmIVcrpS1GwfRCyCdFfdeVMfhtxguDPe0drMp5HBRjjrPjN19AuwGNp6M+TT6YnrPVpyVqXx5nRbWGjnZse2bL6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImsWChlx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcgG1jPB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA3jlQI2546904
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoxIonDCXKCpc9bIHGc3/ojACiy01o5W3o8PYdNcEHk=; b=ImsWChlx+A6PS+10
	1fMsxc2OSokyrBd6NAFOEhTPE87caWMjnBBBfvRKnDI6oQCcJr3fSeuUxi9A9usJ
	8M9DEey5dYz1lrdeF684CaK+k5aEX5Hm1Hb8i8SuOL7luFMJm4SmevkxsdPXep83
	qbKW5hsaoLM1lU8UK8o7mT6fvI7/GC9Rt1CMUlShpomfew2smkGqruqVHiX8pQ92
	0LfRgloben+dltRLKrzMZKUUmGwRRQ0nacjTdbUCEMx1604JXNLhpgaTL93EwMAP
	ltV3gXIjlKTvgwuEihUiIcB0IIGpAX/XXJJAmmizBaJL1Lu23I5Xu2PjGALBPwZ9
	1Xv7OA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab8ea92up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:23:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ae70693579so4475459b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762770224; x=1763375024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoxIonDCXKCpc9bIHGc3/ojACiy01o5W3o8PYdNcEHk=;
        b=dcgG1jPBMyIHytfdiaWS6t7aa99o+bNCVS36CG1BxIXuiGPdOgxykIkczE2Fu5c10A
         6O1q4UP1qKW7g7OLeBk8Hx8PF+CpjwS48uFThKKzpNKioobmciadj8VGgfcPGxmUIMFG
         5HZVHZelJYmdn7f5EXhnOqzhqzoW/z7BAgLj6/V0BsLIA7tnkQXBp2xq/CkmiMkiBaIy
         ObTuWDv/0pIXW8hjkkXWf1ctkhrlFbW0N3+8rbYu/3dJPgRBPfok+rcnOu9vNRhkq3JW
         OcLFcsb4H2u14gIL7Y3Co0/KZlLHEM9r/vNJ8DinoBGomE7vo4pVl0oYi8gz4u7mXeny
         5fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770224; x=1763375024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yoxIonDCXKCpc9bIHGc3/ojACiy01o5W3o8PYdNcEHk=;
        b=W3U+W3N4x7cOODHn3lWZBZgHbskv7q90hdGdz0jMeh2Guhie0a56cB0qvt/Y1tb3Dz
         8Jp7JXxueTPb45d5+tIHR70cMvvr6ZfmtJp4HbGq5iCveVJDmTQ21j5ZugelD8hG55hK
         IV9BY3DyZnQsdhPdpW/r9Jf3gjrGNx+8hgMil5pA0cSh/1hXQYaUW73ciICo2ivVGcxM
         PwFQB/e+C6FqVJ1D+lEUBZZVaEk9JdRjTQiPJE94kU66ibXiOgGrGFQ0WFohP58mGzOV
         4D7/UzKmVW7hEhNdNI5jHv6swVABNVv4jqFFiLBbyafjvPPn4YYCvAV5t0Jgae74MLie
         5MIw==
X-Forwarded-Encrypted: i=1; AJvYcCX+QkIHwGk9EQYcH3W27+wY0m2ol6Kzx5QdHyZGJTFMrOqo8mtI9z2Q8NnwJd7VG7YVkro64DKev8XGk+G1@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXqKLadYMZ8aocoh+IESjR+z/HxuT9OiVy/jhDoc2Ehri1kBM
	KwWvLuAXhjxrJhUaxEpFbgQxMfE3hwqudFn0is5UfN2MThktFj1cI9PWmQVGl354UDk8WDyJPN4
	KdAyQw/FcLKC9xKnld8V6HawtuqkIK6cjiwl26jMJJztMl9MK3Ch3rtWSGgDgQ/c1Xp5H
X-Gm-Gg: ASbGncsMxO0V79Z+rkGx2Ol0bf1NHHsvmch0gNR9hwdQn2nQxyaNv1kL8jPggt6/OJI
	6XeZznZinTwH0FZGG/pTWZvq6UYHIPgbN+wfX0MAAiewX04YkQ137UzKO3gv1fVhrEbVUlfzNXi
	qXr+fSDYR6hNZQqBBK2s+tGrfxDlB7IU+vy/iiOdMJ3ol8tnOXmlLhtzix3unOYn41BWcWB7zOM
	q/T0wVA3F/YqcW70rMcYrlyOQ5E4G7erH9PH2qSRYanj0lKdRtpWSDO9N1bdm2dcHfWCorgBoyi
	QR4WYruNMRGIuRzZuj0gJEH/k1DTOxI4vHe53iA/5PBYYpxGQaaE2wsTCnh2DGw+vlW+ciS5H1a
	99wzJYOIrAzQhOS4hAClsDQjSmXD8jzvibWtAM/7T+DYdbtBzwnN1okwYBrAUsICXo08OswbcrA
	==
X-Received: by 2002:a05:6a00:2316:b0:7aa:eb09:db95 with SMTP id d2e1a72fcca58-7b227182441mr9113743b3a.30.1762770224049;
        Mon, 10 Nov 2025 02:23:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGszW/XIr4y9kZ9mt3TFYGMul1bX3EymstHOkQaDuJj6R/N4PfPUe3eeZuai+oVYfo4e6aD6Q==
X-Received: by 2002:a05:6a00:2316:b0:7aa:eb09:db95 with SMTP id d2e1a72fcca58-7b227182441mr9113714b3a.30.1762770223560;
        Mon, 10 Nov 2025 02:23:43 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179f77sm11153832b3a.34.2025.11.10.02.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:23:43 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:23:13 +0800
Subject: [PATCH v5 2/6] media: qcom: iris: Improve crop_offset handling for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-iris_encoder_enhancements-v5-2-1dbb19968bd5@oss.qualcomm.com>
References: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
In-Reply-To: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762770213; l=2882;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=LveUk53QJ3dHRW9HSIyjWavI4gMoswfbMNluOzdNiO4=;
 b=i0oUI4WW26G3SEcUaeUFVdvC4Ku3IAr9yDvnwrshQmO1sVIpxa7GbG7m5dQrSEaVMnZa50oed
 3sD1yZJnpm2D/VRRr4Cy4x32ynxQsB9QUNcpNj260EdqgPuUUx0m8VC
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: Z4LBFq-e0YseeGKONcI1_ZkCwhYfq8qA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MCBTYWx0ZWRfX/wNHT6vVWWiD
 B6wikg248nKv4HSzgra0XsHb4ByaynElcWFQf2xj2wpVodl0A4w2dVPqmn6eD7ZY3QD/Ve0cyr9
 V8Pg14n7u/QR1UNvdYpeAGEECMqN+nC7fafJ/UjzlE+4+ftlXur2HBX8a/eGE3QgafB0N7bk0w7
 lrbOvFRjVFzQEX8geT612u4QZslHC6TVTQ07V+NhitHs9vLYBtI8XNSg/tMsx+GN4icpzKS8B0O
 gb+bD9FuPNSWbqnqEyMI6/Mtv8BHkNCP67ut+CB/u41CXJC7wQlvD8/nfYq6YZnlbf6MDpk/cg6
 uOazW92jxMjfIYtJ/cMBZqn8aRJAGXwNszew8Ro3wnl4MTqyEWa7vxJt3RXoOk3a26dF5gLhaME
 l1He6pLTuVEWFgb8msdbv5yrH6w5Kg==
X-Proofpoint-ORIG-GUID: Z4LBFq-e0YseeGKONcI1_ZkCwhYfq8qA
X-Authority-Analysis: v=2.4 cv=QLxlhwLL c=1 sm=1 tr=0 ts=6911bd31 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FFraBxrx14SkMf4OJSEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100090

The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
but on the CAPTURE port it is used to inform the firmware about the
ROI, so crop_offset needs to be handled accordingly.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 20 +++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_venc.c         |  4 ++--
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 48962d2e4962935bbc24244edfbbdcd42dab151f..30c0cbe22d1d34b5bbbc6bdbd3881dd43a6ff647 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -215,7 +215,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 bottom_offset, right_offset;
 	u32 left_offset, top_offset;
-	u32 payload[2];
+	u32 payload[2], codec_align;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
@@ -230,10 +230,20 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			top_offset = inst->compose.top;
 		}
 	} else {
-		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
-		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
-		left_offset = inst->crop.left;
-		top_offset = inst->crop.top;
+		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			bottom_offset = (inst->enc_raw_height - inst->crop.height);
+			right_offset = (inst->enc_raw_width - inst->crop.width);
+			left_offset = inst->crop.left;
+			top_offset = inst->crop.top;
+		} else {
+			bottom_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align) -
+					inst->fmt_dst->fmt.pix_mp.height);
+			right_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) -
+					inst->fmt_dst->fmt.pix_mp.width);
+			left_offset = 0;
+			top_offset = 0;
+		}
 	}
 
 	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 50a3eb975a2523abf1c2df128a66a762a1ed35c6..7ad747d2272f029e69a56572a188a032f898a3fb 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -62,8 +62,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
 
 	inst->crop.left = 0;
 	inst->crop.top = 0;
-	inst->crop.width = f->fmt.pix_mp.width;
-	inst->crop.height = f->fmt.pix_mp.height;
+	inst->crop.width = DEFAULT_WIDTH;
+	inst->crop.height = DEFAULT_HEIGHT;
 
 	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;

-- 
2.43.0


