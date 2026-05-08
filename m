Return-Path: <linux-arm-msm+bounces-106666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLZdMOjK/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:37:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8024F5D67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7426300EC4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50D1383C83;
	Fri,  8 May 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8kUXULl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3ilH58+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5043D1713
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240218; cv=none; b=Sth3E7In6zsXbeHyKZKBX9Y0Y1YrOZLbhMsA2NeJKpglnFSfgQ2bPyADovxJFc+eEQ03bO8XYMpZD66e+/vM3uPQq5u91+lyZmzpKOTRL/3SY/3K/HFiPaR8cm7HPPHOphTtds40JcvxlF2APzSgQ6KbzAmF0H3RQJmrkU7rDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240218; c=relaxed/simple;
	bh=tHQrW9mh8+7g72Y/vw7hRMGweCsOAGsdssCtzmaYYuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pEzEiQ4WVL5jFoSjxgbeiz4lk9UaX5KJ+XRq3qkPLvOdtBLUJ4t9dIEbegBAzMmks1GgruETCrcCBn53JTvElkiYqn2rpsGkSjwvxt7ca10pdIsh2vXIQIZtVZpkjEMGxzw0eXmeOFmheDwF+Lkj6x/UIhpXhV5I9zHIh/1D/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8kUXULl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3ilH58+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648B8j152777671
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hsOIavlPFzl
	uwv5CpKxCmDgZRoBsbBQWS45W+MeWQSc=; b=N8kUXULlwykJDphuqsHFFVEnbME
	aAUptGDeGk1EWanKpj4iCDlwC093GngBykuSsI4i9plqO1DMvvx7C8Q20NYqXjCw
	lGFsTcDW4fOm7RyAjIps9pOVloNXfA/qupWgudMUrUBeobDmzlibsTa6Ed+ACEyY
	ydzrcMEVHOoBbAoRTXvUcd65t0Cb4IJQOv1XjmsWkDBdKDjD45/n/P76CxqtXikf
	CMiP6lBERPZEI69Rykzd6CZ3jh22uBuaShNs5l3ygRyGlS76AUGOyMvHH51QX0dQ
	0WvN0mV2ju3Xwje7ZuN49y20sh4TmYNJKcehb9PrwbzcULO8/j1ojN7gb4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285jvb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:36:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365faf6006dso2307657a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240212; x=1778845012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsOIavlPFzluwv5CpKxCmDgZRoBsbBQWS45W+MeWQSc=;
        b=Z3ilH58+S3MwDsYvusHiS5nRDUvJDsKREvj+2iEHisZTzoi2RupauQGl5dR3aD7B5T
         b3rXlo9jYyCm20ndlo80a+pqi7usRiPmCzr2wFko8TtIDLjXMTn6GCDVlNl/dDEzBbf3
         u70JtfT4GqF+CFlAPNST+iigHWVNmIabsneWTIYxNKIHb3+Ze7fDXNHkdp04dMR5FqX/
         Odcgt4jtEw0ZWFfHMHCZSfPlKjkbVHCzbfvGnf3nmCsho4KjXYdq8bnDUYLiZvqfFvr6
         lfRAbHkBQc9asEHQEHCxxA2zfkj3nemnXU6NJltTlwodOV7i6FMLMzFIwPFVA46ZJLzI
         DE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240212; x=1778845012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsOIavlPFzluwv5CpKxCmDgZRoBsbBQWS45W+MeWQSc=;
        b=rpDGHDqmwM7zO7x83y0PFMbpdttge90fOeVl6W6eJxcsdt+lJU0LiSjr0B4Ar1smS8
         7vnC2Lx64E4X2/AXjpb8FHNNGrXz9vjnJ50+QpcpRts2FzmciUTywqar8L03SQtd8KJH
         8tJNmYIEVKyIJrM/6gMhg6bDEg+OfNPjR1AQac9ReQMHgwQfQjTBFoLv6yJc73tHtTAF
         VuXXlpl+e6Oc+UNVMz+6aguzed6iCsn8XDb3izi/KebEcO1Sn8asHMRvuEubq2L7Awqu
         PdjkLUCd8NYyLr+Qx7gLnKfg5ovsItH29lhbQSEwIHCoVwfAUWzuL3R2Qz+A1bSvY4kB
         CQUg==
