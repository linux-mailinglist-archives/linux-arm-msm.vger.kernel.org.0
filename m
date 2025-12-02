Return-Path: <linux-arm-msm+bounces-84049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A46C9A9D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 09:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8519C3A64E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 08:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C66306497;
	Tue,  2 Dec 2025 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7ErN+f/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9V0PVKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04E2306491
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663034; cv=none; b=DZUfO1b35HUXeEoh5Xiy13Q/RnwZnqBHyTfH09MOslBzRFWRN811rcbSotw9TjTFm3IQ4/Uu+8I/htLByVLdtb34rYIlzJQ+3cLWgjbprmPvOHqsUHGkFHn9q9JYyShNa+Yn/TZTT5OaR3zATp4M2LHlrEKav+kRqDtLP66/ySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663034; c=relaxed/simple;
	bh=/rZ9Zw9P5q/3qbmxoi82/oIr3vjhoJfHmpmawytoJ3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OIku7HGIZO1uH8kG1LIvLEmCg6HKC3Pt8NCqtu10PNtbyUPovqblilSTQCpxVwPzcVP0iecneSW77btZYbK8FDQcLGKvgykH3LYU/A0O8SzChxojAgsrF2Qw2BpU5d4PfsQxeAdZwN7lZIXmtvErGzcTUJTnxGlXXArzv4y8U/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7ErN+f/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9V0PVKs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1MmY5s1926628
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 08:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yF2YA8+WyGs
	JaCPNa3yH5GgghP25p8Dvyz7WNPLxjig=; b=A7ErN+f/XzF1Kzfq15PmwvEF6Ub
	LToOl+VZt0xrEV5awWShB0A8wg/k6yIHOQIurjRqcRjXkIdVsl1bYQ8SHyb3ZT2H
	soctD4AlDDJqYl6mUpqQnPWTPmULDCYPgMl3UYMuS7IcCsrYbbKej0FqCchA3neD
	nGScf4f6YQ3TjpVwXAhLAq2p6Xd9hc0xQZt3mouC8Co9diq84WYRnp9xH7r2gkgy
	KQ+vMyHOExEJQnnS+CPhb4qCpDXaTDT2Azt3pW2U5ausoa2c2Cqsydu+AIhfXume
	16kuh/NtP5B5DBXK2EQjNIiKLV4y+0hwGhzSAz7pChD4ku2X0S9+ksqgHhQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xse0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:10:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-345896654e8so1334427a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 00:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764663030; x=1765267830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF2YA8+WyGsJaCPNa3yH5GgghP25p8Dvyz7WNPLxjig=;
        b=W9V0PVKsDByGF0t7qt5tlJDz0mtdmEYZLn2ttB/CS85+jVZM+QPGbZAAcLkL9LSDMS
         buzKbJasQ0JKRtZ7TZoJ0IsNpgNlu7iDKHiF8t7b3b7YnBCTVC1Ig8ZijYyFI3rcNhHq
         nMhx5jK4q0yGaViGDAVgmZWkZ0oUOzWwm+668EYDEHG93B5NP5O5SOjOpW+xMhhnAQ9m
         YcWq027H34kAA/yfXJ/liBQ0HkpC0ar8vDILah/C+nwfAyBwb56irk8UAiyjSrc18MfI
         pn4OtieeGZsq6qay5BN8yG9Z4TF87hSasMPIDhTWU26yrgSqMWWXqz4qoGfUkY0MPprA
         86tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663030; x=1765267830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yF2YA8+WyGsJaCPNa3yH5GgghP25p8Dvyz7WNPLxjig=;
        b=iJSU/X5fLcOvWGljHLk3CDDrmB7bnedY3660dfabIne/dhcSU9tRz50oZ54nDAKy7H
         V8STutOiByBR9Hx5CPP/h6q/zRQidiitl0YqFbr0AiFRiUaSPGyuQ4RWsQHMftKOpGLL
         qt4BOFsmn8QO7i4jEIDDJZNxI3odaumWqGjx1QC73qR+3d4VF3NuUTOXu+ONqzvz1DCg
         Gpd44qhpGcvo+HyTrrx8LXLgMsojYawlARjcalHOThldUgFU7WKhaLJ46j+6vBdAgEs2
         z2XfTICYtfEhqMvBCEgy6u9kbN2ShUezrt/HrXGCzbLI1Vp7XnuCD649lDu3XFapQ8M6
         XDGg==
