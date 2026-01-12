Return-Path: <linux-arm-msm+bounces-88431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E507CD106C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59E31301664D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02211307492;
	Mon, 12 Jan 2026 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfNDDyAu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbRJl++E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1863074AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187498; cv=none; b=FAZaohkgEmkiTz2m0YDIyktxxOcF9tITX09xWN2vn6OjTcHI0dHJ7/zX8ogpqljokAzR/veFyCKVuaA9J0qWy1KTL1pVxbcXleB6hKMy+YZdhQUuBkW8aFspCYSvyVqpn7zFzfOXPTFYUoDuYJDW1lDMY+4EOXpEMX+U/Z9guKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187498; c=relaxed/simple;
	bh=ejbCBQIpna1ELt09k/ouLInkoTDOytj2LHpvDQZ21q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qO03dIB5VNEnkYjI29LcUbuEoxLp+SLq2a82YaN1djK97x7WbDJgQS2PGWSOSRf7s/gi1iPgdMeGgVmH1wfZvTCAy25xi5P12hdXVBq3qHFUwXxW705odP4nYlwWaAhdQcTnXrb9oqb1U3xN30NVyvOLxJK1BX1HTUuWmkL1Qms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfNDDyAu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbRJl++E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNXHSg4040856
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1Jj6HfQs830qewBdEitC1pxLG3rqlsSPLwn7PN1UEQ=; b=QfNDDyAuvxC9fAyr
	/7LHGN7EG2JUmWNF3rqFS6vtMuhtQxvpK8YsLoNSY+GRN7AB0YYZkvf65DWwolyX
	hVGtTMdUirgLGkFrxfRmud1AMoCa9EXZTMzLTNIZlNIfdgyiW9sIckdspqUZiU4f
	Q7NYP1RB4Lh4k8fH7JrvziaUxCkWjNxYqAaxnSpVP924jHY48HHy10vAdAYnkmxA
	PPn7PK9grKvqBF871V5idV9OiYkBNw+XbziuDKY8RDMwMgBBliHSOT4Fe+gX/JOG
	6sD0aQ7wcxpb3Wg2486CknA1kbYrVdHnEA1dnqGm+6RgoRMP5zNnxoUnDTF1zKXH
	myD8cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeuskarg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b234bae2a7so1710080385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187495; x=1768792295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1Jj6HfQs830qewBdEitC1pxLG3rqlsSPLwn7PN1UEQ=;
        b=jbRJl++Evz25roGJqFD8Ig+hFXxsu2OaYn+Up+5wbyRepAYenskhllJL6Yh7MY8UGO
         nZwIWU9vwWm9M1hXa1cqs2pHXqfyb+XpPHIcWdSJ5K4vP06LzKQ5TpBNWAxBmEm4JOqD
         621QIVUd7pn+Jvpq7L0Ps/JUkHHLFBOm+U0XOUg2h3LI/rriIr+blojV408HNqH7QSk6
         vLr5pXzRaUckKs+uRB8fBRvJB0mLqNt95MnGwqIEn0B0CzgU1gWS7AGZRWbJPPEiS4tU
         7DJVd10tKef71uiYkqYmn1Ga6iPpW68lfmbnFGi4o6n9CiXZ6+rvwnT7hTZF4FHuyRpy
         USPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187495; x=1768792295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1Jj6HfQs830qewBdEitC1pxLG3rqlsSPLwn7PN1UEQ=;
        b=huygz5+bI6NG01rM7pCx2zpzH1j5LKqEcim8wjuJTL8lvNIRPZmxJguI/GtdzVjaAC
         ya2/hy8c3czTdSzL0jWfgNb/OJC9NZExi1yfb0SY0Eud9eaIx6RLTZAR9iPE4iVdfdu/
         iQ7zFYPzfdrfi3ACu5dpvPKCtvvSkOyyySSULYFgN+iOisnubiWzsCtxj/4GEDD700sv
         vj+JAY5wxgfcnxQ9iVk82vNM7IndF7c+q9yHknP2I1dhHCAaN9AluwnIVJuiXGfe3ezw
         02wL+j7aXzdJ8YZOfuXL/km/OddJUgVqibHTgl/0iKaGbiiesXEQAIchRZ8Scrc+IAxY
         urUg==
