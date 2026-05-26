Return-Path: <linux-arm-msm+bounces-109721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABxrHiYwFWr9TQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:31:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E05D0DAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAF783038F53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D64B3BFAD1;
	Tue, 26 May 2026 05:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RI+5ZFN9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4IHm8mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997E53BF68D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773416; cv=none; b=fx/o9n0X7NihKURrxGhTsfsXLrieC6Qs0GfLfzU0fXegwkucLS0Nfrgi37okMjNfHI4lL9p1cbC/8i1L2U+lhN8/QmvnnjKihtiFNo2y7HgVsyzj9nJW+WWlwQ4t02WCIFmu+x6oFqKstj9sIJk/uMvUcZODZaTbWavnbhU9nkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773416; c=relaxed/simple;
	bh=EsykYP1Jja2PGrm/SHMUfj7wtmFa2AJoES1XGFBJuFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WN8Lo4UPVbpN+nW/+joxhH+HH502uo9aQPrXVrmnIuVsSuILZLvMqTxgmONDLx46EPcPwut/ctTgc+6csSNt/HzDd02b0U33uRgPJh6LA3by9w1C5v0tcHjLh/lgJro27POwGOWqYLgh47myyevdmC3S2GRTngBNrIauEde/vp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RI+5ZFN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4IHm8mo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2hxCX2822461
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orVzd13TwIlSust0JWdYpFBNaQGddocIUX1NfZDoiRI=; b=RI+5ZFN9JDbtv+l2
	fQ6HGkDqd/Cqbv9X4nYqXvkmlsQws65kbQS9UKgi4rxnEwpzR7gra168GrbtzccN
	yqYPAqRKUkdV+D60/cvB8wP+G9NdCPRtF1smnwu6Scwt5wmw1x+5HshIaXxkveYN
	jLjkIin5LuTYj2Xn4cw2vDlmG7l3JNTfQhOnxqZ27AkWdGJ1I0HwsFA/p+quLx8Z
	OGpuH8fc0K+0OOq2DxTpoO5Yw2mpk6cz14c9a26T79k8eqCkh/bENtOgd5yOFqIQ
	+B8XYzWULW5OIRFO42J+eO6BxlW3uleUw7cc86xr6V1Jph4ueC5wEhG5BRBOjM4I
	VnJJ6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwt5sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba054e0304so89764535ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773412; x=1780378212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orVzd13TwIlSust0JWdYpFBNaQGddocIUX1NfZDoiRI=;
        b=H4IHm8mo7y5V10pQR8HdOt5QglmK+xS+VPSUw9uaMgk9itMM6uinQQi1uRy1rmO2L2
         0t7yjZFWwhIbIB+4Q7yoXlMcRpAB6j9si6djvc3mAmYJG3WHDvH6oS2pIakbHNvs7oUH
         IHfheZMhLPmDmzgvHD89xzLIqNAi6VAwnsCH+TAPp69vOTGo4dSbykIDjqqek7UqvmKe
         da6riSeQ6yzQDcgWmki9k6L6yGWwhkR/NruLZBsjJIKNVLi0noBBgkuj6BvtFPVHY0X1
         qFbDznPm2SGJDqjWSln18yxEdA/zPLCZvpodSERhnQB2CZ09F5dewOQ2EQniWqzJ2W1o
         uySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773412; x=1780378212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=orVzd13TwIlSust0JWdYpFBNaQGddocIUX1NfZDoiRI=;
        b=P7s1jQoRr5bsV11WzrjpGnlRIcnFHAHnSnUt+/5y8Km5P8UMJrp5BUr7BiDyTYEdR/
         n4JT0AFCjhAIVry9oYaJ4sMxakw7pTUo7X+jfW21Z3/q4vxUYu3xTig8Ojoiqe7BS3BT
         3cwwHS4NpyJKc8pr/kbsweQvQMKsO4JzzSe+SbnDz9yNCtmc6DLt6uHA+IJJRClPqUvd
         rLGmrVoeHJAyxiB6C/dTm4LPoFboJgVXOOEnnU2FypeCo4/xJYg+bVauvFj1xObimXq6
         idDSXrgcup/0+5JByMEjp476FL+suI9sIPbZrLfxJKsR++QU5PnO1BAMOGiRco0zFd19
         MdSg==
X-Forwarded-Encrypted: i=1; AFNElJ+Z53vMCSKD72QCZXM8uZPjXfMAwtZKyALqzNrPd7CqG9CgGrrvKzXaYvp/YX9s1FhkqGV1x64p25d5C6t+@vger.kernel.org
X-Gm-Message-State: AOJu0YxeIcGpdeTfv5Lgln/TkWLz1UrayvSJqQ1mNj4g0nQhMmV2dDKp
	oJHca2zPoDFFQJdsBFexzFPO3o+3cYTcDL531YG9IcmQ/7oUNn+K0en0iHdZgSVI3Jwl+Qe9osj
	fb2dOJJRM5OK6vfTkcNUxgTIgYSb/QoWTUh1QG5OMaAFfiCQXJCR/pMU9MaEQlDxaQt/b
