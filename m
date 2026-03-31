Return-Path: <linux-arm-msm+bounces-101066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPtxLzfVy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:07:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163836AAF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0F0430D29C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E373F9F52;
	Tue, 31 Mar 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEJ8WeFB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4261FCE
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965723; cv=none; b=L17aBwidA1AFz0juB1xhg8UqhqMopOoVMZqDm/VXVqZaQecg6nk3hA+G2rD5U5VOffMHc/uagj5HQ+0TgvGj5IZ9Xfh618KH8ehgW9CQ2N2TM5bwo5NmnshymnCEbVGCLbe2f7+vK7+dQuOtGq5+ZNjV7hF64x5QVt1pa14oWPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965723; c=relaxed/simple;
	bh=29a+QWmzRiXdRrprbsrP+/ZM7W6QdW0AI3DnrCCqPdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfsCYYmfH8zka4/tJv8G6AEtp4jh2NJx9wBAP75jiMZcB9wimgzjDV4791WDlZz61THtayhsPNZ7Ss+isbyyV7mnw3KrceTCw5qk5x2z801gaQlnkEIYXOXoypa/hnJa9asc3YuGGH2qFMFjIkJ/wkDMxRPXyB6KLnGQpOum7Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEJ8WeFB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a1438649b2so752004e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774965718; x=1775570518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fRm2KLSrPDi3+vX0vzzEz5KohutdRyFsvItUKtsNxA=;
        b=gEJ8WeFB+Ul/SASuj5zoCAW59eju+jqZmlmykK/Bb0T0Ief1m8qFlBlBNga7Hydijx
         vW1Q5GxuzW1cVpIlrcreDA8jcscgwd2/91k+4M2geBt89OPVgLz+EPsT2PtQMkEbGBCA
         4GfO8aVrlJZIA9zzkwMLa39NR2PdHms9E7pMvqIvKpwXE9KDdqSGSX/Coi2nqkStUlbd
         3h7gdwX1T8LNki3hxH33n7im1Teo2BMum6HruvaD0q9iOrRHIhVVU5Ge5cEFFKDAOErr
         Y3avWROfUYg0+PKwBU/RrByKRJNqcE2kbDDmK5Gc0x58V63Qgy/62K10cNXG/aAxqzS6
         DdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965718; x=1775570518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9fRm2KLSrPDi3+vX0vzzEz5KohutdRyFsvItUKtsNxA=;
        b=N4s4FE0k7x/ojkzFapAXyQVTai0LKaR35rKiSg2SB7NCBlfUBX/MDJq2Jks7+slioo
         mVRM953ivxEDyqFo8HTdL+YUt1W5zq+H/E7ETOiLliBDpSO6jdl75WbvGcYe1V++W3QE
         hRnz1CI3PsS0Gt9WIVDVAu6TIJej6mCDiYnpLwlO1+Niu+DnIwUWzPXeIdiDQFKioOMm
         pjlPcIZmU7l2ShKGzYh9cukAwkbvlQSWJ9edMwD7BW8prwcs9Au/SGFab73/BRIdsz4S
         ybguJTsyPEijMtp6PZOLZ9cdoYQxEMkj8KQtVINldAGZpLPu2TWYvrX1q759ANFEuLE1
         UQAg==
X-Forwarded-Encrypted: i=1; AJvYcCVSDJR6DfuNa78nOA35sfOIVY4c63nxoaO6biAnA5gumVrmD1l6ehK7MgpTsYKcmKSt0Gb1ODH3R793w/Lx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmu2ig53xybMaGr01K2+ehdPxGZcBqgqejYT2oBGjldXR5Jso9
	WieqDfaR3ZC6bhorj6nYKyYv2nzaZ+EhYzCGkel1FMg5RmniQjUvoKjrM+k2zfCdWME=
X-Gm-Gg: ATEYQzz22ztpik2kQx86mN6Zss05uIqHmxkCSbNDCjJYRo89cFfdOlg1P9tmbfC6Uf4
	ga8zUdXcR4gz8Ta+BxsTqsD6sRlq1hQ6MnX6JY4zKb+bWu0aTAOhRYbF/fXmxg5z1o7pcIS5U6W
	Ck3P9M4GnQL3JyDxQyUJvIMotWyCzESIBzZToIGEsilb2ImkKeEORifft9JmJsYk5thorDa9Q+F
	gpiOibH+YGinxIVEjvB/j58JYuE5YXKVTHCQSnKf+T6WXjz6X0O4oOtvbvIUk+6Fvv8Dc8X3m0/
	LsF1QJ+Y1Kor8F8mo8n8Ho78UaLiC6QiTWKj7p9NEwbBu34Y6+VS5z5MQKXpnS5RgHHS8gt9Hrh
	r4i+SBKsKmN4EN7SowBIbaxluf6vKdps6rTls9wOSxPc7S0k9UZSWq/IPI/5cVG9iNHQt7rAQ3B
	16AD7DzxWXnL1Jyc4brd25ihXQQ6UUH/kBFsm2IonEK9xx1sOfL7NllMHuiqt81VXo1Q==
