Return-Path: <linux-arm-msm+bounces-74629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22843B9AF56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A43D3BB937
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F002A3191DE;
	Wed, 24 Sep 2025 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AV8ih3+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321BA31771E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733290; cv=none; b=E2OkB60Sthme9/28wYruR64rbAMqNuKCmy2sfXI67OZHpJFIn9EP8bb7jsOpXLddA/U+X8j5djCYTurOJIRAybcO2qLZdZhIwn7UUSzGJKMnxWrLLitcSnHr9imUpah10Wh/JqR0vFOlhBev4NGjp+xss5c4xRQ9iZg+Sf8LBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733290; c=relaxed/simple;
	bh=/aCT6AMn+DEBAszM+FafwAQnaRRZOfmB16zLDUBpxGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INUtSIgRPmCiXGm9Mt95BCI8OdO5Ro7MlfvEB01yCuEuCJjECxzrODCB5IG+ZYAEaKCqptRiEFS4Zs+yIumjr+DTjCFomyUeShg9OOCO0w3dykwnry4Xy/PezovSV6wGYddh1kqu5g39pi/bKPm1dXshA8m/qKUjmPGFhmkrF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AV8ih3+5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODAmUJ021499
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=; b=AV8ih3+5L5ShgFEc
	jUQGbPgQa+3ZTHZZxtWe6quQixGcAFzPPFavPQMm3mlsCARdaDH67ZZqlYX/oMwL
	G5lnvzOyXrG68n1IB1RKWqkwY1yW+k8hv0eEzLRW0MdMbF5osbGmeqhbAAS6B03R
	vrD4+3VqRTbaKZE+cumWdYZ50GyAXTVay0QHazHCRzVFOrvPER8QEofSXiEO+cOe
	0yq1uaKmEXM3JZkwY+Ctv5PtGvDUDmz6L7o4oH4GwNZ1xWjQJceLKvMJA7WUIkmF
	MqNMt0RcFoungbnUt2IQwXOa3+c1ufWWWG/ZGD++TdNu9oaRVRdv7Zo7z1cmep5+
	X7Jjzw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budacpjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b521995d498so13088a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733286; x=1759338086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=;
        b=nlKMWdzuwUEx44f8K3Zbnh8nX632jZ13/VgLKcNb5EySKW0Wvj3NQbHiZVuFw2K6Ae
         LtwBWbXvYuENSOyN5M45hJ5u+Co9FOyq6rbw+9W3nZeNmuL+MLdmM4a1niBlsX3tGjmA
         lnOw+eloDlEdt+OfBzzYdd7+HnnLcowXPLLelzj1gxG+hrSeayGrQQKLNfCuIW1ClpTJ
         nW0FgxIHkNg+1WlLw74XxbDPcpUAtze5/H1WoxkBfD7BxJ0KiuhKckrGVLct8/H0AuG0
         JaF0/HygLDCo6D6n2GG3goW5xbm0VQYc5giAQfshZHnj+ucTNQcEhgYiRWW2R2oeXJot
         bXQg==
X-Gm-Message-State: AOJu0YwLGJhwNWN3goZz1q91PeHEhPzNRXm68lU2wp4ehJNCJlJiOkoD
	/oQyKr2xokZskJS9rghEHdjFsva8mnN8/raTSYqvGS6zm+d6SDuFHSmBZ98hXYVvtoEVVVlEakN
	3iCJxsGeV2vhQHTO5+/N+OstZt6EY019KVMWio/SsOg0CgBvEuzW/AWNOwdjZBa4SUv8j
X-Gm-Gg: ASbGncvL1aonk1vfLyb2rTSxJQ7caMQBy8V0ncXQxSNIUBSu0KpLpdYlt3SRfP1qnp/
	F5u1PShSfR+xGeNGLyCxeg18MWS4vjmbpxTk7iTykXSt6acScCNNPiK9xa8EOOxiuTMYjFEy8Fd
	IOAiEfTSmCOJVWJXr6EWxiwVs7aD+uEa25ZP0Cwm7/PAAbQy7c6M+RvKQ2diu7kzwSEkSpAx1le
	IDnSWCKdwYgqD3TfA9HmxzGUn8OzyiTkB2LeX2hEYL3S2rHpLlKIJEBMS8drU+T427upkFWgT54
	45zaJ5s++AEWAV1V5omfNejJcNVSe9BVf5AxcFDgI4V2fz1WD+WFMX5kZe3TJz1o4ckox77qTsW
	yxBPKVnsZ/GPIHWf0K884jYD3Yw==
