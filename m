Return-Path: <linux-arm-msm+bounces-100119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH+dFPxCxWkU8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 15:30:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83347336C95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 15:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A1BE3171558
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788883FEB16;
	Thu, 26 Mar 2026 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBWEqlS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJhHMSyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F203FE667
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534874; cv=none; b=XCS+PlAxRgUDH0aAepGZk3/EIMqyMX/RD+8Zl58tWfDqjCA+Jh+PRCLzwSPVjCI/FKkq6LfCkDRaX/KPywGxg4rAByDnPlCy2jzV9VZVJqeWA4y7ayn42wOmQpSxjRmcYgGLO8yuDOfOz+aUJtOTh7g45xIyYxyCxEgvTdiLflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534874; c=relaxed/simple;
	bh=Tbj+FJiaVihqpaJtOJ8B5XK2bjg31LeJ89gNn6jXDVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lc3dgUK+tGxMizbt5mWPGKgoB52ualLYZ7rH7g908ptM18tHluHZwaHQY+hg4CoZRqf17wXn2TAAvUmu+0yB48bCJ6qYTxzDFYBvR7c+Ru3V9luxHS6yEHbGDKEr7V6b3mwGoaqt/7sT6396ndMfAlcU/k7kLHHPCJdAQAwv8FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBWEqlS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJhHMSyd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q9Um9e3769079
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 14:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VDQHVZ08vUgV1HYl345axi
	qTnb4wrIc02lNQ2mkykU4=; b=mBWEqlS5owvHVrrZ88L1WFz9EOSrJwTYcRZ7aO
	R//moQbo9Pnh5FVpt2Ay+dq6UPEUCWebi9YziUtt+IsArGPkcR+dMM1XeartKwbI
	vsBlnzQO0zvRZ92Nfc5H006DZA3MNsH4yZy/iRLQtKS5e5Ci1CKmBYVCEESqrfvK
	7i9ZL0vwWYfYW0l4usr9vDXZXuPoKw8UGJWLza2jXuGm04XQkNcoDOSyTdGUUqOc
	YgjEX86SlW/5ATuetpAY8rwMFH0Fi56ImZq5DtpcIxa0wJc5vZh/d39Ss/C0NBG2
	HKvhonpSOVBipOTyyZHduBXl38A7lnqWBNxkIZqpcOlI5lXA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527yry9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 14:21:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so1007077eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774534864; x=1775139664; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDQHVZ08vUgV1HYl345axiqTnb4wrIc02lNQ2mkykU4=;
        b=SJhHMSydOwtJS5UInt09PevfBvhDhJrSdCZSxe9DUJdxOfKv5KANcyKiaOw7HI5D+e
         WYFbZTZDmtR5ysAPTevMq24JMSod5/0xL5pn21tsTUI+taX2ypIY3bJtaaYWl/7eQ3vT
         e3en4vKE8pqsNSZ8e+TZrl8ArmwIu4KLzC1dea//6/MEQAnjBQdJJ+8JdyQh6+7j35/d
         a6ACfFHcIctJ+8oPbWqi6eNJBdGKaW9pisqgzI6jtyWFfbY+J+YjjwqMlM/W2VbToy3K
         6Tt9udXq1M6+SuSrrtDX9ugt8LmCiQkbNFFhdPxEGXLFvPOJbP3DIvodiyX0o1QwC7mf
         HHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534864; x=1775139664;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDQHVZ08vUgV1HYl345axiqTnb4wrIc02lNQ2mkykU4=;
        b=d3fWcs1oszEuRnn3fc2gel5EN+6prS7RiPSpIhUJvgavqd85qYmCu/46hTNKwNqD2h
         pyQfBgalgL/hIt6knuvQ0saBO2a2V5OGNP83RtM0wzT9PIeOefaPRsQTwobW/laOJNGM
         hmqD97YtZNHboFBmsOeSu4Nh4voYIopne4NAWpfUK+zu7dN+c8AV7ue2XtIHWdDwXrhR
         ZhYCIEmH1tpfUwy6YYiD1btWLimTMe852tOmQ1rjGxEOavRj7UZdrRl6haBJttNvVve0
         m9Ts6yPMgEi3lC1z8Ba+9rKag76xzR+cUWT8XchciOtehLHew2gTnr5+BMKbkQXm+SH9
         KhiA==
