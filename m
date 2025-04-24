Return-Path: <linux-arm-msm+bounces-55310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D6A9A811
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9923445B84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46220224B10;
	Thu, 24 Apr 2025 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGFXOq5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC980221FD4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487049; cv=none; b=l+U/Q0RaEHYrX/lWRg1Nw1NJXvUNSSf1DbSLlAJjAhS4x1/p+5H+FrEVEOG9FPc8hCUu0NqsekCNUz/UjKz32NhVHB1c3UGno1taigSge3uHMvTlp+9DTdQvwIv1dtqU2tZavwDVLGb5GQP59g/YxrVSKkQY0xPqRwz3rb6z2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487049; c=relaxed/simple;
	bh=H22xBWnfXZ6Aj4WLHuFbpSsw2wrEBfKKWdLmWP0e9rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ku57xkl+q7S8N6I6ezMPEOrHm/ja7QtXqyojjsaI3duUviGC3V1+nzjnoXh2REWoLJXsz/khJk1O4e4xaLQUSqa4rY/RL5/SVK2oW20GpH05fftAFE744qzBr/PB61SNVdWk9x8pD5wM/tNL6TZdEpIbEtz/J6J4ysfFk+4tVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGFXOq5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FlrA007098
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=; b=pGFXOq5Or5ttyZJ2
	+4b2x6Zaq3MnjPshfANAVMk3Fu0aPE1ZmlIA4ACYjleyo2vLig+lRYhONHBXcfCk
	i/PTDBej41EBDfkz9/NpwxGnip4LHf2FcSTC56bwIrqNLqRSlrgvFhxRBgIY2izd
	Ve2K5SfZCj+ex3fFcOrXba3DbM9/L7M7moZ9vOETSW2waBMqOF3vAUc7ueWixhtD
	a9WBzN/wort1Sc6ccbOs3U/Y/Nc86cYBWV3UKYw4KMGWw2tWHDp+YZc1gTZZ7mBX
	voxFnxdb/3q/rqfoGnDIofKXyXTKWqLNq0x+ibrthwD0zIraWrUCIoF227pWw7/J
	YyGbsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh05028-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so134624885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487032; x=1746091832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=;
        b=EuJbHgy3G6RnYa1DjQ5HZqostsTpP12DVMgUBhz6OzhbBil0AV+0t8XjRuHU/bcsW1
         cRFxm8Hv83K2ns5DjLHkvEFz8DU8QbQCjKzqOCnAbAAgHcnu5kQpzm1eHPMuU7xLaFhC
         y8vsi0bqrom4uH8eryG88cheME3UtX7wNkS56bvOXzqAjngicyMpcX4UkwxSEyhoDt8l
         JG1/Nd+Zz2ijp7auKRLO0KrRJqWt5qBe8a54bvD6WkgH8vWus3cTZ4Mv63YsDfbmoByO
         H6PAHrRv6aKsApuUqd5hF5lMgpR01uGUnAOS94GYnm85MYX9icZWmlhgrw5Xsxaj/XcW
         3i1w==
X-Gm-Message-State: AOJu0YxVPMcMaT/GVimcjUoZV1Wg0QixDGvuc0ByCfJlyWrIlML9F/6X
	2W8iFVml01qko39WqfRdtnP9bZMxLD0h+vv24i83RxauYhTl7+EkHDRNJ4bUmkMs6brilOQfiRn
	wo0x890mkehm/YIFIPw/BwmWiyxfJoRBroL/giEnQwhi8yy6vF9UyzUCjeS+b1ZRt
X-Gm-Gg: ASbGncuUPFj9/EciFNq4nFLN1jmP97gdpsH/IUWhUbW8InFdlErKBN1bnPO1+RabU74
	ILVT4MZpISlq1aDuWjCQFNwKdeD5Blhy08DLwB1+hGRLbBtX88CMYbFK5tqo63eAjdGGNsi2ust
	j3OrPy+cqAh6I2XUOFrlOzKr9yAP4FeXSKVPqwuWlsY4Y75TK95mAVSASQdwQ//crr5EuRnp64U
	20y+RggSRKqrSqQLIwGk4HhZ5BcCOVh3AJiwY3F2X5UBYmBy6+vPSl9NI9zxIDfJUAUWXiPjhLF
	2XllQeUQ4mJ03fWeyx7AXSgaOtiEmqWNxfa+deBVlwGjRSqjjm2p3Ma/eYFgpDJMaWAikpcImsJ
	pbyzgF3Zm4QNyjMTofgXZiNpE
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7c956f334e9mr319894485a.40.1745487032138;
        Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWUHHejoPAWrPi677FUC/LXOAzZqmXm+Nu8bw/i4Gd23G4xaODXoIn0yKuicCcUyxeizcG3w==
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7c956f334e9mr319888385a.40.1745487031797;
        Thu, 24 Apr 2025 02:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:08 +0300
Subject: [PATCH v3 04/33] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-4-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqhsEhQWFa8FUQJirnBAfp4FL5UyiZYwL2j
 KSWqcA0JxaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1RT7B/4lgGUG++hlUG/YtsFmd7Qoh4doQsDs+oVgtZvTumibpfEr+jSMdAVQEEydNd4LTj9r/3e
 7XJmv/FoQpLM9UXzNq565hGC+f5P34GP481Q8iXLcbBHhtJCX+SjeNxfP6fJRh6pC6NWhbV44lG
 iUmCXwzAYZUnr5hM4AQ0FBBlCGDZ0L2g7nW0WYbi3SQrWUK3ZY94wxeldCbk6nttodBiErfRMee
 Spk6Jv401RlstzoR3jfpNXozBO4tDoiBBEO4UavQHnldyWVXJ5LQDA59mar1bu8eKyn2sbxmreF
 lZmJtj2JU3tSoto4IKzJQ9w0z+jjPbxlB26AG1+jQp4dQxKv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX84Y7CvkLxr5U 5RzT4d04qedRwHdm2FRjCqtVo2cOplWH9mSGgoK+Wy+fxNUZcw/36W/NT3NTdU98SUjIpSbXw5D 1eqROof0EisMyUDHbX2SdgPX2PflEvtGP7P0WpnfVVhEaoKtON2xahXZKB3nPxCg8EM4kmDS9kQ
 8v1KU2YxKQtQKd3xdUP0uqRGpzzw3byTnMOBZmgma0igcy+h29A4QIszQ5XMmZeDF2EgEldYqeJ pblu2Mgs9VJlFUaX6WQsd+XJPLHa0dkXiNj50OB8QTzBhuA4P5riAa/oE5qiBMcgng+rteqBWQ0 4HE+I41PKvSb/kahWfhStGViw9R27EcYzF77IT6TXUt+xu+r6Qr58iX85QXMgTrQTJVLfDPvVer
 Oxy+USL/eSLFcH+ZFPtGR6CXoe9fRVQ2MUUN6vlyJ782uKRl9ojWgNZEHU9ca4/6dV73UTdg
X-Proofpoint-GUID: fwznDLidlXGLJSqww520WfpZ1A4h-ZTr
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04c5 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fwznDLidlXGLJSqww520WfpZ1A4h-ZTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