X-Gm-Message-State: AOJu0YwM7LGz8lz1fh6fE3dio1qsUSkk40NumAqVb+EjPQBU9F8WoYgk
	aJxZNMdOVuI9mea0JY/K00Q2ULJyOkHSTkQ4qWte2C4aFzxZNTXxP+c0B7fF/+kbJuyYHfRbbZO
	u6lK/vo+7tUjt2geMieFiID5cl9AJenWpeMGtCpsXEnu+qzVcs34Etwe1qtIrRF+kEopc
X-Gm-Gg: Acq92OG3yWYqywZMAodf6jMPvhd4dW0o3iac7HwnvPwghq436HP9vijyGDKjUBbO0xr
	2Xqui2ucHd8tTnhKMzwT1LAgzw51oZDZF2fBeDx83egMM5JtF/FbirwquGS9Whpja4BYqyj/Ycc
	KXh9L4EOZEKl0VfLWHdW2UTuhiYdVvlhXRKsJ7tbqxdCrFSQeWwqucHP/sBrG65wXfo9qH1oSmX
	y1bv68/q7ajbfUYikJIDE2mUql7/yl/yMWVdPr1RJvF1SLcrutv10O8/e+WNwYpG4MoRbYK7QVL
	Lx7ENH4m4SDqQ8GSiQ4feW2ngrHv1nMB9+ZL8VBxMibgN7VUU6gfhUgWanzoZBdBhxzt0UK/0jM
	cARzSjarWc/UTkDAqUQTzjSN2WohFXNpPFZjC9dC3Z419VGREmw==
X-Received: by 2002:a17:90b:2248:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-365ab9b8c6cmr12117254a91.6.1778240211869;
        Fri, 08 May 2026 04:36:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-365ab9b8c6cmr12117216a91.6.1778240211311;
        Fri, 08 May 2026 04:36:51 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bdac03sm1256373a91.2.2026.05.08.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:36:51 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Fri,  8 May 2026 17:06:36 +0530
Message-Id: <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfX0k9C4bIs6Kyv
 jrIZ66GwcFKqNRdjTrxpZ4iGkaYP05/1itY5H69SQfZrOEKpj6U7tLiZOyLvqhoxUCuF6bYAP+r
 FPd+7MFB1aOQkSKb5seKvxb+ZCwZQYq288FlPdFhWjYN418MRw7op946+culycdSFxtquCVut94
 NytIugO6ORWA4rQb3R7qIRtHCuFkvI6cLNFbdfLFwCJVtKxetfJJMilJByZC5w80Ox/rC1dTCTs
 Ai05j67NCZ9eD4Sojr3GYMG7ChpX4FuIfNE1hLxEBrV7uEx2+ZK+j7vlB6jYn96MSbfTIKBHZFU
 c8kFl3tVsVtsinbgDzsFlniGluf/yf23pJpWxdKbcYHYU3ep6jUbYqZJsr2rwJGSN828KGE9JFT
 eebqRIPbWp3b0A8yfKWyhlvdpyW8ae5g/XZxL00RsibTx4sTuzhwr7JYNE0rgQZEs0WB4SSiEuY
 Ow+IvxxmzEcobtYfnQQ==
X-Proofpoint-GUID: 1xbfW5nvRdDOwJKevgLioFWVxAN9xFPO
X-Proofpoint-ORIG-GUID: 1xbfW5nvRdDOwJKevgLioFWVxAN9xFPO
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fdcad4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pmTXJCWftoUlG_UUdvAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080120
X-Rspamd-Queue-Id: 0A8024F5D67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106666-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Convert the LPASS LPI pinctrl driver to use the PM clock framework for
runtime power management.

This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
improves power efficiency on platforms using LPASS LPI island mode, and
aligns the driver with common runtime PM patterns used across Qualcomm
LPASS subsystems.

Guard GPIO register read/write helpers and slew-rate register programming
with synchronous runtime PM calls so the device is active during MMIO
operations whenever autosuspend is enabled.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 109 +++++++++++++-----
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
 2 files changed, 84 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 15ced5027579..cd5dd18fd149 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -15,6 +15,8 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
 
