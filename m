Return-Path: <linux-arm-msm+bounces-108056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIq+JLf8CWpPvwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:36:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD00562A1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71D133028362
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114093C4B87;
	Sun, 17 May 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIa5texv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvpkbHla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F49F275B03
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039224; cv=none; b=QQ6eqdT3RfEZiQX7h8z+UW4GLXrEVmwoOv3ligB1NzpQ+CwjAfSKnJDQXht8ejzC11Db9qnY3a5WmA2izkWChEgRVBK7hmjbNxQ6rVE3ChZuOSfJhLcERuMMZ05Bqo2iHNg4EnGpwLEN3xW9hXxroiL8zfU8CZPM4WLqknLfyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039224; c=relaxed/simple;
	bh=iwq4cYTSCBuQv2tn+z0OiBTUMXAAU9lSrFkUMPo9oww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fVxJpOckxZD1tz0cxqSeQQoT6JSSJ1AzJBkT6c2fBQF6caLVZG8Y6htltUs9gSoJzh+OWz6IdV37AE+vxS/qW/hrtTgJ0F2zzh+bHQdEMHV1JiCXheD+HuKHSxEIYeu0mGq5K3AG5Cf82vwXpYWULT/Bxx/vRg+a1HXzj+u5v8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIa5texv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvpkbHla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5x7kF3269475
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRykvfKiQO2R2iHmpEE4l21+4cXHFyJ3kGpXC5DIDJY=; b=XIa5texvfhy4kVU7
	6QJ2zAjX9UQcuKu57cjpccqhDDHLIlQA6dJvNC7Wwkd5Hn19XgtAuevbLL4m8n4E
	dhMfJZ09Mmx/q+j9FkbCGG9uNO/TkDB6lrIVlB7MgRYAYnAKUSpkNgwxMk/ucpcb
	36lyFKiNqtV20Ved4xv7JjLOnhRWmganmlI1P+OQaZiy9wa47Wbx+XkNmY6MUw86
	iFygRetg8Fz+DkoFuJ2J57prCZbYIM24SpQFazmpeePttHolZAe8Eo3wBp2Trdv0
	Df79taAyKGCqEhd97ci8+PLrM/einshfiaq0E/OKz7vTcetrMThJ6TrcZAFE7ehv
	Vgv81w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g38sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso2438973b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039220; x=1779644020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRykvfKiQO2R2iHmpEE4l21+4cXHFyJ3kGpXC5DIDJY=;
        b=fvpkbHlabyMqyTuay+yi38maAw04zJZEg2tJBI2ubouEA9rl/VfK5KBmMIoDiljck/
         X7gK+xsZJNaE+5c/hKAMQpyw3bvcQH3U9Rpe0kgALHNqxuPPoEmYsTirGnRlZWuzZAKs
         8N2sXwh56eVrYOMRsPRfn6VbfmtFo/f5zoF3JxzfhPWYNqrF69rPX/QyMQVbfnNOLwv8
         s6KL0U+02Hkg86YdjLDvqsytD3CX0Vrq/0lyUYA8fWT9aUv84paEWQRtiGHoFmYvFK7i
         HryrnBQI0SQnwZaytO7mS63FD6Lk1baafYo7chzZIhZkCUh3wK4IofMKywa5IWpwxOAv
         M3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039220; x=1779644020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VRykvfKiQO2R2iHmpEE4l21+4cXHFyJ3kGpXC5DIDJY=;
        b=j0a6BdW6o6nBC1H/kiUsx4Lv6qTqPO7tvK2RruCIcn3bDPkPTialZI8lYQaKjdyv4d
         /aAvWCpr2aOWfFfAo4eKu6IvkLKqk/A3Wepszikk/jg/wWX0FK9e0XaWDmYvpdNSxQA6
         zBaoudMEDIsdUgskzLGIgEiTsrP8jl0CAypBuGwmF7YFAWJomE3JZa3lHCHJ41jYenCD
         Lz+Rv5YIT7+ZGZqV7gwlL9TxEXDoUcNqQZtKj3vWW9AAO5HKGTWkA+3BuvT1WZ4RaD3M
         hnd7OLzvtqiCJGQWw4VHCzbj1BxR6Rw8luq1BU+1URZmEohTngA4roiT1cuzi1Dc1CY9
         aTxw==
