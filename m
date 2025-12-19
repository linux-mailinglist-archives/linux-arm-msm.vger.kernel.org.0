Return-Path: <linux-arm-msm+bounces-85834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1A9CCF6AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1382E30252B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F8B23314B;
	Fri, 19 Dec 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL6mbnBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvCKXwO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A42FD7A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140769; cv=none; b=HbLvTRO1EuGMNb4d+QQ7VuTTHwowNSFYI4YUAjQaL3gLiMvM84ay2guS7hrWA4n/qtxWI/vSsEvx3n0AKHKFNAclVuXd0Q71uZUEEIpvIgSsH1TFLhJ7htBlmZJ0daK1InP080FlhRZm4qVxZpaiRzUNVtTrRUjszMwdeuVn7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140769; c=relaxed/simple;
	bh=xi0isO2zj7u63F4efQxBlJHUzywGMfOEhn2zIGrUuP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AlSEhx7o7HhyId+7zIWDR5fHVxg68Dg462gyA/k2967wlHm9lg3T99q8MrwnDeYkX7Ihwum66BmbkFLxKwIx9uvmduvORGxMGxMuq7Gw19iOQlDOXhMkx9c6lA6TryEeEumBaE5vFtwK9rs6pe/vcleH47OxnaMNXAlrQ3YTsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PL6mbnBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvCKXwO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cQU41771760
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=; b=PL6mbnBv7EfMa/B3
	G/A19Ugs8x7no5uZnLc29BKl5Vn8kvur6C1cWp0BD6B1yAEL46bhrEpfcdmUJYlA
	MlUhdBP13GpNKF7CztRp2h3Rl/X+GwnC+iphFCsnCl7LXcBxunss8sfRgfeduSwY
	NQulyM566QcMI+8rgGko+9m8/K1S7D5MmjNzzlZx7nvROqa5FIFPAL/OHxZ66NR9
	OyedHIjhIsqSVTv3pBbl/6/8r7WnQYdsY4ma6gMPrB7MHKBElv+Ov1CrdTHxZbMu
	ZJgrti+EpWkMyNssU+vC7PcmKI5W1AUxaLJHh9LOWSDp9k6mq3jr74AvbchRF3vn
	Hh5fgg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjbve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a5dba954so27197371cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766140765; x=1766745565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=;
        b=WvCKXwO/O4+Ee6au2ZhTGMOn7msgu5k3k4liWFb3bdkfY8PNeAzNULeedkLfLq1Bog
         5sIDk/eZ3Q6D+frVbzKJbW0ytjrrd+Xo5v975Q+nzHwNV+Fh2NnFlR3CpwVqx5B0jbdv
         9G9vqIMOK+LbT/XhwVnV6/7yf7s7FSO8cohkc3xMWM7Vsoq4WblXy6Q7V0LFGYSBjFug
         9DYhl0LkfKT64nZ9f2Tfz5Gd37EWMGFe79GqgmL7G4n6vqaBmqQv4JmvMY+KsqT6AjYK
         TK9EPIYs66/0p90wpOnJXssUTLIQ7G9vRzsgBWGWSF2aECTSVuTHIvLFioU/t2uZNQvt
         2C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140765; x=1766745565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=;
        b=RpdtvkZBXga9ysExtA5RAs+COuO5saxZSvaMDTJeWF8pu2OD5g5CapzABmwaw8wQSx
         MXei3YI+4if85/lRv3Iaeq9TnUI5zVJ0eKdkFPHlBwn+EON62eaEFmNbx7NjCuho3rpV
         /2ticRgpdXWyPPghoX5w0+UjSKML0joUoWCvfPfzELNd5RaFPxrD6BG+UmQQYrobmtPh
         oq+gIJrBHqOG6KclZmv0lKVSmZqXyu/XnIEtziEQOnGQpIimgSRRJL3XaITXc6YA1vey
         HH9ULcL66PyhmHLcpTggs2ZSMP3M73UyDNnJLEeNREzzUI4LlaRZWe9rbveTbbToIUx/
         8vLg==
