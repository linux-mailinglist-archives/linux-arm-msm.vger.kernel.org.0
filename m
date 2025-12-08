Return-Path: <linux-arm-msm+bounces-84668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D0CAD272
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C4D33016EFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BDD2F3638;
	Mon,  8 Dec 2025 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FexIIY5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qz9Yjoa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA526246BD2
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197173; cv=none; b=QhbF0xFWlXGQJUUDh2n5zVhg983yfquDB5PzASzNuoTR9aYyd75aEIhOlSeig553E9MExytJiCgUQIKSV9UE/yN1ZIniEVbKbg9N/pGwAEI/+5mcbIeMTALWxtVNGCei8imKQE8OZWFdeaiWSqn05xh9GqberdRQFIpayz+UHZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197173; c=relaxed/simple;
	bh=2r6xZNOI2bcmc+zW7UUD9SCX1TrU2o0bFxHhX82VE3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=naNJfbfnL8nGIRGVzvpl8/3OL1g8kiNLOLHAd8oiJjbS1ybDWbpg5EBCwPsPfPRtPtxa5pM7SG1mo6aDOY/hTrLs49xv8+yNZTEgbbUU9RF2gLK8o/TUSxinRtvy31QVBgKFReeSH+RetrvWpMfMVsCButB9i3eMIQ1GwUDOlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FexIIY5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qz9Yjoa2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8B61oF457995
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 12:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qb1V+S4od2da2VelS/LZV0
	YypLojU003/Ti+q8KzowE=; b=FexIIY5NasKo5L59ryJOnKJDMpMwt9I93Tx8qW
	csEyLwE33HdgXo+qF8bInyVSCnXlJX0Om+adJtnL4yN5SLNq/rBRYkGot1PZFAAN
	8Cev1wrXNXrKB8e3+gBB8ye9OQ1ZTv+GfOaA4sthXR2wJwJsBoIXeFOB9H+yp+x5
	d3FWbQkz6NUlE1oaIdKMC+jDII99sUEP4bkR9P6JMzCDKgUoBwnp6bNART/h6XMq
	xZs4L209np9njW0QsbBSc3XovoxmplMoz3oGJFpIrvcaybG6dbKR6rsP+/9em6t7
	zxdTEEL3gOF/4jjnM65RmlyeIDr9TEQdRuCGis5nrW+fofAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwgmg799-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 12:32:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29848363458so91821665ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 04:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765197170; x=1765801970; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qb1V+S4od2da2VelS/LZV0YypLojU003/Ti+q8KzowE=;
        b=Qz9Yjoa2PYHlBqbln8skXamVig2D09FSTL9Y4E4/mItuxKl7C1KIYIYJIzRIzqkEoL
         RSjPCHEbV7M+eA6M1G/Q97LovY0x+mQoOuikiUetI3v8fo2zv1nmcQNTko20maqNe1XN
         b4muNX2Xubm2chbzaQ8AYIHCTHK3CwMRXcigjda8gkTmMqpq5RJEg+kQDHOY7PoILQJn
         qreabthUVDfZSy7NmqFRyKBm8fBiUPvbsNdk5wO2optiEj9M0MTAcL2LHAe8eMbB3jq+
         cM1roygwnm5WmC8KfGBnS1hrq5kmwRD4QwSYG6bCyRIiwp9+oH61Wb1Ixu1PoxcKtP5R
         f52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765197170; x=1765801970;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb1V+S4od2da2VelS/LZV0YypLojU003/Ti+q8KzowE=;
        b=uHyPE3gdD9XKbkCqV9LDCL6bJJE+JGzvNd6ck+h1WttAvtW7aYkqnppmGpc9PDU23G
         ZKs3dAOSx+vOBYbHPSASD6IDlYMdmbtDnIeCJuhVqdmwt9WjTMCsVJTElmDNEGYvQnnZ
         wxPY3kev55IhRdXbnXhnePf31kBExxub0PnsPSPc5Km4M8zACmAr1vdOtora0+vEaZqx
         EYTHFkkNCOH+exPrVS6pGh4Ug9dTOD6jZvSJXOW1djSAol8hUj6eQs51xoXeKk6YyOj9
         L79CJTxC4aeUg1wvAKClLK67fxvBDwwvibvc04eEsD19Fhqh6cfc/voRdgudzKSbU6OM
         fVlg==
X-Gm-Message-State: AOJu0YyaTWweOQ+7mI/yi9yacDVPdJ9j8iVSkjyHT2cZbntcoFZ4sbox
	0BRId/tqDnZWUgvq+H8o3H6Jjom7ECFSri4bAiq44TeY+MnP6O9fpZla0F6bovGtfDD6vbEjSsq
	CR1Nv/HoiEgWvZpvPZAiDwGHQWPtgB+7K+tQM+Ub2A62jDj2mqp0ZgWPXWh+VLQBZ1KcP
