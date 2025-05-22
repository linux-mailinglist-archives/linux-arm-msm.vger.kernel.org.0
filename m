Return-Path: <linux-arm-msm+bounces-59113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF5CAC1456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EE1B7B89AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C63A2BCF76;
	Thu, 22 May 2025 19:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3mb5SO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C73B29CB53
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940637; cv=none; b=kzMMvikwgtGinUSXeiwkCzUnSksMYS9dg9fjxllG8N8NTNygqFhiayE1+EVlDwXZOrnWTH6/tqz1m9zfJjlVVEIgmAzr8Vms0870LAhKQLbr7RPzBb4VZSQfbZxi3xufrAdkCXCvOgSU6dyWVTmf6QiV31Xx9YX7nABVDG6w+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940637; c=relaxed/simple;
	bh=epai2Cytfes2l89hNY2GN70oZfBzr8X1ylrMw0g4/O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJEU6K/wkJX20bVcOCJFVyeObU5iYV7c38sqbZ8sScKgCDkq/wOabGEcceAGWpXawh0onrf1O4UfLCnuVATESVGJMF6kjAMskzyA7psvSZWMAERApge8iaOUXDDmW9LPnFGmmdSH/T6jr5Owtm13/goJ1GTxUEpAZK733bld8Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3mb5SO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFAItx029063
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=; b=c3mb5SO8ybDVB2FJ
	IE6JfkbXyx5MmfklP8Jl+s3auExSL+0ksHdQ/+t3NPEUToq33SCyGcG8cgG71Adr
	pVXUuI96kUwgyWj+jWaM2p8MAk27JEFi2RgDKPQ0wX51ZJAtXIXMIRwEVrw86kKI
	ub7Oi76H7nBMCjLWI7Fda8Oxp027KJrM5sSSsqVi7f7jI/yQk2jaW2SCqpZSMnI6
	SgpZx6JKniqRT0UW0iQCj1zKfIbFnpYk4QKHb24fK+k1XVGqsfeVt45GP+4P+FYK
	2QfNoN0kx2CEkFzhUXOoWdyn/cmvF2H+Q4EXWfvZS/y2RLhMkefUX+fTzqmqXloT
	f2BaLg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47k2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:54 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72b7d15aa72so8177236a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940633; x=1748545433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=;
        b=Uqe9SyAq4CoML5+dsiKCcQpSEZUgqnrfSDkujmveozcCUt7jICVJldRcMBVI6zPLPl
         8c+EQxdUghqoHlzk3iJgiW1GCBPmBYFkGNWTSfvZ/iJfmLK1MPmN/qcAnH9Q5i/c5ZAL
         SC7uDf10Lco+5z15edoiLHLDvail90UQobPq1wYcKCndvgkYZlkac1gLNz9q+c3w8Sgv
         jxr6J2FJAvkqfoj+FDHhVpe5DqMh1zM1g6K1i1tQs39ldUiULbrdkXnqm0+RWTbqYr6v
         B/6M0a6zsC6VTC1yqRs1NyXZmqo5++9TEsaiWLoTshSOGZXpWGyaZ5gLq78djZBj1Hdb
         I9LA==
X-Forwarded-Encrypted: i=1; AJvYcCVnoBWPOtVkXTuWcUZpu7BlLsZmQIfvjOpFuvaJwilrAgks8b0H5Kbbz1zVpqsNmVcCgczkOoUiMyxExPg9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3joAnsQR79pBC6lsLEH7pz9Yl0HnOoK5DT7ox1e7Et0dsR9UR
	r0DTquPhFyizP2GFb+p37LXxOgyWFNsmOSzU/YxLq2XdT27Kw8RLOfqNnseWw/TzBaAlTvqJ9wc
	q5TamUwko1Z7k3JwTs0ssmuV5pxxsG5zEHtIhIC7n2JsFWMfb05HARxxV+gsyZEIoTySxgahdle
	Y8
