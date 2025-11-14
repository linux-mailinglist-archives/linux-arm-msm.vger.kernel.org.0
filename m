Return-Path: <linux-arm-msm+bounces-81749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20783C5B122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EBD63BB067
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80E025F98B;
	Fri, 14 Nov 2025 03:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbIPfG+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9H6hJUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF925B1FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089873; cv=none; b=JG5ESHYhZY6L0ACV+/pUlWxG0hCOvntCfKGsdli6XMx1UFy8UBbUgcpdiFdpXxomvausrLvJ+TKMotyE6R0KldA4U2R44wLkHExnLtQYLXWeHI9kvK5UIQRzYHZwiVm7kyQPGr5fha39+wfNeGIw7dhKOm2rUTg/4obj167NQus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089873; c=relaxed/simple;
	bh=N+lXfS+h75q3UY+fVI5mCZ5Y22WmQkMvX7JwoqZwoAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=evOFi6UO0W+1Vt7hf3Zc+D/2/e5glff/6Je6IG7/4JYmoDWSf4o5mwmvFbuWCnM5JeJkNT06QgJklksX1Is6NqlKmM+nRB+bIyMjUJ0wgacTCFDqXydk75Ae0lYfepxFwIvfnvAd3d11sLCaBO7zSQO3G+X05evXc8/PI/9lpo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbIPfG+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9H6hJUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaqCO1704012
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpCPhfZHViyrEGxLAAC7R6Rt+0rXawz53+v5Rmp3lUI=; b=hbIPfG+mAsy3ZpmW
	u6cJPIeKrkbO6joJy1tJ1ZN1AmTeytIlBUrbzjmWf/Tl8oBMSS08HMl6mqxp38a0
	zAFCGKquBEPt5ME2/6TuDMyrJchSq8iOmdvSLz5BaTUgyVBAtEnUCx95GnL9Oesh
	JD05kdHaYM6UqIejb83bEvKW92zODfa5QnpEeAAnC8mnpLyfxnIqk/+Fk+AsxE27
	hJY5QOOt/B4/jx9JU6GAcOyEp8AG1ei47PXJTdkGIqlF6YGk0RwkjA5rcEh6TIMN
	Wri1xLXipuP7EbTqUVKfZBZtt2RQ6qpnLDwt2cnC0CYz6nYDWd+ktg9B7ulOupTs
	eGw0kA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e8mp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a998ab7f87so2542416b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089870; x=1763694670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpCPhfZHViyrEGxLAAC7R6Rt+0rXawz53+v5Rmp3lUI=;
        b=T9H6hJUKx8jdpamDLI6QL4m7W/8p1ZqfcvdWVfoy4zWqbBqUsLO5jbumg9W942D56b
         bVBoalvFA920jrJCbQznIpxgicUbbDoS68IDI6LXaZT7uQTyVgp7eEkWb7Qjqf8nWPm7
         rM9ux+0RNLx3NalJZSPPnJ00AM2lTs/bWpS4EQ3diMCsF3q07onnCHLv1YFd0rYIgX/w
         lUFCPU+bhsElMPVy9m5tdH9IPzxuQ9PhHTDZAZnJiGCmaLdWy//pVpWPsr5cO5oc/2US
         3a6HRh2VSdJppAth0Svq3/TbGCDrxG2y8aFCBCvl0VB1CTL/drJ+vSLNdo99JEyBUxBs
         UfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089870; x=1763694670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpCPhfZHViyrEGxLAAC7R6Rt+0rXawz53+v5Rmp3lUI=;
        b=p44m6WMxpvVmZGklTiivd7N8iBCbWrqUomDTngoGe+tmDZEZjPKlGNWw/r3UOPBBGG
         JagRhK8EByinN2CSiaHIRPFt/Y+RSSj9nQZzJMY4UZTNURduIN7g+uFi3UVtVLcFB5Bn
         Q9LQ45DyhVrN1ofgeCzK06dwSyTFcVy6jFCmfv5V4LgK23lhpBH3S9UChO+Wb29KTg4k
         zYKsjwkRq8ZFFdHV7DjjKPbp+EtaN8r+iKmQK5BtQcAuvM4X6HrxxlELHJTlSFKc0j2M
         a0bafxmUPDEZNmACsqEMLaMgkziGEyuP7/rfuvp1nCEK2lklHoKVZIm9PRihKsmIdOln
         plgw==
