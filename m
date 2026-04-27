Return-Path: <linux-arm-msm+bounces-104761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEyvHxeN72l5CwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:21:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E3847642A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 878A83052713
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA31355F57;
	Mon, 27 Apr 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8Q6lzfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2934FF45
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306516; cv=none; b=UNTSXr+TO+VNJSkUq85v0+JOb6ELRjbZTEyA8bFkOsiacGkytCKEGvEjckt3OKMHx5xaEf+Q93v7IcdR69/HLcRnK21vJbGGxDRa658IQ4G8tCLnChcZIYSAWhzvBLRbqRPUyNSvvU/mXuArtm719gNtnMdnm+ds3AvObCjeoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306516; c=relaxed/simple;
	bh=vvIuXyUwG0ROqzEzoGIoFsof2Grhsg6jyMf3khY5wnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZUa8687tRAScGWAJckKuXPFB+B55NP1VatymxCX8QaSAYe6w05GRNWlKBPTXoweOmp30D8mWULnKVRE96iA99HWJt2js4DJKI6+TSaekAnQG08wcLS3gowyArTqOS7vbRH8tJpbHpE0IrNzHHMeYBHLGIpNK+kHFDjGISIfnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8Q6lzfP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so62081535e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306512; x=1777911312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pCtzPKsI6DwKDfQsHYxk5yeW3YAEFM8/W3hVObaP1w=;
        b=k8Q6lzfP8sGHXFjgm83Se+02NIngp1SiwSxWjcBr+ztzziArduVX7avcVzCuyIRMql
         snGRXrv3MIUGu5j6+zrezMyYgr0oeGq5s/sYLCQUZcNv4xFGdsfFS03WDA9ZaiwnMaS1
         0xtjdJxvwEdYu2E6F3h3dtL9oG7+dVvJQoCWFxH7FUkBs0/5nsNfi2+m4nWpk8VnG6MT
         wb0oDGi4Q+TIG3nZaN+yXSHUAsSsCIHLL3gLjYiHvpJQP6exNLB8viv3khZOnUJDzM4f
         RA8E5qvOtUYA/YfpLQ2a/1BCBam2iaabNnhxrT1CuxT96OAEiplstpVgAwiQbrj/gAyK
         LpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306512; x=1777911312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9pCtzPKsI6DwKDfQsHYxk5yeW3YAEFM8/W3hVObaP1w=;
        b=CJd2TKZc0lBeH8rzrk9J5H28NZhw9Af2gBG4snQOrQF7++IQ0W0VAM7C16LAR9Y9L3
         eKHxfB5mGWiNNaQ7qKLwHOtbNlmx+HQu3x/pJBZD+JDY2yuyqXzK+DD1ZE+TV1A3yOdF
         veRTeoCv/0rNtqc1DplcPMfg2JpWx7wLiIQPYrju+9mK5zKVdnW6tCLrzafCP+OCa2OX
         KtnBf7fhIyGhEe22D7ynGirOInx5VTgx68C8k3WzcinQwz+mpVYb5tk/i67CoMOMnenq
         23oEshxEloz4kR03FSuHbpQXZf0p2RNiDDpE9F9fV+Sar9n1dwU4F9eTpPC6I2UaSH+O
         mAWg==
X-Gm-Message-State: AOJu0Yw2pSBa59wzp3UjG52gf5smsYNrn/k1TCq3CZhLe32lJJyiwI+4
	fDCi8kTh3XvYR4FGHIe9NYG8OunFX/d0vHgAWpVLSoNdmC8RG51iuMCC9lACRv9jRBo=
X-Gm-Gg: AeBDietOEQEuILw9s0ANFZ18dv3E9DJh21laKbBlGEUyKYQL1uQ5gD6rVH24fEUdINU
	w9kf4vKXc+U6LMPoA3WnGGoh0jqKxcOkL/hjsxARdGYa7vu7H3mjAnRe0ha1fPHUDNXI/dJfjdu
	5ddk9LsReLTAkKlc+ptn31v16VHqKPITEuNAakAty9t5GC92MvxDzDl6bq381r1vM/mtQ6tO6YQ
	Wuy24zn2ZLKHI7ELU/872RSaitB6CxjxxRblObbUbpGZ+nzd28dHVTHHJ/1h2WakH2UqOPcD7jj
	NewQkEC0RqJ+yT5toYaEs1p1rBEDjIwmpt0h+tp8WvSVOBjQQCgBmRn1XdSMMj//BUCCKDqVqPi
	5KCpKLQ64YXHXEt0ByGGLWnnF9NnyzbQGZD4b8QvVnV++uPrrLyqfEROLUSj/Eu8iDK5sc6Avxf
	3bkEs+oCtAvN17vKof+mtqJn4DeUQHu0/b4tdaaRs5mKknBlQtau0UZrQ=
