Return-Path: <linux-arm-msm+bounces-110014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBVeCogVF2px3wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:02:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF45E75F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A8E6307641B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50FF42668E;
	Wed, 27 May 2026 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU9qjH8r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEXyDDh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE04D3D79E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897346; cv=none; b=E+6eLjG4mkrsYYRZZLA2YbOa+y11ysO/vTOtNex65SmghcvJd+D3hCLhkJfMMzLfk2Ufd+L16E+LeQUaD+xm2vRTuomzlvWHSM/KKhAJufVdhDUh/CE5ifG6ThSQM8AlQkixF0xYfc9dAgYaPTNVsVngoglI6DU92RVVMJ8VOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897346; c=relaxed/simple;
	bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RN29AK5s+TP6c48xUR9lmqGi9kKdJE3dI8L90CIPJFbK3ZX0f8HP3PlT8/EV5+jOoQYkM/UWwWNK/CIbyAhs8ffa04GdkVbwQ+OiN5kAhr1fflFq2fS7djCRHpMjh83wunYB+HhB0WZ740KJEiPrqzYb3LVkKJFD0SzUPuNpon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WU9qjH8r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEXyDDh+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mRac2152245
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=; b=WU9qjH8r9ZMfZOvn
	xGk4nGQujRa2iT6mIbQ1Cn30NtUcnlZJ4X6H7BwmDPOLLg1uSujPOw2DN41JtqUF
	lO9O1qTO8PBGkt/5Jop84u9pmUu9JxqBEBGagBdU/1RkvM9f/YH5VAlQSzS0VGaL
	pFItSV3y2fheiBIWirki7YqVNv7lWVw5wfPNnhG8RleKhxGgIBWpBRm3ZSHZggxG
	KZUD2X97IV4J/3zvXOfY5j4jExBArQ9dVPZzTMBH+IHCfmMvMUdXi0OBXsQWDJTM
	ysohmQUHK6micIWZ+R0Twtb4bIXMtygv9LJS6nwAg23zBejgsoP7GlskgNpXwHQW
	zDsCnA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rj6bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2beb9002a00so47459965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779897344; x=1780502144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=VEXyDDh+54cZv1Xfk+palgHSpMRy2zUrbue58PZdGS2Swyz0hixE0q4Z8tZHVLJOv1
         Av/W/nx6CEAi0TyH9isS6u6zAEtH1I541z34hkWEoKMjUygvonfNxErrBL5xKflth7b+
         VsvHIqeOMbojCD8wA/rbuiovcFxrgy7ULzgwKqM/Nx/cJ4GQfczc/Xh9xuqZxyWOXNpj
         gWslUZjVp3YPgiwwnx2tQZ7TbiMZgP33lR3xarCn7pAk0WgX69xGQ0DuHwnzyF8IjF7a
         RVpTDLbl6DxdcxvWMNyAcZz4b+3WquMoFf4TgwVa4qy4C0M1+xNlMdFaaGDouyLaQvzo
         CrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897344; x=1780502144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=V47Oi/6ZvtzDB0o46+FTE45r4cryScuvGXwKMextoN7u8acIzCJWXO1tQrXBVMaTf1
         0z7H7LKNh55LxiaN5wFOU8lhLbhWN92eyhj8lBnKO4jcNIh/rFXVnkCgf0Gbh4Nrg76e
         6cBZh6qyyZY4Rfu1zTN2ZDf7BzrS8XRN3EO1m7Cjo74gyUZlW1MSG4HMRA/BKZW4A51f
         gBl17+ORYZE+EarF60rrQjtTBr7uk7xvtZJcOK3a4gDLqr7tYwvnvto/Xf/G55mCJWc3
         +ifAuzIwAb1bDbmE4pSgwcSbkoNg/bpNWEnJNMnh6MJiV0ymUHEGE6plLpZK1IcsUOLG
         l11w==
X-Gm-Message-State: AOJu0Yy6/qfrzWAGeXLdTYGN5IA8BgTyfyfgoJvA1xziiwe9I5zlkDno
	d3/drjevEzhaF0YDmVzUh3xpaO7cCfGXkCamhKUcG/0qF+9f9S/fgZY8pJOFyYEO8RpT4xrGPys
	gBO41ZpJvJtpkpKbOJg7La8DN1PXrOfmAqzvT//yoFirdeGCHIDw3MAzLSeT5YUNcsiqb
