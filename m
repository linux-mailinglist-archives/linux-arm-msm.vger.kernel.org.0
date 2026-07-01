Return-Path: <linux-arm-msm+bounces-115606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2+b4BPXORGra1AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:25:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0946EB109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:25:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jql9nyP1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NYW54pZ8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115606-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115606-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E3933136FB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6944F3B9920;
	Wed,  1 Jul 2026 08:19:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801D38E5D4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:19:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893980; cv=none; b=lCi3soursy7jT6SxipkUs0XbqfXR/zSlcYVyI8WYWuExMkPYA+AoUu0BUJi5eckjHOpUmMHt23mIZ3qh1+V/EytvqJTeW5qN19gpJYXh1/ME+QpxJAIRL9elLMYi720hUAWZPLG6vBg/5qs1vGDENOgqtse41pvGPJain5vYnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893980; c=relaxed/simple;
	bh=Qj7nElh8Dxw2oCGhto93gjgUW0SgkImRKgctY43R//U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bgcZhdRoTDM3OMcZUSYFo3J2TfuU8XbIwRHMpH40AORw1EWSeOxzdjkaAxBUa1DePCTTam+a3Ohv+TdDHF5UY96wKfeRODb6/JoUINMD0Y4rSYBThD+1McfSJ9M46HxWavYz8hciTYIU0w6hbYx6vui0e5uCmQvlq/ylPUPUkhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jql9nyP1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYW54pZ8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G2eK455978
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ef5Ji2dDzze
	Kj36vpeP5fZdbDYLrkWxDfp9sewJA92o=; b=jql9nyP1C6o0kw3+IHv7CW6t4Ix
	Yp6/IApzWuKO5WhbPO9o2GXJ9TRmgbhTs5bmfNXbTXUUyGM3M8EIuDS/s0o790LI
	PMmvoKEno+YadAiEm0SkU5F3ugn6GeWuXBEuh3d0iQq4S0TgSm0KJ2OF+tTYwn25
	8FzLviXL6UUIwhj73Wd62FtzUKmjppVOB6e7Vga+mt0PZA9STjix19BSsL1TE/oE
	G1pyhAvU5bgkFdAsGPsviOwWmN3Nmx6fjxwE5M01upfl/c/M7by4ZgE3iQV/Z+Lm
	/H/EBCkf/9UPgHKYtz+6d8Mj/4pPBxwcNrABv3xTTd/yh7xL9S8kxjhG+ug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwayj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:19:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a5f03ff9so440137b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893976; x=1783498776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=NYW54pZ8Hqw4lOu470shL8sn56QHN9vscEEzJC6PlQouaBUPp2okkmsCqlNSn6PDUo
         cQ1utfdpO+umPbW2MFImDvaGnW3owAtq46Zl0Q6UrJnL/5DNNqg/CnMZRcRXB5yULae+
         PILbpDEcchQSX+THwJzdlDLxN9jfvqoivQZ+1fp/6AfVlWvhGyawplI5XdY7+SQLlhWb
         Y5x8czFKk3P0x3yN4lBH9WgR7aFu8zUV5T3qAtclz9p4d7AUqC/nznTBCHPxiprz4RoS
         n+D5FcMLcVFYCQ1qIPI79mk85aJ89JmkQ/JxwlfNV8H0ouIv2ou8J5n5JEu34WNRM1bL
         j94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893976; x=1783498776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=ItWWe7IOb4vAhCfUWn62epVSUxP3pF/Ii5Xc1p8CFruVoylDpc9FySeWwRwXMNgKS0
         m/il+sQRScXIuRKIsE3BrYRMoDfbdIW9ToiGgmxZV2XR9KeyxR5LUr4eIE1tr+vlDhZd
         LU9MyFL8lK+cW7ZmjZz8Eqvn2sd7QsD1pSuYtc53GDK9uwa7+lYlP3CE0C8/BaO2vUke
         ZqfESdymcNVj3BtMRXwnfgKAQ5fRMhmA5iqapm9PH4njfpohaNoYcS/b1Hw0bhgbvhXL
         LF+wpWJKGpDY48VqsJOWmA71QXljfH2g/w6jSiUnHusLcjKv4iYqKUnahBjEn+WE9cUl
         0MBQ==
