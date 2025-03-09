Return-Path: <linux-arm-msm+bounces-50726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E3A580BF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 06:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF7D16BF63
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 05:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08B7157487;
	Sun,  9 Mar 2025 05:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vl3U9mCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3562B155393
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 05:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741499175; cv=none; b=pFJxAa7CniiEgVBpNswXWKDs+oyVXg5tULK2QhfG/CJtVf2ypjspJKkQX4OUiu0PkgcZHILveSbB2/wsgOfKZa9I2LCHg6V76pWRdSw/YdgzN9sHf3RX9ppYtnpg7oG4tSn0LNrIei4IN6SaVyRYyq576wP+lQ0GkzsVZ+/tdsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741499175; c=relaxed/simple;
	bh=s3bIi9NJPl7GvWtItHLAYMBhKKwwbJNGn6/L6WX4Qbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WezydxuCX/7G1ZvoG4+zeKXpAW2BOahgvyaLlU3D3Vyry3vd0bnG0i/SKmMmxCpHSqepvh6UeoM0ctYr2wRTzKsSoB0ni3YwV/KcnajjeKB1vBia7TOUCllCSEKVSb4U7nEPZrfAQy3Gbw5YLvKd79815jVCcQ0hCUW205E3Zcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vl3U9mCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5295GhIK001478
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Mar 2025 05:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzVhPReZf2sVqu2mJY4+qLpMOX5OmiFM5s04YydtgQI=; b=Vl3U9mCfzSixJZV8
	kR4jnHrcp8gWec++MJIW106LNOzBsk//1OBS7FDHsBrn9/bfsgc41OdOvUIcJ4tt
	pDP5OVCzvLu6l4r8VdwLUnen6X0q91liAAaL2DQbIKit4JwgMmlEmObTLOZsm4fQ
	8pcn5ZvgEU1lq/U+y0gj6hKaHPHgJ8E8kAg0654F5PPskMfcMB5vhhkuXbPzJJdL
	VDMUbjRK/pyaC3iH+g4kbLBmVaGwRcHJBUO8+xitZFPbmNo8zZ3cDmrZ3TF4/Ecu
	zslgnNWTHKHd8pUaub5RP+/hQ5SDKhcfSQd4d0nisF2PithZQX5E+m5JN6+o8dGU
	oaxJOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0psp1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 05:46:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-225429696a9so27412055ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 21:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741499171; x=1742103971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzVhPReZf2sVqu2mJY4+qLpMOX5OmiFM5s04YydtgQI=;
        b=Oj5jM3tAyMelYeMosB0UJ3LZOI2SJILwhFJG8hJ+dRqZ+ZZ7C0RzVIPbblccpuuNfL
         AMwZny6zqWZYOY7AJ98Cki7oKyahXy+K3Tv0yp+7Wm1I9ITB3674FEOsa1MGCsh3/909
         cXIz2ICssHOvJl7BZsFRzFzUXoXoflxkEKI1yNAcQcKqHpKylrOFOcJGLBQu0n+EKlVh
         vroZZ21ibVMGnrcHWMJBQYNMPPX/lA5tHc8HcNEtGJ8M8Oh4uPorkriPG5vBiRIPYnKr
         Itmnw7d1UqWAkGUMVcF6qsRelnhEonhJN8neEQ5tqPD+y/d5Ooy0kZUaVBu8gPq86xZ8
         XNSw==
X-Gm-Message-State: AOJu0Yz29kPz6CQX0uqsi4+pwQpsUD6R50kksrGHXODsdRCqAyuRd1Sn
	jiSJOOcymAXG4+VPcZI3rZZWR5/eXzXYs0Vw1gezYy/Rv+7yrhHGR32c8ki5AsD+0UvT4p85xqf
	nX8irbvZ37NkgJjKSza93Rpu4mlLnASlvLLodDIzrffF7HMU++rnQWOYVjCE0AcR/
X-Gm-Gg: ASbGncsfkWo2X8gW1/o6X1ZlBCo4x+CNwjdUvPw8SfplegBbmsQcbFuXlqF2HKuoJCG
	ZHd6UxUf9ePpEWcaaOFP7tI2w6rG6A0VFkph9JPkzA7h7r6HIRJOppYnadzo3DEhKZkq1Zy4H7r
	h0M5FhCADR0snGc971QDU5VE2jaWljXIZLoKpn03Uzkksk1MIyFeXTsrBEs4F/uqpWyQ/J+9uyT
	ZBnOPyrkdG5fqbZkRNYA1gSbev3I/oB078yWIbKCL9CkM688rO0y48+exW4LSrsM1/E/q0sqgM9
	GHqZUj3ONfSk/y7tJ/h6SOKFIm9OEX59iwssOLjTW7gmdR8QoXc=
X-Received: by 2002:a17:902:f54e:b0:224:7a4:b32 with SMTP id d9443c01a7336-2242888b350mr136722075ad.20.1741499171544;
        Sat, 08 Mar 2025 21:46:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3bg0rW7rtDWMCRe7tmBqrbNnxpZ6tLtGVRRwzQJbS3AtIPLP74RL7wxV0A3XhS7GK8/O6SA==
X-Received: by 2002:a17:902:f54e:b0:224:7a4:b32 with SMTP id d9443c01a7336-2242888b350mr136721835ad.20.1741499171165;
        Sat, 08 Mar 2025 21:46:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddbe7sm54887145ad.32.2025.03.08.21.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 21:46:10 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 09 Mar 2025 11:15:23 +0530
Subject: [PATCH v5 1/7] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-ecam_v4-v5-1-8eff4b59790d@oss.qualcomm.com>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
In-Reply-To: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741499159; l=2049;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s3bIi9NJPl7GvWtItHLAYMBhKKwwbJNGn6/L6WX4Qbc=;
 b=D5d0uujyVuCC5S5h345Cga8/2HZHU6ubamWgpIroAAj/12dVHqTSHFlUihS3mr6t/tD0bJZaZ
 EHJVPUsgseAB3dBrih5xvJCxwABnWKNSX2aXGojz+k6jh9+TT5RzUrB
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: gD5JVXZrz2xe3cY9uZ6wgGyGIPxYKxGN
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67cd2b24 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=3vADZrDGUz89oz24Pk8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gD5JVXZrz2xe3cY9uZ6wgGyGIPxYKxGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=711
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503090043

PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
maximum of 256MB configuration space.

To enable this feature increase configuration space size to 256MB. If
the config space is increased, the BAR space needs to be truncated as
it resides in the same location. To avoid the bar space truncation move
config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
iregion entirely for BAR region.

This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
of DBI and iATU register space in BAR region")'

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b..64c46221d8bf 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2201,10 +2201,10 @@ wifi: wifi@17a10040 {
 		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sc7280";
 			reg = <0 0x01c08000 0 0x3000>,
-			      <0 0x40000000 0 0xf1d>,
-			      <0 0x40000f20 0 0xa8>,
-			      <0 0x40001000 0 0x1000>,
-			      <0 0x40100000 0 0x100000>;
+			      <4 0x00000000 0 0xf1d>,
+			      <4 0x00000f20 0 0xa8>,
+			      <4 0x10000000 0 0x1000>,
+			      <4 0x00000000 0 0x10000000>;
 
 			reg-names = "parf", "dbi", "elbi", "atu", "config";
 			device_type = "pci";
@@ -2215,8 +2215,8 @@ pcie1: pcie@1c08000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40000000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>;
 
 			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.34.1