X-Received: by 2002:a17:90a:e710:b0:32e:ae12:9d32 with SMTP id 98e67ed59e1d1-3342a22beffmr419188a91.11.1758733286214;
        Wed, 24 Sep 2025 10:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAPpvCtd2d4vHGdIUOkRx6YtnUHb9m7wAZMK8a3e7Ta2Wt0f3XAL5MqaTZbYyUtxqvTDCxvA==
X-Received: by 2002:a17:90a:e710:b0:32e:ae12:9d32 with SMTP id 98e67ed59e1d1-3342a22beffmr419079a91.11.1758733285177;
        Wed, 24 Sep 2025 10:01:25 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda09a0sm2931299a91.9.2025.09.24.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:01:24 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 22:31:04 +0530
Subject: [PATCH v2 3/3] pinctrl: qcom: spmi-gpio: add support for {LV_VIN2,
 MV_VIN3}_CLK subtypes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-glymur-pinctrl-driver-v2-3-11bef014a778@oss.qualcomm.com>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733268; l=1502;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=CiPyfA3fDFL/yWTIk0JCWKj4mCCnWYx7OMCyiFzL4yM=;
 b=yJgfH64tWhhT/hfvUAVVym082LRueDGJbwARlk+JMQ/+MvtcmVuU3ceW9zhTTlBdRjWihOkjk
 Zkg/C8RHR2sBI20u8IGUaN2S8Wlxpsmcl9tgbhTfgYtEl17X30J6CgV
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: 8QSNnSTIEJOpX2OWyBJQ50ASWw-aLmrt
X-Proofpoint-ORIG-GUID: 8QSNnSTIEJOpX2OWyBJQ50ASWw-aLmrt
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d423e7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_LkKalIgBaL7gH2Y5XQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXw00UtqQt3NLD
 kyLAu1cW5opd1tndLd3tFnMkPHN2bl3yA2x/Ib3BWJJ57Z5cGGGIYfXKE54wVz1s1ykcdjKzZSM
 +zvAblme5Xko8mIYXDZbmXOsNGanD/CYcf0AlMhd6coRVPodsYoCeRz4jF1oa9ZBAAoAJCpboX/
 yK90FWpC/8i0KWoY4X+zMqqFsi4hrdDpwuAHlrrNhEX3tLrED2VntjG8AJrUT07SW8E4SQ1JZrU
 tRG7NJ8pymcQlkaLCAV5eEpbJkI9k9roPi8Z246FQPhsLdu0PfN4s00ILhR24n/eMuaDMnpZmVh
 dlKbr61xTsqNYUBeLcMNSdJbPeY45nV0voP8Q8Wnm3zbCDdzKV84W3FRBwWI40E+ADaTI+c8XfQ
 8Nj94jWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>

Add support for SPMI PMIC GPIO subtypes GPIO_LV_VIN2_CLK and
GPIO_MV_VIN3_CLK.

Signed-off-by: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index c4f7d2d7a017684cd9c0d0850cb8d998668b543e..83f940fe30b26ae06373860616c54955c3b2253e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -42,6 +42,8 @@
 #define PMIC_GPIO_SUBTYPE_GPIO_MV		0x11
 #define PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2		0x12
 #define PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3		0x13
+#define PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2_CLK	0x14
+#define PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3_CLK	0x15
 
 #define PMIC_MPP_REG_RT_STS			0x10
 #define PMIC_MPP_REG_RT_STS_VAL_MASK		0x1
@@ -852,11 +854,13 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 		pad->lv_mv_type = true;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2:
+	case PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2_CLK:
 		pad->num_sources = 2;
 		pad->have_buffer = true;
 		pad->lv_mv_type = true;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3:
+	case PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3_CLK:
 		pad->num_sources = 3;
 		pad->have_buffer = true;
 		pad->lv_mv_type = true;

-- 
2.25.1


