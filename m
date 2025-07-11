Return-Path: <linux-arm-msm+bounces-64651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E1B027C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61CB21C8624E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 23:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7602264BB;
	Fri, 11 Jul 2025 23:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGiwmUys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0D225A40
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752277398; cv=none; b=XFS+Lf8EXuvl8PcIxG1daly0aEazRrHFxjHMovjk9J8Mos44YosS4gdnTEaEMAOxnoa+oQlrUVN8CZMGmFqlPqfikYm/tBCsmEmNoSwlSoI2aW3kbwKkIQ5Nw0WFWLsM6ICftHT4deOZvSYY4nRWiw7EkX+N5UR6JVZbVkkKJ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752277398; c=relaxed/simple;
	bh=o+TxdKplz7IMXK+MXPpI9M1keWjAcNlhY5NAxQmThus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyIEHmPEXFnV0ktqomTPTmh1/s8h6CLk2gmsnrMHKE2SkoWFX+0ZL48af+0qY8JTYgfWcYbgq1+zH435/y/9K8HNhJhH8L8CGS6YxLkNKgbOK+sSeH3IRwkOcRc+iDbqG/+OYomIl6+NJNlybEck37kI93XhAqy+msXhrMDn4Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGiwmUys; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNG441021748
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OCt6BMCpo5v7w/ZAICBixmXIHidhh0RrXTKdHTXIxw=; b=gGiwmUysF5M/RsNp
	QvbJMX3YsNt/rPD53/kEILaFzH/5UF3Aysw692cwQllFe5TI2dZt5BQ3LA4awlaq
	hZlFYBs3olkLuZrGJ7BbhDU4/cIdCcQwhJ5DZ/4H663wM5Fu4tlhvBL2ARm6PdyA
	AEDrKKybErlw9w45qtnriHtdrneHKctfm2HEhQsBTXflP5MjizIESqoh4ydBMuaM
	JokfMzOj7TNshoINkXak6TQZuHdf77nmbHW+EkU03nwsgZz+91kHDtvNsO4iuOl1
	YofSg4i53NWUnJrGv6Ff8dhBQ1w/s47DEZKtFGHRT9oGB6TLIBGjXluRr3cP4m0W
	hr/c4w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b5at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:43:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-740774348f6so2159961b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 16:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752277395; x=1752882195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OCt6BMCpo5v7w/ZAICBixmXIHidhh0RrXTKdHTXIxw=;
        b=MMMUkslhrbTJP6+Q+wvvOmzc9nnCVhLuiPeqaEbG9I7ytCwNN/sFeS5T7L2Evy0ca5
         ni7um/LMDEuJ3bPyrci8lbEPiPnoEKFbxziySXn52p/7sV1/J1q07Z+OGHLsshYDC5H2
         Dut7NCYj1Wpv2MkIPg3lHNRoEiRFmMKyV2cBMzPzdqrwvsOwsjdfCptSolNhFevGQWYP
         nEP84SrKj2nUuOuQ+/zCbP0JIqN5IPPFNOW4eHQ1bV6MjrhJL5WOectfYmKvtabVm9jR
         x+p6hIIPgOIEwWHus2Tu5A+Ue0CadQNCppMDfSN3geD7VdhLRq1fHiE7WecS+zD8WGYF
         tuig==
X-Gm-Message-State: AOJu0Yzm5dL01JkG56RC3D9i7GjTM4fK7fMkc9wJ9Z+kpIWU0E9lL0MR
	0/mJpciFGiRCWA001FLmxUycUKje2UwGFp4MJhGfw+Vsxxwi2r+GLmtEkETKB+Yyh+G504abjHC
	Jl0y1+t2K5QIbsrhJcFexF5faSBAVBymrsRKK74bdR+FM7iwlVG4FoxAI6thy6pipanMk
X-Gm-Gg: ASbGnctzPCfskNFA2lM03Qe9mbKxVr5W8oSCmVVeiYXt+A3fhKfbNFcWt67qwrtMiux
	/KSQQdFt7uGu25awp+PO+NkE/A4mHlIzXjBTQMG7+uLtFxPAhc9olvEbemJWF+nx7DeCvLE96eC
	x1HLNFOiGhjOpFwk1MQV4z5iJBymDOjYJS62OBmCRDV87Rlzvxs8J5i40oqquaJFWpF/fdyEAfR
	QliY+KMGXYQqJ8b9MjHDUzCgnhDxoiDROBDFC/nIcLvviAY8ATGHRfNHhf0tFGB8Z3Xo/7b82q8
	AOfrLU84cjsRwljMc+/njAjsZhSsLy3BBeoq9tlXq59hQqDWUZgqmpAtvNOba9yF4bNx5YudugY
	=
