Return-Path: <linux-arm-msm+bounces-88201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833AAD07A41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 08:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56AF5308F152
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 07:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337652FD66B;
	Fri,  9 Jan 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYaCs9mI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcWBDZLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0702FC893
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944592; cv=none; b=MK8ZIF5u8UNbmadIO9bp1PSRFcSPA+K5ZtkJd8OLDCzXrJFs6lmEpZdy65d8lCloAoAjavaiSjZbyPewwDc9FnKsEDhjG9Qaj75I3qcC6uN64gIFzA2zQWVHFpUFLjA0IcKMZ0upjck+degx4wRCaiMe6GbimL3cP1VluNnW2Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944592; c=relaxed/simple;
	bh=aRmyC1rbJb3ivyJ7IFPZ7zWbBdyiu4TYmPBr8U9HwJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6shrUb2MXpgcCeN9wJWvdqfeWUd8uB071PVmIYdAuIXvpu9KafhbjDa/owM2gMw2vEKD+RdIi8uQM7v7L//2QcYjOSqF4usmxEWF+j1X3UdS1xIclkXaumP6/gKBamhQvEE8QRt3Tp+xbR0GNsaTxFel5GxrZlzIysRJ06kGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYaCs9mI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcWBDZLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MpEoZ3629109
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 07:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7V538McHgW6Ox+rkQHRMSlJA0iMCmPeJqU27mizyjJw=; b=CYaCs9mISMgNd8cf
	Go2E76pChJSqt9fH0aM8bszveyLCH2y9KQ6XnF4L2wIFCdQmMjXlK58j2mzvHZ8F
	2t5f+7ESFFIeuGGRR4CS1SUqPuAFn9JVNsUkCS4352V1S8inTm5YjbCcNEgdoXcR
	K2qGLJHGveSI6wxF+XjjY/oTFUSEaEzKFEHxJ6vcQC8b6pmxQPjRAvB67P9slMMU
	SkQ5P9sNPMOCfNuL9qyKjwF7S6DWMjthjT4XI/jLYOQQ+mV6VQl6stDKxDTkmyys
	17KLOAAtV2lr8jfIkmwYvLV0GmM0/AL2a44F6UFBS6kJCdyZeAqpC8xeO7cuyA9l
	J0jeyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j1sbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:43:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f13989cd3so92616465ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 23:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767944588; x=1768549388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V538McHgW6Ox+rkQHRMSlJA0iMCmPeJqU27mizyjJw=;
        b=jcWBDZLEcfb0LgmzthOyN+soj/uFHicx1DU8B90QB9OqUcx2WL/f1C5pCTzzhUdreZ
         3gqQ6cnEtHJ/o9x2nIreoiDnQ03Ow6Y1VW1EUuvwyjyI/34GFzBZOzIjcyw5OJXXxJRS
         oerxXhB9WBEUFrcqdOIwzlh6+IU7Xq6DUPBSe7bYxkGYoD7xeaHU7Pg6vEOAH67PQh4N
         P3EBh3OOLPSLXh1ra7bD8DT7CV8RKNwjI4slEUd4RRgct+iGgCy7UKSpgpsIEg8V+Rnu
         Bo1U0OLttUYrPnQucb4tezzlK7annEKbQSjXTNy/B0/6Vprk26/erp93tuh85ob87jtL
         SNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944588; x=1768549388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7V538McHgW6Ox+rkQHRMSlJA0iMCmPeJqU27mizyjJw=;
        b=tOj0DA6iFhLXLDS4aZaLCCwIsN90OnSM+kzfStXQDlTFPyV9ZZMcvQUEbO4v8BMvgM
         iKrt4gAu8YYPtA7Ym4nnxctcnQIKiveo+sMjyyfZpB/n8cCocJy4iAJVZsHoxJMInfjM
         c94Ae8dAKTnBnBP2wtKrW/XGYLSZ5Al8qX4s2RN8fPQJ8JkDY1XgjIwlX1cl0axS0uau
         j6YNVRrI1dttVh40Rr4DLLlR0cF7nYA7s6H575TgjbFRCcibqhvcE0Tgwt+6UcxCXaX2
         /jrHHDQv4TwbrTUa8hcNHSC8xXCcEo5aYbmWo9NWXcDjngaeAB2wXCeirN8sOwuBqKmt
         AT4g==
X-Forwarded-Encrypted: i=1; AJvYcCXtT5O8XYoGmoP9fV4PM/rft6SP+iZFONrE3DqKRTjlKJuYBo1ZL6q0h/Nsib5h7WEK2VmkBYf5g3AZaa78@vger.kernel.org
X-Gm-Message-State: AOJu0YyJqF1HuoPMm9Sev/hvzc17lvKz6GUglU3W3tELge7+vK6iUOdy
	/4Vgld5jqmHP92uPbCU/FjVlUIbYOD1iEZZSeAyvYl3Fu1TW3b27Ye/u6ckVxnAjLg0vtkkskun
	cjVmn3g1kOP+Q4927Brwa4PezC0YbMwL6VC02ZocD8xXq3iSqndk6Yeb1Hpv+v2gJaRM8
