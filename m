Return-Path: <linux-arm-msm+bounces-86567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807FCDC16D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9DB73080B68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E2B32720C;
	Wed, 24 Dec 2025 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7WrapVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhXrC2vy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723332825B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574670; cv=none; b=HWeSqouBWp2nowefcsFhgPyu1nB73Rak7WGZRP3ynbCyDNf0y2AnvoljIXzdkzKbvFKo//xqw2xp9asIn3jF+QZpm/vn0XALxMuz/EMDl6mmG7Urm3wc3l9sC101h64mG+4Z5W/7SRUyoT/bxSYk4wPmEZFHPDPG2T6Ar52LJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574670; c=relaxed/simple;
	bh=3+qYdEAvlOoBPmUdDBUu8x1Z3ZPwKgxBA6j/ziQo0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgvFy1/Cv8cNr35HmJtBvfRgyWyqSQ853ij+FGao5Mj4Jjgn0RUINBGocC/+Tfd8I3+p5G0Xe0leviFkQRm+jo3pH47TWy/IpGjzpUBtTzDjKfI83uK/yn8JV3Y0udx+2VYcLZKb4vN96IEdl5cDxrY3Ay9gHkMNc5lG0E6kOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7WrapVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhXrC2vy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7kiNB1056400
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Kek/wxhWgT2Ns5tM8EW2AKp/4yPyuu9wZ1E3kn3Sak=; b=E7WrapVbftDCcoke
	bubir38oIx1yroTQzjpMIXNbl4JuvaipW7dL/6XYOp+VdLVuAFl7owc8BlfWhxay
	AYqq8/JjMTeho0ticDsqjVtlYnRAjqOWImxpH5Ng+42uVgBSYm0rLDa0k+ToeIkW
	FR7Q32KOwJogWBOAEyMLnr9AG3E+eiS6bcsK42DJbkUDxiPFtBntz7QDDyrjS0zm
	hD4114z+oIF0nbCypKudCXUSg3cgJJA1JThI0Iqh0L9XE4ntFU70EA0fbY+EogqG
	dEvK3J9CFmHE3QbiEJ02apg0ikwNkQFz4T3rWycLVEtqMKCx++9AdoXJWrvW3R19
	V5Aqcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v28sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee04f4c632so108038941cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574666; x=1767179466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Kek/wxhWgT2Ns5tM8EW2AKp/4yPyuu9wZ1E3kn3Sak=;
        b=BhXrC2vydRsHHjPwZbdjeFh/ej9MN+/ALlVbWZGQ+eWXTYqoG19EKa4L7Ery8fdJi6
         qCBuy+II0AZ8Bd/m6yL24rgtaRCNB0kEOLMDOd8QBYLhb+lb32bYVAKza1CycOl2cOPo
         0RLr4qY6MgHgWYGasXaCCu1rni+ZTB4D1s/iCARIiQkTVcBwxsoh8zIalflBGleVbMJC
         sUK0OmxzIKkihqSTINjpzXyrWUYDvEqdfu8cQRNxXQyTm/zc1tckm3f7lFim4gyYsBOE
         2VMm1zi3X3IqXJlGisXd0uPL03UoaH6pjFYXPBS+NtcTp17/60knhsIWatAWnWJKFGUU
         Y4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574666; x=1767179466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Kek/wxhWgT2Ns5tM8EW2AKp/4yPyuu9wZ1E3kn3Sak=;
        b=RpytPVvooLiNwY4VrSaF2RTmr9MHyPSBpzdSJXQjADxO9Y4CwnbGXwEyyqWA9k1wlg
         90qk5gMmXnxuM8Kz99P5lvRNxie8+Bj2i6w//PPU+8vMMlSHcxWZ2T4LRV94DsJFFaJN
         eoEcC3WMi75YES8r2PyJtZhreTmDKICzvBr+HiuUSrrSRPUwaHtt/BMVuY6TlSR8q+vA
         3XTi0tEYBaNEIXQlzRK3Ti2q6/5hrDoeO/oyYU8Dx9qHG8TB/R2UKVns30Vugt7EDsY2
         9NBoOvzEf/AEqrTQvypqExP3PCRZ0Q9TnGSPifrvr+DtiPId508vB52EYrQM5oNIL8db
         qglw==
X-Forwarded-Encrypted: i=1; AJvYcCXC1WfLuHHC5IIM5m5XLvPVp4nb0Xl9iVfCtCtacnTtoNZkHmhtE5rYyuOZL+V0c9n2Np40CXZXglar9LaG@vger.kernel.org
X-Gm-Message-State: AOJu0YyzttGIoUdGdxt1rNIR3sQxzV5WbU6qxBPsUcErTXMHQ7L/wZ2/
	cx/8mU3Q3SNCbKovYP4d+CghVeqJYnrwPW2zNgcdLVVUEWstM4KiNpMzDJJGZ98OcLvSKVocHXt
	oUtApfReMmQlsrSz0wPyr/aT/eVIlu6somuOLzZ1rUbXts9kn1ES6swqGh3CCua2Yxe+o