X-Gm-Gg: Acq92OGMdifH6OIkSE8w5JZgGmjzzSury0LLmomwhHRZqO7TFvabUHmIewugCxQ3ddT
	6Cysgl6GEPxxB8s6m+dWENiCBls7us5nddiHX7jXWPwfcL3SUv33Q6yUd4S0+Eng18iXex5iRP0
	SeHdxh34rrzROqu4/ZeOMd0I2YOXRJFuQpeJv8U1d2dmciuifG0CgtUwKEiOacnllMwXRqrGb3p
	1swvjryGUodrs7/3lPFznZS4xNoL46fCGMBwSpDbk3eRFgX0ICyCjDZ0UY5/jJxNNhN2LBZj4q2
	zOTNm+TtjeUxZIlbOSEWqaaJQ+PAmnEPQ7yX0XWaw6UXCd1FzueVb7NGFIipmT8Vm/rU6ojGq1D
	c486Os/tGrA8XQ63wXFnp70aqHA/yhYcuqRcp
X-Received: by 2002:a17:902:ce92:b0:2bc:a52c:c8fa with SMTP id d9443c01a7336-2beb076ead2mr253425295ad.26.1779897343614;
        Wed, 27 May 2026 08:55:43 -0700 (PDT)
X-Received: by 2002:a17:902:ce92:b0:2bc:a52c:c8fa with SMTP id d9443c01a7336-2beb076ead2mr253424805ad.26.1779897343045;
        Wed, 27 May 2026 08:55:43 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beff36894dsm1264135ad.37.2026.05.27.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:55:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 27 May 2026 21:23:54 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-shikra-dt-v4-4-b5ca1fa0b392@oss.qualcomm.com>
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779897312; l=4539;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
 b=jyYeXsEL0Bq3VtQJhwc4rgTZTSMqWvMGcrLs8kjWOWBSArHZoDD/7m3I9UTqNjdmpgWOTDU9J
 Xt6s/sxjLkABhszm5a2pHyGBWlTP2T7No2xluZ5mUuWi5bjuNwhXpy3
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a171400 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IZjsGcCFCfEoDLf82CEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1OSBTYWx0ZWRfX3c0VbrxUDK0O
 Ch6cGMl9TJh1L7OB7pj+pNgnY6O/8MQsHRObH2HWQ1WJRNOGP8FOqDyRa0pWpAJp1VhA2getAn8
 jff/jqbKHg5VHt2UPGepdw6zZFZV1DgwM7W823p6QWczD8Ak2TPFtdEKXVqR9foF70UjOqBMzj1
 bRSZpStXJ8Vp+7pD+YRGpjr8sQCJCKvrYqRRmZs7numBo8meKuRfpw/YpHDx+n5Fcp4aNuCw/HG
 2sAG5LD71LzvXv/ZfYLQQK+qVyz+VR6LdNIxFWq/koVJgywMD7wPl7EZLlzB2MI9+kDBq8NFddE
 6iDV9Yf3W/cdqggp9ONJAJFsWnDGpWcKY8QZ6IkfIehNQYHWTTzJ+GmhGVGMyae2AumUlq82NLk
 Gb9uQRMwAAYr2kpb8e31a81xN+X+frJAYIZ4462hNQQTnRr6Nrpb3bkMYBSRjJgMuESTn33oDCD
 9fxUXxdSv/41YT2vsNw==
X-Proofpoint-GUID: Ib0S_yCnASe9pSqc736mu6A3d2LkQkob
X-Proofpoint-ORIG-GUID: Ib0S_yCnASe9pSqc736mu6A3d2LkQkob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110014-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17BF45E75F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree include for the IQ2390S variant of the Shikra
System-on-Module, an industrial compute module integrating the Shikra
SoC and PMIC for industrial IoT applications, designed to mount on
carrier boards.

  - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)

The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
definitions specific to this variant.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 170 +++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
new file mode 100644
index 000000000000..73945bf42112
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	gpio-key {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8150-regulators";
+
+		pm8150_s4: s4 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s5: s5 {
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s6: s6 {
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		pm8150_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8150_s8: s8 {
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm8150_l1: l1 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l2: l2 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8150_l3: l3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l4: l4 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm8150_l5: l5 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8150_l6: l6 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l7: l7 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm8150_l8: l8 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l10: l10 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l11: l11 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l12: l12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1950000>;
+		};
+
+		pm8150_l13: l13 {
+			regulator-min-microvolt = <2921000>;
+			regulator-max-microvolt = <3230000>;
+		};
+
+		pm8150_l14: l14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1910000>;
+		};
+
+		pm8150_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8150_l16: l16 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l18: l18 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+	};
+};

-- 
2.34.1


