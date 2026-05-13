Return-Path: <linux-arm-msm+bounces-107277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BZwIVpuBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:28:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C84533097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20CB030F2B38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F2A407565;
	Wed, 13 May 2026 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckQ91Fo3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTfM2/vY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C43FFAC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675153; cv=none; b=tkBWBOHL8JppIz4pIqOqWaEknv5PVX2lc8Ml8GsXTrfrlZ+RydqxoQ9P6lbLotgr3gNlY6lu51utlkLxtnB2xfUz9Tcl3ZfYY9hRDFogu8HTcd5LNbIB9qsUgj0krSp4oBrplSIPGD5Qoxk5kd1xuv0IRLkoLSjUSgwYJYEGrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675153; c=relaxed/simple;
	bh=6S0FgVSJf8oqbmmtqZ08a0wiJRY7EN9elgthk+0/9FI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IP0WDRIQDhKi6saS5sUZN9hK0bYwxi01/OfQ5MBj+lH/J326x/g+lzlDiK/nM820gy14QjAPasN8abbeUYSZnl817cp9x92hgthPx/xDON8qd6uc7cSRcGbbN92ZE3xKjiNmPiic0h5ttqX09icjiU9zZg0pnzRT8N0kI5yZBQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckQ91Fo3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTfM2/vY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6ihmV2965290
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V1Oo0u0TA/E
	jMXXFjv9OErXptq2tRtWVXM3e4ewn6Ls=; b=ckQ91Fo34bZFkY/UYdCqt8xCwqh
	UZep26CZMFLyxM3GbED1djDodBRx6lUnSe0VPrbgfh2IHM3feM3r5P5gaCpDxKF2
	QVfHg6cR+qGpY3i2kGXHzAEY94bKFJFh1RLDbFyZ5m6liO1ejvTiF8+bpjQE/E69
	pVRsatu39KPTlL29ScNKKIxZhLWbhSp41sMZYHMUsrdAauiOUYJqmoFR9EyST/E4
	wRBSA+rIuE4xxSqwzvZIhYK0+c5j0Cs7RZJz27dQUVk/Oposkf5JOupE9y50Xx0h
	g9CsSNxTPPuhFzsuqbA4gFdFn9kfIhzy3kqbfS3Rx+usdNN4KxaZkKIHCYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma599ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:25:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366015bca9bso5407124a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675151; x=1779279951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1Oo0u0TA/EjMXXFjv9OErXptq2tRtWVXM3e4ewn6Ls=;
        b=OTfM2/vYxoEI/DsZMyCV7QGZXmphG6PC6uxYbIHh7XMKFycnXQUIzSTeOYTzK9rKhE
         x8N5k9d4bkX4VMtB3mDE+h470Bs0p8QM3YxkG66qEwXnKHagLGyXMw/pVQOHItbmkvrN
         aHHwQIgYA/z4pMhBx0OYMyRYfQbeQJkmulVZzBUIzkT9LVaTu/BMqDD940oAufDrUPij
         Z8VXDbVjwxvg8Couvo8QHTD/ox1BH1P4ARdCXcMiar1vmJLXg9O3KwFAzE7N0cHcMETv
         CSq6itTGlUv+iCppT/BxkpsvLRf6XbXLnR1R5CtC2BrfTKTHDXua3MG0/RNYB0qU+pnd
         UHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675151; x=1779279951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V1Oo0u0TA/EjMXXFjv9OErXptq2tRtWVXM3e4ewn6Ls=;
        b=AveG3lGqkKBzOU9H3MfdFYBgKgTR4TNJ3WmVu0OW1fkznd7I4RUoDg+GWbEEFc2/R6
         pT9UgrbWzTAHVBxt8GyPykrj5bTa7uXoBkW/rn4Zh4giCmkeYjvm9rbZOMsr7gLdmYld
         Umh2IJxvpJaqr1GBDVc4zLUBEQOY3S1YCFf4x0suUuSxHhSuaifJbJET9sfQ0H9Fsd56
         GwAbOJj//RjZCPG0nfB64/KMEfk/OwmmjFhIzVgu0fKtiY+dXfFMtYaNMSRm6yLjV8Dg
         NNPFZXIERwSzGhFD8d9pjvRRoSC4MyNqjanAI9DUZ4ynv+ohYtrDUQpvVv6GHuiZHkr0
         aL0g==
X-Gm-Message-State: AOJu0YxIZoyuzvt+zCZreypwzN5BW0B5vRQE3AfQ/Qc0icPNCZGHes7r
	08eNkzUo8bUbFv25pImfsqZR1rQXcwF+fq4YbBlodsUBndp9byx+QxjZh7LeZ9LPYFTYLb5uB0r
	xkPy1/SHAdt+LA82j5t1pmHor0w25/NuWiy1hmU2Ax14mDnxgGDZIXIrUxaahhQyY1bJi
X-Gm-Gg: Acq92OFP7CpMvPFdyb0qx6PMT8VSLLWSOhjPC3TWdmuiOSNuLffeM+xoYgu993MJY2I
	2Cz0+kZedop1H/XwK68ITmI5npifYtqKAv7jLfm56BYYhtpJ/eVfn6D8cdqNCOtIkucKh3vH1y3
	j6u4SRXD8im3qOHzUg3Pattk7mCulf2+Z0J2HOj/93W8SSNmGJF56apsflL+U1Hupo4a60hOd3r
	x8A0ff+6t4vk9TxHELVbLnduUXW+gLp98/oT/0GF74spDJAOVLP3IV81MKigAsWRk+E4ERszNYC
	XTVSMoqG/EMcgfDx8Usvm1wdRieRm4aZ6YLe2G9eHP69kUTr6bP3slyfk5jzbJAhIogbg+VISJ7
	f3aiYUGrUN93ajtCN9YDhG9cBC8rC9EqmjO+3tXaB3u0NR/riaw==
