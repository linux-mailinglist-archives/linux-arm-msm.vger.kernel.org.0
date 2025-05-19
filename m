Return-Path: <linux-arm-msm+bounces-58483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED315ABC3C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEC8F165447
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C8E288C00;
	Mon, 19 May 2025 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1f3+sUo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD62868AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670670; cv=none; b=KG38bXNXB8vDfdm4WB8nKXOsoCJmMMBcdzlqdrubDEP0ZyNqJLRv/SZMZFa77rDDWHSywoD5200kb++vEzFMjP2A1OAK+bexCI9mZ8Zhfl2dxGP8isF5Ihzgfv617M+vKqR42PgGVkva7ilJ3bv9XvLYVm7uyqKsaC4J8Vtfyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670670; c=relaxed/simple;
	bh=dXUvfR7aa1cxnY1Jz5vPa4e2w1K7LH5XEmUqDTxv3oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7J0wcwnt50w6l+EuZp9B7cvumRFbZKOClSdUEysU26SUtN1W5/aimyEm8NiI5Fiov3KUoT/yA98rxR73P9RlfyH/qoziKxKkMUBCY7J3Clsc/UHDesoRZqBOecFkuolhztU03hYQ7oMbmaWd++NLn3+JbnUagQkYRWFJ5tI4r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1f3+sUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9hkiT027736
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=; b=I1f3+sUooKHzN3kB
	p4CYpEnOxN3E352DDRYkS+1jWnv1HXpxz7q3ZeThgukufIUCWY8HdGJ81AFGKQ+H
	X27/ilqG2hQOZ5RsyVi2zIUbhFTgCeQSK1RRljz/Wghflr/s1b9UUZTtb/seF7gx
	96zJehAbl7zjRPbQu/QCVa69logmWZWM19iiEGJ6KXMXvBfNWpi6TP+9AH7kkg+W
	0c8+Ly8CdXyh8EiePH3IS4CTaUh0OGgfQfhq2/PAVGRsmSDSgIO7d8C9EXKsatU7
	deum6J0i+td1qqkfDuqqXSjkEpzrhP5xTcen1/RUAaOxH5AvTFi/R0IU6NKuVOTZ
	SoCTDg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:27 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-402ebf9ac19so5177023b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670667; x=1748275467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=;
        b=quww9sK10f1TWMwFfQqUMjLW5CN7TPtCcHey7UwZ7QzMAKkbsJlQONGNEjFY6NXtKZ
         Wv1qJIo+R/BkQJGk+exVYuyFvscmIO0huJ1KBqTxd+qeNoJ8JXMnju69+bqMlUHezTIo
         /JoW/mw96F2XEMltchD+SSnCHCMeCUP/nbn3cNKy41isK1LQUGIap1HBnxqbEyx0rheC
         k2+DjqpNxNW9v6fVZCy0FtrPboeILXqJsMsWOm+ivT8tIdsdsobef3NA8Cy70w2kuWBm
         y+2b5t2jVXVp+oRJrxFcwH8aMfy9u+kREpgwC0iuNx4EGt+EWAlZc+N9DBJo4tuX0quq
         vUuQ==
X-Gm-Message-State: AOJu0YwM09uIa6DervguYGWaBQCJU8ovf6AkU5fhDg/QloR20bIrCcaJ
	0JAV45sLKC3bthPzdBD6qgGjJopxg7+8v/l9wziSWEAWHhDRKe1UjECOn9nQXv3i6SmtijPqEyW
	F83wvE1NOZ7jQ7Wf9/jBcetRpvETg+eoZjv4LrzfWzkyweioPksX5brf1E7fhUEgopLPQ
X-Gm-Gg: ASbGncttdHkp66g1kO1Xs+Nl1+CQtfijXR78RXiDHH3tSDN2gr/s00ubWkCKzpN86tk
	LxCR3ke2IwLECTMSAwBcNNBX/P97Qwb2dzFet3A9T2qSfXEIJNfL/1COQNEmZUNzpPGJVVEI30J
	azZ+ZixW90slAYFcB3SYY+0CDevLPgU9UnUEFqHYNVlu4noURrspk6AZvF2WmdI/NnW3zu45Ol7
	1Z+f7qz/lvbcOQJrpRlrhJ6QBfapB/3AImL8Mf/ZNCfYTe+C6CFnuUKfbKoAz1jfOeapxb+wk/6
	x46BL/6ofRXziz+lNVeKr6ac7YH6G9aNSZf+eWf3ThRu1gT4SLfm9Y1uPU2Mg32BlW6ba1+OSg2
	IIdKprUF7Hv3jknHQACS4IROI
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id 5614622812f47-404da7b8d69mr7382774b6e.33.1747670666779;
        Mon, 19 May 2025 09:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWGNkqDoudO9RrWuCi0wKzqrGIqcsU0h/pgq0zgnKD1jGMqg5LdIRqVst60xFqiYKu58bYqA==
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id 5614622812f47-404da7b8d69mr7382740b6e.33.1747670666447;
        Mon, 19 May 2025 09:04:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:08 +0300
Subject: [PATCH v4 06/30] drm/msm/dpu: inline _setup_mixer_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KY1YKEATuXx9KSgl3eMXV6sbTxL9UFjeSDTpsHW5e6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6q/sPeQO2gwYXC1xpGu3yco8msBFdP9+Ot
 w3qbkta0g2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1YlKB/0QFom0Icz72zmEmsevu7heit4rtZvRppGBGc2foEzGKdj1WXTfDxIRVslcwZXU2GnVw0M
 VFr1qR9Ag+ybL4Fttyxj7nvkUx1LbfRlJjPN1M4MY7uhwR2beS85hN3lG/Td+G0ruxNE9VWO0qM
 XEsw1XW1hRxVJsVy+zupSCLqmkDwKhjI0okQJ2BB84z/wdGobaqISK3wctI5MxR7/0jjMR8ILIf
 viBhwxTrGvMhrDRb90MhFPVzJyIRkIruGFCqdF7ubCDr+PpIEPXRQ1yBchqHnjle86niXVngEJC
 8P5nQetdYPlPyGD1k5j1d/DeZxRQaJLnWqZcnJ9cZQQCzcFV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b568b cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3qzsF3hEsHFFApjBxdaRhtxK4tVbvCOI
X-Proofpoint-GUID: 3qzsF3hEsHFFApjBxdaRhtxK4tVbvCOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX0DTu7/M3E/bV
 TNHyYr2nCs9XquD6TXUR69d+K77XyWZis8KZAcMhclICME74SyJZLc8He44nGfi9OHnHbAKZamz
 32aXfGI8xid7pILM8S5R6dx3zPA3nj8vmJX7NEJ/264JA/J5tvD3Z2ghKUB3lId+2/kg4XiaPB0
 G5199kiALSg1O5BSc3i7lG8grqilEXN2J0CXXCGWWAco/SAK7ZCf3RlG5QAZAequwJLekgdOUQc
 TTMOPE1kgF0aci/GbPizDNlD4TQGKDSiWOI/8dv48b2EmZRB3OW+6jr6foFzTQhu/5HVPuSv0JY
 bfHKPGoi7JHSvmPWOkNaYcH3MW12ZzUCvJxzTBxvIr4cs1KRbeo8AUXuxl2p8KIfF9eQFVGgomr
 D8nP9mw6TuAmVcdUnwNmGGiMgN58PcpLSDHWPvhpQMwmY2Yqyvb2Loek5iwF9eBz2TaKO5m/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5


