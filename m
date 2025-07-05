Return-Path: <linux-arm-msm+bounces-63780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6E9AF9DBD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 04:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 214CC4876E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 02:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AEB194A60;
	Sat,  5 Jul 2025 02:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEvRdK7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8012E371A
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683652; cv=none; b=G+LzdV/roK1N7l9bbVcJ0tHqwrgggBoDcJHjafuEx6lEpuR+Hi6HK99BYSgsLJ9Y8Ug1L0qT7hD1rZVtKeTmfhmyLz6N3K2A0+Ex3mMtWqzCkuGf6BC4VoaI5+moONXn10oVQjU2JAteLF9XTGj2CqJwxPsrRgbEoTnNFzOIbYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683652; c=relaxed/simple;
	bh=a02lPmZKv/naTYZA9OmQPxvGdxGzUfJ3jTjVREOZLAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXfhRdgFRma6AVqb3qJt2+KBnnOHh99ps2QRn15uccUKg7BCj+z0Wqjpw3Uv0zKR+PHsraAe+qCV4BKKtZ9xqrDu1+rzhRwJ14HwRcfkklZnPuK+wbRj/giwKpwql2bja3hzmS+vpz0sWEjnsAtdRG+sxRGTsSWZZXC264xMcgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEvRdK7v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650O8l5011373
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 02:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gjy4TsFninVe5bPVihlWoJ
	GRkiWlNHpU3ZfSz9r0mGI=; b=KEvRdK7vKZsc64O1isantDYYOvYOQKNHrxauG6
	ConzIya7qW1oBjk7wAHtrNccPxFztnk4H9CaGfHaMZHSK3becWugA/dpW40gGkWl
	JKWmmqnOi2OnDE8vm/UiV8JH2S6Z9EcvK95gSuWGsQdWqXMYaXUh8iUBpbLCJ6+X
	QDd3rx9ItRWDcsZJfMaHE7wCaMGPDBKZ/vGQpZcBRL3ASLNqFcJnvEf5CxM0GIt9
	Vfvlm6iEUdlqxV1hMV1dgne54Ydnw/T3CpLGokTs76qg0AM3Po8/Cen/bPMCDY1f
	8CPjQ88IxILEqRttzb+WUD07LmTTxxpq91LDksLPVtCSh40A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxw9wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 02:47:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a7f2ca9536so48950371cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 19:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683648; x=1752288448;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjy4TsFninVe5bPVihlWoJGRkiWlNHpU3ZfSz9r0mGI=;
        b=tR9XNTYn9GN8BZ1VzUuY/sJqcBPDqCbVzqGyLvVqwkcBIJl/ncDNDnA3hK48ZPsz1A
         8EFO9XtuByzDoK3UCNxr2Yje5x4bvs/n94UEVphcTUiLDMPnPnumUD1b8KlhbpP8zdNb
         946KBgLx+EoYk1/vDyAI0QQrbO626ryVmPsWqqN+rl7Js7JNwxeyAClvDKsn+YdjpArH
         b45eLmX0Z5e2hFBt1J8nwOrVqi6HWnyCXfIyLUPldNohvkMPJkofM/LyYMcR0sLlgWQK
         Y1L+v8FMTPE6cnVso39YK551ZKY2EjyIhUIXsNL0YHEpleu+shbRwbN1L41zHP9arjf0
         SWsw==
X-Gm-Message-State: AOJu0YzVEhLrCKzbbNCj+DZWRXRTwZ5mAQkqpZudgb0KnxCz7rYWzxZa
	k+cs8MAeVuTN7DZ+xH1j5jKuD+2kCZqUOK+4MnNQWS8lO1MJe8EfasLRV25Nc7fdQJlwhBQ1ykO
	W5foKidiOSBgzVZC5GXvV4bz131eSAGXgjRQX3KzeIA6Z71uyjwMXOZS8doLbAepPJZmBkkE4yE
	N1AUI=
