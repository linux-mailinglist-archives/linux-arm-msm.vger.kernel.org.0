Return-Path: <linux-arm-msm+bounces-80822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A9C426AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 05:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8695D3BBA77
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 04:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937372DC359;
	Sat,  8 Nov 2025 04:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7BiOVuA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9aWa31T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B042D839F
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 04:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762575856; cv=none; b=c8AIvq1zdwlHrJ3q/GwwjrUmZ9JF5M50FdxSQO8wu68coYc+NIOq18Yh+54p2ri4EHEKJXU6PsSsTeTTYfugAo32xBIxPn7UbUjRoxOMRTIEYB7ptdIAYh7xxx9knj9tp1QmXTIvpLhRJ6z83TcSxR0urJ/x6RpW22GNaOmPi9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762575856; c=relaxed/simple;
	bh=IvUXgUxc+qj/ai3yZ9DYCmxbqk3ttvdY6dcBJuCnGdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCZoZjs2R1/ZCLNL4Wg47hK5Y7Mn3D/88TiIlhPC0OjtSVmERQqhypO7NcY7A4WFxJ3ekh4gGbRmm+22MQwpKB35zMYtP06BIJoo4CJw3h4TpmRyVJHlLY8/Ph/VqRdY8PTLgTDVuyrjLvYgVdBFH1IRPrc+yCw/g1Onb8QJ3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7BiOVuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9aWa31T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A84JsAA817328
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 04:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSlGCETcT487njJjteSfbaPtFhdHu4yLu1wzBWenQzw=; b=Q7BiOVuAs4aOe7ir
	9/gMUaAq0W1DKtyW3Igmq3QpdVx6zHe+FmVTShjUHD2ZWYJkg2PEqWoa/qqGI8nu
	2nqPYAKfAzf87TN0V9xL+E/PLr8lrpn3/BW7LiT5BpPJ4I1gxfN9XgfD2qR6qVLH
	pQ81dCbjEf5SzdLk/mwOEWwn62tLJ0eWGBf1E0o7J1HjST8oZlt/1JDBN6A4gMyB
	SSQhXyVuQqg+sgy6I0jPc8M7DUkIi4IFdmGI1u/0xLVHq0/r7JRkvSwqn5+E8ZEq
	ZAaojlj5Ud8IOJTUgxNk85PHW3Z44SifZGYpFzeD4p7Z+DPnHdytqsitx8NYXEwz
	X8NLsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xr4r07c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 04:24:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e89544d7so716225ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 20:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762575853; x=1763180653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSlGCETcT487njJjteSfbaPtFhdHu4yLu1wzBWenQzw=;
        b=a9aWa31TWatc4jKShSBOwZf72Pz47zGErdVYAyox09/rhlR8j+0Oc/+VoULBqyJ2wK
         +x+a6p4sfF0G80ghiM7wy9qaL8ISOmOdQdlTRfh8jefuvFjsDLC2MD5IWplyJMr+aL4j
         3JxwoeCzXJXl22J+gsZTX4x11Y68IfzfiOYoZovo9i1Ayj0rwP3G0RHXU8Frbcf2GHF9
         Sr6MbJ5ng9gQGODcIyjYhPMuluKoOZ8qghRIPBdvcSp+C3H6D8hdmB6XOuqKsLqZYppH
         OFqSPABiRNSCjkpGsy54VFIeYO8+U7ErjJ/9mfkHIySM0uXimFemG987KyDs0ddw323m
         cPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762575853; x=1763180653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSlGCETcT487njJjteSfbaPtFhdHu4yLu1wzBWenQzw=;
        b=N3kMusAaQer6skMgGDmYXUl3V636CqMXckqRIHmRjJh3gqoCGIgCYgnlMoffXzRdgt
         7YeR3OOJ/8gfDUmZufYtyiwr5PmYISY6F6KWpDd8dmUT5L9tUOfdR8/hpBmWtMhArIoO
         AT9/kvJilnPUyrjSaoxyoFE1w7U50P3ONX3AuO3W76g2uteHxUVM8HYl6oD3hElhQlme
         JITy4WawmhD+Toa0GFBkU6qcEsTf+1ySgWvpwL0Ut4MhblUduAzFmU/ZhNNhnqUHuY/Y
         f14vpq6E4YoQKFDk9O88QyUCoNABHWpZGkVUlyWwX+JDwdV1yzOlhNEWCYifhsaktk2R
         y3UA==