@@ -22,7 +24,6 @@
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,7 +32,6 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
@@ -39,29 +39,43 @@ struct lpi_pinctrl {
 };
 
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
-			 unsigned int addr)
+			 unsigned int addr, u32 *val)
 {
 	u32 pin_offset;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
-	return ioread32(state->tlmm_base + pin_offset + addr);
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return ret;
+
+	*val = ioread32(state->tlmm_base + pin_offset + addr);
+	pm_runtime_put_autosuspend(state->dev);
+
+	return 0;
 }
 
 static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 			  unsigned int addr, unsigned int val)
 {
 	u32 pin_offset;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return ret;
+
 	iowrite32(val, state->tlmm_base + pin_offset + addr);
+	pm_runtime_put_autosuspend(state->dev);
 
 	return 0;
 }
@@ -107,8 +121,8 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct lpi_pingroup *g = &pctrl->data->groups[group];
-	u32 val;
-	int i, pin = g->pin;
+	u32 val, io_val;
+	int i, pin = g->pin, ret;
 
 	for (i = 0; i < g->nfuncs; i++) {
 		if (g->funcs[i] == function)
@@ -119,7 +133,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		return -EINVAL;
 
 	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		goto unlock;
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -129,24 +145,32 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		u32 io_val = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG);
+		ret = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
+		if (ret)
+			goto unlock;
 
 		if (io_val & LPI_GPIO_VALUE_IN_MASK) {
 			if (!(io_val & LPI_GPIO_VALUE_OUT_MASK))
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val | LPI_GPIO_VALUE_OUT_MASK);
+				ret = lpi_gpio_write(pctrl, group,
+						     LPI_GPIO_VALUE_REG,
+						     io_val | LPI_GPIO_VALUE_OUT_MASK);
 		} else {
 			if (io_val & LPI_GPIO_VALUE_OUT_MASK)
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val & ~LPI_GPIO_VALUE_OUT_MASK);
+				ret = lpi_gpio_write(pctrl, group,
+						     LPI_GPIO_VALUE_REG,
+						     io_val & ~LPI_GPIO_VALUE_OUT_MASK);
 		}
+		if (ret)
+			goto unlock;
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+	ret = lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+
+unlock:
 	mutex_unlock(&pctrl->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct pinmux_ops lpi_gpio_pinmux_ops = {
@@ -162,11 +186,15 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 	unsigned int param = pinconf_to_config_param(*config);
 	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
 	unsigned int arg = 0;
+	int ret;
 	int is_out;
 	int pull;
 	u32 ctl_reg;
 
-	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG, &ctl_reg);
+	if (ret)
+		return ret;
+
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
 
@@ -206,7 +234,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 {
 	unsigned long sval;
 	void __iomem *reg;
-	int slew_offset;
+	int slew_offset, ret;
 
 	if (slew > LPI_SLEW_RATE_MAX) {
 		dev_err(pctrl->dev, "invalid slew rate %u for pin: %d\n",
@@ -225,6 +253,10 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	else
 		reg = pctrl->slew_base + LPI_SLEW_RATE_CTL_REG;
 
+	ret = pm_runtime_resume_and_get(pctrl->dev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&pctrl->lock);
 
 	sval = ioread32(reg);
@@ -233,6 +265,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	iowrite32(sval, reg);
 
 	mutex_unlock(&pctrl->lock);
+	pm_runtime_put_autosuspend(pctrl->dev);
 
 	return 0;
 }
@@ -291,21 +324,27 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	 */
 	if (output_enabled) {
 		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		ret = lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		if (ret)
+			return ret;
 	}
 
 	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		goto unlock;
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+	ret = lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+
+unlock:
 	mutex_unlock(&pctrl->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct pinconf_ops lpi_gpio_pinconf_ops = {
@@ -354,9 +393,14 @@ static int lpi_gpio_direction_output(struct gpio_chip *chip,
 static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	u32 val;
+	int ret;
 
-	return lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG) &
-		LPI_GPIO_VALUE_IN_MASK;
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & LPI_GPIO_VALUE_IN_MASK;
 }
 
 static int lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
@@ -399,7 +443,9 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 
 	pctldev = pctldev ? : state->ctrl;
 	pindesc = pctldev->desc->pins[offset];
-	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
+	if (lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG, &ctl_reg))
+		return;
+
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 
 	func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
@@ -482,9 +528,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -497,13 +540,17 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
-	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	devm_pm_runtime_enable(dev);
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -542,7 +589,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 
 err_pinctrl:
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
@@ -554,7 +600,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 	int i;
 
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f410311a8..64a200dd8f41 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -139,10 +141,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
 		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


