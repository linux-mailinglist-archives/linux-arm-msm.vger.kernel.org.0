Return-Path: <linux-arm-msm+bounces-97055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4II4Hlm3sWl0EwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:41:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA5268C03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FE6C312B7C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BD73EAC84;
	Wed, 11 Mar 2026 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9RkZO3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51235D5F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254398; cv=none; b=PJb5a2RLOVTbQx6H0TFUta8J6TXjCkW26QEcRNPyWQouPO5Kw/Ozdpwl/HN9w9TPkv6HGCarqKUGChq4dEpsbjWE/pQwCj4CASgQfcRDM0nDar6AmLcessLlnPYbAn6vLCbWv7FVul7lDyY6QHFL4A8BYZ3pKiorHm3puNM2Gxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254398; c=relaxed/simple;
	bh=lrGDoJIvEkpE2zwVZAdPXIJFuUAnlEGbHR8d+YDnzFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N414HOT1YJZTVp284lCpF8bQ7x/EbR/HafVvrPGMwesd5bYTwL4QMeCnbY6CsnATCOzWQ4lsPii3dwrrxKfFYJR2R6NZvtgngIR+j/Rxzs3+H/vMECFu2z0hGXkocWMw8vqolnIVf9tDHCoBoA9dlvosPkYSafFRo9+xzMVJwtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9RkZO3v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so1659245e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 11:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254394; x=1773859194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUyetPRGCWNiIDdvvCLAWBXfwDnSDbUudDfLRd5zU4g=;
        b=h9RkZO3vr78Pq8IWHVmTz2vzzyODAAbi7cjf5PGaJNfDNHQ5lAYOoph7PuKSlZrN0y
         kCI3wZLVMgdHCFQ4Lsl2Hl3ssk5bDyJwGFrif3zA+KD+ou+fd+qwtKwR4rug4oJOrdUW
         PjzBf1psgrmPqSS0nF1EtVy+D480iRbYAMEstsT+323tNv06wrrDvEQCkMJpu6mHw3jo
         7I7klp1yFa08gbomItuicuKcVOcDT5fsGm9CS5brTTC2Xd5Kxeh5qXWhPzXujwRMf3r+
         EEEnC64JBvxSfNc/GBr1TeVFEGujpzC0DmmhwIWMwI3n1gzA/08IehEblVbwYW5+mieQ
         GunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254394; x=1773859194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUyetPRGCWNiIDdvvCLAWBXfwDnSDbUudDfLRd5zU4g=;
        b=D867y5+1hIfItMu4GEr1eGl+7HiQ0S6FTAPs646SWdzZDvnIoK0xhTeX/ceORrTaeA
         cDB1+c/WYd1oDOI+kBz2U1uwy/PH77aaHYGhFh2Tqqvjb3zt6k3YcSNQoYHvHtAH9R/A
         cBiSCvZ5xg0ClOyqI9ZArQL8czq+eWLSVq+zPP1nIcHYU+BcBAkvKu31xFLaasWuXbvY
         f7H3T9vVTrA7e79IhOeqgl/wRGzghgyr8tT2HalQ63DUzwyBPMHKrJFBqXss4WxdAz8t
         6vmIchbdUiOja9e+Nvn4GNDXi222PzuN7UZzsH5FHHan6N05jpt+MaPUN3pnyZu28E3U
         PPfw==
X-Forwarded-Encrypted: i=1; AJvYcCUd4TdF9BtBbkK3bvcbSvHsedbOUxGFURHGYaUxvSmdSWGhd5v6aViLXJB3YFxT3oB6S40MIXruUwN+9nLv@vger.kernel.org
X-Gm-Message-State: AOJu0YyDosDO/sS+2o3Tz5KuIzOnsJLG9aVOZsy8QKchub9CtzxV9mCh
	wCz2gusBY6GCmVobgUGWhG2hWqJ4/qkRHCenCndWI+0N+4wcWW//DjAq
X-Gm-Gg: ATEYQzwi/QVbA/7RL3pu8eHdS8Wc9fWYfYSwRxO490kYD1Bc8ysUNE/NOg9tsT0TOf1
	JFkRzhJm458mRbHMrxk1IaPD0VHc0mp4MDOxPHVq+47S678fOqEYmPER0nTZTNHn5WXkQWOvXM/
	qKsJhTb9N/JbcI+15JRSlyc8qjc+dCzGpL/sGm0cYuZJTuMaeeuL5z6XQOnzM11Yq0zuL7vd6Vm
	pydKQGi9GysmgySYW+VDhv2ylzKEEWn6VbC2r5FaWfN2ImjXi0RtN9f4W4yHPuoPkKGixkGG1B+
	+f2ZAQu46h0PpIvx4e0jnweiuV0W1GjD/hXvPVFzcy8rHoUbuI3wm1Z7YNmv9ySNOSgH7RXvQrV
	uF5N4OPZ4WGzu/1R5KK3KOjPUi6XJI2VdfwKCjyhO712fIZO7cVzKt5mH96zUItsjD34Wz/NBnv
	kKBUVzdCLE0alpWgL4kpf0E7BrlHjUXMX4w3Y814eUJVPQVaElScnMmcc=
X-Received: by 2002:a05:600c:3b1a:b0:485:34b3:8585 with SMTP id 5b1f17b1804b1-4854b0d6ca4mr69627935e9.8.1773254393880;
        Wed, 11 Mar 2026 11:39:53 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
Date: Wed, 11 Mar 2026 19:39:38 +0100
Message-ID: <20260311183942.10134-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311183942.10134-1-ansuelsmth@gmail.com>
References: <20260311183942.10134-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[phrozen.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97055-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phrozen.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21DA5268C03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: John Crispin <john@phrozen.org>

The CMN PLL block in the IPQ6018 SoC takes 48 MHz as the reference
input clock. Its output clocks are the bias_pll_cc_clk (300 MHz) and
bias_pll_nss_noc_clk (416.5 MHz) clocks used by the networking
subsystem.

Add the related compatible for IPQ6018 to the ipq9574-cmn-pll
generic schema.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml      |  1 +
 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index 817d51135fbf..3827cb9fdff3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - qcom,ipq5018-cmn-pll
       - qcom,ipq5424-cmn-pll
+      - qcom,ipq6018-cmn-pll
       - qcom,ipq9574-cmn-pll
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
new file mode 100644
index 000000000000..28d325beb073
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ6018_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ6018_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ6018_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ6018. */
+#define IPQ6018_BIAS_PLL_CC_CLK			1
+#define IPQ6018_BIAS_PLL_NSS_NOC_CLK		2
+#endif
-- 
2.53.0


