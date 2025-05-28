Return-Path: <linux-arm-msm+bounces-59671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DBAC65B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E291BC435D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7248278768;
	Wed, 28 May 2025 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLawmlCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A33B276020
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424112; cv=none; b=iFYRuxDzlRQCRntL6reaKlrYOsEoG6hv4NyII7HjbLvfbJy8mtBeY09VI2tgLcytgjnVCIAj/v9Kg0q3fC/kRBt7V0N4r8SGNGc8aPzG2kTWN1Xv/K9723bcrYCg3jCM/cn5mVa4bisJcNwJ/XxSmIq5o+ADgFN8VXWhYDUUcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424112; c=relaxed/simple;
	bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwKABhJ0+z0Fv/3q94Si0MPca6Ls3A1dXSHaLkNlYzw6uqs/rP35m6UvXpMfRKECpJJYTBRPwXYjYNEzZA7HMkgpceGXVlPlQx0zFYXHQYw7sT5oGgg4IvefG4AmwWM/M9NVJdm1ScwwL8QOca7tfyrZ+0+DPuTuk2Rjf2l92D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLawmlCP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RMFRFp023008
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=; b=SLawmlCPUdvWI+tZ
	o6QRN/0BbsAv6qG8FrX7W881ZHZqUgVvqGH42PiKfYe80K8uOKwW1x8aM6+GdKEx
	lUOyrzR+47CLTc7PIIPKOGIBa8ut5IACGuvMJ5ZJB6+1QTIkXXTwJB16qb70tw0Q
	KyqJHvbBfTEXL4uyGaTztlvftb2kZdCrLG2hGax1ezUP0N69JmR04XP9wVrmMeYO
	R8xtHq6RmLS6PblTJswR59AofWbKM8qtasYsVgZOXikUbuCzYBYmOiPIe/U8UYA0
	po9WPfhtHDvfIKVrz2xIH7JXU3dV0J7u8TQ/VsNMLsWXIJxl8mSLmfw0ZQyXLeAK
	kcXPtQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjss1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742d077bdfaso5205293b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 02:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424109; x=1749028909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=;
        b=wkhCRhVkbxjwsKT8xVvQk88blDy/0hABjei5RsHNsop3vmfDBBUdy05PFfO07k54sI
         vJkebMfdor7e3GqTo8wi4Iv6ieOUepvlw8xmCwLlPHjZDxAiNbAofHea2tZsNzejyu04
         /RkudShRdOMHe4U3Mx8qBz52xF/d8YrCEvBQTea7eGdjibEZPBtG6AxfkRH8nflmSNqZ
         mVX2FNV7sCtlOLfWHHoLxiUcS/lhAQ85B4IJahFFQMoaM7Aw4WCnMw1LcL3W9VzZuSPq
         TobN4aZIb140ptA+23QCvxV2OeeI+Ts8kSkprb6u7QPjIaFKN/9LYoDHEKdu7Lots1Ba
         66Uw==
X-Gm-Message-State: AOJu0YwKe3QuA4tQ1ezItWrDNM3TrfPl+BCU33yk8DcZR2WfLglGJBZI
	uWPvwfCs8jW44MgaLATtA8DaY+aR2TBkpPGO9pNmXHt24cNvMiPNmiyj200EiPUDshq7u28fx3q
	+0KxM81TeNrqPfHmvgp9L3A/2Q2UJEcl9F+qlZhmvPOpiJPLrU6dySJhv5MI3JNI5IjeD
X-Gm-Gg: ASbGncvx5groTMcHNKCjfvgTrJyl3o5z3CrFXICErBCUTRV2y1yjfPMPpIDUG6yBgLz
	TuePnvrEJnG38hSXf74nJGcfQV0FeNuVK7VUN866UgMtTZZSFLTPzO4Yi6LROPlFGvgnB/0xW8m
	BjMj7f8EMc+LgBQe6n+bTXddtxmfPEhjOZe1a0JgCAw1PEMOYEkOhSImTmQsooeZskMPnha7uyX
	KgQfRFhvIWISye5Qn4bS6zBCPNbKpLtmL4cvIMZQS7RirCYzldwh8lNuIuWS5vQjFUKbXKIgqQy
	eSiDiC0Lye+9Hp3IYMd7mjjWuQ==
X-Received: by 2002:a05:6a00:140f:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-745fe035e87mr23787268b3a.19.1748424109371;
        Wed, 28 May 2025 02:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8F1Leeb8hvqWanbPhFDRIXbSQk+YihOTKHY3m3CJ7M+ZPDA0t/uCx0hLnU+pvOhLg+qqIGg==
X-Received: by 2002:a05:6a00:140f:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-745fe035e87mr23787223b3a.19.1748424108964;
        Wed, 28 May 2025 02:21:48 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c2c6sm833456b3a.134.2025.05.28.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:21:48 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 28 May 2025 14:51:33 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ddr_stats_-v4-3-b4b7dae072dc@oss.qualcomm.com>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
In-Reply-To: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748424095; l=2423;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
 b=RVhu3aYygw1jl79Ka7vUZ/MHVDs5AnJ/SXP1NxKfVCri/JIKo0YFwrKfUNK45qGAa8Ez9gbqa
 9fhVIsnDbnxDxUyyrlmeXQXK7TH1j97wTIakKGHennXv6lV72Sr1BKb
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6836d5ae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GL-xn7CBy2CN3rfaf34A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 1F3rGzOJmy0jNNHhgSTvnolf1o_pPZlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3OSBTYWx0ZWRfX3lIPnn80Zaif
 kDasQ0hPLQmaHM6YLz9eyCmfbD+jb0pPw6eBB4n67q7xKAbHR5zwQEPE2HmBSJ45VpNqMILEgn6
 mG9hxPsbcNtucEWyOQF4HUXYhAMQJG64NiQLM6w2SN4P3ppZct2VqQvbZHs0tC5QDKqcs2PviGb
 H5y7r+pgkssdCy0qVlMK1e8S1i6uSAy0He42JJIhzQMlSoBcXbfToRaodW0TX2KHpHRaGjZujx8
 lxf7ghHUL5zd0XbVSaKtF1ZgdNknGOnmqEdwFzRWre3EkhuSf8bj47lA4vckj9ypiyEzujkOenr
 jYRg5K1R6Oo4lqUOFcZipZefhSWe7erAbr8VNBQVxAOvt1nb4XGDCJVxFHXIxGfo8IfqYQxweto
 hfQCpTLDSdEsPlmQeBbuvDv2yIxUd8bwfCo08igIIkbD3sC/rV5WeGq05Y5PBwKmzYLi5vrx
X-Proofpoint-GUID: 1F3rGzOJmy0jNNHhgSTvnolf1o_pPZlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=686 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280079

Add QMP handle which is used to send QMP command to always on processor
to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 54c6d0fdb2afa51084c510eddc341d6087189611..33574ad706b915136546c7f92c7cd0b8a0d62b7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3739,6 +3739,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2c1dc87457aeede913873e7322ec2..e8371a90b9b98fbc12a429def8f6246c6418540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3943,6 +3943,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..875b5a89d2555f258665c881ee3d96965b6d7a6a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5725,6 +5725,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..4c54ed84e2d1ec836438448e2a02b6fe028f4c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2490,6 +2490,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {

-- 
2.34.1