X-Received: by 2002:a05:6512:3b9f:b0:5a2:7c19:414f with SMTP id 2adb3069b0e04-5a2ab913e44mr2639870e87.3.1774965718014;
        Tue, 31 Mar 2026 07:01:58 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456aa2sm2434745e87.68.2026.03.31.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:01:57 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
Date: Tue, 31 Mar 2026 17:01:42 +0300
Message-ID: <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101066-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6163836AAF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Starting from Snapdragon 845 platform CAMCC IP is a provider of GDSCs and
clocks for a number of CAMSS IP blocks, and the clock provider controller
requires Titan GDSC to be turned on before getting access to the CAMCC
clocks on the clock consumer side.

In case of CAMSS IP (including CCI) the devices are described as requiring
both CAMCC Titan power domain and CAMCC clocks, and the dependency between
the power domain and clock controller is managed in the consumer device
driver by forged runtime PM operations, which is a great complication, but
it was dragged to the working state.

Camera image sensors require to get MCLK clocks provided by CAMCC clock
controller, however the sensors cannot be described as ones belonging to
Titan GDSC power domain hierarchy, hence the original model of shifting
complexity of runtime PM from the CAMCC driver to CAMCC consumer drivers
cannot be stretched to the sensors.

The change explicitly adds Titan GDSC as a power domain of CAMCC clock
controller on a number of modern Qualcomm SoCs, where their correspondent
CAMCC drivers are added into runtime PM framework, this allows to perform
PM operations of sensor drivers out-of-sync and independently from CAMSS
driver. The simplest way to reproduce the originally discivered issue is
to attempt to unbind the sensor driver, which triggers rpm_resume():

    % echo 0-0056 > /sys/bus/i2c/drivers/s5kjn1/unbind # SM8650-HDK
    ------------[ cut here ]------------
    cam_cc_mclk3_clk status stuck at 'off'
    WARNING: drivers/clk/qcom/clk-branch.c:87 at clk_branch_toggle+0x168/0x188, CPU#6: sh/832
    <snip>
    Call trace:
    clk_branch_toggle+0x168/0x188 (P)
    clk_branch2_enable+0x24/0x38
    clk_core_enable+0x7c/0x300
    clk_enable+0x34/0x60
    s5kjn1_power_on+0x110/0x160
    __rpm_callback+0x50/0x1b0
    rpm_callback+0x7c/0x90
    rpm_resume+0x518/0x758

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-milos.c    | 1 +
 drivers/clk/qcom/camcc-sm8450.c   | 1 +
 drivers/clk/qcom/camcc-sm8550.c   | 1 +
 drivers/clk/qcom/camcc-sm8650.c   | 1 +
 drivers/clk/qcom/camcc-sm8750.c   | 1 +
 drivers/clk/qcom/camcc-x1e80100.c | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 0077c9c9249f..15d432859843 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -2132,6 +2132,7 @@ static const struct qcom_cc_desc cam_cc_milos_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_milos_resets),
 	.gdscs = cam_cc_milos_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_milos_gdscs),
+	.cc_gdsc = &cam_cc_camss_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_milos_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index ef8cf54d0eed..ce2d8c8a57ac 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -3045,6 +3045,7 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8450_resets),
 	.gdscs = cam_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8450_gdscs),
+	.cc_gdsc = &titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8450_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index b8ece8a57a8a..ae40979b2f12 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3545,6 +3545,7 @@ static const struct qcom_cc_desc cam_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8550_resets),
 	.gdscs = cam_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8550_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8550_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index 8b388904f56f..c38dd23430fb 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -3563,6 +3563,7 @@ static const struct qcom_cc_desc cam_cc_sm8650_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8650_resets),
 	.gdscs = cam_cc_sm8650_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8650_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8650_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index a797b783d4a9..969c2c80065f 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2681,6 +2681,7 @@ static const struct qcom_cc_desc cam_cc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8750_resets),
 	.gdscs = cam_cc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8750_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8750_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index cbcc1c9fcb34..32169879990a 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2462,6 +2462,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
 	.gdscs = cam_cc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_x1e80100_driver_data,
 };
-- 
2.49.0