X-Gm-Gg: Acq92OHgc0YQcTBsHdeCy8QLbKsC3IBBLInrtrSsyfUJ9f2OVOdDpRU52ZO2jcF/ZCZ
	nyVI/XQFATGoY5gHme33zDUEhFM5ug5guAC05gFoMSgFED0TRUiHL3DUpwMYEOdwWSonqL90n5i
	6zZUj/V+jAjw3vtsmBydwjTf0AaT4ZYdzH+uUzlwX2FI8WEsiIVzRhVdhiVV4iPpfQiLU3OjM/F
	mSLjggPRnO3yQgkgZTi0BCSy+Sy1nGoXqGphwu5ZOsaw/is1a/Aa41g5w7Izhhh5ugNhUzhpFeJ
	sObp7vq46yL+tUq60+Ne7a1xDEF+ST550DNPoMk69tcz5RReEydNVWdqASdgTb7ZSx4p13DeIsu
	D1mrgVg4FayBQCV6keTeXfuDysBFk11UJ+2oEvqqnS7FmgQ==
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr192487445ad.12.1779773411928;
        Mon, 25 May 2026 22:30:11 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr192486815ad.12.1779773411259;
        Mon, 25 May 2026 22:30:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:46 +0530
Subject: [PATCH 3/4] clk: qcom: Add EVA clock controller driver for Glymur
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: LUxzG1n8f298TfHlrnajC66Jjt5b7i1R
X-Proofpoint-GUID: LUxzG1n8f298TfHlrnajC66Jjt5b7i1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX3gdWeQP7E0DG
 Kn75ZN/pp841P2HxzBWJYsXdO4KSarjjLWNbz6ZnOoNR9w/eUNPmmEIqQ2qPF5lDOIKYWnpIpbD
 3D2OxjbBlisvo3PfEZGwTPamP5+qzvNiU5raxshc5/KFGJ7+s7VKn4nQnoKOC78lM+6dlQHbyl4
 yT+fq5CxqhDTsL91QSSWPQyzdo+WmNRPpCCVPGOFhK8wrhdHYraB1nSEbsWcYvfLl160fN9CQHH
 vh7iqhNWViGswdUgbCIELcpOTMLGYPRaiTG1bYr2niyPMKjZ7Xd1DcqExHAyWFWkID0P/fFKtUd
 ux5GkHIdF3As+o5PNy0JA9QwULspS/LiTkEUACsT1U1vSBbVR/OcrHV4Ol0uH11LRlHXImBoOKJ
 pLBSN/GLF0Y5OLhZmWHDj9QaAX8yawVAzoG33F1DzfhVy2x5lQQqr/3cJ4Am7+nRnFoiuSsUdeU
 rxIzfJWHZKerhci5FqQ==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a152fe4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mU7vPRoAUwN6OPuHNRcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260045
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
	TAGGED_FROM(0.00)[bounces-109721-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE1E05D0DAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Enhanced Video Analytics (EVA) clock controller driver for
the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
and resets for the EVA subsystem which handles vision processing
workloads.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/evacc-glymur.c | 453 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 465 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d8cc373b8ab14683370cb9b7f8bf3..94378d435162799aa866689377e4a9f1e96ab138 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -55,6 +55,17 @@ config CLK_GLYMUR_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config CLK_GLYMUR_EVACC
+	tristate "Glymur EVA Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	select CLK_GLYMUR_GCC
+	help
+	  Support for the Enhanced Video Analytics (EVA) clock controller on
+	  Qualcomm Technologies, Inc. Glymur devices.
+	  Say Y if you want to support EVA devices and functionality such as
+	  vision processing.
+
 config CLK_GLYMUR_GCC
 	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e100cfd6a52de9f88f11720d9c2043db5e553618..74761f2c767d9ce5988fedf539d80dc1393b4617 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
+obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
diff --git a/drivers/clk/qcom/evacc-glymur.c b/drivers/clk/qcom/evacc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..eab43ba922f37067d75645c860ece0ccfb9193b5
--- /dev/null
+++ b/drivers/clk/qcom/evacc-glymur.c
@@ -0,0 +1,453 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
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
+	DT_AHB_CLK,
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_EVA_CC_PLL0_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 840.0 MHz Configuration */
+static const struct alpha_pll_config eva_cc_pll0_config = {
+	.l = 0x2b,
+	.alpha = 0xc000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll eva_cc_pll0 = {
+	.offset = 0x0,
+	.config = &eva_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map eva_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map eva_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_EVA_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &eva_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map eva_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_2[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_eva_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_0,
+	.freq_tbl = ftbl_eva_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_ahb_clk_src",
+			.parent_data = eva_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_eva_cc_mvs0_clk_src[] = {
+	F(840000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1050000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1500000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_1,
+	.freq_tbl = ftbl_eva_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_clk_src",
+			.parent_data = eva_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_eva_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x80e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_2,
+	.freq_tbl = ftbl_eva_cc_sleep_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_sleep_clk_src",
+			.parent_data = eva_cc_parent_data_2,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_2),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 eva_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_0,
+	.freq_tbl = ftbl_eva_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_xo_clk_src",
+			.parent_data = eva_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div eva_cc_mvs0_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "eva_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&eva_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div eva_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "eva_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&eva_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x807c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_freerun_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_shift_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x80dc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80dc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc eva_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "eva_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc eva_cc_mvs0_gdsc = {
+	.gdscr = 0x8068,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "eva_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &eva_cc_mvs0c_gdsc.pd,
+};
+
+static struct clk_regmap *eva_cc_glymur_clocks[] = {
+	[EVA_CC_AHB_CLK_SRC] = &eva_cc_ahb_clk_src.clkr,
+	[EVA_CC_MVS0_CLK] = &eva_cc_mvs0_clk.clkr,
+	[EVA_CC_MVS0_CLK_SRC] = &eva_cc_mvs0_clk_src.clkr,
+	[EVA_CC_MVS0_DIV_CLK_SRC] = &eva_cc_mvs0_div_clk_src.clkr,
+	[EVA_CC_MVS0_FREERUN_CLK] = &eva_cc_mvs0_freerun_clk.clkr,
+	[EVA_CC_MVS0_SHIFT_CLK] = &eva_cc_mvs0_shift_clk.clkr,
+	[EVA_CC_MVS0C_CLK] = &eva_cc_mvs0c_clk.clkr,
+	[EVA_CC_MVS0C_DIV2_DIV_CLK_SRC] = &eva_cc_mvs0c_div2_div_clk_src.clkr,
+	[EVA_CC_MVS0C_FREERUN_CLK] = &eva_cc_mvs0c_freerun_clk.clkr,
+	[EVA_CC_MVS0C_SHIFT_CLK] = &eva_cc_mvs0c_shift_clk.clkr,
+	[EVA_CC_PLL0] = &eva_cc_pll0.clkr,
+	[EVA_CC_SLEEP_CLK_SRC] = &eva_cc_sleep_clk_src.clkr,
+	[EVA_CC_XO_CLK_SRC] = &eva_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *eva_cc_glymur_gdscs[] = {
+	[EVA_CC_MVS0_GDSC] = &eva_cc_mvs0_gdsc,
+	[EVA_CC_MVS0C_GDSC] = &eva_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map eva_cc_glymur_resets[] = {
+	[EVA_CC_INTERFACE_BCR] = { 0x80a0 },
+	[EVA_CC_MVS0_BCR] = { 0x8064 },
+	[EVA_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[EVA_CC_MVS0C_BCR] = { 0x8030 },
+	[EVA_CC_MVS0C_FREERUN_CLK_ARES] = { 0x805c, 2 },
+};
+
+static struct clk_alpha_pll *eva_cc_glymur_plls[] = {
+	&eva_cc_pll0,
+};
+
+static const u32 eva_cc_glymur_critical_cbcrs[] = {
+	0x80a4, /* EVA_CC_AHB_CLK */
+	0x80f8, /* EVA_CC_SLEEP_CLK */
+	0x80d4, /* EVA_CC_XO_CLK */
+};
+
+static const struct regmap_config eva_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Update CTRL_IN register */
+	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
+}
+
+static const struct qcom_cc_driver_data eva_cc_glymur_driver_data = {
+	.alpha_plls = eva_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(eva_cc_glymur_plls),
+	.clk_cbcrs = eva_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(eva_cc_glymur_critical_cbcrs),
+	.clk_regs_configure = clk_glymur_regs_configure,
+};
+
+static const struct qcom_cc_desc eva_cc_glymur_desc = {
+	.config = &eva_cc_glymur_regmap_config,
+	.clks = eva_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(eva_cc_glymur_clocks),
+	.resets = eva_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(eva_cc_glymur_resets),
+	.gdscs = eva_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(eva_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &eva_cc_glymur_driver_data,
+};
+
+static const struct of_device_id eva_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-evacc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, eva_cc_glymur_match_table);
+
+static int eva_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &eva_cc_glymur_desc);
+}
+
+static struct platform_driver eva_cc_glymur_driver = {
+	.probe = eva_cc_glymur_probe,
+	.driver = {
+		.name = "evacc-glymur",
+		.of_match_table = eva_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(eva_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI EVACC Glymur Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