X-Gm-Message-State: AOJu0YzCHs6TilnlrgUfV8KxDtcPQ9TelixjhdGSqxJiKBw/pyZoZKa9
	pSswzzc/8zlJbiCWo20pjiyLPCYqr8+VweC39nFkeGqXDsyEJG8ll64gGd5mMNDq5zIpnWP8/H9
	tR5sjgH5HUiCAWJthT1g3Lc+0w7s8MtlVZDR7HPgI6mc1YEvWQB9ccCKa3sjjc/1hPABc
X-Gm-Gg: Acq92OEtYvpMnrgMJsXmxM/ufuhmKJQCA1bsxaOS1qs1zaIcZ4jjhxexIKgT42Rn7Wj
	EDXMLgncFIpzx4CKpup2daY/9bN9cxEa+1UCoK6hFNs97VM2QoBb8Oh9rk+vssOm+ankXz3qxHj
	hBdoj55pLoiKeyb+88EpELTSgml+fDXiPdT1emitUvLfZX0UGvTPSwzSQV2biUid6Sp6lWxxkv8
	PrlVn9KdPIhVCOTsq0zJz5KR5dFA+IyNhh8HFo0CNpKP7Abs9/LoyOu/BbIGnVRsgazF9KH1Uy8
	ppde7zD60T0HlAwwN/z8jszDoFvXJBZZEBz55AKkYxIhenkV7/8HBB1VkTHDOVpTYxSZj1qmvd5
	kF4I7ghINJYD5EQLEvpVN7oi55QgutqbX5LFpMt5LhEIUbwE66gli
X-Received: by 2002:a05:6a00:2308:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-83f33f28f4dmr13289185b3a.46.1779039219143;
        Sun, 17 May 2026 10:33:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-83f33f28f4dmr13289142b3a.46.1779039218314;
        Sun, 17 May 2026 10:33:38 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11331567b3a.19.2026.05.17.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:33:37 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sun, 17 May 2026 23:03:08 +0530
Subject: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
In-Reply-To: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfX6fgx6K+5y+9S
 ojgjqdyRtpfDuZgzfF0Fx1C5T5T9CSTJrOWaqbtnN31oOgqAwOwrIPz58XBEDfgcbCl0uacUR+C
 4aY5iZ10AA1Kun6GZrjbwB67fxyLBzJF2LDiOQOj5AU2Q5mfIO3IbUmS2Ugo7N0z9qiwSM0gotY
 t2YZCQq01r9TYfkef71THcRzMAiE8DwCGf6YuGEimRuTbxOSDqsuE+lxrA1bJ1XcasT204chC9j
 iNMgofB6/f7BlklTx2xo5wL7zjRmQHvLb0sk5CQekuIiUY0PqRArG24sWPOpt2Vfo1fuvzleHG/
 cbnOhYyrWR/qzZxnCr2wLX8u6D67v0hYg8JgLmt4yETM2X41gvAF41GjeUjfjulntzzYzgYEf6h
 twNkfmx0Ccjeo9x6j6arfK8pgt5Avr1MZImwFhu4dUkL6mdpfiN9tkdSfSGt3dpc8bGWrTe8Ccq
 7VyvimnVh+uhGkT/MXg==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a09fbf4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aRdJ3GDzpGfdKYT1tLAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: P-2kbDKNDjPVJDmpQBQWMLlHVef1YIG6
X-Proofpoint-ORIG-GUID: P-2kbDKNDjPVJDmpQBQWMLlHVef1YIG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170189
X-Rspamd-Queue-Id: AAD00562A1A
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108056-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Action: no action

Add support for the camera clock controller for camera clients
to be able to request for camcc clocks on Glymur platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   11 +
 drivers/clk/qcom/Makefile       |    1 +
 drivers/clk/qcom/camcc-glymur.c | 2280 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 2292 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index df21ef5ffd6862bec26e3a77ace62ad935ef44fb..754c3b823f3f884c47a5ab2c68cf48c2ecb7eeeb 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -45,6 +45,17 @@ config CLK_ELIZA_TCSRCC
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
 
+config CLK_GLYMUR_CAMCC
+	tristate "Glymur Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the camera clock controller on Qualcomm Technologies, Inc
+	  Glymur devices.
+	  Say Y if you want to support camera devices and functionality such as
+	  capturing pictures.
+
 config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 462c7615a6d734e76cab64c9f91c9efc5bbfbb25..a03ccb515b76c0273a96c2ae861f9accfa73c864 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..a80f05b7bc4841f97d03544c11a77e8821437925
