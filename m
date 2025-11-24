Return-Path: <linux-arm-msm+bounces-83034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C931C7FDF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28C5E4E4D2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79002FB09B;
	Mon, 24 Nov 2025 10:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6yqkHI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ2qT8mO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C722F6187
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979964; cv=none; b=EUJ1P1hETMWlrNaBLBtlJF/j4R8kB9HY2LSz73a3LlFoNwQ+rG0ZQ2TFRyzA9A88aDh+Qocn8xJkBo/6YNc2lLM4uCKwQvKvv758aUT3YP3FnTCyZZRs9afkxj+GTzpUvsc+mxO/Y5qmcmQX28I/i7J/OeaCjQTQWm8beNEmgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979964; c=relaxed/simple;
	bh=MUl7sxpCGM2mRJNbw6AcjpDD+FtJcW1uPf/khbJ96fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/QyUG0Xbl+HyUlDSvZ68wu/P0gyU+8SfE46hcg3scbKwUh8rEqMVHsuTWvoEb+oRM00WF1OD+3GpcTwI9eSpbzr1t97pKHxoDYfQLWuE2WJcluyPkGLGx2PVDfsN1IPUTlTgQhMYYSSxTvUVNpxa07eJtEpGiRMJszlj3lHx5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6yqkHI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ2qT8mO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8UiA82577473
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a0cP7KG5XGPzFEgyuSubAATVYJZRm7RU2yMGXybKWxk=; b=Z6yqkHI/9IoxN/b+
	v4tNpuxVBresVw0pzM8gjJG74w1xf8km7Esl4gwrJe86A7sVpAaQi/imNvQ2u9U3
	N3Gj7BomdTnIo++zeoaW/uNfPa6NhIvSLKTvtKdjQen8c89BwRnKWdd4kFO28aRD
	Yu3cBjbx0Rc6mvZGKn1DzJrevOGJbTc911y274AjNMFirSzCjlbImsdecJSGvygr
	b0KwCFsQeCF3NFqQQfni1V/BOMx/2ZQ4RwM32HEvegpt1LHvmZC4S6varcqdqFEG
	kZ70tLSpSgv1AnZruscPLL/jgu31h9f0FLDMTxGLPXIWFm4pbuyNVtSlh4R1hK8x
	zyKThw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69evk9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:26:01 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b21dfe94dso5110871c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763979960; x=1764584760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0cP7KG5XGPzFEgyuSubAATVYJZRm7RU2yMGXybKWxk=;
        b=jQ2qT8mObdSH5QMaSin8D+oiCeR9HOpZaRuBFa09j4gI+g/d6tINtwW9pH/1O8Sf8n
         QzUaEh80spPNGLndsGEzaFXmItOnynmy/ilO9gm13NcscPOfOeInkAFT+Ig6+SpTM8Qy
         ef1kRxYoBEvA4h44xklEiSh4RZFaaW/9bX7/LRwOArdeeZUxRyr6BoyZe0nRTUu3HrOr
         E/fqZxGGmJpMv4QOUOjZnvxvdR+TuwZE6atT/of6//X4io22YLaYQdyfgRpwOpuQbt8l
         9W4FaSA2l25/tKo3rOsdYmDAQ8077OkqY2/Gw/HIAFoagvCC4anFt31H1Jwd0dC3d89m
         S6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979960; x=1764584760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a0cP7KG5XGPzFEgyuSubAATVYJZRm7RU2yMGXybKWxk=;
        b=a7BOBexaO+/sohQjOxahrANTRrSvDFLuFvOoauPJSavwPpf196sXtsHruMFNSdkCxC
         JR2FebFOUBA/zgFhhLInrILq72bJZcDiNFzmaVzv9zk4Yl7IZZtsu9i5Q/swnO/77N27
         27h4o6Zd8tay34oQpjX75fyAKW8NoOHNZnSSZ9DJJ//WitPHTJB1expZ+3Tw4CFme5EN
         /S8ba1Lo53TyIzHbJb+R4qhSfPTPDvJ3WsqCutnqafNOEV0QVWrhyCDwDPNGxs5+FOAM
         d08TOkvSGK8kIquGnmKXXtBYK3LddH2vZljYDACljWud4z2g+T3cABlqhjyt4MOYA+wT
         UvXA==
X-Gm-Message-State: AOJu0YxlaGeVqd4vyunGNPp/ONrWRt4kXwz4U5gVwq52by5sb6t/PtVj
	fEmT/0+s+VHHXyGfpAGZy+MdOmt+Zj9c1GXjERtOEbzJn7fwVNWStRtYTu+jTvg+mbFEewtzOqH
	ZVIIgaI3+CgUiW1XzUXnvOevFfC6RIatcA1MburXn+m5VgSBCoRL5Vk5iDowGWS95Cj2Z
X-Gm-Gg: ASbGncsJNkQMwxGD8Fiv0EBSvErSElcfgQdi3u6ZiW9gp5T2vki5XaGhKpTVWCn4iNM
	Njn20TsjmJxNA5i+Do2ZlVvZgoibjhd4z4YGZuVopuY/NFtoMeZh2lYNhuFQI65k7U676BSr/XP
	KxzoalBha+uhljeAIu08IEfF0svNnuL4kvLtcDwR0mwPQ2A4kz2Y39aqQszymbX1zf1YNoOxKWt
	FfZg7nOw0V11w1PMEHtrEVRkROrJdlIA0fhDTrObKFN7b93zAcPZ52fQJa4tGBeNo6yD6KtpdFa
	XiJDEeF5giRz8OkmR9aT+bNuosC3nOMxyr72fE1JIssiIdXxVcIGPNHM13V6AU2CIThCkNzGQjX
	E7m5pI6LP6AiNtbPzdXrd1qwUTK7ADkiVrEgdAPhcqag3bTyunKNkARoC
