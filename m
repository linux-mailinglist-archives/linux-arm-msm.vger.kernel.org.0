Return-Path: <linux-arm-msm+bounces-89184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBDD23997
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02169313FEBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D450035EDD1;
	Thu, 15 Jan 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fngj9iO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTpnHjHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D438B7A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469379; cv=none; b=A7DrBHkAoHRRw/L8i+Z/vqf7YolJVhDMLJbGPpSQiUqqEDzGllHAffZ8Naa1ezeoCdnSXSUDcup4/iNzlz7LjHN63JJoO5Zd1FAXPmgGyW3G1PlhMnvqQnI6S+U50x83MhlgshL7EnpqTjwdjqQyW5Jh5z/AGjli15IgsegyzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469379; c=relaxed/simple;
	bh=VNGjZmnG2NosKSvdk7t2xoe7LfqUSp5bkIZ1Y4r7mlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ttZN6/zoomllXAwKq6YAKj92+m75YgVGVLZkSxRI4x/oCuyU7HuK5Hqto4n4XZvUWvfrqZmvAjtFNIClhASGKbT085zK/fSCSnecTjmEaPH6Ofw6Mzc8V3fOmblzm0VsoPy6r48fE53kr6bKzPWNYJw4PaDxknSRK7Ts6eDiBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fngj9iO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTpnHjHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fsEB606557
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ROM7fWPFWUz
	cmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=; b=Fngj9iO2ztJCKq0RZTyVTe+d7HU
	3m8wcb9vIxsO4XFUBQRggRwPSIx3lJ5yaFO3vgT48pD+fVJqBnBxqi8uXFBMzc1q
	aSTSpIe+WBTg2ehIWrxprqvJsA0qHnIiX8gbDtifMow8mcGm+67E5NNajjF3nDjE
	3KJYO49INrlbWdicwP712CabM7h3uqfnYSsFGcP0oYRcpCPDSrrGcFtfyN99mJ9j
	FMWDi0phLFY3lEm+HFDhryI54Nv/Bz76bSfMorgznch6LLGSIrp/99peZwqss0Im
	u21pLMGdd/FQnZWynlj3QV/VtTeXIGvwHOKFh01e5v7cYx41C/TR/VMFwtQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna0jn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a316ede50so16565186d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469376; x=1769074176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROM7fWPFWUzcmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=;
        b=iTpnHjHZ0diGF3vtDSa4V0uyOsJMQGWcR1SbZeGZPHBR/yzhnWzji/MUkOvW0vNmfH
         Mtafxn7oYTW6mnuCdWC78zbgIyZ37or0Rq6owj49FHJ2naEp0pIP05eO08L6ml8mIcqo
         ZCx7dLifpqyMrqYAVxncCuuoXTgMMI2y1NTNrv4c7HykCBkI6Y+gb7N/N1cJk/kkXloO
         NPTi/6kitSilCNIQIe4MFOK0mTx36mK+hwsBFTDyOMs5SIaH8RGx1/jK3MDxCiqyjY4g
         pT7p7m9ccFhqZzNoPpC80ab8rGLTAMPMt2a+HZQo0QBxUDUEO71GmE3uBS9V6dL4sS8y
         SsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469376; x=1769074176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ROM7fWPFWUzcmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=;
        b=gBl5y3pAataT944uazHIRTjBevISygk8eCiMgzEI5WWw+0arqfyEz8MXJEng/uvQoA
         hLwk17cKeHf5strkDu5Wbg56+m3o9BolVXjUSgUjxZWEHobJIaVFN3mzkf7rLeW2lDb6
         j4TOaoIFxsp9Ap2fm+smlfI649jkGva4XWZzkhvTzX6QA2xco9AGXTJGS+w/7cMr1eDJ
         Q/sKAFxpuTDJMfyjrFJ6rQp4eEgj5nGvj4X7UsZPAIbnBWUGAtAQ0N84+wgj7W+Ga523
         S2ay5JnxWATPZ8uEUXmJkzV5BSmviyTpeKvHBFBMgf8fENqvZI9X6zARhSr3Xg4ng0Ej
         60BA==