X-Forwarded-Encrypted: i=1; AJvYcCVWLDAyVWsnkuC96LeR/o1imi7jPHN0x6L28KgF0Kl6M+BJ2mcPceeEw5ykjj81LCm4GdqYB+sKMnPUzSqs@vger.kernel.org
X-Gm-Message-State: AOJu0YyyeuhnngYhQIxbcGBfEeIaZrnp4ynXx9fH9lGG6HFg5dMiA0LA
	O8cyNQtm/tjSC0v06z24ji4YUvCHXGfZ2/V0wDd8StlYXMZLCwxIetG4wyGpXezZIJETsVmUHQv
	l/29zBiOQ2YpsCzv85x4e9QChPqOlUBNTVQgoUF5CD074KM+aS/uUjA0Z1GEbcqJvGtRG
X-Gm-Gg: AY/fxX7c1v7niywWTJXehRVfZ8CzwF8CLtMTGoZm51JiEWy9wQC5qYo18nOHAlDm1PP
	6PzssxO5uhgNd1B//LxAHjVWqWyk8KTRv+c3ILe0fwTKlVyQxKUGmMYeKXaRgyj/LA2zV1rv3X1
	kq49/unjSR7j1OU+Sm33KolhbfetFEeQGiTHF572iPcc1jo6a5YEs3GkAssihr/+Acw2S0vcFVf
	3gaex/FHdfkwmuClySU7avtYfTSn0HZHLJ6axGhF4kDYRJ4T/7btnwIFhf3TbLIBOEbY42IVad6
	2UkZ2lhMSRyI7PFT1rrtg1UmImdq2kQ5Oh28tQFa5ZtKfPQ0A3XQiQZJ7Ympya76Imt4l/BgcRf
	tAKmVTOe3Ffdl3zM=
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-4f4abdb50afmr28813821cf.76.1766140764933;
        Fri, 19 Dec 2025 02:39:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8DdSG740C5NPtMnK++fiGar0BQXZYGFlOhBwei0Gw+oZGsGEVWCVcw5gfBcVRV33F8o/4LA==
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-4f4abdb50afmr28813631cf.76.1766140764354;
        Fri, 19 Dec 2025 02:39:24 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm198142066b.24.2025.12.19.02.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:39:23 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:39:02 +0200
