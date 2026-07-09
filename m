Return-Path: <linux-arm-msm+bounces-118002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4oIeOkKhT2pnlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:25:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2A7318AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:25:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WlSwyA0d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NpWQHKu2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118002-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118002-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 357B830D4B95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCA72BDC32;
	Thu,  9 Jul 2026 13:21:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF229898F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603291; cv=none; b=ohei1Zz3rivzwQ5d0B8jSy2tLblSxa6KBKnLhj4dM1tdLwC5slPwhL2/N2JBz0Zhvc7Vd/kQpT6o6T3me6b6G/tOj+YdrUjm76gclNrIut5DRlITCTlkPI2Yr5RUHbdLYY0QL+caSLp5CL3pgICbQF+a/1k58HdjstrTpyVhiQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603291; c=relaxed/simple;
	bh=OjrLriuvuY0XxCQoMbY/JnTpyPaGHEtmlpCEjuV+e+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uz9nP64OGVNGqpEmJcNr5Lt71G1p+FlIZwgAd2oYzXcqaD5CawvfOVIz5+YLEuRYAjYeWxBAR5w5cSK5x4+tvH5qkICquJu2yNUt2FIdgVFIR89Ekt16pXXnkzgeq7J9lT5pRzFraEYVMEsOmM0Q2Xr8j00WkW6qqaNYySintzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlSwyA0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpWQHKu2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDJB1667577
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FkNh8ISjSnm
	BLTuEtGqq19ufh2nMlHPiPWFJDP8vNHQ=; b=WlSwyA0dURl/ABpUw1lWlC4LdbV
	rYGdkyHVSYfFom2EEpJX2WzMaHNmXKM7ZMJyujwUuOXXGSeQXrzdO03xChw9TuCv
	9837afkO9yDt/3qoeuWW00kV4m+5+mqsmA0reFw+JLsionQfzAWi0ojT/r4z4z5S
	Iah72L9O6NIQBJisGsEcGYpOys6vGNbHxdQwvVZyk4JLm94IlHWN8CsaGFxWVKXt
	37UCD+penAgde23PBrWI4XuujXKXZlFB9qxx/hHqCE2old/QzFW7FtrSgKMymr4g
	1/ygZLHoXEQAMDVuRG3nq+tCXpubt18h1BUKBu9ry1NwX8AK1c+jgf+5GTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kxka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:21:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec91dc265so180292385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603285; x=1784208085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkNh8ISjSnmBLTuEtGqq19ufh2nMlHPiPWFJDP8vNHQ=;
        b=NpWQHKu2kSPYXAOpDvEtXU6YuN597M3/akn+5tXmsDxvSI+1sbn7GC9Cux3YxjbHmK
         Um05i9TROSxxPK6QehCwDpYhE+utLLGbcDeqmDU66j+vNzSz73DD201FnGxn7+VFVANk
         Q+epN15a0rAwdMNSbpynJcMl8q+1yDNhNIN+4AR8hT3d8FgnY5wCDqvDSANXGJ/qo5Xa
         Ij7Pf2SMfL+GOANu1sIip5YBpWgYUyXRR8PhRBgwHoiOA8Dbr8jkszK9x39CxkY02xbx
         Y2GCrii+DaP7JVUCB4j5+Cc8Uyx53ynWsaKYs6uuiRkeNl/pLBqPaCJ+qGvIuodPmX+B
         RwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603285; x=1784208085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FkNh8ISjSnmBLTuEtGqq19ufh2nMlHPiPWFJDP8vNHQ=;
        b=NjUBr3kSqPza6lM7+mOhQg0JG68w7KRmkaxcznPlM/LCf4mMOILqr69HXquES7qBSt
         OuxppemuO44oB485zCCSF0oeBlP0Id3iYPk8AoVrzCj0whrQV1hKgx5L+i2a2Ii4pCAk
         PkmjZsignJc47miJFwH8M03XTQBvgR/OKeQpBZncdobOKJMIrVWBd3roHlPa95yTmhZK
         CCcv2gqhExw4c854nTNeH+Mm+5ICQiiIounHKDkvJA5xPNmjnMhp9hujvAI+4ZInaMAv
         qgxDBvD0us5onr5khNFo5cOQsip05gCeWt8vtUCLtBesGWl6iEcsUeQA5IYd1rdabAot
         aTaw==