X-Gm-Message-State: AOJu0Ywr/0I+wB2Xiw6hbYNYn2Hrj5URTeAkwGyLNzuHharuLpSLKQSj
	86nvPPjsfps+RRfF2DC0kkeehmYJnzPucBqptFKTG+xzZMRz6YwRG3I0EtxD2OKhPHAOJLaqEYC
	eckqO8SopU5QtcAEQMr4ttQ7GfIwo/xwYLUv9zdvWtVt52pHNZOBv7SW4xEAHOYQMA+w=
X-Gm-Gg: ASbGncuwLHniP9sf1kxH0AyMT9X/+nsVpLcaij21NxPsLhTonyhNp+uidUIfKhjXaBU
	lPw6Pi5hvCU4V8XwOevj8GRXS2YKfl68IQigBK5JzbRCkWJHdcDo3ZwgkLrSeIR7Rl0rkN2DmoT
	D6q91z4iuQPkyO4LxBR5+Dq1/dONZzW6vRfxawxA01mWlSwFTlIiuwIOHzWLvsfdI/AAMoHxYay
	R+KsA7etL238rWdndkyIRY8HDqgWfsOWr7vLy+j6C0OFlbZ3GT0fWu+u1qbAUbntjC1R2d7foyZ
	sLGkXq+AggReOADiUUk1Gq/rZbQKiau5vbcGe01lo30dATBw6+ujwxoJXIZSX4GsdHicyS5debH
	Jc73UGYNHxzPiagXqIyLEJosvz/Jfh0DSghnc86DM
X-Received: by 2002:a17:90b:3e8b:b0:340:e0f3:8212 with SMTP id 98e67ed59e1d1-34736bdad39mr23717085a91.8.1764663030446;
        Tue, 02 Dec 2025 00:10:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjjp6wvP6+iG687jfLxoTJfVpMVDF8IUMr1p97oilnHsHCx4GTKb2QGv/IoXu7QkNV+KztLQ==
X-Received: by 2002:a17:90b:3e8b:b0:340:e0f3:8212 with SMTP id 98e67ed59e1d1-34736bdad39mr23717053a91.8.1764663029941;
        Tue, 02 Dec 2025 00:10:29 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b1cbdc0sm15419794a91.2.2025.12.02.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:10:29 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
Date: Tue,  2 Dec 2025 13:40:15 +0530
Message-Id: <20251202081017.2234677-2-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
References: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BdEJI-_ZBluShfc0CVuAR-TmV8gr3mGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2NCBTYWx0ZWRfX/4wcpSKz1RLV
 x23PquKo9YaaPNYtFtwo0QOqir2ImqMPqSJd7QJof43KLf1EaBcz1gMe5+qB0lXgrrioPuyOpjT
 qvRVJ7OPOV6Y53RqENNNI4slvfF+s+yrJ7iAHEWgn7p3SlAZEfCKk2GbjwguMCEA9C+NAfHXxz4
 8jakEDxvnalh19zBQ59dhrx/mwBGk3oYcerP4FO/u1VzKjblKkkitmJKq7aplfdBwVnMKJapzZ6
 +4JDoXdUc6kuBELFDqqbtE/jfDcPcvuFgSmYTmt5dai4ttkwKKAi3cEt4FZjDbrKtSDjITh5qFu
 DnjrvQPvO90Nv48rwkgou6kFHEaiW8Rya5lDNM9jaHtDZpkYTOGrOJegbQAGKTy6gzjRcEKjBfr
 +a3wjLku1/G5De/tzsvgZNUQaVMb5g==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692e9ef7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TphcrQYDqnrjE3F47OEA:9 a=1pVNmwC08rpcPOpi:21
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: BdEJI-_ZBluShfc0CVuAR-TmV8gr3mGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020064

Add SD Card host controller for sm8750 soc.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bb..f23946c9a2c7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2582,6 +2582,60 @@ data-pins {
 			};
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x08804000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x540 0x0>;
+			dma-coherent;
+
+			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		usb_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8750-m31-eusb2-phy";
 			reg = <0x0 0x88e3000 0x0 0x29c>;
-- 
2.34.1


