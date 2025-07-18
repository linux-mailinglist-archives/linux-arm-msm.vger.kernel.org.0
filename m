Return-Path: <linux-arm-msm+bounces-65680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A89FBB0A7CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 801E2B40ACF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706C82DEA7C;
	Fri, 18 Jul 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOuGNCl3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF24F2DEA6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852943; cv=none; b=THi7FLWV2w2EmSIeMuV/XAi4kjR6Mfl5Zr5Uv+UhNnKM2XiheR7SEV3bITdwhOQLGeGuWJdD8Z3GoJyJDhqM8wIKUBCAsdcNDdB73+pcNgcXoqPbbuDJ20x7BCFbNhd3cxp9JWTy6nD/39gv63ZGRFtPCez/9Pwt7ruBNYrCC/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852943; c=relaxed/simple;
	bh=H5UmIvUo7LQWe2Migv7tSh5KSIEnuEJyZElnvQeZk5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWA4Ra4go5AJWT9Inkpm9rOb+Yi7zc5XS/FzeJaCHaRH5qOva9XTqq0sFenB3JhMOYFymPetXMDOVgFKwTEg0xiQ/I0VvYipPbwc3fF+jskUY60LViAigvUM2dk9DIszHsjqR8DV374Ci7DkQIH8Q2wMGLewUxPBeGRHsnKdrHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOuGNCl3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7wohe025209
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5K2XGMBh9O5MReKiBN1SLoFGkqLPj7SyaVN7/UiJX0Y=; b=iOuGNCl3yrRE26TS
	vH4H1+fKyxxrrXD67MqktB3qaDss/N0c8NaPrXmFR7VFwTi3o+riIea36RgA9K5u
	NabZzLLd7isgzy7YfJvWSugamwqg7VQCumi/I2t3GAfAsJVVNIN1XVqDA4icqLX8
	fikyD4hdVeGlA9fNfJODcdGwtFE6wcYImHPg5CEhCDLM7eNolt21CzrWd8S6ebJG
	tiPaHLYJm4bVLs8O10MU8o1IkYMwjISGJY+jX2M5XHr59NE68ao6TdZqfrvCUmNX
	70sDxPs/sufesmjBgFAqKmiO9F7c0z2S6pWvrWkGWMBC+WkJFocO1wHZc6uwOk33
	u/yPKQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqg9ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:35:40 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-73e732dff33so567760a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852940; x=1753457740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K2XGMBh9O5MReKiBN1SLoFGkqLPj7SyaVN7/UiJX0Y=;
        b=Uq1XR0uIDzww7K2N9HMH29K3HT3dJs00+h+g1M+Pw6JU/m+/xVhqM33cRwkgv+xYoP
         BPRGTIvWVZjBD13rq+kpaOL34+aL51Q8k/6msAFTiJCaUYPa9F4Gd5pToGLqzWnJ+nH+
         kjJTVYq4pBWrF0+1KVSF1qpBH6+EEp839qXRFDDJdgTYrarpHPTIuf8QZ2omwa5CWl9D
         paMGuCuHW9wb5NpWg6P54HOFgiL+leh24bD2+L55DSCdRdPl++EK38D2AaKMdxKvRycG
         HyNdbtQqslSF0r0xdhtBPZYj3mlnuY8EQbMW3ii2+uwZYyB4drHjqG0Og0J33QuQDlUR
         sKKA==
X-Gm-Message-State: AOJu0YwYs/2Z3y5bkS2Bj9/38m6BUS3NWy6r4pPhIJlxP34SuhIZFrM8
	bE8fKMYvWa5TNT3Pp733bbCg+UfOagMArEwphC2/dv9WoOPrn6QwAZJ5PFX6o9nDNnhofT2/t59
	FPuPXpiVsBt63ZLs/6aADEAi3jRF8pg2ZMX9e2z4cNM5oV7sjeymcKFA+su5/588y5wwm
X-Gm-Gg: ASbGnctcdrpxqFAha1O76hHzKu4g879VQ5w/eIDKEKVfKA6YIFS7M0NjbYlmCAo1aRa
	rSndU/zQpP5PveX07uZ5VWoaSKn2hqp/R5sizHCyv+/ibl4c8DY6vY7z52ylmKM0QCa+1OCcLdE
	eEWY3JIw/+y4a/2crewnP8wit/5M27QaozGl14/2LC6r1Ah2B6ZGDY4IrNw8egIDdL6isF3UIrd
	uhAINJqWdv509E6DUX/vOywLU2iKBeDy3lefKG43B79j57GuZX2b4DshxcAZi7/ShOPO+Z2TOvq
	7k+rBsdRvp5kWUmsPeJwiXEpXL67Jhn3gjN6azOiWlnWkenu1nbOXTYxwFFj2Pdp0qxEhhhNPoP
	iRwf7euDEcm6pSI122JsyjqQOwE1+N3M+ZoNsVisDMTYcjlKI9qHV
