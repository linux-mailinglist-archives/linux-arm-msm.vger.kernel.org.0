Return-Path: <linux-arm-msm+bounces-86568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B32AFCDC173
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7396B309EC4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7032C3254AF;
	Wed, 24 Dec 2025 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgH9hIvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THR6XX9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5731A57A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574673; cv=none; b=lz1oumlu2PELhnuiyW2eQuq24E2VRCTaCGARqYGqzbJqK+fkiZoAAC7nlgT4ngPDD3io7Ibi0MWCgg9Pr/pXvsIFNRBMZQONSyU3Gna0obdxExYfVESLhfUAyf63dsSqiiMBtFiKCrsl6JEh2JNuMbKirAJ1Zqzd6OYo8MAFcWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574673; c=relaxed/simple;
	bh=MMH1/hHWtFswUVrPQKUksBgBh+viXxBJ+PmBp4rmV2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YP5U2fRnmOV+OvcLV7ywaPcs56wGW1kPusMcF+Zl+qZvoW9VGlJGZ/LAQe1WytJpTyAkeMvV5G7Qn1x5xWYZfBjnZJyc47UoNLKCK4oJfY/gwCIhTsraCokbwIoXG97VS1sAweGuOpmu3u5TBqoNW3oS6XKwP/RCraYEBE0My2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgH9hIvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THR6XX9z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9f7wF1635709
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8N7vAC85FR0nW1JkuNjUJN1Rx+XfyhvxkkcTKWIZnSQ=; b=RgH9hIvYITj8aN6P
	lRag3q3v7a5x3GyEQA6g9yWRZ1feOXdDE+zR+fMakxNqJUQCUA2YYmc0YrxBF67r
	69/AnuxqPPE8X/ylJhWWyueZNhees7w4iNS6kbajS8KvdLlmxf8zZpzT3GnPGKnV
	gT8oO2JS+UN/sh71FieMguidfw4sx3ovSDTDvHHdc6ZrmQWfwyoH3Qgw1V5sxgi7
	kMeI/Vn+17rLNL8xItSp4gQcQqJiYlp0U+wJ+ij/SB1HM5TWGs63UHz/RoIsseke
	qFRJ4ONc9fzPLu/UoDInbpUxV9tBsYfM/ZjJXoSFHg4hB7PgkzQbUlc8meaoyfL+
	fMk/2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v28sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so144468231cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574669; x=1767179469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8N7vAC85FR0nW1JkuNjUJN1Rx+XfyhvxkkcTKWIZnSQ=;
        b=THR6XX9zXkL8gaUX7wNgBa08B7lMVZ5uGsHoFP+4WRiP8B479OFXMuNk4DfGfBGouE
         Y+B76M9PKh5ouRQfHnb9wYKtQj12zjs+gVF14jVrFoMrvdlQvUQqn8MzxKRilnn1uqNh
         PR9zJGbjEqwJj83l4Au9FjpCrJFCgmT7V7qNr6ItwQ/DEmzldFheU5ChXXoo0z88SkaE
         rPZqpj99GujLHhjHO9VF+xtpNoudqm7f6XJPEAvYIUuSRY0r0ZGYNKDomAVPlEJwz1WN
         Oxn41/s3YwandkAcrbmHhEv79NrGIbTK33nDZG8Q7QhmY+Qr/6sDnOkaQQGemHKrBZxn
         RMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574669; x=1767179469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8N7vAC85FR0nW1JkuNjUJN1Rx+XfyhvxkkcTKWIZnSQ=;
        b=HuBoT6OtugdkhnyNVUjWEaJOlMnstcza4/Eo3AlQoaPnj4HJjxXMIdDzha13yNMbAf
         FmNjBigdAIGycHHQXKwmtllI2tM3xPZDf86rtG7se+r9Ga0OLOtnyl/LRjhUb2MJjQTS
         jjSFmssOvXGSQuLHfdFGFgzKHEeo2VOtKyYC+h5qS6EjacCk9Yh5KZsii8x6mQnKPnEm
         3LOCRLc50WC4sf0FJfAz3/BRxNqAw75r6xX4TvZ4x/FiZTJbfEmncJ0U6WZNWU1xYjkF
         xZaAWH3BkkEZREY2PnHyKczy8l39eztFO8SvBD5yex4fvyx+whmkSYfNWg/BRyWngy8R
         i6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV3Fy69p0JrlLvhXdnrkcqSDYWG5vWtPU4TojV42D2UBfKdG27NR/dduDF+auOEXNIqkUHBvhEZW0PMFbou@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEA4P16z04jxHRmZHc9Xf53ojzBW3K/L3kDBE9EFAXpt7TyWw
	4EYLk1ct2vNqwgiAWEsp1ZkzqeQdX3Mkwb3xdNAafyXDd5NSQ2DUBhJSvVERdDarGsncC42kmXf
	+0rYw9hh8f8AoESQXvd8HIGgY9/Fd/Hx3YyxaL4LvwVMx4KZhqPQ0HfZKXqHpy58WdHA2
