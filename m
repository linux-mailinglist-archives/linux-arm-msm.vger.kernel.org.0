Return-Path: <linux-arm-msm+bounces-54383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33671A89A2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7176C7AA03B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161072973C3;
	Tue, 15 Apr 2025 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpgjX93J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87728E5F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712836; cv=none; b=d0aiI7vkxBCKKci+ctfGmn9QuGRNFaRVnxxlGBhALl7P8kBiyryXbXfbDuS0mZ/HCQoJxfkmQcrrsnFXKuxWykqnVd8cHj5z0jsjyjDAQNjmXDFxw7jH59RbiMJfwbqya5q/jdkVkB/yRMJOw6XRapDlOw9YE/ArjWPFU0Zh9kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712836; c=relaxed/simple;
	bh=dtzNTL/P7Z3WOvVQ6jmGC0/vB1bL9i/jf34wEQn+z/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mj/ceDCiJ7ToVyiPSQ5yFvpkf3h6UWT03ZzopgcO6/tZ7AFqPdst+NlyrXzys7WwNk87ILP71oPYonuetWKyemt6LgTC7aAjfd/CAP+uNCDdBQOD4syTnlX6CCDZiiCUthCUPICQV23fxirYNoAlF22jKxtML9mdIOi8FWdqkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpgjX93J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tIZV031770
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5d/UsG0pIA+uvzIpXztXk4xghk/A2mkKgHkgukE1W4=; b=bpgjX93JlbNKAuLL
	xdlLPDh3OMI/c0PhbYFtve5OUHVf1SyDkxs4YNknNDvejlpArpeZ13Nk5hlvLXkC
	wiuw3LoUwAEnawboPYuCVA0g3z4h0lWI1Fu8Els2ZgJyTybMLIsG0IPqVR9a1x9D
	aCydGdfDjMMpoc5V58LPHkr9jhZofNFC33aRZYxPc97qwUVHlo66q63VNDmpkZHg
	RoyRELlp7b/dJNGnTfMoCYvZxXVpu/aNg12bUQRS277nsVA8KGAfend08Si9T+Uj
	dGsVNmqCzE9owTMw9W0E7SgQY6nx/GqQGKaCvWc9JpAlLNXbftAnV7veA/b0qF+3
	nPPgUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17pqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c543ab40d3so791915485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712832; x=1745317632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5d/UsG0pIA+uvzIpXztXk4xghk/A2mkKgHkgukE1W4=;
        b=K1t+x0A+TbvZJrYh7gIvx0EkOfe2kmqEmMyg1hYEq5Bo5KvJ0a6/hrDj7vP4qlTchO
         PTZUTk+2UQI9vdDHf+KDW8jwMN20DBEn3Ax9QiFqt8wK46iw2BGNNcEAfwmqXmXxBZPG
         KzPHf7XmCy1ALTMtgpmQ5woNJDzstXW8tGTeZx8+Q7DFSqnG8NgdX67oQ/Xf/CMnHQLA
         uANoxCDp4FjCaQIc+/Ym+T8SN2nK3RL6f2y6pNPhCdA+Mjq4Eawd5fn0yhkjJUP2UPL+
         MPMbH2FzMM/VUaMacYWG4iAuNb9Rnd9UrE4EK0ZbGG2MDo6vJqqY95rJyju15ML7stxO
         k3AQ==
X-Gm-Message-State: AOJu0Yy1NsJS1rCdik3c0urciU6+w/ejgaYYs8dws5dS1cauOPrky9Ib
	ChVNFqLHdAy2AHV0guzPZoOVTOWpt3re6Efwykjx40FoIjANYw0gLedBvSOAVYVwBpOA2zSjTlZ
	EYYNNzPLvWohUEr3Nx6xCfonqWa2hMyRVlC4n+n1FbP3Rc6jz14B2Yuxk/OAjdXUhHWq/PM3UOz
	/Wdw==
X-Gm-Gg: ASbGncvTDUnnU63Lt+E343pbcxLQS2h6511rlI/QC0G6Ww+er9pYT4MxKIaZWh5z7di
	nGKUR/LzRNVO7yoX1vS6FX8x3bqXKL+Xe/5TrpAw1tfoU+oQbVUzIqDO++ufleNJjNHGqiz7GLM
	9eep6BgYAB0dpiqcnIwRDh7aa3sqQLBXYx5wBm+Z3LEefjrJhwsNJmnIBmDrLNUmKsKMxYYKFpH
	w+l82rFMep9+uVjxrlB1KeVk8yA4zmCxjNUOeJTWR8KAFS998ux4gbuCVrSuC7rfoRXDc8jJurz
	nP7GtnrsPrv+BiKcH2T0TZ8G0tkstZwOByYJq26vvT74kGWUo0TO+/Re+jbl1k2bl3Lithx+AkU
	q7UhtLLG8ZOfj0geFERb4Pzzf
X-Received: by 2002:a05:620a:270d:b0:7c5:96a1:16c9 with SMTP id af79cd13be357-7c7af0be2e8mr2574553485a.5.1744712832051;
        Tue, 15 Apr 2025 03:27:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELC1n6MgKcI5o9cWWzmy+FXwbP/jC/AFfBTBfKcM6HLd9b+Mb32aITycJagbMF9aMyy1/92Q==
X-Received: by 2002:a05:620a:270d:b0:7c5:96a1:16c9 with SMTP id af79cd13be357-7c7af0be2e8mr2574551585a.5.1744712831740;
        Tue, 15 Apr 2025 03:27:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:15 +0300
Subject: [PATCH 17/20] arm64: dts: qcom: sm8350: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-17-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dtzNTL/P7Z3WOvVQ6jmGC0/vB1bL9i/jf34wEQn+z/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRf+17BaTI39SVGRKDwaOV/BqmXhF2+gZqAk
 wf1Sf/fwrGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XwAKCRCLPIo+Aiko
 1UUyCACVVc2ZDpq8DMvO9kYRPGQGETYWnDHdiOKGQWf1bZbsRmoZl4BxbHr9AcZH4mTIwVEADke
 qI+nrvhmiY08p0CnR9T5hZ347XmxCzymzKwfjiHHcf1+VqkXfSplQCxoJWA0BLp7eZ8nBwzCx1m
 QqfspQuFYtBkss0/eWpmfvGHJvrsb9IRsuUo+lIiZnlpD+pVwUBObp7N0AZFkXx3BUTJZ8I++p6
 vLvgk+M2s1ydxAlDWGT/OIY12E5JVyuTQ1Ceqjo/r8VSXfuIcxLQJBW3TouP1HAmAr6rHMrEYye
 9nNcebS2zLQCrybjgPsoYBDdi/+rbj82X/Tixo+Qk3pX+0Zt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe3481 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=u6SFSMcxd92a3etOWaoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: E-lnqypICQTQMqUsb2e1Kp3HhccJmbEc
X-Proofpoint-ORIG-GUID: E-lnqypICQTQMqUsb2e1Kp3HhccJmbEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=812 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5676420bd5ccd26cf0fab87195b076a782675db9..279a68a7146e4e71d31944c37465c2bfc6dec3a9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2775,7 +2775,7 @@ mdss: display-subsystem@ae00000 {
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8350-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,

-- 
2.39.5