X-Gm-Message-State: AOJu0Yx3jscPWBQvS7+u/s6X7NhQm4IG99w7hHPouXj1FROLjX8dLS/v
	Tl+qOQIm6PtufMO/srEpAkNyxhD+KFcBPIee/1wxjMMwyU/3d5pGmWMVZb97ArFoUx74IDdaq3I
	DBHPAYO0Ab+0wV7cfvpNqWiPGyA6fI7iBS2dn7ofFM1gG1g4RQm1i8A1G5BUQyMjEPQVQ
X-Gm-Gg: AY/fxX7s+x2BR6ski0Zz/gjdAczy0//yTm9cgOZT5GeajqC+FhqOY+xxtoKJIRzd0uu
	ekkaMWW7f1qs0kjSgHO/0UpJnYof4bctJBm4leaEOe12GITen6Aqnwi0fU8APMqSMTedvo1gyr2
	pK3T+1ebBp820Eo7pwYwp7gmA0oO3Dp7cr9fgD21snYjRniH+WLAwfuSf3vijCSPwC3vUNfvEOp
	qBLe7YitHoS7z71TsNFlX4Qm2BzrCju1+ckZ6BAcuxIFYPJvX9eTRBO7JVjWu5/ZUi5SjAy21Lc
	82SqYAQRxvHdVu4QEU5fbkCkzkD5w2D/bJnWsRZkXzDbHD2AiIEykdHKgurgwBujOUsi5XS+4zf
	HPqN+JNemuy+qnKTR2wktQttG3AQa7XFzTBDt+oG4X1xFgGQ8gjDEnixlsodltT8Mcmg=
X-Received: by 2002:ad4:5e87:0:b0:88a:2444:36e9 with SMTP id 6a1803df08f44-89275c87512mr75285336d6.67.1768469375907;
        Thu, 15 Jan 2026 01:29:35 -0800 (PST)
X-Received: by 2002:ad4:5e87:0:b0:88a:2444:36e9 with SMTP id 6a1803df08f44-89275c87512mr75285086d6.67.1768469375520;
        Thu, 15 Jan 2026 01:29:35 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:29:35 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 11/12] drm/msm/dpu: Add Kaanapali WB support
Date: Thu, 15 Jan 2026 17:27:48 +0800
Message-Id: <20260115092749.533-12-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l0d6uOM0Em0S6eguWEWtAjLPO5E-POhl
X-Proofpoint-ORIG-GUID: l0d6uOM0Em0S6eguWEWtAjLPO5E-POhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfXyR3RwLuGA/l3
 ISmldh5ddIM06QUkmKpqIsCJSB6Ua+l59Vkqmzo6aC4pxmjhIKjJ06F1eOLxQ5HsYRUgj2Nb7jC
 oUuNU1tc3vCU/XX7IJvjdFGpb93T5kE7BWZZpw8Djf+NxOEAlZqz6iR38XcZWbAHMpH5P4QZlQT
 qw84VQttHz8uZ2Q3o5gJCVEXO+ruktw/hPPUuTuIv0RqxImMhhjpyLO1OJZ3c8UhPzD01ZqDsf4
 3hrCWRvreEwozIF2StChdWVzFJypPVUEPbM6LzEKlNL/PWCYLBEm0b3Ik3li3l7hAxnnpGuNkXZ
 fII0RoX/hLPLpTdB6QI56nEfDalRCIF3QyQUKUq2g/hWloDdA4DX6NT8GdSAemwDn2Mo43vVc5Y
 Vi51+ZM4N5sCjYRC6I5YrO8ppVt0YNvjeRuwn1IdZdoe2PXgrbwbcQlUAs6mEDBZhcsf+Hy2qNI
 YeYIwHV/e35ABZyr+0A==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=6968b380 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add support for Kaanapali WB, which introduce register
relocations, use the updated registeri definition to ensure
compatibility.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 478a091aeccf..4da4bd6a997c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 			      cfg);
 }
 
+static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
+					struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 				const struct msm_format *fmt,
 				bool enable)
@@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
 		ops->setup_roi = dpu_hw_wb_roi;
 
-	if (test_bit(DPU_WB_QOS, &features))
-		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	if (test_bit(DPU_WB_QOS, &features)) {
+		if (mdss_rev->core_major_ver >= 13)
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
+		else
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	}
 
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
-- 
2.34.1


