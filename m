Return-Path: <linux-arm-msm+bounces-95570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEE4D0JSqWkj4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:52:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A266E20EFA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2542230AA7F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B600737AA6B;
	Thu,  5 Mar 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmOAzAJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xh9Dj0mM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC413793C9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704133; cv=none; b=B26wkQzVqgZXU6RdLEKzR/cCaaLWFUf7fEbRTi8Rlmoa+PWFe0FdNPmoruw5tUZ6iZ3uJaHYCM0HtBV5bssTsZoyX65xaWfMVNV40YzVjdQyNW6SWa6Weu2w3qOrLMYvRdbVvixrEHTWlKLK00JtduUsaFOnLEiAkJvjks7dTXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704133; c=relaxed/simple;
	bh=UHkKZRKX+Z5mrmHc9PqOylVQatIA9vArdG8H4u12kKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q/7VOkQxQ/y4eNebmTDemZfxw4FH2/ycT6rxIBpePr2rKaxRbyvUzuejdTGM+d/56DfjQRvaxUcGwSS2oiE+8yLq1vUkg3BqGUPAzAb1R4LrTDp4LyKgt2AQH/BSedGs5/Pbea3b9ECzdhXv1TBbKQngpw/KHIdrqeNi61/CIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmOAzAJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xh9Dj0mM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258l5vK2665215
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=; b=dmOAzAJ9ZrOjruOE
	sdLdWneq+TWsBayn78t5h4CmBYcmL66WFcTik6lfAhPJ5NJmASDZPDuUeB+U1nV9
	CuSPKA59VK1betskPcR/5Upm/GTJQM6hUEg4ZLH/U7q7WdKPmPr8dC8d4jqaqjcZ
	RbUbjrQ4Na9fvGpFnh+xSxV0zOZJHmgq6uXutykT3oEleTE/wu7agrxA7W/cbA+Q
	25OFLCIB8LQzuBcNhst50BzImrHflSazqK5AZeBohG3FA5c8WXTZYm32RuaDV1ad
	5cK/w0RfnaxIjP8sp2HA4cI3bYfU1dLOnYHqPmiezNBt0iNA5uoXmO9wZkKKbyDp
	4OtYOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb27qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:48:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50355952ac2so496436041cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704130; x=1773308930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=Xh9Dj0mM0NCo6uP++oIzvwLj3dvl85B3q0T5R1Z59gcQW/o8+VjgNzxh5+itKXDzbf
         X1VseQukLax1sNuEhG7nBDmUln6Bbt6WbiWdsaHrKR+wtDgyOaCT35gcSXjUiW/+lh23
         1QEajaNMyspIAFsC9yzgKYSukMEDkLXx2NOvBNd326mEdacWXb4ZKUHifAMoMd7vcGW7
         LBI6ASOeKIKx6uiBkDeWvlyS7ldb4jaavecB6yaqHO3w6kL+CoVJ0yr8v2Dg258IrQDn
         pf7SK6DVCs2Gkn4Sk3X9XmP4ODroy56ACHveft+QFKgyMl1MDSFoW0mXZQsoCEKMUsoc
         opdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704130; x=1773308930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=KpDRi6wHfbbchXyFl6Ynmgm8QZvO0evVOAb4Qglu30OX3BuWmiD09ogBOJNi9IDAky
         d1r4mxjb/9CCt12UT7gg/ctbSAUZkbOu/+mr7uEdNnnIF6IlwYvm86NX2WSWJoNtBCWg
         cF+KuR9F+iyZmK4BL76+Ph+isZFAXtA2lvOKwyrhb4dHQOaBoxhmUWQvY49BC5W24Ry/
         WQZEc16d1lSPdJTSCA2U12DFsOB9NYj1liBCfx0sV9njP6POK+F4gEd7vEu/FYiGz/kH
         JWufSzmmnH2SkdpfZpBP2yllDDlCZyfMIMqKhcV32zERL+Kocmz1sVnlf7LIMeiqRmoR
         U1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXzkvHsNrJMiJjaLIxXFi2ZHy+ybOTiyF68scCpgL5aSJP0ltVh7VEx+Tv439uWYH2lq2/EV8SBSVy+wtKo@vger.kernel.org