X-Gm-Message-State: AOJu0Yyje/pD6lZchP/xMrPx2OjaBXHLNUVeK7BVmX7hziHDdXdBBQow
	GqM6JGJ7P0mxxMsm8Nb7SqSR1TvaW2ZPDvN9HQIF0wPGbsQufTinWnXQmxPtMYHpXYh2BE6wy4Z
	TNNJFIaThENGvTg6CnGlTdTzhZB45qwxF164ZPbEcFG6IVib6lu9QQeUlkffrEkxvqngI
X-Gm-Gg: ATEYQzzAB2KP7dC+VT4R+x32KuDiXg6J9QqA0+K7N1VNSMpwzO78767drJQ8qQ3Tu+H
	cBR3WrVerGP0H4Hez5pUE/aoW2My6N+0EA93qDLw7VLGt9+4BZY9aiYTF1fTIZRMEoWWNZL/YnD
	hkwgollRtvF8eKNsWixCQBEzvv9+s2luuk3tOHrxs4M9zIs/bHc8ZTgKaVOrg4fAqmpSn0n8Mwt
	H2vSQTIrXFlzMQxb52MdIdnBH1r/SnQisCwHiADXUCjcVz/GZd9BASrO+duG2pidSJx+xdcimEN
	9AdAWlAQnakLhlTQoG9a8UBpZm33RPgI0rPb8rfc+T7ZGt4mnnLboi46JfeaSHp7rKpCJvWDzqt
	h4ckX7KkpBnBjrwdCmdHQzRjbE7trioTDs52myQ3GPdXvnFwUor9IrOMPk59VtgBBaahR1Pct8h
	pEXCeg7sl7Yw==
X-Received: by 2002:a05:7300:8b05:b0:2c1:161f:ac39 with SMTP id 5a478bee46e88-2c15d3e3b8cmr4429870eec.26.1774534863953;
        Thu, 26 Mar 2026 07:21:03 -0700 (PDT)
X-Received: by 2002:a05:7300:8b05:b0:2c1:161f:ac39 with SMTP id 5a478bee46e88-2c15d3e3b8cmr4429841eec.26.1774534863289;
        Thu, 26 Mar 2026 07:21:03 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edd570asm2305992eec.24.2026.03.26.07.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:21:02 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 07:21:01 -0700
Subject: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMxAxWkC/x2MQQqAIBAAvxJ7bsEMovpKdDBdbSE1lKKI/p7En
 OYw80CmxJRhrB5IdHLmGIo0dQV6VcERsikOUshOtLJDt93+SOjVeijU0fsYMERDGfuhtaYXBb1
 A6fdElq//Pc3v+wF7Lkq9awAAAA==
