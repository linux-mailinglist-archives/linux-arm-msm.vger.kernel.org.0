Return-Path: <linux-arm-msm+bounces-102462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB6FG29x12maOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:29:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 935573C87C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B2113018296
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501CD3AE71E;
	Thu,  9 Apr 2026 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHQazWF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E26tHhzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056E3AD511
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726425; cv=none; b=O9IBvbrL2SY7aVSo4uiBVbVUMy4FNhmV72ze3klMXjyZis+DgUqlSRQ15qy1KRnBTbshBt5YJAnARbr73TtrtFtxKvJ34G7Z7P97aarhnzHgSUOMqEf0cr9yoWrhim+37IxwmeYUDOmCMcgu5pGGXtjCg7rCJtWlzSIGDCxdZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726425; c=relaxed/simple;
	bh=U/WMy6k45BILRlE0WxX9X9apx3JQALvLSGo8nsfBlBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttxGGdPkziVi8f5kB7AO52SK8Qt26eFyxoBRgz0QLzBfWfYS7KxbS2F/YBxH/zlTRJr7rmY3UJC3SyAwWCxEM2mxxzIVFDCLJAmSoZ8rqBLMT6+/LIxece+jqStoAWL9yStdx7z3JWW8GTNQ80alelGp8Zf/EtgN9UY0x0Ix/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHQazWF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E26tHhzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63970l8c4047356
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=enEYUtz/Wuo
	b9AGrCpzwXKVV5DB0oBlbp7GmcYMOUvg=; b=oHQazWF+TKI1BnLGcSTfCoPgrXM
	E8qiWE6nujCNwTSDWtklh/CS8czfaOqTqUz5VQgin8gs5Y0tcGJi/fCcjo2EY6UE
	cgT3MEKt1rQUWuhazG7OTojYn2O5e/jR0zMyrhrLFgdD7EbQ5yBemliXGqX68AAm
	Kk5gradAnGo5Eq8XeB0TPAKr9YZMvL0C7JZCMNYzQ9AA6/k4OPJEKfmJg0Z1Sbur
	j23hfv+W0HdmA8KHa4ZWVLuIP2SbyBuPllVW6OuABAg7OH+89Ays38xMwsoqdBLX
	9Bns2gj+N4z4QRraKHOQLcaqsPZbrbe9uo8xc2hLZJ00lVnLSIJ3uFUHUeA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtd73bja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:20:11 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c21dbc9c1so2505650c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726410; x=1776331210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enEYUtz/Wuob9AGrCpzwXKVV5DB0oBlbp7GmcYMOUvg=;
        b=E26tHhzYD5yOKqjACz1bzhoH42x38XAy2ytp1ev9gpev9LOYed63RlMOaPokmlwVuV
         6k7BPLegXArr2nBqqQQazSYdry+WJeAGuUy36iJWkLrTCitIP08sujd1p5m1FYsF+jSm
         Gog+nQlexmN6iK+kt2rIZXHnsUnaCQ85Mgr33IQBbh21sd+ovyqaIr2TbQO1YQQThjrn
         r9WVJw41goPRChdU0kgBTsBNDrWXdc74MN0f2aGzWSrziCDEcfLSshEQHQH0R9AusuT+
         x1o21JsO9dI3q46E6K4L2GSzNA1y1UN/cswHbvAqJ7zToDZrPTCVLxJ6DaPXYxAzBnBB
         p1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726410; x=1776331210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=enEYUtz/Wuob9AGrCpzwXKVV5DB0oBlbp7GmcYMOUvg=;
        b=Xyyc7xGNv+9EGPlz0WMRjkEyZQkH5gMAzvwR9yL02ayTga3z30zd69OvpeLY6G7FM4
         m3hgaqC6RFKK6vuq4FXFrrmoyUczcYx1arvwyp19GHo5wLYmpqDGA7/tL/g068P3PLBN
         S+NwSrw2zLa5qF4Z4v+5HnLzsRb/pDjIOSSPA1R1l4djL2cQ8tc/qCCtqkzfyf9sho0f
         80C1hA+0L82Pt0P54nK9d8HuT+q3cbo1llEVmSecVzMPudsGPNQM6K9aAs1wjlycbv1K
         fbJz8vhFcDo3fFbG9Z1VKXo9HCJzOR+fQ2SiM+BOSRkw9rhBK3zsBD5AudLHJdZJfYy1
         5sYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPk1sVnwPebJw06ORBLqfPsp7aqaIDBYrop1LYm2WR+VKQRW3PHSyQEZO9KEZ1pAPlVok5vVbSPGCY96hK@vger.kernel.org
