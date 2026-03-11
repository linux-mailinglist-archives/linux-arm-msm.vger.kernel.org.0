Return-Path: <linux-arm-msm+bounces-97056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DnOFnC3sWl0EwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:41:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B7F268C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0305130514A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82063EB7F1;
	Wed, 11 Mar 2026 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii0BOMsu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472B3EAC72
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254402; cv=none; b=bokPjYvSQ/SMduJ44rYWVOygbEUtJ+AVePeuUS/BUDIeAcH+RfDxKur0ZpgAukZLESqNVTW524r8FWOZlpAKw0dV7m0Zm0Aow02zV72OSS021LcziQWOH4Or1FBtqKeALSTpFxbO6apCfS70bKhqAogM2z8JeDLYluktKLfpBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254402; c=relaxed/simple;
	bh=bOHPBQ0aYx6SAIc648QFt0cLdnRYKGWij10f0xB33bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFbAhD/ZuxAks7oh49zy0PESz/lxtS8oNoUZ8WoyP90y9v+BWMhPFClpjfKWCsSHmvbfu0nQE7J1Q0Rit88+tDe1RBjBRQnGJFFAc8YHJQ2XFPmCF3g7alfyi39k3BTIiz7CbJL0wiPxY6xaRTygqOd8nTWmZMYSAkvsqh44iV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii0BOMsu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48534e9076fso1621445e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254396; x=1773859196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bqQzzLIz4/2pIlQmC2M8z8Isqupt1gR0Wb/uv4yzLI=;
        b=Ii0BOMsu7NtOBIAA5wSp9HFI/TZucg/y7U8VjdPQueXY2WkMAZHFnDjv+VRCcQX91N
         jL+3waHpt7T/A9VN5rejpjbAnb4mF9zNZOrdJyp1nznuE7GKbN+LDBC6MSIoTJ7DtPY9
         fcPx/PS4RSGxXUZ2t7keUqc8wSGBRH7HJ/T4sApxdWQo2Ug4tfaudML/bKIo7/qySl/M
         8fl7VF4etMQ8jmwSdyTN8RrRoM5uqICOcpwgJRD/R35qg2o4/INZizp09k+rPE363I81
         v4pDCdZCk6kVi0TB/yC39eEzJBGVh3yex7xKzXFDmpMZiQ2o1zrx2UYbkXP6BVGz89XM
         rgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254396; x=1773859196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bqQzzLIz4/2pIlQmC2M8z8Isqupt1gR0Wb/uv4yzLI=;
        b=AIZY1Tnayt1kduMKoZ7VuRtT7CTSaIVUbo4oNEO38/IZTjje8qoTZL1K3i2gT070BV
         BUaufV3qv2vJikV/oz1PA2w1Ymm3uIbpoeEPq7/bF9rYsDkSqePhIY6eVidJ7QnT1BHg
         Jp+JP/fXDPvsQQVIXX2dX7eD8ZOPmnnPzLxo6Q/5fUXpmqK8kjlkuwTpbIke5FmRgTL5
         SC+c6VSBmh8g+m7I5Fmdm6XzE4MVolCyJvHmFBnY+rsnsldd2+uvx9aHjVJxqP2jVAl5
         XZFQRibwI+GRydxY6eK5ccfLbXfh3xHeKsQwaNtb/uMBusrOB/ErktDE7kR2TyS3GVnV
         SyLg==
X-Forwarded-Encrypted: i=1; AJvYcCX92PIwWalhnzTwKCKwoopTcFhXFITjj62ZrrUWuX7Gv8FRLKom6SA6bZinRVIaKprbUMqXcQ20WIG8dRUc@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLR8E1JqLhq+v4YikpWUUOdcFFtyt6vtSo9stuwOL5f4+N2Tr
	W9cbNsAdh78ntsva2fcbzB235nhSDmhQ0/6RXDkSBWKGz5il2dYmXjC0
X-Gm-Gg: ATEYQzyznjc1SzB5dQIy9NgYh/QsihoGHrUQld/41vR0W0az55CbSfkhvQlLYFLXXuz
	OkGQBqbZ9xC6wVHsYMFmEKalLkIYm6T00gGT7O0BAcXGU1dog6O+HVvF5vr/6A64iIqM7Opnx7R
	mmq8hKxTkoC/3bN+Hu4u2dLRLl6XCxlxqCnIgZMgerMTAZN3BNlDNOJJ7QtP1c5CGDiB7Qdwx9W
	idAV9daodEreeNOrO8Asj4GE3OYxbNIrlWlb5I6NljgSm0lG6VNLBy6UwhzN9h2l2cP/TluYpoX
	QslxYGtRPZwoN7WsQ1BUQgQ1yDxopEEeFZG7OH6P0+Ke+Jv90lagHeommc9yPhfNiiL5ZvjTuVe
	g135bXjYTv6sFSlq9jyrGnKfRdr5CGbOEmczfneHP4WB7klzu3alvuR6gThdTfYDgwyEP3D7Lgo
	TUzndqFAsfKCnv5t5MsD0rxGf/P3pilkSw7RuhPmGhu5irZLkAq3dNLRw=
X-Received: by 2002:a05:600c:8b38:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-4854b0be1b5mr64371825e9.12.1773254396189;
        Wed, 11 Mar 2026 11:39:56 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:55 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
Date: Wed, 11 Mar 2026 19:39:40 +0100
Message-ID: <20260311183942.10134-4-ansuelsmth@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[phrozen.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97056-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phrozen.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99B7F268C2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: John Crispin <john@phrozen.org>

The CMN PLL block in the IPQ8074 SoC takes 48 MHz as the reference
input clock. Its output clocks are the bias_pll_cc_clk (300 MHz) and
bias_pll_nss_noc_clk (416.5 MHz) clocks used by the networking
subsystem.

Add the related compatible for IPQ8074 to the ipq9574-cmn-pll
generic schema.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml      |  1 +
 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index 3827cb9fdff3..de338c05190f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,ipq5018-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq6018-cmn-pll
+      - qcom,ipq8074-cmn-pll
       - qcom,ipq9574-cmn-pll
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h
new file mode 100644
index 000000000000..354258a481c2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ8074_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ8074_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ8074_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ8074. */
+#define IPQ8074_BIAS_PLL_CC_CLK			1
+#define IPQ8074_BIAS_PLL_NSS_NOC_CLK		2
+#endif
-- 
2.53.0


