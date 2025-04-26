Return-Path: <linux-arm-msm+bounces-55795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4DDA9D792
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 06:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739937B4DE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 04:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460D418FC92;
	Sat, 26 Apr 2025 04:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQAsrqBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354A17A2F2
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745643090; cv=none; b=ue4/mWDtvHe1MGAtMa5jTt6q6ZZ4jitf4DmT+oQtZwSoiMKhJPiEWo4UtFd04dY6zGYWclKXEVMivfGtbzEtbtWquqGvQPi5C8iWuSgUoGuPLLpbs92hb0sYvKvhe5bYjSGC5d7C9EqsOBaNh9gubVQpD3/OolngynSfsJaECk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745643090; c=relaxed/simple;
	bh=iMiCeuSS6c+MNg1BWLzFH2DHd4gbjoEUZDGhbbUcnh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gBzAQUMm61OoVz9f2K/Ho4sMXOBtIBOgUs3aYOHSi8mIBfeSMtW0MbTDKnI3rqrpboOyPARfKiHhdoex6+Q1qSL/AYAcmHdrQRx/4gCUpd6Ox1XE7ooX/2e8oy+giHTG6Ec9zIwNFcXA+Rvhe9WXQ+6xdUrrI9Hwma+ws6OhLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQAsrqBO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0gsZo022648
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 04:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M/vRUlRtGuP1B6i19VOq2Z
	Bz1QZQbyfUTe2jgvfQeA8=; b=WQAsrqBOZRjtsM5vH9RcSQ2WvabZUiTs9+F/hO
	nDj83kZOIGKu/ND0JIjLZ18c0uuCTXyzG1iPiLPgoXvnhnofAgLxyOfJ6w2JRv7e
	Mex2laiI73dLWfJXYUyaiIj+bawRHk2Rv4LAMRRdYR/wKE+bae8aAr28Pu8La1of
	HYY7kFNez+k9klbqLe9PyNezy9l60q5xVYJI283c3C0+FaFPYwcuS3ksLxncbrgB
	xyRKkiNYgPUWeVD56wh2havXD4UTq8E7iGeOD3v/eiDAgwgldtWakUHd+ni3WlmN
	XkoULzb3UXiLnoiNDEQ3TGmiH4WUtYi3NjD32YiJYmQrw35A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6j8cpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 04:51:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c92425a8b1so494885485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 21:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745643085; x=1746247885;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/vRUlRtGuP1B6i19VOq2ZBz1QZQbyfUTe2jgvfQeA8=;
        b=AVF7apiJIgb5Pf3Pmn7T38vq/nx5ID6UKDQxs8L4eIJQ5ClaC/sBjktTcFn8UJE1eM
         uQuI7R9/XOxiB602Qhd1lY8P8XWdJNFyFJGg8zRCM9FtuSv8HmwjoBSAdb2iL/dVf4Kx
         7iIBJVRfWRpz1zvBoNVndzFRJW/2UvbLyRV/3pNxp7RpCEGiz+zUp15zFzB3AL6wT9dc
         APHOjFW5XoxwoIcPteIez5lKa0wEeHa3TfBJcl01bwOGiWq3cYgDCi92pDi4+kFUFcj5
         lAzsOwMIwvsBOMKl7zDJ67k4ouSHpBkw5jrcaXOEG/PSmy9J3ystH5DJ42WEQplNIi7Z
         Tp4Q==
X-Gm-Message-State: AOJu0Yy8zIlmrN5s6Kl6MTlo8fLWfD1s3+SoIuZnqgapuu1duFPjZzHT
	if2FQTIYhWakAMJ85BC9siEo1Mg96hhNhy4/qTM8Irukp10/DDO2Xs9M3f8ewwuvWAOSzrRQsGT
	BqVW9bR+Sja/0Zo/FQuDj/RpkAsMio/O8UZkCGep4Et/4P+uwF+iDCasnLjiPPg4C2pWTtGkA