X-Change-ID: 20260326-glymur-mahua-common-nodes-893fd80808cb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774534862; l=17735;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Tbj+FJiaVihqpaJtOJ8B5XK2bjg31LeJ89gNn6jXDVc=;
 b=U26s6Fl4IX+96awYP87mzXuK3ukbZsaQ4NTV1eka5DalrdByUMuhH4TzFB3/OaeGsHByu937u
 mtnobmpwaFYB9c9GSgf/+ZaH+0i5ttSc8z3cqt9Ud9bG3Fxfzm96cGb
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c540d1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=T2yTr6w6SiGCZho6VmIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: fikeGNJiRI0TVSkWZtNJDjGsAPexfNOs
X-Proofpoint-GUID: fikeGNJiRI0TVSkWZtNJDjGsAPexfNOs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEwMCBTYWx0ZWRfX2p1EH1LdofKK
 Rm7wFCIH8T6W28+SyU4B9SFa3+AGFLTKn3o6tffjXMHckz31Ss3mYMdr/vOIjPcOIZB/2dKQTUa
 h2ITs/GpLWPsROSKRxAe4rFk/cb9cALoOTgu0RRBXut0a6iWH2xZXnB49R8qY2cZnIg22HLQA7h
 Du5AMKlwZOQC/qKBkvfYSK4HiAUx0qJDv3EzHLFkjV3iFJXcwRRnptt3UDHqVIPihqRm9R1l1Er
 /PIubpNowxbT5FaurOaZRUCSzQKNyF99NjXpSM35Zjj6uwqgxvQiESxjLeasUjT1nlIR5Eay01T
 AZE4q1w/28gRwNn4sRjWTV0zoXclquJvB8nljhXe60snOI9FL/bjkliCbSUAr5KUUlI35F597gm
 Rqk2fDwlfn8it0exuT3q7CX35/YfC2plP1Vm9wFubID8/MOpte7xXQGsL2mFdbdLT8f9rkG8hwE
 b7NOSPa1ETQnKfiinLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260100
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
	TAGGED_FROM(0.00)[bounces-100119-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.43:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83347336C95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The display, peripherals (touchpad/touchscreen/keypad), usb and their
dependent device nodes are common to both Glymur and Mahua CRDs,
so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
reuse.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts  | 403 -------------------------------
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 401 ++++++++++++++++++++++++++++++
 2 files changed, 401 insertions(+), 403 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e..0efd9e27c82f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -8,410 +8,7 @@
 #include "glymur.dtsi"
 #include "glymur-crd.dtsi"
 
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
-
-	pmic-glink {
-		compatible = "qcom,glymur-pmic-glink",
-			     "qcom,pmic-glink";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		connector@0 {
-			compatible = "usb-c-connector";
-			reg = <0>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_0_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_0_qmpphy_out>;
-					};
-				};
-			};
-		};
-
-		connector@1 {
-			compatible = "usb-c-connector";
-			reg = <1>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_hs_in1: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss_in1: endpoint {
-						remote-endpoint = <&usb_1_qmpphy_out>;
-					};
-				};
-			};
-		};
-	};
-
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_misc_3p3: regulator-misc-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_MISC_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&misc_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchpad@2c {
-		compatible = "hid-over-i2c";
-		reg = <0x2c>;
-
-		hid-descr-addr = <0x20>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-};
-
-&i2c8 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchscreen@38 {
-		compatible = "hid-over-i2c";
-		reg = <0x38>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&ts0_default>;
-		pinctrl-names = "default";
-	};
-};
-
-&i2c5 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	ptn3222_0: redriver@43 {
-		compatible = "nxp,ptn3222";
-		reg = <0x43>;
-
-		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
-
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
-
-		#phy-cells = <0>;
-	};
-
-	ptn3222_1: redriver@47 {
-		compatible = "nxp,ptn3222";
-		reg = <0x47>;
-
-		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
-
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
-
-		#phy-cells = <0>;
-	};
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp3 {
-	/delete-property/ #sound-dai-cells;
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
-			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pmh0110_f_e0_gpios {
-	misc_3p3_reg_en: misc-3p3-reg-en-state {
-		pins = "gpio6";
-		function = "normal";
-		bias-disable;
-		input-disable;
-		output-enable;
-		drive-push-pull;
-		power-source = <1>; /* 1.8 V */
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
-	};
-};
-
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
-};
-
-&tlmm {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-disable;
-	};
-
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-disable;
-	};
-
-	ts0_default: ts0-default-state {
-		int-n-pins {
-			pins = "gpio51";
-			function = "gpio";
-			bias-disable;
-		};
-
-		reset-n-pins {
-			pins = "gpio48";
-			function = "gpio";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-};
-
-&usb_0 {
-	dr_mode = "host";
-
-	status = "okay";
-};
-
-&usb_0_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
-&usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&smb2370_j_e2_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
-
-	status = "okay";
-};
-
-&usb_0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
-&usb_1 {
-	dr_mode = "host";
-
-	status = "okay";
-};
-
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in1>;
-};
-
-&usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&smb2370_k_e2_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in1>;
-};
-
-&usb_hs {
-	status = "okay";
-};
-
-&usb_hs_phy {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&ptn3222_1>;
-
-	status = "okay";
-};
-
-&usb_mp {
-	status = "okay";
-};
-
-&usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&ptn3222_0>;
-
-	status = "okay";
-};
-
-&usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index abc6cc8bb0a8..5ba9e586f3cf 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -10,6 +10,8 @@
 #include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
@@ -57,6 +59,101 @@ key-volume-up {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -364,6 +461,135 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_0: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_1: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -469,6 +695,19 @@ key_vol_up_default: key-vol-up-default-state {
 	};
 };
 
+&pmh0110_f_e0_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
@@ -478,11 +717,41 @@ &pon_resin {
 	status = "okay";
 };
 
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
@@ -575,6 +844,27 @@ wake-n-pins {
 		};
 	};
 
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
 	wlan_reg_en: wlan-reg-en-state {
 		pins = "gpio94";
 		function = "gpio";
@@ -589,3 +879,114 @@ wwan_reg_en: wwan-reg-en-state {
 		bias-disable;
 	};
 };
+
+&usb_0 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_hs {
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_1>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260326-glymur-mahua-common-nodes-893fd80808cb

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