X-Gm-Gg: ASbGncukpcNVOp3GUZYfxLUTwYc7p/kwuvpiIZR6JaSL67qtkEoOnVN/rPwY/VFch3W
	htKccQkTzDtlR4K4/V2vubq9o0dPXm2ZBuEpDXc/9NlAMVhNhh4jGKL+OQ78xghXHW4BgSRz7OU
	hmaaobXNnbMihM+atkurZUi8YH09E1adq5hUvGPYOIKD5r0hK0KphmMeCBWcBztvY6oPpg0+P9x
	kxnSSEZPLgzJGb97GW1JawGcFQbb3iGoSyTcOjMDqphLMgbrzi+Nh3RTGei0l2RnG6eWKNWnfCc
	Bbuh7cxy1LIbQjVEcuaeyvuSS1RwccRz58ZAVBF8K9uAHrajM8k5pkxup6xVgdkob7f0MMOKyF+
	9/5gDKNCqY6Esf19Fm+JY2cTrpQGnc10oP7w=
X-Received: by 2002:a05:620a:2485:b0:7d3:9218:6d1b with SMTP id af79cd13be357-7d5effa5066mr170819585a.25.1751683648234;
        Fri, 04 Jul 2025 19:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMjGKSOCRv6Aeyw2vw6oMPWzpEEhkYFVFUNj5HTXRFl2we4vDYiTxbSAstbuCsTQWU2PJ0sA==
X-Received: by 2002:a05:620a:2485:b0:7d3:9218:6d1b with SMTP id af79cd13be357-7d5effa5066mr170817285a.25.1751683647785;
        Fri, 04 Jul 2025 19:47:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/12] drm/msm/dpu: rework format handling code
Date: Sat, 05 Jul 2025 05:47:21 +0300
Message-Id: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmSaGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNT3ZSCUt20/KLcxJJiXYMU08RUkxTDRMMkSyWgjoKi1LTMCrBp0bG
 1tQC+/D1DXQAAAA==
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=a02lPmZKv/naTYZA9OmQPxvGdxGzUfJ3jTjVREOZLAI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI82lipzpyCC4LKN7ThdLaL0Fuf/bVrrEFXL
 N5kmFgLvi6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1avgB/9tgZuAoAH5++lDQAjlCepbdpElh8X9Ms6JNzVhuMPPabCS0iVhoseTNfDSNRIsDHuNqlr
 r0LPD/AvQDvHxoW1x364Z/uayPIkC0wFq0jw0BCdzhMadMGEukEVv2hmgG5GWBZAFN40egpPmGV
 MUP3TOrXlRv4CFBcCBnob3qm+c/EWMGb7pDlFOyGyNi6vVqZx9CfgSVCu6sZSkC7VdUe4a3lr9Y
 mnI/ugKxuBeamrAb/WW/Jsdvl5d7AcXSqObpe7RmcDUap+F/5NukqJNcagojo32b0RyBPcBiTa/
 FlnUHvKFxm+YbJvh66rI/3t2d6WXnpP5NTq0SJ8d6oWAio+m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNiBTYWx0ZWRfX9kHuCXkG6A2y
 RTyRXl3xBltJg9xu6tzq3Wkcu733H+G971R9mxwttreUROMIIJcgzBW80CJyEPbTLmBrLQLgd8F
 njowKtu/zX1+q9RhAFCaRXRFtVFCtxJBabn6reIxjdBVyjkczeqH4f2+Q3KrkGAHuPuo1Ss/gN3
 bQi9RrvqG2EZppqx6jhObNU45OEeefXX7PN+PeNBoBDyBonV/i+bVayyyiXRUfS7uTqMTvMNAQf
 beAaz+Tvz9OCwQYGw9J1R3w8DxNNa7ZxItaGPMj1dNHiBZIzrKAoymrjJgFKtobyMiBGOqh6zqc
 JDyV05ArVTJVwB8HUYrkMx5v248AZNOOMkjB+B0g+KAEZKUxFc7JS321ikZGLV6gGUfqkrsL2Jm
 /bfMslNVZly/KPEieY5QROVPV76NNZx3JolmMS7ZMP9PQMkFDdnxL3BWFdIS16xKCKCnf5qL
X-Proofpoint-GUID: qTcxjeG71T_f41VqL8UYiSjAJr4IfSSe
X-Proofpoint-ORIG-GUID: qTcxjeG71T_f41VqL8UYiSjAJr4IfSSe
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68689241 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ilABv6Z8GYNuw7svrMYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=924 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050016

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  178 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
 3 files changed, 394 insertions(+), 1553 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry


