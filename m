Return-Path: <linux-arm-msm+bounces-58798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7429ABE506
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84FAD4A83DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4F21AAA1E;
	Tue, 20 May 2025 20:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3dJNNAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1C21C161
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773904; cv=none; b=iX1N6vh+xT/nun359MV6Oo4Vhky5QhiKiw6NtBN1Sw7ISef0BLFE4db9Ytfhq1xr/Vond+7SMsJvljREmYh5thDJ+0WLk8REIe4kCvhLN45Ydx2lbFKkWYMARQ3JXiW0vAaR3mk8NMYTS6WY+GQXagdrMbYpTIivjSjXjy3udXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773904; c=relaxed/simple;
	bh=Q3oxit2uXVirUmlDpxNZ/SA2JUKyyiPgFNu/v/Mfmpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZNXEDxF4xjxLsrdASQIc6Pqbl1Mwc0cpURc2ZfkNzndP7dLoGIBygFuyyH0z/vBqtvSUU46ZmHw87welR7ornJ3c6baL+oXJT9wVaEbWP55tvfG+9mPyJt+/kGoPL1B9ZlZMnoe0qZNLArL4oRiQnMFyYsgO5KrFjcPCft39e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3dJNNAR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdjKQ024573
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Sf2sU8QXkUGxm3P0AkiZVGagcMsU33MoJLUJ+ohpOA=; b=C3dJNNARlXSOF45i
	H5f1Pc01AsAAyW9FnJBGQaa+Up3p+aBetbxEkgSKJDGrsyURtLg/4gB4qkSGoByC
	4dMaZWPNNMWc2mOw3sRPfbgiBIqJW4tehq2WT0U4crMb73sllQSp1jKJTCFEh/hD
	SgL2uvb+TpLv0SEBirrFnW7F2Lp1lVDm7sXThNAP20lRw3T3+cuSON9bAYceGGRn
	Gi4AZ4GWrSxUiWT/1hX3a3o7MFpr+wxPV6zBBOOQvEUyARhJN59gTcDU6rMwFlHm
	pmExE9Mh/h/LdJGyuMwlJ7K9hj5ZDs3vp6G0uH5ZGnf+0E2lx6RZX/1vnd/X2tkf
	8bFqYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf30k33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:45:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so31639396d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773900; x=1748378700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Sf2sU8QXkUGxm3P0AkiZVGagcMsU33MoJLUJ+ohpOA=;
        b=gmpcXf4ynxzwYHVauXC3Hbak/HMIRbt2jfsQ89TP++rhD2+ODxtOYRadvFGWWckxUN
         2TD6/3xaEj3/2wPVBO+EvttDlN/KtSiglDEqLmDK+5boFNSe9eXrtUBLkRg4zkVVXKzE
         4Is/dMUfkgO0heaX6IVZKwOv1h1GdM2WzWUWe/md1x7wuD8vKyY0zOq5422CYQiAJwzc
         jTJJX3rQUPemmGOMXee75fw0HXhqaCcak3XE4QNO8JJrl72fZza/035DD37HgkBPjWtC
         H2of6nYuhS48eUH1yJWXczYGndZIoopxbDe+RoX1D889rGC07TqMYZAIiTsYjCaG6tmE
         XmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTDXrKXe7oFq4orBCi++wBBOxXOOdmqp7xYkat4ACQZU/zXsuCVeZ0qVMxLLInrpQrp7Zu0M9rv5jOmbuo@vger.kernel.org
X-Gm-Message-State: AOJu0YylmQA/hLfRyarR0+39WWYRNUAV2j7OwjPqhznxotT0S8AF4qbs
	qTP3WJkpeXNMK2gibeK9LshbfbkFH0wPwZWs1pRvBSr+7Wggfy3Boh+CdeH5mIklVzuxqPqvpzW
	JlN8cZ+3KEOIANZ6JqikesauyAUpIJeIefSq7MMkzo9+bFR018ZQJRqpvCEL1OSs9MIBK
