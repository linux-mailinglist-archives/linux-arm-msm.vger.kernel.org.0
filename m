Return-Path: <linux-arm-msm+bounces-102575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIoWBEhz2GmodQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:49:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 983773D1EEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D030C3020198
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C2C330307;
	Fri, 10 Apr 2026 03:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmT2lBqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAJ/Ntdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B1322B9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792958; cv=none; b=qwk3vEaiO3tZB3btbRuxHq13gzsxfCiRc6RHQE8xHuyrHc3Ft8NSRUoko9xIPYEP9mB9oTykf0xyTJwH57D/RYaUDNvjkIkE8AD3M7xY5DosAnyXpAxOgqlGzyS2pTgUg5jT0Xu/dzjqeDmwqtQWPYEsBLW5XJPIevcEehYYeCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792958; c=relaxed/simple;
	bh=x2ig3ztx/pCNBsU2RDX+qUxTCnjru/y/N3ithO0cCK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4YeauCfU5C6c3PFufxjUQQN+0BgHZ+uGwd34jtZUFaqzEiemyJAroyRh7LytsdT88cN+wbPjWGV78GahsSE6k8mv2MKVOSGKh8nNHd+WGqRaXW/+XLUNbjBX3dLFL1YRRWxv1Sn3AQmY0WyrTODfOf8deq8g6QjLPiZseai8QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmT2lBqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAJ/Ntdn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639LjVto2624686
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4BZ9+e+nH07j2RJhNwamObCoja4D8QcrG16OYEgdt0=; b=kmT2lBqgPgNOj9Mi
	RWBEvLPUlErIPGT6r0O2iFR8TdjQ4p6mTq9sVwK54n16c2957kSHZdwlbjuOYET2
	PhDS4WJAk7++OkoNeIsBBvBaBhEjU7HPhFZogqUhvoCud87oY4IWl2hoPeQebJx9
	6dzuVU7tdHvOkMMrhIAvmfl2O5YWo4dlKmhf3JvpCClJQYGLgE++M0m3dGn9NPZh
	l4N8+7yf6/bAMPKbf5FpedJagYowhY9MmCzaOjxH4P7nIoiEZ1VtDLzxbdGlvCTW
	HuYLrT+j2zUOOz1G+hFnQbCt2lyI9ZpDUt8nAVT8hS+rgibOPpbHY2CXBYirwWHl
	YvrmUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2jrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242062308so33199625ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775792955; x=1776397755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4BZ9+e+nH07j2RJhNwamObCoja4D8QcrG16OYEgdt0=;
        b=LAJ/Ntdn5CGtT3e323pZD4YemqV0CeDfxZK/4NQ5bVZWjQLFLJkxixWABZUgJdH/7A
         MdsKooKHtmRj8mfw5+wEM7A5X/r/hXsTr3sEMH3h4f2X08zgqdWl/Z7jOGvGM3K/Q3oJ
         Tax4tQrXp4NR1BaxqsnNoBdM8pA2pqXfUWiPOvQRxIlouKjUslAzQa0A0xdMogpT4/xV
         lLEnwOST8rhfLfsBsUGG2NnJ65YYqU9nA3Vsc+kMAgdVXu6TC0R0qYA6SX9gl65G7Wff
         PbqXQMcPFuQ/Rxr0EPjaHeV8hfERClLBrqLJZMtUzyO3NQLYsy7S2m6ZpOXnGeaUlo1m
         QSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792955; x=1776397755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4BZ9+e+nH07j2RJhNwamObCoja4D8QcrG16OYEgdt0=;
        b=lRHXfc7t8EsXdKRIUSbveGx/EnUUy2RhR9WjHcYkkHjrfqF8QsgBUQGtbU/5IQrnMC
         oaVG/seQr8MQMPfdl9Z6ltEZsUlhg/dn2N6NhCzAfBsVP5mizdwtWiwmajBuH5XTTUfW
         +K2/36+gSPoaIgRmr9ryinQjSdArbsGV0YqT9tXZ/DQ0RJ9Fw8Axfju9rk1v8Bafp3r3
         nWb0TJmFJm/n3mTzy4+LFw0EESu316p3sBC2RtXIo9DZ2XB/jEmI9Zs3b4opQ2txeuZE
         V4qABLtjSNSQ1UHbEusqkGzjvqwBEP1DBD/infFHkDUnYr82RpxbUD7WMFK5OQnU2+WY
         rd6g==
