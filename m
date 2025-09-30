Return-Path: <linux-arm-msm+bounces-75539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080DBAB84F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82BF7189B4BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B01419F43A;
	Tue, 30 Sep 2025 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikP0pt55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C5272801
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211399; cv=none; b=HydL12BgRg8OokU7l6b6/FcR3g8auuSfZ8vdfvHsqECaFbIri9DJ2POy5TBLw0kI28IiU1jj6hG/jNig12zHy+7ct4hkS0b3+0wZKQSlA87dwV8C7F4Qq9szIKM9JiEDzjq9tPYu1F4STQZaYynxL9MQ0P9bK4SvpYPnc/3uPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211399; c=relaxed/simple;
	bh=rhJzPiPQh5PalUiLaJWP+g6zLitXs96Hl2pwoOg/lyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3xkCFfRMIHzVceQyV0FQDEFEKTnH97v2VXTLE2/fQxJ2ws0gu4tADhItQX8RoAF1jrmHX/Wg135zoMpYxnwVWPvIPLimc7I7dzjhFlNFTcJbdRyTSNH7QJ3aLFcjZT7Dto2cVQeKQMI3CXJcqDXdZ4fIHdHWwZQ5zENORV55OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikP0pt55; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4I6u4018680
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ThoA6YgpQiOg8S6pzAMpUUDGjl1Y3c4vNGfbI/06aRg=; b=ikP0pt55wblcGL3v
	pJdyHoy3ltPtPgHrg7x5YK6wk3DZnBbZtbTCsNBUpJASn4/yOXv0dSU+AyjANCxU
	nj/aqmoiwRw9ENISV+v+QDdK+bU3eR9KNmDaVc7DD/RdkfShJVCcO9nipftiHsXm
	13INjcakMMRUtBMqP1DgqeI9+kZATrrlKxc9Ra3u45YCrE8nYExt84+ffuE+tLe/
	X7E2eKsBvYJa+KW/BAJc8QYEGkRtHAMSvTSOYNiZUWyW/UTCPlPriDvG5C6JE6/l
	XlbrlmdTY4P2JwqySqHhWcCr9I+vZD20L41kvtGuFP3H6xqCpeva2QCG0BzFBBw2
	wTh+ww==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tqvht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:49:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befd39so10657351a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211395; x=1759816195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThoA6YgpQiOg8S6pzAMpUUDGjl1Y3c4vNGfbI/06aRg=;
        b=Gvsj67G0p1SrPl3f6KFCL6i580OtDkHlj6Zs/a45sFS3zbC5il8NRHm17/LZkqIunv
         I7oDT8HmgpGdEC7JEJFiVExOr4MQTOeb00wxZidHwKSB/+Kv/vK8lOv1xQwbLOmhC3UL
         N8K8SuaV44rzA13MpBfjgthfwwXOYub3MM8sqwiHCnqNLvoa0t3Pg80Q2tAOxWA6UVTM
         0ocR3gfuXh5f1oO5grvh9TQMSqEPznoggaZKmkDeuM+96i5Y5TXaxuBstE4ucjtS2+nG
         pqAVrmSKAU4Xcl0cnK7dCP5PS7a//ZX9fqs3LcHRVyr/aduM8Hdsm1L3y6elG2811zhI
         T5vA==
X-Gm-Message-State: AOJu0YzfLfeAZLmVf2tMT25vL7MOVP1WESMuJhQHuzh4cRPC4qKe+3mt
	KNlFkheERh8YgTNAU+dBUNVpmLfLZhiLfb7zadKfmxAJuzNO30QeAg6+BzpNqNbuohFD2LiSKn5
	mKn1lLvExRGUCM66IsTlm4/sdAv/0HL7nyXxpHsGe50spSKCsD9L/a3/qHBkhYbQ9d4fz
