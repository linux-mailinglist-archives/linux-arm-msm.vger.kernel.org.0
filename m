Return-Path: <linux-arm-msm+bounces-85028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11671CB57C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9A903002142
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D805A2FFF9B;
	Thu, 11 Dec 2025 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYw4TY0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7eUUkIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552272FF170
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448261; cv=none; b=VVf5zPFOv/EkwS215JMc2FrUBuo/jlRPPR/mH7Rz3OYJkI5PX9UYpUmdTCJkPyJe4+g2ZjVZNxgRF2lEBSzwFPze80delbMWeeNpuCpE+G0xGHPkDDRdqGbgvbv9pRCCQUaIHaIXjz6q81TMiz6WvwvochnBeE+B8NzFJka5POw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448261; c=relaxed/simple;
	bh=3+qYdEAvlOoBPmUdDBUu8x1Z3ZPwKgxBA6j/ziQo0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3nrCX7u06EMGgKrwZkLZe7Owe+Ec24QykpHW93oVvws+j5x1Ost4KnY11RBWU6KeTb/lBJb7mrBdm0PIn0TH+Xu/XRltsWBm5FvhxEgTPpO9gP4emEMrHx6q04l6uQBnwsHu/EyltoQ5r/fKnVEzqrS4EC8xV8vuwwid3Hx/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYw4TY0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7eUUkIr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZQHL1646849
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Kek/wxhWgT2Ns5tM8EW2AKp/4yPyuu9wZ1E3kn3Sak=; b=oYw4TY0Y2Fw7qSp3
	elmaW6ozxbNQkxi1TIJUiOw1gOuFme8jlPmUzf8rPKzljAerrfgTeGf1cIUNyIUc
	PLeSMrSQLkFeDGrWCraw99XXo18FNYGiDty8xphRPhROnVfeIJ6rixJdkSqE1R6W
	E8MmNo91vN1ykJQlneXUFryNekVgrXy+KQYnWxjNEFW66Aihot6s0btrQix7556v
	tdWCXVnxp9cCIHOaUzSf8L2i1CBTIz/LTkq8ImzsbX8pegroxASPdrqCjNmVkm+U
	tsqnqRfVmkvr2h550MGT1Jr5PlE24FCE0J7Fv3Oob6tUxa86Uoau5B8ppo0Q+nlo
	YkCsPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayt708e44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so23770851cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 02:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765448257; x=1766053057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Kek/wxhWgT2Ns5tM8EW2AKp/4yPyuu9wZ1E3kn3Sak=;
        b=V7eUUkIrQOiUbvS8P9otj5SKWHGmMT/B4QvV0KGyF1y30xecOujpGKIk8nK+blSQGr
         7TVqUjSXjgyLHdqgLhWNVx2Vj53eFdyCx6fTfWYyz2rmFQHBH8YeF04VDCWjIKnccPHF
         ihbcAr+ey28tFrabayXN3GpMVg14MFyWhM8bbqPzIaO1ZcoEEnJiDsYuE5dg8iuaALLs
         PxLyr+cqtcNVi03GH79smO4iQ34vTWZpJJ9LM42AVW/pPomnkhPn++0m6oIn+vPIf3pS
         kQiJGJvXMgqLeiXnSgQ3U9QzMhK7vToRieEuTirBstEGhdyV3ygIrWXAPkgc7jrWqaol
         Yqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765448257; x=1766053057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Kek/wxhWgT2Ns5tM8EW2AKp/4yPyuu9wZ1E3kn3Sak=;
        b=FEHjjjaTMEVwg5tsDFuy7QyUcvXMVP5LLJOL0hiQhuJ+dWmQjPtpdV75lDrVhtgI9E
         FWVczsY9/CW8+fIs1uNXV7dDpvsAl/rQgK3ScGdBZ3Q9vvBkdnYBl8g9zU9rvTpVr8E6
         LfyuzbGMt8u3aLEEZX7zZra8U0ISRB7Aq5PxbaMjxRwzdNzRlkP9lO9JfSjlqkpSOlBd
         4Zdq3gwESwsYxfNgEBM4MtFIKP7R4EudvGudmCl4kK5oBaFqCxgsmiS0B0npXdahwHnW
         VVwhWEjhsX+kcx8M7gf9pRAUO0Fp87cyP+7vG/wTlUzrBP8/iQIeu6N+v+ASczTiywiD
         onuw==