X-Forwarded-Encrypted: i=1; AJvYcCVVzjRa9lPrlad7L4oy07OmrJs6fO3Lwdf7Lr3GUx1bbJHvjN+yfneslZA9jnQknsjaMReF3Ec4A2XCHIKa@vger.kernel.org
X-Gm-Message-State: AOJu0YxumJpsB11MaHbFAy5RneQu3/SBde/StsDu+YfPqKUwQXbg6BRy
	d4iXfkWqNZEFF9dBDavxZZp8ahthspJjmHqd0c+x6cbF1nPC0uQgAPeoPJPDg/Sft2HIfm27V4R
	ufHJ7bDfb0jukZcqqSGxSkZmrRHs3cawMHEkhpUDVDTK/68DPJwKV3XLRlrfCOqSw+J6E
X-Gm-Gg: ASbGncvpjgHPxmCi5SnqLa2mhzqIA/9DEW/ypSMLsqeaX+whWFoEGkm9F5uh3a0GzwZ
	JfHolEs7sZzTiNRHZgB2tsu3mG6ComxkGOwTN/t8/OhVxHU9NHnWK7DWXDJuFkrP0YoKbQ1gz3G
	l3OcdaQlvuRcsqhNQawpWdWrSfba2m1RaCIaohvsictAoiYEdZsFvB2Gpfi1IQjlgCn/28EHTH+
	sjmEUTmP+2wfkXr7APNyOBggeYXwXeqyreVL6moswWYhFI1iMzF5hgBBxF9Pz6zY01tJJkuNdL5
	08jO6evAUHuZywOuDr21dxofA+qf/6q2alXdG+Jfew6T7KUSCmzbpGBRZP16qzb3fmeJg1lM5N9
	k7q+kbywVGmnTRiUio6Dde20EzjnTMmpHVMdFKXxxW+QTGII2vmYfJvu/dmAn63wfLwtWvPw8sx
	BWBANF1151
X-Received: by 2002:a05:6a20:6a21:b0:342:a261:e2bc with SMTP id adf61e73a8af0-35b9f7802fdmr2393609637.10.1763089870293;
        Thu, 13 Nov 2025 19:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEByt/YnJC8UImZHFW2IHOtUBhlJhhnk9FlWz7pgABAyEcJcAFKXFvnd6hkwgZSwPjj4UBvHw==
X-Received: by 2002:a05:6a20:6a21:b0:342:a261:e2bc with SMTP id adf61e73a8af0-35b9f7802fdmr2393577637.10.1763089869767;
        Thu, 13 Nov 2025 19:11:09 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:09 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:08:59 +0800
Subject: [PATCH v6 2/6] media: qcom: iris: Improve crop_offset handling for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-2-d6d35a92635d@oss.qualcomm.com>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
In-Reply-To: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=2964;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=N+lXfS+h75q3UY+fVI5mCZ5Y22WmQkMvX7JwoqZwoAQ=;
 b=C+soZyehMFoq7OZ6xSqp4YsD1PBaO8egsolYdKpTMbXI3OSrrky7+1R9TAtwyXACd2pwUciYU
 7Tfh8+5JhruDJRxYFxIDVgHL8YvG1ihloATL8whan22wR8KpCVSEeAk
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=ccPfb3DM c=1 sm=1 tr=0 ts=69169dcf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FFraBxrx14SkMf4OJSEA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: MIake9IOY6L6qLcmpVgu-hEL4l53ArCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMyBTYWx0ZWRfX6fwLIjbrOzVa
 IAxfeMhAE4YJNXRf9UfspAdnx/X8kKBL8rhAQjLI4lewrqdklKSlIMJsOV15ZiuKx5T1BFeSoNb
 Gbu2l5cfMkrmJK3Axq/iBz8FMejZWhYJUeHo210mmGuqh/oFk+NjW2qE0lqWuZYwHBGj1O6do8t
 jXEgobKnjA0T9v9W1PVTz5P/XPkdY1/u6eUWNJFtvJMMJPse4fPMjz3G9uDKwx8ZBiBc4EPrhqY
 iBB2x3Ir5lxF4awMvKUgWnXbj5I8kp79RBMWXTOG8U14t1bmMWj1ekGH07KKn9RM18DozfiRtM8
 S9hzR54iIquf/VBwJHBffRMTTypVpnn6xu+ZZHmGmI2/C3F+j95OQJaQdgsseZb7BkrXSpGiD7s
 qJkOwnEWuyUW0P8wal9h6z96tgvRcg==
X-Proofpoint-ORIG-GUID: MIake9IOY6L6qLcmpVgu-hEL4l53ArCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140023

The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
but on the CAPTURE port it is used to inform the firmware about the
region of interest, so crop_offset needs to be handled accordingly.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 20 +++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_venc.c         |  4 ++--
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index b5ae3d4745c6a7b354ab8907aacd532b81b48aab..8250e0d6f0a8916f3389be60dba762f3b4f3c690 100644
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
index 07ffcd4d20969c8c33084dc8b03156913e8c89fc..71f4263ada898ce8333086db59e386e91b34ed60 100644
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