X-Forwarded-Encrypted: i=1; AJvYcCXrlvIMtqiLvPPKJ4SwrGgMEGULEIHiHsZY8XBnA9fDLUwn/MxfTGTl2GoiwKNoBhzrZctJBITufwjmbeez@vger.kernel.org
X-Gm-Message-State: AOJu0YynkTdSTjPztxL/EF6zZdRP62SwHYPYEYRbncjLB/s7w6LKUvw5
	kVTOmfo3pJRXSIm0wtYHsJHz7bA1I39eIZiaULKWi1H78WryMzT1IAdJaCUHm6CxMdZMqMGq0I+
	Zr3oATrLN1ouuwazETSPQB2TvxwKB5rFTgsktAzK7+VrMLsEGavLwD3NLl6MxqWLI7MMt
X-Gm-Gg: ASbGncvFJ+LQXnYS/SA+JaL+3qJwVNjPuZ96KdqOp4Z/DLkoQ18yOwJlsY65+DA1BGX
	W4nokcAU9JCN5NRLyP+ropD/cQWaLg6e2fgRN9CWSVbcVEYJK3u47KxyeLoX+wuHiujjIOXiMXT
	gk+IEhI73zNMjsPooM6GeRHzwIvHiajXgMw1cYRmuEky8alsbm7l71aE6RzLoXWQd9VD8Rpb+Kn
	izaYDJ27VWzR4QsXP7K2/n6McXMsSC4NGsV1+UfEO16FlxkEivYwTnMSsBTk8556i6niLFR8vBq
	q7FkA8SNgyd0nuSKPpvFuuIX0XvSynApISZRDbYXx8nbCH9Bkx72pkiu0QMYrKocgfejlKeDA9C
	USTjB8aQT6D4Igl75HqFAaJ5ydv4trg85KZTArQeHMg1QHps9j+/p/PbrwOo=
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr9476425ad.7.1762575853249;
        Fri, 07 Nov 2025 20:24:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8qUA+LqquZ2W83Iu/UuN0aBatqV0uQa5znd3+xxbvIEhaSJI89lLPU/mwnHRMzdi9nsd5Yg==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr9476195ad.7.1762575852814;
        Fri, 07 Nov 2025 20:24:12 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm75442235ad.23.2025.11.07.20.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 20:24:12 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 20:24:07 -0800
Subject: [PATCH v5 3/5] media: iris: Add support for AV1 format in iris
 decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-av1d_stateful_v3-v5-3-351652ba49cd@oss.qualcomm.com>
References: <20251107-av1d_stateful_v3-v5-0-351652ba49cd@oss.qualcomm.com>
In-Reply-To: <20251107-av1d_stateful_v3-v5-0-351652ba49cd@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762575848; l=7656;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=IvUXgUxc+qj/ai3yZ9DYCmxbqk3ttvdY6dcBJuCnGdU=;
 b=wE5RK8+oErDI0BaxS0enaAsokhg89h31mx3vLAqdyY1HuOkJ0MAVaOZBWWvpEQFvTQQC8gJxC
 Y8lmdMY0pooCDwEWOBX25SBiYoQjGa+fKBD+4XTmcmqr4ZPDTno6qIH
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: rsNwyandU9QJw2DdQbxb63G6I-ZRSo7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAzMyBTYWx0ZWRfX0Ig+PxwgNMJr
 +cFEW+p/zWKDwxFuha+oKXIhQRBGCMdX2hzXDI7xuXYvctZlcciFFX12JbpMs51zjYijqMucYcR
 rMF+7Q/arHqFtIrrG+KE7W8oFRFwihGjbHx5YNtyJlLTgz0Pn5nd4+043vbgilpEqQV1+Hmy7f2
 BI/sos+IEZSSlL8/5OuX3QQ9qS/eXEAUhhvuCPs3IMxno4Mi4x9pHeuxFiXtggOzOkWPM9XYaZy
 CZr9tlU6oG8k4Uld2yAEtq+8W0J+b1BxWnTKJ1KtKZxfNz/CHj5zR8tmL76OpOT6WCL0OqD42a4
 WfQjDk2SkCVTAynJmVTFfkgGq+Duo9/CqKaW+aPws897pvNgEWPsoVTnuhU0E+KDu1zAtLZh8R+
 xaaMHjgE7F07vwZDaLNgpRzI0vSUMg==