X-Gm-Gg: ASbGncuHEIkqJcjvxqGpZKNaTxedz9Wnb3FvdRMitF20c2nea4kARBdy0MxweeNd49h
	kGAumBBEPi8/FHsFM3lLdXRMLXAftmefbX5Jj4BMyHv7K9UuU4Xmo42kQofHGNpuoXN3DIenKGm
	KY4GEg7KOhQHr9vveRuvTwFnR3RAi8JsJ9aiJJEaMcR8MK0qlBpoMv3dDcpVEdsTXAf3bv+zlu/
	SRzCZQtO8JiqgJYahFa8t6NKxbQr0r9ubcamngIbVjMj4b6JOB4JSLBds4oNvF0S5vX50YvPiwW
	VGdh8HL37rSRqm6LlFjOMSYnJo6SwUZLii3lvRaTcwvmzt56hW7l+pp0cxJ5ssIKu4cvMeRnwrO
	hLOCWa13h9KGG86Yp0T3/jiD2
X-Received: by 2002:a05:6214:c44:b0:6f4:cbcf:5d46 with SMTP id 6a1803df08f44-6f8b08abafamr270835906d6.20.1747773900282;
        Tue, 20 May 2025 13:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkl3tYdKo+pWUTiMv0OZy1z1/H2i6Pu6K1fr3RwR2mOhW5QPjQAgjsg8qK75X0E913s7m2+A==
X-Received: by 2002:a05:6214:c44:b0:6f4:cbcf:5d46 with SMTP id 6a1803df08f44-6f8b08abafamr270835476d6.20.1747773899749;
        Tue, 20 May 2025 13:44:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:44:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 23:44:46 +0300
Subject: [PATCH v4 4/5] phy: qualcomm: add MSM8974 HDMI PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fd-hdmi-phy-v4-4-fcbaa652ad75@oss.qualcomm.com>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
In-Reply-To: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9501;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OLeHIuWSpgzTAy71HK+ckC1M4XfY8GW2xAOao+NEl5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnADZDprVDGwWXUwTqicXYzKiBiMS6cMbgwJ
 0tObEbYNeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1VvnCACIHW4tm/rezTFxV5k0KC6tY8sIjJ7QP1EMNHSIUVA+jtHmBlgKw3r9wH5v5e02UVI+/ai
 SqiBYVgiFNbA3ntKgZAaT9VH8zB0mXG/VGhzGyLn6zjSQkxtggwlj7Z5VRV6XrTOCGUZXDri1vX
 wIkOC9Mq4QWADyueq0S0PN6i0DiaEDO5276irvv9z92cm4c5rEf/meJU1nZF1N2IMMdBjpCMsup
 jJ8299G1xEom+XFhhCQHYTxPTE+dW5E7v6sY8oJ8QAgBu20vR+O6OSLR1EI4IUAEbVm9szcGwyt
 dI+B3+gyYpCcbwhEuinCGbARHJCh0Qjdls1o08l1Rh0GJXPT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: U2A4GyoB2ZFrdskPo_o6dK9EqNIyiiY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfXyVQvQZ7xk5cu
 B6c3YNyPrWSMqNCPbVfnRxnNXKqkWMXjNSoQbUH2GTyqEaWN8gDlSCBGM+JIkH0R2ZH9nuJZvk2
 RdTAJ+7uO74WeoqW1fa90JC8YzMSsb2gfu/V6i0XQmBUmhFtKIKhRT46GQeHY04WL8/vKYPTC4a
 xc+w28AIIfeynhelPhmYNj6nVxEVKqbqgovEO4nVad+Gqx0UKrpSfoQ3UOz3Kt16UhegR6YRzer
 jIKOR/di9+yg0HBqMsDMcBDRJLChHFHKpEGUMKnWeDk4yUVM5r7j350DiO+FcftRuv/iQw10P7f
 rL8/Sq7vXtTVNQpCN7Me59kWpOPfICE0BUyE8mBqZhkSa6q+bJ/6gpHvOvTFeW+xvSmW1XGsGoX
 xeNTqOdTV8k/QPnUwtuTP8FXdT2QNvXN1WcHJ3cQ93c1furIfvkjtlcrsVgrA1t474FoGOAM
