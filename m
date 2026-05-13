Return-Path: <linux-arm-msm+bounces-107350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF0kN/uKBGoxLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:30:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C97535131
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6D7E30A6420
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426A8425CCD;
	Wed, 13 May 2026 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAbTXuKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdPA43sx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9C642316B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682231; cv=none; b=pxBNLl8earFqK8q0TVSMsUH+qQgAPgBteyg+AFqThhW0XPrUEMmW4pePd9Pxp7C8Yp/D5Gsc1NMT+lfebwrMlZb7IwcID3BOTg/ikKtVcLCB8b1vHyw7iCM3VTdPTORXq8dNB/NfVQIDpJxfwCwAF9dOzzoeG1Ni1EksqBOqnFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682231; c=relaxed/simple;
	bh=GtA85Gj+9Z2SsWdayszxO6mk73yDtusB5izB+PGeW3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+3D924KN2K8dEOryfZmV4dP2qyZ6/Xz7RBwiQMTNRaAkWPrsJLOwQS1a7vGbPK3axRPsXcFBtwuldmqc3EbbI5MKlQDhvKzoP+cLrtnTtW/QB0h+3KKxkEsMj1kpHDrPsPzUlmcIFDtCN59At9GIH41ZTLFSGZx5BsgkLKfz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAbTXuKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdPA43sx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mEtl3474770
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcTv3K4B8XZ/zzd/cS4ooYdW8L+4XSlQ0FXF7J/olM4=; b=XAbTXuKgQzQYTMRM
	aXlTjF5NXpj1jDi6Egl19UnP66SVC4IMn3azAUHLH7ZthpcdYlVYBTb7dQ8hNVtX
	6VHYzZwRd8p4AEFqNRFubsVTx4HZWl//zRzAUsaf9jqeEHotz4Js4HAJlbX5mSVd
	1w9iAiZW/FNIuyJZ76wmDL0KpeKuGFGwiQqYeY6aKA6n6RQwBHcTjvp7HH8m/Cbv
	6yi6ZmUfgCYPEpydz6Lu1aVcRCFocau+31McI0UWikLj3qU5xr8xm/dY6a2c2Kk1
	ehePU6L1D/InLIuomVy72yYC16H/wmPueFbzpeIX7nCq2XtLgRE0+yl6fVUXCMPL
	YuUE0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4198kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b461b36990so72731345ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682227; x=1779287027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcTv3K4B8XZ/zzd/cS4ooYdW8L+4XSlQ0FXF7J/olM4=;
        b=BdPA43sxFUChxGrJIl7kZJ5cHFYQuDttcR0EoP8TlQrfCsT/DdBO6Vcf0wjRe7CWrw
         lvrBWGxWOcTpCClUWfX0ajSPM/Ei8QsdCWrElRZdoZIc8LNiuab56iaoE/+ple8MOBhi
         NK4ADeR+vjG8wYFt9HbVzm5W/YoTAmh4JebFGg+9GjZFNcjpawPk+curgKYYATfkZ/8z
         Et1Fs/Lcj47PmovoDyj47YrellN71N0aJhptEggXhE/ZljKOJqcurxKBmrJhAZJghZhP
         cIM5lkqXelqoKysSI5jFdbzbS5PYfE1Dos+jyiIGCIzDayfMYyo3/U+oDgI4ISAufBal
         rAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682227; x=1779287027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rcTv3K4B8XZ/zzd/cS4ooYdW8L+4XSlQ0FXF7J/olM4=;
        b=CMuu9ZlG7LjkSHnyKqmjnMpqNf2bKIlBEs3TqxhDBEYhhFZESuJ0vMOGgcL9/VS4nq
         5tHd7X16CBjBAdgex9xjfFcKLFpiNeC6FIPxcX/CRNZ17iWiGFGOKHVJaLvRGvkoEl4R
         6ZijASkpLrl0edJSbfI66WPdmpn8W8sL9x74w7U7SENaJmGYW/eSRNej2Zm5R9udjBV2
         kHPew0G65aKMOrUMVkwsLnxMe+j0FedvXgD8UWc/Leln9l9f9jPyNMa5w4gJjExcCTHU
         IGHsIPusu8K+QWqn2SAM70pF//6dm6DQicsmc7eFivQj88Tjf7F2FJuooNPIDfhJvvrZ
         YOdw==
X-Forwarded-Encrypted: i=1; AFNElJ8vM/HulI1W1foO99ClrACR4208o7itIKzWobLWd6ebV39SfqW6itjy/EfzkiaF4Xp8kVpqvKPpTjm/ZxGx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0StTEByATRuwwahJa+bxM4XxhuMjgMTrzFObyxY3QOa0prOr
	1CdiQOSz62wis7gqsgO16B+6fUYtADJD4MPlo91ua8kQ89PHCs1m9busB4etyck51PbgDPW1PGb
	MH5ZDO9sPJiGWpnmca+FZrsfnMROSZbdKNOesahJhttBIXw+9u6ESszcQ4RGvhv9XTrjz
