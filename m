Return-Path: <linux-arm-msm+bounces-102272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APrKCH0J1mnbAQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:53:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE583B8981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F23C3046531
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD9D37CD22;
	Wed,  8 Apr 2026 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tlm2r4QY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XiCK7fHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE074396B6B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634653; cv=none; b=mZbqONPf+ocvyiUSV9pFL/Hzvcjw3yba406cz6lIkkVEx99qgNcHw9mkNQNxJZslPAhE+7eGvEcQRx4BFq4w9nb2WZ0eVblKYqHNVb8GGDQ8DdJggSd59v/oyX+LvsYXpgHNjTAcMmiQyfZCSAyI0UmYaYCIThVBPmWa4bhC7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634653; c=relaxed/simple;
	bh=EIeM+t29XNIHDQvipmBScWTb+A5wUwv6QS6SoQAhEIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RuUm/8o2oMq89w0WgY8hQF8yjz2NAdWpJTpUKmuoqw3ZqnjQ/O++pKvX4fNpPsnGKILPVJjlsYpmIO2CZYnImBdHH30Ku/iNUIUhZGxMP8OlFPyr8T8dffz282iZAAghM6kl6k+HjhgCIphb3Uahk9GpI3V8PSn+ULzJEX/Nq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tlm2r4QY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XiCK7fHr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6386XxYv249490
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NsLUC0EGP86KdwsOPYVf3CT+Kl1T1KsK0v0
	/JYiR1kU=; b=Tlm2r4QYpMCoFz+aNnF2qxlkvjo2cRWMMJ1/FEHVVGVga2kozp/
	T1lF0Tt2P2IJhY/o7FFKKvgQmuCYbsIRmvJAdZIsKfEUbfWFGvkKrGDXbiVys22i
	6CnTQ4lPagYVTmmakhqQH9if8mXb44PwtyQXTO+epoSzKueMPSsgq4De+si9mVIg
	StFPzC3K/Gy6HLhs3OEkjexZEYq0zMuKE3bXNyD6hhtrzYGd3kclS+3XbFZTXDkx
	rjbS26kpo5bXapWrw7nYIfTYEknHrxIcocpxPveb9pJyPNcOCFwk9m8JwQJ6Ti7J
	pbZBSbFnlNBq0SEv+HEYtenzqH50cS8vExQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x99xb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:50:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a855dc82aso3524787b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775634648; x=1776239448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsLUC0EGP86KdwsOPYVf3CT+Kl1T1KsK0v0/JYiR1kU=;
        b=XiCK7fHrdJdoVT9zx0TBET2JajsCMENt1PuBIczAKn1WLv/FMZB/0tuNomPBGH4O24
         z9Am6HJ8EQk4BFkYKrapN+YYWt0alVZeTchg7qzv1S1dI/tGhqPuBesR0qOEVwdG2m/8
         oZn6pQ2DgYA3KKGdsQ4L3QBxqiSoULaaJjwd6NukIz61IK54lwoIASRfDjq6HgjDA4te
         qhpNk+ADpObcJzD0kCGnrls1WISypN45ZIIrRPQTOGrnvZN3MFnMX0ig69CJVS4cINC2
         bYn5CKJIudDddG/Ix/cZAGoxsNnntbRPbTATnyWZT5JJV9f9R9tkd346523mOGWVx9JW
         e4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775634648; x=1776239448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsLUC0EGP86KdwsOPYVf3CT+Kl1T1KsK0v0/JYiR1kU=;
        b=PoRhPguYmi77OdJaUPN4KUF7vUbTJrNiViuGfmq4RYK57hhhLOyPBx5i+IIXLF4tZd
         aM0wkWE3KZK9n8n57NYFt8+0BKlalC8gfnDnLCLU2H3nTR1DrbDShzJAFnpe85sdpnYp
         93l3GWALdXpoRH4VXU8d/dEuiZmm6i3reXEq+U6lruna9BLa/G1AbWoPKt+XJVwY5L9N
         J0OdD2IBkkjBuE9kgXXSk5+lJnZpmfjgB8kmwPhv7S+Gd+EyDQr1LIrQgOAlp2EKvooY
         MYJMs6cWdMvKgq7NnKdTEmlK4B/bGqhkvcyqmC2DHBNHuWdU4V8REocaKVvQDArA9e1m
         ts5A==