X-Gm-Gg: ASbGnctsUcpoyPp1IX8JNxGfIKmZkZl4hl41/9Skoul+H9BEl69X48iopgCvj8hMXcw
	4nsTG5NvoSegyEqjgtHDE32X3l2zkhPtmzBU7jri8QlVe0HQbG3T0jq+lxHh7klNGfg8atmtg6h
	Z59TPzExxyej7GqTo80WzeMYN5qsQmyTIV4WMqXsd8AWUuu1hpjcT3TBKb+U1I4rvOt6cmXpsU/
	wtqC9qlFcQah3WuALZeXAeSRL0MRlr+t5kkxG0RE+YJXY9JdqnHRMoMTFu2+Exo7Wnot+0IRneD
	FknaL6ioDsDcGlqhNhMInffQXogImcI6dgVlOUN6ordWNKZHe/qg95mnCI8cF0dcCpPU4cq1uTo
	zY0p6UGiLHMRGKtN+hrlRsPiL
X-Received: by 2002:a05:620a:410c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c9585e4f8amr1389050885a.17.1745643085038;
        Fri, 25 Apr 2025 21:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS+5iXVyeLi/uuarwcn2rcygT2YD15yqXIwjFvPYHzO1HEziTA19ChjNR3JwyIgBNCUB61LQ==
X-Received: by 2002:a05:620a:410c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c9585e4f8amr1389048785a.17.1745643084603;
        Fri, 25 Apr 2025 21:51:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659c1dsm10670491fa.1.2025.04.25.21.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 21:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 07:51:17 +0300
Subject: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAERmDGgC/3XMQQrCMBCF4auUrI00aWbauPIe4iI00zYgTUg0K
 KV3Ny24EHH5Hnz/whJFR4mdqoVFyi45P5fRHirWT2YeiTtbNpO1VEIK4DY8eJpMJJ5SCLwFA4h
 EveiAFRQiDe65By/XsieX7j6+9n6G7f2bysAFRwQrEUXXDPp8c7OJ/ujjyLZWxo+HWsr2x2Pxy
 irUWtRDo7/9uq5vBiLsz+0AAAA=
X-Change-ID: 20241215-dpu-share-sspp-75a566eec185
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10784;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cvM+rFSttFrCnA5Dtpe9rwoSgqfSbbDaMnA+P4ETru4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoDGZLeUbhv5769s7b6SZbhNjOUa5WNq7iG+Fqy
 3roFPEfSi+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAxmSwAKCRCLPIo+Aiko
 1ZzqB/4ww/TtJNnE8uEyKaYbzOMHOKh372Uw3w4Ods/he1s+dAgfMGYEIFhSHRrwn+g/8K8UyLB
 FLPyhoZqsDZyLxm8nqAxSmCMYfN57KV0WShuHHJ+kki04wZX22O1FbXt9MxO4buu2pOSOY1BIlH
 JlQkVmYKFBMHcmz506WPoaExhQCb24/c4LYlhc3PC+OeZm/CY+0S5ppozcOfIvf1papq1FK2BaV
 7B2XWhoQNMKDQkSUSm2qgI7WWiUXBB6A0qyocPbx7PTEHl84ukZx0ENVUiQiItsvKpScQf4/iph
 lzXTSuMS9M6qSBoT1+M0mRbzJZ37DznJ0gnXusq/itNbkUs7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfXyBXUGV2QkMPH 60eZYg3dmqZuMQ2txsypGqlmOueIuVNwgBG7BUr/SOUaA+2WurElRz9XvhYXP3cQHSBuU4LkYhN Uy/hJmhwwgXk6O+L7VbWpdSAOq2kRhFYB+KzRicl4TOqyo0NL4VwLxBTEDy/KrrMhoCrmNsRpbW
 1y0llRAU7RbQUJPglifnQRhvkwlW+DhO/sm4HaayKx9eB8+twKJMFUT/S8NnddYrULiR76Abq+9 4ZRbYmLydJS5FtiWskBMcaLCl1E4f84QDeA3p9aKU5q0L3bd4Cu7vVkgVVPU7zycYfpCkbLqxUR jdcLb+9Xmm93k/AlEtUEYS9WsmJwPI36ua/hGW/hnpgLc2zdNEoU7fzaFClFkh6Da3pBasBBA2L
 7d8z0bWEGqYumUpCYE+h4b8pYrNFme8vwaYEfDxYLYHmvlKaLhgLetwiB/o6NScdrMGcQo/z