X-Received: by 2002:a05:600c:8411:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-48a76f773a9mr484475e9.19.1777306512381;
        Mon, 27 Apr 2026 09:15:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:05 +0200
Subject: [PATCH RFC 1/6] arm64: dts: qcom: add PMIC5 Gen3 macros for
 channel numbers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-1-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=15269;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vvIuXyUwG0ROqzEzoGIoFsof2Grhsg6jyMf3khY5wnw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uLhf0/QEpt8242QWi7g+BBy2EHkrPmrn/aVU3R
 7IqrbEuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LiwAKCRB33NvayMhJ0YNsEA
 CXktsdga05QBkbM6k0hb/q2KH4LCg8ZmuHhk2gZ4vertgKuF5J4WY9cXY/vTNqdFi8cFP7bdBSCgzA
 Tkx5htnvU1XbKzgWezQpaxfuls1cz8Qm8hKJeokM5wniiHzb2Osc3r5Bv/Cp4mOGf59ZF+odsbXqOj
 3/KpV99uIDsoirsbyoOmgHkz+Z13dcPW7pc1SXrlnBwzaH7Yajr+8axKOmOsVIrlkUIX0LVkOqorIv
 5DQpTDoSreuqvhilmUYrPL08AlNcKfKVto6W4wrv8uIIy4c4S4dVXzTug32efwmjUQhGJXQc5WNw1G
 P6bKAJHNxuiSQrfD6JFp8Tgyz5yJuU5Ckmw5aeoqFtnKRpTeBmd75jnl67fP7YwEblhJyF3nSpYBY/
 p2Z9XSWqCEuEzWOMlukawu0bXkZJr5CSObaWzx9W9knggiqq6dKnigZCbzqR5ai4hfGSS5+EaqrwRs
 Ttdjz40RT96aRDOM6Y8P2CwONoYxkmj8cFpREElqHlCRjLMT/TC57c2nSjnVsahzdaiRSAXsjwfmlX
 N8GidVYC0HAHXl14RyXuEoTxWJH9lKyYWEON7QotJKXazgv49rsQiDFfrWdkVBHouD0lbKEvmiD2gZ
 6TTt1ZCrMRAsviN1K109c+bit4hvY7pfjFiqI9LmBX8ALenqxlSEGvVobLgA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 00E3847642A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104761-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add the PMIC5 Gen3 macros to calculate the channel numbers which
is a combination of SPMI bus number and a constant for the sensor
type and configuration.

The macros definitions were taken out of [1] where it was initially
in the dt-bindings include directory but since those are not hardware
bindings but logical numbers, they can be moved to local includes
instead to make the DT source more readable.