X-Gm-Message-State: AOJu0Yxo3gwNQAADIi98eN8ZOXyPpZ1gQETxrml2E1O+ThZLpMK8ZiS9
	Nb5a+y0bG7uAV9fpJ/uZU823VAZYrGXtOpOKpUnDKu3oDDe16ezUU7G3qkT8rJ35C+kZkjkuOZi
	ni8rMLkFB1loJmynYC2vB289Mu0FbYI+CleabsHLnU19uwdNH8P+JQjG1LVFp6S0EYmLU
X-Gm-Gg: AeBDietVs1gOD7l0KOKi7FrMvSDK8KMJcFEEqP4/yCXxG2CqytLxbVfTd1Y2l2lNT/1
	xehepGT58UEQm3HQoe6kjrbOdXB3lt8mpL3AwzZa4DCoIFEC9yuhSTrL4kCbQJ8xeOVNqJr2zTN
	Hw3cM8hoGkKdrbRgktUxFqDhuRcGdSKDzYcAYDeTDAMJ/C5gh7n0GY8aYzQ9NmN5WFL6AXy1vg0
	G4z4p7nBMMJsIu8ZptBxIR5sZ0nDhyaw4JhDEefMhE2hJvQrrGTNmhjndHOJlL9CbsYl+No4Ibz
	6U0tJbCmXbsgGIgvifVDYnGxgwqouBneAUQTwC/kYq0DuGgRxLfYenvUGfT2V9OIWdH+6SfQ0ND
	3yPKyTkjx7oN/Huj/5KzCetd3lJXL9ZNszdm5VHk3tubK
X-Received: by 2002:a05:6a00:3010:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82d0d73f532mr19693390b3a.0.1775634647635;
        Wed, 08 Apr 2026 00:50:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:3010:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82d0d73f532mr19693342b3a.0.1775634646851;
        Wed, 08 Apr 2026 00:50:46 -0700 (PDT)
Received: from cse-cd04-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm20896547b3a.12.2026.04.08.00.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:50:46 -0700 (PDT)
From: Xueyao An <xueyao.an@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: Add QUPv3 configuration for Hawi
Date: Wed,  8 Apr 2026 15:50:36 +0800
Message-ID: <20260408075037.1891708-1-xueyao.an@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d608d9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3IeebL_cuh-WR9tarUkA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA3MCBTYWx0ZWRfXy1wOVQJ7taEL
 Q/uGoYxrQikXL0JF1dtjV7MuNAsNwEfaNL/VTJ23iI8mXHNYv9Sh1w7CD6wWV4hGAGWqVm8LTdz
 g/X01C2dqnLSX9/WSIRlywYIQxyQljLciX5HCDHrNajA5KqqXXnUu2m+Bv0wglpA4zhKWaJ6IZF
 SvGqCnR8OaDYjap7QwaQPCFvhaFiQPiumPbNBk0qctKBkcD6jJARpUIM7fb2Aj8wC/EG8agZ5a2
 BnBqYvUKv7B9PbC6CxvfTcK/1O/jz3UmEw+uORHkcDA9sDIhpIWMgIr9GNJOIHGqZF4UuouYZoK
 S5OlYTDJRO4Ld1Yzd+q8ConFKZKICFaTka3TqDG5pn7w2A2R4svj3Nq8fj/rjA4A02UijcMTcMb
 az1MEP6m7zVb1pitTYGpgBosFfda9MuFooL1TcCBITjd3HbW4FiHsyQRCx2ERsFHnymbASEL9wW
 YgL3+fdepvVyFwkH0HQ==
X-Proofpoint-ORIG-GUID: vr1Iq-vdPRAVPaUlkqE7JXwj4w_tKPES
X-Proofpoint-GUID: vr1Iq-vdPRAVPaUlkqE7JXwj4w_tKPES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080070
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102272-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueyao.an@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CE583B8981
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DT support for QUPV3 Serial Engines.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2133 +++++++++++++++++++++++++++-
 1 file changed, 2120 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 220ec0a82fc8..331f15916ebd 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,hawi-gcc.h>
 #include <dt-bindings/clock/qcom,hawi-tcsrcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -810,33 +811,1637 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		i2c_master_hub: geniqup@9c0000 {
