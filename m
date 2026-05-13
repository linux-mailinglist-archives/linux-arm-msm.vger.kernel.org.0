Return-Path: <linux-arm-msm+bounces-107324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNS9DwqFBGrNLAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:04:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3003534A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CA1D32BCFCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBCE318EC1;
	Wed, 13 May 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvRG5Iie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoPrieCY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050531716B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679677; cv=none; b=izNAg5jMHGl1UMnv0xboaBH4mtJXx0DsxvgX8Ush6FLXScnopFPwCFtpHzMOa+jRPG24i7q5tOeg3v3skgo0PUytvNB2tEeGk0yNifb696ePrL7EYgAA0jKxaLY7mnptaG799rxdrbgH9zTrHypWv+GwdfFZWtUi6c2yHT8LSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679677; c=relaxed/simple;
	bh=9rF43k2zMPd9WATerVVb9Ehr4AYOhbAk78Qd3/Ertao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBveAWEEAbxpPBvn3heisYcm/SXdAN7oEdKpc1ClVJZCfaROffX1iz0VPuwXsCZvbeKpqO6JAq+2RjDDlkwEajtZ53qH8mlGHpG6th+r3VC0gIzj/hE8uEZpCr+CbJScPrsUFtZwLfA5G61BUDupgsP93Jafa/JHBSRTVA0y0g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvRG5Iie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoPrieCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8n9xo2887823
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4nrkedjivCiEtt89u5mD2pl0qirqsC9olzW5SexYDs=; b=gvRG5IieTyhh72Rb
	mRty7XK/JIOmzRyFJQIW96j+UGgWzQfFQYw5KWwcGOG7tUk8Q69Rg5ee4b/Li71g
	KtrWbG6Fb6c6ktGsnD6/6y98P88UrcbOCMe+j09xImd/CFnWzVHa/9gGhKzHwMGM
	6DvbSvEQ1bPKzR2V/wmjWvtLBg+EkOZtH4I3AIE2TPP08Iz6afWsj0Jg3kVUbuuU
	+I+CN1DnLOdVjM3FKSxRmbFM9fHsSgjuA/EtA3YGh8pV3/hjwBqWfrcAC0ygs0xm
	ngnHtXUzbIKDLRCVaF2k8Low+TQcer9WIMZ3bA9IXdpA6E9niNu/eiRmpzcRUgiG
	2zDWzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gh2fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:41:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so8162269a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679674; x=1779284474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4nrkedjivCiEtt89u5mD2pl0qirqsC9olzW5SexYDs=;
        b=YoPrieCYN54lc1preC4O9IrSKT2pRccurQ+LLufNCGa+SDoOaTJe7WgHuXGJh68q75
         ML6CTvaZ6aQitjzQ5qToco+Mv4e/B4wDUxdNk8wXTgIO5k8Y02vGZsBMbh9wdcv2PM3f
         ekN4YijkGy9FQVOG4XZhp/sk6u4dM6Bcu8fojY9mXYK11EBs/CCxtns/v7BgqIG22FL/
         nNITC2hCYgJjRLnaJV9qtB173EGCapO8j/G5POelz4PCzcSIZ5Ut8AuOclBk+NVgb/C9
         iprxpZfc1+8LAN4HZzzHMOHEliYEumAfPx+dGfXCgzobUUtacaopExTi3XnXItPVpmau
         8JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679674; x=1779284474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S4nrkedjivCiEtt89u5mD2pl0qirqsC9olzW5SexYDs=;
        b=JyAsPwmYEliCYwFNgJ1Wif1yQyIYU83Fx5vXw5dCaF8HmXMouzwmMtD0wjOEVz4y2/
         HFawRSDWdzpRpcdM4Fa4IHe0RAWOm+WCqcSbMm6r5D72SkVQJGpiFAa4A2Us7mbbO9U4
         LNl++nOAtz+Zb5luXun0f7pLpVGIzuo73sy/Li2lhDIFbW7Fn31VGs/q9gNPLvba6N/I
         FQF9nose9dRQPnwXbWzMvr/1M8i29WxoyrexWmeY6pgucWGDLQ/cPMIVD+uCfV8zp/M8
         tUSST6vBMZC5WArfd9MD/+IEmItLHMRl0+69aA4AzBs5vVOs458k5tDjCcJIUELw7cGw
         GNMg==
