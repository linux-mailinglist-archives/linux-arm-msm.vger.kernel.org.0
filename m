Return-Path: <linux-arm-msm+bounces-100939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFjyKFJby2lJGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:27:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F153641A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF0033082A5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 05:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAB636EABD;
	Tue, 31 Mar 2026 05:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3P1Wi8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLEspBnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9B36215B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934698; cv=none; b=t1zTlEulirhfY6Y3mmMtj50112uG0PKGJbcqdELFVqE3hFt/cTP3a1yo9iict6lUujlmLjL9hSAKTdYiCwH0mvZFwrfoNJcc1TbCL/qqQT9MtPqNqJ2GzsQ/zHNFM0uO3p9FAmWKX2+ao1NHgImopiwDiqdX9QtkZC46l8TUl4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934698; c=relaxed/simple;
	bh=PxHF1bewvUHGmm+Vl+yr/gc5MteATxEgqqnHG+cAveg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZH6q3MD4QUwwoPdb6FS33gGQB11YhXWGu55rib1ZzdsqspT7kRnGLKTPE41fPKo27dBCoa+3lwzZGNnrx2A1yAytxNobHXVTwGr1Khk+xp0I0bRFepDTz/zV6/Bm/nwAjAQSCAiRVGTt90Bs2AOLiiaC5Fdh2Fq5LBiZGb+XqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3P1Wi8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLEspBnW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UL48861842388
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwwdcGUFGZ6O+KgMKzeP7gtGYmrhUcxeEoLx0KJzLKg=; b=T3P1Wi8zfJ3WZFtd
	JouAZryrCclwQols1gxrt0xaxU0epjBR2YNBakW69wgidgr1bIfZgSd3aGpL6coV
	Rxic33v5ZR7g0kq2yxDp7ZPqHNtdjO673rfpCtTsH0GSp8dr3zwNwuEUhWw7sEAg
	iOhkI2Q9FBQXpwcDMFHuabLT28VF9NTTe3DuWXu4qO1PGnGqSHwPnJcVIIZn0DkS
	WrYJXX4kne06AnrdbV1/EKm3lLE2osJVhB0U6+6A1eaeYWacgdHBzgrtAHAQ1m6J
	t+5wR10lsa0q7Wj4w8PQDlOnsyf9srMHQ/a1r0F8AeopfYqC1LAxOcaXmczRSQ65
	gUDJsg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rshcp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:24:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7414179cceso3482650a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 22:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934694; x=1775539494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwwdcGUFGZ6O+KgMKzeP7gtGYmrhUcxeEoLx0KJzLKg=;
        b=fLEspBnWxDv7lm3koG8d2QS/QGW8ZgsIVY/b287JpFvSwb3pVE9/Tji4xXTIf380cA
         LybNq1iaPVGdp3H8zwLd96+r28KAs3DbnRpGm1niqlSaZ/TA6myjhzd2bsWCxLPRtt2f
         rChu0kwgYLA2aUKRkRnjtrU5SfYr4d6b1g97RtHLsee8qyh5mSBLAH3w8audaNNcLInd
         pt0xm4SIEadmyROGr5KtXHULZOLrchGoz/gpEmmhx6AI3TKAE8JZeCpGxKqcJDnOkINF
         jAMKd2EWs+tyQ7b74IV4Lv1OrJfZV7JdSoUzphbIMdQsr4k/rU4oyHzkgNUwJJu7A04/
         bL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934694; x=1775539494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwwdcGUFGZ6O+KgMKzeP7gtGYmrhUcxeEoLx0KJzLKg=;
        b=BNR/NWFAbMVG0Iy7vnz0td6rdYLlpW3+3AxHWQvLXeeLE2IIsaih13EcpE8A/MqO7/
         S6Q7DIIlWul379L3c0b1v7Xu53FQ2GtmKTK76NDFQ0cyDOeBNTy95OMDH/u/UYjFzGdn
         OfVMyC2XYML4sAdxoKz9H1kjm0IRScZjKFKTAUjWJXkBL+yBeMQnsR7AThJU9ytm2Txf
         AaFBZo/tE1LWIksvtFFcNLYu8wc2t1iMD3k2B+Br3HyVuL0r7tMRKrkZN9hw/BU+OWyE
         PQgB2Y+DrLJOpT60J3RqasSXCzHXK9BaEk61PYIb2C2Y/LPrDpUcqZAscqNu5zOkXsNm
         WGtw==
