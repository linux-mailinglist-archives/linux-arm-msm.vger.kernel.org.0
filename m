Return-Path: <linux-arm-msm+bounces-58481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4900ABC3BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0483016037B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82990287505;
	Mon, 19 May 2025 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zd6WgIJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFD72874EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670665; cv=none; b=TnX3/1j+DHK8JLX5zPu7NpgoiAHRpJmOk+C07rjmLj6x3ijOPEo2PPhH7jRruokQN27u4i8FisNI2z10BVTlFUHiiDRiyHn7PyVzSgMGVx8tsqhkrNLHbMOEJ7DZl+Kx7KMJWyM3HcYxneaPcUR8aBChtHvkdWBgL3fz/y+DgR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670665; c=relaxed/simple;
	bh=X/cARphzPaTN7J6hUG+1p5ww0kDbsqYfp78lcUIgVS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umr6AeqjnIYt1s15Ls3oJH4yfltwrUan3vxFQeKGiaVeK+aHhYeUrfEAcFvt1Fws1SZA87gGmstl7oPA8V5TcqONrF96DbU76y9IXawnT689JrUnowECoGyVDbXF74AlQ0NqidBjiW0gK+CEVEG/6h/xppPBIB8ny5CcBsX0ap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zd6WgIJo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J91FLo021887
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=; b=Zd6WgIJoIshTVbxG
	c6M8aAfAVobAr/YyiW4EB0VDkaib4wzD8JlZzECQZ0wbJ+9Sw9kFF40FsEnlE2Vo
	UZeOH0Am2qGkb4qydNoULdRgGMyViRf5rT/TAnewoEW1RU4htgRoLYaQGSTSBM3s
	jdh40FyDv18IXi0U1IdkZPdpGxbRehr9GMq0g6VIiqpGSUYkJCJRxBP933X/ujm5
	KxQPxxdTzmxeWWi3+ybIfCd22YvUE2FyE6QxuqKFs93MvzYYgConjqjM5wiTS/qG
	aQVSoKYZixjXJDNWpHoHfTn7u3hl7mBBX8CC5O077kWd+/ii85zkXcOq0eTXgpQY
	lTIzkw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn13m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:22 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-403317cd1ffso2130675b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670662; x=1748275462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=;
        b=mmpS+70+Tz32Y91jVbMeh3bVvhuYVQKjKVdgxOIAm4vnUtdomnMlh9IOdUsXn5g8yg
         DL3/gBpiPJA31bnXTlsifhW6dfjmyV2337yP63HTG4LZ6Hoj4aGfi5wEOVfa2hQRnXFM
         bB+yAe7iwFk2JDeyAr49QEGE188RM701VkkfUK7MGrmghs0dh7YG9KHiv+zW6SBadGn/
         6l37uGyoBbJLKOXOdQ4PD36U23Asnk56OSUO36qz6+vIaYeFA/U5KF79TVhZ1DVgf+oF
         wp+QM1MgYo+13C3QTImIvlzTc73eMdnvI/3IBmxj8EbXBJKf33eMzcSI5LTqrGurjHey
         XGDA==
X-Gm-Message-State: AOJu0YzQyenbXA6qEpBQ6Ej1KwnA2ggEM3y9NtqQbBhw1FdLKm0X3dha
	88tQiozgJM0OQAoHaerV3M2ACuioJZAYmfnCxkXUG+l12DAJCj3Q+IspimyBHY+NWIMKsFMpa1j
	r4IXgDmmhinvvPGhMOKTiXPeVgeXADx/J0GVBUHZwLPEONYeXEGiwBGC9jj+m4UWGIVZC
X-Gm-Gg: ASbGncssq5dgEXw7qtIAewGR5EvCHHML8jIpuUclJtUhUCFytmPFuQEkrewQWSTCyIS
	JNsqUmSxOcWSnU5RLCTChzYz08cRuKXwirhjIPz2h6+KIAwpWPQCDUW7iibKd4kbnVljXh2ANyw
	pUfsPS80GR3H+ydSvhwbbL4ZiY1JPOPUYuCOqPNjiv3oorr2uZXFw/jJ7k5dwu+c3ZPUqXOBHYT
	gRlu4MIwbZOyGl4GMJ3lBdcDpJ3o7g3AbEasQy82wj/GoJdnMVWlzMUDkRgI02m+WDABLwVk+TT
	XKj1bJljzdMpMaIwoQB7pvWVI4uo/cAVYsHua6tTYTjHYq5FDET2ruvVIzgS0DkuX3sSWrbYeyY
	FT7FcLSZCY2wXyVcEemrPtGGt
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id 5614622812f47-404e102fb3dmr8677807b6e.22.1747670661813;
        Mon, 19 May 2025 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjcPOULuCPi9Gz8PeN8WglsKOijdjLwIixJjwa7hlcPWR5Yzy4Y9hE8EuoKimVAyoiC66ylg==
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id 5614622812f47-404e102fb3dmr8677760b6e.22.1747670661484;
        Mon, 19 May 2025 09:04:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:06 +0300
Subject: [PATCH v4 04/30] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MEgX/3vGs0UXxx+RirFKOH324DnVyoFKiMBN/zZL6fQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z56tKPsAsQdY/+ZTk79GYuzcy/HLPDbC+oY
 kuiPoh0z5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1R1eB/9VKwfYCQtW1Ktf1qUs2WDo2JIaaBUIheGmLUyxbRm0ENNs1WPoiGkCfxQ5fcVuZDOKdQN
 DqRlBzIcfB5Rh8tGzHuFGAzKQ1kGQcRS/cUC0J5tQzTB3LyFlB8SDg3ieMpkRU5EywhW5jdv+jf
 z9j0+eZ6yDs9TdguOSwZkTSoiYjaZzEOCpghQoYsbuYv4COqWGtTihhCBw2cdQ/Z3c5nJ0yFKfz
 gkJLmpyPdiTojZN+T2mnvOHr/HhGTbysK4AH5cybBTnp+hgASYbMnYFewxyNmf7NZAzx/o37jzT
 ZGB5K6zOh7AoGRTq5aZ4ZkkxkY8sjFyn5i1u1t6iCsCcCnmb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8BrOD2d_Os0KeG9zntehi0MXsva1Ll7y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX5u9WudCIJeVm
 OkPyQhoyGZ7IqzXwh7Gdye4zO+tBmoxXNPBY2zMITuDpSkO6+5gNSIoVkGCSSZh0xdYE0PsFDeP
 SP9vsB1CGapN8ticXWF6RCv4kqsLwimMMu80eWsuZXGsvU+YUR2lV59XO9Sms4eCUbZ9vdMXnIh
 0CmUMs064Hh7y8TXqmVtvqU1lymdDIDSW/vtfNToFRyal5Wu6yPo5UcdaFPvLiyZVVNGMi7zEhi
 5vu1AvZbCMpo8K9e/B041BRfVP42QU0FuqutrI+G1A9xXoxsPrdvtGlD3a4+ZReTuxVsIGQdggf
 vS7orDrE+xipjBHvy9EdCCk4M8vu0Rn1Sj4P6xdSuP7T/TdRYBldcO8xu3BH3wS07EJshXEv5NP
 vLzahJlTJli4D/8n8hVF2ltKSfcfk1MGpLjYAL4lz4zC0zh8mjvEofEckTUpNPyMPgvnbxP3
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b5686 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8BrOD2d_Os0KeG9zntehi0MXsva1Ll7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5


