Return-Path: <linux-arm-msm+bounces-115607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id quGTJv3ORGrk1AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:25:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413DA6EB114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:25:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bx+VYOFQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pd5sTjrF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115607-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115607-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51B00304B99A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C9A3B52F8;
	Wed,  1 Jul 2026 08:19:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502D43A3826
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:19:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893998; cv=none; b=sjVlwlJV+gm7T029kAnmJoCZYSPebhM5tq4Gol7bV+wUm07rY32pK2Zka47z1HSfCmehxGmq1N1JCawdDHg7LHcbbqPoZytlKc1DDhNSMiIbX2n9oG0W1hYr/2AAmi+hoEcDtJupKRJduzhf3Rvp8laRhfV52XlH1RTKwAo6AQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893998; c=relaxed/simple;
	bh=EGv4GYvLJhMHC7C7MhV0I+x/rtFPkL/J9u9qJvy2w1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cwd3V8kyZn0KLcU1ZfDE53B4Tmnetjlh/PFPnjCbVeDdzaI3EPJb8nFl8ia4Zx1l0xKWNupScmwEiRUxSGhWcDiq0QafmM1ABTn5ne0CF+rkhIPkPkCh2PR5F3UVvr813x7YImqVX+xSW7BFNJsubXPkkRfHlS/MS90zN6YImVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bx+VYOFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pd5sTjrF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GMul489403
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kH/fZ8T7ln1
	R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=; b=bx+VYOFQD1CqlEeCZqD5nn2mjpF
	Ww9dVBBKuy0uCNvOVRmRcPdAotvYLM0os8OhanhXyRF2CduBM4tW2q3bl2ScZqjJ
	T9p6cKiq9q3jocmdw+dUW3zs7CsPpZxMt48JsvoLOxwKupJe6I/J6xfDrYKnPszv
	q/T1o/VotUz9ozUNUaf/+SVQ2114VdQ7fp9uUXdgSyUXAHo9qPUmrsTU5+ydMjE9
	sLoriBjqsWdgXochZSCMHbbubsMmNfVwG/2H5aPc16gOFHgWwZKKqMVSEokp8Zbx
	yCG2IZkMverxUmMWDxdm/SFpxh9MST4Ot12PZAdJkkaOB2ppMHKGcA4WYcw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0aup0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:19:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84770f89b99so751609b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893995; x=1783498795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=Pd5sTjrFIBmMOpX5+7btpxQonUfRW7jWyp7YF68VvfHU9WXUTKBtVyV9nwhXx2rClh
         P/QgDRUGMGsoO5G3AT4fUHIIt4QCp8Fj3ZGvu04GDeGwj2/5/OgJ0wFDEDlXjXO32Qxk
         KUjBaJhWUSTF2LqqaG0i4xvqRLTa3HBx4IMpr6rrRthr6u557AXTF5F2ynwBIjuJ3CHc
         lRrVqM5RWAmFxwR06Pd0JeIuot6A88yWlxn0BG0fsC4P/v7FDcU1m5REYMD3qp/4OYhP
         6ClhhxUtVM2dq11XFzKB3u+glarnPcBy4a9nMCDbjarpiErb9jnj6WHoq1VMWapsDVyo
         Xvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893995; x=1783498795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=F0gj23ySj6efMKrdL3wADX96z2O5DqZyakB5yxEOzuezLIHWs0HE32ARnn+wPKT5GC
         mhvYLIxssFTJK8kp0nw2J7Oc5fmyWRsqfDG4JMpGp0RlyeBXsia0K5HrWmf2Omm/Wm+Q
         S5YHLCNPv8unWamord/vxXy8SA2LuMrY7DctU28LLequ/T+7+AEGoWuxA0aLnBOE0c2z
         Je7fn3vcWtajhLD1OkVLmmb3vNKvAG5+gS88xT+lcbRRR5m4kDejH9w2r2UsRkU7lJ01
         h8w9oC2JaLrPkknMmhe0pxGOQcTe/9W6dI/aqgPQHLuEtHs8n4zMUTdEuYDGY4A+S3rW
         a+8w==
