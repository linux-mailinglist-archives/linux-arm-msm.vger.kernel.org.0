Return-Path: <linux-arm-msm+bounces-86962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB52CE9AD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79DE2302CF42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B809227FD49;
	Tue, 30 Dec 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl4P3y3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGJQT0yM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE552EBB86
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098053; cv=none; b=eA3F2prj/1+v2lkxVRchV0uo6B2Nv7PgaEgdpNShFgHg87fTEnhfThaQ7q72PMuGgcDjHjuoIdS3PAyHo7tXFBe43+zMXgvrZGyvYhWr7uBIM1Ef5Pu8anhibe5DBNELMU8IwG37eg4frtDfM1dJWC1xtwPq/Vbte69lkzWPazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098053; c=relaxed/simple;
	bh=PYg6EoipE7rAzwP53stsNsrC40CIOOdaSBG+fYe21P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0ykxhrF/ia08B6I0aX4ezYxKZiv6VwaN6fzLXEYjKmsOEU47UI+3CDvEr2/Lb000N/baX+nZ30Wdxxk17cFCRsb7HXz0XCAjialwZRRI5b7nPIDmQc7iJ8h2ldJLWlBb9k283Y0wfZnOF8pgKt1sNtXgyfkbGE2V7imFR+xfWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dl4P3y3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGJQT0yM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB3w4o956498
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTjCczxQCkLPK+WbOPH5ASioIp3bZ0Vd00BaHxdQa/M=; b=dl4P3y3IpZiPrazE
	b1D31Q2RUYl4c/3P84/+48wx1jcO5u8fDRX+v7xIkZgu/uDwfyIrrTjCH7HdhtgB
	KZHrAoBIYyvX4/A5zTcmEJyli+cpEVVditFuXSjkIUHNZXtZS3sWxqUCu1n9HR9G
	1aA1o8xm6C20+3Vu0/lC1JLzQvCj5V6/A6iM1D3P5sTPMFyJ5uPXg/8+bUOnzSea
	YxBzO7mLGy6YI5FvLdpgux6YQaG010EXGbnS0oXKc6Fc6FIJ9Ep+3iaQTaEWhJJ0
	QecX4oZ5XTcofZlj5buLNBwVeyjSKwHk16wbm1C0W3Fx6XhQDF0TaG+r/uwhu6+e
	k4Hxzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1b4sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0c495fc7aso143532425ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 04:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767098050; x=1767702850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTjCczxQCkLPK+WbOPH5ASioIp3bZ0Vd00BaHxdQa/M=;
        b=eGJQT0yM3v1GhnQqqH5WFAclmCVVHqnBV8DfZZBum4JJ+PyuFnimMBe24Gt6verUNp
         5PV08g8XGQllIhPvPC21twQPamzdwyYlMrSWZ4QpLpLQ5mbUUKMantvmQhwDMRQC+RAe
         lX91ssxLjx6fegBnF/SxU06makmUTYnNkxyizruRyUix6VlogUACjE565tzT9b/agB7d
         AMGISi8ExKR1viZ3B4jQfO4YLbm6qMAEcJ3dq1j36FyGtAaGHHshZQBTztrUtFyJLNUZ
         w+J0Q8arU/l9i8+/4hgB4eEwxxc97/6NKJqeRWLR5v52aWFsxI1JPJmUSw1ipQSch12U
         TDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767098050; x=1767702850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTjCczxQCkLPK+WbOPH5ASioIp3bZ0Vd00BaHxdQa/M=;
        b=uaONliVpEU83AYGSXPjUEzLdFjPuHgQoXU/4qV0Su+3AVl/qJgfApeq7oHjhOIfYFI
         BEAvrLR1rvi6a8yPoqfmFVYR9fCEMzZx1MBHHkagGMqBrsDSJccmpm6NrZTLOucSsYhf
         l/JBESbcEiA8kOfAc8AqvJAuaanT6n1SdqusjnlCiphf/2yQeIESP2ovOnYZeS4FqWV7
         hgvTOts7ox7YzI0Dx1aYMm+ICHCHTHLGx0sGoL84/2KTQag50v7dHIMdvji7ADL8imVs
         PA/r74K0LbgjX1sVh5yPV8ybvPucoZer66IoN2lMbG+DIelx2sS5/enRzQTEw93IH5UI
         jq5g==
X-Forwarded-Encrypted: i=1; AJvYcCUGcOO+C0E7IlXkelYAHpedV/GM0TtDI+vNC8sLPEfdu+unlmg2FtHmDcdQlqzw23e8Hw83FlzQJEI7plyi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6qaFqh9EuRw6FbT7R2ZV94NXqUYddJkrxDFMOJGjxqKbZPAE6
	+NFBFjz0V4UkNQyphse0YmR3FWau4W8Vgjfd0Ach4RoHgHPQP2WzLiS/brj3Ma6NdXosYOwiXfd
	DsPl5u1cRejXgH2c5wECz+OrDdpkHL97uv8qDDisTxq9OyNgEtwGJQIbFx1Ch4BG1BEAf
