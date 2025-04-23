Return-Path: <linux-arm-msm+bounces-55201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF385A99A50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5E60177BB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA652957AA;
	Wed, 23 Apr 2025 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd0/AvLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE52951D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442647; cv=none; b=tqDZx9YQ466p82fwUJ5DGAP6LGQEnKIuBH1GU6y0sHZddfbiPyCmP478hiPENZ2xqOt55AFy9nI9nmjI5VJcqsF2CMA9YVGUGN/geV4BsWOdfwlB87fHn4k8n4cX4iE0BaGrt1XxlaN4Ma/jT9Rzt5dIpJEceqKRs5eptgKigOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442647; c=relaxed/simple;
	bh=BIVlFjF9dcBVj8NlVxPB1HIuxiBjhGjPsBBMlfPwzN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BxY8xTndvE/CKwO2Ft++GJZ1YB0WJH16xDqvhrsan0w8IxwmDsOFKm3jztLPux1zc4oLd4ZWeGDa5S0ENnkE+1DfKtwyHQge9KqYYGarKUyLh1UN8TiqLIlrqxihGaglIerYIZk17Ux5kERPCJABDQo8vFAXVfyWWwK/kNoj/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd0/AvLT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAMcJu003741
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JcjwMLnwxXCKo79+669N2NvGQGgpcaIDCz8ziqM3PlA=; b=Kd0/AvLTRo4XUFVp
	Ypn4YlLNr7fre9/VnThE0HoqQShGLfJsVXHf3XCvHe/Omy1/bEPRAHU2cypsHEPr
	A51S2KCRVy60vGoVByFjUb3Ei9/K5EVrC722ZiUL6YkabumNPb6XxV1+qDjYVFCh
	5YeluVmxgGk0dBByN/W1dF5XkLq43Anu/eIckMy69GuNxVcD1sE141s09/CTJhxF
	S5HM8IodlV2/2rVIgSkc8DlvNJP5z97BAw5DePRjmtm4jaha3RsJjC6r+JOFLV2p
	uTNr4DVt94isr6AQjZLGNvvSqufEUQa2Y72LhYBSQdb9SaD1X7HgCBZfzRn9O45K
	AYP/Dw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy3dgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso43866885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442635; x=1746047435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcjwMLnwxXCKo79+669N2NvGQGgpcaIDCz8ziqM3PlA=;
        b=P0VLHOXK5FWQLdu5JZdlIApkFj8D1oSUSnEg3yJxcruSocIe/XwypY0gAZrXYJC1J7
         qQRungxa4mXJLIUGXh63eq4veObvvy74Yxooba0qYRG9P8cuPXzAu3jqK74QrTp3tUPM
         pEwbS6TYR72k5QxgDqMDQh18nLzs4t06EGkrJelLNdGM44yqSMSdOonm+IAUXl0GlAfY
         B+fwRKE6WA9RmwU0/ELO91A+sj0LCwJDbg2FoLNS7JxA2+N+VkuXtJqLqoqWolaOH29/
         VnhDvgs1HTklwkjaW07wM6n1hT9/QJMv51Tp8MPM0IuOOuLgN8YtZtcK074OZXUlrzPk
         64dw==
X-Gm-Message-State: AOJu0YyWdmU5gx4h9l3MnpIs52AwkbeB5TdnuqZ7kijPNSBE9Qa1oZyU
	tzNZahxrg4oLHAWA44NuQTFlYQhvMqOdCv5apLX4EId34baUqKvJXIl2FcJ5LAQ6IpiuloC/pHi
	QcyCFVVy6Fre/3R7caGQE5972xAOeoz99jXEE9jtrR1uFR+1LN3+N25s49yK/alPA
