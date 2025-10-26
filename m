Return-Path: <linux-arm-msm+bounces-78805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15562C0A690
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 12:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3ADC4E52D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 11:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EED2749E4;
	Sun, 26 Oct 2025 11:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIYTrkkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7481923EAB8
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761477501; cv=none; b=aDS3GbXDt+cjvaeUwJ5XPGyaaao11/kbOn0Wa0FwPanU3srIad6ozaL1MvU+o1ET+B4YtbzNvznzzlK06slAFGKygDoUHdn0y6Eqij8Jo828w7QOY0spD8q2CSfQ958lWuc+bQi8w8vkEEUuI9GNsT08c/Eb1rCce1TL2pe6Awg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761477501; c=relaxed/simple;
	bh=C/mzAdKj9p2NBL5behIIeU4VW6x/8wdOWx0ygFMKadw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XzspR/xjdarwsqWeOJVnqqoGB5Ws2/T11E/nZaLMxhE9lsv/6uytYBD3t/62jWR6ohGQUcxTG/SZE8Gnux9P0IobWp2/kwO89PvceijGnl5CzIfVedGvCml4ArAp6BGaJ4oAuglLXELcoynXvDuHmReCgdv8rpnImgwDbtijUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIYTrkkq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59Q636ZC3286199
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7jLxKwoNFQj
	q1lJvQT1jXcSCqEfte10mO1geLsDRQbE=; b=YIYTrkkqtTO7r9LneiqdO4XwwO1
	9Dz6QBf44yCaJcPwFXhoUZVW3JMCNqIQJszFQY7OJvuGWc/krTCE1914b0St+nzX
	0JT6IPG3Xf3g3tpsvTu72BwMZT+1/eHNf0OfpELXkyiC0T/keHDh5iPC6ONsbnk1
	yoJrn0tWnbh15vLrN/4uL4Bhcskg3H8p9bKcQg8CtFWjVg5+65w10jJDj8/mDvOx
	BkEJZ7MmeJ2TyMvtwOi4tnLT4aZnjeo+0d/WGOzx1HpFSOGULhynwC1S3nVEi5oQ
	xj9EY8ZWO731gz9WTyHOjXnuSYma+ksdHPR+R+BdGcskjLeX4EZbR5VKnjQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnxt0rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630add82d6so692455a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 04:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761477497; x=1762082297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jLxKwoNFQjq1lJvQT1jXcSCqEfte10mO1geLsDRQbE=;
        b=mjL8lD+0n+NvPDhT/QSPOaQbhDJZnGn0WnItnYe4augFBRWme0MbzgcjggT3UT3p63
         qM9RXyZ1a9o4YsxN/G/7vpGJ6F8FuTB0KA7AzL85FQlbCNNMPhRKSrvbWJ5bLi81t05D
         dw7ljRnTimitmQalf+gRFeUxwVXtIkQHMscoE6J5NwXGPiVWiieo7bzRCcQG9h3nAzNx
         jLZDadmFyhthXrasbi8FtzAkkMN6oIYNCiIpQdr4ustgzJ33xNONvRMlJeBsyjgkVNQR
         37Xcr8L6pkGHiIsNoWmcY9QL9fC5Ik3PG7/rEsCf8IsR2ojArUY/gbqqY9g7u/3KamSV
         95iw==
X-Forwarded-Encrypted: i=1; AJvYcCVfs70Tu+shcgG5W2w4FBgnv65SdzRCffm5C66HrS0+CRyrmBzm/BmNoe/9q8ptU1NW5DGKwBAWn8Q9xIJf@vger.kernel.org
X-Gm-Message-State: AOJu0YxrTr+WHKXxOfy89OgH1yx4oIHAuCSoNX63xdRL1DAqVWuai258
	k93fW6hxh3B+F/9dZj0xCFdjNIyMY3S7J2r1O+E4LRhgMP7j5oAZErOxGK1+DdCyRxd8ngFIML1
	Rb8yEGIWbRol9VfTdxFOWPV6r7+9SGghX9gBT/lvIfSoVwT5ylci/moFALepcHzkxIt0=
X-Gm-Gg: ASbGncsNjqqrwryxV0s5EBoXELiheEWvFvIPyg/F4V+/6+gLqtlA7C5reQ7lCtpMkn6
	CalH++do68P7bIC6AwaNIvWmJ3MyT7gQaC7ci6rBmfhOvy/rbAJy1XmpzrYgqo7BCvtO2tV98RW
	QL/fX1mSSlfxZZZiokrLF88sERCVCPQljVaJFw5dLwkEvz7jFf1Dzg2tfx7x7+ENJp5QpHy2Xr/
	0R7/GKAaYCLqzh2InYWtmCftik6hJsy0K6lwyyJ4UiO9U59BWjqc7QsqQr2NiuWmadQz7uZdaUL
	QZkrbDLH2WGr0FWB0jvhRLhOcg9NuUnTrFigly2zjkwxSlbiNMaV3QAMdi2p8TKCj/OwP5+bSKS
	oDSJcdntIGMNzJZ/FVy5F7vtDzm9Ibw==
X-Received: by 2002:a05:6a00:23d6:b0:77e:543e:3f3d with SMTP id d2e1a72fcca58-7a2572e9cc8mr11929455b3a.5.1761477497169;
        Sun, 26 Oct 2025 04:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0dyq8Eivf0xBXlxNRCp8A/VA4HRYeY2i97iZL+D05JSiymfI9SA8yPxamV3ZrXVWE7D8acw==
X-Received: by 2002:a05:6a00:23d6:b0:77e:543e:3f3d with SMTP id d2e1a72fcca58-7a2572e9cc8mr11929439b3a.5.1761477496668;
        Sun, 26 Oct 2025 04:18:16 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140301f7sm4707829b3a.19.2025.10.26.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:18:16 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V3 2/4] arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
Date: Sun, 26 Oct 2025 16:47:44 +0530
Message-Id: <20251026111746.3195861-3-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xc+EDY55 c=1 sm=1 tr=0 ts=68fe037a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=AsSGxY1rZHGoL8xKvT8A:9 a=pcaSXIDp9BJpxWmU:21 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: G8Y-Ceid19u0x4WeY0IwHrFYD_4BQrv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDEwNyBTYWx0ZWRfX/eHm4+NvTSC1
 ddpkD0hdaYXMfgcXmca5FNOnDjm0y51coAa9GDLLSd9BO2XApk4SrLYqjh38PaepsizyWDmGPCW
 fmw37pzaI0RehZJrH1xkoLaB4zL/8RBh7Ug1DEe9U66g0qOiuoxqcSXgUy+N9TsurZZeHHb6P4H
 lMnsbfr97XWU9irN04M+S4DHzI182DEKR/srzPRcsZq7stz/LqHtKrJGVyxEFsf3M8JLz5wRWvV
 yVuwyL1aM6ydm2CoCeeu/WT/42/d+y0fntpQoKQnSK3WDBXULf+sB6F9abv5s/huDQP5QVz/cyg
 VliVWr/0h0kfK55WHmT00B1FUOwCrtp41diK6JG8szTncBRKwKV4ATfE2iK3P5EhFyZUv7TRyA6
 Na6MqoQtLGSQSnu9KTH5+lF9AWHzVg==
X-Proofpoint-ORIG-GUID: G8Y-Ceid19u0x4WeY0IwHrFYD_4BQrv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510260107

Add SD Card host controller for sm8750 soc.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a82d9867c7cb..50e1fa67c093 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2060,6 +2060,60 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
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
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
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
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.34.1