X-Forwarded-Encrypted: i=1; AFNElJ8inTboScLTegwh2bDQiC+J+wygH/MAEqPVWoCgkbAalSJHzQZaOB4u1XfTYl2G7AvD+5r1hHklq6ckBLk8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+xNTdme7U8wMDKzTyxC0j3+/S4/gBKBaYaScmti2BgRQOG1c
	XszUP6hSiI2WRfiZ6RZBg0mS8IeDMPqoY2y+v32lqHQQlqmyBdpzOd/OBMIcWYcydhcjaGGaMZi
	BL8a+AL9c244U7I5RuEP3KES0AndYMBBKU3bkom97eMpGtg0Oi5NGusoG9nyXdHBjFRW6
X-Gm-Gg: Acq92OEBoal/BXA7aNKCzWEh3uWF6MFEhz3oLuarB3ipOo7KkGamnM64uB+m0wtRWNX
	uLvFweOg6Uiy8eAitxdC3sGNlBAzMjOQUpn6OjEMZqu6an/NHU/Ii6QQKBY9r0j3wvbnBi8y0z6
	Ork/gswbCXWmNhMZx9/j7Gbw3RrnTptcHRZ+9gmHlArxjz1Rr233KAiTX/dWWRaMRud0uTSLl6w
	vM1nz70tzT2yTYVX1JTPjdVu7y0NCKg70mcYEhiqCes22H6VbFTmCcdkg0wUdbJlJ/w2T2z0N0r
	h3p2IRRnqAu5kq49f651NwmHCiNgdX3EnJc2stmCvo78/Q/RYbRVBsZV8hQE7JwR5pyhpMBNJxJ
	oX/k0Y+GdcIK+hWvkYJdZsR9DfRU6gQPmT9wOjWwl33JQ3phhQ2ba
X-Received: by 2002:a17:90b:3951:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-368f40824a8mr3985932a91.24.1778679673654;
        Wed, 13 May 2026 06:41:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3951:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-368f40824a8mr3985799a91.24.1778679671746;
        Wed, 13 May 2026 06:41:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:41:11 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:10:39 +0530
Subject: [PATCH 4/4] clk: qcom: Add support for GPU Clock Controller on
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-shikra-dispcc-gpucc-v1-4-5fd673146ab2@oss.qualcomm.com>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: JbUAx80AZnv4-FIiZDlZcnHYT7iIukMn
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a047f7a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Sldbi_rnNfayo5p1r4wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JbUAx80AZnv4-FIiZDlZcnHYT7iIukMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfXwFHhrRR1Gk74
 2Pe+8mYDhOtmDFSosTKNwz1DkXxx3PPqALePgmdE2+xrqnAgYAQvwKvxOo32M2bFcV/WmscnrMS
 ttUclaRtM8U9oBuZKyt4my8ehDV9HE23EZZIQtr5gg/B+zWSdpdYoFg6xqyqIYazsqx7Jy6xAbb
 s1vE/5kcxbaCgP8lV6QaKrjELYwibaaEqqTFFfX67wV4wS4L1OMiLImGS8i+DDvL24M/Y9vH2wK
 rwbUCjJQEOjHsTQlepSItf1Xj16N1JShEiRFe1dQFosESW6prJsGVTpYpKJuTsIwKsVoyihivxh
 ictWg7RpfX6ILpx8ZvZAv6l7nROrcs89MQmWnUlo1NF94G6Me/14nZDhkzsYWHtPW1j9fBKKtF/
 qZ3iD8TSB/uGQmmp2ZU9Zi8Sx27sG07uiUOnL1Z0MlfFAx3kZIYyzHcaRt8JpIyPN1mCn7008Ur
 v1FoPafzoq7ay9mczng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141
X-Rspamd-Queue-Id: E3003534A7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107324-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a driver for the GPU clock controller on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  10 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-shikra.c | 406 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 417 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 78efe494aaeaeefa9da917c47960cfec18259af7..a12cef1c4540078575e4baa2395c0d058303a8eb 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -175,6 +175,16 @@ config CLK_SHIKRA_GCC
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as Camera, Video, UART, SPI, I2C, USB, SD/eMMC etc.
 
