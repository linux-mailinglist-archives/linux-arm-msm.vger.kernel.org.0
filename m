Return-Path: <linux-arm-msm+bounces-70710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 479BCB343A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81B882A2F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E988303CBD;
	Mon, 25 Aug 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe2zFT1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F47303C9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131555; cv=none; b=Nioe5HZnRAC9XZPT2Xs4kfNyIwFknnpTxLooZXeveTnPchzXVkJeCx3wi5qNkbKWk3wLWEo9Q6qsQPya/zkQNt71PhFpZ382KLIF/30yFlH7VfZG4ciD2rX1cSsxSpM71bprY6lxpO3eWpDfI0xv3ivdltkmecbUPXuYkVv6MKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131555; c=relaxed/simple;
	bh=8m/NmAVanmnv53nLnyrBMfNFZLTXWJekt8jy/qfdBFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xnfu2VBRNoSIAjpuYaUM6WOQHnvmTgYYHpSESmgvtqg4fiFyD+JYc+VlJNyuRdLYTTybCT2FTltFpssWrxmBnBvo9uArgawXu79SrXXdg6TAdHnR1YACLZ8o9RUUvXjHJr5joeRpXBUNiKJPi4pCDN25rVIUFMLFqyeoP9rISAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pe2zFT1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P82IEM021128
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmocC4ftyVaWVSgyoHNfTRGjizwe6D9zwARFQ5cI7Ho=; b=pe2zFT1FxGnv316U
	x/vKPLvcGuINyo3poA+wFMjeutaALnAlPilwcpB6vgFS1lPIGlquxi/k/GJ1uXiK
	LSp1Uhnp5dMRKjH6DkmmL3xHaVHSIGMK5YryFB+AfC6+A/qtpGF20xqaG56FaU8+
	TmQAYov2Lu46rQBe3zC4lqAglAZx1+Y686du93YO20Z4umjuVXUcDfZ4bwufjFt7
	wG9R6Ufqki8kR4eKDqI9W3y6iOqZK8N0IgSS+FVSvxdCd2tLAGh3N/sHo3z/2rGc
	UZsbEyLchC0X1I39+HOp7Ac77zEAeR9xhxDLUIR9FwcNmsA1sUa9Fb6yX4KPlEuG
	uSz+Wg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5ek7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb6d2baso8845235b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131551; x=1756736351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmocC4ftyVaWVSgyoHNfTRGjizwe6D9zwARFQ5cI7Ho=;
        b=a5yaavSgkhA2jA6I9Bcmp97+Rs3De2irZVJu44RVu1vtlENPFdfaGrM64O86cfdhdO
         zF6YswhTnjwn16TyuqL2IsTNI6OFEaoF8ykr/sMQVDpOM+PRtFEy1ztmJPqg6/3lPWk3
         2975Jjeq4vt0Ds2+icFYxw0UEew1g7Vd0ZfT32TTev0TQfjxBpTd3yYbeZP7SCS2+qav
         8DGKlsBTqRxe/ordtlIaa8xp7NsiLfgj9Sc89TSi1jejuA0pY1XHbNitC0apY9F3OVbw
         Ow9qwP0zt5nEUm4aC8L5fIhZI9TWYLKSvMw2R88hf77P+Nx+YKwL87dzW7sTNxf6OiJD
         2hzQ==
X-Gm-Message-State: AOJu0YynCi6szNCyCGurukudYJuvRUfr2sqYj7n5dtp6d3PS5HqyRMkS
	f+iaHWGSQY6AzkRH9089bC/mYI2J8N9Ykn5qPbhQKpmyU4UlBsMKnPUVCUYarNHxvLLdQ4K5raT
	ewUlfijJZrVQtFP5ZWC/wvtYhDY+AUTlZ0F2v+tmMOqKN9q3Q1AIXmRYCYXTTRH9CzgNM3+JXsQ
	ua
