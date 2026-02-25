Return-Path: <linux-arm-msm+bounces-94044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFhrCdCjnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:25:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5C1935AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBFCC310E17F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1C231195A;
	Wed, 25 Feb 2026 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxjrXyXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hge+JPDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9630F812
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004040; cv=none; b=LnD8DgmnbkOKyCcP5lj/oBpfEJa16i/ASWH9qTmZ+MNj2h3UbVocj4rJaWfaH0JjZD5ITdLjHwa3HFFgaGtWoqBVExVue5E4e7UkSqKltPMnIEVu0k/R9laAY8Y8wSbZJMbMEazoSmAZHyd4ms9jPyFdK/MzQi0q9kTw59j2fY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004040; c=relaxed/simple;
	bh=nH/RL960Viqwo0UIk7J/RC9fDXoLarB0W2+36h9B1BI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scBpATEReyU4Yb8ao3u45O//aFcOYMNk7s47Wm2XEKtZ6QkHS3GEGSFJUW83VcCvspVm+5RWGjKnBPdL1lTdwmlX2MC2RumURmFWaXavLIDXOpRrSN8D/7dKcCZfMntczxos/BWCpv4IVhMs80+2Yz3MU7ubaYnHxRQWkVxwlg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxjrXyXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hge+JPDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ON5lRP3177308
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7LLhlpqM6PoLC/o0FIKUUtAjchIO0ALnvSYLQ5VF04=; b=mxjrXyXIxDDXvM9A
	9uJKyEuaSIE8mJU27GWhb5GuYpQLq4Dr2l392t6fJzZUdvbCbqJZ3CqsZCxy06Ss
	IxLUMzVz8vsh3FGxyWI9pByVSoQFVmuXDc5p+5S4utBH3XSFO4HvTa/Ltx+aLSIq
	StYZVO9tVOeRf4h7ide66GVuD/xb1MlKHNn+kTlXAlqjVwE0CC/pCng/H08SonBe
	ITWHSj6b9wg7FxA6vGkth0TlgrjOsWvY1QEvTumtrY3RNGc0bVuIoIemxwf0UeUa
	LHx3Z1qw/AO/7zqpGyZUP5o6xlMJ4VLt1Jrw4zwA1gl0Gwu7xz5U5e3h9eLReaj/
	0ScRDQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chemntn6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:36 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4beca8c53so78886341a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004036; x=1772608836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7LLhlpqM6PoLC/o0FIKUUtAjchIO0ALnvSYLQ5VF04=;
        b=hge+JPDRknzVw6D2ftXY+B7nohZVKXmuNAJ7yS92zUOsA8Og/927b31L3u6Y+APf7l
         QysoaO1wsoqph58EEjk7yLatRQbdjTwT8svzugmbpV4HytqzoellCWoCDBWAvxaCPYAz
         dAaq5tCSeKAsHr+TVe7E7qN+aHBqWjRf1qNqoHYaUK477N2pxW/+6i5S2O2q06hhaUev
         YO4AOEtXBsUaAu9mLJPLfoZuMPPAcCXNeDN6T7tfWqEEubQ3zJ+6nKwmHmc9rPZL+jDZ
         w6xlLiAyjnESGcLhyM+gNJNOYKwIPRIkO3HSWgclPJXqj3DR5eu8fNLC4LVXnkcQNAM4
         UUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004036; x=1772608836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c7LLhlpqM6PoLC/o0FIKUUtAjchIO0ALnvSYLQ5VF04=;
        b=MYgaA6llhR2RymWwzP65v/vQYBkDtK0R6+QXwkp+aB1H9YBzXxlzzhHpquUIU+oZrU
         isl1qIqdEU2cFIN1vOmbsIkDiRh3fyYpt4c/n50xtmJibvASGFUZ5iiUS1el6eINxaX4
         D+rzLVrKlpiNh0oT3avZhxtd+FqZB843gbL7X17QQssX9gS9PZhUNTJEDsnNUJRTWBdX
         ffdw3nnzHgHlvk2mic22L2kyhGvMlwGW+/Kkw8L8pbMgCw4+BoNWKAYG9YA1sBSNyvHu
         t88xZOm7Ul/Fj5DATQZXjSeehTkedzxAc2T7mZlQhDh+pG01jmWrTF5vrEYLjed4GIlc
         dglQ==
X-Forwarded-Encrypted: i=1; AJvYcCU62otp1Y/lFjmDfz3ybnyIqWyCsMJxuFjuel8on7s7TZ5Hd2ZAz9m2vz2RVGTmfm2zU6Q5+NgoTVziwODC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3I5IDKFUuespLdHd/KQ+s/XaOkVh3q2tWUYbLozH0LHuW+dQi
	hItd4ApyrYvAh7GiYfw8tGYKOsdSQTBVQOJaVAk1cf8wTmfr6mBpGoEjTWqjfHHWf5KQxDYjEpy
	VpqRxfmwoEvaRmg7FfbszADAUCyZAbwdpkn44lzM529kTG2YxFD23cd2fMMs20eB8UcMI
