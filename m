Return-Path: <linux-arm-msm+bounces-109706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIGAGKkXFWqQSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999B45D0716
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C9763026F2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48600313534;
	Tue, 26 May 2026 03:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ES6qBkyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j1wk6Ko4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F73612EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767195; cv=none; b=VOuLL4w6GYnse1mCUBpE7xx1XnHSPsfF5kE97SZLbPrauYqqwhm9c3Sv7t5BM/t9zljoZuKRtgdQj6xGtbSLLt8XpYyfi69hF3rp80NBfQT4gj4b7s0E0dD+Xk8pFWVVrOYHYRTwPq8mc5vBf6+Ym5z3G7YBuLHCOYMIWpequZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767195; c=relaxed/simple;
	bh=hgZr9jhjuZN1JuqXFNyAsPCJ+jCwQiMJSoj1DiilXS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnKTPXlraUBMwnFvrdO8kSFFOAsqqVBKdFWMxbhlu5d71ohHBvknDpMPxP3xSYHsC9B0JzZlukqTWzdHg6Adg74DUDt+Bxf41FnEqjFS9yS9/2XlulE3HbftQhNaO88BMOKB9a7477ei4ASV3o+drrE0nfi+2LI7cmkC3f75DdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ES6qBkyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1wk6Ko4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PI4wus2145961
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dM5hRqY+6qj
	p5iL4V3YhplaKslD2njOe/0BtfVdgNrU=; b=ES6qBkybU+7GSnSYcowFLyMTSrV
	oAvWWYMq8Uii4NnfoDwC5k6tlf+rapFN/eglU8kFlAWCaI/1+KuHkLUOmXO6kVoB
	x1P4P1IjV32f/uCM5qzNYYRmi2XIAiKMZOonoEij/I3U4ZW9y0zvqPM1lf/9oq7T
	JVHomS3ASO7ZwUlObrI9evSQVgzT5QmzrsIFAbW0cd19H1m3LxbQyesk4r8TRatZ
	KGjGckXlhyxHYC3VqA7foANYC/9ZzPhjlWsd2faqLNYeSxAVc5E15PqXCs4NHvVi
	JK1zinACP7nG8Yqf5E4d8payEhEHzpg5XAvHPV19WkwkHQSMS8jzRiMyMjQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv2qrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304627c66ddso1247441eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 20:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779767190; x=1780371990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dM5hRqY+6qjp5iL4V3YhplaKslD2njOe/0BtfVdgNrU=;
        b=j1wk6Ko4K+mOr8WLaCnLCJQb9/7hZFyADMCcJlekbrJX8Pst7v0/GHpZlQGYJ3HLGa
         6YTn88yC6YR23U7ubUE620tHWUumSTCgSjC8jEueSZyJ30CJkGc6Y0A+DS6Ucwpjj6WZ
         1lY+AwqmCQbkHLkBX9rgwS5XTc5jrL2c/BreOu1fpbQ5S6QqIL605dyZsAZSUEtth3Xd
         DWbb/+9CPzVXDncwfaVRI4ajgHWP5pwE7qHjFVSm90FtTs3OwtGCVJHT1qBm5yc0e/Vh
         kDii4BEk9WCOy5pTjkXD06ab4fXDMRJ2JP1JcZG1QC+drwVTE2/CjP3e2b8I8Zjyipzj
         gvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767190; x=1780371990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dM5hRqY+6qjp5iL4V3YhplaKslD2njOe/0BtfVdgNrU=;
        b=qDRjogq7vkj+oV7+0t0FejWz0cRlqUCWdh24gfVy4GgXJXu3wjyshkkHJjFC471Kij
         As5cvvQLFh5n6ZM1VWTmlsp2YpoiOZe3nI6oox6XEYKWfnmUhjf72KDh6Zb3Po7eiAwJ
         JrLKg+CeE+GaPyBoyCjaOHy0qJuYBY7UfxfqkgNtv0W5vKIKMT09ahwIQqyJ+sSwCCvC
         yzmGSAiQMOCzu68TtYGxieCXqsIQsCIRX4Q1XoBD9jzJ5cb3xv2DcrK+IFiuj5IqkoCp
         hIo/r3n90r586K5/ia6VtRVeeSw4uDrzMbRezyhslPkYPDFqQLu7KxTiXJFlh4LLj3Iu
         Yb4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KWVN6auFMuWj7BTKNClj1gz+9rxObmmwCWMnrv1SKC5hrM3L99uH7qW/fxW7fkpDg6gguXa9/rlNpv6OA@vger.kernel.org