[1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   | 46 ++++++++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  | 85 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h | 22 ++++++
 arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  | 52 +++++++++++++
 4 files changed, 205 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h
new file mode 100644
index 000000000000..2a6338812d4e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PM8550_ACD5_GEN3_H
+#define _QCOM_PM8550_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PM8550_ADC for PMIC5 Gen3 */
+#define PM8550_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PM8550_ADC5_GEN3_AMUX_THM1(sid)			((sid) << 8 | ADC5_GEN3_AMUX1_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM2(sid)			((sid) << 8 | ADC5_GEN3_AMUX2_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM3(sid)			((sid) << 8 | ADC5_GEN3_AMUX3_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM4(sid)			((sid) << 8 | ADC5_GEN3_AMUX4_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM5(sid)			((sid) << 8 | ADC5_GEN3_AMUX5_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM6_GPIO2(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
+#define PM8550_ADC5_GEN3_AMUX1_GPIO3(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
+#define PM8550_ADC5_GEN3_AMUX2_GPIO4(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO)
+#define PM8550_ADC5_GEN3_AMUX3_GPIO7(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO)
+#define PM8550_ADC5_GEN3_AMUX4_GPIO12(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO)
+
+/* 100k pull-up */
+#define PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM2_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM3_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM4_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM6_GPIO2_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX1_GPIO3_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX2_GPIO4_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX3_GPIO7_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)
+
+/* 1/3 Divider */
+#define PM8550_ADC5_GEN3_AMUX3_GPIO7_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_DIV3)
+#define PM8550_ADC5_GEN3_AMUX4_GPIO12_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_DIV3)
+
+#define PM8550_ADC5_GEN3_VPH_PWR(sid)			((sid) << 8 | ADC5_GEN3_VPH_PWR)
+
+#endif /* _QCOM_PM8550_ACD5_GEN3_H */
diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h
new file mode 100644
index 000000000000..312daa846f79
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PM8550B_ACD5_GEN3_H
+#define _QCOM_PM8550B_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PM8550B_ADC for PMIC5 Gen3 */
+#define PM8550B_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550B_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550B_ADC5_GEN3_VREF_VADC(sid)		((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550B_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO)
+
+#define PM8550B_ADC5_GEN3_CHG_TEMP(sid)			((sid) << 8 | ADC5_GEN3_CHG_TEMP)
+#define PM8550B_ADC5_GEN3_USB_SNS_V_16(sid)		((sid) << 8 | ADC5_GEN3_USB_SNS_V_16)
+#define PM8550B_ADC5_GEN3_VIN_DIV16_MUX(sid)		((sid) << 8 | ADC5_GEN3_VIN_DIV16_MUX)
+#define PM8550B_ADC5_GEN3_VREF_BAT_THERM(sid)		((sid) << 8 | ADC5_GEN3_VREF_BAT_THERM)
+#define PM8550B_ADC5_GEN3_IIN_FB(sid)			((sid) << 8 | ADC5_GEN3_IIN_FB)
+#define PM8550B_ADC5_GEN3_TEMP_ALARM_LITE(sid)		((sid) << 8 | ADC5_GEN3_TEMP_ALARM_LITE)
+#define PM8550B_ADC5_GEN3_SMB_IIN(sid)			((sid) << 8 | ADC5_GEN3_IIN_SMB)
+#define PM8550B_ADC5_GEN3_SMB_ICHG(sid)			((sid) << 8 | ADC5_GEN3_ICHG_SMB)
+#define PM8550B_ADC5_GEN3_ICHG_FB(sid)			((sid) << 8 | ADC5_GEN3_ICHG_FB)
+
+/* 30k pull-up */
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_30K_PU)
+
+/* 100k pull-up */
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)
+
+/* 400k pull-up */
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_400K_PU)
+
+/* 1/3 Divider */
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_DIV3)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_DIV3)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_DIV3)
+
+#define PM8550B_ADC5_GEN3_VPH_PWR(sid)			((sid) << 8 | ADC5_GEN3_VPH_PWR)
+#define PM8550B_ADC5_GEN3_VBAT_SNS_QBG(sid)		((sid) << 8 | ADC5_GEN3_VBAT_SNS_QBG)
+#define PM8550B_ADC5_GEN3_VBAT_SNS_CHGR(sid)		((sid) << 8 | ADC5_GEN3_VBAT_SNS_CHGR)
+#define PM8550B_ADC5_GEN3_VBAT_2S_MID_QBG(sid)		((sid) << 8 | ADC5_GEN3_VBAT_2S_MID_QBG)
+#define PM8550B_ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		((sid) << 8 | ADC5_GEN3_VBAT_2S_MID_CHGR)
+
+#endif /* _QCOM_PM8550B_ACD5_GEN3_H */
diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h
new file mode 100644
index 000000000000..7a261a7a9cb0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PM8550VX_ACD5_GEN3_H
+#define _QCOM_PM8550VX_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PM8550VX_ADC for PMIC5 Gen3 */
+#define PM8550VS_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550VS_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550VS_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550VS_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PM8550VE_ADC5_GEN3_OFFSET_REF(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550VE_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550VE_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550VE_ADC5_GEN3_DIE_TEMP(sid)		((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#endif /* _QCOM_PM8550VX_ACD5_GEN3_H */
diff --git a/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h
new file mode 100644
index 000000000000..60b3b9c60d4e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PMK8550_ACD5_GEN3_H
+#define _QCOM_PMK8550_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PMK8550_ADC for PMIC5 Gen3 */
+#define PMK8550_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PMK8550_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PMK8550_ADC5_GEN3_VREF_VADC(sid)		((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PMK8550_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
+
+/* 30k pull-up */
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_30K_PU)
+
+/* 100k pull-up */
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
+
+/* 400k pull-up */
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_400K_PU)
+
+#endif /* _QCOM_PMK8550_ACD5_GEN3_H */

-- 
2.34.1


