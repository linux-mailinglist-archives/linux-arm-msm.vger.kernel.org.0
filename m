Return-Path: <linux-arm-msm+bounces-86151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088ECD5324
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92CA330566F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADCD33A00F;
	Mon, 22 Dec 2025 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZ58OXCU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yw/hAgma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7B233986C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392151; cv=none; b=uB1w+f3V5pVu3hYMJjUCchvplcS/4xKFFXi504xz6TyJ7JakzbqTeJLq04+fGnITnZB6wCBVfHCzRRH/7Goc52dOgRZfcNo+QR2oo/SmaYvAVvk/D2SmF8xtvDj27GhR8TRzyDUhOi02KqI3LDgAWgxjIMK4ZkGdAnrLc5lRAao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392151; c=relaxed/simple;
	bh=PvRX6buVf5SzAEhfOLc8YkXfXVesNH9qpy1Tkh3qFcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n0QJhZUprVFnvTxz01Y9YofpcY6jPjLvJUzNKQG7VkDRhlNqq6XtQnWvTy6rhb1yHVtP/n8Y9//dA3mYKkVuOsWE18M18nk0EMF9dWfQVucWWMFA4XAjbOtI6YswqUBOmYtjE2vs4yhJjibPbSIGqHRMZ3KqlSH6Gn+/cfmITck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZ58OXCU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yw/hAgma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7oj2M043429
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBnihOtFbK8HujBlcYwjs3g6paibvwJ26w/d0W2YggA=; b=BZ58OXCUdWQc0D8W
	1Rf1wGDbe4V69gHJZw3fusqm/dqbZSizmlLbkn5jOy3EPhEDeMn9Vy39ua2sGQOi
	dXPSKFEbodLtn5hGRHeQIl/PVKMWJnJt8AGmcDNIdQTDc0pdWK6HQ13T+5JknAmw
	k3uCpbCs1Ct7OfZYATvk3jXlugQ7M9eBmsy8dQGeZKnXPpcd/tC0Fmsf2V35zGmB
	MLznRoE81pXQqJ4ckwyUf4AW53VJlT2zq5KBqbkzKpQqcCCtmY1un+13UIZniWyZ
	Ky/IoA8VTy7D0cVqD53CfBFm9hCN+MjL6ZyKzIBLzSOISqUUMLEeqtaCP9Feqn3s
	pG9PpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubm96k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:29:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bbe16e0a34so903980485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766392146; x=1766996946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBnihOtFbK8HujBlcYwjs3g6paibvwJ26w/d0W2YggA=;
        b=Yw/hAgmahL19YvYu1R7ekpxfVJDWdMvyTq+5ty+OT6fPR5Fc6c1LepFXnmp/8GhOTO
         wmu9o+zZMe1MQcAjX9Lf5bNdrLrj0MwHPoOO0X/ZFuFi5mfltxIQQ0GErNLrQ3OgqZiU
         CUqX7t/ZB+WE3gXC9hdvKEokHziXrznStAitikgxITF2CtuWNQ5Cuwyit+AwOAnNPvKv
         fvmNBQuKTNYm/iIQHlM6GoXFgA9z9VUr5ZypkjpWxoBNoz6OkXvA5VuRFbnu/fcClpMz
         cUqWy6ldXFYRwSADA4QRAdPUs4/BnT/OtnZmZU1xcVAreoaJHicxhzYhrfq9T0+GoF7d
         w20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392146; x=1766996946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBnihOtFbK8HujBlcYwjs3g6paibvwJ26w/d0W2YggA=;
        b=WtDDx37qd4rUJGafzjVIRAvRUqDH0w9sZurBjgcFFIoqaU2VmCprbgPigrr/Isoqcw
         CuHrerZKk/JOs5B2T21/P3U/3vyyfp6TEq9crZrZHYdWqyHIjT/+LzmJOx0PYgSIYX73
         XcL3zpavvLo6GE+3jdDc55OiWkeUHUyk8ZPG6ruOX2gwM7a1f9ywTRIS3dwsv0zzSrOn
         kdz+NQLlOlKSLBBWheCRqu66dka4bTD/zAYOK84BH9bhNo/418KRUvBbTQ6++InlRMpd
         btqoPWuCtxIobbk3RgpTou35x4L6FvGqc6AgK7p/BV+58L8ONQS/XKFc1Ohzn5DKHWtv
         87XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK2jSDVAUt7hEk1F9bRUEcwfBVriwcHF1IOJ1TK2sIuXCTM5sF3BYTje2tNcpW0898C6UnP9Ac57qvNcnT@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSodpf9keSQXVY9DSlNC2ozmsedYUGDPC3wbaTnIaQWDOJUl1
	FmqbVdS1XLdJ3IaSEzykhd3/8WOraWFLfLv6TI7Z1fwy++1NN49R555XFBpuHesrt3vQsrPoW/2
	32lWkO0SBCnmh4TDzT+Nbi0XIGBYz1eTVMWGDRcF0Ft3KheLhOM6ybWSIj98YxdcgOm92
