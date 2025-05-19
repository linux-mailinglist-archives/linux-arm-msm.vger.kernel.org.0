Return-Path: <linux-arm-msm+bounces-58496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C2ABC3DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090D316B80A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E7F28A71C;
	Mon, 19 May 2025 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqtiC6ij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A8028A705
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670701; cv=none; b=Hq4hTrmJUw4PNdJ4FSavA0zsxfqYzTAdg7RF8GLVfecpx30w0/XBGbTVigsjXNJNdqmBLkOIiruuWQC4nCesajgagJ6eHvXLN4fOY9ULx3LHQ8tn/NMamevvzrYnfYY8qbL8y+XrAhYAoyQRpRMhYbNh4mesfHTOn8l+4wZVK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670701; c=relaxed/simple;
	bh=rd3tosR7o8UrBrynvjvnVscarTHdCBIF6Zc9XKE18jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhrUOcW6U2EUWfAZ6jUS7mK3ccMe+CZKt1/4Y35LsUPJzS3XOwKLINrMlg34SbtAzlCZGbbB2ACrl5JFRLMNZB9aZ6o6ODS515ZebwwBaEQFhELaoQDMaEQmor2Ng1NL7mAix3iC6HM3xF62MEZEd5UjxEGntUQ89EcM6vlHy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqtiC6ij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iouv022751
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XP7YE0JSU8f0uxOvYV0daVueaiX1rp3UCYiNpzDK4gM=; b=PqtiC6ijL3na2eWs
	CIf8SXo/EHmOvJwGbQHeuO0UGV24jFwAbAsxgx5cCjNebWakPPL+zHYS1aqYS385
	7eUaiQCCzEDoi1QOnLsc919k3rT8M7Ey7aISDVyt/L1Llm5JBCYP07IngFr3MSA+
	7xqwKeWbx5vS4MJSSomYjqp6/N7CPJ1Onm967HtCSzVuJBosnMh0zZeK7OcpsYNb
	z9o7GDEw8uiYVkrbtZrXQoTfzFTVKVkEVUvF0Qpd+rUFGPi54R6saN627Siqshq3
	TxGNr2wNSC2YuorQ/iJuoXj+JTk028Q+ZRqpSuKD3HVIpbMg8pGbNVzsY8hGE8yf
	u3RAYQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d11sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:59 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4049dfd823aso1920142b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670697; x=1748275497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP7YE0JSU8f0uxOvYV0daVueaiX1rp3UCYiNpzDK4gM=;
        b=pOw6m9VfHP8vZqZjC/6NJgBhGowRsqED6gVn+GwK6DPxyZmlHI22NYenjm3mrRovUe
         Xx4skgBzVCvJLnAPkIkweRhi7Ems7CHnHM7gM5+YKGEUAhV04Ai8hLBrmumqVBtI6RzP
         SgZRhOrpIloxDzgAt8ejGEzrrL7hnCq4vZDO80Y7bAWotX4fXkSeP+4KdAuSUUH6Q5gh
         +PCdUfmlMIcgPFvOF9jU+mH2LD0xPS4hdqqjf1oY41zsZw4WTKu456erw1dJ9GxsSdkX
         tGFI3NJeQ64nmy7CPe6jUKimxG7vx7CFoewDAZRDTNfjjSsCzJEuRhYQc2HGVpzw5LDq
         55CA==
X-Gm-Message-State: AOJu0YxY+Wxtce0wj1T3x1u6sM0lKLZDSfY2Ogi9cJVqroUr5dhMbvoi
	O5trXsSVgZt65+jqh0GPYUaQaP2ntdhcVakXvighfv0I18ConCUSjWVyRYlweMKEbJBiRFig1CF
	MZeTVS1AN8So40jurrDf4qz1OE6sVNrEeNMwPza/YUFmLQc/3kQ1oioQi/hX4s9qGq+Tj
X-Gm-Gg: ASbGncsMJV1G5rhsGbh3dv9Ws4jiZz3rQpPk555w14/WKgiIIf+LUmybG8nBeHH6zFO
	5k44M0jtzewvdpbOEaNJg1oj3TgWnJZxrfcCqw+VgPPayoGg5yFgn0cnuhZgWcNAf4Zcv61LoJM
	uGJ7E8grHRqVzGYxBWEeto75McwaTyaFpZthe9KjPvA79d0JdGZfmzC21n28wvCpqFsV5Epxmbq
	kE1T/vdkV2dbZj99FaJceszrr4SX7RcemTBu+gnlUGusVtgJXPFJu4C3OK9hRYdL9GBxi6NbNV9
	SjzoAgv2xKi5zq9udETVlatWzHveMBPy4INJ/Vb9AfdQjKDZ2wMCPVAf3WazGKhVUcIEiagFpmU
	T8SA9CwLadLwC0jJV8XtwOVBY
X-Received: by 2002:a05:6808:4490:b0:403:3660:4130 with SMTP id 5614622812f47-404d87b89fbmr8227777b6e.27.1747670697042;
        Mon, 19 May 2025 09:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxcxGcyI6HMa3gAL8iMQo+Ieo2rYXZp/t7CC7b9uPDZTmw/1yIwewWlzbOfrbe7KY2Rpsavw==