X-Gm-Gg: ASbGncuk1EIvKz/x4ZdRVMkjUOgg6hqRBqS6pGdx8NITCEYzmA+qOdmEgXDFiL+DnxX
	eEkVv5oLM4WhPWmzgigkzI6Qr/+iRCpThoj2CLOdpHMQCenFCXCnzo2/msZRMd4A77SMKWLz2QG
	JwXDrYeajw+wgHMlVK8RHwmXzLLaWaY/ec5lusKJx1CWI5srUHB89teXxgtlktRbZsAZlpipx2y
	G4d7ZJtvRxW3EImQXSeoIxZ72w3cuyqZFKTKYeQR7PLkcZcphp0O3p6z151epCemKEcoEqMAFUm
	wq6tco3P2aUCgAGSUTbeF2yJufrt/eiFg3DFvGr471mDdGY5EhVDbDxwvsdkhS7VX1JAuGAEzin
	O8sQb422aVOVN+wucZwqcp1I/qieJBsGGA5U=
X-Received: by 2002:a17:903:19c3:b0:294:ec7d:969c with SMTP id d9443c01a7336-29df5e09a42mr82943165ad.49.1765197170160;
        Mon, 08 Dec 2025 04:32:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELCCN4B+nC4BiceR1T9bzQClw/oTihxJpG7jqxymSy/S06i+KUAefawyQ2MdJ3l1EhHCEwPQ==
X-Received: by 2002:a17:903:19c3:b0:294:ec7d:969c with SMTP id d9443c01a7336-29df5e09a42mr82942895ad.49.1765197169551;
        Mon, 08 Dec 2025 04:32:49 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6b47sm126069215ad.94.2025.12.08.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 04:32:49 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 08 Dec 2025 18:02:36 +0530
Subject: [PATCH v4] arm64: dts: qcom: x1e80100: Add crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGPFNmkC/4WNQQ6CMBREr0L+2pL2VwRdeQ9DCC0faSIttthAC
 He3cgE3k7xJ5s0GgbyhALdsA0/RBONsgvMpAz209knMdIkBORZCYMm0X6fZNd3cWNdRswiquOC
 cKa1Ei5UsVXGBtJ489WY5zI868WDC7Px6HEX5a/87o2SC4bVE5Fz2VMm7CyF/f9qXduOYp4B63
 /cv89lBbcUAAAA=
X-Change-ID: 20251127-crypto_dt_node_x1e80100-bcb1a2837b56
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765197165; l=2740;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=2r6xZNOI2bcmc+zW7UUD9SCX1TrU2o0bFxHhX82VE3Q=;
 b=JniCNeOfly7P68fo32FcUT1039ivu0J4qsp0PFiABS2TtrB1jsWQVdQbveAMTqgNuha8l9uRJ
 1jtoL+V1A+4CSktKO/qhAZfTJ9FnZvHB8K2fqu5Bm8QPKehBUxTNK+q
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=RtnI7SmK c=1 sm=1 tr=0 ts=6936c572 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dPaM2nV2qZi9JoseeaYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DK6h60hXuqTxyBcMz-BaB2trVTjqgdQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEwNiBTYWx0ZWRfX3F+09mX2qQ98
 /V51TT9BAmu1Ba47f0okURTYiqlmc4Vl9lIucCMIdSo/dHZ6vuwif39HBaYJyxhlQkHw7glf1OU
 dCsMSMEChtCdVJdF61ZbOlyernv/SuCmiOvhLA4MuMh8bJCUEzUpeQ/3bXu1fQmynipHZpYtl9S
 n3bfkVNDsP6yyG7+cdUn9qAbSmV8HZNHlLXYuAmoeFokxX6o5HAbr0BlPOkEnibcCtW20ovaELb
 V0UPzh+4uORhCT39lEWe61SfjEgzpwGLoBi0dkCcUmqdM+NdFLqV+/nQpOFkAjTnojXqnkU82Dp
 aQ3oAoEvttDJYXfNpZ5EjoDGPBe9LecXa9u4i/xNuOaJ4jQDkXVLgMZZW9W9xkJj4LjhlJzduG6
 T1jkKFa2eVK5zE6W/pm2oT+N+wjXlQ==
X-Proofpoint-GUID: DK6h60hXuqTxyBcMz-BaB2trVTjqgdQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080106

On X Elite, there is a crypto engine IP block similar to ones found on
SM8x50 platforms.

Describe the crypto engine and its BAM.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
The dt-binding schema update for the x1e80100 compatible is here
(already merged):
    
https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
---
Changes in v4:
- Updated iommu property to use 0x0 instead of 0x0000 in last cell.
- Updated dma-names property by listing one dma channel name per line.
- Use QCOM_ICC_TAG_ALWAYS symbol instead of 0 in the interconnects property.
- Link to v3: https://lore.kernel.org/r/20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com
---
Changes in v3:
- Fixed num-channels and qcom,num-ees properties by updating them to 20 and 4 respectively.
- Link to v2: https://lore.kernel.org/all/20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org
Changes in v2:
- Added EE and channels numbers in BAM node, like Stephan suggested.
- Added v1.7.4 compatible as well.
- Link to v1: https://lore.kernel.org/r/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..0ae5242e98cb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3033,6 +3033,32 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <20>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx",
+				    "tx";
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,x1e80100-cnoc-main";
 			reg = <0 0x01500000 0 0x14400>;

---
base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
change-id: 20251127-crypto_dt_node_x1e80100-bcb1a2837b56

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