X-Gm-Message-State: AOJu0Yzd7VXzYWos/TxH3Jz60NaC7B9zYPzOLVQq0stRKYmw/444gtwO
	TRgCTQdfQGuPz4/hFdX71UQoO/wMEs21sEhB/jRJ0fQN+1cFw6G8yAp+OZSkBnJfl2pZWZXyg24
	W5afqKNO4Czt4RrQAttdPmPUpbLGtBM1kcIguKA7EeQXIxTlxNaESz+QI1od+ZG57h/hw
X-Gm-Gg: AY/fxX4EKC0FwxzZv50MpNrH/BuaHpsQQD6mdykMRx4yCZFjLSG3IQEieak/keU34Wm
	xndY/fdnKd0F7WmM7OWCWKrDfH3Fmj+pRbkvgi6EAo6YQatiWy/RcBECr3F16Om2+RNMJBLt3hB
	cjoO+6KgoQQcc25QMpMERR9mlSjMqACnSWni9bwYc5TmuQPjlOLT/mNnjGS7FxI6ojZU1GOuuCU
	l4qdnkyGyAJhXVtFLdQAywyWazAWmRo447V8WcRjp6XhHFZVd8z9qBUAM995xWwChi+IyX9fJAd
	1wl0T9rOSnr+mjUZU5jnDmlllKKLf7G1zOanLqHAHJ8ECV+Jaig1kcStWl+sEbFqzCPbm2NVc0x
	mQoWRepTwF/nh3mQbQVKPUna+CyC7B4qxgX35yI9jtetO/krxs6/6s4dWTgrKKxc/WKfkGS+phl
	yTDB8WlV8ZUVclAq6lFKbej0Q=
X-Received: by 2002:a05:620a:410e:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8c389392416mr2378505885a.22.1768187495558;
        Sun, 11 Jan 2026 19:11:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiJijfTIF1JSRTjd9Fcs4Yk1AxxiPK5XjnIz5M2eyUEPX3SkCPKnmCL2s9tMXuBQcymkTNdg==
X-Received: by 2002:a05:620a:410e:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8c389392416mr2378503885a.22.1768187495093;
        Sun, 11 Jan 2026 19:11:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b792cf330sm2758871e87.102.2026.01.11.19.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:11:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:11:29 +0200
Subject: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC max
 width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
In-Reply-To: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6614;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tNjh0r34a+FDv5at3WLQ8j6gBFs5H/9B9gKUXy6BkXI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGZjQ4t0vSXdcmCQmvZ8orjwRnW6KiBAGxocB
 lxH0XQHF0qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRmYwAKCRCLPIo+Aiko
 1bhHB/9ufpYx4wztso8sYPbJ5aV2yBHBJYRO+kfc8RUEiYcYnjXW581UUlT575IYxZbXE8bDojM
 5PGOLun8kz9qr6axBytVKUCAr5YXoi14SVCKTc+AMWM/roDnL5010Y3bCIudvY1BOP6Nb3YzpJQ
 7CLjQyhIwVIrvLOPvXDKqriE3JhWWaGa0ny0J0C/H4cELfeMzzuQkL+lKiFQXUm4o9yoTPy5kXD
 5mI/CXNWzMwqTFxWDznR09w+50hL46X+kN66kHOR9XSIBVanLSzN/ZY2LEQhwQhk/B3iWDVOCOt
 z+VDRyp7gOwZ/wlyuMDDEU6/jLT0AUWZIquqPpFckmVP72/T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Hi7Uqk-ryC3GTacTcjsI_svPK3EBom2a
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=69646668 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=LLqVbBr0KbdSWhQ7gwEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: Hi7Uqk-ryC3GTacTcjsI_svPK3EBom2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX8fbZrqJ1SI57
 lEMNTot5Py4RxU46xdM4titHQS5RLoiJiJxZ883H8D+zrZrEeOSiP87vNs3cndMnvCyLHkukYvz
 V60lsWYbYYqKnBz2b1ccrMFWhnNeV8Qwn7BOHIBrffzHFmvCeAHiGOX3ABFnOT/bcXbPs0nR21s
 ifrMnuLq0/Ft1QFNihBCiJXPUfIi42EwonMGyny3tXncvJJxP3HCQS0TRH7dDgesZbrKiI9i9Zy
 jT7CvAL1zIxdCNkHNMQM9whrDYTF0UzdIZiED4/ZySy+ZEf7c8qrrXDjr0A3yjhDkhhUTPJrlFK
 aUmWoBjq02KY6tUMEIpEYgOzBkqY5Q9eGYiLJICNYs68yGU8jIHWAAhh8G+JZfREuNaS6e/FY8I
 K3efZrcqaASJbzcBt0k8ou/cZCAsE6BlmWf+WQyP9t5VO0goiunyUvlmp7XLniXnk03bAxmGigI
 Qxx2XmZqsMJAuSXHvSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120024

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
encoders). As such, don't use ephemeral max_mixer_width and
MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
buffer widths.