X-Received: by 2002:a05:6808:4490:b0:403:3660:4130 with SMTP id 5614622812f47-404d87b89fbmr8227740b6e.27.1747670696624;
        Mon, 19 May 2025 09:04:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:21 +0300
Subject: [PATCH v4 19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-19-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8015;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=s2aC7HPLYf/vUxsgZvsJxT9ztKXJePENnoIqxl1pB+U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8wdjdl9U5KycrUFao/7Etw8hngUMHFdd+K
 uhkazJ5xIyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1Y7MB/wKHH7M0YicVplHV9fu1v4ON5hoR01NaJUOECktPA/Qvul+AJxLqs2TAdextWiRgoJWyZj
 mUs+CIU4+Lq6DvLtNptaVjYFdNTbphtfeES0AbxOdfs2VNmmeuj4x0v4gGxAtC76ZK8WUqIuqbk
 kgCDtktJ20APEx2kXDLM+Jmif5+ixrtru23E9an0p0wFvCAhoTqUTtx0uY0yr7SGw7hMbpGGTL6
 qtJtSD9k+5AwLW1lQsggJ0S/wy1oN4YDgx/NghCQ/l9+lNoQJPVL7m75xmlMcd2w9LIkoQ5hwRh
 inxOGHg5wp1EDCOnMe4NHh9c9vj4n/IRbQP1G+bZ2ntx+ybO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX6YHvgXjKg5R/
 91f4EgSRXvv/3Rot8V5LDFasJVbMZbWAO7QZdYltYzg3KX/CySgp6NUJhR/OTjauDYGtQXGZohN
 Ur+Jz5vPk7O9Go27bHlFjAI2aPmQYeBW07xft90GescTzg485NwsXVcwii0XgBW2MxUFNld13tJ
 Bh2ckSAF0H5JYpQM9zJflzHWdTyIjqegM02CosfaGzD71JkNB3wF06/VUZ7fhZkgK2DOdfwwtrE
 PnA04zudZs1GT5mmgUFv3kYQZsDJhYL6lcwByIBayHdih2TLNGBANP3xJnQziioxQ86PcVpBSz7
 0sqfIGUD5dz/t8oAIk8izYcsDjxmEhXNH6t2qUJxCkkLT/SGC/bNtsEiih6J49WGmUCdMsTyWJg
 HLSpdNu2jJOe+JmQ+CHrrbwpwSWyI2V08AWC+kQ+7EYbqSP3rJZFFumqZYb1tmPYHsG/g36U
X-Proofpoint-GUID: 4hV_hzPP1mEcRrknqBdVU88k01uQfvTj
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b56ab cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mpK4J0can4W2gMZkP7IA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4hV_hzPP1mEcRrknqBdVU88k01uQfvTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=998 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 10 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 37c88b393c12d8a04395b6e5dffb67211d2db9cd..ae66c338250664f9306a7d431cfa18ca07a916a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8650_dpu_caps = {
 static const struct dpu_mdp_cfg sm8650_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 785ca2b2e60f073b0a2db0c0c4ed3b2722de033c..85778071bc1347008dbe4522aeb9ca4fd21aa097 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1401a84e0da5754fd2a3661d1421bb9b998271ca..f9676f804f9132296467bc751e11036696afa942 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 static const struct dpu_mdp_cfg sm8450_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index fbbdce36f0ad99d0b1d32d90627ff5b7f3fc2fc9..7462cfc4cf8de4a10326c83d3341dbee76e437e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sa8775p_dpu_caps = {
 static const struct dpu_mdp_cfg sa8775p_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index cc4413432cfdc636e38a56011d39f18d7e94c23a..695ae7581a88b36fa1f28aa3cd0c9166090e940c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 static const struct dpu_mdp_cfg sm8550_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 32f88533154584dc98a515b1ddef27ab2005fecd..9a25113df5aec527baa514aaa61f2b47c2443d27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sar2130p_dpu_caps = {
 static const struct dpu_mdp_cfg sar2130p_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index e053324d76a2e5020e6a7477ddadc9f7d94fe57e..54815c613f087454aa7b4befc84462265d8dfc23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -20,7 +20,6 @@ static const struct dpu_caps x1e80100_dpu_caps = {
 static const struct dpu_mdp_cfg x1e80100_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 92dfbb5e7f916bf32afeffdb6b843f1da3f3fd44..d3a7f46488a21e81a24a9af5071a9a7f5f48cdac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -32,8 +32,6 @@
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
- *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -41,7 +39,6 @@ enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
-	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cebe7ce7b258fc178a687770906f7c4c20aa0d4c..c49a67da86b0d46d12c32466981be7f00519974c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
+	else if (mdss_rev->core_major_ver < 8)
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1022,7 +1022,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 				dpu_kms->mmio + cat->wb[i].base, "%s",
 				cat->wb[i].name);
 
-	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+	if (dpu_kms->catalog->mdss_ver->core_major_ver >= 8) {
 		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
 				dpu_kms->mmio + cat->mdp[0].base, "top");
 		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,

-- 
2.39.5


