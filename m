Return-Path: <linux-arm-msm+bounces-109899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CVEG2vYFWpYdAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:29:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE185DAADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A0913144D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F3041C2E4;
	Tue, 26 May 2026 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7dFU35Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQyw8f88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95DB413245
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815634; cv=none; b=bgfX9KXUVdTWX+dILouRDc8ZLtGfGA7hG+0b8BCSvTRQpvu2QAxY1LzG+y5g59YPrkSFgqNR7vUEfI6IqSn1hJO7JPNh17I04wuVxN9yIyu5vEr7wbi9KED9db1L4TiaaINIg95Ey298kUsSo10Id+e/eeSpNfSHxAnBxL1Hgvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815634; c=relaxed/simple;
	bh=wUE/ebaxyKGDfHiUqCyM5jXPVqYMeyt2f2pUluNnCSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqz9coBCYpCLmY3Ud8L8ikxT3ljPN/y4Vcm2xvffqcRmgewQdDBcOEMaMEptAxq+NWOxBmxMRoU6/Ul/kd0nxefQ78od4c80tCFuS7iyWpMM2VpgHrtT3akuWQVBLNT04oFyVP8XrsDdVwlsXUrU8Oh0OzYfjfYgctiXq1FoSpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7dFU35Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQyw8f88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dES3147108
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHWN/CpABQpi5ue90hqnc7ukBQhLZVofwHgxOgWNJgY=; b=L7dFU35Z3epDssGg
	M2xP8S/TbeWLV1VeBbolA6B3kNJAPHA4m0X5VDYROVYcjaXuC3qtMAi9Za0oKz54
	6v5L2ZOtrkbfiAfnomKnXGj12kbO9HtQFDhSvjXJtJL1AZ33JrdVkg3aiFQRN4d2
	3M3UgHvzVctQ2r29ErlmV0qvJqwrSoGIgwo8LuEcWjL0lPKVasMNDxvl/SBbD+Dq
	dxHkcAG/lJSSt+kw2rW4DNLFk9dkxSrMYQ/M4ZRdUGYWQV+h+npmhDc7oik0siGp
	s63lH/dZ9uKGveKN/P2QYo5GZzqnmK0CWpv4jWBjNQ+kU2MO4aTOtFPmfYeDNCaG
	8F6tmQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3u4ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so10787548b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815629; x=1780420429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHWN/CpABQpi5ue90hqnc7ukBQhLZVofwHgxOgWNJgY=;
        b=cQyw8f88rZMiCjwa6soGSHAfKnK4ADmCNJgO/hDWTRsDpgb0EroXConeIsEzPIdws5
         CzpeJsriKA20TKwwmQ3pIGX8pfaqh2ekKOwc7fyXsUsJUnRNtWVCjNVo8UmTC4tCBIyB
         u+H5vr54uy78KtXbsd/5wIgUYRfCmMa1BpKXYYTFzMn63TiH9yoBVHobZ0/PGyNW0JWs
         bXzSARSo5zFZ6NKk5FILDhYahKD5blUPGElBQcMhLbTw2xIMxkwobJdUvWquAFgaeVwz
         //vOd3nCffrieZKhMvAzau2ryGkoH7ZpracKoc0sNiQ/FOVppxAWjlWfZvwRB0ATAJg7
         p7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815629; x=1780420429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SHWN/CpABQpi5ue90hqnc7ukBQhLZVofwHgxOgWNJgY=;
        b=kll/FyD0NqGz99cNXRAF1H/6kJZll5zeHikyfZONY8H0Waa55F2xdCsF8QxmEzlpau
         DUy4kGq2Ub6AlFX6PJE5ynXznk/QbObY5UfLjXWbZbX6bJ6HnjCP0WOsdn6nH9hny1DV
         70RWhz1tyzamOKn8afDVopbHAtPuHRhRVNHUo1rMlReLGkE2ZO4pv2/BeIiJuleBC4PM
         PaBpx3GvBadK5VmUBmRHB4a9Zhu+38ufLAqFcfK955NBxwnwtUhaWKzGHf01KoC5GtZW
         Cp9V3fVoctm+fIjwlCLxw3Z29h28CGc1YrE49f5TIlCSIhnpA5jkTzSq1WpM060G60Gi
         W2Rw==