X-Gm-Gg: AY/fxX56LlQU+9SnXOWrIjxzCMHQhPIaKYfgWLL3EYqMDaXjXdlQLXu3TI0cQIdG8mb
	kTWY/J8XHOmgE+/lxzU2Mw2VrLdEChMkkwwPDwSRxC/nj+gDWdvg4G086j6q3JntCBCmvOtzVjR
	ko8/RgYPexgbXq3UEWVX4W/GW1aTVjl9k34b7rpLPoqwDYHE/doGp0UKWDRjcv6pvKfKeQKs0nW
	31K6tGFXBoF+pnRoouFrVeCiDldw4XfWo3GGZ39hmoAK9u/IuOdsAOzuumfcD0M3TH3eNIWQATO
	/WN8WwXjph3jafIxmvcmdN4D/Vn+n32H0TEQ2/wy4L+hUu6Wng4MminvZqevb+02TR2RKP6lTgp
	tZMTv442ZLNi3QmbOw0+eL1QjiGnw+ibLOHjInDofznEK+a74HQP5My62RpVnhs0o309EFgeYxK
	VO+JW2QWzv
X-Received: by 2002:a17:902:f64c:b0:299:e031:16d with SMTP id d9443c01a7336-2a3ee484c7amr97653725ad.33.1767944587998;
        Thu, 08 Jan 2026 23:43:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUA4MlT//uRZGo70UHxB6XnfEGbvccHswqpCVh7gnz2+rlhpaUi1q13wNykWcTXI9PVTajtg==
X-Received: by 2002:a17:902:f64c:b0:299:e031:16d with SMTP id d9443c01a7336-2a3ee484c7amr97653545ad.33.1767944587555;
        Thu, 08 Jan 2026 23:43:07 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd46a9sm98638195ad.93.2026.01.08.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:43:07 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 15:42:35 +0800
Subject: [PATCH v3 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-batch2_iris_encoder_enhancements-v3-6-196855ef32ba@oss.qualcomm.com>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767944563; l=1433;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=aRmyC1rbJb3ivyJ7IFPZ7zWbBdyiu4TYmPBr8U9HwJE=;
 b=L3MT/3AEEYdndqC+mVdhAVnYhtOMBQTi6Ul81rPU1LzFOG9WNsoXsss0tm1tfOio0VHN07W9e
 pqCJiQR3meGDqrkYYFP8EcAqQKaU/6FFePyiV03Sh3TzgvWKEnbSjmd
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MyBTYWx0ZWRfX+Z7F1oiTFDxj
 fJbWqmW4uJjIaBD6/F5n5SqodmmqmGkTZlCY10sXi6w6GUf73dqbOu9gz6xYYHw3JDXs8414+47
 c6D9rShMAgMCqTvs2CRTK+IpwE+KS3robFPKUfk24GSWW21VfauR6NER0GO0q7kizeOSOiH1jj5
 PKZfTyeb/lmiPz9kNxzbqw64sO0gXRaY3mwQbDWFwqWc+ro3vjErOmjcyrktEP69NqUgYRfbqz6
 7mBQHlTvXMZmd9a4AchdL2EiKZmuUvWAPtl8Shm+PqVQu07IsLLxwdY+TH7uAOsUftvZ4U7+oq+
 5J3gRq2z+HuSqAHm1AjHAKrksTwvqXh+xmKW8UCLuy+I+3fBFF54sTzomX7p10Pb5JYTcIjoXuU
 UYJtkMP8P7NcX5MRzFh4P8oBdGI2niVfG8hwuWlA5NgdPuhtbH9JVJWirlz5/E4K38EE7LkAyn7
 dnKPhb4to0IT4ywUEZQ==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960b18c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gzcdSJtmgNWTwawkF9hs6sWcBlmVlNZg
X-Proofpoint-ORIG-GUID: gzcdSJtmgNWTwawkF9hs6sWcBlmVlNZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090053

Unify AVC/HEVC handling by computing codec and lcu_size upfront.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index c962042518fceb0f82a48956df01c8f3cd26df99..621d5c6b4940e146f117e6b206421127c7cf9656 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -739,16 +739,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = hfi_buffer_get_recon_count(inst);
-	u32 lcu_size = 16;
+	u32 codec, lcu_size;
 
-	if (inst->codec == V4L2_PIX_FMT_HEVC) {
-		lcu_size = 32;
-		return hfi_buffer_comv_enc(width, height, lcu_size,
-					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
-	}
+	codec = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
+	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
-	return hfi_buffer_comv_enc(width, height, lcu_size,
-				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, codec);
 }
 
 static inline

-- 
2.43.0