X-Gm-Message-State: AOJu0YxMGgC4T1D49ehUWl+/lgh0EnYv7djUbN2v3Su1ECx9CVYD9VB1
	2UXWRF6bJe0hEEOR8Vl7Adx59SlL9jBECKxMn8ENLSFbFlXgm0umuHPVXArTdhQluhsvXtbW6N8
	t3meR8zX+tQ6uJk5CzvgEt8tcWZwO546GEnXMvM30NXDQ/HK/sdDHK6QHXXwgv61us0HQ
X-Gm-Gg: AfdE7cmmOQTubn5WgBlZLJVwJqP7jpRjxvDWUX8gWATH1AcY3yCLe9Z7LMRS7jFo+TH
	gyxClTzYVWCX8VFkyw8AUCKkM1y8+FReUsvLWUNVpw0T71NB4EgZU/mo5Hj87cMhNRg18NTCzSK
	H98/Ab8Bjoha3sHl4SYkQdZTC4RTzVHkkN/hzSNi/1ZYlyJDXGnev0JBcNDRd3KUWyFXb7B+ji/
	D+qdwgEaDmmY5tz72aiG3XWiIKYQ+OC/zXlUwWi/qOCS4rUs2qg9JtdVNQBlZ3HuMJ5qok+BkRb
	jNcvi0cl8R4jMtT4iLeXaxQetYGQmp8ZltVf3wm/JnrAjaURbd1WmMApiZc1Re4PCB90vXk28r8
	yfdEPkZp1tXvIPNmV4G8+UUd0f7VcMKCl41SPU2pGoHF66g==
X-Received: by 2002:a05:6a00:2e99:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-847c0949065mr502274b3a.50.1782893976392;
        Wed, 01 Jul 2026 01:19:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e99:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-847c0949065mr502253b3a.50.1782893975933;
        Wed, 01 Jul 2026 01:19:35 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:35 -0700 (PDT)
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
Subject: [PATCH V3 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Wed,  1 Jul 2026 13:47:14 +0530
Message-Id: <20260701081715.2580329-3-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 585mTKIG41LuOdW1VlVJawstcfXliBw6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfXzc/NamWJuKgP
 5oWbwRtcUSYk/VgOb7uA1nrEs78ZAbMnIm6NAc8B1OXp8K6pSvH6SqU5/EWzrYhd0Ke0CLaE6rW
 NQLg5jJJxpeG3c5hz/3a21IA57ea5KQ=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44cd99 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MGA-IAg3UYKhKOWSYZAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 585mTKIG41LuOdW1VlVJawstcfXliBw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX5wrC2OsMZpVx
 1ooRwxfClgnHB31VDOt6Mr2tF+niLU1JPca4v2/LTdivlgwYO6KVU0bMRabyudUUTc52MoapZ6w
 CcYhk/y+uj4l38Tl9H9cft0SelxzUlQ44zMgNQDpLsWgi1Wu0Fe0Mjx3vbktiqGKugEOrmj4U7r
 92IvJv52kJ62FsIW+KpkfBQjtsvJgOkVaixHH/ECLfbCfAfOlMJpbWcXYW6Hbo31CovnAz24xft
 iT7VGhz1rUzfa1W83kKGFZOzuE5JV7G55HtKAGYMATIAq+JrrexZI7jo0WzI/jZlII5rC6Aoz40
 65N+bA742HEAbEs7oRHqDIMlJW3YcAICQDlufBwjQYu6fiGiROfozQWLRZnH/Aue5iJRVrQduLQ
 4zWGo2nDibZEUafzIlT36dSWW2JTjpM/I4htCT0HtnUbU7kTh/+0KIcRQqXbExZ+OlxLLKq3ZQR
 eqoqD8zbscpRVq2dDhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010083
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
	TAGGED_FROM(0.00)[bounces-115606-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D0946EB109

The monaco EVK board supports either eMMC or SD-card, but only one
can be active at a time.

Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
to support SD Card for storage via a device tree overlay. This allows
eMMC support to be enabled through a separate overlay when required.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..3c5983bff00c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..bc4ea12587a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+        vmmc_sdc: regulator-mmc-sdc {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
-- 
2.34.1


