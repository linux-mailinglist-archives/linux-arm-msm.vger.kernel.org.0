Return-Path: <linux-arm-msm+bounces-55196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE6CA99A22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF7F3A3292
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9DF28BAB2;
	Wed, 23 Apr 2025 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwSqMxrp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A66288C97
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442623; cv=none; b=I5Gy17QlnAeiMf9ADEQndVhU2/NocP83UDN4hZLUWWHlR2ziWbNEUKfTkpUJnK4ahXkdUKDbCWgJJ72yv1c5OoBSNZduStBQdZEjUvE46HW/oayuCXoQ9P4Ij7QuurmLz7NIOZtFFFPnOhid0YzNYMuPJ5nNawZ+r6lH5niq9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442623; c=relaxed/simple;
	bh=RfnKyq9ICjUtkkjr2jKBhZZlDiqthzP5N0bD/Kguupc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uO5Fg4DdCmJMfRrU2qgXVLhbarBHGIY7BkLruvCltJKs6Sju8o1hOO6Idw4EScPEoMSvrnJr+hwgs2ZVypXlk27Uu3HZhf1nEOtv4EK0OtTNigg9H3VG17dTZWBELyIMYx11PtQX6TvNwlCrq2CD7W+0Azv4T4DY5atLY9sBBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwSqMxrp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAU2Qo014698
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UKS4JYcuUAg5jzEbt/jNsmLaCkbGKSDsl+QGDcjdU=; b=ZwSqMxrpCeaqh9zu
	8Sq/gr9zW9NlUd7jaLhaZ5mGrFYkL1zBBTbKfNbGQYmMkt07NSk1+psX73B6QqJj
	xVCAT5ETsxIN61PJJ6RUB5lTFFXNrGlG07TvETl/s9fYNZerBkMHfeS6fxtrGGPi
	eEh0SQ8Y8pyu6DpmRpW71kdUnSkwbe+V6fjTCFxeR0EsYGVcwI1KF77lFrFHv37o
	iT7MAlVYKUtc5jIFhHWgkzOQK0sG/dHHzHEMNFFHQuhf6eJeEcdTkRc5d/i0vNJ9
	CM022l/p8WH0fJsALNr2ns352rJz+qB1pqzQVrbyO1BPgB1vBETM+8nbhHrDetaL
	lOW4+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kcw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e905e89798so5637196d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442620; x=1746047420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6UKS4JYcuUAg5jzEbt/jNsmLaCkbGKSDsl+QGDcjdU=;
        b=HuDCdOE1RqM8d6y0feNHhNq5AmMk+mw+Zbsx/umkrb/iZQt8LlyN7L5E72acpxwaPt
         OtCXdnlK1baywL5BaNeaa+gxfxAnSENOnbAy9PCq2jmeI3VD7VrXR9QnFl/zh59QJlgq
         XcbmDGnOy3XYT8XhSpf1QFDeCqhy93AOqOq+cdRn2V19eQw/k/f8rRp8K3Pv+wVA1U1f
         MKwLoR3GN4qfFexbxg3MvJ3uy1Ugeb/X0pHC+bDTGSlTj5uyWHAyPSj00r6fqmeOXO3X
         Q43sllvglZV08rVdYnyno8SPuGelrm10ZcHWYx0rXtXGcVRigldwFyFHcxkuXAqM7up/
         SHQg==
X-Gm-Message-State: AOJu0YxmvRKhhNDaOptBzx44hWaMqFbShZi5vD264kEirPMuYTdbzZPz
	7PN55tCrjBmmA8tRk3b9LvucxRUOxSNRZrjtSk6YdluZVN7rdC6bR8jlZKuWxB/Zg0NQOzf+uSG
	FXX+QtD5IrNItj6vrFq7V+MEceaFZUSoKAKmFmC6letESRn3o2gDNIuZP/lx4E8xl
X-Gm-Gg: ASbGnctbWb8GVBPbnspTtzWXOKvitXqI1hrOBLVb6yKW6B7k3X3dUzwM7FMFbworGSQ
	JLdChnQWXYOQO/LLBCLaOkTqgD5o6PcD2dtBjGUKRmrIAaDmHxnonZzS5EJOrncPWzZLCQ5A3PV
	rCvpaR3I2BZr6AyRzjE0CcaUthP00T4AY1ZyzNOw7PkmIV2SLO/hwBbBkNOVP+RM2APOnsE7IST
	RAgLDCanY2ZyREeApziOiA2onI/31TPmTgwO3BZkBWAJApldoIdhH1Rx+sfnElIjatjrXYqb0Fp
	8/cR1L6cgmEQ0+cx1zR7Dt/tE/UF8ENFNV1iwlMazTDt8ViYAlu2aRQB9pClwgyW+rBJjm/8Hba
	YIUgUXdGS4vH/92LquZgT7xOF
X-Received: by 2002:a05:6214:5099:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f4bfc7d20bmr3253246d6.29.1745442620341;
        Wed, 23 Apr 2025 14:10:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLzUPfct4nWaD35EhN1BKf8WJ1RrzjFP9v77ONKcGBSU1K4tluJaOglVnxZysGEb6xpd0Hww==
X-Received: by 2002:a05:6214:5099:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f4bfc7d20bmr3252846d6.29.1745442619941;
        Wed, 23 Apr 2025 14:10:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:01 +0300
Subject: [PATCH v2 05/33] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-5-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqdYHwIQ3qP/JElrts5dzGjsyXrqAefsV/M
 KkmWKUjvkyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1ZcpB/4qSyr0iP11NwqcYPY610/qlcZAOgtRs99lx3yKCEOY5PzkYC72ZxkGfXGOXEA6nXfTzyl
 cb6OASx6Lq9TjBIV17S6OQvRCgsSv3gOk06jBLZu2YxODeb0MdSyHVAaT8LeZuat2AZpUlFI4md
 q3nrHZDpe103lINB6WVHPr6W0jVxQ11gTvE7GZh1BFaEzfcN0XDdNX3lVgDUWt9nukFUQdT9Ft0
 LXIVqf+W4zBQnef/8i4d+/RY7Oh2JNw076zuSFudcj09F/jyF6SWBQExFxIX764etPahGpBxmRC
 PtkOFyph43NfGYRF0cK17NqVB97JAp4e7T9WyDzyxMP4it9e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Idd_Q51W_R0x88dBKxCO6fuEeFuaPyMQ
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6809573d cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Idd_Q51W_R0x88dBKxCO6fuEeFuaPyMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfX0lTpE1fSeCF+ sny2VC7yie5S0S9vFbsswBtKJ7vO3dQ1sF/mxxK64wa8FT8PfGSBKCNhYBSRIyExVERhX1nP1Zg OkYuTT4vIQbs7oVvfM6sC6999qdm4Wtn1I7NiyWvsztoH4ieGAOAL33YvOWt8J0ZTyZQ3THf1R+
 3HUZr7nNe+i5hgiMmsTmgwxRJfAKm0Zls2eARXhh1ub1VMAEz1cME9aREGklK/J1a37XVqFmPP6 fL/rUYF3hLJDacFCgIJPAI6tT/1QN7R60b4OjE46Erm7reOHPkw+nz+457D8fwDuFRKRhQSsyEu jaFK0Tb+ckzZaUBsir9F8+bOOMoDp1f98Y4NpX1KNPGUkTvKogLMggCOY1c1FWCP+4J7c/6L3Yz
 xSEDBYlfXlW40SqE1eMESRvyPs9nJ9jWXX2PzpLA0Q7dWy0Udvf+oxwox1Wi05mp1HiIYkN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5


