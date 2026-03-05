Return-Path: <linux-arm-msm+bounces-95642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJyUNrSHqWki+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:40:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B7212AB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96D01308CE53
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 13:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C3A39A7F9;
	Thu,  5 Mar 2026 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acmHMOUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCrqvuiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB85381AE5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717987; cv=none; b=thKvHnJQ4OICJPNTiXC8MSuZAPKdbANOQYbIjntzO0nmrZga1x9bv9wX/5l4URvx7eYS38AYWHKznaqzvbDcydCVy3jgBwKNVM2aExwJSKZ52Ksm2hkhMLOQWaPhD9wpW54+ZG8buDlb82mSiHL0IAg5BffMGEqegpLzHKmkgvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717987; c=relaxed/simple;
	bh=mZOq4Lkgs8v8T9NZyyJHg91spf5S0MZ2S/xwswzDHPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KajpDZksnlX1CMtGdt9cS+TTBNq4QegEwjaIOzAP7kh7NTIVst2RYdUR+PkuP/uKu6sCfnzgFSSFEtE1WQwbREbcDypTT4FgVZHGSOsFPMqd5iPu4aRO3hvLuQyDRTsLP2iih7zM7b2eaitaiR5IZWuBTtEMGCrUi/kZ39tGgoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acmHMOUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCrqvuiR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFjYH2922834
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 13:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTXqn42rKWNP7ZScqGq5Fan9LitTyer6iA3RuPMR4Aw=; b=acmHMOUxk6Vmwrxu
	nPAUW7+QyCtoDJNBov2dsHZS7PszUOC2qlUXmSqaaF9wU0hFtIzEoiyqBAgrMGaH
	ewrbVdxKWvQCyAGrT5iJfY9QTWiFMahY8X5C1xKD+sQuzuJxGTI1vrlxyaFCHKm7
	lNf+NgHPLDhqE0hypcuGLcRyhvjS/Qil6GIFBvWHOE2p0hCqXHaE5BLMd+ULzob3
	YZ0M2f1hYv3QWYCYOjCAMjd4JcJyISSIp7+tNQCaGrQa9ym9onI874QUIdgZvpfH
	kVWnFbR6gNyS5iBK71fejvO5LsJwIRyuVbpVo/OufroARonOqRCJKUAj0UXqGXvc
	7dLlIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q81rbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 13:39:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359887aece0so5170551a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 05:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772717985; x=1773322785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTXqn42rKWNP7ZScqGq5Fan9LitTyer6iA3RuPMR4Aw=;
        b=XCrqvuiRF+eK+ZubgoGADxjLRGiGUBQcs82nv67sf6+DA3CuNMvsDBkGWQ9ayixJ7U
         Mk/37itewdWslQO7DX5fWrlgQaMXR+EFzsX/7uiTFxyH/YquuzYREY4grOPJiXpj1Q/A
         JAbVxjyKdETKWPq3FnBoAc3G+qFsMcpIyl3gQjahFTysDuHa0uWkXCxmpdmmyswJjmT2
         PnYQ51/hbGlYcXhSUcV0t+ZkXCKyaz/PacHH2YlowXlFex8aAjVf6XDFO6+DQyoexnFz
         DkZ/6bjU2vbTM261sQTzn+Msg17OkEJHXZfykte2r4444lAf5agqi/cQFHxl9IkXgBPA
         HkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717985; x=1773322785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XTXqn42rKWNP7ZScqGq5Fan9LitTyer6iA3RuPMR4Aw=;
        b=QpIQ7v0nsVP61wYxnAtYK9SZ+Fs3Wf2GHjd/jb1UOr3EKSlfH5oMvDW9j2ToRXgu8e
         pNCS40P6CbzqG4rcaMR0YJVSxRzzOaskn47NUh9aE2FBhUrRNI4pH4O/FMj16NvmPh6t
         7lKAUiKZOf/baLMG3Vkz+Zz7cl48fHuv5bRVwsHAfGmXUv3m9veYH+3NwC8B8BkM4hI0
         J0FiQJB69ojgT2p9IEbR2RiOBABhrdn2MwaeNP1L8gmfCVJaox2KFBhB+PJuGa2sdCyk
         3Jd/G9es6xPO8dMR4yLQLg3KfXuuW613w85eh6QKb1zqcjD4lsUA1dKDe3mu1ocQ2S+2
         A0cQ==
X-Gm-Message-State: AOJu0YyyGr2zzPvoG5s0/z0IbG5okoLTzdeq5zN2b2pJ20cUGOzEFQOf
	+arPuA1AuHBjwZJjeK0ISZlo5g8nXpOOugWM0V+tQdgAOi72N9bFM6xnkvmHgID/uzta26W3bsg
	fNj9T7RSfBX47IK37bju2wMyhwxkSvURcVC9+wmXnWptjefsDiylQJ/1xgMuwAcq5m0bG