X-Forwarded-Encrypted: i=1; AHgh+RqENql3n09/PSBeJL+1alLdhiasqNBNNebwAhUY95hQ2Ro+2QYW4RBWHfc/mODZ5gqdF2JiaN0spKU70u5q@vger.kernel.org
X-Gm-Message-State: AOJu0YwEf6nPnRLmf+wiReLMeeTx8hTo56LoOFtwDn/CtbNlMvwxa32V
	kZOfbWgMMfRQpWM4fj+3jE35hw8NeMHf6sUHVZE4GvbO7qjUPUPhHMCbW3/nDqLYAfDZe5i8mbf
	NWn3IBRxmn8mZfLuiy4LVL/Mbg1hsnvfi4gtx3fO3oks6BVLf0DK3eK95WM1b0MCORt0Q
X-Gm-Gg: AfdE7cnIfI+iYVUqG9kiD1TaM0SuCFH0ceHR4i+eksDgXnIaGHCKih0A+NtKSj8n7q8
	Mg4puSUGNBSY6mGiGzluZ6D0coanySdblQ8wiYzVwMTJqep7JlY8UkoNH7fHuRTfn6BZlaTKHXe
	YFg+0FSE8/aYAfMzeCwvb58zn471sOWeTuC1+J9OFtWsQFS7i8DUPkrQ6yHML9VkkDQRXD1qDDH
	2/b3TYiGCTwL/2r1NmQtUsE0SK+nbkl3DBVfSDBIRGqkSQzRvXeqVwZpv8D1ji3ugUyFL6ULXaH
	Zfepyu8iOv01MYVFVkJrbaLAbu+JRloWt34cCAA0N/fKOwOXBcDmiYXboYgtx2+PBXDaLmeqdwY
	pFz5rh1w9kJ/DQTHKyIghNgxHrtpwi5hqoxfa0pWEun4LtlA/kpNYJ425DmJ0DOP9j5sBZBY=
X-Received: by 2002:a05:620a:a90f:b0:92e:d2d1:121d with SMTP id af79cd13be357-92ed2d118a0mr482036585a.81.1783603284332;
        Thu, 09 Jul 2026 06:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:a90f:b0:92e:d2d1:121d with SMTP id af79cd13be357-92ed2d118a0mr482029385a.81.1783603283168;
        Thu, 09 Jul 2026 06:21:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 5/7] arm64: dts: qcom: Add device tree for Nord Embedded variant
Date: Thu,  9 Jul 2026 21:20:11 +0800
Message-ID: <20260709132013.4096850-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfXzU2qv1LIjRjH
 z4DFLQfQQCmCRFO1Ff3nUoIdzZR9e5xxkR+JV1XeDCi9YTRG0O2yKdTueVmlmOJjfslh7XHMCUz
 sKeFhe7rEiJJ4av/QsQZuDNvNWJ7HT4=
X-Proofpoint-GUID: OLQXFVlTOIjh6Tm1imJIkAZ1pbkc_2rC
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fa056 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Oggv6LfVMszcvIlZO0YA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OLQXFVlTOIjh6Tm1imJIkAZ1pbkc_2rC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX7uOxUq71WTx5
 t0zKXn3p+OiB5YUCeUdoBFG7W9s4T7Z+TB5EVJEpR2N2EkmOpGfo3HN9RQ36SejcVXsctqjLStZ
 YoohqJP3vIMt6A1NhxA1Cd5nbDqyaY86cRUVnS0Kch+yk+XYsaoTFF8cgcJy60YbU1ru0tgoVFC
 jHbhnz0pR71pvDzklonqcSJI6gNlyBVqwGQuI20v6htYZYRjRhMeB66oZTWJkVBZMOfGk52Ah9X
 hjhwVdUkxjNAkNYtcAxS97ltqbqJvXwiUNEE24zsV9RZRuemr01RihQHV821MpFR3AExmLtwuvG
 enuHaBllqpySdu3Fywe+uDpCR5SA/AwSVwMjJKkH6dolySZWI844VmZDtWAYn312eDwuOtzPVZz
 pH3mkTcpVAyneZzGVALHugHSmfkEwDbU9iv5z77uhrExl24IpQ2pQ1QBDYfVq8orJcxWtSDSYNT
 aKx8/JGnj5MeqA/L6aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118002-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DA2A7318AD