X-Gm-Gg: ASbGncttf9N307/7XylF8aVW0wiBE5C6G+EbrAQ87kOqw90CQ6N/311HiXE2+iftqT5
	ON+AaDiX7RcErsQ+kDrdKgQ4XJAOq4rwsmkKxfiZzl1nuqjJ5N2Vp37bgKeV+v/s9c+BGWyArz7
	2YrEs/O3WQRXi6fVtpcNDqJ7O8vTVJJQk3jhGu4kP4PtQj2Mc0a6hn+/hv9If+xpZ7gU6hUyZ4E
	b1pB7mtfRE9+OZ+aRGBj7kPfdlfoYb1ESrHPRw875BZec7GAwKglSSR/5T/rNRI4Oer6mi9sNKc
	AAMpfm/s/mz80jX3O8b7xneEMEtu67xsatHKrdhCB3DdvbCWNuSitIrnalilJOO7wRY86DSQIVp
	vsIUhAWeqBjYhepaVmcbtcr2v
X-Received: by 2002:a05:620a:1a8f:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7c956eb32d1mr57138385a.17.1745442634855;
        Wed, 23 Apr 2025 14:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpetK0yosna4fps92ZmfEVrt44WX+Z8mQ+25toBT2ySi6Pd90JP+miCzNjRdJflXWhwX1ccw==
X-Received: by 2002:a05:620a:1a8f:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7c956eb32d1mr57134685a.17.1745442634537;
        Wed, 23 Apr 2025 14:10:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:07 +0300
Subject: [PATCH v2 11/33] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-11-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2655;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UKa7WiIdYlZA+i2dElAGlJso1hJFJoPQsInsDm2A0CU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuDZP0AEzQaPrWQ7KJ6/NF5yo/dQmjD+j2Er7QoXos
 xNcurM6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRyLPsv9ku9KZsucHx/nak
 n+WK791POvcK1m6VSIvOU0ubMfnY9rjvl8TXPZnovqvKbYZ5tb+MjecMIw3n6uRNm6/Kp2xP8K4
 POZ+1T63zeO2LLNVKhfI81uQHh28f32wwV+t+hHGXU3ff83QhnxN8KwT7ZsnlfPvooLfHretEYa
 YM3ynNjndrmBl/H02Oj2l77za/xm9jSeOCj5f1UmfqNghe/7BF40g2w51z6xeYdMTKmUb6rHRkO
 lpRMUW07Ke6IUN3qMxvPYfnuc1a31nNlz1K3DdPOPiGwqMaRisbZb192yQMNzBUHu/6GC1912mO
 uLMrr9PF/f0t2vWiGrsTvkWsu9F+pM555gH9skTRP40A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX1yGWUvdiwWzr ZFm4OyEOJXUouXwdN8S297n7F2cLLYZ2YcVvQTwHiFNd4/etRNlx9/IfL0vOE2qIw8SSVSqVMcB WDzSFuHPBmuaDFB4ki0LkMOOuhDCfoSeQ18Pb4Eeakj4ivoMA4R+pqcJ3OnJ+DnI5RS6f9lGr1E
 64cfNMiVZZGlubMQD13BkldYoZOnOctgQ7M3rD2IgEs3NXtoVSz5DW5EMR39Z5QwLwK8oS+DKmG nWQNiU8tmTehwQ/UCFYiPyLJLrevdXT5EbXqRkXSKQfAru6PRPTs0JVAaqkqUWfEWbyhOcAHdXb KpqHxqU6jm0brmPfUwKEDX3tL8febYI+93Di7XDOIrlzRQ8jDeT0ciI2KQUtkEfQIS6uCNWUP3a
 j4ClWksDSqC5m995ZvCxgVvv+yjOInASXL7GWN5mgjMP6IwTiCts6plAbsdcb9Qm0LTedE4H
X-Proofpoint-GUID: 5Gt6TbpBOQtMIIchYrAo6bCr6CYBCitM
X-Proofpoint-ORIG-GUID: 5Gt6TbpBOQtMIIchYrAo6bCr6CYBCitM
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=68095754 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=qfl85FH2DSYpkZ7DoNYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3431b3c956486aee99664ea9b7c2e00f5c130b7f..a2dc353151f3e1a4cb8a9f4644e7fc2e037356a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ae168e73026d8ebbe605397c6bbd95552193498c..1c6be8f93b54f28d370a379d1edccd178fe3cf7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -135,13 +135,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 593da532d40042ca31fb452679d3de04c3b0d1a7..543fe12252b7887ce2bd28abafac3be7caf17ac4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -781,7 +781,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5