X-Received: by 2002:a05:6a00:178c:b0:749:421:efcc with SMTP id d2e1a72fcca58-74ee0baf892mr5310895b3a.5.1752277394904;
        Fri, 11 Jul 2025 16:43:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXejt1aDsFNoUQC63cutRdVOsMdt5NZCZV6i0r5vMKv23uKSleEdP9WbHLGSbKiYefG+m3Gg==
X-Received: by 2002:a05:6a00:178c:b0:749:421:efcc with SMTP id d2e1a72fcca58-74ee0baf892mr5310853b3a.5.1752277394266;
        Fri, 11 Jul 2025 16:43:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1a851sm5869781b3a.82.2025.07.11.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 16:43:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 05:12:37 +0530
Subject: [PATCH v6 1/5] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250712-ecam_v4-v6-1-d820f912e354@qti.qualcomm.com>
References: <20250712-ecam_v4-v6-0-d820f912e354@qti.qualcomm.com>
In-Reply-To: <20250712-ecam_v4-v6-0-d820f912e354@qti.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752277383; l=2217;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=o+TxdKplz7IMXK+MXPpI9M1keWjAcNlhY5NAxQmThus=;
 b=ZWca0Ddc7W5T0rXsIYEqzD9JUgbVM3QMnjkdtO8USzHrEMvozJ7XuYmNl7Y+kfD1Tv2FYNSEw
 S205oL5qy1+AEYJSU4szvvogE6297IfGIGQBIXjZUw4VoIvTEccBMuh
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871a193 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE4MCBTYWx0ZWRfX2wCSpCO2rO0I
 8NQDcTB0ZtoY40K6Lp3mhsgQHGhgQZZIFiMJUgD5JLltpX8V9UanBcgtmgFPk37NZvDCcFsRXhV
 doV5JEyxeIpv9JBDr3yCnK3qGA2xdfCrNWW8A7nV/Yh178CapMhyHgbgBGRVo4G4BL6uk20Yx6q
 PFsCL4NChOCpJvOUy+5ewMV7w9ahtpuXtiQoOdzkHWIZs9wHb31Y4VBXmC5LFxfnVQ8SozXk244
 U6NMzhPWe8APaIUFzpOlkJZe0XqbtFwW+P248IAlcjDGWK/vLK6xfYzFdRe69UcsXQJQBuydqni
 Uv/7bjNOcrU3WSy0bMykSrbgitPCCJNMP9OSBoW4WwqHv1njYzpwh4pofUOuEvn+H9UVO7zJgFX
 XrSunMdZwW9L8wc7VVA+rwSJemTi96eWxWCympvtSsR11FF+tzQIPg+9j1aWRUJABYpFgxwf
X-Proofpoint-GUID: BQGd_k7Vu9axvA5cVyt9J2FXZivPEx2z
X-Proofpoint-ORIG-GUID: BQGd_k7Vu9axvA5cVyt9J2FXZivPEx2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=823 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110180

PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
maximum of 256MB configuration space.

To enable this feature increase configuration space size to 256MB. If
the config space is increased, the BAR space needs to be truncated as
it resides in the same location. To avoid the bar space truncation move
config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
iregion entirely for BAR region.

This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
of DBI and iATU register space in BAR region")'

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index b1cc3bc1aec8b769021cdc25c8d66845e7bebe70..def0254ee0b6ee78153b9b10f534ddf8d6f1b50a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2202,11 +2202,11 @@ wifi: wifi@17a10040 {
 
 		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sc7280";
-			reg = <0 0x01c08000 0 0x3000>,
-			      <0 0x40000000 0 0xf1d>,
-			      <0 0x40000f20 0 0xa8>,
-			      <0 0x40001000 0 0x1000>,
-			      <0 0x40100000 0 0x100000>;
+			reg = <0x0 0x01c08000 0 0x3000>,
+			      <0x4 0x10001000 0 0xf1d>,
+			      <0x4 0x10001f20 0 0xa8>,
+			      <0x4 0x10000000 0 0x1000>,
+			      <0x4 0x00000000 0 0x10000000>;
 
 			reg-names = "parf", "dbi", "elbi", "atu", "config";
 			device_type = "pci";
@@ -2217,8 +2217,8 @@ pcie1: pcie@1c08000 {
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