X-Proofpoint-GUID: U2A4GyoB2ZFrdskPo_o6dK9EqNIyiiY2
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682ce9cd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wq9x00DRF7jIeu_RijoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=838 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200168

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c | 259 +++++++++++++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
index db7fa2df1a369d3889daab922c21ed8b71d733be..059afe5504639e65ef4e0c5f09eee9615f1413c1 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
@@ -10,6 +10,7 @@
 #include <linux/iopoll.h>
 
 #include "phy-qcom-hdmi-preqmp.h"
+#include "phy-qcom-uniphy.h"
 
 #define REG_HDMI_8x74_ANA_CFG0					0x00000000
 #define REG_HDMI_8x74_ANA_CFG1					0x00000004
@@ -31,8 +32,261 @@
 #define REG_HDMI_8x74_BIST_PATN3				0x00000048
 #define REG_HDMI_8x74_STATUS					0x0000005c
 
+#define HDMI_8974_VCO_MAX_FREQ 1800000000UL
+#define HDMI_8974_VCO_MIN_FREQ  600000000UL
+
+#define HDMI_8974_COMMON_DIV 5
+
+static void qcom_uniphy_setup(void __iomem *base, unsigned int ref_freq,
+			      bool sdm_mode,
+			      bool ref_freq_mult_2,
+			      bool dither,
+			      unsigned int refclk_div,
+			      unsigned int vco_freq)
+{
+	unsigned int int_ref_freq = ref_freq * (ref_freq_mult_2 ? 2 : 1);
+	unsigned int div_in_freq = vco_freq / refclk_div;
+	unsigned int dc_offset = div_in_freq / int_ref_freq - 1;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	unsigned int remain = div_in_freq - (dc_offset + 1) * int_ref_freq;
+
+	sdm_freq_seed = mult_frac(remain, 0x10000, int_ref_freq);
+
+	val = (ref_freq_mult_2 ? BIT(0) : 0) |
+		((refclk_div - 1) << 2);
+	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
+
+	writel(sdm_mode ? 0 : 0x40 + dc_offset, base + UNIPHY_PLL_SDM_CFG0);
+
+	writel(dither ? 0x40 + dc_offset : 0, base + UNIPHY_PLL_SDM_CFG1);
+
+	writel(sdm_freq_seed & 0xff, base + UNIPHY_PLL_SDM_CFG2);
+
+	writel((sdm_freq_seed >> 8) & 0xff, base + UNIPHY_PLL_SDM_CFG3);
+
+	writel(sdm_freq_seed >> 16, base + UNIPHY_PLL_SDM_CFG4);
+
+	ref_freq = ref_freq * 5 / 1000;
+	writel(ref_freq & 0xff, base + UNIPHY_PLL_CAL_CFG8);
+
+	writel(ref_freq >> 8, base + UNIPHY_PLL_CAL_CFG9);
+
+	vco_freq /= 1000;
+	writel(vco_freq & 0xff, base + UNIPHY_PLL_CAL_CFG10);
+
+	writel(vco_freq >> 8, base + UNIPHY_PLL_CAL_CFG11);
+}
+
+static unsigned long qcom_uniphy_recalc(void __iomem *base, unsigned long parent_rate)
+{
+	unsigned long rate;
+	u32 refclk_cfg;
+	u32 dc_offset;
+	u64 fraq_n;
+	u32 val;
+
+	refclk_cfg = readl(base + UNIPHY_PLL_REFCLK_CFG);
+	if (refclk_cfg & BIT(0))
+		parent_rate *= 2;
+
+	val = readl(base + UNIPHY_PLL_SDM_CFG0);
+	if (val & 0x40) {
+		dc_offset = val & 0x3f;
+		fraq_n = 0;
+	} else {
+		dc_offset = readl(base + UNIPHY_PLL_SDM_CFG1) & 0x3f;
+		fraq_n = readl(base + UNIPHY_PLL_SDM_CFG2) |
+			(readl(base + UNIPHY_PLL_SDM_CFG3) << 8);
+	}
+
+	rate = (dc_offset + 1) * parent_rate;
+	rate += mult_frac(fraq_n, parent_rate, 0x10000);
+
+	rate *= (refclk_cfg >> 2) * 0x3 + 1;
+
+	return rate;
+}
+
+static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
+
+static unsigned long qcom_hdmi_8974_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = hdmi_pll_read(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG);
+	unsigned long rate = qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate);
+
+	return  rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx & 0x3];
+}
+
+static long qcom_hdmi_8974_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *parent_rate)
+{
+	return clamp(rate,
+		     HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 6,
+		     HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1);
+}
+
+static const struct clk_ops qcom_hdmi_8974_pll_ops = {
+	.recalc_rate = qcom_hdmi_8974_pll_recalc_rate,
+	.round_rate = qcom_hdmi_8974_pll_round_rate,
+};
+
+static int qcom_hdmi_msm8974_phy_find_div(unsigned long long pixclk)
+{
+	int i;
+	unsigned long long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
+
+	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV)
+		return -E2BIG;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_hdmi_8974_divs); i++) {
+		if (pixclk >= min_freq / qcom_hdmi_8974_divs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned long long pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
+	unsigned long vco_rate;
+	unsigned int div;
+	int div_idx = 0;
+
+	div_idx = qcom_hdmi_msm8974_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
+
+	div = qcom_hdmi_8974_divs[div_idx];
+	vco_rate = pixclk * HDMI_8974_COMMON_DIV * div;
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0x81);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x01);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_VCOLPF_CFG, 0x19);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFR_CFG, 0x0e);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFC1_CFG, 0x20);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFC2_CFG, 0x0d);
+
+	qcom_uniphy_setup(hdmi_phy->pll_reg, 19200000, true, true, true, 1, vco_rate);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG0, 0x10);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG1, 0x1a);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG2, 0x05);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG, div_idx);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV2_CFG, 0x00);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV3_CFG, 0x00);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_CAL_CFG2, 0x01);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x1f);
+	udelay(50);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x0f);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL1, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x10);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG0, 0xdb);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG1, 0x43);
+	if (pixclk == 297000) {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x06);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x03);
+	} else if (pixclk == 268500) {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x05);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x00);
+	} else {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x02);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x00);
+	}
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_VREG_CFG, 0x04);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_DCC_CFG0, 0xd0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_DCC_CFG1, 0x1a);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG0, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG1, 0x00);
+
+	if (pixclk == 268500)
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG2, 0x11);
+	else
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG2, 0x02);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG3, 0x05);
+	udelay(200);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_enable(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	int ret;
+	unsigned long status;
+
+	/* Global enable */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0x81);
+
+	/* Power up power gen */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x00);
+	udelay(350);
+
+	/* PLL power up */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x01);
+	udelay(5);
+
+	/* Power up PLL LDO */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x03);
+	udelay(350);
+
+	/* PLL power up */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x0f);
+	udelay(350);
+
+	/* Poll for PLL ready status */
+	ret = readl_poll_timeout(hdmi_phy->pll_reg + UNIPHY_PLL_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL not ready\n");
+		goto err;
+	}
+
+	udelay(350);
+
+	/* Poll for PHY ready status */
+	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8x74_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PHY not ready\n");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0);
+	udelay(5);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0);
+
+	return ret;
+}
+
 static int qcom_hdmi_msm8974_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
 {
+	int ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG0,   0x1b);
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG1,   0xf2);
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_CFG0,  0x0);
@@ -49,6 +303,10 @@ static int qcom_hdmi_msm8974_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy
 {
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x7f);
 
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0);
+	udelay(5);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0);
+
 	return 0;
 }
 
@@ -67,5 +325,6 @@ const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg = {
 	.power_on = qcom_hdmi_msm8974_phy_power_on,
 	.power_off = qcom_hdmi_msm8974_phy_power_off,
 
+	.pll_ops = &qcom_hdmi_8974_pll_ops,
 	.pll_parent = &msm8974_hdmi_pll_parent,
 };

-- 
2.39.5