X-Received: by 2002:a05:620a:6007:b0:7d4:3bcc:85bf with SMTP id af79cd13be357-7e342a5eda7mr1399690085a.12.1752852348227;
        Fri, 18 Jul 2025 08:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEggOb9po8Z3KgzQOQPbQZul31JWCo9ugabQ7H/MSY3eKHvImtsITPWszPtj+g49k/Y+6XRAg==
X-Received: by 2002:a05:620a:6007:b0:7d4:3bcc:85bf with SMTP id af79cd13be357-7e342a5eda7mr1399683785a.12.1752852347508;
        Fri, 18 Jul 2025 08:25:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d994csm2466821fa.84.2025.07.18.08.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:25:41 +0300
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8550: stop using SoC-specific
 genpd indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-fix-rpmhpd-abi-v2-4-0059edb9ddb3@oss.qualcomm.com>
References: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
In-Reply-To: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=H5UmIvUo7LQWe2Migv7tSh5KSIEnuEJyZElnvQeZk5I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemdzL+wwxdRAvn/dW/Fgxt9ssFTlQfCMVMZ8j
 eFEaMzeiXyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpncwAKCRCLPIo+Aiko
 1RkJCACuN9DQAUNI4hr20SEIbwT6XwG3vTte/s2Xaox+qFhz60zOZI9kTeiNjzLXskGp7mr2kSX
 YFHe4+PR2Lc1GXvz9hCTIRUzjZk7cOR5n/X5HbuPn5XTu+iTVaSZpe1d0/czlxgdJpqF9x7w9U5
 GBSz9quyNBMI1MZEI1LecIVOWa0KOJmRnZ5mWsE+WP34rNBhctH84OUProDO/9oZn0+vVA7OeMs
 ISwAiL1XkQNF/Rhxpp3XkaQjX0TZUq/JYRjpcYdPpf2fVe4A5ZFr2CUQ/mNsQ20MVyfQ84l/kcM
 a0a86mnuvzGxwDj5DQyqmdMYUpLBcJo9ijV6w9yJ5F15IanK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a69cc cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=e06P08YCo0CmzbESZgoA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: guMBThQ0cBnQcXiivx17QQGZUXWlFPDN
X-Proofpoint-GUID: guMBThQ0cBnQcXiivx17QQGZUXWlFPDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyMSBTYWx0ZWRfXxnYnfOpwhc97
 DXLyB2UMg77kTawRQZtE7WFbrYjmC2N+Tyy3Mj/1o1YdunLp+teeTS4Jag/XRTtQ/MAIlLRKesC
 5xsuakuHxgl4pb5+zLi5uCM1VwNOTAnm4z6s6pQ5J9X9A14cY/xebs6yA89oE/zn8fTh8GkTFcB
 kUu1gXcx0aMOzV+mhflnaNWk4d3BWnSkfECHKD4K20XQd+UkOy3gRNT8mLp44cxATm2vcx5gYXI
 6zlXz0piIJ1CefE/1AJ5c7Hy7S0ctoeLj4ruXtJHIdIVOuQEEXADE//cVbpkQojmWLgH92FV3IJ
 7sZNyTOFc+nXRMnlLlzQ/xK3yDB4ZMLOnW6i7E1wS7N1F5Wp/58zSUdkJw6l3lV/OlU51nioBdl
 12NJJI8JwHg0YHAz1A5pGCrgp2Rs1ZltiMv2vSuEsMlDVhM0qj14WEhYbmPRA+bE5y6/IVCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=802 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180121

The SM8550 has switched to RPMHPD_* indices for RPMh power domains,
however commit e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock
controller") brought some more old-style indices. Convert all of them to
use common RPMh PD indices.

Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 45713d46f3c52487d2638b7ab194c111f58679ce..a4ca06679c2f1eebacdd5938e380981c1b17925b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3623,7 +3623,7 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd SM8550_MMCX>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.39.5