X-Gm-Message-State: AOJu0YyOS7YkdQ0XSIU1LWPNURw7vIZLSav+u6Wvioi6M4fDmneGDj5P
	SH4+7WSBHwZX1ZPCidPF8rbc4ogFX3hsRZRx56ByAqi1gjmzktI99F36XhRtxAN2+KrjeW60HQu
	HVW4R/dvKJv0ZAqSqCYIlBh0oVe83umSblJGG/J8k792lVHAGQ1U0/EyFXVFn6WizT5H4e6rjUO
	vY
X-Gm-Gg: AeBDieuZmBu165MYLq/b/bpJ2M4eKYIwtEjScEvL2FOs2Pkbv9DFittop6fG7+KIr1Y
	K/7HTAOsRq0Hj11BM1UGVX7KpULHAeB3f3B9NgMk09PcwPLqY7igkAAHv7ivraYbqlSvm0Rs7JW
	ipMOvuXDzAoLH8qyS9uH/GHLJ53YPUhcbNb5qbB/syL2lP7+38NNuSq2xRQSUF5Rseh3GVc4kPW
	OVmLZ5SVV0tedsb3Uu5EskwJpWir80y1Mw2S/HO+gDpYWiJDZEQNqba/TEN7wW+tF+5dLkOERWe
	p/+JccSYqz9MAScRfGcVmEDttdWm4Ab5a4VgtwNQkUz7iDxU0rgoty6O2TfV9RF5qPBrf+qa2bw
	1R/vMx9RhbajxrIHdjdD0fUvwsPgY0jsSNhiKTiBVtrSvuy/CpOdq4eGeIViToU8Qz+qM6xRp5j
	fnOd5Ckg==
X-Received: by 2002:a05:7022:ea31:b0:128:ce44:be8f with SMTP id a92af1059eb24-12bfb6e980bmr12171244c88.2.1775726409270;
        Thu, 09 Apr 2026 02:20:09 -0700 (PDT)
X-Received: by 2002:a05:7022:f319:b0:12c:8b9:720c with SMTP id a92af1059eb24-12c08b974ecmr6356725c88.18.1775725927450;
        Thu, 09 Apr 2026 02:12:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH 6/8] arm64: dts: qcom: lemans: Introduce SA8255P SoC support
Date: Thu,  9 Apr 2026 17:10:58 +0800
Message-ID: <20260409091100.474358-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QoRuG1yd c=1 sm=1 tr=0 ts=69d76f4b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=JrOUzMwsbUcBTIasdiwA:9
 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EWDcMm2OWzLsmg-qYvUYxHyRZiseInl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MiBTYWx0ZWRfX4Zmr/vRikM0+
 NyiASku4lV/ucT+2IbYxJqJNin3jVLQC9KeHwa4O+h006Jj5y9ctg+CDKWb+nFpQCRk4plBOelZ
 DLyHh2UXMGOqmrk/34oj1eqBAj9u0lTR/LmOB3F/YoZAP1un+aEJcYvYHkzPtDRTJMNGFLird+4
 QyME37ZVnAAneSnW3ixmbXwiN2imgzgi6vzqtB7oKwCSqJQ7Be/3j4TQE4ygqG3F7N+jcSamwnB
 00BZ4fSfn1Askpw0nfheWafVoAs7MTRRJ9q9YtmO3vfZ0X+d/S8xUZceIU1/zTRy2Q+Pvxckx7S
 MaNn5DnxPHDSU36NoLzXYX+52PNHfoJx1BgDTYNFH8CX87c0LPgV7asrv/ODmgHQiVjTLwWBPkq
 bNFrTEtyqmff0RQQt14YOZ4ee2i+49VevtWbe/QSGcr60Tn7A+vCG4lEk2oRWXIIhOZPVVDiUch
 NRLQtttimTJgjoOKQDQ==
