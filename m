Return-Path: <linux-arm-msm+bounces-76356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D6BC4358
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C7694EA8CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB962F549A;
	Wed,  8 Oct 2025 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZOydyxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC50A2F5478
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917169; cv=none; b=i/8TWY4OrGdk3LRUDn6uxlzaa9cjSXkxaFQ+baUBxj26WwEsoz8CvHlokEZ8dr67MuFXobcBvrNxBToV2Hplp9yaATvq70tWeV7HGSWCE+yB0FRoot2fBMoGPTbVZcwt80trfDkkbCPfKgqGLtwYLuJfAZK5ehGZ+8iIH+U/M6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917169; c=relaxed/simple;
	bh=/foPdUmYkCD5o7LTrZYcScg/twI3NzFBkPoZALJPLE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9LlenGjqlDAVWgGHCw9tD046hQ2yI9FGQAdu11DC1EgHIVYH5kOOW1koIPxwiOJvvFk4LjmrdQ6WnhD8XkY2XlyjzZVAR5NyLWcD9za290lxVJx90aPoK0zsGC0Wm12sZj/Ztb2VuFu8FkdQZv7AFVuqFYuByWyQuxxfqmcnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZOydyxn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890L4D001557
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiUsw8kswXXj782+mjWWFj8hIBNpbwvCHeP8wMn0TQw=; b=DZOydyxnhrp26igS
	I5N3E6kG5Zs8n1jkK79ncwOEs+H3BAoas5pkDfKCbARFUH3tlOJNaRPqW6D5VBA8
	tyKZKeY9EVR/56cAq0OD79LbbGYhNagCH2AYaexga9dUDBe8ui+GIyMGdOTltcS6
	GLdBNv04kp5h5AmP1D93olHhmfUdNSlP8qtwzGhAisH1kcbtkHbSpC3UZsVaenIK
	5lIswvhQi81qosX6EDF2wuT9REnfKiPbCkUdL3OjeeT4rdTDlwrogFi38Vel6AWd
	e3voIs2Pgs+5LsGC4S8fpyP6cDMYdGhdr5wDPDbspf4y7Qd9nl6CIpnH9VbzqXRu
	/0bp0w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnaawd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:52:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3304def7909so7227136a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917165; x=1760521965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiUsw8kswXXj782+mjWWFj8hIBNpbwvCHeP8wMn0TQw=;
        b=lpsXVks2BxK7oj9YshHw8bk/C6eYcpHdzDfWNK229UNK3qfJmf1FY+xhjNLRY23EnU
         hma9RPpdR932GcZmIt9r5VEr9MbQlL+MFhaUrOjRRPqRz/97gVEGDFjnIa5kVwNVuMy8
         zOyLVNr7MvNTv9E6Aatx/kJ5H4F3lUlHX2Kh9AAlwMRHNJv00YxIDWWCMI1XHoI0eNWS
         Z/Yco5hk37TdHImC7J8aqOuB0Dlli6oNHH5JEJRgtef5/jmkGBDt3/mOfilqAzbRyZWK
         kd/PvUjphB+5l8SJdQwJhVNEzjnGPrq+kYftVbzUDPvqL8pCnNKIrClcvW/+3CYWmRos
         Nh6A==
X-Forwarded-Encrypted: i=1; AJvYcCVvHfJtzP51aCNxpdYZmkAToafTatPcwu0JHKM8etdhNg/PoMAQFSjZ3u10xH+yKm9j5+r+gQfrFq6Yzpkz@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCcMBVKFrLuzLYQK2CiQZLazPLNHKCi4108V6VKBVrxwz+jUE
	FpVT+GnmXUD4NlTU1REX446mtksFFTzdKGFYrXhC7U9qPmsCsEtIcrDvp9fMsuHhdwAwklDulSm
	kOE+NfVr6DECjY6Atfk3gl2Mj0e5v9pa72P9pHhpp9Io6y3EhN2hGvDNFhUhzd4zsmGds
X-Gm-Gg: ASbGncvNP5Yw0tFUnNwwBElM9daq2khlka+bIPqb8abuyOg6iVdql/j3oFezOy6cph9
	37clX+uit29iUY39RzIXJ8Igms3ikkR+G7IbE7lDdSXCwvZ8WKCLdlHvJ4e+d/5z0+4051yJG2V
	aLk7H46S4lvojMcG2sldpVODwipzm5c9cX6DA4ZXnTULiSJ/zzSHSViz55VepoVHjocSTYY7lHW
	8oNWHduMICQfouIsCzUj4Vusbn+kt0emOAlMroaJv39tK2FQ5lf+q1/vUJsa23f++EgdkUIwYeu
	SfRUo51v0xcVviXf3bk+c9gURnwDnX9CPQOxfj7o3TY/RTMRtIpUE0c1Snek5TrvLthzwvdXZdj
	qktFML5k=
