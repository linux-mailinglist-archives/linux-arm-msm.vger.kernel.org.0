Return-Path: <linux-arm-msm+bounces-107353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OFVGtmKBGoxLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:29:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F1535114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58B4330AFD39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBC2425CC7;
	Wed, 13 May 2026 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmUl7uW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFg97ypF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0076B423A68
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682250; cv=none; b=bGgEMp1/5+V3lEMSAy+soKveMelmLWhUctoO/aR3Qu57CAhIz3WnNyw/W2GkKIcCcl0s4VqbUIJ9cej/OittTRz23+Ct1ZovKaJRJeGixhlWGMTNBb35M5Ird5PeR5FJyH8dHG4W4badXcD0D/88AU6hpWSZ3K0mv5UKYRsJi00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682250; c=relaxed/simple;
	bh=d7hMOx395aOSc3mk2s7bGfKESt3HL65Usnpe/Jf9s/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YkbFRg0zBA3J7y9H4Yd0yoyOW2fT4Hnz2bAdSUFZvU1saTPf8TEH3jjkgXUxZzWSdsF+MmJ5bFUCOtIFr+So/RnYHapuoluTcgiiZXaUGT4PS+kHVxv9RmbsyuE7mJ0R+KFFuubywZ7+6KT8ziTv8FHr/sC9MPbDQVHWj/O7ryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmUl7uW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFg97ypF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAQJFn2321254
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=; b=JmUl7uW1J5WFqGSX
	6F3nvyG9fAV3nWnhsroFhEN66SRZt/4N1PuJC85Ju8bMOAn3dQNcvhaJk3qkGDKK
	TS/D24r78CfTndlo7pqmSy0uP4xXuAfGRFv1ouh0Bs9NuNj77NPlSYjxyvAIS+Bj
	RvoCXzCW1i/YRpKATkw+gzu7VJKDnJdQvBx6Nb9iuKpaCJSToMn2OAKO9qevfkFo
	MAj5B0wYpu/sbtkMDhKOUsIL5Yw7phm5/KH3BFMqLckAASVfyAezgB/FVBr+mfiL
	CSVzJ/HBxLTGOxdAT5USJ852rb1u9yzz7SHZp/3BPlaiMriiZaTKDx0pGugTglvV
	IKM1jQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguad26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:24:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc763c7256so96545015ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682246; x=1779287046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=HFg97ypFmkrJJV9K6358aF95YMNNPr+lgHPB2b8XziAR9ecADvop7Y8+aY+38cv3M1
         ORnO1VkNJWKM6EKF7d3AWhhVU2cLUVlCk0dr4i7LfM4/UJRXrZsNVW5/onWJCn+AjD0M
         bxq1O2YPemuPxd6iBQP8IQ7E0+zQKaZs+l7/ecRBlkbmKAEwXS/U8rdn1nTh9Y7Q2w0R
         +QxnvwjvgszcqtC5KGMarECKYRcK9riPGrVHtZCq6uCwZ3g/za2JNlHJ5nqZYdaT+xyC
         fTv1BTLYSd8zBKBnRRX71nla/ZcOF8ECh0ZdsCyXCDIBnqXir0MP/HRm0TDSPZa0gQnp
         IdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682246; x=1779287046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=eK63IyVZne/XfysMWi3/AZuk06hoSWtrCOAZWj60BU0/eBhagpN2EtoeZKsJ6HbNee
         bdecAOASzqHygsJc0TkOstzcZ85Oi/w4sP5jWhfVZ+91zl77Kw+p2lnX30k6Qvdwme4G
         oRNPrq/8LQQwS25+YR0MzN2EUk/BVHl+LSFWraBMGjkz5WJCyTk9sgujwNeux7eCSR7G
         seXsef7hPg0OFe/DtG9E+DZzaaetXmf3go1fh6pUcMT22lfg+guqHuU/TkX4K1KiudrV
         U0CmV5tiyi2r5LPUqI1DQz92dd8T/1AaG9CJfY7RQ/SxhbyTuT9iJibwfGyxShgKfMVt
         YacA==
X-Forwarded-Encrypted: i=1; AFNElJ/q62xzkWoU1qKEnN/S+W1vP/Lm4enQYuGPLR384ELrOCIYgnr1LD2JI1oTTZxk41NqYefS5K1lSg4n0ryN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh3ov1cc2vxga75q1YkYsW8u6kD4x1E9x91dEm0BIkH+80317t
	yNyDXtlKSri9wljHN6ruHLHoRMACQUKttwbpw1TdHIZiGKMtSl/Yl/QGKvx2AJCxp5L0bcYu2AE
	9H2/0ZSPGTkuaI8NkGU4AoLisbibBvbil9/hkRw1WaxV3DFvn2/f0feO+mYUAvhR5A+zU
X-Gm-Gg: Acq92OHEfuojErvdiYaKevNoUatk6oPIUEQ200iLOq3vj270Q62845i1hogA0fcwJCP
	OIcCnQtmWS4uCvLWkf9N2RljObEMkRMGRHdPuTG/Wi8ni5O3Ka/vnJw5AeVUsFYx8csDOphYz7l
	mxmGf/leO9+Juw/yM/3dhUSRfwts04OfMS3H0SkFRB6kHYIJMGzQnGYo9nqr4ZKE5djge5X2YC7
	tKzwhw52Yqy5P5FX+5d9dmvjiR4Vj/Y98S7ztpvUNEJGrStc7yPU1iA/fqWl8YqQ0WaLIWL41sz
	PVYueafgjcUkkkukWp/fuuo9jHnOmEz4++HeXNi6/WyeOkD2E/UNAd6nsJZQz2UXa731uqsVR5u
	FSPjctsv07vCuauWKKfLjjbdvje4W9P7l1ytDGOeO5ZMtrw==
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39657465ad.35.1778682246223;
        Wed, 13 May 2026 07:24:06 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39656995ad.35.1778682245716;
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:12 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-7-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a048987 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 2VIWOG6SMq747t9yAxuZJ7RTD5DpC7ne
X-Proofpoint-ORIG-GUID: 2VIWOG6SMq747t9yAxuZJ7RTD5DpC7ne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX3Gbn2rYAfxBw
 rJeon3ruXuW1Wdd+MFJcjev/W3CG02oDn3H0IhQUVYheKVFiWx/thhIms1xyYiLGv4Pagmo8Nrb
 xU6Pegj8/PEKuioVmg2upSaJWftTnoouRk0HUnkEM+Maoc5B1x/BwlsodKp3AFLpSCyd6BeNI0V
 SnHbkbHnigO9FRqvapJVb4oAEAeXYkkDwwSKJfSgbcoHDWdSAuOQP2qfCfiBZi0PIJP/iM5TrR2
 nXk9hHqzZwDQlptxTD8grj8GZbfQxBi+HrKwaJHCXUi2k1VbYK5/7ee90v8V9rgfxEkUPXjNyEr
 h0vEQWxndAvnM+7Y3kInVzSPcIDIoMu5nRx0Gerxj+cOdhyD/YY+EuuFh5mzeYJoeSIHOBEsjZm
 /2FOtmHxU9LM28dhBBm7VomuARrB1Xan6irHHoCBGDECEO1ILG2UxAN4RJPsZt3cZ7FfjtNyKD7
 K9+jv70ZQQNpWnBk3GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147
X-Rspamd-Queue-Id: EC5F1535114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107353-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.113.56.96:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.25.240.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..07c871c1d4b0b22ccccd7753e8b7af26811c6956 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +878,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1