X-Proofpoint-GUID: EWDcMm2OWzLsmg-qYvUYxHyRZiseInl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090082
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102462-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 935573C87C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for SA8255P, a Lemans series SoC that utilizes firmware
to configure platform resources such as clocks, interconnects and TLMM.
Device drivers request these resources through the SCMI power, reset and
performance protocols.  Assign each device driver a dedicated SCMI
channel and Tx/Rx doorbells to support parallel resource requests and
aggregation in the SCMI platform server.  Operate the SCMI server stack
in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
communication.

Group resource operations to improve abstraction and reduce the number of
SCMI requests.  Follow the SCMI-based resource management approach
demonstrated by Qualcomm at Linaro Connect 2024 [1].

[1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi | 3027 ++++++++++++++++++
 1 file changed, 3027 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi b/arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi
new file mode 100644
index 000000000000..7f15d66c68f9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi
@@ -0,0 +1,3027 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
+
+/delete-node/ &xbl_boot_mem;
+/delete-node/ &pil_adsp_mem;
+/delete-node/ &q6_adsp_dtb_mem;
+/delete-node/ &q6_gdsp0_dtb_mem;
+/delete-node/ &pil_gdsp0_mem;
+/delete-node/ &pil_gdsp1_mem;
+/delete-node/ &q6_gdsp1_dtb_mem;
+/delete-node/ &q6_cdsp0_dtb_mem;
+/delete-node/ &pil_cdsp0_mem;
+/delete-node/ &pil_gpu_mem;
+/delete-node/ &q6_cdsp1_dtb_mem;
+/delete-node/ &pil_cdsp1_mem;
+/delete-node/ &pil_cvp_mem;
+/delete-node/ &pil_video_mem;
+/delete-node/ &scmi_mem;
+/delete-node/ &firmware_reserved_mem;
+
+/ {
+	clocks {
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_board_clk>;
+			clock-mult = <1>;
+			clock-div = <2>;
+			#clock-cells = <0>;
+		};
+
+		gpll0_board_clk: gpll0-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	firmware: firmware {
+		scm {
+			memory-region = <&tz_ffi_mem>;
+		};
+
+		scmi0: scmi-0 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem0>;
+
+			interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi0_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi0_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi0_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi1: scmi-1 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem1>;
+
+			interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi1_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi1_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi1_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi2: scmi-2 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem2>;
+
+			interrupts = <GIC_SPI 965 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi2_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi2_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi2_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi3: scmi-3 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem3>;
+
+			interrupts = <GIC_SPI 966 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi3_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi3_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi3_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi4: scmi-4 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem4>;
+
+			interrupts = <GIC_SPI 967 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi4_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi4_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi4_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi5: scmi-5 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem5>;
+
+			interrupts = <GIC_SPI 968 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi5_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi5_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi5_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi6: scmi-6 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem6>;
+
+			interrupts = <GIC_SPI 969 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi6_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi6_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi6_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi7: scmi-7 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem7>;
+
+			interrupts = <GIC_SPI 970 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi7_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi7_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi7_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi8: scmi-8 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem8>;
+
+			interrupts = <GIC_SPI 971 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi8_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi8_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi8_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi9: scmi-9 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem9>;
+
+			interrupts = <GIC_SPI 972 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi9_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi9_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi9_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi10: scmi-10 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem10>;
+
+			interrupts = <GIC_SPI 973 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi10_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi10_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi10_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi11: scmi-11 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem11>;
+
+			interrupts = <GIC_SPI 974 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi11_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi11_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi11_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi12: scmi-12 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem12>;
+
+			interrupts = <GIC_SPI 975 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi12_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi12_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi12_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi13: scmi-13 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem13>;
+
+			interrupts = <GIC_SPI 976 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi13_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi13_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi13_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi14: scmi-14 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem14>;
+
+			interrupts = <GIC_SPI 977 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi14_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi14_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi14_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi15: scmi-15 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem15>;
+
+			interrupts = <GIC_SPI 978 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi15_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi15_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi15_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi16: scmi-16 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem16>;
+
+			interrupts = <GIC_SPI 979 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi16_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi16_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi16_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi17: scmi-17 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem17>;
+
+			interrupts = <GIC_SPI 980 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi17_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi17_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi17_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi18: scmi-18 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem18>;
+
+			interrupts = <GIC_SPI 981 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi18_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi18_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi18_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi19: scmi-19 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem19>;
+
+			interrupts = <GIC_SPI 982 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi19_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi19_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi19_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi20: scmi-20 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem20>;
+
+			interrupts = <GIC_SPI 983 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi20_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi20_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi20_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi21: scmi-21 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem21>;
+
+			interrupts = <GIC_SPI 984 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi21_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi21_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi21_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi22: scmi-22 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem22>;
+
+			interrupts = <GIC_SPI 985 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi22_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi22_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi22_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi23: scmi-23 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem23>;
+
+			interrupts = <GIC_SPI 986 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi23_sensor: protocol@15 {
+				reg = <0x15>;
+				#thermal-sensor-cells = <1>;
+			};
+		};
+
+		scmi24: scmi-24 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem24>;
+
+			interrupts = <GIC_SPI 987 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi24_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi24_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi24_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi25: scmi-25 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem25>;
+
+			interrupts = <GIC_ESPI 0 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi25_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi25_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi25_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi26: scmi-26 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem26>;
+
+			interrupts = <GIC_ESPI 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi26_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi26_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi26_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi27: scmi-27 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem27>;
+
+			interrupts = <GIC_ESPI 2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi27_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi27_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi27_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi28: scmi-28 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem28>;
+
+			interrupts = <GIC_ESPI 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi28_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi28_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi28_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi29: scmi-29 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem29>;
+
+			interrupts = <GIC_ESPI 4 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi29_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi29_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi29_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi30: scmi-30 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem30>;
+
+			interrupts = <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi30_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi30_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi30_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi31: scmi-31 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem31>;
+
+			interrupts = <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi31_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi31_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi31_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi32: scmi-32 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem32>;
+
+			interrupts = <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi32_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi32_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi32_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi33: scmi-33 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem33>;
+
+			interrupts = <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi33_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi33_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi33_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi34: scmi-34 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem34>;
+
+			interrupts = <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi34_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi34_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi34_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi35: scmi-35 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem35>;
+
+			interrupts = <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi35_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi35_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi35_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi36: scmi-36 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem36>;
+
+			interrupts = <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi36_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi36_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi36_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi37: scmi-37 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem37>;
+
+			interrupts = <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi37_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi37_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi37_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi38: scmi-38 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem38>;
+
+			interrupts = <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi38_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi38_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi38_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi39: scmi-39 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem39>;
+
+			interrupts = <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi39_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi39_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi39_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi40: scmi-40 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem40>;
+
+			interrupts = <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi40_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi40_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi40_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi41: scmi-41 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem41>;
+
+			interrupts = <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi41_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi41_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi41_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi42: scmi-42 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem42>;
+
+			interrupts = <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi42_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi42_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi42_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi43: scmi-43 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem43>;
+
+			interrupts = <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi43_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi43_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi43_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi44: scmi-44 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem44>;
+
+			interrupts = <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi44_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi44_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi44_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi45: scmi-45 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem45>;
+
+			interrupts = <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi45_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi45_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi45_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi46: scmi-46 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem46>;
+
+			interrupts = <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi46_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi46_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi46_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi47: scmi-47 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem47>;
+
+			interrupts = <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi47_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi47_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi47_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi48: scmi-48 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem48>;
+
+			interrupts = <GIC_ESPI 23 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi48_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi48_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi48_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi49: scmi-49 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem49>;
+
+			interrupts = <GIC_ESPI 24 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi49_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi49_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi49_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi50: scmi-50 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem50>;
+
+			interrupts = <GIC_ESPI 25 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi50_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi50_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi50_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi51: scmi-51 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem51>;
+
+			interrupts = <GIC_ESPI 26 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi51_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi51_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi51_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi52: scmi-52 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem52>;
+
+			interrupts = <GIC_ESPI 27 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi52_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi52_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi52_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi53: scmi-53 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem53>;
+
+			interrupts = <GIC_ESPI 28 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi53_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi53_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi53_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi54: scmi-54 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem54>;
+
+			interrupts = <GIC_ESPI 29 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi54_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi54_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi54_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi55: scmi-55 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem55>;
+
+			interrupts = <GIC_ESPI 30 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi55_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi55_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi55_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi56: scmi-56 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem56>;
+
+			interrupts = <GIC_ESPI 31 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi56_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi56_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi56_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi57: scmi-57 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem57>;
+
+			interrupts = <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi57_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi57_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi57_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi58: scmi-58 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem58>;
+
+			interrupts = <GIC_ESPI 33 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi58_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi58_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi58_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi59: scmi-59 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem59>;
+
+			interrupts = <GIC_ESPI 34 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi59_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi59_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi59_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi60: scmi-60 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem60>;
+
+			interrupts = <GIC_ESPI 35 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi60_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi60_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi60_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi61: scmi-61 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem61>;
+
+			interrupts = <GIC_ESPI 36 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi61_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi61_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi61_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi62: scmi-62 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem62>;
+
+			interrupts = <GIC_ESPI 37 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi62_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi62_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi62_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+
+		scmi63: scmi-63 {
+			compatible = "qcom,scmi-smc";
+			arm,smc-id = <0xc6008012>;
+			shmem = <&shmem63>;
+
+			interrupts = <GIC_ESPI 38 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "a2p";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			arm,max-msg = <10>;
+			arm,max-msg-size = <256>;
+			arm,max-rx-timeout-ms = <3000>;
+
+			status = "disabled";
+
+			scmi63_pd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi63_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi63_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		xbl_boot_mem: xbl-boot@90700000 {
+			reg = <0x0 0x90700000 0x0 0x100000>;
+			no-map;
+		};
+
+		tz_ffi_mem: tz-ffi@91c00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x91c00000 0x0 0x1400000>;
+			no-map;
+		};
+
+		pil_adsp_mem: pil-adsp@95c00000 {
+			reg = <0x0 0x95c00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_adsp_dtb_mem: q6-adsp-dtb@97a00000 {
+			reg = <0x0 0x97a00000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_gdsp0_dtb_mem: pil-gdsp0-dtb@97a80000 {
+			reg = <0x0 0x97a80000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_gdsp0_mem: pil-gdsp0@97b00000 {
+			reg = <0x0 0x97b00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp1_mem: pil-gdsp1@99900000 {
+			reg = <0x0 0x99900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp1_dtb_mem: pil-gdsp1-dtb@9b700000 {
+			reg = <0x0 0x9b700000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_cdsp0_dtb_mem: pil-cdsp0-dtb@9b780000 {
+			reg = <0x0 0x9b780000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_cdsp0_mem: pil-cdsp0@9b800000 {
+			reg = <0x0 0x9b800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gpu_mem: pil-gpu@9d600000 {
+			reg = <0x0 0x9d600000 0x0 0x2000>;
+			no-map;
+		};
+
+		pil_cdsp1_dtb_mem: pil-cdsp1-dtb@9d680000 {
+			reg = <0x0 0x9d680000 0x0 0x80000>;
+			no-map;
+		};
+
+		pil_cdsp1_mem: pil-cdsp1@9d700000 {
+			reg = <0x0 0x9d700000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_cvp_mem: pil-cvp@9f500000 {
+			reg = <0x0 0x9f500000 0x0 0x700000>;
+			no-map;
+		};
+
+		pil_video_mem: pil-video@9fc00000 {
+			reg = <0x0 0x9fc00000 0x0 0x700000>;
+			no-map;
+		};
+
+		audio_config_mem: audio-config-region@ac600000 {
+			reg = <0x0 0xac600000 0x0 0xa00000>;
+			no-map;
+		};
+
+		audio_mdf_mem: audio-mdf-region@ad000000 {
+			reg = <0x0 0xad000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		firmware_mem: firmware-region@b0000000 {
+			reg = <0x0 0xb0000000 0x0 0x800000>;
+			no-map;
+		};
+
+		hyptz_reserved_mem: hyptz-reserved@beb00000 {
+			reg = <0x0 0xbeb00000 0x0 0x11500000>;
+			no-map;
+		};
+
+		shmem0: scmi-mem@d0000000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0000000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem1: scmi-mem@d0001000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0001000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem2: scmi-mem@d0002000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0002000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem3: scmi-mem@d0003000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0003000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem4: scmi-mem@d0004000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0004000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem5: scmi-mem@d0005000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0005000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem6: scmi-mem@d0006000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0006000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem7: scmi-mem@d0007000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0007000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem8: scmi-mem@d0008000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0008000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem9: scmi-mem@d0009000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0009000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem10: scmi-mem@d000a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd000a000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem11: scmi-mem@d000b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd000b000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem12: scmi-mem@d000c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd000c000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem13: scmi-mem@d000d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd000d000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem14: scmi-mem@d000e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd000e000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem15: scmi-mem@d000f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd000f000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem16: scmi-mem@d0010000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0010000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem17: scmi-mem@d0011000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0011000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem18: scmi-mem@d0012000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0012000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem19: scmi-mem@d0013000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0013000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem20: scmi-mem@d0014000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0014000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem21: scmi-mem@d0015000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0015000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem22: scmi-mem@d0016000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0016000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem23: scmi-mem@d0017000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0017000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem24: scmi-mem@d0018000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0018000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem25: scmi-mem@d0019000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0019000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem26: scmi-mem@d001a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd001a000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem27: scmi-mem@d001b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd001b000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem28: scmi-mem@d001c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd001c000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem29: scmi-mem@d001d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd001d000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem30: scmi-mem@d001e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd001e000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem31: scmi-mem@d001f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd001f000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem32: scmi-mem@d0020000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0020000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem33: scmi-mem@d0021000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0021000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem34: scmi-mem@d0022000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0022000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem35: scmi-mem@d0023000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0023000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem36: scmi-mem@d0024000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0024000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem37: scmi-mem@d0025000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0025000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem38: scmi-mem@d0026000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0026000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem39: scmi-mem@d0027000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0027000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem40: scmi-mem@d0028000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0028000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem41: scmi-mem@d0029000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0029000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem42: scmi-mem@d002a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd002a000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem43: scmi-mem@d002b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd002b000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem44: scmi-mem@d002c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd002c000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem45: scmi-mem@d002d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd002d000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem46: scmi-mem@d002e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd002e000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem47: scmi-mem@d002f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd002f000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem48: scmi-mem@d0030000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0030000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem49: scmi-mem@d0031000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0031000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem50: scmi-mem@d0032000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0032000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem51: scmi-mem@d0033000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0033000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem52: scmi-mem@d0034000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0034000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem53: scmi-mem@d0035000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0035000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem54: scmi-mem@d0036000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0036000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem55: scmi-mem@d0037000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0037000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem56: scmi-mem@d0038000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0038000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem57: scmi-mem@d0039000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0039000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem58: scmi-mem@d003a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd003a000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem59: scmi-mem@d003b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd003b000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem60: scmi-mem@d003c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd003c000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem61: scmi-mem@d003d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd003d000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem62: scmi-mem@d003e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd003e000 0x0 0x1000>;
+			no-map;
+		};
+
+		shmem63: scmi-mem@d003f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd003f000 0x0 0x1000>;
+			no-map;
+		};
+
+		firmware_logs_mem: firmware-logs@d0040000 {
+			reg = <0x0 0xd0040000 0x0 0x10000>;
+			no-map;
+		};
+
+		firmware_audio_mem: firmware-audio@d0050000 {
+			reg = <0x0 0xd0050000 0x0 0x4000>;
+			no-map;
+		};
+
+		firmware_camera_mem: firmware-camera@d0054000 {
+			no-map;
+			reg = <0x0 0xd0054000 0x0 0x2000>;
+		};
+
+		firmware_reserved_mem: firmware-reserved@d0056000 {
+			reg = <0x0 0xd0056000 0x0 0x9a000>;
+			no-map;
+		};
+
+		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
+			reg = <0x0 0xd00f0000 0x0 0x10000>;
+			no-map;
+		};
+
+		tags_mem: tags@d0100000 {
+			reg = <0x0 0xd0100000 0x0 0x1200000>;
+			no-map;
+		};
+
+		qtee_mem: qtee@d1300000 {
+			reg = <0x0 0xd1300000 0x0 0x500000>;
+			no-map;
+		};
+
+		deepsleep_backup_mem: deepsleep-backup@d1800000 {
+			reg = <0x0 0xd1800000 0x0 0x100000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@d1900000 {
+			reg = <0x0 0xd1900000 0x0 0x3800000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@db100000 {
+			reg = <0x0 0xdb100000 0x0 0x100000>;
+			no-map;
+		};
+
+		cpucp_fw_mem: cpucp-fw@db200000 {
+			reg = <0x0 0xdb200000 0x0 0x100000>;
+			no-map;
+		};
+
+		cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x2000000>;
+			linux,cma-default;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		qupv3_id_2: geniqup@8c0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+
+			i2c14: i2c@880000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi14: spi@880000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart14: serial@880000 {
+				compatible = "qcom,sa8255p-geni-uart";
+			};
+
+			i2c15: i2c@884000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi15: spi@884000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart15: serial@884000 {
+				compatible = "qcom,sa8255p-geni-uart";
+			};
+
+			i2c16: i2c@888000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi16: spi@888000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart16: serial@888000 {
+				compatible = "qcom,sa8255p-geni-uart";
+			};
+
+			i2c17: i2c@88c000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi17: spi@88c000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart17: serial@88c000 {
+				compatible = "qcom,sa8255p-geni-uart";
+			};
+
+			i2c18: i2c@890000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi18: spi@890000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart18: serial@890000 {
+				compatible = "qcom,sa8255p-geni-uart";
+			};
+
+			i2c19: i2c@894000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi19: spi@894000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart19: serial@894000 {
+				compatible = "qcom,sa8255p-geni-uart";
+			};
+
+			i2c20: i2c@898000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi20: spi@898000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart20: serial@898000 {
+				compatible = "qcom,sa8255p-geni-uart";
+			};
+		};
+
+		qupv3_id_0: geniqup@9c0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+
+			i2c0: i2c@980000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi0: spi@980000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart0: serial@980000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 0>, <&scmi11_dvfs 0>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c1: i2c@984000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi1: spi@984000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart1: serial@984000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 1>, <&scmi11_dvfs 1>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c2: i2c@988000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi2: spi@988000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart2: serial@988000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 2>, <&scmi11_dvfs 2>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c3: i2c@98c000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi3: spi@98c000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart3: serial@98c000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 3>, <&scmi11_dvfs 3>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c4: i2c@990000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi4: spi@990000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart4: serial@990000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 4>, <&scmi11_dvfs 4>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c5: i2c@994000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi5: spi@994000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart5: serial@994000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 5>, <&scmi11_dvfs 5>;
+				power-domain-names = "power", "perf";
+			};
+		};
+
+		qupv3_id_1: geniqup@ac0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+
+			i2c7: i2c@a80000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi7: spi@a80000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart7: serial@a80000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 7>, <&scmi11_dvfs 7>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c8: i2c@a84000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi8: spi@a84000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart8: serial@a84000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 8>, <&scmi11_dvfs 8>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c9: i2c@a88000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi9: spi@a88000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart9: serial@a88000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 9>, <&scmi11_dvfs 9>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c10: i2c@a8c000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi10: spi@a8c000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart10: serial@a8c000 {
+				compatible = "qcom,sa8255p-geni-debug-uart";
+				power-domains = <&scmi11_pd 10>, <&scmi11_dvfs 10>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c11: i2c@a90000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi11: spi@a90000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart11: serial@a90000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 11>, <&scmi11_dvfs 11>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c12: i2c@a94000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi12: spi@a94000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart12: serial@a94000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 12>, <&scmi11_dvfs 12>;
+				power-domain-names = "power", "perf";
+			};
+
+			i2c13: i2c@a98000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+		};
+
+		qupv3_id_3: geniqup@bc0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+
+			i2c21: i2c@b80000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+			};
+
+			spi21: spi@b80000 {
+				compatible = "qcom,sa8255p-geni-spi";
+			};
+
+			uart21: serial@b80000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				power-domains = <&scmi11_pd 21>, <&scmi11_dvfs 21>;
+				power-domain-names = "power", "perf";
+			};
+		};
+
+		pcie0_ep: pcie-ep@1c00000 {
+			compatible = "qcom,sa8255p-pcie-ep";
+			power-domains = <&scmi5_pd 1>;
+			/delete-property/ linux,pci-domain;
+		};
+
+		pcie1_ep: pcie-ep@1c10000 {
+			compatible = "qcom,sa8255p-pcie-ep";
+			power-domains = <&scmi6_pd 1>;
+			/delete-property/ linux,pci-domain;
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sa8255p-ufshc";
+			power-domains = <&scmi3_pd 0>;
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			power-domains = <&scmi15_pd 0>;
+		};
+
+		cpufreq_hw: cpufreq@18591000 {
+			clocks = <&bi_tcxo_div2>, <&gpll0_board_clk>;
+			clock-names = "xo", "alternate";
+		};
+	};
+};
-- 
2.43.0