X-Forwarded-Encrypted: i=1; AJvYcCV/ikKh8pI0kfEMfTcoq1JDp6r0cu2be6kvtJ56/NuQGo9vhyjdCEC/WxP29Hjj17rHiq/BSauVBOElF+kx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5zFPi/4XBOw05xHKs9kry093OwnLc398FiegDZY5/tGmjz77g
	9+YqrnZnXXFnl0v8WO7DowpSyFPPijnhDX7pqi/lyys045/6vUwN2sfzRENIYSsncSQMe1H/Vuw
	s/kQ5ekw0PCfrKlmfl4mRJSGd/L30DLTsSGSPI3pI+ZaKgcJp7ndQKXyPJvJ6r3mjX72ClO8AZq
	PP
X-Gm-Gg: ATEYQzyAhq5IiloYje62JUGSxNkRZW6ADpD+V3B/Rsb7eY72+BtjkZx2bfUfCZEZ0xh
	KHzwGYiBxnJ/VBYt5MrJeA5kVtQp/pB1iSsLKVGJ7O2sBxILds2PS7346fWjedwD0NhwoSQii7P
	xz8kY5tjYDU0ejBENp0nnY4TjYpCfbtpV7rGrXyGfvIj/ojVUoTMaunUCyqoh7FcxvJCkYl7eWc
	m9RFh4VeZg/72DFGJj1KnLTxdZTlU3szKI3keVrn0Y7ZluzVrsAjvvi58NKcsaQImPOsMjhmwwC
	Uy++F+cheqgDNmwWtc0zCZs/CymtCu7tKYeigAw+JKRneu0U6holysqPAnSv0Sltk1VyF/G6nor
	t+IriS5RKeDzw3yhTIvwaBkfGtrezaN7pbK3/YIwpTwi0CbksiDER
X-Received: by 2002:a05:6a00:c82:b0:82c:249d:d84f with SMTP id d2e1a72fcca58-82c96031848mr15209222b3a.37.1774934694183;
        Mon, 30 Mar 2026 22:24:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:c82:b0:82c:249d:d84f with SMTP id d2e1a72fcca58-82c96031848mr15209181b3a.37.1774934693582;
        Mon, 30 Mar 2026 22:24:53 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:53 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:12 +0530
Subject: [PATCH v3 3/7] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-3-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: jfMWcXfMlqWw3wQweqYvGNhAVkDcD8FI
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb5aa7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RKjULyPvNO9injS1lHcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: jfMWcXfMlqWw3wQweqYvGNhAVkDcD8FI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfX0YE+8egLleua
 /QsZORfpCG2xRBLulg/bNS4yBlaTr7+N2tQUilZYpz7v4vG8W1ZXvtnEYXQwB+e7mgbVAgzw9gX
 kA4JO3hM/+xqaJtlJ4H5jdwKsDtfJQSRcuTP5Pi3Y5EAnoaaaUXKmk88zIWzaS4zFdFPtGRXZIW
 gpYTmiLWEoYnWJQBAKooEBX8xNk2+VcE8zjoD+iAmc/X22KmCkBtlCDrF+l/6Yw8X4KMaK6MHUm
 1aqumg7D4Q5vCTkKdqGUerp5GlThyoWrBAKdZysanS3GIdOVhZ9JjXu9rUph7dFyqJG5XJ9OfY3
 cdVCvzFpT0ZNmgCtXv2QmDaux61N/AzPRdIi32Uqe04PbxItffitdtzweSy80YodKViuQbQrxIn
 o1WRjc2lftzxURI56HjzByTiqO8Hb7nuWvIWYEjB6ChaJCaUk27ivRpLHBfuT6usDmcOoV0qinA
 dIXlv6IqPA9kJWjJ23g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100939-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17F153641A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the video clock controller for video clients to be
