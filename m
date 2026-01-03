Return-Path: <linux-arm-msm+bounces-87304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F522CF0064
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 14:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 253B0302168B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 13:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3227A30CD94;
	Sat,  3 Jan 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUVuyuyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzjI0cyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F05E30C62C
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767447914; cv=none; b=oUbJz144+Zs9j7G3UA6MpsatYA2o1Ox5PApZiFB6QqlSesP+yp8Ytmlgh+BxzvUNb+L3NW2aFIqaPCJZ4yE13bdzCj1HUBQZXor9G9/4HulT8HD76HK0cHJ/Qgl3Z0YvYKkV7LYuh4BK8Ma88E8RXurTQCDmE0Acgg1xuGw2gYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767447914; c=relaxed/simple;
	bh=eJwaS8AIVbfSqoaa1FQTEObV3QnxwMSaPtV54XbsuiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+eBoJhlHX+2U6L4RUckIDSVn5OvEYzqE7HHbWU93/e8jJo4TrcFIbSIIINFT0mcmqtWu0dqxcu6pJE4hEKORIF7n8ZYQvHKK0v4WA59bgPtKHrHeVqr7z1zAYpBBV3wUzeQu+BkH0U9vNj1yerY7t9JVop8IIdd/JylAvETrmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUVuyuyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzjI0cyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 603Bs2fG3645159
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 13:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wcs7WndFuV4NrmzF+q/q7Lo8YaqkaYiZJXqCxYd/1U=; b=dUVuyuyyw1u4T2UX
	ckUMw3m4GVGrwqWPWMig040pg2Lp3z3ij3z9dtNTBRFy0vMzym9HISCbweN24A35
	fTVW5J80HOGuY2Q1z9eHQoSs76Odpq+WbpcPoqqcHomRg+6tBJBkNR40rN4pTUqs
	rX+YNSUq+ko/kfHl9ZtN3UufWiCHtEb3SVvU3Vnd1HDVlZmaMzPVV1gbwGqalra7
	M6V12gkEiUjiPKaqmpfj1nwtLDaoHGrdkUVlS0lWN6D5SIzBqjAxGO12XnAl9G+K
	cljr3nr1GfKZipZlFSV9VcjOQlp8KzV2rvrKBk0QfvHC46C9tin5PMG1TA49jE3z
	dUDtng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bertcgu43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 13:45:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso323829941cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767447910; x=1768052710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wcs7WndFuV4NrmzF+q/q7Lo8YaqkaYiZJXqCxYd/1U=;
        b=hzjI0cyRf8qEL0jDx0SEA3GvPCw0Ldc7uu1P+Cw2fI1ha5M7daclHtQNkE0il7AgJ+
         dCiIG6/a0Z7sDNRZX+mQnR6GthVskquphgMhOYWeh06QGbjOSPBtch1WXVdANmqOmxj1
         xStUPxHKqlCy6zr2N24oMo/s0jjpgvKLPzziAx6QT3c63HAKQS9HcBGX1aenx0VVOUze
         Wfr1WfK56l80RxkPX9Zh5Liep2HrDSKrd8TtkDG0gfqI9FM86qj2eCMtA9RiU20/g3L+
         l0Dn4BkoP/6/OiP/qdGoMaiB3eRGij7lFQyXAiXBdxq5ddLELr5TIl9moRp690hpEWSO
         RtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767447910; x=1768052710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/wcs7WndFuV4NrmzF+q/q7Lo8YaqkaYiZJXqCxYd/1U=;
        b=B+vMYQ02Gg/P0nLGQpCecFODoybCidXOE+x75dwSOwNlqu61KVtr67pLjwjGItrs1s
         B2ahBl6nAzvfFI28E3ywxHSXhxPtAH7NfVDzNcsJPSxg0eJqOiS+F6bfHl5Sl4HXIJ3T
         FmSdGhmb0pZAnl4a9j+Qy/gMQFBUCoT96YZeWsw3n2UsaAtetzr+E71FykpcYOJDf6EA
         +56KirsDDn03eMMC5ubFxHiGr6wdOhhQD++A2ftV/DnHdsOIrFoDe0gfyBj8ZDj2IEkY
         UzMCAS2AOL2ZHFPhz01G8aCAMpZnRzNv/NIf+8lS1WBQVAmSYJ5+95pLcuVZS9hOodJ9
         X9EA==
X-Gm-Message-State: AOJu0YzPitNVCp4iHNVpeDQaKX55FDpsWCpHfcCsR4yQmAnktfGxpJHL
	dDjM17Xf20L3in2nZt8wpriCOg9CHxfEI2IHpXNr7+Y/k0zdyTajXBQWEph6nF9dBYdguhuMHUv
	HMBHFsYr/ivQBbJJzVLI5pkZPxJYnxhYThoishFmvbwYRUUOaGhTnayt7pVPda5iEOl/L
X-Gm-Gg: AY/fxX4JW9eHXjdX3b3EjEnd8WWrcLzsvzjFVeFCrF0X7Qqu9EkC9s6e+i7/GreBmz3
	ellPQ/w8vgKvgKDPWGXCy76oFNaLFnAqlUT0a1uHdEIeSfiL6htanO/ubtfdnuMQ0S1Z8dBok3D
	ks2wAo4nu2rpecN3/g373lGNXkbYqm5VkjQRjdMIuNh/FAT4xzF9hz2GwehWHOUfyhozpFZqhTq
	HsMEOC0kj3cNeeGrhL3S1rp8Pq9rjCH+7ReJwmON/LFMJoeEQM8wYaNPX0k9fLF983xjMOj4f5k
	7J3lDRjZhYZtNslKEGJ0wmiK7TL3/bjbGSh4+MNmPph16CsoYnSaCBcEocefo333bUTVbIlWovs
	CVxC8iXA26EIH0X5CGCRB0S97XV1mVcchz/c74hcHLNxGIO36XpR1ovhj7TccooEZBVc+DhsjW6
	GE1qhgl8jGs7VO24z/8cTIFbA=