X-Gm-Gg: AY/fxX45caLcCpsGUUWZtV8ZPff45mr2wAxT2SSmayfHBdN/V2UMvw5yAkEa76OjiK/
	aEXEcN0lIog1UNWQFkCHTq2F92zK8G1YaDqNarGIMkx0O7hxzeoG2090kxbex2oz8t5WFmJM2HC
	gx4qmEMEdKd1qcqjsG7LcED8ADuXpy4LpQc4ksbm4jLp2EXcpnT0kHpB2LDTsP5+yLaZc6t9GKT
	GUekYGz9HRlinlnX/FzqQyOC/p2KPPAhwEfIrYXHaUoP47Sb9jVwk5K1inWStC3pwpt+3OrR/bp
	t/nLc1UsR48EKmIBqFyIHcoO+jA7TqZUUy6k9Rjydsbl8XWizrKSMdTfCXzS0M9goGj/0KDfgaf
	zjSeroe2gNceBwBs=
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr290397741cf.79.1766574669024;
        Wed, 24 Dec 2025 03:11:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQSZIw9gBDigIeuF8iFTkfyWX5mpmlwFbDLyT2L8Bi1LQzOnGnD4wY3hK+L17NnuqLFAoBog==
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr290397281cf.79.1766574668354;
        Wed, 24 Dec 2025 03:11:08 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm16799036a12.31.2025.12.24.03.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:11:06 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:10:47 +0200
Subject: [PATCH RESEND v6 4/4] phy: qcom: edp: Add Glymur platform support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-edp-add-glymur-support-v6-4-4fcba75a6fa9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12669;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lzSPPRu5v0qfFSEL47Mc43IFyRddY9+MtUGPgrFohSs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8pA+JfKxBoSiY4XJ9CL6ujhJ3hrEwnQ0q5t4
 flX1UOztauJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvKQAAKCRAbX0TJAJUV
 VihlD/4vqzVARxA22GPFE6eL/EnGOSWFA2RfSmEu3RhHgVAA35wgxLUsL13qkwa7oTIf3fCDiPU
 la2+LZVsLSFWfYUzF+nVc5Aky9n19tdAmQTWZdtRxJiFgnRLfDGvkjT8Awqh/PwYiuL828tKoAM
 ggvTmR0XUGTJOymwoGTZPxHFXaK/RFfExCHcaiV7tMkY1QVl7vBwuJZGGlvda87P3tJmVF0+Xyt
 XQyawbo4ZCdz3xRWQAcWGv7gEo9KQMec1t+R7N5YzFDwhA96QClaKd/KVov/e2u0ZyEYbt03EkC
 k3UYR9rkuy/jr5BR8oqWk9z0QNzqEaIJ48qbWXm2QXV37xbesVkrZ0wPME/vfPGwZqFm/WnYhYD
 md1+7d6wCJRX3dqXfuuqMC4ThmFjrtJ5Nq3gs9PDQyjG1VmENpE67QPhovrfygdXTtsPbgYxHSN
 +OF5ObzihqwAKsr1qSKvwO/zEb0uvnerVDzG5nW6FQsAztj+mV6AtrH7PhyfkUmz08zqtrV91bp
 8VE67nmjblFwTfUR+zlv7suU/letXpb4TJ0b6d580UnuGMvDFOcp8AeRokUjfdT+HXaQYkZ/DEN
 5Ojdu2O4OgOKzjFG4ifw7uI9OFnWUDSpnPEmxWbyp+OIZfOYhes+SY+hZYhONMVGbw3IG1BMO80
 WRrXmnQSVbAAaUg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NyBTYWx0ZWRfX8vFkGwF5eG+Z
 fmQxW51C/DBaeIk1aBfIRkLNVmhbvEnr+i1LW4xGgL6SG+iLU861DHdsBi3KDUSg3nCV5e6s+AK
 zUXCU2FCoU3JduXe6rjHch67uABA11wOaEa2Eek9xplbvTPbvQHDFzhpQ9Fal+CsQd1h2VEgEBQ
 yBRdUihNuHs+K1zPrx53v+aHc4Ytr7cmABrkHhX2g2tBHB5+7NJPNDTkA+ROp7Y1M9/mJcEdovw
 QLiTS4VvH8GOxLv0mH6kzamnnXtEHygXloB9xzoulxMmvE/Zio6P4I3CkbkpvQN1U/kvmmBehXJ
 O3ZVGMCJ3C4gXgzhIHRCSLbkpd0VvckJGSHOfPVdhq00R8lXtpexUxNkD2YXuII0dnzRenxzax4
 rEdogcY1rLdzX5vdDIfvOatWoSpxKWK5uftUGj1o7XxB0rzwVhqXGnmcBcHB9nqnznE8kzOgIvh
 jtObz0F0y/P4RhpJl4Q==