X-Gm-Gg: ASbGnctNde/2dUnIl8rYMo6gEUQ/dYk3Zia92zqgQifbvYdqPY8h90XHmWAgj7RiZHo
	Ex10HYYUUZ0i48sRT82+hwN35DNU0wAcy2ZVZu1mG1RYoRXIJA2gpMT8nn1yW++VBNLaBVEIAs6
	ohE89THx2W6pIYtb8LwY1+TnBtGM4GH66So/T/TgNnZZQ///N0EC/HoTMzR7p06NYCmhTikRigZ
	8wqo3rcF7KGPu9/hSQj0tfkvvbN6OBLVmgvWTeaf/zblfixqgt4TqgyqlVNCHQ9zNM3Mfi47m3v
	U1nqbuq/N2oLO2NfFDkJZfI6zekJjnjcVOTJ1WruAXfbRdsnChL3rSN3LphVm87urP5WVw==
X-Received: by 2002:a17:90b:1c8b:b0:338:3cea:608e with SMTP id 98e67ed59e1d1-3383cea6105mr3192214a91.31.1759211395352;
        Mon, 29 Sep 2025 22:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9p/WsjalDYjqqBpbBM4tMRq/jOyQCCf1RPlU4hhSKxmGGZ3ERYmjP7ysuZxVehRilUdsXhA==
X-Received: by 2002:a17:90b:1c8b:b0:338:3cea:608e with SMTP id 98e67ed59e1d1-3383cea6105mr3192176a91.31.1759211394945;
        Mon, 29 Sep 2025 22:49:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:49:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:06 +0530
Subject: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2182;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rhJzPiPQh5PalUiLaJWP+g6zLitXs96Hl2pwoOg/lyo=;
 b=xbW+/WfyGkVXE9qGR4vL2rV53p7Zg5bR2EqsFaz4PwejCII1l2bWl8VOPhhZuVJqksSfryW49
 6muGlSfGBPvAAZf7W+0AB1ZWW4WLIyqkaz4FRTNyzyZnC7VOG5a7jD3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXwaPcQ7JfuEeA
 7CBuNdV8VPtyQjJXJvyzv3wifExzXcxVx/E1/pRn2D0sDjnhf7KWiU4Elo6sGQpVa7rnMW8tHJX
 f+ec6LCchVXS3GVWEBKxqdleIRsLJLq9QOglvBusIjITrXaevNVavgczTiO8XBjpfASfnx2xEkI
 2ERl7EeLLaueRpKjNahALKXDb59Ft/bwbQrHDdEnFD0waftEhf0QSx4HlE9tE5JFHqHeXuQ2blT
 lV71rhi8mjeZw4HdNB5k0nuGmRs+f5Wamv2PHHeklzsxR5uOwaKf/zn5DdXrdS/7mwQC4MlUqZB
 4jScsUGEgGGQL6XOSBkCrGNxU/QCaXjFsI/5/L0fB4cqptd5tznFuFW40IiALaD7fSlALwH4ZUB
 rdqW03F0RsY5RcII0UjEFfoF2gJGfQ==
X-Proofpoint-GUID: jSENAfWi-cVZ1MjcluKIanjBMdb7lJV7
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db6f84 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=HBDVfrJ52KAmvMVrQVYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: jSENAfWi-cVZ1MjcluKIanjBMdb7lJV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

Add the ubwc configuration for Kaanapali chipset. This chipset brings
support for UBWC v6 version. The rest of the configurations remains
as usual.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 include/linux/soc/qcom/ubwc.h  |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231d770e00fe0aee1b5a95c7b8a6305..48dfd76efb34319b3cee29894ee4977f105d890a 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data kaanapali_data = {
+	.ubwc_enc_version = UBWC_6_0,
+	.ubwc_dec_version = UBWC_6_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -223,6 +233,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 1ed8b1b16bc90bea2ed54586edfe21beb2db04d4..0a4edfe3d96d4face2ef98622984c66939a68c53 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000
+#define UBWC_6_0 0x60000000
 
 #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);

-- 
2.51.0