X-Gm-Message-State: AOJu0YxGkMndWBQQr2iSIAemsMlQZPqm1x/59AFCEJNwC4oa79p/6I18
	CVXxDRrBlQD1apAGeUjSJokBkDGvyAiSHnVq8j6PgjM3LBfYwc8AA1gOizKr3Pyxx/AeJVkgO3w
	k131c2c33OcF2j95sq1bS/+n5nFpDMnxcxNdm7m9jW5oQzeh/KENVPFOST48LspqVgAH8
X-Gm-Gg: ATEYQzyFTlP/g86kKNUD5zoJ52Wdwv/bbwmeh3fLmtIn+1cbibKoTdjUTPxLE3XYuIX
	Z7HidpmlP2c+6w0PuM7pMiOX/4nHLgEKmz3XasrRB9P1T+OXhDrJmOFfflR3jXCecqWNFyDpeWm
	4tl4F/gFBUTXYaQ9vM4FHCdqR7jbnZs6cBjo1LBsCu/j1R5R33heZ8UubYpmAX5daXY94/+/hZa
	MybqWd5UTqxQ91DamTUGNJ9aF2/yMBlUEjp6k982Z2warlndJtgQTVgum1v/+tbrEh+H8GRkS1t
	Xi7ewv1uuZqtH8gLBfsvLZa8D2iWWVvoE7odb/T8DWygpHzCuwKtPoCxA5rGFHl/ScKAdyfQCIV
	1g/K795u9GDjOCwN1XBtU2J5rtE1Q20NLNQS7E6/oxmi2zVujL6M2xpic2dSLXRazai71TN0Em0
	a88TffNbW/CLwg
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329641cf.21.1772704130401;
        Thu, 05 Mar 2026 01:48:50 -0800 (PST)
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329321cf.21.1772704129986;
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:14 +0800
Subject: [PATCH v6 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-3-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UHkKZRKX+Z5mrmHc9PqOylVQatIA9vArdG8H4u12kKg=;
 b=JXkhUvtpWwcXpsiIO4GJCvO2jqVyJnJtvoaiDr78rNtQppEPMG0cyzhxpNpFzgjtrNVT6NBAN
 vP4TBSQjCTJBSEg3SgjuQHxLSvbTDJZF12Hfbd48KYEHcVEgdryAtuf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX1EsWPRvdOzqk
 eMlGGgosujUdZ6w5khgxcyOJBcMGRvDwweZiw/r79kJzbST0x2pNSD3E+VjM3J0zA15nAiWI5uT
 vrDAUEgdDWK17BAmNBC/LnEalYm0wUqvKnIV0ehbVcMspk8iq+RQ9L8EPZs2TciHJu8zUpDBm1M
 wrM2O/NizEP1adBl6bSzxYqDNeTaiyOvH6KPGw/TQ7yiCvT41upNIODoepIRHLVNXae2Xq2IRcT
 E38PHF0Hq2QWupZUVuB1CL1c2cuApUos0LXEdLNtgZDS/OBXX8fEmbWhrXFyPDNeif9C4HeDjTP
 nyoIB/H8jxP2KXk/bsbex5eU3O8vMA5GIqaBSSJ/LkpztQpBeT6q94T1/LKc/WcGNeByJFAxYQ8
 DQ2nMi/ls7MYOafBDnMHrzWdt0z52D3ShmZbKMgqU9kY6qmSlCEdc4y8J3NCLtzAxoucRbU3eKq
 NiLY+zCYoKnuIggiNhw==
X-Proofpoint-GUID: p6na-BJZj-SI-xK0cTvNG_5TIs8LiEDY
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a95183 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: p6na-BJZj-SI-xK0cTvNG_5TIs8LiEDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-Rspamd-Queue-Id: A266E20EFA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95570-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,acb3000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.47.77.96:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 054255a65c7fbb51e6c411d10252270bd7ef1522..ace2b2a0bf2b7e574b0d43f98ae4624df03b477c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


