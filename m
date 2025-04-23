Return-Path: <linux-arm-msm+bounces-55199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16490A99A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2AF3BC3CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6BA293B77;
	Wed, 23 Apr 2025 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyklh5Dp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8885C20E70B
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442643; cv=none; b=ECgjc5kivL+oMBt1nklpqSsi5UNQAnShuj5iYpklFkPFLmGYnY4YSI+iLg95R92gpjy/j5OD1CTCB390r7O+S/blhOqF9MuAaEF2mCWkqZQunm0cpeEWDYaJmjy9HZinCeUjUhAmJkmEIus4c0UPPdpPOB+gaL9xlxVq9ucT9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442643; c=relaxed/simple;
	bh=7r9RWggBDSMXZAH5HlFjEpiq1WuhWEPI7wswZtyLtaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzTsIMS5S2NTjkQ60gpGfA76Nur+zkOR+TUPmdKHSVO2XZxV6eBdOPVsE/UNwMb9LTOPzMm5BvUpSSSAHuEkuXB5pLNRGfdhpsFyTPBfYuiQIcGiD6/44GvP6ASEtzX55CrnisCPjGwdQj/2GGY+Y6r0kki0bO6ygBEH7TR5kQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyklh5Dp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAPC5v008429
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wU2b7WfJGWmDy7O3q2e4zKnSnfMJfQufOtUC0ao9gYc=; b=hyklh5DpWrYWgT6j
	jF5UOfHhmQXYfFXU0xaIm4h1FZBZGsX3wBlUVOJBqcVAh/tPLyAEsJZY0XzdLZzJ
	25Ah54YYAF7g4KlG7BVe8OCEDt0D2RJBlef3MAs9Lwlysxv7eZ/oBUEM9ELOB3hQ
	vj1TRguvRboR0bsTdS3NDMma8BB4DNDolq/udlLPLMKbNgpinX6gSoDoTr8A0yrl
	ZYcQLMjZM38JhdN3/JdSsHF1IgjYTrMqr70pxAKybbQ0C1SPHdF7VvaoIi98S7zt
	HW3C4EsNYSuxAlW1VXCLqE/tOK6UU5PcXyTmrN+npMIPMH+Wio8Vx2DhtVuqQgsM
	gUKYtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5bdqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so60320685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442632; x=1746047432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wU2b7WfJGWmDy7O3q2e4zKnSnfMJfQufOtUC0ao9gYc=;
        b=k4NyDQ85rzdG0ObCmUqud6OpkFYwuFpbn32/VXw9VFocgdY2Ng4wlm1kY5xbwe4lI6
         IX4Dpi51uHI6e3x5bH2R0yADtGP98J9BvP/IFd8KIeY0Kvfaffj6J3cUyC8nfDHV5vAd
         3oyYGJz8bTiBwMALsruyxWZ3LEN8UHUohV/dg6/fokMttEJwKLilkGuUIy0o9JfDEqJ2
         T5y0I/yQMtfp3SWEK4uJlRTarnUYr/ZKsHwT9eHzxAbBg8m7ZU6N9P501u/fxKOTp9jC
         ZkDhwrmZzxdj9Sffnc42s3AQRS+VuUmwEuqBsc13U9Ah1uXfzSecWB5CQblAd8At5NwB
         5HtA==
X-Gm-Message-State: AOJu0YzQSUrTnKk6LhrhqZrSZwdRULh8aiki0sr25Qx04GpgZbtSYPgz
	BxwynX/AXOcUhBN2Fj5sh5+Yq5OsCsnrQoKihDKp1Dx2Z33anqEc2a5MtSbQMrSKqyPZv5j4Q4U
	rR37RNNYBeS/yeIZfo5dg9GaYzFKVUiDYMnol39eqoZaOVWCFzRo1KENS6jgttJUx