X-Forwarded-Encrypted: i=1; AJvYcCWehl9dX9XqmYUw66bYtMXAmWn0zSeGzkthCWPNYPqJulzUPT3o1Rb7wbTsBogclMrvVmC3hzV0noQaIHS9@vger.kernel.org
X-Gm-Message-State: AOJu0YwIarZBfKT7JZmE60IhEGzP1lrvWA4LoYmB+ePQcFC5Hnrrx4K+
	hrvv05eXFegHAoWPSiVbP7iFEAVJ5ECVuBPn/FEcmHQKDDTzxr3YSXwjdaQeewzuWOZk8qvOX2W
	u8ieBZAslAcSAeHQEKjtrt3qFuqA9PGi62kGNyzdBv/Cvlck0w50FxPXEEOGaCzMs7fYn
X-Gm-Gg: AY/fxX5Qfk8BXOYhGCJCnvFtjBkgRbkWEu7y6cnwl+S3c3Zxqz4OaZ++Iuj6lDHrab1
	v+GHnCd+JPvRyd/jOAGTkhng8zzEaX5CFqR9wYDV5yK82lwSLpF1+UUuBLOm+SiOV4U09ekFBy3
	wKAf2mtBi1tNPNf/dwgfZEUAy1O36M1PH52YnGn7GQO1TplHsl7H+Wj+ouGsVm369ea+Oj4kU1s
	Nftr5Z3AHITrheAgqA7NuyV+Ivz2EGLIzNW5oEFmeBRncV0gS6NDEaz/ZECVDUxILd3hGOOZWKi
	R0M/GjTapXRcGljvZdXdUGxu7/hpkqGDvWPMJW8TnitKwwAfkWDWu9IxDZJFSaauoTB1ZWJREEr
	C6eEis3KLm1YBDaQ=
X-Received: by 2002:a05:622a:4d48:b0:4ee:1b36:b5c2 with SMTP id d75a77b69052e-4f1b1b8cf36mr80526381cf.68.1765448257159;
        Thu, 11 Dec 2025 02:17:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQtveon1okQ329ExCBlmVJcHu6Xl1dha8Vjr9xGFwl9yLlNf8RoxdlDNNMk6bct2OLd0Pchg==
X-Received: by 2002:a05:622a:4d48:b0:4ee:1b36:b5c2 with SMTP id d75a77b69052e-4f1b1b8cf36mr80526031cf.68.1765448256648;
        Thu, 11 Dec 2025 02:17:36 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5191efsm225381766b.40.2025.12.11.02.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 02:17:36 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 12:17:24 +0200
Subject: [PATCH v6 3/4] phy: qcom-qmp: qserdes-com: Add v8 DP-specific
 qserdes register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-phy-qcom-edp-add-glymur-support-v6-3-5be5b32762b5@oss.qualcomm.com>
References: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
In-Reply-To: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3129;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UObXtePHY5dMQlAbJZdKc4jLD0I2BhVpyz2GDbDUvrM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpOpo3LFq4YY58+rairy/2KCqcSw8fcGBT4K9ka
 3KTe/r60bqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaTqaNwAKCRAbX0TJAJUV
 VnnCD/0eGcbJ3G4oVSmUseVCXZ/RpATCvWb+mCT9Rv644utbjLm/y3EIXBma+RCBC1wi1vb3JXI
 bMFZVIt6fhx0GorsPNpPC93ORC/fbSYGYsiwOeHZcrSZZC+sPFOXMIA6qJt7ZHbQrzvUJr9BZ3c
 5+Fcyje0EVPU/nwLVijrUXm7vDKZH7yGO6KBdqA7Qm4Oti1KWabzdvTaJT6nqFeM7rlQQS+wKEZ
 nVqNxECBs/5NYRNzcCOHKfxt+i9am+ao0UvXcjOVycOkRPHrqskbhunUDwfeM8gnbIU/pIQE74A
 fneUb12ggyDtUopua+fVhnk3d7fssI0zvTjPcuc61rSOOc4pOIIFv8HXHnYJMWzlLKd7ZDd5LIb
 VXhVb83pWTKsjZsN4T2WqyNDMwHEkbA7ikRQY27aBHvK6ISSocYyAgVVVnIJf+d/wFGh7mZvqPX
 qe126Henr0U9kvOWqNxllvCcJpr9DvD6VOFeQlVW6OmIr9JEjYSjiCX+QKRfyjQfqgKgboW52iI
 N/vE19dkpCB2xUQHZN//XyfKNzerwTfcnUvWI0WbAsxGWBXX165GV+Q+mn0ED+qJWCs4VCszKrF
 6mvmyjUnis8ch/JnV4QzCrMAOcAY7Pe2eYy7/fdGUVGwoT6svXgPu7hpOBq57C3Ft8PnXwTuNjd
 eZ91uriuufnLSSw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3OCBTYWx0ZWRfX2fD9fqFXat4f
 wveVlWYfnhJzJZ+1WFz8D3ir9y6tnlypUDSLn9wDK1/nFCU1SeeMFWYiPT3uOzcHdkyp1Pcd4Gx
 FBUqF/PvRUYGFpJ5Zv0akTunxG2DQk7E1maPyC881rJhL+2GU+HZ+nmdNXlJpcAiIFSbHXIrIop
 J9Vbq7S8RZrXK8L13Tk7ky0g9q/ompHmOs5rSDtYcTTR5QZY+krD3M+BrlCT+OApoq8TKwUzrA2
 77IVPtkO9aFSlD2xaTvnt5VONHoUJfn0oSM5gmoZF4Ndn3IBpDFO2OCl5lMvl9PauONx0EIhUaX
 okV3+CyitVOxxolKOP3+RLtB8lLO8bWharg2pMuepwcUrgbhnddh8+nVsEPBBHYYQu0UEy7t+8M
 KlMIlkKrdwNw1j2hPTlZObOriHDmTQ==
