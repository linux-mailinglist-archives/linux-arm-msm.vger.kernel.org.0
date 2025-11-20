Return-Path: <linux-arm-msm+bounces-82663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4BC7397C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 11E804E5A14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C3332D7DE;
	Thu, 20 Nov 2025 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wntjfe//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvgqIQTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB63128CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636355; cv=none; b=Caxz25DqauqdX+BNXDyYAApT+HBrnFqp9uWo5zs0+W1gyNk5i8WSvCEfjBn5WqflsE7Kt2c5+/S1GZJ9N2Xatub4cXzq58AhOEtdsRQ9TSeVabRTqnQBXrz/ejb7bZrTbdwhDrUvI7ar3NfcU7M5HjSDC8q+lI04wt3hU8QPAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636355; c=relaxed/simple;
	bh=qIPGenZv9w9DwaR3O0qip5/mmYROjTXdWQ01oiMJN0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngPZvHL0DvBRLNWSDrwHP61epqxkhcfU1RYLR/fEE84xQ5NXGkUbvAX83ZNFTLy4PSVOF9+4Jmc4JOM8fFKcAO6+kYz64WVKUOdx7ocLtvSLwqYHtOJg2mmY7lZtme7Y/ggHetmkO9KyjVh1nsJHqeNbkt9qI6JmtfgP9FcBwv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wntjfe//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvgqIQTw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pRvK3543746
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CDnvoOcC4d2LAqFwcGheU3WU1Q1ULe2num2u66BFRLs=; b=Wntjfe//dwCKHsxZ
	RqBeF2nuHPb0aTBr9AHZtBsV1dD9KnqOzqn2Qk+dZnpCkvUwNVfxVN8cjKJBiS4M
	CI4wDzwD4lo0GbKY/0gETLkiXYZ55bnCJJWdIqgELRDgYdC+JKPlB1pEGe0wHknS
	ZvXg+b6c0vq/FA4CDVkh751gt3gaar6wUm+xWJKHBxATe337x30ountDJYwmQhwK
	9fin3/TJLmMHYS/KQzytS6buKeCXqewejVtmVLJ/XX2pU6MmBtDlmsenTKXTs3V3
	Qb4jVvVe6n/SA/GnkQh+XXY5orzxVlirSVbY8HjSnIa0nh0YrpkTegRlWhaajFi+
	OK3JUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t33se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34376dd8299so225487a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 02:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763636353; x=1764241153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDnvoOcC4d2LAqFwcGheU3WU1Q1ULe2num2u66BFRLs=;
        b=MvgqIQTwUcTMAaRhhylYMpO2p8OFZzk8RMxUIn2HVXVu+jqIM+qcAtFcvn152Ur/51
         NzYi8X2mcfVlpUqyPHdZk8GvAyQiw4+KoRhCdoCRbVYM9rJPLDVd4VKE3Hx0lvwHZxl0
         z8encrQqAayP/T4fdO2kBtYtVN+6CStXHEZluVWRALXkN0KoclfL8wClWrCAw8/kmXep
         XClWd2/Fm8StNbgjK+qirjWliikGu4u0xERy2yqDTjU+4U9ToCuTpeQ+2BlUxfI8xA4Y
         xwdKi0qz/B9Wit3jxOGk+jcdcZRVluMeZ2WhN+zzaeUIcCUb7zluEvXC4cilFtDewolA
         ndZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763636353; x=1764241153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDnvoOcC4d2LAqFwcGheU3WU1Q1ULe2num2u66BFRLs=;
        b=FaJt+bSFmkiNEwdYWUIJ+PTjlTp/9AbK910cgw8Yw1Hg8YQcWNkCYEmnglxC6GuLMz
         xCb4kVCpi3FJFnU7ppCg5GFXNxnJX004nUSN2/KrQjRN+7hCoK8lW7j/5JCUfYwGuRIY
         YL4B+2eoWmmxIDQcZjktFs8x3nGalDPwCMx5kxc5TzkNVOUbzsmNnpKG18Rm1mU97f9e
         8ZmeAvfAZNyDwLCb8dgjvbDpKhWbT6FBU9I9AsVtmeAaWb5mKnxA4QcuMpWHj33nVmbI
         +ye59+4tNujjYopB+rF7of5mQ6PObeMSAhL58JbGVn8FogVKYuZnH53ZxsUo3XYCN0Re
         WY/Q==
X-Gm-Message-State: AOJu0YxQrvN4nRaE1F6rrMokzixfm5PMuUMBODoLa6JPZMWUjZ3nR/4n
	2LMikxqexk7g67OHj5QWDD4nG+XrUu1GSSdCNHhq6T8SsSnlQYJhzhmL6TFI18CvMRU+dK8bfZ2
	nyr/miSbp1XNf9QAYpGx/CZMOg4dkBFfkhjpP9grvR0sDgFYeC7EOI8zD2uq3u0rS/Lv5