+config CLK_SHIKRA_GPUCC
+	tristate "Shikra Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_SHIKRA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controller on Qualcomm Shikra SoCs.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ec4e79614348a23089454b5a20c3dc0abbaa0350..12eaa5b02e45c20392d9494a5681f45d0deb43dd 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_SHIKRA_DISPCC) += dispcc-shikra.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
+obj-$(CONFIG_CLK_SHIKRA_GPUCC) += gpucc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/gpucc-shikra.c b/drivers/clk/qcom/gpucc-shikra.c
new file mode 100644
index 0000000000000000000000000000000000000000..1ff61a51cbad10602c3f1a6fa18ca03acd394e31
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-shikra.c
@@ -0,0 +1,406 @@
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
+#include <dt-bindings/clock/qcom,shikra-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_2X_DIV_CLK_SRC,
+	P_GPU_CC_PLL0_OUT_AUX,
+	P_GPU_CC_PLL0_OUT_AUX2,
+	P_GPU_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco huayra_vco[] = {
+	{ 600000000, 3300000000, 0 },
+	{ 600000000, 2200000000, 1 },
+};
+
+/* 710.4 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x25,
+	.alpha = 0x0,
+	.config_ctl_val = 0x200d4828,
+	.config_ctl_hi_val = 0x6,
+	.config_ctl_hi1_val = 0x00000000,
+	.test_ctl_val = 0x1c000000,
+	.test_ctl_hi_val = 0x00004000,
+	.test_ctl_hi1_val = 0x00000000,
+	.user_ctl_val = 0xf,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = huayra_vco,
+	.num_vco = ARRAY_SIZE(huayra_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_huayra_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_2X_DIV_CLK_SRC, 1 },
+	{ P_GPU_CC_PLL0_OUT_AUX2, 2 },
+	{ P_GPU_CC_PLL0_OUT_AUX, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x1120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
+	.cmd_rcgr = 0x101c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gx_gfx3d_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x107c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x107c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_crc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gfx3d_clk = {
+	.halt_reg = 0x10a4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gfx3d_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gfx3d_slv_clk = {
+	.halt_reg = 0x10a8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gfx3d_slv_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x1098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
+	.halt_reg = 0x108c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x108c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_snoc_dvm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x109c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x109c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x5000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gfx3d_clk = {
+	.halt_reg = 0x1054,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gfx3d_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x1090,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x106c,
+	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gpu_cc_gx_gdsc = {
+	.gdscr = 0x100c,
+	.clamp_io_ctrl = 0x1508,
+	.resets = (unsigned int []){ GPU_CC_GX_BCR },
+	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "gpu_cc_gx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
+};
+
+static struct clk_regmap *gpu_cc_shikra_clocks[] = {
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
+	[GPU_CC_CX_GFX3D_SLV_CLK] = &gpu_cc_cx_gfx3d_slv_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GPU_SMMU_VOTE_CLK] = &gpu_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
+	[GPU_CC_GX_GFX3D_CLK_SRC] = &gpu_cc_gx_gfx3d_clk_src.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+};
+
+static struct gdsc *gpu_cc_shikra_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+	[GPU_CC_GX_GDSC] = &gpu_cc_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_shikra_resets[] = {
+	[GPU_CC_CX_BCR] = { 0x1068 },
+	[GPU_CC_GFX3D_AON_BCR] = { 0x10a0 },
+	[GPU_CC_GMU_BCR] = { 0x111c },
+	[GPU_CC_GX_BCR] = { 0x1008 },
+	[GPU_CC_XO_BCR] = { 0x1000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_shikra_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_shikra_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
+	0x1004, /* GPU_CC_CXO_AON_CLK */
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
+static const struct regmap_config gpu_cc_shikra_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x7008,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data gpu_cc_shikra_driver_data = {
+	.alpha_plls = gpu_cc_shikra_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_shikra_plls),
+	.clk_cbcrs = gpu_cc_shikra_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_shikra_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_shikra_desc = {
+	.config = &gpu_cc_shikra_regmap_config,
+	.clks = gpu_cc_shikra_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_shikra_clocks),
+	.resets = gpu_cc_shikra_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_shikra_resets),
+	.gdscs = gpu_cc_shikra_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_shikra_gdscs),
+	.driver_data = &gpu_cc_shikra_driver_data,
+};
+
+static const struct of_device_id gpu_cc_shikra_match_table[] = {
+	{ .compatible = "qcom,shikra-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_shikra_match_table);
+
+static int gpu_cc_shikra_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_shikra_desc);
+}
+
+static struct platform_driver gpu_cc_shikra_driver = {
+	.probe = gpu_cc_shikra_probe,
+	.driver = {
+		.name = "gpucc-shikra",
+		.of_match_table = gpu_cc_shikra_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_shikra_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC Shikra Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