X-Proofpoint-GUID: jwR8JyohnTuY_17boFmG7Wj6hOobIYSO
X-Proofpoint-ORIG-GUID: jwR8JyohnTuY_17boFmG7Wj6hOobIYSO
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680c664f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8xA1kSRHgp9pt_5ip2oA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Since SmartDMA planes provide two rectangles, it is possible to use them
to drive two different DRM planes, first plane getting the rect_0,
another one using rect_1 of the same SSPP. The sharing algorithm is
pretty simple, it requires that each of the planes can be driven by the
single rectangle and only consecutive planes are considered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This patch has been deferred from v4 of virtual wide patchset to
simplify the merging path. Now as the wide planes have been merged, pick
up the patch that allows sharing of the SSPPs between two planes.
---
Changes in v7:
- Fixed typo (adjancent -> adjacent) (Abhinav)
- Link to v6: https://lore.kernel.org/r/20250227-dpu-share-sspp-v6-1-4d469910f399@linaro.org

Changes in v6:
- Fixed typo (consecutive) in the commit message (Abhinav)
- Renamed prev_plane_state to prev_adjancent_plane_state (Abhinav)
- Renamed prev_pstate to prev_adjancent_pstate as a followup to the
  previous change
- Link to v5: https://lore.kernel.org/r/20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org

Changes in v5:
- Rebased on top of the current msm-next-lumag
- Renamed dpu_plane_try_multirect() to dpu_plane_try_multirect_shared()
  (Abhinav)
- Link to v4: https://lore.kernel.org/dri-devel/20240314000216.392549-11-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 156 +++++++++++++++++++++++++-----
 1 file changed, 130 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e03d6091f73640af96604a46740d58ae1f1fced1..421138bc3cb779c45fcfd5319056f0d31c862452 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -915,10 +915,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
-						   const struct msm_format *fmt,
-						   uint32_t max_linewidth)
+static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
+					  struct dpu_sw_pipe_cfg *pipe_cfg,
+					  const struct msm_format *fmt)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -930,10 +929,6 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
-	if (MSM_FORMAT_IS_UBWC(fmt) &&
-	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
-		return false;
-
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -941,6 +936,27 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	return true;
 }
 
+static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
+					 const struct msm_format *fmt,
+					 uint32_t max_linewidth)
+{
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt) &&
+		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
+}
+
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -1002,6 +1018,69 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
 	return true;
 }
 
+static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
+					  struct dpu_plane_state *prev_adjacent_pstate,
+					  const struct msm_format *fmt,
+					  uint32_t max_linewidth)
+{
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe;
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg;
+	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
+	u16 max_tile_height = 1;
+
+	if (prev_adjacent_pstate->r_pipe.sspp != NULL ||
+	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
+		return false;
+
+	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt))
+		max_tile_height = max(max_tile_height, fmt->tile_height);
+
+	if (MSM_FORMAT_IS_UBWC(prev_fmt))
+		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->sspp = NULL;
+
+	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
+	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
+	     prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		return true;
+	}
+
+	if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
+	    prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -1102,13 +1181,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_adjacent_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1120,6 +1200,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_adjacent_pstate = prev_adjacent_plane_state ?
+		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1138,24 +1220,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		if (!prev_adjacent_pstate ||
+		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
+						    dpu_kms->catalog->caps->max_linewidth)) {
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
 
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
+			r_pipe->sspp = NULL;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	} else {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
 			return -ENODEV;
 
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+						      pipe->sspp,
+						      msm_framebuffer_format(plane_state->fb),
+						      dpu_kms->catalog->caps->max_linewidth)) {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
@@ -1168,6 +1268,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
+	struct drm_plane_state *prev_adjacent_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1177,9 +1278,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			continue;
 
 		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
-							 state, plane_state);
+							     state, plane_state,
+							     prev_adjacent_plane_state);
 		if (ret)
-			return ret;
+			break;
+
+		prev_adjacent_plane_state = plane_state;
 	}
 
 	return 0;

---
base-commit: 6c0be3e511b9191b90bc73af10f93f0f62b8cbe8
change-id: 20241215-dpu-share-sspp-75a566eec185

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