X-Gm-Gg: Acq92OHftPkbg0uS/PHjxW30rCzfprcGFNDW699wsYROhoqS29ouvJosliTT8QCxds7
	UsffiXLoex6H/9Dt5tUyU6QKq3zO6ncxS5SdOnwOci+IJqSEmVcroFPfDd2yrF4kwdR2DIfx/IP
	m+0uz2aHrf+Qf8na0AGpIimspLG3UM/r1YMscgkiOWikXbMDP4kWgCNZkxfentNGn/AUwuaA0wQ
	FnaqWwbHVQUjiUfhgAekpglzAtP30XwWwQqq3hcIviMokz8p3hBHtX6EQ6psBmG2/BuKKo5Ry5T
	5P3lxSbWixgi/xJexvGot1yy+BSB22kB8snXlm/1DZZRBxcTiw1DmI/n0oBv0uysznhr40NFuVb
	OPwtI+7Ic1vw8TmZSE+gBH9RKps8/h9e5FSnpSYrzmQWxJQ==
X-Received: by 2002:a17:903:44ce:b0:2b9:8f51:7398 with SMTP id d9443c01a7336-2bd2711ca2bmr29169895ad.11.1778682226778;
        Wed, 13 May 2026 07:23:46 -0700 (PDT)
X-Received: by 2002:a17:903:44ce:b0:2b9:8f51:7398 with SMTP id d9443c01a7336-2bd2711ca2bmr29169355ad.11.1778682226239;
        Wed, 13 May 2026 07:23:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:09 +0530
Subject: [PATCH v3 4/7] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-4-b59c370dc281@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a048973 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fDr36jkL0Xr7p1dDRlIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX5v+MpHKyZSE4
 gGRA7L/X841LCAg76VweIZwhgtKUSPcCW6FgpTjpvguYyYZEDIwviETdZ7ARR282vPc30zbrgn0
 5rHaYEF0Y80QHfZlPx4Z9ydB7O5C9t2u+UWAjmu4X1K+mK/aAYETZ8RrlVxRMCDXQtr2mkkLWUw
 lfSQEKTb97HB/GdAJtTKFXFEBpdL8CNh5R4vFcwaLo86ODss/db5oqVD6sSq5rX7Ta2+z4miiqu
 beV/2vavQ+6owy8DSjuo22XTwn5paIa0bNyoRV8PwzSfPKczK2h4/JdX2p02ipnR3KYJX7HxeDf
 D5FaMj2pY/YPykoTxlwsy28PzQtXEoIpTzDpkVrP9Vt4ENAT9UtzAy4cIhqLo+9z1liJMHWYKfN
 l1GLqTKQxf3nEdZTAovKCvBk35jfyq9ihv6ozplVTSeDURQErXAJ0UumU2qix5UqfzdYmr2yELN
 8GUOS/XbWIEUYXX1p4w==
X-Proofpoint-GUID: 1eqH_XulcPf4cHqtv_r_B13rdl2esiSi
X-Proofpoint-ORIG-GUID: 1eqH_XulcPf4cHqtv_r_B13rdl2esiSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-Rspamd-Queue-Id: 57C97535131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107350-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the video clock controller for video clients to be able
to request for videocc clocks on Eliza platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  10 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 415 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 22eb80be60ad3bde897f2c507ac9897951fbb8fe..0cddeb4cb78ac2de9e8ea29af050c7285f5e43ec 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -45,6 +45,16 @@ config CLK_ELIZA_TCSRCC
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
 
+config CLK_ELIZA_VIDEOCC
+	tristate "Eliza Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_ELIZA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Eliza devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b818fd5af8bfb85a51ee90fdc3baa93af30dc39a..e7e239c5a0d088b2e78354bf421d871a4e4e6d9d 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-eliza.c
new file mode 100644
index 0000000000000000000000000000000000000000..36af35e070299718106f1b8e8dbc23f20279ea85
--- /dev/null
+++ b/drivers/clk/qcom/videocc-eliza.c
@@ -0,0 +1,404 @@
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
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
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
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 576.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x1e,
+	.alpha = 0x0,
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
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(633000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1113000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
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
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x8110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80f4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x80ac,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8058,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80a0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8144,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8144,
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
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x8148,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8148,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8148,
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
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
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
+	.gdscr = 0x808c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_eliza_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_eliza_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_eliza_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80d8 },
+	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80a0, 2 },
+	[VIDEO_CC_MVS0_BCR] = { 0x8088 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x810c, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_eliza_plls[] = {
+	&video_cc_pll0,
+};
+
+static u32 video_cc_eliza_critical_cbcrs[] = {
+	0x80dc, /* VIDEO_CC_AHB_CLK */
+	0x8128, /* VIDEO_CC_SLEEP_CLK */
+	0x810c, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_eliza_driver_data = {
+	.alpha_plls = video_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_eliza_plls),
+	.clk_cbcrs = video_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_eliza_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_eliza_desc = {
+	.config = &video_cc_eliza_regmap_config,
+	.clks = video_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_eliza_clocks),
+	.resets = video_cc_eliza_resets,
+	.num_resets = ARRAY_SIZE(video_cc_eliza_resets),
+	.gdscs = video_cc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_eliza_gdscs),
+	.driver_data = &video_cc_eliza_driver_data,
+};
+
+static const struct of_device_id video_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_eliza_match_table);
+
+static int video_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_eliza_desc);
+}
+
+static struct platform_driver video_cc_eliza_driver = {
+	.probe = video_cc_eliza_probe,
+	.driver = {
+		.name = "videocc-eliza",
+		.of_match_table = video_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(video_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