X-Gm-Gg: AY/fxX6SLyOMqHupGrRpuhMc7/fDcz2eajBegoJyAxgkubwEvWBmkPjG15YxQj9omlx
	MIU5qVdpO0gifHYZWgHM867kAyblDjrYafvP1C5JFefxIWkkDzfkJY65jEvZpYP6MRrukdf9gLL
	EW58bBC2eb5+0qUUineYteV+e1jUEK7145u5XdHu0NNoFK0vljhIG+bn97Nwm0skML7zh//TMKB
	pSpzu7LdafSK4ZJ/dqKrjtCQNPAYZMgCoiKQRDawkQ+J/AbY4AG3qXEQBlg7JbazCfi+qf7/yAK
	V/GbOSMU72BLwr/YuhX0LG9wJAGMbsc4kHDPidvpk+ttU+RRFY8Jv0fqC7sigtWY+Nj2CXojRBc
	//BW36nK2VETKRPW3R546L8o/wmDs9PSl2A==
X-Received: by 2002:a17:902:e5c7:b0:2a0:be5d:d53d with SMTP id d9443c01a7336-2a2f2a361c2mr339112275ad.53.1767098050437;
        Tue, 30 Dec 2025 04:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqfJN2cDWF92584+Re8lu9EnvElmXUCIzeEsW46GW7kzA49cBbpur4men3WRQAZBhkjEfkVA==
X-Received: by 2002:a17:902:e5c7:b0:2a0:be5d:d53d with SMTP id d9443c01a7336-2a2f2a361c2mr339112065ad.53.1767098049898;
        Tue, 30 Dec 2025 04:34:09 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:34:09 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:25 +0530
Subject: [PATCH v9 1/4] arm64: dts: qcom: lemans: Add gpu and gmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-a663-gpu-support-v9-1-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=4549;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=eEQqZKz8fM0bUMyLjCoySTD/m7pD/4v7DydcvS7v3q8=;
 b=WiGGQTgFluvR4nj9kEstt4ZKHjjLbE6J8pu112pVqDNsz05hGsahiVDcCNU7McHwUCLpiWZqR
 knS9NiEK8UcA5Ewm/ABSM3e8JYXk73MyF/U58CRNXU5gZ4T52qaDdSD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: JysCdS7BA4teSKhXt8sevSh2pEXBTp9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX/spqHjPe4OlM
 oIOaefOWGgIUURBS9+00yo2Vlm6MSNlfe71+nz2yybsLgXWPu55HPWpEl4l6fbsp4Me+uT97mHB
 w6OPgX+3XkS14n/4DCTyuZcdGrWMIZNc7enXD60nj13D1uSkOBDFCikLdOPHvWbPa/17y/XiI9m
 JNbHFVXw7unDM2m3gbAfjHDwsECVB+e5k/1VshXi1UQn2X3YPIYraLX8goHBrHSb8xLM3+qSse/
 fOVaxthEjqQlh6HGxOlkhhFDu4rw8PGXCGlJI3vK9w8f4VxAPwo8HYUqy/l3EGeGTol3S7MNTm8
 KRG/uN+isavxQX5ymksihe+Pe+u4Bm+rYfDFoNyWViVDcvwOg4P18eRT+9pTMKPNP9Q5miYnClM
 pINCC39zuyS0l+lMHu5FBm9UBiAZfQ96WMrFbAK+jgRmi0V/7LbgBR43K+ljoxlkcJ94eBKPCdV
 TGHrRuz/ERyG7gPPOyQ==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6953c6c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JysCdS7BA4teSKhXt8sevSh2pEXBTp9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300113

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Add gpu and gmu nodes for Lemans chipset. Also, add the speedbin
qfprom node and wire it up with GPU node.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..883f9e0ab45c 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1098,6 +1098,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@240c {
+				reg = <0x240c 0x1>;
+				bits = <0 8>;
+			};
+		};
+
 		gpi_dma2: dma-controller@800000  {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00800000 0x0 0x60000>;
@@ -4135,6 +4147,113 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x1fc0000 0x0 0x30000>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-663.0", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&adreno_smmu 0 0xc00>,
+				 <&adreno_smmu 1 0xc00>;
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-405000000 {
+					opp-hz = /bits/ 64 <405000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-530000000 {
+					opp-hz = /bits/ 64 <530000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x2>;
+				};
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x1>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x34000>,
+			      <0x0 0x03de0000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+			iommus = <&adreno_smmu 5 0xc00>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.51.0


