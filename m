Return-Path: <linux-arm-msm+bounces-52658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBBA73465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97755175D79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA32842AA1;
	Thu, 27 Mar 2025 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQWfiBwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28352217722
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085735; cv=none; b=W+KxZInfO7o0TOSKDM1nCyv/t63p2wEErzq18L08rFUsR0FJGaqzCP53fiic4rsHISDJ37uikZBspLOetOlFxfuGs+6h5uDXRZTnqfhqoZAAfSC/x8U7TTN4TrqjncO+5zlAGm+3idWx0xJ/v+iO3Kq0z7j8ym4RGc/wADkb8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085735; c=relaxed/simple;
	bh=7ZSL4VJY8W2kfcTv/cm/0cWRYQ5ydFsGG2mgo+VDVRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gqTlJBvomLYidoySIrthxuKz2fLEbumCAxyU0lX+WN6/o2kWbO/TBMqN7sAxjPXLmKriSO0PolGFCSZMsyBzEM8aREmDQQyzIeEQ7na7h255XXg6OjJO63bmhihV21+o0gFr/T0doxF57pSLkb4mLXw90IECJ50XIqXvenUaZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQWfiBwZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RENgkb005277
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xmO7jvza8VzmZJo/zOTjFHg8mKWCP5QoYL+
	UGsbTuuA=; b=YQWfiBwZlY3viP6vBslnuz4XcnI5cmp7SFD5kDWq1u7Ux8VpNjZ
	o7481/ah6zgoKia3cGeF/vK0uxRlinhOWQ9Tq+YB9UdrM95LO2MvnuT7Dq/ZXso1
	JropQQJMT5YPuMRNgrms9IJGGuQG75Tn/3zkzXrfqopI/qsJBcXJIe6sc2nOMGRM
	qTtBpyeyOE09WwMNw8rytwn2RDihsN3pwZKlpEPEzb5llzINclzvkYdIAhOgydRm
	NduRpe+P9TEIMmPetb/EPYXclp7uM95XjOBSbQ0G33EO707FGXa3Qiy+/UMWvyle
	zGOGfg7CtOymz6Af9h4hMgka/zzEyNgVmRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenfn14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:28:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223f3357064so18808665ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 07:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085731; x=1743690531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmO7jvza8VzmZJo/zOTjFHg8mKWCP5QoYL+UGsbTuuA=;
        b=flARB6Gh5+AVgfhZiqyglVlzujulBpdO9YRLiF0+AUs7cWq0fAaFPpZMHY/LPuMTlG
         YBPu8uk2eSpU5ItmfCV14q5zP8VXBKg/2gHsg/mdyBhoyhjD0pKxDGEpJfppUnriBwEt
         qoQrMUXR4XCM6P1NGQs5rAWY2xnYdfTrLK228ivRjvnTwMgNMgk0XEroowiHnXDtS7eo
         ks0ow/O8bsPZ+M4azY0StU0rxuF1nKbDooivnsA7EYHPIG0lBuwHx7BUk82V5iILe4js
         l42DV+MviCz7ySD3gLyH/86T5WcCXN7mJvTVOpgI7iupts1nkox9J1dpxw5RNsJkT3aU
         PIaw==
X-Forwarded-Encrypted: i=1; AJvYcCUGfc2C0YS4J0idRGZyPfpOiv+LAB5f4mPtyT4NqchbEgmKh9URtp5z+Np1F1xvxvhqU6/qksl7gIBu8zA4@vger.kernel.org
X-Gm-Message-State: AOJu0YxM8ohHPC+ay8I9LVCJxaR6Lcmsb6ZrOCbR40eFvN8wI0nND3Jr
	/vDFe+8ZpW1Lcdy4fgvfLJgei8374jWpOsJaPjPQXQ+NUHjeVMMP0yXZ2Q2QFUYzBNCXfrPlupT
	xl5G4RP5mDDM08Mo2MQn56CXD1tpmYFr5VrlYRS8UQSkfE4IPCvsIH7iHu5ErXxbp
X-Gm-Gg: ASbGncvKAao0tKxTxfWewOIFdLCVTp41v89zvtkMnXp3MheCiRZnSqJty9uIGkO0FD3
	hulJNVjoULZRnOmosnOeA2kqOfaj8P1bNI+cKWCgaazeJhEqyfAAujqgB4XL4+xpA3jrsBpie2C
	BjdF6ZKLbDsKnmHYXmc07Rv/bKSb3Ajox65a12QzHKA/XyTGR5IYLTk/4YfbdjmXeyJl5FZIKT+
	O28vLvrQDJ1b4UmkFfr/NINKNa5spiqrCIaziS3ikCixpwl7bX2XRQpLAlJ3ILW8xlCa7C3dxUW
	ikbnwy0BSMDfWzRLOLqIROnXwnUc+QypkfgjzusAMpi6XwmR4aU=
X-Received: by 2002:a17:902:ecd1:b0:224:c47:b6c3 with SMTP id d9443c01a7336-2280481c9camr41533015ad.6.1743085731293;
        Thu, 27 Mar 2025 07:28:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/iTJmXtA7oQJOiMowpZ6dylDXNvkGc0a/oJ7ovvyyVXERJJrgqusU+LzPr3fNrvNrbKPw2Q==
X-Received: by 2002:a17:902:ecd1:b0:224:c47:b6c3 with SMTP id d9443c01a7336-2280481c9camr41532715ad.6.1743085730759;
        Thu, 27 Mar 2025 07:28:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:7062:5f5a:bf69:400d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f6725sm129121075ad.236.2025.03.27.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:28:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcm2290: Add crypto engine
Date: Thu, 27 Mar 2025 15:28:42 +0100
Message-Id: <20250327142842.1138203-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e560a4 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=gjCkitBQ8UzLeNF7HDgA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: I7NpzHU-xrdNdwL0K2iF7sLLkPJRnQre
X-Proofpoint-ORIG-GUID: I7NpzHU-xrdNdwL0K2iF7sLLkPJRnQre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270099

Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..c9ac06164d43 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -749,6 +749,34 @@ config_noc: interconnect@1900000 {
 			#interconnect-cells = <2>;
 		};
 
+		cryptobam: dma@1b04000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x01b04000 0x0 0x24000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x0084 0x0011>,
+				 <&apps_smmu 0x0086 0x0011>,
+				 <&apps_smmu 0x0094 0x0011>,
+				 <&apps_smmu 0x0096 0x0011>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,qcm2290-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x0084 0x0011>,
+				 <&apps_smmu 0x0086 0x0011>,
+				 <&apps_smmu 0x0094 0x0011>,
+				 <&apps_smmu 0x0096 0x0011>;
+		};
+
 		qfprom@1b44000 {
 			compatible = "qcom,qcm2290-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b44000 0x0 0x3000>;
-- 
2.34.1


