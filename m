Return-Path: <linux-arm-msm+bounces-58487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349D2ABC3D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DF9C7AA344
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7450C286D7A;
	Mon, 19 May 2025 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o99O5crK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA92288C86
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670675; cv=none; b=Z0zhErhW9EIKOPrsdXeVdsdDrnFTdTogRR0m9GDkoxbX/nrohqZZ2muv9lqQN1vwJFx+eZllux4WxjjgnAARZybhvR8BKlm05PnxnL2CoxIM471MktEbjUUrWD6O4M6ojnKnE8WQfA9LGzb7cRoRmicv0+v1S+nLMLbVynGGfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670675; c=relaxed/simple;
	bh=SQ58XAJu1DnF6IsV1si1mx+a7NOTGBAGcwnp2eDAzO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FlwVzzeKKrx9aysYguH9t+JsaGGGBZ3tYqLcFzIj5nmHGFHjAGNoylyT2O5JexQiIST3sxvfpbvbSRiwv5Qwp8QI15IszNQNe53n7bASec9P/XeIVMckBDmEqvWJPXn3joW/TsrHv3rKO2MBxQkbSaGYWzotG/QPv+aopSIfGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o99O5crK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ivsJ022840
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkwgbgLOgj4d3qvjEvXAKDmuRE8+O+K7/mbUy9e7Yv0=; b=o99O5crK873QodzC
	RIyWQOZY9oHz6k/48NXpcIM9JOQuM6eTf/U8MaoZoqTBZSu8eSRFDhHGTPY2GVYo
	plntw1EuqDLcksJL3lvj5gZHCshBANZ7htcYI/NV5+FYfFQsOUlbY5xbTFXrAOG/
	DxIlFTDSA9vhwwJfmEcLto1lEAQqfX8TSB4WNvN6ICa/WmELCGliHKIzjb2WjYhu
	hUd5bPqDgSjO63Px5S9WLiHal1GpBWlXFNGeOQjgw1dHOZ+bXbMvLKnZNgoI8RmK
	a+E3kbHt7t2VCFT25ZiXO5gLTJDsvl55XsIMDDI2R7zRw4DbbSSgihQxTp9S0rHd
	rhLjRA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d11ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:32 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-400b3a7e259so1738845b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670672; x=1748275472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkwgbgLOgj4d3qvjEvXAKDmuRE8+O+K7/mbUy9e7Yv0=;
        b=dNJzaVdZBjt3aNhxnQH0oazXEqAlQ4TYMXqkJx1DFaNiViIjwIlVFrrSL4CK7b6Y2r
         yLsyXb4GRFu5E84j6gv0QmDuqWg+INiPfTKha+WwUsittXEib0nfXlMqDnozTx1ZLRyP
         S1r3VTZl2HNmGXEP3Fiq2eemhlPOTUapYZZKrU7lGquIfyZvgf52EXtDl/zzIh8yewv/
         6m/hFewx6j+ZIBe9bXGAH6SAEzgPEh8JI+Wn8XsHi6ENqfkxWDOhuLp5VMkAG+8gNETT
         0U1yuBNKk4emZ2NyD1VH1RA7d+318tq9TSGjVS9qDM21zdx2LuEl7zYu4VjjbOTh1m+6
         mCOA==
X-Gm-Message-State: AOJu0YzIqu0j6SR+lvRx/YRy0z8XGZCBeUIfgDAyT4bXASMu/8oGovN0
	y9Luv/lHqk6H2V8MH5nMFBQxC6PdtNtxhY1yewQGOzQ+7JJQ86SSQ2qvidcLHqvbkIQ3RmB3g9j
	NCEJRhHImRRMyR1GkvIrXmMlJTAXBUvlfgBRsT6g1LZGj6KakxBrQJU704FhmutAm9HMu