X-Gm-Gg: ASbGncvKI/h6wZct/tGzZtERvPFe66n1/ePDCpcNR0OrKHxQtpKv95IW9BBUmaRn035
	pn5ITkDSs/5/DXK9rCrBMwmRHkYA86/Hngbxchgzfpg5d0v+rH1SbYl4RGAboRZfrQUCzUpjtJ2
	kDe/JLsJo0OajfHKueylXCNN84XJN3zp/NpZ7bDE6cJUGhR8TCw8dj87syYlAf1UYnnJ1GPpyrv
	b7doH6k+IOQA3DaT8qOOwZ6xDVrluwCrARZj5Qd72ledgXd1olcOdCr3xALjozbFI8GlE7f9ivq
	vXddkOXkkPGXCLsajjMYVxyHV7+r9Wq7bwdu/uECKWCm1NHT1A+UKo7+6vwsdypqSAAKrTqLq6w
	x2AocAsYzN0RsHrLxpCiOnq56
X-Received: by 2002:a05:6830:6882:b0:72b:98f8:5c9b with SMTP id 46e09a7af769-734f6ac55a2mr16635994a34.4.1747940632879;
        Thu, 22 May 2025 12:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/jT6jn1Z060H1BWgbFPP/zII0OmBF9bsCViyPeLmWLw3ZixHCeAogA41QGyYKJQBsWAf6tg==
X-Received: by 2002:a05:6808:4445:b0:3f9:f923:cc46 with SMTP id 5614622812f47-404d8698a37mr17537811b6e.9.1747940621967;
        Thu, 22 May 2025 12:03:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:24 +0300
Subject: [PATCH v5 05/30] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-5-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FhcUxkN33lcwKaCVhynJTwrCtUJjENXomVxBonQ7s00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8SI8KCVGVVr1Y9EWMFHMO9KEgvuRRKVX0J
 x20oP/lOPiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1fXWB/9Fo45s651Gj1TyeLBW5+ITB5kjKlbCn9FNuFukuVufMW+UMpWeTehBYxmQlc+7z6FC7wf
 YlI97N7+IcRbAfH96cIN8hTe5YTgkS+9oqT90LjP2M0ppBYZsHGvquHUkmFnhIH/EHSZ86Gz8z5
 R7Hcqh++KiHzQsWOizm4qPLOEO0PHhrPk0atiF8vC/xvKj9+MDzNMfk2JMOuCXOjGIKQypVKmJy
 QzC2NY9Dh7MF7ZufSrqpf0bhiB7rxFbrZveBnE7dz6KEnmo1CY5RfvCVY4/ngoJ31kcauX7w8a3
 QvWCjw3jl87N7QTx+4yp1nA8qu8Q3UXN8qo9uy3rFymXOuNj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX3oXDGN4lRbWf
 NSqeSUVayQBAClmBHBb6ztslw7QOwkAABbEOwVTp6Xay+M/sG93VVYIx/2ZoRgo/PqpfoEA/Bhl
 QYwN7Vcujd/9LYzqr1VMt4lg+OBNsav8zYD+1Mrl65ppfJI06MfO3rzs7HEzn6o0soOlSz3AnEu
 ITKrvJkn+0r8IaR4IbxiTSwJFPMd6pCUGhiGalZU9kWJS0a8kIxyyStW0cM1E9yhkjWOf/Qid6l
 T7HirPNQmziOgMcro1hX0xvzUXX8iQcuinBCKZb72aDyUCNvW48yyHEr+4gu9g6JQFoq6VGUZn9
 vVYzwSHDELrUCI1mBEIYAl4QEycBMgvr8vEXX9P8I5u+1FmEzLW2pv9z+N5BMd7R5FV9rub0cQH
 tHIPUta0Pl9QtNYXRW2Xnm426gTu/q8rvJ2pJttasv74WeDHorcYHZytKwtbYjMXyGJZ3yo8
X-Proofpoint-GUID: Ea9Gq49VEXlfjzl24Ms-aYX9Zd70rzz5
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f751a cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ea9Gq49VEXlfjzl24Ms-aYX9Zd70rzz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