X-Received: by 2002:a05:622a:52:b0:4ee:2154:8032 with SMTP id d75a77b69052e-4f4abccfbf9mr669959781cf.6.1767447909489;
        Sat, 03 Jan 2026 05:45:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtRGaEFNGZAjXZRw0vILk7ro1kk7a/w0mzqVaoPclwICa5mz2eIm3sp++pOArbv3jxj57h/g==
X-Received: by 2002:a05:622a:52:b0:4ee:2154:8032 with SMTP id d75a77b69052e-4f4abccfbf9mr669959401cf.6.1767447908959;
        Sat, 03 Jan 2026 05:45:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 05:45:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 15:45:04 +0200
Subject: [PATCH v2 1/3] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-max-mixer-width-v2-1-ef5d3d246709@oss.qualcomm.com>
References: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
In-Reply-To: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6701;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XxW40C1bPDwTGr6XGqsFvtEWPDf2zqGDYU7eSYwzR3E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpWR1ibTf0NkyTLcLTmJEx64Xhmyic5FeUe3FdR
 e/pGjZVMDqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVkdYgAKCRCLPIo+Aiko
 1VB0CACun8gKPGcBnTWOozE0spTi/qU4fsdw9cAroeBYsr2XFpkYX09lZ3yEzGMxeFgjJNjBMxm
 ULt3yMPsi82ie+FmJQvAPpb4TK8bb55fP60+hNvODbK4O5CcZlv0xCPSFjPB+LN4lRw2DtrK/aM
 cbppOSF1efZEIIcnooYwIu1U74r2etTMNDsLAwdjqnFQsQxpvjdnOwMCOlOuHRY0yUujplGFM6l
 K0O1MTT8SWvsmVhGBEu04etpcPTRiQ8X5c/Z6WW8NBOZPq8VQy8dNvu+sDD0H/K7P7B6eHSbpw3
 /un9ym6S70njE1azlOwlFNCI1/ETNUN+P07E3mCG4iuiSPHU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: p-lzZD4wqXFvQ5xxaQGe-qr0DqUXJTwW
X-Authority-Analysis: v=2.4 cv=VNbQXtPX c=1 sm=1 tr=0 ts=69591d66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=LLqVbBr0KbdSWhQ7gwEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: p-lzZD4wqXFvQ5xxaQGe-qr0DqUXJTwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfXx3B3FL1V2rqT
 8cxZ1ioZdlpWRuFCsQcXWL5jx532Upvfkfn5nVo6RJZDiON3E7cRsVfiUU8gl7gv+ex11jikcO4
 WeEQUQ4/OJGY85YjYPIh6UhOzAncOGWgtwaaIt0pMxy3Lq+PDbNRKDHEVCNM5qP5RBq9NF0Na8Z
 l9fUUWKoqPRz5L80BcOOg+EiuirFpOg5o0pgnwcMEfOJe8Jtfni/SoE0Yuplq0djyQXhsphEucV
 O9JxeCzpjeW/OwZYghoTKs2/FNADozoe5lTDd1fU3oc8JpX9a1hLUBrELMFoWxHt7WNQ3z8hjym
 qAdNfQzSiifFcMHKo/OCMpbYwz4D7KKQxwaKq1wSdTlUR0kuXTWfsBbK3OHmO/Vz2sjkfC1F5cu
 XPzYLy3pztoklMefzxSK2fOu9w4Oagn3LQdiNFSQp7fX9F/8u7OpOaHo6TzWoFVAabuDHZIBxKn
 t+AObBZxdjat+c7FfEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030124

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Validate requested mode and topology based on the PINGPONG or DSC encoder
max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
off of PINGPONG or DSC encoder max width

As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
for PINGPONG_0, there is some additional logic that needs to be added to
the resource manager to specifically try and reserve PINGPONG_0 for
modes that are greater than 5k.

Since this is out of the scope of this series, add a helper that will
get the overall minimum PINGPONG max linewidth for a given chipset.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 44 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  7 ++++
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c39f1908ea65..0b74d85a6142 100644
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
@@ -1328,6 +1344,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	u32 max_hdisplay_split;
 	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
@@ -1335,6 +1352,18 @@ static struct msm_display_topology dpu_crtc_get_topology(
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
@@ -1358,7 +1387,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * count both the WB and real-time phys encoders.
 	 *
 	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
+	 * (mode->hdisplay > max_hdisplay_split) check.
 	 */
 
 	num_rt_intf = topology.num_intf;
@@ -1374,7 +1403,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	} else if (num_rt_intf == 2) {
 		topology.num_lm = 2;
 	} else if (dpu_kms->catalog->caps->has_3d_merge) {
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = (mode->hdisplay > max_hdisplay_split) ? 2 : 1;
 	} else {
 		topology.num_lm = 1;
 	}
@@ -1553,13 +1582,14 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
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
@@ -1579,7 +1609,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */
 	return drm_mode_validate_size(mode,
-				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      2 * max_pingpong_width,
 				      4096);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 336757103b5a..ee94d0ccb8a3 100644
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
 #define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16

-- 
2.47.3