X-Gm-Gg: ASbGncuYwLEOV1GVlWlgwdNgv0mBOaV4RECDRzumgl3bHgnuYcTavoNXhQ7PXL1dote
	4Ju1XnLi8Za70XQirqHK0GJ9v+KPtrCTRMbPLh9VSUuqR7nYK8brQ4qEGzW0ZSXjQ+Ld8a2sCSj
	LSPNNmhzCQcw/oJ/NxtKmUQ/Y7p6Ll/jMSmiOuHEqjNbYoG28sxi2Vvf+i3vyAnw9bwjYlm5U15
	/D+PJTF7kQCc0vTt+UMObvj9zCsOk1KQrEpfWmA7U3mm006ou6YnVdHNk3UmFhj+AahbF8uX9Vq
	2Qy4QMl3iCWuqI2b6I+Eodj7l2EvM1FZJ/BRmnn12rhAWd5aPjZdl/RYsrfrE2m48QMfxjbXJsd
	pjX1CX8XoiySFAaXgnK+g1177
X-Received: by 2002:a05:6808:6907:b0:404:f125:407 with SMTP id 5614622812f47-404f12504f9mr4618158b6e.19.1747670671763;
        Mon, 19 May 2025 09:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSISujwU8lrobwRd3mozh8yz/HYjzCWY1OeWbJw5uS6+xeKb62OMUpojjSAlgxFf1iosixJQ==
X-Received: by 2002:a05:6808:6907:b0:404:f125:407 with SMTP id 5614622812f47-404f12504f9mr4618105b6e.19.1747670671310;
        Mon, 19 May 2025 09:04:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:12 +0300
Subject: [PATCH v4 10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-10-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4FSjImmMI/5tZIFCML1RoMebVbAYsPcJFHUVlcmc8I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6fysDl8sDZ3MznEr3n4u1Qo2NCo2THp4WG
 YMMjC7SGW+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1RHmB/0d9Th9/V09WijgOOsdRNZa4hYTJSsYMTZcwglXLc8Wpa2fJLJoZQcEzErO/2s5taOYmS+
 3AHPUG3fvvoOV+a0yxWBKUvy5IYgiBqbpCFmuftqyh0FCZQ9OFWb4Wt/TwjkEG4i6rB2vx/5Zgo
 UXSdPcJrR+3qNgc8X0luwwrlUCwYlfsAnR7m2gMf8vlBSzdSnzYxRbAqgLGYrXukrM2TA1WfN93
 yi+IdfrxdxQus4jvxn4qM4FeFzmhzgJTPy81CGUPEY9UFB9cuyzXeKdYGMfbJLm/fdIbYTb6pZj
 1WRoizjQ4fQsXpDXDcymOROdH1pEWbBpSfiZEczh6YgyASnG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX9mB04sJ4YRvf
 a2v9difqgNUl9NhC8pvfPYw+gvKD5qkvIFDIsagIBTaHyBXAdjX7gDVYB8hvnyL+ggYgEnGyvPu
 6Zftvz0sHTDMSVonO3Gp9nQ9cs5yWvMnWZ77ge00MP+OgnRU1YyJIcVT0DEe84GbIM/N8I5vaZl
 8NPA8Osjtefq0tfM4/16kFVIyVCznQfKXwJh5tfPYvlomsjQtBFdjXLboJXXk4/u5VRZ7IK4PAD
 a0jCceV/IRTCFuj6/MDZI2cafPuIylEqekZgiAixNtLKqEUekXSh897s1DeQRXDjaMQytddmW4t
 I4S8Dt6qP+D075Ne0kp63kV9dSXVmiOAoT2fDqvZGjqwHfbdnWj5T5hljqbcbMsnzFr+s35QfnW
 4Ra0iqxUHJ6QYvYgoTy5yL2M+nQN6taYdwITwFDhhr+XzpN5KzoHymbPq4Udsg0Tsj3bygcq
X-Proofpoint-GUID: 2K3Lu_Ta1O-mneWApIdiB1jFPvIYYwvH
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b5690 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1CFBwsujT04XwbEipTUA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2K3Lu_Ta1O-mneWApIdiB1jFPvIYYwvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=844 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0863e5cfb3283ed32f61ddd4483220742df8633d..6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9981d090b689b46bbc378d1965b0efd1df0efa8b..82f04de6300eca7d05ece3ac880c26f3a56505b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -132,14 +132,12 @@ enum {
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
index 2dfb7db371a3915f663cf134e4dd62f92224185b..772df53bfc4fcc2ff976f66ef7339be1ae3da8f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -809,7 +809,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;

-- 
2.39.5


