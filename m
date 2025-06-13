Return-Path: <linux-arm-msm+bounces-61231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD23AD8F19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3132D1BC3CB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7422D12F0;
	Fri, 13 Jun 2025 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CD6w4KH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D011C3C18
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823472; cv=none; b=pnt3Zg7FWByp6pV4zFh5sbTytxJGPQXnUl02pW292Gl73+XNJORfPDGD3P3bP+07v3fh6H6GuPfgc+qJoP4H4XWOEjDJoJOSP1mWTQIYiCOV4adl4cm8g93w9/OfrDWAlqO5Q2mJN8XSoe0IbMWJk9FfhAmTOHw8VZu5o7HCWnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823472; c=relaxed/simple;
	bh=ESY5GP2xLjO/uuUBIZdrZi4e7ID7ZW6MKv1NQJpQTqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hANbv/Ln/0SpQCsTSMJCbBfyEvdBdRSty9niYrtBBqGO+FSGiA+LI+6+KqZ69EM2vXLjabKh5snOx/lIduf20BPcWGKBjyaB1KwUmXzUfhn0fXNUsCY8D/ILFWfCsK5Qgm3UAC4TtPZ/qnZSHx0Lx/5nMhaPM02yeJU+Kxu5iaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CD6w4KH9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCH3xC002793
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RsM2hPD5yCf
	EMigxxJenV5Fcl8jXieeQmSVNx4nPyPY=; b=CD6w4KH92tYbGASewlIXtdsZ4x/
	xAIBkOMmQJGk3tgeQjTeAyyVuq+yeDXH09KpCRbl1HUsCrHyTAbJepsOlHlAYwRr
	dkHORv82z/b6tTQCXrDKg1apZ04CRcJ4uDvfavruZxHdPkMA9ehv3Eqy1I5uo91B
	V3n7cUeSQGWQEx9bbbQ6ZurW5Pj9fYvOo0/OLaszEH65lzVxV8qJS1Qp8djY1+s6
	hAM5TlSKWGCMuIW4eAtd39umQd2zbUBDwuDAeRZnt3e0fslBPc/w8BuDGrEb5i/o
	8OC3L8Eb2G7hfUpWBp5f52PFybPNRXLyy0ax2SLKzYE1e1MmgaAS7A+jMYA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpn5bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:29 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso40911845ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823468; x=1750428268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsM2hPD5yCfEMigxxJenV5Fcl8jXieeQmSVNx4nPyPY=;
        b=RPNdeOMBcJsSIDdb2woPuY2iOf3FiWgIV8Zif/aZ2Tqgru9AF/r2YELg2nERJ/atD2
         sWW5//59p4Aw201JW+sG+4ifaVlsy5O0t17wfy02ju7turZG9DLYIHgpymqgGpxAIXWA
         cq/MGiXl/CXYH6JrKZFyqsVlvHhKoSkqLiwfiA66ZDe1PZFsqFNOvEaBzNvj6OBUdC2K
         8TNoxHbr0+1PPo0QBUzKFeIUDxePRibx4Mf3YIDNqraQQmjxtRAdbtn14ce3NP+flEtp
         dDsPEnK4E884r9vhrhygtgt8nl6oooKfly1ojo6B9a5YAC/7iadwDig+vuP8bE4odtxV
         C1lg==
X-Gm-Message-State: AOJu0YxKatdJzT3r+kJnzkA+CEEjNve+sPmZPXrWzIJRoz/K5F9jZDGW
	TuzqJKVLY2OdbOTrCNAIes33Za7+OWKuDGvfFkeMN7dgrldT5L5jng7cJULm8Wisg5BiEQIqBU5
	wJlIPLckNCbD+W5A3F62q9BQ0oGtQ10YsAXfpdb9mKNJAa0CgElkE59J9wpasQVJeGjAp
X-Gm-Gg: ASbGncsnpvY6MbJoN32DS0a9Zfxyc3n+i+cW/XJW6NS8BZz7hWBJniM1m+RBQDpIA8+
	JzHrqpnOLqnuxupoT8xWtXZBelX7RK6p/NOYvaMqKtH1hfrkBWbhY2zV07KWXa2QWM7uL+4HbOE
	aQ34Z2pVVYWwoJnp1cowSJ2JCUMNWP8BHuy7Jiu9w+524PBx5nfBBMfopsFnnd3RQ7Ly9W3tyaj
	H0nHHkuQ4f8E63EQH1Brk2Z0d1bLkEwmSM96TZub+KnJQuNX4qHu4NH4sW/4ClxNXSlAtd3d8uL
	NyuXxgCluiJ1MbOrg9D07dOCUGZiDYTjXfbNvqhgpvbFTmlp7tYvt+2V+D+cV0F9R8X4KLa+ak0
	a
X-Received: by 2002:a05:6e02:378a:b0:3dd:9164:906a with SMTP id e9e14a558f8ab-3de00bd9d7amr30231205ab.13.1749823467945;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDz0VH3Av7q60En4HuuZIMYCmq560Rv0gKSCOnab2gqKJsosMfxKzcNjWbSyhrF0ZVHcNOeA==
X-Received: by 2002:a05:6e02:378a:b0:3dd:9164:906a with SMTP id e9e14a558f8ab-3de00bd9d7amr30230735ab.13.1749823467257;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:26 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arch: arm64: dts: qcom: qcm2290: Add venus video node
Date: Fri, 13 Jun 2025 16:03:59 +0200
Message-Id: <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gVI7IQ8J4-_EBcB2v4e7f96MBe79RWew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX/XSr12d+ZLG6
 ukr4awJJIS04cIJXJZMSgFZ8vye+gM/0uup+/lPg0Mq2KAtCdZ2UGiMANH8Ua/q4zqGfgAMLZzW
 CdCkTfLRFQwgdAVdJUYNQ6dccckmSKRfEW/jkIrKxPqmV/Pk5KRm7LiMzQpaPoy9CsSr9LmgK2k
 3x9SPd07txiGVQERTHTz1MuoC1REO+te03NWekW3jTyKGIDp5j/YMRxB550v4vsntokZa3WdaAx
 EWq2vHL4tHMd4tsXzC4/YXcpN4uszVAoEy8hETNSWYoqP8yailkUydxa8xKTinkO6IgWEJGZLPT
 BSqXqJ2TsiK6cqzocIVwzosilbmR7Q9S1YjpdszcdeW8SCRIq4FquFKBTeO9NzWlqUH4NT5iVvs
 HW51cQor29vKmiC6QumAP6j9G5pfRT8W4Z79RLmX44/lCylB96BGkrjARs6PGurFQN2R7691
X-Proofpoint-ORIG-GUID: gVI7IQ8J4-_EBcB2v4e7f96MBe79RWew
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684c2fed cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130103

Add DT entries for the qcm2290 venus encoder/decoder.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..af2c1f66fe07 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,59 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xff000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus", "vcodec0", "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus", "throttle",
+				      "vcodec0_core", "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xE0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+			interconnect-names = "video-mem", "cpu-cfg";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+				opp-133000000 {
+					opp-hz = /bits/ 64 <133000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+			};
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


