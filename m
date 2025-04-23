Return-Path: <linux-arm-msm+bounces-55193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF805A99A07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C44E54478F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9800227E1B1;
	Wed, 23 Apr 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWPWBxZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDAE26A0AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442619; cv=none; b=OyIL35we1Os/YF8r8swbiPL536kuRUR9EF9DlkiafaEQY81sn39lKTqbr6NmYe6KPHDtKmTRzjGvM5HlYJl1fYbht474t7fDViAVa9w6eQ4D8Pg3RBWwu1TWj7MwyIfzbAB0oBmL30NAkFJY2ZFo8xtZ6CnEfAomXhYdNtgqI/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442619; c=relaxed/simple;
	bh=s9IJSOOOrNZgK6CEln/uc2UY/PBwEzbWizMvNdDZyMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djmYZ045WYvFKk/nlwkFO2hASpTM3mMZ2Ye4zSHTvBFAeHb+/WL5tQnv+nfXq43uqR3fwrpdPEx82tf/5Y4dBqCAavBMBioczr+76ae8Pl46x6knvuGchp0z+tuAS8jPFfpVNNlLofSQKfwomzEtQ44dlxqAHWbbuNNaY6slQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWPWBxZl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBB3u9014204
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SisAnUqB4LaVzfmgzSbgxpqoU6yEo3Id1pN19xPq3cQ=; b=WWPWBxZlMwLTT2k+
	Yr2Q6P5AO9CFE4yfhLjqJFD7yV8UknpzqWdgC9rRrxYVKY7ZGYa89Y/ixllVF+qU
	WXH7by5c84aW/JpYVUh80EwlhBjOVkHn3AaRV5IYSyai4b42i89Oz7OXlqfzy1IB
	30RmIInaRVXoYsNsGXvmHcA8CRIjjWeYjOAsYbUGpM/SBkjmJSSXZY+/yKs7XnNl
	8syIcxzWNMpL1UtLicnxMQ1fApWdeJxV82sGpqn5vF1AScWw06zS2z0OGLGS4ffr
	TPgiXwi29KHXjiyewtLiBRRKPLp7ztdyMxZFnp4P4WYHPRmjit151wdGtnCj1/yL
	Zsrx+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bcx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so44330785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442616; x=1746047416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SisAnUqB4LaVzfmgzSbgxpqoU6yEo3Id1pN19xPq3cQ=;
        b=cfniZydedkuHti4lPsL/G2iSKgybXGGAaKvhf/PF2YQHobSnoKhcjRnoWwb5AuaJGE
         1Mc3HMUnxaWfF1gp/zdt648ITd7Yh8NmWroa/MJ1no+acwF4tAKsAZbkD5dmGSfFF6Ux
         M1VdU9nPkXbwETxh7rhQHxiu63II8iUviR4u2qEYce8NVGVYE940MTVMhUpjLrxv1bby
         /pZkv+CmtVlGH04D0YcWMMge/gnbsTUJ/GN6+5r7zi/ckjYJUV05KDPJHSCKinPnKm7D
         X2aW7gpUXtyHxLH90/Qlga93I8JQYtIJKlztxAL11RsikgTEYVef7SnMAtA5yXh2KJlC
         7RMA==
X-Gm-Message-State: AOJu0Yzm8s6VcdXcbCQ2zmdYbV32/bLDTTkyd6VEsWEdK/s//6tb9Sl5
	VHgoTlBU9y1HSvkWw5TGU1R4zGNgILdXISHePp6Wasbl2PQBk+38EryJwOL5vqRy9j0cMXcMyI+
	NeeOj9w1pzosER+1lis7Kyf19zLZB3LoNqxzIMpK7qiIFjsS4jz/0ze2IyJFXeuWq
X-Gm-Gg: ASbGnctYQ/TDz4t1K8cjZqUjSbHi0fdTCwHITSEzq2v+JtYIa0Ts9Hfp8Lmxz/qN5P2
	oT6Q66LPkqO6OTHSn9anE0n2K4rz/s6ejxdWFMjoHrtL+KCd9wC4IBew6eEtK7YhxYEVNqUjGUK
	SZO/gFMIr7RUMhRfHZ+osW7aetuzmIRwM7V6SXNab3LFiV7eu3EyzuiuvNtBC7Vt9u+3S7izpgT
	YJwr0pzVVXOLViPMnd91KJw3QBOW6nAlLMAqGjHPb81dFBs4kMeRu2baZB2GyK+SWeHciUJX+6m
	4vHwq/HoMTuG9KfcKaoADIzPhdOoEe3l14Yw01WVpJ2qA/IxuO1yhVSvGSCKPcp0LeKLS2mRSm+
	PRkIhwCF5LXcJURabcDDHfqwq
X-Received: by 2002:a05:620a:1709:b0:7c5:5670:bd75 with SMTP id af79cd13be357-7c956f212d4mr56933385a.46.1745442615531;
        Wed, 23 Apr 2025 14:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT53sPIy868A2lO3UwsQy+q3oIxzWb4uZDa0DQl054prk7R4kUAvbcZdbuHZzZxwR4E3Z8Cg==