X-Gm-Gg: ATEYQzzL/OaXkJOFNcvO3iYV3WNOsminpbUT9QYzApfGYm/rdRMu5jcl86EFLgedUel
	kXEclHWmodEgIXRw7CsCCLlcuRPZTM+aigX+VzczM2PfehDjhn3YMwYfm0LR+jt/JpOXdqdb29T
	iPA1xOvEw7SUGFSJRfZMoUG0Wqd2RtlJeftMjnQnN0F6pPXZ64PNmd63PdeoNKq3Dunjv1P9JiQ
	U+64fuT7CSrnqbIMF9mrrUPm0Gh9K8Y2xpAY/VwfKNgw6DfL9fV0yj2b2ALErRsbdXSMrGnkPDT
	k+qyvFc0LP7haDHsB+lensVXZmKTs9nk2XAeOHoZwWavtr+2NxtV5iK7ieKqGD8dstys+YL77QP
	IXkOIQN0OR+uLl6VskmSUEQO8krPHv+DBv6E6sMTBWHlPZKlTM69LOwa5rLzs5KPImTiV3BpT
X-Received: by 2002:a05:6830:2588:b0:7d1:9572:9111 with SMTP id 46e09a7af769-7d52bdf76bemr8338286a34.1.1772004035917;
        Tue, 24 Feb 2026 23:20:35 -0800 (PST)
X-Received: by 2002:a05:6830:2588:b0:7d1:9572:9111 with SMTP id 46e09a7af769-7d52bdf76bemr8338279a34.1.1772004035496;
        Tue, 24 Feb 2026 23:20:35 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:34 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:24 -0800
Subject: [PATCH v6 09/10] arm64: dts: qcom: kaanapali: Add support for MM
 clock controllers for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-knp-dts-misc-v6-9-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=4559;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=nsYZEEXXsjI4so4Na/T/SEdJ96D+J8BKnk0ZTfIBIXw=;
 b=TfBj9DIkEMRmRuI40yrrnUVy+NrYGVadVDZypwl6ydfXxa2XvshFnFd9tvliq5LH+/qhJ8rRJ
 4oVnng1P/ZeDPdi16Pxp5Q2X/iEQb5w3ajdaY3tIhrnozPy6TMPs0w7
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX69wGxqLz3BRq
 +8Y51ENt7bEu+MMKUb+cmDfeZdTCTvYHScczT0R88W/RcfTrJkx8/Fos3aYLlNcS0J1dMKuk4XK
 Dea1o8EzpGufLIKTx3qTPbzRFGXVu4t5tFmgmufzTieGLHJ+8poCud1aA/8Iddq+cyGzwgcAfkJ
 lJUioANb0iMNgchCYhNQfAhZ8IrQ/VskXqLhd2zVgdENJu69nak7674tWuhKfGoVkqn/Wmvew/y
 q14UOT+XO7K/2UOzd2nR2fwtVTY14GLfTB6JgoKTpQ/9XJGIwfTDfDf4ekdKz/6ghxefshrf2Iz
 wet8Zj6aZPG6OCpOh6Y5xNEnyEdfhVoGDDL8B97iVJBMh84cal9WzGE7rPrtnUtCK459DTTvsAn
 QHOUHVIUP1Ljpn1OfEzFGIyolMlkXEicxKgKkrnrd+LDBw2RqtF+WUihHG+BtM7G2wd0HmvIZPg
 ZSEhB1DM8AfexvDmGtw==
X-Proofpoint-ORIG-GUID: Jro_zmsgp9_3rcR8KUl3iQJmOf2pdR5i
X-Authority-Analysis: v=2.4 cv=Ro7I7SmK c=1 sm=1 tr=0 ts=699ea2c4 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y3HLYP14RHR0fgYgac8A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: Jro_zmsgp9_3rcR8KUl3iQJmOf2pdR5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-94044-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FC5C1935AB
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, dispcc, videocc, gpucc and gxclkctl).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 111 ++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index d9880a87a928..54d6c235e1b1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3,7 +3,13 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
+#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1557,6 +1563,24 @@ aggre_noc: interconnect@16e0000 {
 				 <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,kaanapali-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,kaanapali-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2532,6 +2556,46 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		videocc: clock-controller@20f0000 {
+			compatible = "qcom,kaanapali-videocc";
+			reg = <0x0 0x020f0000 0x0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
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
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,kaanapali-gxclkctl";
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
+			compatible = "qcom,kaanapali-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;
@@ -3073,6 +3137,53 @@ opp-202000000 {
 			};
 		};
 
+		camcc: clock-controller@956d000 {
+			compatible = "qcom,kaanapali-camcc";
+			reg = <0x0 0x0956d000 0x0 0x80000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
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
+		dispcc: clock-controller@9ba2000 {
+			compatible = "qcom,kaanapali-dispcc";
+			reg = <0x0 0x09ba2000 0x0 0x20000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>,

-- 
2.25.1