X-Authority-Analysis: v=2.4 cv=WYIBqkhX c=1 sm=1 tr=0 ts=693a9a41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ibtu9XGAwxROLk4EXI8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Jkwtft_g77ikq9fs5VmXxxoceLs9Dz6s
X-Proofpoint-ORIG-GUID: Jkwtft_g77ikq9fs5VmXxxoceLs9Dz6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110078

From: Abel Vesa <abel.vesa@linaro.org>

Starting with Glymur, the PCIe and DP PHYs qserdes register offsets differ
for the same version number. So in order to be able to differentiate
between them, add these ones with DP prefix.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h  | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
new file mode 100644
index 000000000000..93edabb830af
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_DP_COM_V8_H_
+#define QCOM_PHY_QMP_QSERDES_DP_COM_V8_H_
+
+/* Only for DP QMP V8 PHY - QSERDES COM registers */
+#define DP_QSERDES_V8_COM_HSCLK_SEL_1			0x03c
+#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
+#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
+#define DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0		0x060
+#define DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0		0x064
+#define DP_QSERDES_V8_COM_CP_CTRL_MODE0			0x070
+#define DP_QSERDES_V8_COM_PLL_RCTRL_MODE0		0x074
+#define DP_QSERDES_V8_COM_PLL_CCTRL_MODE0		0x078
+#define DP_QSERDES_V8_COM_CORECLK_DIV_MODE0		0x07c
+#define DP_QSERDES_V8_COM_LOCK_CMP1_MODE0		0x080
+#define DP_QSERDES_V8_COM_LOCK_CMP2_MODE0		0x084
+#define DP_QSERDES_V8_COM_DEC_START_MODE0		0x088
+#define DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
+#define DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
+#define DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
+#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
+#define DP_QSERDES_V8_COM_VCO_TUNE1_MODE0		0x0a8
+#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
+#define DP_QSERDES_V8_COM_VCO_TUNE2_MODE0		0x0ac
+#define DP_QSERDES_V8_COM_BG_TIMER			0x0bc
+#define DP_QSERDES_V8_COM_SSC_EN_CENTER			0x0c0
+#define DP_QSERDES_V8_COM_SSC_ADJ_PER1			0x0c4
+#define DP_QSERDES_V8_COM_SSC_PER1			0x0cc
+#define DP_QSERDES_V8_COM_SSC_PER2			0x0d0
+#define DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define DP_QSERDES_V8_COM_CLK_ENABLE1			0x0e0
+#define DP_QSERDES_V8_COM_SYS_CLK_CTRL			0x0e4
+#define DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
+#define DP_QSERDES_V8_COM_PLL_IVCO			0x0f4
+#define DP_QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
+#define DP_QSERDES_V8_COM_RESETSM_CNTRL			0x118
+#define DP_QSERDES_V8_COM_LOCK_CMP_EN			0x120
+#define DP_QSERDES_V8_COM_VCO_TUNE_CTRL			0x13c
+#define DP_QSERDES_V8_COM_VCO_TUNE_MAP			0x140
+#define DP_QSERDES_V8_COM_CLK_SELECT			0x164
+#define DP_QSERDES_V8_COM_CORE_CLK_EN			0x170
+#define DP_QSERDES_V8_COM_CMN_CONFIG_1			0x174
+#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL		0x180
+#define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
+#define DP_QSERDES_V8_COM_CMN_STATUS			0x314
+#define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
+
+#endif

-- 
2.48.1