X-Gm-Gg: ATEYQzzLL3gzTp3mIs22gRp7bAQJ5SYTyYpGvTIektdU9Vo+U59fk9Tr0yb3QZskXcs
	t486NTe7V+yplLveKeyZM5vbJxsf16zD+caxyNagIMsDIu1yVGDg5vJgAb8TTs11nTHlWRLTM/O
	XZo9oarKICSpSRyv6HC+BjejJogeZYSmalBrnoFMq/VbuD1S3V7HexoNysVsvrY641fLnggoHeh
	I2jgeb0e0rWivWBrXAz7g2n00BfU3cX1qxUAT4gSUb8IAB9VD3uofVNLmOCgP8jQ9lhcmpDis4V
	ZGlXk/PP7j2GsZiR4Ji2subjjKnzuzJ/b/Vpd4qpVyLMf6nQUg76Q7FrAnDrvYlQX4bar110hkY
	sofrZp0Zz/OdOQaKEVUVMU6cmMBYx6+ghYmM7PEQDZ982JNR8GXkHZ8MogQ==
X-Received: by 2002:a17:90b:3c46:b0:358:f04e:a617 with SMTP id 98e67ed59e1d1-359a69c764fmr5172630a91.10.1772717984821;
        Thu, 05 Mar 2026 05:39:44 -0800 (PST)
X-Received: by 2002:a17:90b:3c46:b0:358:f04e:a617 with SMTP id 98e67ed59e1d1-359a69c764fmr5172604a91.10.1772717984256;
        Thu, 05 Mar 2026 05:39:44 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d5fe2dsm2195236a91.7.2026.03.05.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:39:43 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 19:09:31 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for
 PCIe0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-industrial-mezzanine-pcie-v4-1-1f2c9d1344d7@oss.qualcomm.com>
References: <20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com>
In-Reply-To: <20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772717976; l=4725;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=mZOq4Lkgs8v8T9NZyyJHg91spf5S0MZ2S/xwswzDHPk=;
 b=D5UODKCQkBThJknAiBfl1IFg1qYZFJGLH+ZTRlRGe9beYCpcsI4tglSZr/GGAWroMOaNDUsaa
 H316RfKfpnBCmUv7O2pRJJyg+gnBiJaUURzeFXbEeH0gJ54UAKjWJZC
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: UzmYxh5V5pyqUL2OOhV-4-19gsX6SQE1
X-Proofpoint-ORIG-GUID: UzmYxh5V5pyqUL2OOhV-4-19gsX6SQE1
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a987a1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RBLAtJqH_bkH6XPhXP4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwOSBTYWx0ZWRfX6uTwX9VDiigC
 QAHa1ifvQxmxLlG+hJtHpK4mwkggInXjzhhP2fYnj0SdpeeH6akSyGH0fgCSwhurPT6PSvHXlsK
 Kcc/3wqsBQKlep+7K2Yyb9sJdYgSm1RNKrA/Gmoi8QH8OIDHraARCYlO20iiNBhU0MakKE5HaMC
 pxORIu2rVEo969EmFgD5hD2yPq0nBkql+afiorVJ71UgtAigVkQp8ADTywC06w2qm5HAbKBZugx
 bZ+dSjjVa+Iwmzbu+uLAZOBLnNkCC9M2jjcErEwRuId2ZE3jwL8PMRilhhQ9Af5krKPrNcVJ1BA
 s+UsamJ6a1GXWsnFTsRU0CusBraMxTkA+RJ2Tu+6KMGCjKib4xYx2d0TB/YjsE2JsywhtBHX8uz
 R2O4Ak92WIyWMHS01wQq0V9moXgFFyh0x1OJ9Ks5dEJQL+ziO1dEDF3Lydl+A2HnsUuM8OuYFGK
 cHlsM4Q4ZWtiVUrfgug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050109
X-Rspamd-Queue-Id: 379B7212AB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95642-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,0.0.0.2:email,0.0.0.3:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a node for the TC9563 PCIe switch connected to PCIe0. The switch
has three downstream ports.Two embedded Ethernet devices are present
on one of the downstream ports. All the ports present in the
node represent the downstream ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, which
are on by default and are added as fixed regulators. TC9563 can be
configured through I2C.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 619a42b5ef48..c58a9ad5c331 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -5,9 +5,33 @@
 
 /dts-v1/;
 /plugin/;
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+&{/} {
+
+	vreg_0p9: regulator-vreg-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
 &spi11 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -19,3 +43,138 @@ st33htpm0: tpm@0 {
 		spi-max-frequency = <20000000>;
 	};
 };
+
+&pcie0 {
+	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
+	pinctrl-names = "default";
+
+	iommu-map = <0x0 &apps_smmu 0x1c00 0x1>,
+		    <0x100 &apps_smmu 0x1c01 0x1>,
+		    <0x208 &apps_smmu 0x1c04 0x1>,
+		    <0x210 &apps_smmu 0x1c05 0x1>,
+		    <0x218 &apps_smmu 0x1c06 0x1>,
+		    <0x300 &apps_smmu 0x1c07 0x1>,
+		    <0x400 &apps_smmu 0x1c08 0x1>,
+		    <0x500 &apps_smmu 0x1c09 0x1>,
+		    <0x501 &apps_smmu 0x1c10 0x1>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pcie0_port {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c1 0x33>;
+
+		resx-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie0_tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+
+	};
+};
+
+&tlmm {
+	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
+		pins = "gpio78";
+		function = "gpio";
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
+	pcie0_reset_n: pcie0-reset-n-state {
+		pins = "gpio87";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-disable;
+	};
+
+	pcie0_clkreq_n: pcie0-clkreq-n-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie0_wake_n: pcie0-wake-n-state {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+};

-- 
2.25.1