While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
there is some additional logic that needs to be added to the resource
manager to specifically try and reserve PINGPONG_0 for modes that are
greater than 5k.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
[DB: reworked to drop catalog changes, updated commit message]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 44 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  7 ++++
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2d06c950e814..c0eca911ff11 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -762,6 +762,22 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
+static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
+{
+	/*
+	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
+	 * 8k resolutions, this requires reworking the RM to try to reserve
+	 * PINGPONG_0 for modes greater than 5k.
+	 *
+	 * Once this additional logic is implemented, we can probably drop this
+	 * helper and use the reserved PINGPONG's max_linewidth
+	 */
+	if (dpu_kms->catalog->mdss_ver->core_major_ver < 6)
+		return DPU_1_x_MAX_PINGPONG_WIDTH;
+	else
+		return DPU_6_x_MAX_PINGPONG_WIDTH;
+}
+
 static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
@@ -769,13 +785,14 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
 	int i;
 
 	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
 	 * before even checking the width after the split
 	 */
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
-	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+	    adj_mode->hdisplay > max_pingpong_width)
 		return -E2BIG;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -787,7 +804,7 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
 
-		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+		if (drm_rect_width(r) > max_pingpong_width)
 			return -E2BIG;
 	}
 
@@ -1318,7 +1335,6 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 }
 
 #define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
-#define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
 		struct drm_crtc *crtc,
@@ -1328,12 +1344,25 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	u32 max_hdisplay_split;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
 
 	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+	max_hdisplay_split = msm_display_get_max_pingpong_width(dpu_kms);
+
+	if (topology.num_dsc > 0) {
+		u32 max_dsc_encoder_width;
+
+		if (dpu_kms->catalog->mdss_ver->core_major_ver < 6)
+			max_dsc_encoder_width = DPU_1_x_MAX_DSC_ENCODER_WIDTH;
+		else
+			max_dsc_encoder_width = DPU_8_x_MAX_DSC_ENCODER_WIDTH;
+
+		max_hdisplay_split = min(max_hdisplay_split, max_dsc_encoder_width);
+	}
 
 	/*
 	 * Datapath topology selection
@@ -1354,7 +1383,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * count both the WB and real-time phys encoders.
 	 *
 	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
+	 * (mode->hdisplay > max_hdisplay_split) check.
 	 */
 
 	if (topology.num_intf == 2 && !topology.cwb_enabled)
@@ -1362,7 +1391,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
 	else if (dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = (mode->hdisplay > max_hdisplay_split) ? 2 : 1;
 	else
 		topology.num_lm = 1;
 
@@ -1540,13 +1569,14 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 						const struct drm_display_mode *mode)
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
 	u64 adjusted_mode_clk;
 
 	/* if there is no 3d_mux block we cannot merge LMs so we cannot
 	 * split the large layer into 2 LMs, filter out such modes
 	 */
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
-	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+	    mode->hdisplay > max_pingpong_width)
 		return MODE_BAD_HVALUE;
 
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
@@ -1566,7 +1596,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */
 	return drm_mode_validate_size(mode,
-				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      2 * max_pingpong_width,
 				      4096);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4964e70610d1..3d979e856b7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,6 +24,13 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
+#define DPU_1_x_MAX_PINGPONG_WIDTH	4096
+#define DPU_6_x_MAX_PINGPONG_WIDTH	5120
+#define DPU_8_x_MAX_PINGPONG_0_WIDTH	8960
+
+#define DPU_1_x_MAX_DSC_ENCODER_WIDTH	2048
+#define DPU_8_x_MAX_DSC_ENCODER_WIDTH	2560
+
 #define CRTC_DUAL_MIXERS	2
 
 #define MAX_XIN_COUNT 16

-- 
2.47.3