+			compatible = "qcom,geni-se-i2c-master-hub";
+			reg = <0x0 0x009c0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
+			clock-names = "s-ahb";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			i2c_hub_0: i2c@980000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00980000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 528 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c0_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_1: i2c@984000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00984000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 529 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c1_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_2: i2c@988000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00988000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 530 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c2_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_3: i2c@98c000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x0098c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 531 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c3_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c_hub_4: i2c@990000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00990000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 532 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
+					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				clock-names = "se",
+					      "core";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&hub_i2c4_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,hawi-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+
+			interrupts = <GIC_ESPI 900 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 901 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 902 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 903 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 904 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 905 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 906 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 907 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 908 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 909 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 910 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 911 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 944 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 945 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 947 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <16>;
+			dma-channel-mask = <0x7f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0xb6 0x0>;
+			dma-coherent;
+		};
+
 		qupv3_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
-			reg = <0x0 0x00ac0000 0x0 0x2000>;
-			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AXI_CLK>,
-				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			reg = <0x0 0x00ac0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AXI_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0xa3 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			i2c0: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 892 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c0_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi0: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 892 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c1: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 893 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi1: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 893 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c2: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 894 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi2: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 894 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c3: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 895 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi3: spi@a8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 895 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c4: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 896 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c4_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi4: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 896 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c5: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 897 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c5_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi5: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 897 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c6: i2c@a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 898 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c6_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi6: spi@a98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 898 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart7: serial@a9c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x00a9c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 899 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart7_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,hawi-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+
+			interrupts = <GIC_ESPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 912 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 913 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 914 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 915 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 916 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 917 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 918 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x1f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x36 0x0>;
+			dma-coherent;
+		};
+
+		qupv3_2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x23 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			i2c8: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 417 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c8_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi8: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 417 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c9: i2c@884000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 418 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c9_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi9: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 418 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c10: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 419 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c10_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi10: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 419 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c11: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 420 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c11_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi11: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 420 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c12: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 421 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c12_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma3: dma-controller@1900000 {
+			compatible = "qcom,hawi-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x01900000 0x0 0x60000>;
+
+			interrupts = <GIC_ESPI 652 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 653 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 655 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 657 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 658 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 661 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 663 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x1f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0xd6 0x0>;
+			dma-coherent;
+		};
+
+		qupv3_3: geniqup@19c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x019c0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0xc3 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			i2c13: i2c@1980000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01980000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 437 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c13_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c14: i2c@1984000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01984000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 647 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c14_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi14: spi@1984000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01984000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 647 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c15: i2c@1988000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01988000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 648 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c15_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi15: spi@1988000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01988000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 648 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c16: i2c@198c000  {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0198c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 649 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c16_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi16: spi@198c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x198c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 649 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c17: i2c@1990000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01990000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 650 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma3 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c17_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi17: spi@1990000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01990000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 650 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma3 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart18: serial@1994000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x01994000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 651 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP3_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart18_default>, <&qup_uart18_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma4: dma-controller@1a00000 {
+			compatible = "qcom,hawi-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x01a00000 0x0 0x60000>;
+
+			interrupts = <GIC_ESPI 568 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 569 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 570 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 571 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 572 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 573 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 578 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 579 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x1f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x136 0x0>;
+			dma-coherent;
+		};
+
+		qupv3_4: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x01ac0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_4_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_4_S_AHB_CLK>;
 			clock-names = "m-ahb",
 				      "s-ahb";
-			iommus = <&apps_smmu 0xa3 0x0>;
+
+			iommus = <&apps_smmu 0x123 0x0>;
+
 			dma-coherent;
+
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
 
-			uart7: serial@a9c000 {
-				compatible = "qcom,geni-debug-uart";
-				reg = <0x0 0x00a9c000 0x0 0x4000>;
-				interrupts = <GIC_ESPI 899 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+			i2c19: i2c@1a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 920 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S0_CLK>;
 				clock-names = "se";
-				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
-						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c19_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi19: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 920 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core",
 						     "qup-config";
-				pinctrl-0 = <&qup_uart7_default>;
+
+				dmas = <&gpi_dma4 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma4 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c20: i2c@1a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a84000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 921 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c20_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi20: spi@1a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a84000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 921 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma4 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma4 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c21: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 922 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c21_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi21: spi@1a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 922 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma4 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma4 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c22: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 923 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c22_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c23: i2c@1a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+
+				interrupts = <GIC_ESPI 924 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP4_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_4 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_4 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre_noc MASTER_QUP_4 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma4 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma4 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c23_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -852,6 +2457,492 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio66", "gpio67";
+				function = "i2chub0_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c1_data_clk: hub-i2c1-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio78", "gpio79";
+				function = "i2chub0_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c2_data_clk: hub-i2c2-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio68", "gpio69";
+				function = "i2chub0_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c3_data_clk: hub-i2c3-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio70", "gpio71";
+				function = "i2chub0_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hub_i2c4_data_clk: hub-i2c4-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio72", "gpio73";
+				function = "i2chub0_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio80", "gpio83";
+				function = "qup1_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio74", "gpio75";
+				function = "qup1_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio40", "gpio41";
+				function = "qup1_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio44", "gpio45";
+				function = "qup1_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "qup1_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio52", "gpio53";
+				function = "qup1_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio56", "gpio57";
+				function = "qup1_se6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio0", "gpio1";
+				function = "qup2_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio4", "gpio5";
+				function = "qup2_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio117", "gpio118";
+				function = "qup2_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio122", "gpio123";
+				function = "qup2_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio208", "gpio209";
+				function = "qup2_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio64", "gpio65";
+				function = "qup3_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio8", "gpio9";
+				function = "qup3_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio12", "gpio13";
+				function = "qup3_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio16", "gpio17";
+				function = "qup3_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio20", "gpio21";
+				function = "qup3_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio48", "gpio49";
+				function = "qup4_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio28", "gpio29";
+				function = "qup4_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "qup4_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio121", "gpio84";
+				function = "qup4_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c23_data_clk: qup-i2c23-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio161", "gpio162";
+				function = "qup4_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio81";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio80", "gpio83", "gpio82";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio77";
+				function = "qup1_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio74", "gpio75", "gpio76";
+				function = "qup1_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio43";
+				function = "qup1_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio40", "gpio41", "gpio42";
+				function = "qup1_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio47";
+				function = "qup1_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio44", "gpio45", "gpio46";
+				function = "qup1_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio39";
+				function = "qup1_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup1_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio55";
+				function = "qup1_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio52", "gpio53", "gpio54";
+				function = "qup1_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio59";
+				function = "qup1_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio56", "gpio57", "gpio58";
+				function = "qup1_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio3";
+				function = "qup2_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup2_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio7";
+				function = "qup2_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup2_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio120";
+				function = "qup2_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio117", "gpio118", "gpio119";
+				function = "qup2_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio125";
+				function = "qup2_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio122", "gpio123", "gpio124";
+				function = "qup2_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio11";
+				function = "qup3_se1";
+				drive-strength = <6>;
+				bias-pull-up;
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio8", "gpio9", "gpio10";
+				function = "qup3_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio15";
+				function = "qup3_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio12", "gpio13", "gpio14";
+				function = "qup3_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi16_cs: qup-spi16-cs-state {
+				pins = "gpio19";
+				function = "qup3_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi16_data_clk: qup-spi16-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio16", "gpio17", "gpio18";
+				function = "qup3_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi17_cs: qup-spi17-cs-state {
+				pins = "gpio23";
+				function = "qup3_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi17_data_clk: qup-spi17-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio20", "gpio21", "gpio22";
+				function = "qup3_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi19_cs: qup-spi19-cs-state {
+				pins = "gpio51";
+				function = "qup4_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi19_data_clk: qup-spi19-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio48", "gpio49", "gpio50";
+				function = "qup4_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi20_cs: qup-spi20-cs-state {
+				pins = "gpio31";
+				function = "qup4_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi20_data_clk: qup-spi20-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio28", "gpio29", "gpio30";
+				function = "qup4_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi21_cs: qup-spi21-cs-state {
+				pins = "gpio35";
+				function = "qup4_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi21_data_clk: qup-spi21-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio32", "gpio33", "gpio34";
+				function = "qup4_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_uart7_default: qup-uart7-state {
 				 /* TX, RX */
 				 pins = "gpio62", "gpio63";
@@ -859,6 +2950,22 @@ qup_uart7_default: qup-uart7-state {
 				 drive-strength = <2>;
 				 bias-disable;
 			};
+
+			qup_uart18_default: qup-uart18-default-state {
+				/* TX, RX */
+				pins = "gpio26", "gpio27";
+				function = "qup3_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart18_cts_rts: qup-uart18-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio24", "gpio25";
+				function = "qup3_se5";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
 		};
 
 		sram@14680000 {
-- 
2.43.0


