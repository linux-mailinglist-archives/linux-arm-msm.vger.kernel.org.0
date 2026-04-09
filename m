Return-Path: <linux-arm-msm+bounces-102553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKiKBAES2GldXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:54:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61E3CFA63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6217A304B29C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D988C343D7F;
	Thu,  9 Apr 2026 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL+llQiO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDK0If51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF359344046
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767908; cv=none; b=evKEB9xtdJkTYwM9fhrO/c2gvBNi+z+jHF1/A3qRxYUgmW0x1CASHZMFBqQByW7m0DVacqdk9M1lljaifVV167iq1LEpN6l8PJ8I/7i3Y2aB4VcfKg/BOBURkrfivx/lvPbJVQQ1FOLtUmz1lMDOOLCs5SNCcpnDF+ID3FiTQkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767908; c=relaxed/simple;
	bh=gcgvGt00dtfHZQ+9tTFp2hOWb9q8ub2J+jWdr3GP7bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/cwthuRicWwBnWV2HxZSqZ53zpQXWqt0or+8Cw4yjoKTDWq/NDdwzb7jMuZFk6DoVd11ru/zs1ZLV7leJpP+bcWuPX+Z7azE7GF+SjHype8pPijtYiVYsSeDi/FHi7gro5OM47f121ssL63HKdUwJZzrvOp+vZBFP1AdpAegY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL+llQiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDK0If51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KOPEd729162
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t18nYD09G1Li+WSxDw6Hf7c8xY3vrOtBmaJwda93wpA=; b=HL+llQiOOIBLZux3
	AjzRRmtwKIAX6H8vB1ylZo85G8dXXRTWy31Ba9TzjUy2K4thXuJTTz0MO6+i+mZ2
	VnqjKvFrnP8EvsP6tVL3A0aIWNuttnfWYxeSKRhM53kUPXOoBzi6wBKGI5fA62rs
	LdV/gD6/6ABYZ2CzC1JYRdF/v+Kht3EZbjEA06VRJapQqg9WJO/iyEKy2YHM+p1q
	IaprB8tUeqigTOFPw9AcQhVQ00Zz4N604EsYQfWRxhVX5nLiv3K/Msydrdn0RZYz
	d1oUYgV2oATt6MCsU47YuXqmFi/uyY8r+Ne0fqn6BsTPMF8SZPYWR+2oyqsI17Xc
	8qL7Ww==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c82aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:51:44 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127133794b6so12154122c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767903; x=1776372703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t18nYD09G1Li+WSxDw6Hf7c8xY3vrOtBmaJwda93wpA=;
        b=DDK0If512CBqJ9aA0RggMDEZoa+VlUZzuBA05BnjnHrpRWSGNpXZzUEJ4kJriKgcV/
         OyRR9578FvHnnFKMLnrqPfFVRJPfqaPk6WR1+c2iMjj4nM4LLhT0cPk3OHkJv0IXLw2Z
         S1UP36z8XVbvycNGQtJsIHckpALUVJOkGSngY4c8dD3Z2tl/F/bVDCAWd+AmwHQzLpf+
         19jDymb3QNr+y/v1Yb9cKgxq14rjifufcqeaJNSu8MbDXpuB/9YsOtqcf9C1yWm4NBXq
         ugXoa9ImlPyqL260vbUuQOPZGNuZlv8Fz4tqMwoMi21CJfRm/Whj0ixi+J660FMd4381
         RZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767903; x=1776372703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t18nYD09G1Li+WSxDw6Hf7c8xY3vrOtBmaJwda93wpA=;
        b=cdVfn3RLnuVVK+jFDHA3lLLCBhYOXf5DojGZvLc1u9fE/geLCaPywR5HBwK2Es1lkh
         qVw4R4aJk3g1N9VORnnOKNoFST8p2jb2EQsI8bJFIfdr7wJK7tIW1Ce1sAyNwq/DZPbK
         AeBTyx2JCCS3zinsfknswJWS1GhvEat1ZBzMC/5Eww4ayg94St/NI3m4v1g5LNIY7now
         owzHPZV6ggrSlJmaxzsWltoJdH2vI9I+qsoiDGeUFXN4kUpFSl81zYMAbS7IvWDPoelI
         lGz7kI4hwE4N1JT7zTTElvXiEH3Hm9n0ERDrvRlE+Y5sUSPeIM+s8JAafgYuOplmlMx5
         /vfA==
X-Gm-Message-State: AOJu0Ywn863OXH8nKtN45GjwncKOKlUoQF8iMQq5yvlTo2UKl6BVP2Jm
	aMTA8OwDUjzt/PecFTWiuklZnHCY8UCG+S0242tDJ5w2Xv6o7uUnqs+LaA33CplojxgmSy/YY6j
	YCUOSoCBtkdTefj4JDlFFlvy2wQKtIDSfWCvNlMsX+FrmNposbzhFuEp0DSd/vhP5flVv