X-Gm-Message-State: AOJu0YzXlWpyZH79XcvWREegjox95FQSUXB1H4YQHlPZ6LesvMg/0ByE
	eE3on3XHXSYaM1tdzuEUzFohR5CSQ1+XX4Ob0cUZSCOOKsMcLkbmeS3axJUFIfzY1ruzdyFrI5R
	3WeIm3MslEwx5PecDMSyLW+nNMrMrUhlg6BSNulIjty7AdG4SIYwQLVBLmidh2lA66o26
X-Gm-Gg: AfdE7cnjm1ZC7XTsgjDBFPoSW6dOTG27nPhc6ID8I6v3p6H8If2RBrt/JnvnihL1wFi
	DYX+W2CB0Ve+1n6sXC6TQ27B5AWE32p/8CghISdcuNQMfF0myb9EkEU/WD9/q7JOVKX3jT+TLxR
	a19x0GZMO9pdsnmf2ACvho6OLIZblksekPxwm+P7zUSz2/NTAXEAx+T07t3uI39kbldb2BGfCr+
	w1X66io04gHQpmJZ0/vvM0h7Vvt5OBN1B8JNe0abj+bKdmgiPv90R3AJQvXFu5dvWHsD80cI3UF
	rsXtVWkbpo3i6GdDjq2LiUKLGIOxjOoCZatqGOSxAnbf2gNgkzt9VwjpgrvWnVqqfjFFfcVsgpD
	wJ3smhDWR0YAV0VXBKybYBk9um2DIW84RzcBpIx5KH3TjYQ==
X-Received: by 2002:a05:6a00:21d2:b0:845:e1a3:106f with SMTP id d2e1a72fcca58-847c08f4d3fmr558507b3a.53.1782893995233;
        Wed, 01 Jul 2026 01:19:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:845:e1a3:106f with SMTP id d2e1a72fcca58-847c08f4d3fmr558480b3a.53.1782893994756;
        Wed, 01 Jul 2026 01:19:54 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:54 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V3 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Wed,  1 Jul 2026 13:47:15 +0530
Message-Id: <20260701081715.2580329-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44cdac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FCMv9EZ1guwIjbhFI0kA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: JY3loT-lj1cl-kBwWE4Ibc__B24Fiq0p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX8d446MWZC6qQ
 BiVCNUIa+N3BgYqLcsms53f8de47y+sTtKl2akJuM2g0GvBKQZQjVmMgkqw/ZS/1U+eEpLTFxvj
 eRbbFD6QJGqNJeRkkQNXBFqefSdSWvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX0ITEqacyFSlr
 W+4qfvdV845ewyiS9NlSjGK2cggogmblUyQ3A0tj3Df4EDTpqYgO4GRWKJoOj+Uoz2AOB762YkN
 admOpAClgDTP1JY3121bDxoeX+jLgei8ataG3+Jmdax06fNN5RIazTY7oKMdOVepBjbSjrTK/7T
 NJqu+0y8tXnYW8/9bhIwBsijSXCczC8ku+ZzkH8IhsFLq1XsfIUYUACSHGGZK/kyuocH15PurzB
 mic9YzBiK2QkCZvFGVtvO4ZbsPTJz6AqIKF8e31RUNiqe0zFWhFj+M/lclbExY66gf/SAuLMHNw
 fF2jN2gaP/wxZJ67nIe1eDQ44wZFnrYkJ0a+yqzr69AX00WY66AlDTNunSi8aEgMBeTJPwPOqV1
 mPsud8E5n0Wa/D4KG7SgOgH8hoq9N5ftYT/rBTktERXQXuPXZ/3g11UlGutwMW/Emro8cCLOuXe
 6WU28QkJlbsI9/FMgXg==
X-Proofpoint-GUID: JY3loT-lj1cl-kBwWE4Ibc__B24Fiq0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010083
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-115607-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 413DA6EB114

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 37 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3c5983bff00c..e9a21c83001c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -73,6 +73,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
 
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..cb2566ac6923
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+        vreg_s2s: regulator-vreg-s2s {
+                compatible = "regulator-fixed";
+                regulator-name = "regulator-s2s";
+
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1