X-Authority-Analysis: v=2.4 cv=AuvjHe9P c=1 sm=1 tr=0 ts=690ec5ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Dfn2-qcXI_AzomQv4o8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rsNwyandU9QJw2DdQbxb63G6I-ZRSo7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080033

Extend iris decoder driver to support format V4L2_PIX_FMT_AV1.
This change updates the format enumeration (VIDIOC_ENUM_FMT)
and allows setting AV1 format via VIDIOC_S_FMT for gen2 and beyond.
Gen1 iris hardware decoder does not support AV1 format.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 23 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sm8250.c      | 17 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 23 ++++------------------
 6 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 1b6a4dbac828ffea53c1be0d3624a033c283c972..3d56f257bc5620aacec2bb7e11253dc7c83b7db9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -139,6 +139,7 @@ enum hfi_codec_type {
 	HFI_CODEC_DECODE_HEVC			= 3,
 	HFI_CODEC_ENCODE_HEVC			= 4,
 	HFI_CODEC_DECODE_VP9			= 5,
+	HFI_CODEC_DECODE_AV1			= 7,
 };
 
 enum hfi_picture_type {
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 62fbb30691ff967212022308fa53ff221fa24ce9..7e4f5f1dd8921c57db039fbd4bc2f321891348db 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -19,6 +19,7 @@ enum iris_fmt_type_out {
 	IRIS_FMT_H264,
 	IRIS_FMT_HEVC,
 	IRIS_FMT_VP9,
+	IRIS_FMT_AV1,
 };
 
 enum iris_fmt_type_cap {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 58d05e0a112eed25faea027a34c719c89d6c3897..9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -214,6 +214,8 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
+	struct iris_fmt *inst_iris_fmts;
+	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 69c952c68e939f305f25511e2e4763487ec8e0de..3b61723dbf27e9ba8d427686e44cf048a0ab7c5b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,6 +19,25 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
+static struct iris_fmt platform_fmts_sm8550_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_AV1] = {
+		.pixfmt = V4L2_PIX_FMT_AV1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
 static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
@@ -761,6 +780,8 @@ struct iris_platform_data sm8550_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -853,6 +874,8 @@ struct iris_platform_data sm8650_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 16486284f8acccf6a95a27f6003e885226e28f4d..8342a0b6f825b385192baedfc67c50bba7661470 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -17,6 +17,21 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
+static struct iris_fmt platform_fmts_sm8250_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
 static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
@@ -337,6 +352,8 @@ struct iris_platform_data sm8250_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 69ffe52590d3acf8d595f856fb1dbd81f3073721..bf7b9c621cb7255367c06f144c03c3faa69372e0 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,21 +67,6 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats_out[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-};
-
 static const struct iris_fmt iris_vdec_formats_cap[] = {
 	[IRIS_FMT_NV12] = {
 		.pixfmt = V4L2_PIX_FMT_NV12,
@@ -101,8 +86,8 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	unsigned int i;
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_vdec_formats_out;
-		size = ARRAY_SIZE(iris_vdec_formats_out);
+		fmt = inst->core->iris_platform_data->inst_iris_fmts;
+		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
@@ -131,8 +116,8 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_vdec_formats_out;
-		size = ARRAY_SIZE(iris_vdec_formats_out);
+		fmt = inst->core->iris_platform_data->inst_iris_fmts;
+		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;

-- 
2.34.1