X-Received: by 2002:a05:620a:1709:b0:7c5:5670:bd75 with SMTP id af79cd13be357-7c956f212d4mr56926685a.46.1745442615017;
        Wed, 23 Apr 2025 14:10:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:09:59 +0300
Subject: [PATCH v2 03/33] drm/msm/dpu: inline _setup_ctl_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-3-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5798;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6nM57vgHQs62/wjwRtInuGG9vKrODBr++a+KVt2bcP8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqR78AVabkljNMdVv4nChjUUZi19cLr/AkO
 te1yG+cha+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1UF4CACtPfY/P7W/9z6muHd/1TjgUuQPAMTG/CDZLtb0nMV3YCQP+r3BkPMztFwLpqnaI1ntlEa
 SixOPQ8FkQKfUBi1Q8q4zggAEMhCe2CeoG/QxZgPQeS1WIVXFvFrJgNQ9QSZikQ5uKxZlQlOpEX
 nHPYV+hb8Q4xHqvz7TyNlsQqzXfVLSHiKtgX4bWG3HQj8UnvO9C015QnoplGwFT1oJv8jGYlWD3
 1cYagbeGBXFI3HYwJAhe/UPE1X9JMdgcATZacObmwMQj4wRAHK4qLuGW8yGplYAiLMSYzqhc/x/
 XupU9bqm3Degoqt15RXa/dJBlCDejc144gZiwVBBCP6I5IyC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXyd2bnpdjnKGB qRBtoKl4bmn/e31VJcudJ/x6fhifSeRjEyKkux7RPT8YuMxn/jzJP7HHmNjsj3SmMgbIvbwvOP5 2T4WFFO5klsrDFp9NXr3Hm1/RUXF/63982Es/khXZN9iu0ufVzSECQvVLMDPyJDc0PUwS0oqRIj
 malaCuPaa+bfZJ6XR95+XXrALGfMnqCVh3pHqQmc8RPxk68EJ6BWOWVPFwK3tKYCiOr4odqTTQD z4bgVMQbiZeMg1YbVfVybKG/qQKodO1Sf5b3A+HcWiJBIAuq8k+5Qkbxm7l1Qz5fMSSpwPBiFcR aZJyyLu6i96RnmmBWEqavN/eICkbP9iAEbRNFOgFRHvUagOOQxer92ryhFOZa9xT6k3dWz4rwPE
 e7a3gTjeBhnPVPaKexmBc6GmAGEGXBPT5pPGo2Ubh+UhjMLw6BKRtzOOFRlYD3cX3ciGE4hT
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68095739 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=RpF703knbOfOEe3tTfUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AoyV8mfD21c_CCWqWK7K3tbcAvZmcku9
X-Proofpoint-GUID: AoyV8mfD21c_CCWqWK7K3tbcAvZmcku9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_ctl_ops() function, it makes it easier to handle
different conditions involving CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 98 ++++++++++++++----------------
 1 file changed, 47 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 411a7cf088eb72f856940c09b0af9e108ccade4b..466bfee3db52d980877a5cdc4eeb739cae250afc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -714,56 +714,6 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
-static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
-		unsigned long cap)
-{
-	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
-		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf_v1;
-
-		ops->update_pending_flush_periph =
-			dpu_hw_ctl_update_pending_flush_periph_v1;
-
-		ops->update_pending_flush_merge_3d =
-			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
-		ops->update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
-		ops->update_pending_flush_dsc =
-			dpu_hw_ctl_update_pending_flush_dsc_v1;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
-	} else {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
-	}
-	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
-	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
-	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
-	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
-	ops->trigger_start = dpu_hw_ctl_trigger_start;
-	ops->is_started = dpu_hw_ctl_is_started;
-	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
-	ops->reset = dpu_hw_ctl_reset_control;
-	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
-	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
-	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
-	else
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
-
-	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
-		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
-};
-
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -789,7 +739,53 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
-	_setup_ctl_ops(&c->ops, c->caps->features);
+
+	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf_v1;
+
+		c->ops.update_pending_flush_periph =
+			dpu_hw_ctl_update_pending_flush_periph_v1;
+
+		c->ops.update_pending_flush_merge_3d =
+			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		c->ops.update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
+		c->ops.update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
+	} else {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
+	}
+	c->ops.clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
+	c->ops.update_pending_flush = dpu_hw_ctl_update_pending_flush;
+	c->ops.get_pending_flush = dpu_hw_ctl_get_pending_flush;
+	c->ops.get_flush_register = dpu_hw_ctl_get_flush_register;
+	c->ops.trigger_start = dpu_hw_ctl_trigger_start;
+	c->ops.is_started = dpu_hw_ctl_is_started;
+	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
+	c->ops.reset = dpu_hw_ctl_reset_control;
+	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
+	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
+	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
+	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
+	else
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+
+	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
 	c->mixer_hw_caps = mixer;

-- 
2.39.5