--- /dev/null
+++ b/drivers/clk/qcom/camcc-glymur.c
@@ -0,0 +1,2280 @@
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
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_IFACE,
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_BI_TCXO_AO,
+	P_CAM_CC_PLL0_OUT_EVEN,
+	P_CAM_CC_PLL0_OUT_MAIN,
+	P_CAM_CC_PLL0_OUT_ODD,
+	P_CAM_CC_PLL1_OUT_EVEN,
+	P_CAM_CC_PLL2_OUT_EVEN,
+	P_CAM_CC_PLL2_OUT_MAIN,
+	P_CAM_CC_PLL3_OUT_EVEN,
+	P_CAM_CC_PLL4_OUT_EVEN,
+	P_CAM_CC_PLL5_OUT_EVEN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco rivian_eko_t_vco[] = {
+	{ 883200000, 1171200000, 0 },
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config = {
+	.l = 0x3e,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll0 = {
+	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
+	{ 0x2, 3 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
+	.offset = 0x0,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_cam_cc_pll0_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_odd",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+/* 608.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll1_config = {
+	.l = 0x1f,
+	.alpha = 0xaaaa,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll1_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
+	.offset = 0x1000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll1_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll1_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll1_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll1.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config = {
+	.l = 0x32,
+	.alpha = 0x0,
+	.config_ctl_val = 0x12000000,
+	.config_ctl_hi_val = 0x00890263,
+	.config_ctl_hi1_val = 0x1af04237,
+	.config_ctl_hi2_val = 0x00000000,
+};
+
+static struct clk_alpha_pll cam_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
+	.vco_table = rivian_eko_t_vco,
+	.num_vco = ARRAY_SIZE(rivian_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_rivian_eko_t_ops,
+		},
+	},
+};
+
+/* 691.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config = {
+	.l = 0x24,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
+	.offset = 0x3000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll3_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll3_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll3_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll3.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+/* 691.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config = {
+	.l = 0x24,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll4 = {
+	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll4",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll4_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
+	.offset = 0x4000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll4_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll4_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll4_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll4.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config = {
+	.l = 0x32,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll cam_cc_pll5 = {
+	.offset = 0x5000,
+	.config = &cam_cc_pll5_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll5",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll5_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
+	.offset = 0x5000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll5_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll5_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll5_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll5.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+	{ P_CAM_CC_PLL5_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll5_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EVEN, 3 },
+	{ P_CAM_CC_PLL2_OUT_MAIN, 5 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll2.clkr.hw },
+	{ .hw = &cam_cc_pll2.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL3_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL4_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll4_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 4 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_5[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_5[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map cam_cc_parent_map_6_ao[] = {
+	{ P_BI_TCXO_AO, 0 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_6_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
+	F(160000000, P_CAM_CC_PLL0_OUT_ODD, 2.5, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_bps_clk_src = {
+	.cmd_rcgr = 0x10278,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_bps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_camnoc_axi_rt_clk_src[] = {
+	F(240000000, P_CAM_CC_PLL0_OUT_EVEN, 2.5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_camnoc_axi_rt_clk_src = {
+	.cmd_rcgr = 0x137b4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_camnoc_axi_rt_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_axi_rt_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
+	F(30000000, P_CAM_CC_PLL5_OUT_EVEN, 16, 0, 0),
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cci_0_clk_src = {
+	.cmd_rcgr = 0x1350c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_0_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_1_clk_src = {
+	.cmd_rcgr = 0x1363c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_1_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
+	.cmd_rcgr = 0x11168,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cphy_rx_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
+	F(266666667, P_CAM_CC_PLL0_OUT_ODD, 1.5, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x150e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi0phytimer_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x15104,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi1phytimer_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
+	.cmd_rcgr = 0x15124,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi4phytimer_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_csid_clk_src = {
+	.cmd_rcgr = 0x1378c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
+	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
+	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
+	.cmd_rcgr = 0x10018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_fast_ahb_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_icp_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_icp_clk_src = {
+	.cmd_rcgr = 0x133cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_icp_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_0_clk_src[] = {
+	F(345600000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(594000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(675000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(727000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_0_clk_src = {
+	.cmd_rcgr = 0x11018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_clk_src",
+			.parent_data = cam_cc_parent_data_2,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_1_clk_src[] = {
+	F(345600000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(432000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(594000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(675000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(727000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_1_clk_src = {
+	.cmd_rcgr = 0x12018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ife_1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_clk_src",
+			.parent_data = cam_cc_parent_data_3,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_lite_clk_src[] = {
+	F(266666667, P_CAM_CC_PLL0_OUT_ODD, 1.5, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
+	.cmd_rcgr = 0x13000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_ife_lite_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
+	.cmd_rcgr = 0x13140,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_ife_lite_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_csid_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ipe_nps_clk_src[] = {
+	F(304000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(364000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(500000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(700000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
+	.cmd_rcgr = 0x103d0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ipe_nps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_clk_src",
+			.parent_data = cam_cc_parent_data_4,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_jpeg_clk_src[] = {
+	F(160000000, P_CAM_CC_PLL0_OUT_ODD, 2.5, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_jpeg_clk_src = {
+	.cmd_rcgr = 0x13284,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_jpeg_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_jpeg_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_mclk0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24000000, P_CAM_CC_PLL2_OUT_MAIN, 10, 1, 4),
+	F(68571429, P_CAM_CC_PLL2_OUT_MAIN, 14, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_mclk0_clk_src = {
+	.cmd_rcgr = 0x15000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk0_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk1_clk_src = {
+	.cmd_rcgr = 0x1501c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk1_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk2_clk_src = {
+	.cmd_rcgr = 0x15038,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk2_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk3_clk_src = {
+	.cmd_rcgr = 0x15054,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk3_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk4_clk_src = {
+	.cmd_rcgr = 0x15070,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk4_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk5_clk_src = {
+	.cmd_rcgr = 0x1508c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk5_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk6_clk_src = {
+	.cmd_rcgr = 0x150a8,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk6_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk7_clk_src = {
+	.cmd_rcgr = 0x150c4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk7_clk_src",
+			.parent_data = cam_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(60000000, P_CAM_CC_PLL5_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x137fc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x13964,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_5,
+	.freq_tbl = ftbl_cam_cc_sleep_clk_src,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sleep_clk_src",
+			.parent_data = cam_cc_parent_data_5,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
+	F(64000000, P_CAM_CC_PLL5_OUT_EVEN, 7.5, 0, 0),
+	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
+	.cmd_rcgr = 0x10148,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_slow_ahb_clk_src",
+			.parent_data = cam_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_xo_clk_src = {
+	.cmd_rcgr = 0x13948,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_6_ao,
+	.freq_tbl = ftbl_cam_cc_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_xo_clk_src",
+			.parent_data = cam_cc_parent_data_6_ao,
+			.num_parents = ARRAY_SIZE(cam_cc_parent_data_6_ao),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_ahb_clk = {
+	.halt_reg = 0x10274,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10274,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_clk = {
+	.halt_reg = 0x103a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x103a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_bps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_fast_ahb_clk = {
+	.halt_reg = 0x10144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_axi_nrt_clk = {
+	.halt_reg = 0x137e0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x137e0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x137e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_axi_nrt_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_rt_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_axi_rt_clk = {
+	.halt_reg = 0x137cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x137cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_axi_rt_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_rt_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_dcd_xo_clk = {
+	.halt_reg = 0x137f0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x137f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_dcd_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_xo_clk = {
+	.halt_reg = 0x137f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x137f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_0_clk = {
+	.halt_reg = 0x13638,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13638,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_1_clk = {
+	.halt_reg = 0x13768,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13768,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_core_ahb_clk = {
+	.halt_reg = 0x13944,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x13944,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_core_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_ahb_clk = {
+	.halt_reg = 0x1376c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1376c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_bps_clk = {
+	.halt_reg = 0x103b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x103b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_bps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_bps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_fast_ahb_clk = {
+	.halt_reg = 0x1377c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1377c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_ife_0_clk = {
+	.halt_reg = 0x11154,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11154,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_ife_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_ife_1_clk = {
+	.halt_reg = 0x12040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_ife_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_ife_lite_clk = {
+	.halt_reg = 0x1313c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1313c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_ipe_nps_clk = {
+	.halt_reg = 0x1050c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1050c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_ipe_nps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi0phytimer_clk = {
+	.halt_reg = 0x150f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x150f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi0phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi1phytimer_clk = {
+	.halt_reg = 0x1511c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1511c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi1phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi4phytimer_clk = {
+	.halt_reg = 0x15250,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15250,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi4phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi4phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_clk = {
+	.halt_reg = 0x137a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x137a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_csiphy_rx_clk = {
+	.halt_reg = 0x15100,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15100,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_csiphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy0_clk = {
+	.halt_reg = 0x150fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x150fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy1_clk = {
+	.halt_reg = 0x15120,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15120,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy4_clk = {
+	.halt_reg = 0x15254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_ahb_clk = {
+	.halt_reg = 0x13508,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13508,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_clk = {
+	.halt_reg = 0x134f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x134f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_clk = {
+	.halt_reg = 0x11144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_dsp_clk = {
+	.halt_reg = 0x11158,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11158,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_dsp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_fast_ahb_clk = {
+	.halt_reg = 0x11164,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_clk = {
+	.halt_reg = 0x12030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_dsp_clk = {
+	.halt_reg = 0x12044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_dsp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_fast_ahb_clk = {
+	.halt_reg = 0x12050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_ahb_clk = {
+	.halt_reg = 0x13280,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13280,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_clk = {
+	.halt_reg = 0x1312c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1312c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
+	.halt_reg = 0x1327c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1327c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_csid_clk = {
+	.halt_reg = 0x1326c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1326c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_ahb_clk = {
+	.halt_reg = 0x10528,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10528,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_clk = {
+	.halt_reg = 0x104fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x104fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_fast_ahb_clk = {
+	.halt_reg = 0x1052c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1052c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_pps_clk = {
+	.halt_reg = 0x10510,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10510,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_pps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_pps_fast_ahb_clk = {
+	.halt_reg = 0x10530,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10530,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_pps_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_jpeg_clk = {
+	.halt_reg = 0x133b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x133b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_jpeg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_jpeg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk0_clk = {
+	.halt_reg = 0x15018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk1_clk = {
+	.halt_reg = 0x15034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk2_clk = {
+	.halt_reg = 0x15050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk3_clk = {
+	.halt_reg = 0x1506c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1506c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk4_clk = {
+	.halt_reg = 0x15088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk5_clk = {
+	.halt_reg = 0x150a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x150a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk6_clk = {
+	.halt_reg = 0x150c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x150c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk7_clk = {
+	.halt_reg = 0x150dc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x150dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk7_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk7_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x13928,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13928,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x1392c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1392c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc cam_cc_titan_top_gdsc = {
+	.gdscr = 0x13930,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_titan_top_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_bps_gdsc = {
+	.gdscr = 0x10004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_bps_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ife_0_gdsc = {
+	.gdscr = 0x11004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ife_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ife_1_gdsc = {
+	.gdscr = 0x12004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ife_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ipe_0_gdsc = {
+	.gdscr = 0x103bc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ipe_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *cam_cc_glymur_clocks[] = {
+	[CAM_CC_BPS_AHB_CLK] = &cam_cc_bps_ahb_clk.clkr,
+	[CAM_CC_BPS_CLK] = &cam_cc_bps_clk.clkr,
+	[CAM_CC_BPS_CLK_SRC] = &cam_cc_bps_clk_src.clkr,
+	[CAM_CC_BPS_FAST_AHB_CLK] = &cam_cc_bps_fast_ahb_clk.clkr,
+	[CAM_CC_CAMNOC_AXI_NRT_CLK] = &cam_cc_camnoc_axi_nrt_clk.clkr,
+	[CAM_CC_CAMNOC_AXI_RT_CLK] = &cam_cc_camnoc_axi_rt_clk.clkr,
+	[CAM_CC_CAMNOC_AXI_RT_CLK_SRC] = &cam_cc_camnoc_axi_rt_clk_src.clkr,
+	[CAM_CC_CAMNOC_DCD_XO_CLK] = &cam_cc_camnoc_dcd_xo_clk.clkr,
+	[CAM_CC_CAMNOC_XO_CLK] = &cam_cc_camnoc_xo_clk.clkr,
+	[CAM_CC_CCI_0_CLK] = &cam_cc_cci_0_clk.clkr,
+	[CAM_CC_CCI_0_CLK_SRC] = &cam_cc_cci_0_clk_src.clkr,
+	[CAM_CC_CCI_1_CLK] = &cam_cc_cci_1_clk.clkr,
+	[CAM_CC_CCI_1_CLK_SRC] = &cam_cc_cci_1_clk_src.clkr,
+	[CAM_CC_CORE_AHB_CLK] = &cam_cc_core_ahb_clk.clkr,
+	[CAM_CC_CPAS_AHB_CLK] = &cam_cc_cpas_ahb_clk.clkr,
+	[CAM_CC_CPAS_BPS_CLK] = &cam_cc_cpas_bps_clk.clkr,
+	[CAM_CC_CPAS_FAST_AHB_CLK] = &cam_cc_cpas_fast_ahb_clk.clkr,
+	[CAM_CC_CPAS_IFE_0_CLK] = &cam_cc_cpas_ife_0_clk.clkr,
+	[CAM_CC_CPAS_IFE_1_CLK] = &cam_cc_cpas_ife_1_clk.clkr,
+	[CAM_CC_CPAS_IFE_LITE_CLK] = &cam_cc_cpas_ife_lite_clk.clkr,
+	[CAM_CC_CPAS_IPE_NPS_CLK] = &cam_cc_cpas_ipe_nps_clk.clkr,
+	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK] = &cam_cc_csi4phytimer_clk.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK_SRC] = &cam_cc_csi4phytimer_clk_src.clkr,
+	[CAM_CC_CSID_CLK] = &cam_cc_csid_clk.clkr,
+	[CAM_CC_CSID_CLK_SRC] = &cam_cc_csid_clk_src.clkr,
+	[CAM_CC_CSID_CSIPHY_RX_CLK] = &cam_cc_csid_csiphy_rx_clk.clkr,
+	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
+	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
+	[CAM_CC_CSIPHY4_CLK] = &cam_cc_csiphy4_clk.clkr,
+	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
+	[CAM_CC_ICP_AHB_CLK] = &cam_cc_icp_ahb_clk.clkr,
+	[CAM_CC_ICP_CLK] = &cam_cc_icp_clk.clkr,
+	[CAM_CC_ICP_CLK_SRC] = &cam_cc_icp_clk_src.clkr,
+	[CAM_CC_IFE_0_CLK] = &cam_cc_ife_0_clk.clkr,
+	[CAM_CC_IFE_0_CLK_SRC] = &cam_cc_ife_0_clk_src.clkr,
+	[CAM_CC_IFE_0_DSP_CLK] = &cam_cc_ife_0_dsp_clk.clkr,
+	[CAM_CC_IFE_0_FAST_AHB_CLK] = &cam_cc_ife_0_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_1_CLK] = &cam_cc_ife_1_clk.clkr,
+	[CAM_CC_IFE_1_CLK_SRC] = &cam_cc_ife_1_clk_src.clkr,
+	[CAM_CC_IFE_1_DSP_CLK] = &cam_cc_ife_1_dsp_clk.clkr,
+	[CAM_CC_IFE_1_FAST_AHB_CLK] = &cam_cc_ife_1_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_LITE_AHB_CLK] = &cam_cc_ife_lite_ahb_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
+	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
+	[CAM_CC_IPE_NPS_AHB_CLK] = &cam_cc_ipe_nps_ahb_clk.clkr,
+	[CAM_CC_IPE_NPS_CLK] = &cam_cc_ipe_nps_clk.clkr,
+	[CAM_CC_IPE_NPS_CLK_SRC] = &cam_cc_ipe_nps_clk_src.clkr,
+	[CAM_CC_IPE_NPS_FAST_AHB_CLK] = &cam_cc_ipe_nps_fast_ahb_clk.clkr,
+	[CAM_CC_IPE_PPS_CLK] = &cam_cc_ipe_pps_clk.clkr,
+	[CAM_CC_IPE_PPS_FAST_AHB_CLK] = &cam_cc_ipe_pps_fast_ahb_clk.clkr,
+	[CAM_CC_JPEG_CLK] = &cam_cc_jpeg_clk.clkr,
+	[CAM_CC_JPEG_CLK_SRC] = &cam_cc_jpeg_clk_src.clkr,
+	[CAM_CC_MCLK0_CLK] = &cam_cc_mclk0_clk.clkr,
+	[CAM_CC_MCLK0_CLK_SRC] = &cam_cc_mclk0_clk_src.clkr,
+	[CAM_CC_MCLK1_CLK] = &cam_cc_mclk1_clk.clkr,
+	[CAM_CC_MCLK1_CLK_SRC] = &cam_cc_mclk1_clk_src.clkr,
+	[CAM_CC_MCLK2_CLK] = &cam_cc_mclk2_clk.clkr,
+	[CAM_CC_MCLK2_CLK_SRC] = &cam_cc_mclk2_clk_src.clkr,
+	[CAM_CC_MCLK3_CLK] = &cam_cc_mclk3_clk.clkr,
+	[CAM_CC_MCLK3_CLK_SRC] = &cam_cc_mclk3_clk_src.clkr,
+	[CAM_CC_MCLK4_CLK] = &cam_cc_mclk4_clk.clkr,
+	[CAM_CC_MCLK4_CLK_SRC] = &cam_cc_mclk4_clk_src.clkr,
+	[CAM_CC_MCLK5_CLK] = &cam_cc_mclk5_clk.clkr,
+	[CAM_CC_MCLK5_CLK_SRC] = &cam_cc_mclk5_clk_src.clkr,
+	[CAM_CC_MCLK6_CLK] = &cam_cc_mclk6_clk.clkr,
+	[CAM_CC_MCLK6_CLK_SRC] = &cam_cc_mclk6_clk_src.clkr,
+	[CAM_CC_MCLK7_CLK] = &cam_cc_mclk7_clk.clkr,
+	[CAM_CC_MCLK7_CLK_SRC] = &cam_cc_mclk7_clk_src.clkr,
+	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
+	[CAM_CC_PLL0_OUT_EVEN] = &cam_cc_pll0_out_even.clkr,
+	[CAM_CC_PLL0_OUT_ODD] = &cam_cc_pll0_out_odd.clkr,
+	[CAM_CC_PLL1] = &cam_cc_pll1.clkr,
+	[CAM_CC_PLL1_OUT_EVEN] = &cam_cc_pll1_out_even.clkr,
+	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
+	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
+	[CAM_CC_PLL3_OUT_EVEN] = &cam_cc_pll3_out_even.clkr,
+	[CAM_CC_PLL4] = &cam_cc_pll4.clkr,
+	[CAM_CC_PLL4_OUT_EVEN] = &cam_cc_pll4_out_even.clkr,
+	[CAM_CC_PLL5] = &cam_cc_pll5.clkr,
+	[CAM_CC_PLL5_OUT_EVEN] = &cam_cc_pll5_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
+	[CAM_CC_SLEEP_CLK_SRC] = &cam_cc_sleep_clk_src.clkr,
+	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
+	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *cam_cc_glymur_gdscs[] = {
+	[CAM_CC_BPS_GDSC] = &cam_cc_bps_gdsc,
+	[CAM_CC_IFE_0_GDSC] = &cam_cc_ife_0_gdsc,
+	[CAM_CC_IFE_1_GDSC] = &cam_cc_ife_1_gdsc,
+	[CAM_CC_IPE_0_GDSC] = &cam_cc_ipe_0_gdsc,
+	[CAM_CC_TITAN_TOP_GDSC] = &cam_cc_titan_top_gdsc,
+};
+
+static const struct qcom_reset_map cam_cc_glymur_resets[] = {
+	[CAM_CC_BPS_BCR] = { 0x10000 },
+	[CAM_CC_ICP_BCR] = { 0x133c8 },
+	[CAM_CC_IFE_0_BCR] = { 0x11000 },
+	[CAM_CC_IFE_1_BCR] = { 0x12000 },
+	[CAM_CC_IPE_0_BCR] = { 0x103b8 },
+	[CAM_CC_QDSS_DEBUG_BCR] = { 0x137f8 },
+};
+
+static struct clk_alpha_pll *cam_cc_glymur_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll5,
+};
+
+static u32 cam_cc_glymur_critical_cbcrs[] = {
+	0x13960, /* CAM_CC_GDSC_CLK */
+	0x1397c, /* CAM_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config cam_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1603c,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data cam_cc_glymur_driver_data = {
+	.alpha_plls = cam_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_glymur_plls),
+	.clk_cbcrs = cam_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_glymur_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc cam_cc_glymur_desc = {
+	.config = &cam_cc_glymur_regmap_config,
+	.clks = cam_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(cam_cc_glymur_clocks),
+	.resets = cam_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(cam_cc_glymur_resets),
+	.gdscs = cam_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(cam_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &cam_cc_glymur_driver_data,
+};
+
+static const struct of_device_id cam_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-camcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cam_cc_glymur_match_table);
+
+static int cam_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &cam_cc_glymur_desc);
+}
+
+static struct platform_driver cam_cc_glymur_driver = {
+	.probe = cam_cc_glymur_probe,
+	.driver = {
+		.name = "camcc-glymur",
+		.of_match_table = cam_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(cam_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI CAMCC GLYMUR Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