X-Gm-Gg: AeBDieuEjFnRLmE+0Fn6qSVP7yS8vxJAjiRrxpF+JoL54FNV3wbkOuBDhlyK+9u45Mj
	OgctLsqzfEUWk9YoDMDO2JEDzJiqMTRxuApLw3h+tHKU+uuOdCyVaV31TYy7IIZi/S8q627j3jr
	EtTnJQDnAXkDjXcNjHxAcG9Vq1afdj0ZBpPG+9hKoZeorzzfTqA3F0Sajh/USTOdJun7lh+jEC4
	ZryTSptuiXGN72ZS95qZ7WM4VY3DGdIyksO0AMpgQfmXKtHkxd++shNXDr5XA5y33BIwV2hF7UQ
	SrzPciPbvM/QZ4BkUrqsw/yaf4elCjCaeNZ6kz7E3ozPTKYzw7yKlOq7PGPqaxdpj+g0gSCGpy4
	m88nEpyWEHPRt1wZtdRU8xlVdWoUjItytT4+FlscqQDc24lqVYRimZVXEW53KBPEl06hX8eQkoY
	b8
X-Received: by 2002:a05:7022:6721:b0:128:ce84:f68b with SMTP id a92af1059eb24-12c34e6b498mr331605c88.4.1775767903397;
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
X-Received: by 2002:a05:7022:6721:b0:128:ce84:f68b with SMTP id a92af1059eb24-12c34e6b498mr331583c88.4.1775767902801;
        Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:39 -0700
Subject: [PATCH v2 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=6115;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=gcgvGt00dtfHZQ+9tTFp2hOWb9q8ub2J+jWdr3GP7bg=;
 b=u1UaBfMfsKAJaZ7/oLtalN/NilDGYCa7wUdSC3DFMvyBXElwaUCgERibB7/pLEekMO4xaN9Zy
 No1HlfqWMpiAaTqjVUbV9tQRtOsvbf41anBH2dJsEmhSv0njsSTHzHq
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX1voOnAj2a9XR
 CaeQimw80ULN1e/KhwbcEIeYzw/Az/9emA39NSxv8Wou1hZH9m+1kN3HVrAFND+pqkxgQsL6WVm
 Ks7C5hnq0m+LqsOrOipMkkrTvKXHf1PIztJOxTC3LkCFr8xk7L9H7VPSDkEUuAz/nanKrcMXBpd
 PPUYoELFjsdyL6vdeAB1u0A+R+4CtrsQbBEyfQTHLbiLLyJ236w11Hih6EhVgPQfjbbxdxc5cIS
 h14nfSc1NAGg6D+yZ6xj+DReSjwEetAr+cbUNuCZ6bPKhiLDlKrCG9Cw1pznJP9vZyBtLuOkPz9
 xZTq0d4ihBFDD3UHd+DWQO+OCjDe/9iOlt6KDgzjC0LbJiFaLPk2K83dJoEHf1R+wgEM0loLwKX
 0wrvorWDNr8at8g0UIwC/nh8GDZqpJkjk2viISOkC+gBbCHYWdewnNQcAF44mLB3cm+lG/Vzhlq
 WpLl5TzNY+B8aBRdLCQ==
X-Proofpoint-ORIG-GUID: _Et-6oLg89yqtaDDnsU9KDT3reL_oChr
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d81160 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L8n4sJc4XsezP8dVquAA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: _Et-6oLg89yqtaDDnsU9KDT3reL_oChr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102553-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C61E3CFA63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
This controller provides reference clocks for various peripherals
including PCIe, UFS, and USB.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |   7 ++
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8f55f10261ec..412badb0fb58 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -286,6 +286,13 @@ config QCOM_CLK_RPMH
 	 Say Y if you want to support the clocks exposed by RPMh on
 	 platforms such as SDM845.
 
+config CLK_HAWI_TCSRCC
+	tristate "Hawi TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the TCSR clock controller on Hawi devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 103d6c4b860c..e85ed6678e51 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
+obj-$(CONFIG_CLK_HAWI_TCSRCC) += tcsrcc-hawi.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
diff --git a/drivers/clk/qcom/tcsrcc-hawi.c b/drivers/clk/qcom/tcsrcc-hawi.c
new file mode 100644
index 000000000000..c942b0c8e09f
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-hawi.c
@@ -0,0 +1,158 @@
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
+#include <dt-bindings/clock/qcom,hawi-tcsrcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x4c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x18,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_hawi_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_hawi_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x4c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_hawi_desc = {
+	.config = &tcsr_cc_hawi_regmap_config,
+	.clks = tcsr_cc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_hawi_clocks),
+};
+
+static const struct of_device_id tcsr_cc_hawi_match_table[] = {
+	{ .compatible = "qcom,hawi-tcsrcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_hawi_match_table);
+
+static int tcsr_cc_hawi_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_hawi_desc);
+}
+
+static struct platform_driver tcsr_cc_hawi_driver = {
+	.probe = tcsr_cc_hawi_probe,
+	.driver = {
+		.name = "tcsrcc-hawi",
+		.of_match_table = tcsr_cc_hawi_match_table,
+	},
+};
+
+module_platform_driver(tcsr_cc_hawi_driver);
+
+MODULE_DESCRIPTION("QTI TCSRCC HAWI Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