X-Gm-Message-State: AOJu0YzJtvwqleD+Eyw7F9gmivpVJ/nBZKg4H2mOclYhtXM9cYcOq6/I
	yD495QpPpzB2ONcO7r6sEHlz9lT4TtAXSbdVpUngKnO+VWNlNjDeUkB9btBU1cSKoqIjrGlof7k
	NnIkD9fVdX9aTjfwKfW05Z/tDZvpSOOK04f0ycGJxATr0fcslabOQMKvBgRGk/PM+/93nCny61w
	ZP
X-Gm-Gg: Acq92OGJDsx+xELYSq9O6A2eObK+x0tdxBUHEgIywJGq+gmLM0EUwvofyydtzjUs6rK
	WhJHvqN/IRNOLgBUbtNrUko+XbZf8JaE/2o0lmuMRXlj5OupO34iaaEkyq4ovVIwBDu5jbVyXEL
	HDAydU8d/mpTr22mhB3u9kGLdNTS9s5aL6KFfYJBY9D5g4RsaY3dimoYH0PrFWWnkLxSMatuPpq
	iwfK/zuz40HXz98ViKy4zzDQeHUV6WV46ADv0rCJEp4RZxbJegrFzp0WzyvqUEVhFPW08a/7reE
	h4mGfmBO4FWakE6PqFIlb8zMXH8gk4tsOkcdTfMoSUXMNU4krChiZH9GQx8kmTR8O6aZDiP47kH
	AkS9g8DSGN5hbFsjQa4zmy6EmX+jmykyexE561Y/5gIl1ZHnLk3/hq8WpCBMVLjz4GpMh1JNh41
	5kwxQASg==
X-Received: by 2002:a05:7300:ad06:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-3044905b650mr8069434eec.8.1779767189220;
        Mon, 25 May 2026 20:46:29 -0700 (PDT)
X-Received: by 2002:a05:7300:ad06:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-3044905b650mr8069402eec.8.1779767188267;
        Mon, 25 May 2026 20:46:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm9792271eec.21.2026.05.25.20.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:46:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.or,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: Add device tree for Nord SA8797P SoC
Date: Tue, 26 May 2026 11:45:55 +0800
Message-ID: <20260526034557.1669007-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAzMCBTYWx0ZWRfX+bLcI+w8lyVu
 /fIETwN+LnuwQ0djEAhpFT+rR8SXoht9ta7fc+5xzchKyCk37m11Df8BM0Fq1ddb6Mp960dg8qu
 vVDcF0EqVOD92VT/v+GzL26hOWLp9qE4YP4CTrzslfVD4PCNx5Zqcsyg3YK1bCSLlDncMEBEt+a
 zs+biB5Crn8a9/GpbnFLL1mwTPEXXJSQN69/ZkZQdmga0gN76h2q10HdRG0EnpEamBlPZDj+U/N
 ih1nvDuXciIcpGxm2rQbSK8sG0l2R2IsIlnUl04lDKexgM8wJenShZ4xl1HuM//y4bjBVS4bSxJ
 6pmQwnk/ytkQCiooAL/nwbB24X4SfpWGSDYDkVe17fR3gSe5ZpbbRxWsgm64BfwCvhgMa/KDSil
 pQQoN7ClGdRhRyarAfKQGKeS7aLHtxtjyg8wxYT0XOkZtE1Jr5JYs2YIZZ4P8IL7d66u+PVESoZ
 l2CigK62lAk6UXkzYIA==
X-Proofpoint-GUID: wBvD0tK0K1fuNhGW-qJDSLz1ECx95_vU
X-Proofpoint-ORIG-GUID: wBvD0tK0K1fuNhGW-qJDSLz1ECx95_vU
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a151796 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=C7SS7-jxath9lZw70LYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260030
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109706-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 999B45D0716
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add SoC-level device tree include for SA8797P, an automotive variant
of the Nord SoC family. The dtsi covers:

 - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
   for SMC-based firmware communication channels
 - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with UART controllers
   using SCMI power and performance domains via scmi11
 - UFS host controller with SCMI power domain via scmi3

Also introduce scmi-common.dtsi providing the firmware-level SCMI
channel nodes shared across SCMI based SoCs.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi |  937 ++++++++++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi  | 1918 ++++++++++++++++++++
 2 files changed, 2855 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi b/arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