X-Received: by 2002:a05:7022:ef04:b0:119:e569:f84d with SMTP id a92af1059eb24-11c94aefc95mr8190740c88.4.1763979960358;
        Mon, 24 Nov 2025 02:26:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdhovbLIbzLaouS4rYw87KKgwH6OW705IGi/jjsPtVjtD4CqTIs6zBsXMI90iVURkVxEyrkA==
X-Received: by 2002:a05:7022:ef04:b0:119:e569:f84d with SMTP id a92af1059eb24-11c94aefc95mr8190718c88.4.1763979959814;
        Mon, 24 Nov 2025 02:25:59 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm46140627c88.4.2025.11.24.02.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:25:59 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 02:24:37 -0800
Subject: [PATCH v4 4/5] phy: qcom-qmp: qserdes-com: Add some more v8
 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-kaanapali-pcie-phy-v4-4-d04ee9cca83b@oss.qualcomm.com>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
In-Reply-To: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763979955; l=2730;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=MUl7sxpCGM2mRJNbw6AcjpDD+FtJcW1uPf/khbJ96fI=;
 b=BkYKecPVH89PY7Ryzk+OiDHWrcgLtU1eUfK8x1zcYwXK036i8z2qWhPH2AhWXVfizUDCym0vw
 gDmpyCuccy6AV1S9rvVXv7YMoV2V65njpzXuV38FkpbnIFF0Yk1asL7
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MiBTYWx0ZWRfX5nAoki7p6nb3
 XSpaLdgoiiMMOACzFRZ7P6+NkVr9P2g4xwfT8hL/mTvfRtmTdRWKmYfXKubTyeo2gZaj3SlHyY/
 kEtL5J/2GVKm7L0NX0bny/BSAqyKKFbcEdVwd1AmrjY4PRdggcWrlBSS6Vcss9hG0BF9zLUrnm2
 b7Mx2/KL5hkKkCa0fzDecGFo3LfWMHZvjFELWR1lYvPpq8JC9d8ijJg14k9QeSGZ8a06CQ6MLkU
 +L817AF/r+xffBz9+aOqHpNH5OwpyVFuPf83+oLHirF+3k4PTR1lpyoRwA1ET22BFzWgYm8DS1b
 7Yr2AGDAPkVASsG+pAWNiojIkaf2KuihfnWyx6yiKqtwvyB6DnA6uj43OWPEoEZE+VvQcJSI1gv
 FoIX6cpqG+iq89nZ5tJ/aXhkpbyMcQ==
X-Authority-Analysis: v=2.4 cv=cMjtc1eN c=1 sm=1 tr=0 ts=692432b9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=cXB1dxBGfnZZ65A63A0A:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _DFxf9uM6VreFac3tdwV8Al1wcRJeE6s
X-Proofpoint-GUID: _DFxf9uM6VreFac3tdwV8Al1wcRJeE6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240092

Some qserdes-com register offsets for the v8 PHY were previously omitted,
as they were not needed by earlier v8 PHY initialization sequences. Add
these missing v8 register offsets now required to support PCIe QMP PHY on
Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
index d3b2292257bc521cb66562a5b6bfae8dc8c92cc1..d8ac4c4a2c31615fa7edff2cd4aca86f4f77de66 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
@@ -33,6 +33,7 @@
 #define QSERDES_V8_COM_CP_CTRL_MODE0			0x070
 #define QSERDES_V8_COM_PLL_RCTRL_MODE0			0x074
 #define QSERDES_V8_COM_PLL_CCTRL_MODE0			0x078
+#define QSERDES_V8_COM_CORECLK_DIV_MODE0			0x07c
 #define QSERDES_V8_COM_LOCK_CMP1_MODE0			0x080
 #define QSERDES_V8_COM_LOCK_CMP2_MODE0			0x084
 #define QSERDES_V8_COM_DEC_START_MODE0			0x088
@@ -40,6 +41,7 @@
 #define QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
 #define QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
 #define QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
+#define QSERDES_V8_COM_HSCLK_HS_SWITCH_SEL_1		0x09c
 #define QSERDES_V8_COM_VCO_TUNE1_MODE0			0x0a8
 #define QSERDES_V8_COM_VCO_TUNE2_MODE0			0x0ac
 #define QSERDES_V8_COM_BG_TIMER				0x0bc
@@ -47,13 +49,22 @@
 #define QSERDES_V8_COM_SSC_PER1				0x0cc
 #define QSERDES_V8_COM_SSC_PER2				0x0d0
 #define QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define QSERDES_V8_COM_CLK_ENABLE1		0x0e0
+#define QSERDES_V8_COM_SYS_CLK_CTRL		0x0e4
+#define QSERDES_V8_COM_PLL_IVCO		0x0f4
 #define QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
 #define QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
 #define QSERDES_V8_COM_RESETSM_CNTRL			0x118
+#define QSERDES_V8_COM_LOCK_CMP_EN			0x120
 #define QSERDES_V8_COM_LOCK_CMP_CFG			0x124
 #define QSERDES_V8_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V8_COM_CLK_SELECT			0x164
 #define QSERDES_V8_COM_CORE_CLK_EN			0x170
 #define QSERDES_V8_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V8_COM_CMN_MISC_1			0x184
+#define QSERDES_V8_COM_CMN_MODE			0x188
+#define QSERDES_V8_COM_VCO_DC_LEVEL_CTRL			0x198
+#define QSERDES_V8_COM_PLL_SPARE_FOR_ECO			0x2b4
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_1		0x1a4
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_2		0x1a8
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_3		0x1ac

-- 
2.34.1


