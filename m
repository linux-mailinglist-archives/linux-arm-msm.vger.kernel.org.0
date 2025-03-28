Return-Path: <linux-arm-msm+bounces-52737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670A8A745A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141D43BC64D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B40C1B87FD;
	Fri, 28 Mar 2025 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8LLHozJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8E1CAA9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151606; cv=none; b=tj2CFdS8KKlry5dq/hVF0R25nbGug7QcJud7QU3OBnuZdsbmPaVgtdFpAMmNkU0sRkduYBpDfGf7fx1tDMCcMe5dEMji67EufzbxliRfADZ0w2b/oRc11cwakCYAYrWB/FjitsyuPic2rMGnNNZKsvrqM6pr8anpmIkRNslXThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151606; c=relaxed/simple;
	bh=as/nwDc6tpW0x5Rq8lY1UK/LDUF9Ljw4CWXjcjoSyIA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uILYoxytwsZSgnKzFXPlI3splCIETeSNJU3JZNIRTL6ZwK/v62Et167uyz7gkGH1g5QlWeXO1ozZbPvg7d6auDYjgXvHtH3aPEi/VQeEOTxP+PTtviCHMEDdV5Ohm0U3eb+CUOCSJAP/o4WH/kyLi2BuUW/cUMLz4UPp0O2bX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8LLHozJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S0PfZP006996
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VeuF90ZbIxKLHjHHxyB/BcpBXCnucnai8se
	TjlBYVYo=; b=W8LLHozJc1qJgb12tib4EjIobbBjrmPXz8UEPMfIkC1ejCMETD9
	Sjdoy/92OU5TpvRnse3qC3aP6q6mGKwfXvMF64+NbKgQsgJuB0HspT8C8MjMvhLw
	K1bmTM7xIVnjWzuHW524xmKBEHlL0TuKxvQRwfmMEFZ91Zo/91ydXKYpjojaPRmd
	2UvFwm14mJqFpGHhF1gHdJSxaDlOYL6PqAWXZALuweTk30T/Mw5OfWJJgSutz7vi
	xvnp6hTDS9c9LbW8PvxUfuM9zgLx9sgjTyVxzeQXGDh9364UpcAqOlnUPATYsSpr
	UyPk+tLEQbzfjUbPWQ9lnc6XpLMzXu8OXNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj7txa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:46:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff8340d547so3566029a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 01:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151602; x=1743756402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeuF90ZbIxKLHjHHxyB/BcpBXCnucnai8seTjlBYVYo=;
        b=mLMJGhHoMJ/Waz3kD5YSdPeoRx2/Usz+KMSTTkBCe/WwVvBtS6wRZdmL4PrO2sfwOI
         405+nXB2Gx45H2logCw0nHaJcv4VBidoqg5ovrumAhaagEuqlVdP4OSPuNVao8fa0HkU
         9MA+Riy5Xpckx300kLUVloDQEMctJZoNgQLfIFUTCzIYFK76T/Ak5P6YrrxpsNXMCm13
         rHBnmWx1m/zVW+CgdsuvChr3PKeORal43bQQycnB+RmEvWWsNnriwG9Xhu2kxW+lqhLu
         sKF7T+IdghVYJGXMk1b/fkObDdtWdi/FuXLCxF+CyYVmlokfHJ0Rx2Adg6PhiRA0terU
         CmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0VcdL/XphTS5qM5+PLGIJw8wv8yozVCBlYw/TgIkrNMEpXDSVvTekbaOq9nJFjJQgOU6EDtJBzqgL2TUk@vger.kernel.org
X-Gm-Message-State: AOJu0YyAxcc/Bc09zkPv8xrUBUF6WkY+QpcPMQWwOGtx+MFehdHKGkji
	wdHYV5sTV++ZM9E/HpGhdmBaq0FmKE4r9Ex769pdWcaJc5CQr4Hu5BF4H9352D1PLd0yEqpOUk7
	tdKQ1fXxVfJMDofh0t2YuEOTL1Ngl9pLnGm3ZO0w2OfqDclX2XNc2qnJZFvZNZwWP
X-Gm-Gg: ASbGnctM1V5eJoAbAY8nftkMFc25NbIa6yhAggnmoM8mFxp+9GnjGvqavK7yQeTtP5R
	DpCqi2gXf65u60DHKn8iUBXPjpi070HnREQgi7SkE0mFmDq2wgkJ4xdftpilWTVU3VOygjy9Kp2
	X9XS12WxqyhdQTfaSdp4WRjKQ/THpeHSB5IyRg6kK+9dr+AJXc4NBqFpYpxARszECNgnE6/y9i6
	qe0kBi3oLyVQCke2fBeR7y9v45Z4Hq2D0YF8YQcSONXhw/WylJj6nSJ5bVSNdl+Cdo+Tql5SRRn
	d4HwlxRE4MLpzyoqvdVR6/ZHmHXTVsyCKMWFh621XZePTtuKcM8=
X-Received: by 2002:a17:90b:2b8b:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-303a7f6eb38mr10648557a91.15.1743151601605;
        Fri, 28 Mar 2025 01:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIXAXo8F17vmdUxdCArQZWMf6OcZ2S+QRE7Rf2hJ9sqvGmbRD2L/Y/wTIuvzG26jsvcouGEQ==
X-Received: by 2002:a17:90b:2b8b:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-303a7f6eb38mr10648511a91.15.1743151601113;
        Fri, 28 Mar 2025 01:46:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:7062:5f5a:bf69:400d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f8b1998sm3595249a91.49.2025.03.28.01.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 01:46:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: qcm2290: Add crypto engine
Date: Fri, 28 Mar 2025 09:46:29 +0100
Message-Id: <20250328084629.1290797-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mels0jQMbjX3QwiqIZFfaGag9ogiBgfh
X-Proofpoint-ORIG-GUID: Mels0jQMbjX3QwiqIZFfaGag9ogiBgfh
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e661f3 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=foE35NVKWDKkT8SmfxwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280060

Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v2: Remove redundant iommu streams already covered by the SMR masks

 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..ffe4b2444256 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -749,6 +749,30 @@ config_noc: interconnect@1900000 {
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
+			iommus = <&apps_smmu 0x0084 0x11>,
+				 <&apps_smmu 0x0086 0x11>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,qcm2290-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x0084 0x11>,
+				 <&apps_smmu 0x0086 0x11>;
+		};
+
 		qfprom@1b44000 {
 			compatible = "qcom,qcm2290-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b44000 0x0 0x3000>;
-- 
2.34.1