able to request for videocc clocks on X1P42100 platform. Although
X1P42100 is derived from X1E80100, the video clock controller differs
significantly. The BSE clocks are newly added, several cdiv clocks have
been removed, and most RCG frequency tables have been updated. Initial
PLL configurations also require changes, hence introduce a separate
videocc driver for X1P42100 platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |  10 +
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
 3 files changed, 596 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8f55f10261ec2dd4add61101c5619cc4516f7d66..920d5e78e57d1ac62b59eb1c39d1f79c0718abb8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -199,6 +199,16 @@ config CLK_X1P42100_GPUCC
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config CLK_X1P42100_VIDEOCC
+	tristate "X1P42100 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_X1E80100_GCC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  X1P42100 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 103d6c4b860ccbc6b4ad552e9e6af43298a4474d..ae1f3207a20be4c9163a6f7ce9f309f36e80fc6f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
 obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
+obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
 obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
 obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_APSS_5424) += apss-ipq5424.o
diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
new file mode 100644
index 0000000000000000000000000000000000000000..2bb40ac6fcc57e817ce8f0b6727a571c7c072ffa
--- /dev/null
+++ b/drivers/clk/qcom/videocc-x1p42100.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 420.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x15,
+	.alpha = 0xe000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1050.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x36,
+	.alpha = 0xb000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_bse_clk_src[] = {
+	F(420000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(670000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(848000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(920000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_bse_clk_src = {
+	.cmd_rcgr = 0x8154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_bse_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(210000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(300000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(335000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(424000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(460000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
+	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs1_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x810c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_xo_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_bse_div4_div_clk_src = {
+	.reg = 0x817c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_div4_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_bse_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80ec,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_bse_clk = {
+	.halt_reg = 0x8170,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8170,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_bse_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_bse_div4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8128,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8128,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x812c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x812c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0x80e0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80e0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_shift_clk = {
+	.halt_reg = 0x8130,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_shift_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x804c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1c_gdsc = {
+	.gdscr = 0x8078,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80cc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs1c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_x1p42100_clocks[] = {
+	[VIDEO_CC_MVS0_BSE_CLK] = &video_cc_mvs0_bse_clk.clkr,
+	[VIDEO_CC_MVS0_BSE_CLK_SRC] = &video_cc_mvs0_bse_clk_src.clkr,
+	[VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC] = &video_cc_mvs0_bse_div4_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_x1p42100_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_x1p42100_resets[] = {
+	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
+	[CVP_VIDEO_CC_MVS0_BCR] = { 0x80a0 },
+	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
+	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
+	[VIDEO_CC_MVS0_BSE_BCR] = { 0x816c },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static u32 video_cc_x1p42100_critical_cbcrs[] = {
+	0x80f4, /* VIDEO_CC_AHB_CLK */
+	0x8150, /* VIDEO_CC_SLEEP_CLK */
+	0x8124, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_x1p42100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f54,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
+	.alpha_plls = video_cc_x1p42100_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
+	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_x1p42100_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_x1p42100_desc = {
+	.config = &video_cc_x1p42100_regmap_config,
+	.clks = video_cc_x1p42100_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_x1p42100_clocks),
+	.resets = video_cc_x1p42100_resets,
+	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
+	.gdscs = video_cc_x1p42100_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_x1p42100_driver_data,
+};
+
+static const struct of_device_id video_cc_x1p42100_match_table[] = {
+	{ .compatible = "qcom,x1p42100-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_x1p42100_match_table);
+
+static int video_cc_x1p42100_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_x1p42100_desc);
+}
+
+static struct platform_driver video_cc_x1p42100_driver = {
+	.probe = video_cc_x1p42100_probe,
+	.driver = {
+		.name = "videocc-x1p42100",
+		.of_match_table = video_cc_x1p42100_match_table,
+	},
+};
+
+module_platform_driver(video_cc_x1p42100_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