X-Proofpoint-ORIG-GUID: gaIy0Fa0hBtBRwDC8_FPmZp-2-VYhTcx
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bca4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4YCwYE_O2Fn-gSgt1roA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gaIy0Fa0hBtBRwDC8_FPmZp-2-VYhTcx
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

The Qualcomm Glymur platform has the new v8 version of the eDP/DP PHY.
So rework the driver to support this new version and add the platform
specific configuration data.

While at it, add the rest of the AUX_CFG reset values for the v4 and v5
platforms, which makes the handling of the platforms specific array
cleaner, as they are single sized now.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 227 ++++++++++++++++++++++++++++++++++--
 1 file changed, 219 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index f98fe83de42e..13feab99feec 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -26,6 +26,8 @@
 #include "phy-qcom-qmp-qserdes-com-v4.h"
 #include "phy-qcom-qmp-qserdes-com-v6.h"
 
+#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
+
 /* EDP_PHY registers */
 #define DP_PHY_CFG                              0x0010
 #define DP_PHY_CFG_1                            0x0014
@@ -76,6 +78,7 @@ struct phy_ver_ops {
 	int (*com_power_on)(const struct qcom_edp *edp);
 	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
 	int (*com_bias_en_clkbuflr)(const struct qcom_edp *edp);
+	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
 	int (*com_configure_pll)(const struct qcom_edp *edp);
 	int (*com_configure_ssc)(const struct qcom_edp *edp);
 };
@@ -83,6 +86,7 @@ struct phy_ver_ops {
 struct qcom_edp_phy_cfg {
 	bool is_edp;
 	const u8 *aux_cfg;
+	const u8 *vco_div_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
 };
@@ -181,8 +185,12 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
 };
 
-static const u8 edp_phy_aux_cfg_v4[10] = {
-	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
+static const u8 edp_phy_aux_cfg_v4[DP_AUX_CFG_SIZE] = {
+	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
+};
+
+static const u8 edp_phy_vco_div_cfg_v4[4] = {
+	0x01, 0x01, 0x02, 0x00,
 };
 
 static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
@@ -206,8 +214,16 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 =
 	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
 };
 
-static const u8 edp_phy_aux_cfg_v5[10] = {
-	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
+static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
+	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
+};
+
+static const u8 edp_phy_aux_cfg_v8[DP_AUX_CFG_SIZE] = {
+	0x00, 0x00, 0xa0, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
+};
+
+static const u8 edp_phy_vco_div_cfg_v8[4] = {
+	0x00, 0x00, 0x02, 0x01,
 };
 
 static int qcom_edp_phy_init(struct phy *phy)
@@ -226,6 +242,10 @@ static int qcom_edp_phy_init(struct phy *phy)
 
 	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
 
+	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
+	if (ret)
+		return ret;
+
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
@@ -345,22 +365,22 @@ static int qcom_edp_set_vco_div(const struct qcom_edp *edp, unsigned long *pixel
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		vco_div = 0x1;
+		vco_div = edp->cfg->vco_div_cfg[0];
 		*pixel_freq = 1620000000UL / 2;
 		break;
 
 	case 2700:
-		vco_div = 0x1;
+		vco_div = edp->cfg->vco_div_cfg[1];
 		*pixel_freq = 2700000000UL / 2;
 		break;
 
 	case 5400:
-		vco_div = 0x2;
+		vco_div = edp->cfg->vco_div_cfg[2];
 		*pixel_freq = 5400000000UL / 4;
 		break;
 
 	case 8100:
-		vco_div = 0x0;
+		vco_div = edp->cfg->vco_div_cfg[3];
 		*pixel_freq = 8100000000UL / 6;
 		break;
 
@@ -398,6 +418,11 @@ static int qcom_edp_phy_com_resetsm_cntrl_v4(const struct qcom_edp *edp)
 				     val, val & BIT(0), 500, 10000);
 }
 
+static int qcom_edp_com_clk_fwd_cfg_v4(const struct qcom_edp *edp)
+{
+	return 0;
+}
+
 static int qcom_edp_com_bias_en_clkbuflr_v4(const struct qcom_edp *edp)
 {
 	/* Turn on BIAS current for PHY/PLL */
@@ -530,6 +555,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_power_on		= qcom_edp_phy_power_on_v4,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
 	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v4,
+	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
 };