X-Gm-Gg: AY/fxX5L1FZrmh3nTzHCBBbfrCKbRwgisY+8OuqHEGX7cWbDe1D/nckHtduEVOHAqLK
	p4HXNtHsC6axta468JF8nT4V8EeNuRQ8vqXfUtKPocrTXOty0lavfmNjmt6PZMM+QEKogEbW5jf
	4yYzHt0h993dIrbxFSLXaZDqNPcrX501was1D6CMWvSa2pXlmkMgj+4J8LDStgYyoDz1Ij3GpjJ
	+aYeZI+V+43bs5M1WJe7Mcc/rKYf598tZ29xarIFSAIhi1bju4VpAUXugRr9Dtj72M93dW3eV4f
	Fv3k36rrnQwys43lye+dr3vz9XjzD9QtOLCCB4F/+CEuuCu8GmwNu4KBaPHtcA1452VGLie3PrR
	rJ1bA0Yd/btXb2823PdhlfyPa8Swn/Fce7BeT9e3zFY83g7DDWKuvtzh/nwlWYHyyE/EFajNbKA
	UI
X-Received: by 2002:a05:620a:29c4:b0:811:8bbe:7a3c with SMTP id af79cd13be357-8bee76c9096mr2066093985a.23.1766392146414;
        Mon, 22 Dec 2025 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzjlp5cT+8Lby+0xl3XfUmmXEv+Es/HLnbIS0DA46el1a6iXp2tjSKjdXA7oB1bvq9BCVWXw==
X-Received: by 2002:a05:620a:29c4:b0:811:8bbe:7a3c with SMTP id af79cd13be357-8bee76c9096mr2066092285a.23.1766392146024;
        Mon, 22 Dec 2025 00:29:06 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f8572sm764046585a.25.2025.12.22.00.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:29:05 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:28:41 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150-camss-v2-3-df8469a8343a@oss.qualcomm.com>
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392123; l=6661;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PvRX6buVf5SzAEhfOLc8YkXfXVesNH9qpy1Tkh3qFcM=;
 b=m3uwHTIzqYsYrJoWS2TmzBGPjk0+cfRZgJsGEbxQDIAhV4TeAQnD1/Ckd9sem0TSxxVJWjcoV
 A+rdtunTRKLAh07dWRStSEVZm+6zo05F/yAIYAi8/nv07nH+8s2Yca6
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3NSBTYWx0ZWRfXxFYOA+w4ToS+
 LV04jsRJv+sCfKFGlVnqQuqBW55mw3KSYr/Hq4utDEhWfEbFEqHZNgPMLgkzfNFZCtAN4xDFUuA
 D+p3teJKgmSlaHx3Hs2WKfFIn8F0zAKyiFeWIVccTMUyBB7s5XczWLtE6Sm0vPo0TXodMZW11Ev
 252sGwFuRTLNGmAOwdifq/EZZtJA6qgFpI++okryj/BouGsv+Xdfy1fmu1qBF3NcAeNJpoHjJPX
 Cf/71xo1D115PxFbBZdxl8hXAko4oSTK5EkbLwTGxhSwk2R67ozbAIbaor2SXiu6Cdfeut6oNru
 jNNolMGSKiwNOqIJcec1zd5/iffH/iwFbJK76IjnrCUFC1Yra1DV7uMNe+jeA9BySWkgNc8D0pf
 oHhYaZJ2yvtsMdOuOxXHVsMxkPAC+j8LoPZ+mjc1Hk4r0twkQ/qhf3JTxh/fbxFPGCNYN/MdvNR
 LRYibExWzuBzgEaQorw==
X-Proofpoint-GUID: CwxK_sqWoZqFyo4WSnKcldo9M-hP27W4
X-Proofpoint-ORIG-GUID: CwxK_sqWoZqFyo4WSnKcldo9M-hP27W4
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=69490153 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220075

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e3136229f9015d49e2be22f6b28f1e842f4..61c01bc2e4ee143097bbdb7416da7a8e0734be64 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3785,6 +3785,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf0_mnoc",
+					     "hf1_mnoc",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,qcs615-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