X-Forwarded-Encrypted: i=1; AJvYcCXr+atZeX3aFlFok6TcO5EOOnBJRVEEsGLmdhtbJD5TyWefI/djKZ90YFCkE/HUjG3JljGyVvv7qQyqphw+@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQ56DDPz1g5riUSFjQPxBs6cj/43bxy7+bJgZ97+KaVIEIOyk
	2AfjJkMc4lJuKyPLLAYruKjE3BRCMxCYxOv+tkYQfNuugGpfLmWFc805uLQYOuoPmSJEr7vaK5X
	gknqkfNdtqaA/6FcEjV98ABoGnS0pDU+GJlP6mQqSs0UZhmUDblM2eOxxw4VvRWJTwcnH
X-Gm-Gg: AeBDiesKirocU+ihfYzq1mp+FUri+k7LffsgYFDgti9+XaP5Urn3fLWQ45AAzxZoarU
	fnKMmW9efv/6VI7n9PoinXGr8G13rqAG5tdCD/RZLIVTgUw7EwbrWgO6d4xpylHadkRAQhC5vwC
	10xcvaguyY6cUHeQ0rrKRL1XmUacEtLX3Y86/VZGteBeDWUhDRHFhWYD7QMYX7C1DUUAK7MvbhZ
	N/4Rc2LVyMGayqCWk9s+z1uZOIB08qqGLds9PpgAv8M0L2Wc2diKaWR9WUUVq3zNxRYIegWgNzN
	m8KUSFxMFWUqj5yfUHQO6HhS7NQY+vaM8xrH7vSjzg51Ap8wAlsWKCYjIVWztt0HtuCKTCxWB8L
	m2ESgZgCdQEk4E3EpNHJ5SFgRp6tizrPrRnPizrbs5YZ7Sg==
X-Received: by 2002:a17:902:f787:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b2d5944ae1mr16135595ad.2.1775792955055;
        Thu, 09 Apr 2026 20:49:15 -0700 (PDT)
X-Received: by 2002:a17:902:f787:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b2d5944ae1mr16135185ad.2.1775792954577;
        Thu, 09 Apr 2026 20:49:14 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddcda9sm11588185ad.28.2026.04.09.20.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:49:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:19:04 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: Add support for MM clock
 controllers for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-glymur_mmcc_dt_config_v2-v3-1-acce9d106e72@oss.qualcomm.com>
References: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
In-Reply-To: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: juSq4QS_Njm4X8pdetQVUpegSceSeEzP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMSBTYWx0ZWRfX7QcE60ZaxH33
 yh1IQldIzWnzylSSmRJz4aUFahY97bQrU9fyf8FB0sMrA5SMYfNFehmhNeYqvJwhQ0JvBj5XmK6
 68d9Wojg+vp2ig+30eLNhnn7nTAgKcaKiPct3CTscZ1nNevEwtVow4qK3o+TCtJ+q8u02dJOwtM
 6iU9l6P0pufsxyzQI3D+tthbpsURfnKJlXGTEFpyoYtFlo46o769vD3/iZygerUoxmDpTMSZRD+
 WOCANhIAJ/7L1sdm+/aW0Ee7y77Qi74uoouQRXGziDU5/lCchbmOZdMmsSwvTB3/n1wuQWFZglM
 kCYh7FI2u//19wpwKYhpsx2ohdcxke9RNqFmeR+tM4xvjfwLVvLPqFqzPFJklaTguy2irTZ4DrE
 S1Ni8maTwB4Rd/fcdc5JaWN39PJv9zYDeRA1bsaKYD9YwWi9RK5GFv9r3rTrWthGEJuXe7nY8+/
 2fp/qsPIYd8z4HNGH8A==
X-Proofpoint-ORIG-GUID: juSq4QS_Njm4X8pdetQVUpegSceSeEzP
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d8733c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-oN0OLM605FvJlsggzQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100031
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-102575-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[7e40000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,3e04000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 983773D1EEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the device nodes for the multimedia clock controllers videocc, gpucc
and gxclkctl.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c85447892c0661f83171eded94f3b..882b8fe025e78ec7a9916226ea3b9c9c9e5c03f3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5,7 +5,10 @@
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
+#include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -3335,6 +3338,34 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,glymur-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,glymur-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				<&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;
@@ -3367,6 +3398,22 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,glymur-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