X-Received: by 2002:a17:90b:5910:b0:368:2ba0:5e8a with SMTP id 98e67ed59e1d1-368f3acb5c8mr2417367a91.6.1778675150756;
        Wed, 13 May 2026 05:25:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5910:b0:368:2ba0:5e8a with SMTP id 98e67ed59e1d1-368f3acb5c8mr2417342a91.6.1778675150218;
        Wed, 13 May 2026 05:25:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf4d84sm3651894a91.3.2026.05.13.05.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:25:49 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Wed, 13 May 2026 17:55:26 +0530
Message-Id: <20260513122542.3726319-2-ajay.nandam@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMCBTYWx0ZWRfX80x1eE+7cMZQ
 /yn+mW3aqpyItNTFQgrfQiTHl35sXHvoQPhgyoMCK4B8riiQR3ezEGeP5MGXcew5WnNyUG+f0Xm
 g+VLYP2IrZp8HtKtT6fN4JhV2wAAhCGinz9p/x/c3WJhkSjfm2a+b14qQIxh15H5/S1tOej9eaX
 HP3AXWtqKqiRxUIolQPPwaHDr4C0jRDMcbdRs5N/uvuoNYUPrxdWUlG8BbPcs/TuVZWPu0J2GlA
 dgpAD0f909aUTg1KflFGSTfbOKJtuoxAS4fFtfbP4ZqEZjt0Us9QnQirGwS1cl9cs959q0qR83Y
 aBrFiC6wDiCC747XZslEZheDFXX+FzlOFaPKl9JImFu4SZlEnSctMSrgY/AAPpN04+TM749CXfn
 RUiVRhcSrcEi4CGSpXx6QGZ4usTjmkl1IWDDfllSJXZycVgu73Pnn4bwEi25pA/czRODmQ/WetK
 QCb7s4LVCpdvZJprZBw==
X-Proofpoint-ORIG-GUID: 6B2eYA7Wl0tJ_FSbiP1XZQ9ez8Te23ir
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a046dcf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=v7sZglqyuKF-rt2OdT4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6B2eYA7Wl0tJ_FSbiP1XZQ9ez8Te23ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130130
X-Rspamd-Queue-Id: D9C84533097
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107277-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
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
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 118 ++++++++++++------
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
 2 files changed, 88 insertions(+), 37 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 15ced5027579..d95e28926d38 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -15,6 +15,9 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/cleanup.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
 
@@ -22,7 +25,6 @@
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,7 +33,6 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
@@ -39,29 +40,47 @@ struct lpi_pinctrl {
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
+	ret = pm_runtime_put_autosuspend(state->dev);
+	if (ret < 0)
+		return ret;
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
+	ret = pm_runtime_put_autosuspend(state->dev);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -107,8 +126,8 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct lpi_pingroup *g = &pctrl->data->groups[group];
-	u32 val;
-	int i, pin = g->pin;
+	u32 val, io_val;
+	int i, pin = g->pin, ret;
 
 	for (i = 0; i < g->nfuncs; i++) {
 		if (g->funcs[i] == function)
@@ -118,8 +137,10 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	if (WARN_ON(i == g->nfuncs))
 		return -EINVAL;
 
-	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
+	guard(mutex)(&pctrl->lock);
+	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		return ret;
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -129,24 +150,27 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		u32 io_val = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG);
+		ret = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
+		if (ret)
+			return ret;
 
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
+			return ret;
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
-	mutex_unlock(&pctrl->lock);
-
-	return 0;
+	return lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
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
@@ -233,6 +265,9 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	iowrite32(sval, reg);
 
 	mutex_unlock(&pctrl->lock);
+	ret = pm_runtime_put_autosuspend(pctrl->dev);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -291,21 +326,22 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	 */
 	if (output_enabled) {
 		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		ret = lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		if (ret)
+			return ret;
 	}
 
-	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
+	guard(mutex)(&pctrl->lock);
+	ret = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		return ret;
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
-	mutex_unlock(&pctrl->lock);
-
-	return 0;
+	return lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
 }
 
 static const struct pinconf_ops lpi_gpio_pinconf_ops = {
@@ -354,9 +390,14 @@ static int lpi_gpio_direction_output(struct gpio_chip *chip,
 static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	u32 val;
+	int ret;
+
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG, &val);
+	if (ret)
+		return ret;
 
-	return lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG) &
-		LPI_GPIO_VALUE_IN_MASK;
+	return val & LPI_GPIO_VALUE_IN_MASK;
 }
 
 static int lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
@@ -399,7 +440,9 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 
 	pctldev = pctldev ? : state->ctrl;
 	pindesc = pctldev->desc->pins[offset];
-	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
+	if (lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG, &ctl_reg))
+		return;
+
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 
 	func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
@@ -482,9 +525,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -497,13 +537,19 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
-	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+		return ret;
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -542,7 +588,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 
 err_pinctrl:
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
@@ -554,7 +599,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
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