@@ -537,17 +563,20 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
+	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
+	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
+	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
@@ -555,6 +584,7 @@ static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.is_edp = true,
 	.aux_cfg = edp_phy_aux_cfg_v4,
+	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
@@ -734,10 +764,190 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
+	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
 };
 
+static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 step1;
+	u32 step2;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 8100:
+		step1 = 0x5b;
+		step2 = 0x02;
+		break;
+
+	case 5400:
+		step1 = 0x5b;
+		step2 = 0x02;
+		break;
+
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SSC_EN_CENTER);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_SSC_ADJ_PER1);
+	writel(0x6b, edp->pll + DP_QSERDES_V8_COM_SSC_PER1);
+	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SSC_PER2);
+	writel(step1, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0);
+	writel(step2, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0);
+
+	return 0;
+}
+
+static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 div_frac_start2_mode0;
+	u32 div_frac_start3_mode0;
+	u32 dec_start_mode0;
+	u32 lock_cmp1_mode0;
+	u32 lock_cmp2_mode0;
+	u32 code1_mode0;
+	u32 code2_mode0;
+	u32 hsclk_sel;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		hsclk_sel = 0x5;
+		dec_start_mode0 = 0x34;
+		div_frac_start2_mode0 = 0xc0;
+		div_frac_start3_mode0 = 0x0b;
+		lock_cmp1_mode0 = 0x37;
+		lock_cmp2_mode0 = 0x04;
+		code1_mode0 = 0x71;
+		code2_mode0 = 0x0c;
+		break;
+
+	case 2700:
+		hsclk_sel = 0x3;
+		dec_start_mode0 = 0x34;
+		div_frac_start2_mode0 = 0xc0;
+		div_frac_start3_mode0 = 0x0b;
+		lock_cmp1_mode0 = 0x07;
+		lock_cmp2_mode0 = 0x07;
+		code1_mode0 = 0x71;
+		code2_mode0 = 0x0c;
+		break;
+
+	case 5400:
+	case 8100:
+		hsclk_sel = 0x2;
+		dec_start_mode0 = 0x4f;
+		div_frac_start2_mode0 = 0xa0;
+		div_frac_start3_mode0 = 0x01;
+		lock_cmp1_mode0 = 0x18;
+		lock_cmp2_mode0 = 0x15;
+		code1_mode0 = 0x14;
+		code2_mode0 = 0x25;
+		break;
+
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL);
+	writel(0x3b, edp->pll + DP_QSERDES_V8_COM_SYSCLK_EN_SEL);
+	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SYS_CLK_CTRL);
+	writel(0x0c, edp->pll + DP_QSERDES_V8_COM_CLK_ENABLE1);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE);
+	writel(0x30, edp->pll + DP_QSERDES_V8_COM_CLK_SELECT);
+	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_HSCLK_SEL_1);
+	writel(0x07, edp->pll + DP_QSERDES_V8_COM_PLL_IVCO);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
+	writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
+	writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
+	writel(dec_start_mode0, edp->pll + DP_QSERDES_V8_COM_DEC_START_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);
+	writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
+	writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
+	writel(0x96, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
+	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
+	writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
+	writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
+
+	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
+	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
+	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
+	writel(0xa0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
+
+	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
+	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
+
+	return 0;
+}
+
+
+static int qcom_edp_phy_com_resetsm_cntrl_v8(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
+
+	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS,
+				     val, val & BIT(0), 500, 10000);
+}
+
+static int qcom_edp_com_clk_fwd_cfg_v8(const struct qcom_edp *edp)
+{
+	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1);
+
+	return 0;
+}
+
+static int qcom_edp_com_bias_en_clkbuflr_v8(const struct qcom_edp *edp)
+{
+	/* Turn on BIAS current for PHY/PLL */
+	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+
+	return 0;
+}
+
+static int qcom_edp_phy_power_on_v8(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       edp->edp + DP_PHY_PD_CTL);
+	writel(0xfc, edp->edp + DP_PHY_MODE);
+
+	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS,
+				     val, val & BIT(7), 5, 200);
+}
+
+static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
+	.com_power_on		= qcom_edp_phy_power_on_v8,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v8,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v8,
+	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v8,
+	.com_configure_pll	= qcom_edp_com_configure_pll_v8,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_v8,
+};
+
+static struct qcom_edp_phy_cfg glymur_phy_cfg = {
+	.aux_cfg = edp_phy_aux_cfg_v8,
+	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
+	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.ver_ops = &qcom_edp_phy_ops_v8,
+};
+
 static int qcom_edp_phy_power_on(struct phy *phy)
 {
 	const struct qcom_edp *edp = phy_get_drvdata(phy);
@@ -1133,6 +1343,7 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_edp_phy_match_table[] = {
+	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
 	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },

-- 
2.48.1