new file mode 100644
index 000000000000..343de7512928
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
@@ -0,0 +1,937 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "nord.dtsi"
+#include "scmi-common.dtsi"
+
+&i2c0 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c1 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c2 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c3 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c4 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c5 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c7 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c8 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c9 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 9>,
+			<&scmi11_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c10 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 10>,
+			<&scmi11_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c11 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c12 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c13 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c14 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c15 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c16 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c17 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c18 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c19 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c20 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&qupv3_0 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_1 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_2 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&reserved_memory {
+	shmem0: scmi-shmem@d7600000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7600000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem1: scmi-shmem@d7601000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7601000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem2: scmi-shmem@d7602000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7602000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem3: scmi-shmem@d7603000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7603000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem4: scmi-shmem@d7604000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7604000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem5: scmi-shmem@d7605000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7605000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem6: scmi-shmem@d7606000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7606000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem7: scmi-shmem@d7607000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7607000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem8: scmi-shmem@d7608000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7608000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem9: scmi-shmem@d7609000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7609000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem10: scmi-shmem@d760a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem11: scmi-shmem@d760b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem12: scmi-shmem@d760c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem13: scmi-shmem@d760d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem14: scmi-shmem@d760e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem15: scmi-shmem@d760f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem16: scmi-shmem@d7610000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7610000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem17: scmi-shmem@d7611000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7611000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem18: scmi-shmem@d7612000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7612000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem19: scmi-shmem@d7613000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7613000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem20: scmi-shmem@d7614000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7614000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem21: scmi-shmem@d7615000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7615000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem22: scmi-shmem@d7616000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7616000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem23: scmi-shmem@d7617000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7617000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem24: scmi-shmem@d7618000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7618000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem25: scmi-shmem@d7619000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7619000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem26: scmi-shmem@d761a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem27: scmi-shmem@d761b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem28: scmi-shmem@d761c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem29: scmi-shmem@d761d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem30: scmi-shmem@d761e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem31: scmi-shmem@d761f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem32: scmi-shmem@d7620000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7620000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem33: scmi-shmem@d7621000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7621000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem34: scmi-shmem@d7622000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7622000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem35: scmi-shmem@d7623000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7623000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem36: scmi-shmem@d7624000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7624000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem37: scmi-shmem@d7625000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7625000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem38: scmi-shmem@d7626000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7626000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem39: scmi-shmem@d7627000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7627000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem40: scmi-shmem@d7628000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7628000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem41: scmi-shmem@d7629000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7629000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem42: scmi-shmem@d762a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem43: scmi-shmem@d762b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem44: scmi-shmem@d762c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem45: scmi-shmem@d762d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem46: scmi-shmem@d762e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem47: scmi-shmem@d762f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem48: scmi-shmem@d7630000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7630000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem49: scmi-shmem@d7631000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7631000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem50: scmi-shmem@d7632000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7632000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem51: scmi-shmem@d7633000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7633000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem52: scmi-shmem@d7634000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7634000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem53: scmi-shmem@d7635000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7635000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem54: scmi-shmem@d7636000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7636000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem55: scmi-shmem@d7637000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7637000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem56: scmi-shmem@d7638000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7638000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem57: scmi-shmem@d7639000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7639000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem58: scmi-shmem@d763a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem59: scmi-shmem@d763b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem60: scmi-shmem@d763c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem61: scmi-shmem@d763d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem62: scmi-shmem@d763e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem63: scmi-shmem@d763f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763f000 0x0 0x1000>;
+		no-map;
+	};
+};
+
+&spi0 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi1 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi2 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi3 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi4 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi5 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi7 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi8 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi11 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi12 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi13 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi14 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi15 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi16 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi17 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi18 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi19 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi20 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart0 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart1 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart2 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart3 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart4 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart5 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart7 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart8 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart9 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 9>,
+			<&scmi11_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart10 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 10>,
+			<&scmi11_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart11 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart12 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart13 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart14 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart15 {
+	compatible = "qcom,sa8797p-geni-debug-uart",
+		     "qcom,sa8255p-geni-debug-uart";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart16 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart17 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart18 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart19 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart20 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&ufs_mem_hc {
+	compatible = "qcom,sa8797p-ufshc",
+		     "qcom,sa8255p-ufshc";
+	reg = <0x0 0x01d44000 0x0 0x3000>;
+	power-domains = <&scmi3_pd 0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
new file mode 100644
index 000000000000..0c7ffe9e415c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
@@ -0,0 +1,1918 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&firmware {
+	scmi0: scmi-0 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem0>;
+		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi0_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi1: scmi-1 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem1>;
+		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi1_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi2: scmi-2 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem2>;
+		interrupts = <GIC_SPI 965 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi2_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi3: scmi-3 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem3>;
+		interrupts = <GIC_SPI 966 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi3_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi4: scmi-4 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem4>;
+		interrupts = <GIC_SPI 967 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi4_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi5: scmi-5 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem5>;
+		interrupts = <GIC_SPI 968 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi5_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi6: scmi-6 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem6>;
+		interrupts = <GIC_SPI 969 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi6_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi7: scmi-7 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem7>;
+		interrupts = <GIC_SPI 970 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi7_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi8: scmi-8 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem8>;
+		interrupts = <GIC_SPI 971 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi8_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi9: scmi-9 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem9>;
+		interrupts = <GIC_SPI 972 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi9_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi10: scmi-10 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem10>;
+		interrupts = <GIC_SPI 973 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi10_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi11: scmi-11 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem11>;
+		interrupts = <GIC_SPI 974 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi11_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi12: scmi-12 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem12>;
+		interrupts = <GIC_SPI 975 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi12_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi13: scmi-13 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem13>;
+		interrupts = <GIC_SPI 976 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi13_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi14: scmi-14 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem14>;
+		interrupts = <GIC_SPI 977 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi14_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi15: scmi-15 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem15>;
+		interrupts = <GIC_SPI 978 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi15_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi16: scmi-16 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem16>;
+		interrupts = <GIC_SPI 979 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi16_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi17: scmi-17 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem17>;
+		interrupts = <GIC_SPI 980 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi17_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi18: scmi-18 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem18>;
+		interrupts = <GIC_SPI 981 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi18_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi19: scmi-19 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem19>;
+		interrupts = <GIC_SPI 982 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi19_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi20: scmi-20 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem20>;
+		interrupts = <GIC_SPI 983 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi20_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi21: scmi-21 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem21>;
+		interrupts = <GIC_SPI 984 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi21_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi22: scmi-22 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem22>;
+		interrupts = <GIC_SPI 985 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi22_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi23: scmi-23 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem23>;
+		interrupts = <GIC_SPI 986 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi23_sensor: protocol@15 {
+			reg = <0x15>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	scmi24: scmi-24 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem24>;
+		interrupts = <GIC_SPI 987 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi24_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi25: scmi-25 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem25>;
+		interrupts = <GIC_ESPI 0 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi25_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi26: scmi-26 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem26>;
+		interrupts = <GIC_ESPI 1 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi26_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi27: scmi-27 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem27>;
+		interrupts = <GIC_ESPI 2 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi27_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi28: scmi-28 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem28>;
+		interrupts = <GIC_ESPI 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi28_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi29: scmi-29 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem29>;
+		interrupts = <GIC_ESPI 4 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi29_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi30: scmi-30 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem30>;
+		interrupts = <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi30_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi31: scmi-31 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem31>;
+		interrupts = <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi31_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi32: scmi-32 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem32>;
+		interrupts = <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi32_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi33: scmi-33 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem33>;
+		interrupts = <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi33_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi34: scmi-34 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem34>;
+		interrupts = <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi34_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi35: scmi-35 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem35>;
+		interrupts = <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi35_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi36: scmi-36 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem36>;
+		interrupts = <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi36_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi37: scmi-37 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem37>;
+		interrupts = <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi37_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi38: scmi-38 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem38>;
+		interrupts = <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi38_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi39: scmi-39 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem39>;
+		interrupts = <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi39_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi40: scmi-40 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem40>;
+		interrupts = <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi40_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi41: scmi-41 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem41>;
+		interrupts = <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi41_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi42: scmi-42 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem42>;
+		interrupts = <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi42_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi43: scmi-43 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem43>;
+		interrupts = <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi43_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi44: scmi-44 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem44>;
+		interrupts = <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi44_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi45: scmi-45 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem45>;
+		interrupts = <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi45_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi46: scmi-46 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem46>;
+		interrupts = <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi46_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi47: scmi-47 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem47>;
+		interrupts = <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi47_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi48: scmi-48 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem48>;
+		interrupts = <GIC_ESPI 23 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi48_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi49: scmi-49 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem49>;
+		interrupts = <GIC_ESPI 24 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi49_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi50: scmi-50 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem50>;
+		interrupts = <GIC_ESPI 25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi50_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi51: scmi-51 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem51>;
+		interrupts = <GIC_ESPI 26 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi51_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi52: scmi-52 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem52>;
+		interrupts = <GIC_ESPI 27 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi52_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi53: scmi-53 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem53>;
+		interrupts = <GIC_ESPI 28 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi53_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi54: scmi-54 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem54>;
+		interrupts = <GIC_ESPI 29 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi54_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi55: scmi-55 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem55>;
+		interrupts = <GIC_ESPI 30 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi55_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi56: scmi-56 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem56>;
+		interrupts = <GIC_ESPI 31 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi56_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi57: scmi-57 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem57>;
+		interrupts = <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi57_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi58: scmi-58 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem58>;
+		interrupts = <GIC_ESPI 33 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi58_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi59: scmi-59 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem59>;
+		interrupts = <GIC_ESPI 34 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi59_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi60: scmi-60 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem60>;
+		interrupts = <GIC_ESPI 35 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi60_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi61: scmi-61 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem61>;
+		interrupts = <GIC_ESPI 36 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi61_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi62: scmi-62 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem62>;
+		interrupts = <GIC_ESPI 37 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi62_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi63: scmi-63 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem63>;
+		interrupts = <GIC_ESPI 38 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi63_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+};
-- 
2.43.0