X-Gm-Message-State: AOJu0Yx7saj8c74hklFSeqdeY0FFiH69UosPVF3GsP0gumNdDdw4M0X0
	eVE9URww4L8eZjzKoyuxyNz6HNrqu5+vQy+WdVdKfA8l0TPoF+icjh5V8D/a754B3HRe2Xkv4KJ
	bZWkYm33mBVBBp+d5RZSSbNzF6je1jQZ+8rNvvoyCD9upcV1MztTnqgvrvEZc65OOyU+v
X-Gm-Gg: Acq92OHjJ3j4SKk8/diJkhhug6a8LqNh7ShdsVCa4NA9TxuUWWck9L09+M5RU8bDCeW
	W7MFey2jFY8Kh34QSHGSRNsJc9Zjj2yFDXTxBmBvCxoDOFYTL0cr1JPPdkxRf7cf8rJp4oYcDIt
	TIw9TV3063L+D/gzVkMpo7y+m/ADiSeY9Py5AYebDg89lmFQPTg09tlN/B5UbsIg8P6VyKEAx1J
	eUs4BG6rD8C/v2jLqL+EW8T3PF+95m9cPPna1U3+lXhfvzapzbwfjpMeFuuelk5MqUkGxD61J+y
	beDU0XC5OcW3FYCED98fwoPg2bPVeW/BWC25cu7Un2gQSnGOhp38wB2WTqv3f5XGNexy2oeqOUE
	w75HqcJrnsIIg8X4R5ifAiievvtg5+FM9+h5Pr39HttIoARNTj0Po+Rxz7O1K1kk=
X-Received: by 2002:a05:6a00:4503:b0:837:c1f8:6e55 with SMTP id d2e1a72fcca58-8416112c734mr14803838b3a.14.1779815629333;
        Tue, 26 May 2026 10:13:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4503:b0:837:c1f8:6e55 with SMTP id d2e1a72fcca58-8416112c734mr14803793b3a.14.1779815628747;
        Tue, 26 May 2026 10:13:48 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:48 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:51 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add DT
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX/4Krsp4vUi76
 8uNOOHYVVUBN9dLlxYFrVCpGoX+id/TW5/EOVsAneowyb8jTOTC1BRIs6xX0+iKsVKaW2xSA/C7
 8wVdzXhljG/r/OtDzkR3O1kHNsujIPijd0saLpW2Gz94YDE/5E1W59CYXPk7o2IEB8tMwa68ZSu
 GuAeVNrF8MtVcN4GZiROYmVaw/4DoQRKvx6Pb1+cNFe4lxPsgjiaUHHkfXaInX3gEclcBHzvIM3
 htFGeKHycYTW/ZSmyGWfPHYwck7MR5gm8v/sVZy1iJ2dewtLnJdn0W3fVU68vZUW4j/uBSY5RQj
 pCH3MU4SF9kRqe3Xg7JF+Qn45Imnh1PjwNDZ9kYfftxu8jotwiyY2fM9yOPFjRi2dLSDIWqgLg/
 n/7GKmWC4x+8uMAUQ8ab5DYY/1t3FOBnNVSKeEg0Md9xMIh07gRhjqxB8ltF4Wqg4qcVWL9IqBG
 WT4osQYoYWCk9+7X3aA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15d4ce cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2GryoL8Qn4L11UQNV9cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: vADMYtBcGaRQN4NoU8_xVf81L-ynHVaz
X-Proofpoint-GUID: vADMYtBcGaRQN4NoU8_xVf81L-ynHVaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109899-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,qti.qualcomm.com:mid,1a:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADE185DAADF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 +++
 .../dts/qcom/shikra-cqm-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a9e9d829fb962386b3975f345ec006504607130a..df41830e18edff82893ca24ca84d7e03065d0ef7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..aedcd164810cf687efb425da79ace7ec6453e3a5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mclk1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


