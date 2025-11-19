Return-Path: <linux-arm-msm+bounces-82557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 20562C6FDFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72802361A98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D30327BE7;
	Wed, 19 Nov 2025 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5VN9gtA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA93A1CF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567170; cv=none; b=WpydH+fpZ+igDtxMR+5IsweTRbVvapoid9CU24Zr8J5gDqRxIIL3sAIQUUFII9gyiKMxHDbXc+rDpUNEZIt/qCyIjB4YUeNFt15wKcoQ8KXQiiJGQChiqHKh22h5UTqkE8pUSERjUFb71YGSNSK1v1SsiRDzz2Xwhoq4DlQVETw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567170; c=relaxed/simple;
	bh=Vs8lQW7BawUxmkOmLvkVao/jUHVbMrAhKW0MzITmHHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INSR6ppy4VY6oed0zmceUCJlOoP4S3IltptIog9xynKLfORRgqiqUUA08O8y/S/gjpsCcMY8GCIbvpVMFPm70h/3nSLFlf8Xz3dFf1yFQCNyx/ESuCa0iizI4MghO/eyFI9TR/eWkgn7sxLvFQ9abbAKUhTqklVSCDSYqDjgiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5VN9gtA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b379cd896so3988138f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567161; x=1764171961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plmpXAswm1LBomkuKtBG6pEMvq3kPgWo3F0t41OaVKo=;
        b=s5VN9gtA7BI7QEVyZFA8bNSEEtzGadJpV0n75+YSnEQFbezbHy0V9//G5xZOOBKNy9
         w/dFXLVOJAGqEChl1FE9CuIi3WdPHYT0C7emqe3w5/eAxEPF4lTjCDpCOfPKuM1OxdxG
         VfxOhSXpLpyvUFKSe4R6FXxwFt3xjVEq8fpT8vy3fSk2d0ethXkqeMBhlLKM3gBYnspH
         /WaE3rgjBZi9tX1i2OjQR4fI8Ubqbk3BzV78jghkr3GTr/xiNPoZZNk1NgHpEXrLADPj
         o0K8GM49h6Vz7yGMKgEq8moU5p/xGZwKTyQFzpwXbiDxSIbrsvD/4tAX7dBJ0XU0jvrB
         JqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567161; x=1764171961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plmpXAswm1LBomkuKtBG6pEMvq3kPgWo3F0t41OaVKo=;
        b=MbMkcMDDTn5EXvYwHNCvbUd2tGCeES0vbHE3u2OuI54DOO4aftfj81ohQJHbgxIj9t
         JXCxKGqxlIcNeMiYtn8WQTXdazC6n/Yh+xAD2UEQ9NjWSH+o26ogif3jn0WtRl9Qs4fJ
         mkGQGdTsn2fpFnP8txvTOE1mp5Ig92O3d1nYThBPj6WWGgPiE8kSw1b2Lz/bWqvQsuFe
         5u7RMa8ZMxNMdVtZZExcBdV5Q3fMxJQFtQIc9q2I4UXYUsnQzJixconTTDAQTwreeeXq
         B0Q2r4inCWINSJIF25JQXfw+rar9fHJEGzyfkQylWqbM42dJ+bfsCnj+TN75t6I4Qx0g
         sZGw==
X-Gm-Message-State: AOJu0YzUZzriQGCJq9u9t9yIVgexZyuikSsFASg+gdxyPFtuXrziXokr
	w3Z0gw6CsYtOFcklfaKqCX3An708FI8k6gYnWb4BCkBCXBg+WcNwKdJfPv0qvspChT3duESViWg
	Egv+e4KYb7Q==
X-Gm-Gg: ASbGnctv1swvRAGO1n2h6knHuQtQ+QbS5xOdRmI9N078TsN0nNvHR/1iQh3gYt+EGSw
	y3Ie6XNBevnqvrVBWs/CqEKGBq7IMVB4kcIUE0QoT5Slb+hSnfKMtA75bsxsIag8w4MeDsOl4rB
	HH7LSNNMaiwWw9CT3ZPPkFu34bl8J3siTqPcemAP98NPl2k2kK16K+ogtEiouObQ9DsVZqAdReX
	/P3uVh7i+6CeFC8BVuesEOOFC3pzX9nYSsi/oBhJs3qzUE3o8zCAYe40IZ44ZJy6Y23K7efRqxK
	mm3XNFEemW2RuSgJcUik+N/+JFSKBIvvo+2mGLM1/7AA3IW5z9yWntbJXyrd99EqM825XUBZAVX
	8D8Evt+DbZ3kn0Uld+F1XEI1Wg92q09W1O4GDvFjcUinott8BqwHxEnK9T8SsJ/b0l/ybJxCvyW
	wdQEmhkK9ThWSEkVWyyd0Z/KQB3o3Q8fLCqC4vuOl5
X-Google-Smtp-Source: AGHT+IE/UWqNyS6htQwPVCsFX9f3Bqg52uzu0v0K2d2YIVRMOF1vqDQaElTCpee5ClbOZybd51PSbw==
X-Received: by 2002:a5d:5d0e:0:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42b595a4ffbmr19851079f8f.40.1763567160526;
        Wed, 19 Nov 2025 07:46:00 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:46:00 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 25/26] dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory
Date: Wed, 19 Nov 2025 17:44:26 +0200
Message-ID: <20251119154427.1033475-26-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Google Kinfo Pixel reserved memory area.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 .../reserved-memory/google,kinfo.yaml         | 49 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
new file mode 100644
index 000000000000..12d0b2815c02
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+
+description:
+  This binding describes the Google Pixel Kinfo reserved memory, a region
+  of reserved-memory used to store data for firmware/bootloader on the Pixel
+  platform. The data stored is debugging information on the running kernel.
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
+    reserved-memory {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      kinfo_region: smem@fa00000 {
+          reg = <0xfa00000 0x1000>;
+          no-map;
+      };
+    };
+
+    debug-kinfo {
+        compatible = "google,debug-kinfo";
+
+        memory-region = <&kinfo_region>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2cb2cc427c90..8034940d0b1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16164,6 +16164,11 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/google,kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
-- 
2.43.0