X-Gm-Gg: ASbGnctAUpLZPtjzdMm4chKD19mgX25f0YV/ieKH7RF1ubDaJaCctvzK9A6gz6c88e9
	1/4Z/kC3GJ3Q63WLSMG9c931Nr+RPh1HT+lh2jhYft6JAUW8NaLVqXASd7x/Qhc0k0ftc7G/ETn
	CbUxMJLo4nunzK7vVM9RPNm1XBUHaR7FaMP5mqCTvNcks7DWCsYRwmrEkskdwAj5/TZJaFawCGN
	vWdcYrLtoLV0ZADOtlEjbd5nZt0ORtytCfGLBCpGSfvh7PJw4GgxVVqxyerRumvlBtgloh/WLpF
	oeWfR9wLqPzPwQeeKqWQFpwm8Hu6hqfxRDTQuuE90mI1FFcTkj1f0r2akuay5GewEk9Nq5cbHn1
	2zBMtDtlQbPGv6qw3TeQAxWcI3+hJ1Hmssl5m+OPJ80q9MDklqftWNoaMBgFEyYiS1FYTa75l8m
	yxlU/hpscJ//3gb+EhFPfamAbHlbgrqw==
X-Received: by 2002:a17:90b:3884:b0:340:be2e:9884 with SMTP id 98e67ed59e1d1-34727bcc639mr1584974a91.1.1763636353083;
        Thu, 20 Nov 2025 02:59:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWXJ+JykT8wJra8WxUM/H55YELoXOVFzZeUrvvV4Wfe5xIvBULr4R5iktrOZ8nSRsH1P0ifQ==
X-Received: by 2002:a17:90b:3884:b0:340:be2e:9884 with SMTP id 98e67ed59e1d1-34727bcc639mr1584956a91.1.1763636352403;
        Thu, 20 Nov 2025 02:59:12 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm2248944a91.9.2025.11.20.02.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:59:12 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 16:28:05 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
In-Reply-To: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763636345; l=2432;
 i=vishsain@qti.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=qIPGenZv9w9DwaR3O0qip5/mmYROjTXdWQ01oiMJN0Y=;
 b=8X+ihkkKZQgsnhFUMI/slY6fBUlOBFboT0T3FpDoXPe5S+AfZpDGLrks3zFlxDkiT6M0WZ3Ru
 1nSbBvhV64BBTaMpPznIqKKlNEXH3KHAxlTsyL0J9CUWfsGHmiaLbBw
X-Developer-Key: i=vishsain@qti.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691ef481 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TtjlSvZfWGYSd8DQyFIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: EY2xZ4SrGwGqsdl9ZbjpQma9KM6Fq5i_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2NyBTYWx0ZWRfX+k7eUr2fo4xc
 Li75KTD8pBBLl1R6yCEJkjY2Av0Z7GkgQezPrOt6cD0ZOC94Xg0rQC3g0EUFhgYGfnEM/TWqzDx
 QFTp+VmcVHd+3KMzPjMU6bo1+T51vvV50ZLsFBZrpmTLGHI29Nk3aH/7A5tgcBDHNjQ/4jcdRWk
 1y8ZHq05FRk333inUhB2kaH/kmQlQs9/ZDEUg3CGr8qpyRoa8iB8klue1dii8P0lGsT9cWVlzmg
 aB9xbwTkeHH+myPOzXujcbQH6hxMSm3C2aiCHRUb5FaLaoUexqU867k08Yl+Hve9SXDtoOTRX0v
 AFHq2zSFyjFmU6JBLVrLPIeR6MlcpjPjbxVvh47/FMRONfAss1D4TnYyBKcRL93eVi97hDDha7V
 HiwPdGDwS1+p5jMf+g57pcjPBuwXbw==
X-Proofpoint-ORIG-GUID: EY2xZ4SrGwGqsdl9ZbjpQma9KM6Fq5i_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200067

Monaco-evk has LT8713sx which act as DP to 3 DP output
converter. Edp PHY from monaco soc is connected to lt8713sx
as input and output of lt8713sx is connected to 3 mini DP ports.
Two of these ports are available in mainboard and one port
is available on Mezz board. lt8713sx is connected to soc over
i2c0 and with reset gpio connected to pin6 or ioexpander5.

Enable the edp nodes from monaco and enable lontium lt8713sx
bridge node.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d..947807f8a9cb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -317,6 +317,20 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs8300/a623_zap.mbn";
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	lt8713sx: lt8713sx@4f {
+		/*Display bridge chip, DP1.4/HDMI2.0/DP++ hub*/
+		compatible = "lontium,lt8713sx";
+		reg = <0x4f>;
+		reset-gpios = <&expander5 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&qup_i2c1_default>;
 	pinctrl-names = "default";
@@ -396,6 +410,23 @@ expander6: gpio@3e {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp0_phy {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
@@ -435,6 +466,12 @@ &serdes0 {
 };
 
 &tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio94";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio5";
@@ -451,6 +488,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-state {
+		pins = "gpio17", "gpio18";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	qup_i2c1_default: qup-i2c1-state {
 		pins = "gpio19", "gpio20";
 		function = "qup0_se1";

-- 
2.34.1