X-Gm-Gg: AY/fxX492uQm5+CeotZr1jqK08QEpsNrNp1+k5+LfClaAuOHFp4Kij13TknERdX7GkO
	Pdomrt0ubo+sr6xakI960Nzkz4AXV9md98tKa7hCwcwmFfpFEEdVQpRVvo1gxvBLE6yc1D8pzbP
	vD/veIqd08dvLQmw3u4ROoY6qhDmmmvGxWre3uPBdfBAnkivmtaa/mHo9Df5OzACAHtRU6KtfRg
	DSFXXwLrlwLocK6lK/aY3qzWEfaLSRMIRgR8WdGJL5eYEqjtKj/sHHnw+T8sqJMxaTRcEI5BRJl
	b8rhfZQUKS9o379jthDIXDbbvnROJaE8P3V43I73X6U3CHqgcGCwADjbS3gwXZB1cBO0V9A6ONf
	FMLA+QYMkhhD1rKw=
X-Received: by 2002:a05:622a:4183:b0:4f1:b3cc:2cec with SMTP id d75a77b69052e-4f4abd756e7mr251100901cf.52.1766574666316;
        Wed, 24 Dec 2025 03:11:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXYyrzS66xT53pQffVCPdIOYTk84+cgfuzkec+9VpeMI3P12dEKRhhrCY6x/FVJV7JEkINTA==
X-Received: by 2002:a05:622a:4183:b0:4f1:b3cc:2cec with SMTP id d75a77b69052e-4f4abd756e7mr251100491cf.52.1766574665558;
        Wed, 24 Dec 2025 03:11:05 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm16799036a12.31.2025.12.24.03.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:11:05 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:10:46 +0200
Subject: [PATCH RESEND v6 3/4] phy: qcom-qmp: qserdes-com: Add v8
 DP-specific qserdes register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-edp-add-glymur-support-v6-3-4fcba75a6fa9@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3129;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UObXtePHY5dMQlAbJZdKc4jLD0I2BhVpyz2GDbDUvrM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8o+25u3l0bspOoO+djwjkUykCXsuycNSmTCA
 ZtiYmvN/IaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvKPgAKCRAbX0TJAJUV
 VmEgD/9VDBM+YyOX9zQZwPJ9bMXNi8REpQh55pD/bgaMV09N+J0SbJRd+Wvpobqn6LsSb1+QGIK
 XSt4mLJTw6ACCxF0IlGtC9S9nqcMhkoPiV477z04U2QkYcxWZmVZna69pkRiAdnYdNLvvFSzO2G
 FN66l/eRHaa6lmfqX3RMVi0udun4do6BXctPSXMkJNIBo5/Zh4KciWiX2hpTLZg8S1TPTEJTH5m
 07spch9uM9hSzVD2X3LgrQd2f4kLJhNEudFVC98eRXI59lyuzB2gxu16ht6SYJLpq7qbLoW5e7z
 t/M8V7l6hj+25usw9V4PibR7In9AkEmBGQbFMXlbVOWs9S38P1tonrGrJXTXMwxVHs15l6MQolV
 G0/xteBjD23dED04wyS2g6wAsCySnJEmn58TYiDBqQKTCp9cFuSOcmJ+hfSyWAM8/ZikeroLA1h
 AYrHTas4DhWZaGVx/0ZM9SkL1o/In86u3S2ycDSB8q+OcW2odDGHE9hY8OmenGhXIKTutObSS1A
 hMF6jjAB4R20tAwHXXG/BqluIIj/6kC9O5G2A1ZbNWIpHWDgsXLBoccyHTwuqT1vsreDhE4e53M
 m4/xMRwzomBt0uKCXf5LI3bk7pZ1A8QclF9rNhPUmy7VYQJWowD7Wzfb9qypYP1a6xJI04PMmHp
 +Ke8/RIXxCYAu2w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NyBTYWx0ZWRfX5x517r4IjRS5
 0nVpQhBINi0X2g7j/u9w5qH0rMBPleOCTBVxq17nAykoCdGNiPpBVphICbjtpauGntheXKWOMso
 dYGzudPv12hTN8FWstER6+XzDmQwI5SWvpRWn/wUq322qyAmNNnluBk9YSDxehDG1XJ2Rc03eiP
 doPCC5vr0nBi83O+GAbumfER/TuiMFn7Bp+EN9LFjzOkGWatNK6kNJq6C6TexVbeGgfcUpNZALM
 9BwNPw7XiRulcODSzbwiUEo+/i2VtLNIA7ebjwqV8GSpc8pw0usLsPWlZka6TTqJepKRFA4dttX
 xA/vIzLYEBmHfQ8YrVwyRuSE+g9388z2ztADWGM7BWY0z79cXBU00mEAtLXsQXOh5LGd2VEycnb
 opeQSpRLMiHDbmJjnInCsS6eBYHWentko5BEBAI0gpVUR+CPyjNzcKxTAztA9x7lKtcqolgCFLw
 EHv9sk5sIRrZRuTB1Eg==
X-Proofpoint-ORIG-GUID: 8biQxRO7aKioDrxNXpMr19BBckKbmHS6
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bca4b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ibtu9XGAwxROLk4EXI8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8biQxRO7aKioDrxNXpMr19BBckKbmHS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240097

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