Unlike the GearVM variant, Nord Embedded variant has platform resources
(clocks, regulators, powerdomains, pins, etc.) directly controlled by
Linux. Add a separate dtsi file extending the existing top-level
nord.dtsi with nodes representing these peripherals as well as describing
how they are wired up with the already defined components.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1731 +++++++++++++++++++
 1 file changed, 1731 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
new file mode 100644
index 000000000000..619025011b56
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -0,0 +1,1731 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,nord-gcc.h>
+#include <dt-bindings/clock/qcom,nord-negcc.h>
+#include <dt-bindings/clock/qcom,nord-nwgcc.h>
+#include <dt-bindings/clock/qcom,nord-segcc.h>
+#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+#include "nord.dtsi"
+
+/ {
+	clk_virt: interconnect-clk-virt {
+		compatible = "qcom,nord-clk-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-mc-virt {
+		compatible = "qcom,nord-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+};
+
+&crypto {
+	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "memory";
+};
+
+&i2c0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c1_default>;
+	pinctrl-names = "default";
+};
+
+&i2c2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c2_default>;
+	pinctrl-names = "default";
+};
+
+&i2c3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c3_default>;
+	pinctrl-names = "default";
+};
+
+&i2c4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c4_default>;
+	pinctrl-names = "default";
+};
+
+&i2c5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c5_default>;
+	pinctrl-names = "default";
+};
+
+&i2c7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c7_default>;
+	pinctrl-names = "default";
+};
+
+&i2c8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c8_default>;
+	pinctrl-names = "default";
+};
+
+&i2c9 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c9_default>;
+	pinctrl-names = "default";
+};
+
+&i2c10 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c10_default>;
+	pinctrl-names = "default";
+};
+
+&i2c11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c11_default>;
+	pinctrl-names = "default";
+};
+
+&i2c12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c12_default>;
+	pinctrl-names = "default";
+};
+
+&i2c13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c13_default>;
+	pinctrl-names = "default";
+};
+
+&i2c14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c14_default>;
+	pinctrl-names = "default";
+};
+
+&i2c16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c16_default>;
+	pinctrl-names = "default";
+};
+
+&i2c17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c17_default>;
+	pinctrl-names = "default";
+};
+
+&i2c18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-names = "default";
+};
+
+&i2c19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c19_default>;
+	pinctrl-names = "default";
+};
+
+&i2c20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_i2c20_default>;
+	pinctrl-names = "default";
+};
+
+&qupv3_0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
+		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
+	clock-names = "m-ahb", "s-ahb";
+};
+
+&qupv3_1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_M_AHB_CLK>,
+		 <&segcc SE_GCC_QUPV3_WRAP1_S_AHB_CLK>;
+	clock-names = "m-ahb", "s-ahb";
+};
+
+&qupv3_2 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_M_AHB_CLK>,
+		 <&negcc NE_GCC_QUPV3_WRAP2_S_AHB_CLK>;
+	clock-names = "m-ahb",
+		      "s-ahb";
+};
+
+&spi0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi0_default>;
+	pinctrl-names = "default";
+};
+
+&spi1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi1_default>;
+	pinctrl-names = "default";
+};
+
+&spi2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi2_default>;
+	pinctrl-names = "default";
+};
+
+&spi3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi3_default>;
+	pinctrl-names = "default";
+};
+
+&spi4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi4_default>;
+	pinctrl-names = "default";
+};
+
+&spi5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi5_default>;
+	pinctrl-names = "default";
+};
+
+&spi7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi7_default>;
+	pinctrl-names = "default";
+};
+
+&spi8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi8_default>;
+	pinctrl-names = "default";
+};
+
+&spi11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi11_default>;
+	pinctrl-names = "default";
+};
+
+&spi12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi12_default>;
+	pinctrl-names = "default";
+};
+
+&spi13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi13_default>;
+	pinctrl-names = "default";
+};
+
+&spi14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi14_default>;
+	pinctrl-names = "default";
+};
+
+&spi16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+};
+
+&spi17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi17_default>;
+	pinctrl-names = "default";
+};
+
+&spi18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi18_default>;
+	pinctrl-names = "default";
+};
+
+&spi19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi19_default>;
+	pinctrl-names = "default";
+};
+
+&spi20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config", "qup-memory";
+	pinctrl-0 = <&qup_spi20_default>;
+	pinctrl-names = "default";
+};
+
+&soc {
+	gcc: clock-controller@100000 {
+		compatible = "qcom,nord-gcc";
+		reg = <0x0 0x00100000 0x0 0x1f4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	cnoc_main: interconnect@1500000 {
+		compatible = "qcom,nord-cnoc-main";
+		reg = <0x0 0x01500000 0x0 0x1d200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	config_noc: interconnect@1600000 {
+		compatible = "qcom,nord-cnoc-cfg";
+		reg = <0x0 0x01600000 0x0 0xd200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	system_noc: interconnect@1680000 {
+		compatible = "qcom,nord-system-noc";
+		reg = <0x0 0x01680000 0x0 0x1c080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre2_noc_tile: interconnect@16c0000 {
+		compatible = "qcom,nord-aggre2-noc-tile";
+		reg = <0x0 0x016c0000 0x0 0x1b400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre1_noc: interconnect@16e0000 {
+		compatible = "qcom,nord-aggre1-noc";
+		reg = <0x0 0x016e0000 0x0 0x1c400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre2_noc: interconnect@1700000 {
+		compatible = "qcom,nord-aggre2-noc";
+		reg = <0x0 0x01700000 0x0 0x1b400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&rpmhcc RPMH_IPA_CLK>;
+	};
+
+	aggre1_noc_tile: interconnect@1720000 {
+		compatible = "qcom,nord-aggre1-noc-tile";
+		reg = <0x0 0x01720000 0x0 0x23400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>;
+	};
+
+	mmss_noc: interconnect@1780000 {
+		compatible = "qcom,nord-mmss-noc";
+		reg = <0x0 0x01780000 0x0 0x72800>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_cfg: interconnect@1ba0000 {
+		compatible = "qcom,nord-pcie-cfg";
+		reg = <0x0 0x01ba0000 0x0 0x7200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_data_outbound: interconnect@1bc0000 {
+		compatible = "qcom,nord-pcie-data-outbound";
+		reg = <0x0 0x01bc0000 0x0 0x17000>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_data_inbound: interconnect@1c00000 {
+		compatible = "qcom,nord-pcie-data-inbound";
+		reg = <0x0 0x01c00000 0x0 0x4b080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	ufs_mem_phy: phy@1d40000 {
+		compatible = "qcom,nord-qmp-ufs-phy",
+			     "qcom,sm8650-qmp-ufs-phy";
+		reg = <0x0 0x01d40000 0x0 0x2000>;
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&negcc NE_GCC_UFS_PHY_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_UFS_CLKREF_EN>;
+		clock-names = "ref",
+			      "ref_aux",
+			      "qref";
+
+		resets = <&ufs_mem_hc 0>;
+		reset-names = "ufsphy";
+
+		power-domains = <&negcc NE_GCC_UFS_MEM_PHY_GDSC>;
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	ice: crypto@1d48000 {
+		compatible = "qcom,nord-inline-crypto-engine",
+			     "qcom,inline-crypto-engine";
+		reg = <0x0 0x01d48000 0x0 0x10000>;
+		clocks = <&negcc NE_GCC_UFS_PHY_ICE_CORE_CLK>,
+			 <&negcc NE_GCC_UFS_PHY_AHB_CLK>;
+		clock-names = "core",
+			      "iface";
+		power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
+	};
+
+	hscnoc: interconnect@2000000 {
+		compatible = "qcom,nord-hscnoc";
+		reg = <0x0 0x02000000 0x0 0xb22000>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	hpass_ag_noc: interconnect@5fc0000 {
+		compatible = "qcom,nord-hpass-ag-noc";
+		reg = <0x0  0x05fc0000 0x0 0x37080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	negcc: clock-controller@8900000 {
+		compatible = "qcom,nord-negcc";
+		reg = <0x0 0x08900000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	segcc: clock-controller@8a00000 {
+		compatible = "qcom,nord-segcc";
+		reg = <0x0 0x08a00000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	nwgcc: clock-controller@8b00000 {
+		compatible = "qcom,nord-nwgcc";
+		reg = <0x0 0x08b00000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	tcsrcc: clock-controller@f1d9000 {
+		compatible = "qcom,nord-tcsrcc",
+			     "syscon";
+		reg = <0x0 0x0f1d9000 0x0 0xf00c>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	apps_rsc: rsc@18900000 {
+		compatible = "qcom,rpmh-rsc";
+		reg = <0x0 0x18900000 0x0 0x10000>,
+		      <0x0 0x18910000 0x0 0x10000>,
+		      <0x0 0x18920000 0x0 0x10000>;
+		reg-names = "drv-0",
+			    "drv-1",
+			    "drv-2";
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+		qcom,tcs-offset = <0xd00>;
+		qcom,drv-id = <2>;
+		qcom,tcs-config = <ACTIVE_TCS 3>,
+				  <SLEEP_TCS 2>,
+				  <WAKE_TCS 2>,
+				  <CONTROL_TCS 0>;
+		label = "apps_rsc";
+		power-domains = <&system_pd>;
+
+		apps_bcm_voter: bcm-voter {
+			compatible = "qcom,bcm-voter";
+		};
+
+		rpmhcc: clock-controller {
+			compatible = "qcom,nord-rpmh-clk";
+			clocks = <&xo_board>;
+			clock-names = "xo";
+			#clock-cells = <1>;
+		};
+
+		rpmhpd: power-controller {
+			compatible = "qcom,nord-rpmhpd";
+			#power-domain-cells = <1>;
+			operating-points-v2 = <&rpmhpd_opp_table>;
+
+			rpmhpd_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				rpmhpd_opp_ret: opp-0 {
+					opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+				};
+
+				rpmhpd_opp_min_svs: opp-1 {
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+
+				rpmhpd_opp_low_svs: opp2 {
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				rpmhpd_opp_svs: opp3 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				rpmhpd_opp_svs_l1: opp-4 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				rpmhpd_opp_nom: opp-5 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				rpmhpd_opp_nom_l1: opp-6 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				rpmhpd_opp_nom_l2: opp-7 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+				};
+
+				rpmhpd_opp_turbo: opp-8 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				rpmhpd_opp_turbo_l1: opp-9 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+			};
+		};
+	};
+
+	nsp_data_noc_0: interconnect@1f200000 {
+		compatible = "qcom,nord-nsp-data-noc-0";
+		reg = <0x0 0x1f200000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_1: interconnect@1f600000 {
+		compatible = "qcom,nord-nsp-data-noc-1";
+		reg = <0x0 0x1f600000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_2: interconnect@1fa00000 {
+		compatible = "qcom,nord-nsp-data-noc-2";
+		reg = <0x0 0x1fa00000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_3: interconnect@1fe00000 {
+		compatible = "qcom,nord-nsp-data-noc-3";
+		reg = <0x0 0x1fe00000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+};
+
+&tlmm {
+	qup_i2c0_default: qup-i2c0-default-state {
+		pins = "gpio111", "gpio112";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c1_default: qup-i2c1-default-state {
+		pins = "gpio111", "gpio112";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c2_default: qup-i2c2-default-state {
+		pins = "gpio113", "gpio114";
+		function = "qup0_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c3_default: qup-i2c3-default-state {
+		pins = "gpio115", "gpio116";
+		function = "qup0_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c4_default: qup-i2c4-default-state {
+		pins = "gpio117", "gpio118";
+		function = "qup0_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c5_default: qup-i2c5-default-state {
+		pins = "gpio121", "gpio122";
+		function = "qup0_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c7_default: qup-i2c7-default-state {
+		pins = "gpio123", "gpio124";
+		function = "qup1_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c8_default: qup-i2c8-default-state {
+		pins = "gpio125", "gpio126";
+		function = "qup1_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c9_default: qup-i2c9-default-state {
+		pins = "gpio127", "gpio128";
+		function = "qup1_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c10_default: qup-i2c10-default-state {
+		pins = "gpio129", "gpio130";
+		function = "qup1_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c11_default: qup-i2c11-default-state {
+		pins = "gpio131", "gpio132";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c12_default: qup-i2c12-default-state {
+		pins = "gpio133", "gpio134";
+		function = "qup1_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c13_default: qup-i2c13-default-state {
+		pins = "gpio137", "gpio138";
+		function = "qup1_se6";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c14_default: qup-i2c14-default-state {
+		pins = "gpio139", "gpio140";
+		function = "qup2_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c16_default: qup-i2c16-default-state {
+		pins = "gpio145", "gpio146";
+		function = "qup2_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c17_default: qup-i2c17-default-state {
+		pins = "gpio150", "gpio151";
+		function = "qup2_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c18_default: qup-i2c18-default-state {
+		pins = "gpio154", "gpio155";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c19_default: qup-i2c19-default-state {
+		pins = "gpio156", "gpio157";
+		function = "qup2_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c20_default: qup-i2c20-default-state {
+		pins = "gpio158", "gpio159";
+		function = "qup2_se6";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_spi0_default: qup-spi0-default-state {
+		data-pins {
+			pins = "gpio109", "gpio111", "gpio112";
+			function = "qup0_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi1_default: qup-spi1-default-state {
+		data-pins {
+			pins = "gpio109", "gpio111", "gpio112";
+			function = "qup0_se1";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se1";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi2_default: qup-spi2-default-state {
+		data-pins {
+			pins = "gpio113", "gpio114", "gpio115";
+			function = "qup0_se2";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio116";
+			function = "qup0_se2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi3_default: qup-spi3-default-state {
+		data-pins {
+			pins = "gpio113", "gpio115", "gpio116";
+			function = "qup0_se3";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio114";
+			function = "qup0_se3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi4_default: qup-spi4-default-state {
+		data-pins {
+			pins = "gpio117", "gpio118", "gpio119";
+			function = "qup0_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio120";
+			function = "qup0_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi5_default: qup-spi5-default-state {
+		data-pins {
+			pins = "gpio109", "gpio121", "gpio122";
+			function = "qup0_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi7_default: qup-spi7-default-state {
+		data-pins {
+			pins = "gpio123", "gpio124", "gpio125";
+			function = "qup1_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio126";
+			function = "qup1_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi8_default: qup-spi8-default-state {
+		data-pins {
+			pins = "gpio123", "gpio125", "gpio126";
+			function = "qup1_se1";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio124";
+			function = "qup1_se1";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi11_default: qup-spi11-default-state {
+		data-pins {
+			pins = "gpio131", "gpio132", "gpio137";
+			function = "qup1_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio138";
+			function = "qup1_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi12_default: qup-spi12-default-state {
+		data-pins {
+			pins = "gpio133", "gpio134", "gpio135";
+			function = "qup1_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio136";
+			function = "qup1_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi13_default: qup-spi13-default-state {
+		data-pins {
+			pins = "gpio131", "gpio137", "gpio138";
+			function = "qup1_se6";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio132";
+			function = "qup1_se6";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi14_default: qup-spi14-default-state {
+		data-pins {
+			pins = "gpio139", "gpio140", "gpio141";
+			function = "qup2_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio142";
+			function = "qup2_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi16_default: qup-spi16-default-state {
+		data-pins {
+			pins = "gpio145", "gpio146", "gpio147";
+			function = "qup2_se2";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio148";
+			function = "qup2_se2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi17_default: qup-spi17-default-state {
+		data-pins {
+			pins = "gpio150", "gpio151", "gpio152";
+			function = "qup2_se3";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio153";
+			function = "qup2_se3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi18_default: qup-spi18-default-state {
+		data-pins {
+			pins = "gpio143", "gpio154", "gpio155";
+			function = "qup2_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio144";
+			function = "qup2_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi19_default: qup-spi19-default-state {
+		data-pins {
+			pins = "gpio156", "gpio157", "gpio158";
+			function = "qup2_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio159";
+			function = "qup2_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi20_default: qup-spi20-default-state {
+		data-pins {
+			pins = "gpio156", "gpio158", "gpio159";
+			function = "qup2_se6";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio157";
+			function = "qup2_se6";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_uart0_default: qup-uart0-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart1_default: qup-uart1-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart2_default: qup-uart2-default-state {
+		pins = "gpio115", "gpio116";
+		function = "qup0_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart3_default: qup-uart3-default-state {
+		pins = "gpio113", "gpio114";
+		function = "qup0_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart4_default: qup-uart4-default-state {
+		pins = "gpio119", "gpio120";
+		function = "qup0_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart5_default: qup-uart5-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart7_default: qup-uart7-default-state {
+		pins = "gpio125", "gpio126";
+		function = "qup1_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart8_default: qup-uart8-default-state {
+		pins = "gpio123", "gpio124";
+		function = "qup1_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart9_default: qup-uart9-default-state {
+		pins = "gpio127", "gpio128";
+		function = "qup1_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart10_default: qup-uart10-default-state {
+		pins = "gpio129", "gpio130";
+		function = "qup1_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart11_default: qup-uart11-default-state {
+		pins = "gpio137", "gpio138";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart12_default: qup-uart12-default-state {
+		pins = "gpio135", "gpio136";
+		function = "qup1_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart13_default: qup-uart13-default-state {
+		pins = "gpio131", "gpio132";
+		function = "qup1_se6";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart14_default: qup-uart14-default-state {
+		pins = "gpio141", "gpio142";
+		function = "qup2_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart15_default: qup-uart15-default-state {
+		pins = "gpio143", "gpio144";
+		function = "qup2_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart16_default: qup-uart16-default-state {
+		pins = "gpio147", "gpio148";
+		function = "qup2_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart17_default: qup-uart17-default-state {
+		pins = "gpio152", "gpio153";
+		function = "qup2_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart18_default: qup-uart18-default-state {
+		pins = "gpio143", "gpio144";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart19_default: qup-uart19-default-state {
+		pins = "gpio158", "gpio159";
+		function = "qup2_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart20_default: qup-uart20-default-state {
+		pins = "gpio156", "gpio157";
+		function = "qup2_se6";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart0_default>;
+	pinctrl-names = "default";
+};
+
+&uart1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart1_default>;
+	pinctrl-names = "default";
+};
+
+&uart2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart2_default>;
+	pinctrl-names = "default";
+};
+
+&uart3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart3_default>;
+	pinctrl-names = "default";
+};
+
+&uart4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart4_default>;
+	pinctrl-names = "default";
+};
+
+&uart5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart5_default>;
+	pinctrl-names = "default";
+};
+
+&uart7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart7_default>;
+	pinctrl-names = "default";
+};
+
+&uart8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart8_default>;
+	pinctrl-names = "default";
+};
+
+&uart9 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart9_default>;
+	pinctrl-names = "default";
+};
+
+&uart10 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+};
+
+&uart11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart11_default>;
+	pinctrl-names = "default";
+};
+
+&uart12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart12_default>;
+	pinctrl-names = "default";
+};
+
+&uart13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart13_default>;
+	pinctrl-names = "default";
+};
+
+&uart14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart14_default>;
+	pinctrl-names = "default";
+};
+
+&uart15 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart15_default>;
+	pinctrl-names = "default";
+};
+
+&uart16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart16_default>;
+	pinctrl-names = "default";
+};
+
+&uart17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart17_default>;
+	pinctrl-names = "default";
+};
+
+&uart18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart18_default>;
+	pinctrl-names = "default";
+};
+
+&uart19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart19_default>;
+	pinctrl-names = "default";
+};
+
+&uart20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core", "qup-config";
+	pinctrl-0 = <&qup_uart20_default>;
+	pinctrl-names = "default";
+};
+
+&ufs_mem_hc {
+	reg = <0x0 0x01d44000 0x0 0x3000>,
+	      <0x0 0x01d60000 0x0 0x15000>;
+	reg-names = "std",
+		    "mcq";
+
+	clocks = <&negcc NE_GCC_UFS_PHY_AXI_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_AHB_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+		 <&tcsrcc TCSR_UFS_CLKREF_EN>,
+		 <&negcc NE_GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+	clock-names = "core_clk",
+		      "bus_aggr_clk",
+		      "iface_clk",
+		      "core_clk_unipro",
+		      "ref_clk",
+		      "tx_lane0_sync_clk",
+		      "rx_lane0_sync_clk",
+		      "rx_lane1_sync_clk";
+
+	resets = <&negcc NE_GCC_UFS_PHY_BCR>;
+	reset-names = "rst";
+
+	interconnects = <&aggre1_noc_tile MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "ufs-ddr",
+			     "cpu-ufs";
+
+	phys = <&ufs_mem_phy>;
+	phy-names = "ufsphy";
+
+	power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
+	operating-points-v2 = <&ufs_opp_table>;
+	required-opps = <&rpmhpd_opp_nom>;
+	qcom,ice = <&ice>;
+	#reset-cells = <1>;
+
+	status = "disabled";
+
+	ufs_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <100000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-201500000 {
+			opp-hz = /bits/ 64 <201500000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <201500000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-403000000 {
+			opp-hz = /bits/ 64 <403000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <403000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
-- 
2.43.0