X-Received: by 2002:a17:90b:3b49:b0:330:a301:35f4 with SMTP id 98e67ed59e1d1-33b513b4b46mr3634367a91.20.1759917165208;
        Wed, 08 Oct 2025 02:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDkZiuVALb3JY9IwQZvFpIvu05yS6gQDLWHeZjVZIIAAlxR+BHHBzEIakEZwXsV8LzngwOoA==
X-Received: by 2002:a17:90b:3b49:b0:330:a301:35f4 with SMTP id 98e67ed59e1d1-33b513b4b46mr3634316a91.20.1759917164635;
        Wed, 08 Oct 2025 02:52:44 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e91d4sm2763833a91.1.2025.10.08.02.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:52:44 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 15:22:25 +0530
Subject: [PATCH v2 1/3] media: iris: Add support for HFI_PROP_OPB_ENABLE to
 control split mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-video-iris-ubwc-enable-v2-1-478ba2d96427@oss.qualcomm.com>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
In-Reply-To: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759917158; l=3631;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=/foPdUmYkCD5o7LTrZYcScg/twI3NzFBkPoZALJPLE4=;
 b=6R30Ub4cU8Er6A9TkcMiuYOip8sv4B9PzkzLAXwOmq1A3ETalgc2nRIRE9yW0Mt11lC8LClOl
 wekZqqH8h31BFYv8bg3C84s3B87B4BaZJDKKRcX+l9yK1q2kV2HgD6y
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXz9GhhNbKEcST
 I+gexbgSq9A1U4LmPIcQrq25MdMrfPSVL/lji6IoViWWJKTq4Hb30QfsMjjVqhe4J9UCvivsvUQ
 yUjZbtPpA3I0f0vOm3zEQaGn1UoPARN9CcLsKrEF/5dXMqf/p5SbWqrRsRMMJvoBxtcWSmJTj6e
 bUs38qc/dfz7G0ZX5lgp2+B6k2G2XY5FPTQNPEeNxjpVpcRtfvTEb+t3FNB3KJ4w0EHvWVFx9/a
 N/qEGbb4YxErqvNcERwl/016WKdgjrqKRKn0X3Bblk93FDq5A4wWbKXfAg7wKGk4ywGO1x/9NHb
 UdnvMYD5jf4P373ZqJV0e0v1UiezmSPmYzc2Qs+zMGrgb/cM306kc6OMffxvjqh9qx6iOZsafH5
 2bOt8BMvWGPVH7ytm/GeItLfMybMxg==
X-Proofpoint-GUID: OzzjDEHGRSnvR8JJJ9G4oWC_3XENTppr
X-Proofpoint-ORIG-GUID: OzzjDEHGRSnvR8JJJ9G4oWC_3XENTppr
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e6346e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=TniuDiUtN4nd1O1swfgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

Add handling for the HFI_PROP_OPB_ENABLE property, which allows enabling
or disabling split mode in the firmware. When HFI_PROP_OPB_ENABLE is set
to true, the firmware activates split mode for output picture buffers
(OPB). The OPB format is determined by the HFI_PROP_COLOR_FORMAT
property, supporting NV12 or QC08C formats.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 15 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  1 +
 3 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 4ce71a14250832440099e4cf3835b4aedfb749e8..56ced61de924eff3388c7df096f8235136bf473d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -422,6 +422,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
+	u32 opb_enable = iris_split_mode_enabled(inst);
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_OPB_ENABLE,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32,
+						  &opb_enable,
+						  sizeof(u32));
+}
+
 static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
@@ -527,6 +541,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
 		{HFI_PROP_PROFILE,                    iris_hfi_gen2_set_profile                },
 		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
+		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
 		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index aa1f795f5626c1f76a32dd650302633877ce67be..1b6a4dbac828ffea53c1be0d3624a033c283c972 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -91,6 +91,7 @@ enum hfi_seq_header_mode {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
+#define HFI_PROP_OPB_ENABLE			0x03000184
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 36d69cc73986b74534a2912524c8553970fd862e..69c952c68e939f305f25511e2e4763487ec8e0de 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -691,6 +691,7 @@ static const u32 sm8550_venc_input_config_params[] = {
 };
 
 static const u32 sm8550_vdec_output_config_params[] = {
+	HFI_PROP_OPB_ENABLE,
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
 };

-- 
2.34.1