Subject: [PATCH 2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xi0isO2zj7u63F4efQxBlJHUzywGMfOEhn2zIGrUuP0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRStWe971J3fXTWEto13F48xEAWlKpa5UIoGw+
 D+K2Ywjo9CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUrVgAKCRAbX0TJAJUV
 Vhq2EACMJmriHKHHwDFtldQFgURBx4XUWuTs2XtI6i/Lz1PK+mNP3KE6bb02hHOT9IQv5viiWMu
 Q7f/wqUQX8WTlW27jFbpxXs+AusXdLV5Tjkx+KlAtjuJ1GkRiKGBCa6nvc8Zml+m9mTsA4sCm6R
 xN8/Nqf1955BF2X+9qS7t27e1dHFl0Z6bov60B55+1+V9DQmHARRDBnabvRTn2ttIrfapZfxj6S
 9PsJG0d4MCqPZ+6Ap2TAVP/1x5qL9Le1vDR3dChYL3rlxYXLjIpzKDwqvw20rolUk2HPBoKOhZA
 IoumZx27B8wJP1fouA4tXkP3sklTjaedbdvZbBdfdtJ2Oqw6S6cSUJ+P+sF5V4t0QytGRm8lVIV
 m1M6h8hgIl6fEE+OIF+MdOHxie9RpgNV+Bn/Au0X7MaXx3hAEAMllohmUrvn+erTNzSzuRxwS7w
 U60+NY2ypnELM3YT6p6ZVwdAQdpH2eTFiSyqaxMGQRXbFD4y0KulWSWCb2rt6/2FrkIo7NI0/0y
 lKSYhb60Q6tAStYRyJBTNVOJWNwzX274eH2zLVIqR9D8MX0sQ+shMiRPN+2WQlasy4UQUiAKGNe
 3LXjhrbdhacEsctzY9VMnAboKO09+7NpxVh2h4afqs6wY6yU2cOh79KjXyVXBTKlW4Q7wZl6N5c
 sfQV7olIOinz7XQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: EOXj4PYRt9vPMiZP7E0O6CR56E0V_wpG
X-Proofpoint-ORIG-GUID: EOXj4PYRt9vPMiZP7E0O6CR56E0V_wpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfX/uuwfTSGZpmM
 IFMgUlYkmISCLUBfqr6Xidb/p3FCNMaW07NPiKDM4b3o4vrNXw8KkyJMcGYy5nomfhWHc9BzmqA
 ayLIP9Uydnfx2SUsnltw031nphboDPTcEcMoehmv5r5n/vPcGMlW1XzzHq7OjQJUYkygZtn2XSI
 mMAvlL4NTzq9P6Nl65QZBZsZI6t1BIcftr+rG7MMNMXTW7r6u+y5DPYKUr5oNrjm4xPQ2CThEEA
 cvaiPAe5K1Q4BzkIaSm801V78GtBfHdUZcG1x0Rcd5Qs+n9bh6tSX1FDX62YAi4YJmIbH0OWKZx
 GdEZ8TvQMOgHxXEk8FzYiASwD4vKUGg1lt3ejda53qN5OT7PNB4RZ0qQR67Nrd8deZbhuR7HMyB
 iy0c6sAVCWiQQJkB3JVcqRsYR6xNPSKb9f3Y10BZ79ak0SJeq5K/0PfV2LvTsyFFbNW0rrhmWpW
 16uPPUgh0sxhm6A430A==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69452b5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8
 a=ZMc9qBuXswDIMKfH7wMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190087

This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb.

The dual-DSI dual-DSC scenario seems to be broken by this commit.

Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
Closes: https://lore.kernel.org/r/aUR2b3FOSisTfDFj@SoMainline.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 011946bbf5a2..2d06c950e814 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_QUAD_MIXERS];
+	u32 crcs[CRTC_DUAL_MIXERS];
 
 	int rc = 0;
 	int i;
@@ -1328,7 +1328,6 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
-	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
@@ -1342,14 +1341,11 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
-	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
-	 * resource. Otherwise, use 2:2:2 topology.
-	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2:2:1 topology
+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 *
@@ -1361,23 +1357,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	num_rt_intf = topology.num_intf;
-	if (topology.cwb_enabled)
-		num_rt_intf--;
-
-	if (topology.num_dsc) {
-		if (dpu_kms->catalog->dsc_count >= num_rt_intf * 2)
-			topology.num_dsc = num_rt_intf * 2;
-		else
-			topology.num_dsc = num_rt_intf;
-		topology.num_lm = topology.num_dsc;
-	} else if (num_rt_intf == 2) {
+	if (topology.num_intf == 2 && !topology.cwb_enabled)
+		topology.num_lm = 2;
+	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
-	} else if (dpu_kms->catalog->caps->has_3d_merge) {
+	else if (dpu_kms->catalog->caps->has_3d_merge)
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-	} else {
+	else
 		topology.num_lm = 1;
-	}
 
 	if (crtc_state->ctm)
 		topology.num_dspp = topology.num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 2c83f1578fc3..94392b9b9245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
+	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..9f3957f24c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -55,7 +55,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 4
+#define MAX_CHANNELS_PER_ENC 2
 #define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
@@ -661,6 +661,7 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
@@ -674,12 +675,22 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	/*
-	 * Set DSC number as 1 to mark the enabled status, will be adjusted
-	 * in dpu_crtc_get_topology()
-	 */
-	if (dsc)
-		topology->num_dsc = 1;
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
+	if (dsc) {
+		/*
+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
+		 * when Display Stream Compression (DSC) is enabled,
+		 * and when enough DSC blocks are available.
+		 * This is power-optimal and can drive up to (including) 4k
+		 * screens.
+		 */
+		WARN(topology->num_intf > 2,
+		     "DSC topology cannot support more than 2 interfaces\n");
+		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
+			topology->num_dsc = 2;
+		else
+			topology->num_dsc = 1;
+	}
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
 	if (!connector)
@@ -2169,8 +2180,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_lm[2];
+	struct dpu_hw_mixer *hw_mixer[2];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	/* reset all mixers for this encoder */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 09395d7910ac..61b22d949454 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    (dpu_cstate->num_mixers != 1) &&
+	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 336757103b5a..4964e70610d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_QUAD_MIXERS	4
+#define CRTC_DUAL_MIXERS	2
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 31451241f083..046b683d4c66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		2
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

-- 
2.48.1


