Return-Path: <linux-arm-msm+bounces-73368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF0B552E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371745C3441
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B600432F770;
	Fri, 12 Sep 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VjAiS8Xg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C297832F757
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689875; cv=none; b=WSZJNF8N7tWStVUzQM23QIilYFzyjCd4AblziHEHGTpeiXAwOI50OjiZeyzqvdgPiSHxb+V5ZjBAMfPhMIuUN6HurlEAUBCThBUvTnjb1FTVZrJ3R74qWIluNuYCLCjr+1Ve69V075lBI5T0ZgXT25wx/QkfZMuXC4WY8pb3lZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689875; c=relaxed/simple;
	bh=SaxLNwPjG7byVt6l+p6cg0if9w4/pkHze4tv4MutSeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twafjJyjDnUnAF3JFdP3zCLiCxo8enuDIVVA8olCU+PNiC9GQSbmkXqhX6S+pp3Ll+fxBPfyNJhx3th1GbeCvJ2k+YaMecEHpHg0dPQhi+gUzum5wnpMdaMSMtvZ5jCy3Q8cQcv2Yzr/0eQbCSRHfUSU/WJLa4AKChpMwcXWvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VjAiS8Xg; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d60504bf8so19154167b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689873; x=1758294673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=;
        b=VjAiS8XgtXdzKrUmMwBmLiNbs2EgyM6GmNxbpZai9EZhieVl9fu/1Lp4nbNLwhvzQP
         8wpPed/SEK5/wi4s35QCMhrNkKEf10JMs8CtILbmBESRW3ZP/etDBFt96wyMychc1chG
         LcNRs6mLqth8+U9L6omrCfSmW8im4VbBEmJ6MMRLry8tpYVlbhRWTxEq7LPyjHELgiw5
         QRzsqRBxeqV3e8otKZ9yXyOD3u8wAynvR1NKs5e84W5emwdpMIGepeUzlrRa/PmIBtR1
         ExuSg/Tt3vScbYc6rEbzRSa8Mh4Me1W17/K4p7HAaaILzo0WrdPPG/tKMKEF6/rhqLCx
         SX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689873; x=1758294673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=;
        b=XPw4Y0go8J4q+f/lrP6XkL5b76tfWGD7svojiqn3H7lxx5n/FRiIINqoCK/Usj9W5T
         gajNFeKspaaT69oD30e+XPSKh8HbUoZVi3hmilC/KbVzK5WQhSnog4q70C3Q+cht5oxh
         t+7SLDS8rqje/2VO1ikawo2xgoIBLF9L7DSn1Q/8RcacZSgvS6jF4xrKnoVgd5XtwueI
         UA9SYo1fzQMHu5VK4LbLu0jCD4z/ABH+Kft2m7LLPKsGGsjfZTnc3HqYg/sgFXgmAw32
         /kmcTqxloyoCeTKkN1BeAGwNT493bZrLc9nnx1C7v9S+epypWqydLgVoOOkSY15Zo19J
         9BkA==
X-Gm-Message-State: AOJu0YwyKPcikD50wa8EmsHAwKOAqkDI5TwSJgqDZVPMUaxopTBGuvYP
	/OjRcu9GnmMXoiYbOu8utOnICCOeTY+h0Ry71og/BQ2t0CzWpdUyGu2VA1BjX1t51jfNAfnO+OB
	jM73YjB/dig==
X-Gm-Gg: ASbGncuJKnWxW3R4+WxkdYXWUDw945WvjsMHOFUs03D+35B9YNRih7Mr5zUyFHmwKES
	oCoXOhZvBOzfxcNv+CHErUl8T+reHO/+N+OfIWwrTMUCtoRk/jB/HhRD3Y0Hd37ntT8H1HAXvkq
	b/ioe7eziu2cgjhkHbyBAy2natqlO0FOefIAt3W2ERPxcBEYMLljZGeUG+Qx3IyXLW0XnUePiiv
	l4Gudimr9ogiM3pl7TX8ejSPwX4tYTSwbUyhe/3UA+0TZyT6FLFXFoTqta7NFoeCuNc2INlVG0S
	Q4gC2WZ8M2qupcOb+Az6dL3ConPlffSZIgfV7ZcvlP9SDUKUxFMKN+xF4c+gFQ20/4PrYpaT9b6
	RmJGdl/m1xLydocYC+HtNIW/s+VC0zTxQCA==
X-Google-Smtp-Source: AGHT+IEpiP8vlE6JAkelU9ryV0aqgK+NNUoCmR9E9pT/XsbUls6aw+6SDhLPMx2e7d1wIx+kCxhExw==
X-Received: by 2002:a05:690c:4a0a:b0:71c:1754:2696 with SMTP id 00721157ae682-730659ba7ecmr33141997b3.36.1757689872581;
        Fri, 12 Sep 2025 08:11:12 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:11:12 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 16/16] dt-bindings: Add Google Kinfo
Date: Fri, 12 Sep 2025 18:08:55 +0300
Message-ID: <20250912150855.2901211-17-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Google Kinfo kmemdump backend driver.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 .../bindings/misc/google,kinfo.yaml           | 36 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/google,kinfo.yaml

diff --git a/Documentation/devicetree/bindings/misc/google,kinfo.yaml b/Documentation/devicetree/bindings/misc/google,kinfo.yaml
new file mode 100644
index 000000000000..b1e4fac43586
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,kinfo.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo debug driver
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+
+description:
+  The Google Pixel Kinfo debug driver uses a supplied reserved memory area
+  to save debugging information on the running kernel.
+
+properties:
+  compatible:
+    items:
+      - const: google,kinfo
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the data
+
+required:
+  - compatible
+  - memory-region
+
+additionalProperties: true
+
+examples:
+  - |
+    debug-kinfo {
+        compatible = "google,debug-kinfo";
+        memory-region = <&debug_kinfo_reserved>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65d9e5db46a9..6a846c51db04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13821,6 +13821,7 @@ F:	mm/kmemdump/kmemdump_coreimage.c
 KMEMDUMP KINFO BACKEND DRIVER
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/misc/google,kinfo.yaml
 F:	mm/kmemdump/kinfo.c
 
 KMEMDUMP QCOM MINIDUMP BACKEND DRIVER
-- 
2.43.0