X-Gm-Gg: ASbGnct1BiZ1vrKSmpts2dIgoZ17eTKepleWJWdnDTALzfNfQ0mJxbmx5wiQxPaWh6B
	M0L7BEp4ugrnJZCvTLbjTMlVrA7B9+5QQ2IVD81S+ReC78278cf4OiawibLCGb3ybF8/AmEiYc9
	izfqHEvW2vkV9PBlCLUWdASfXKG1Ysm/On0IRadsVinAvu53c+xi+HrtWTRnQzAoes6Crz4I4w0
	TMd/RGryZcoO/UpsPPW6jVgNdw9QZLi0ZNxW6OiotoOrDWoYTjvAzbGoYUOktBN+WSmok4VT7Mu
	8gCDHurpdG5PP42lAYhAIzqdytFw+53hcnDVuZV/71I1VkaWL06JN8BpkZjRL8Dnt+yrsO8=
X-Received: by 2002:a05:6a00:a17:b0:771:e8fd:a82a with SMTP id d2e1a72fcca58-771e8fdaaa5mr2803045b3a.23.1756131550573;
        Mon, 25 Aug 2025 07:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcDnzJ5RfYiEwv9A01WhZOmceWuXE7FYxb4e0UXQzViegEhpR06sENZJcy5WADZk5aDdU7VA==
X-Received: by 2002:a05:6a00:a17:b0:771:e8fd:a82a with SMTP id d2e1a72fcca58-771e8fdaaa5mr2802997b3a.23.1756131550028;
        Mon, 25 Aug 2025 07:19:10 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:15 +0800
Subject: [PATCH v3 29/38] drm/msm/dp: add MST atomic check to
 msm_atomic_check()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-29-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=1376;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=8m/NmAVanmnv53nLnyrBMfNFZLTXWJekt8jy/qfdBFg=;
 b=u8gitSXMth4muAJp3+xoeK5RxUPyF1SywZCDE5hkinXcdd5++I3Vd2b6CfisCybuJNCaw3Sx+
 YU79iwt3eRbC9x0AI8+HP5lq7cTUavE7xpEFgbcoDFnLiqoiDewyvDz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70e0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=V2CHa5tHbzOdfKvFleIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX3bFaQJKB0Owl
 DbnG7A5TaZzkWlkzZonQwvxeZV/6bFhMY456qhZ1HHiCdfEMp4ROu7IkDm2NtiFtWqyOoFtApZS
 EykpRTorT5AobtJcXThw77YyESjbHFv6XAXV+CSKMlm+Vyko0HJCuZ/ZtAbyTXmCKKWJOzrcPmP
 NeCgafXD479qu4As1w0N7gQ6eWBkhvdxXLFfCpmAQzHEAnFNLesAwzXQLaSmDSrRUSxDIOka+Sy
 9MxlWrD3BqPSIe24TRqKmdO8mxakloDb0Mcjaz1+iisFVNZwgwcxrbAUtvUGZBGcPL9gmZIrnv+
 V/53zcFudhxQF+6FrhWhQhf4aJ+nUVTXnc2dgn0l/xRMdnsMF9x5K9nigPU7FKCEeCNfAtEGPv6
 e70r3+vq
X-Proofpoint-GUID: MNTNMlRRGmVjlkxnfv3r4nmTdZq0kQrp
X-Proofpoint-ORIG-GUID: MNTNMlRRGmVjlkxnfv3r4nmTdZq0kQrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

Add a call to drm_dp_mst_atomic_check() within msm_atomic_check() to ensure
proper validation of atomic state changes related to DisplayPort
Multi-Stream Transport (MST).

This complements the existing drm_atomic_helper_check() and allows the MST
framework to perform its own consistency checks during atomic updates,
such as validating connector states and topology changes.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 87a91148a731dc911f30695add4c8f5002770220..3aa0020dec3a90b693ad3d4171cfcffc091aad4c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
+#include <drm/display/drm_dp_mst_helper.h>
 
 #include "msm_atomic_trace.h"
 #include "msm_drv.h"
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_state *state)

-- 
2.34.1