X-Gm-Gg: ASbGnct76EDNLQoXuK+d12Zh2FIEXekcYymWKV/UF3lwzVJ+Ij0SuIiTm2X+LOLI9AQ
	2GwJ210MO/1OnwLm1xVDDmVMajiKXMftoM5hHUtFRtfz+3gBy9jQplcko/mhbyDS3jBzDxEvRWi
	EeI379o4epnfExkbIAVIiVsx5DXVD4fJvXMeie5l8jIaT9XLpmTrIc5tzTm/WhbipN3TSP5SHje
	uz7WCKGgGM9DO0uFZaoZAVB2R734KLHZShv7HOyqdt8DypIPzoaNSVZjZE+xfAS4dLqIfL7/jIf
	CMIDPEa5Q2jhaA2T/vdU3cJkEdmhtbnAoNj0ZBgydvkZ/Z0wPezMJRnPsLaaXMUsCvQONV20VXv
	FMrmSulyFndjxLoklOsk+Hdek
X-Received: by 2002:a05:620a:4306:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c9577f5f9amr14943685a.4.1745442632481;
        Wed, 23 Apr 2025 14:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmewskMEPP6s5DobLR1sTztqQ+ubcgGXuvXsjj++JR0bGf/EfOca/ZAlrhkxjPq4F4IC2xMw==
X-Received: by 2002:a05:620a:4306:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c9577f5f9amr14941385a.4.1745442632155;
        Wed, 23 Apr 2025 14:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:06 +0300
Subject: [PATCH v2 10/33] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-10-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DsDYyaEtmcEU0Q3DXm3LKbekIuXiOgkLRrmoNbxq0Rs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcrYuy68P+aFAst+64lDjz2r1QUnWPTC/ioG
 m+VsW9g8O2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKwAKCRCLPIo+Aiko
 1ZXFB/9Tg6zrWMlR/btCGy5hpZnnysbbj2S9t0oeK+N1SVTNATupVvE0v0ItHeJ/ukwiUP70xXl
 OX8fMKWtnEKpN5vpzpunp2YYa7Ylow/QePSZeT0eNE8C2gAZM1aVqftxmR6QirQFUyetFTJcJ44
 H/sB40DGQeNdbu1YC+/NyqHiuerWa6ETpeLZ6qpifvKPmeGPRo5vYdIMk+tFBbfuDAs/ZJxCNUM
 mqgfXWEFuQbZwcCZuwnjj+ZRK01h5lSFMvqvq7ag1yio8TrY/WsjA3qaa4Iswj28PqdAPm7kKPW
 DuSr3Jssa0YqGaQPXyhrBLugW4nVAnHe/rPK4i86wJXtqpo/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX7bVC/2xJ/MhA K7nRHtSqGtmSjT54vjPExpMAAKGoEw2F9lAqhomXjaf2olCip4cL51YJluaJTZi6t+zBHbjXR35 uPY5O1+qLFNe/yyC2Mh8fc4XjHoasRgMDrLwVJ9lENEhGoq8kjZPxjFuPnFX4EbWt4BTSn0MXZj
 y4JG4K2pese3nuCAavyW3mE1JzCzdGx6oEZ+OtU7XN4UXKBJKauJiiTCtBAalaw2vxkaAzw5rsf lnC9I/UzNBAhrhZ/cdhX6DKksVj3Xndosh/YJZCBVtvPL9aoppFUpCFNzCjKM0smXj8q736pyjO u+OT+tVW5Tw9QvgBEi63Px6Y5lDi3cdKJAS+KISs0Ge30z/1tfQ9/W6NSELGEbAQpQ8w6avNIOm
 FjBPe+pnRUtAzUfb1UltDrEBeSKY5v33DUmTVjrN8P1RaLFIAZ8dWxmKy1cSaLmYUjliUOz3
X-Proofpoint-GUID: 8a1wQ6I5EyvYMzwvKEdeTL0zjLtP99Mj
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=68095750 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=k2A94KsD3O5M_qN9siwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8a1wQ6I5EyvYMzwvKEdeTL0zjLtP99Mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=896
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0fcc9fb975c0955f459ba4264b6a114a4b17af52..3431b3c956486aee99664ea9b7c2e00f5c130b7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b6c45ed4fa3d18ed21c2a2547b0d5af4debd974e..ae168e73026d8ebbe605397c6bbd95552193498c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,14 +134,12 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index c63a6cbd07d94acae04b6edf534b1a7f5d4119b1..593da532d40042ca31fb452679d3de04c3b0d1a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -786,7 +786,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 
 	c->idx = cfg->id;

-- 
2.39.5


