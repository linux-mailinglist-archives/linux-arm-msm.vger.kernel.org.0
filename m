Return-Path: <linux-arm-msm+bounces-54898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B5A958C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 00:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00B6A1896B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 22:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94253221FBB;
	Mon, 21 Apr 2025 22:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPrIDwSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB8522127E
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272845; cv=none; b=GTvzdxOdsmLSAxxiNJkExTgSh3zXOnC10EWbUvawc4xHVpalfO4p2nES5mQbI9f0u0iAdY8TRjphmC3OjyZSP34o+kxuxCddVK+oHpuZ9Pw22LmMRv+Slih8QiNHIlwkKKzU0zYO7lfD8JwNcXxxXvMSDsRh0XdJn/EwwrWkL6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272845; c=relaxed/simple;
	bh=RucDGnh205zN9Du1WLY/9OSUuvvX/3h5grFDFTis0qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXmxMsQ4wJubmGxdwrp2ATnQqKjH0QRmx8XV6hYTL9TfCheXzn+qSabFCM/cX2YHp5smBzZcjWPcEKF8ylYgWwEYPRRtdvBK4Pdw8VP0URpRO/dhjQE2GGSp+9yN+AOBFiaV5U265GqJVJteO9WEireSz4/YOFSSjYH7xZj9DSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPrIDwSf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3ur4013204
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxIreYtDs8PbxaWWNugh8dWagakL5JwQYhA96Zqa+B4=; b=SPrIDwSfCZk8LcCs
	H7FS4181QO7ZCoVZcpL4inEKpDlj2RGbVk0bu+D8xnt1Wpga4CAMyP8eIBcy066m
	Z6lC/YhMVR2YVPOveBLC6k8a9pZCfyMTlaYLnET6yih4UGlvWbZx+IFgFx2uuJaA
	q61pNmlSrlP46frW97lSqkMPNLuDKRS/guc/4HNy6GM01eTUitO9e3jToSqvyCMn
	rPvPjQ9SiAViPofaEeGNhLqcw2y2PbZgs9TJvcosD2yASLwTNgdDAkbUfKNcRS7/
	01mnpViGTO9IXLLpDyO/XB40BU4xn6lJVPLm5tH3z9toOKIUSZQDT/HYdG/v2WEA
	CMk+Kw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pd84d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-739764217ecso3867590b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272835; x=1745877635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxIreYtDs8PbxaWWNugh8dWagakL5JwQYhA96Zqa+B4=;
        b=ZQP/Ur2YAmfL0L7dsWUnJ0OTD4jYiWNKauAUra5D0gLsByVN88at1JPf2cja7KxLHD
         R7tuqRJ/DaFwSVL6zFIPCX7ZuFeOfWG6O9MoLP48HoGYj3wuSiEQrRPylrA5bO8NGF4K
         cj3I6TmSk00OIRqn7chAn1+VIYgkMSkxRTIIhTm1O+0zyXbVvjpDowfzx7ElnklxwGFA
         APM+aVJX6JZ6UB250MRD9lLcNy15HEVhspFooYIKcFKOQlXdLQT5XuJS7QRYflwMS0QR
         e1YECGtcocDSngznHxsSh4exGSEMukZPOF+fsgVGw7fAxKrccDOutUM9CSjnvbFSlSSg
         gI8g==
X-Gm-Message-State: AOJu0YxJdN30s6kqoNk2UkBuC0dmQyCfS9f0F04UJhglXCobHcRK4Zkg
	ElJDCjLyWe/0Rto8NltDy23bVYtb1TUU6R/Rl3wfsQ8MVEVuneNsp0So8UzMJWNq+9AfgGoK3f1
	a7TweNUl6P3L6CYs2anUr6OF2WbDQzcmzj0Yi/ZTGiypshocgOtxbmdcpvQ3JLLPf
X-Gm-Gg: ASbGncsU9q1ues7ITef/nNHnyUrW3kzELsFsnaHeWLdArrqGxLBG07+IV3Wp9/3zKRC
	ztKLVhDR+hTgUjNdNlS5Fu5k0XB0Y2HTENZAnBbtqOZJLorOl7lJTbAmgLfHCgIqBQtfFUQINi6
	0L62t47pPn2pVTYvW1yJ/GbYykRh/8799EyAUxoLQYPPbVWilbSYj9xe6xxku3IK/vw977AD59V
	+qZbojee5GGgh1ebpp6FL+CP3O4hw8feqgY6tOK4oXiLdoGE+ItVrNu5bI798NMKSSGDZ5v+Jjw
	2oN+sgjJshwF3Qgv7BOqyFOJWb72LDhUq2XxFl4ZR335KFDPDTdvOLqsXkf92GEeXTY=
X-Received: by 2002:a62:e315:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73dbe601c10mr16714365b3a.9.1745272834766;
        Mon, 21 Apr 2025 15:00:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa4d/A0MdKe7wsQHbdyWdb8WfMEvnr8OJVqW1df+NeezeSlqtJ/whYCxmwSASSmgAQKiKdoQ==
X-Received: by 2002:a62:e315:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73dbe601c10mr16714297b3a.9.1745272834133;
        Mon, 21 Apr 2025 15:00:34 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:33 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:12 -0700
Subject: [PATCH v5 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-5-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1377;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+hImyIOsCXufDPn2hP6J7P3TE43wajo+VUahTyCkksk=;
 b=e1eWhBFHzDWXtYIz2cG0r2tDlIYq7kkjoByLMH3dJK3efUPNwqwPXRsotlSepEFtiK4HvWeYV
 56XvmXYuE46DxXiIiZYfWfv+gCA/1Ne3Xy6BxIOP+QrhBjZD2uOxJnZ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6806c00a cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2IHzoM5ujN45o2WKKn0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TmTF2e3nBAKIiOC7kDYAT4csHJdU_9s7
X-Proofpoint-ORIG-GUID: TmTF2e3nBAKIiOC7kDYAT4csHJdU_9s7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=921 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11ddd76c2056eb2e72a287ece4def2cf5d8..3cfb4c9d3d10dce49bb93b241f9b56c75b934601 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1


