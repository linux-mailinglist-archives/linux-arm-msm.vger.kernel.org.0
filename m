Return-Path: <linux-arm-msm+bounces-16913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08289DC1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8177283320
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 14:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAF712FB3E;
	Tue,  9 Apr 2024 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8qTELx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947DD12FF63
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672579; cv=none; b=H4SUU2uhVMjyLVYSR6PzIVhx0LKnl2siZNIodfF7rIIcqcDt1H/c2QzZyExnnkSqxl27FzDXY2PS3WsDzUnyijhVBLRTaIIwLsLLKF4g1K3zhQge2IwQH/27OkQm/nTgfzf8uyDLw2vbNmy+IYupDzgyqz+1ujJYfxN8NL5Vim4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672579; c=relaxed/simple;
	bh=hIUzrBVsS/dxIln26cfNIzfBzOzmPDPyttogBq3LOxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MsBx8jWdlPrUGJEM4N8JhIiyDDnB+lwImpUo/EPqK40ugseqKhn3T8munn2gGnyKufavn/gcbeffvP1iJVhlv5E2VU7cNYOwdJIrM9W8tWhWy8GR7kkhmdozCPg51eMXz6DuX56nQbI0x/xtnEatUWe0UnEmBYgd+FLQgqgWTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8qTELx1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516ab4b3251so6362845e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712672576; x=1713277376; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGvZnm0yehCs3OtUKInch3AqosyI0xgf+74PLDfaunY=;
        b=f8qTELx1liKE3aIKitM5S9UNyJv5YrFqVU3kcFthFPOVLQDIMtQFAZ8Zz7j3N/27ZB
         xIffDdbjAm0JVNBaoakF76DOnhnHKTTRU9RKbwXWuJozzh4QfMHSghwZ13lwbG7N+4ry
         8jJ2g6V5Aubj9z275eQQmC9OGBV7B7uxc3eijz2K3mV27K7836AQ66Zs77TOBIR1qKWX
         L7FV54icLdEchjY93RNp+NRcChvjb8CHw3Mr/DZ8aBNx8Iuz//Go+9cHs+zFDoPQ4eKG
         3HMSbF2d0I1YCh6KrHRYVMc1vs4XuZldKVCsksxa+/RCVjbuVa+7Vs1Yrx0PT2GvlivN
         8MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672576; x=1713277376;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGvZnm0yehCs3OtUKInch3AqosyI0xgf+74PLDfaunY=;
        b=vzbqx1mEpBcVeFXpAv6cUuqdqYElwC3ixa72CBUuLZh4vojEKEFjm8avTc8mMdtQBK
         e7ezTxo63Mm5YiL3p2ycHXYyHiCDO6GqQhcZ743oLQvDTNQygiKpE1qBFLZ872hkGorS
         0Ywf4FMTNtWdvK4C3ENV9JhtFS/sfVCR+z/fXW2rVYsDat6jsKBlcHaFRYmt5J4+Mh2N
         QFUAz8vHaqIzNp22KlYRAsG60v5Kf9rfv/morCL4VKzV9cMK3XQwMxmlaRKk2d/d9lSu
         4dfP6TXO3PRQ+2QqpS0mN/BQE4Zz4+C8B0GTeexT+fehZreeavy42cxQ5ayuuqsRPgkd
         gnaw==
X-Gm-Message-State: AOJu0Ywd/9iTkQE7Ck9vkieonEQY6vbbVWWMxJjiuk+XkX03d8r+q+AX
	h3RqIjtvYgGe2NkDlH8wtzAgZTaew0SdyjgDXfdYjF7UUozByEUpvXv061e5rIgNDlnrdJzbQDN
	l
X-Google-Smtp-Source: AGHT+IEYMV2d+W/LgC9LK9e7WSDupcFG+kxxW5Z93WmgAX/1oR83muZqP+jxNE+cXxyA7sTTt7+f2A==
X-Received: by 2002:a05:6512:128b:b0:516:c5a9:eded with SMTP id u11-20020a056512128b00b00516c5a9ededmr10297697lfs.42.1712672575593;
        Tue, 09 Apr 2024 07:22:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o6-20020ac24e86000000b00516cbd3e982sm1563744lfr.178.2024.04.09.07.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:22:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 17:22:54 +0300
Subject: [PATCH] drm/msm/gen_header: allow skipping the validation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-fd-fix-lxml-v1-1-e5c300d6c1c8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAD1PFWYC/x2MQQqAIBAAvyJ7bsFEBPtKdAhda8EsFEIQ/550H
 IaZBoUyU4FFNMj0cuE7DZgnAe7c00HIfjAoqbTU0mLwGLhirFdEIueM1TYYTTCKJ9Nw/23dev8
 AuTeBe10AAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hIUzrBVsS/dxIln26cfNIzfBzOzmPDPyttogBq3LOxo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFU8+GBbXPlk+8WqR1aY9qFNl+S6iJzsUN/i6R
 HKxXKumK5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVPPgAKCRCLPIo+Aiko
 1QXjB/wMZyXobBJWAPjTfa7TE6QNsiK2htoOmf3k+BCtFuiZexby2TCyzl703fuNrK06oNmBLio
 CdoKmX86ffHVbMb+G0s8CJxMQSwk1JwKgWWPNg32cYyYinqLrCEnf1R7ohdnGM5LytyOYCgt2e+
 uUG5z4vfP4bLlJIrejllXufSUHq+NTz0Dn9Qyb0sGRsSYzss/qIiJdLhP9ZQI9i+LJN/1pdobVt
 2UtYYNi0z/VwsP2iTajkF75kfZ92zJGvaVS0qcVwAtXG4ZKJUeI3H7/4Z8Hm5s4zeH8Z9hg7Kz8
 Ey6V7ot6RPwiOYxLXr5hyurtxinGSUum0yu2+t3BarfbTSEr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We don't need to run the validation of the XML files if we are just
compiling the kernel. Skip the validation unless the user enables
corresponding Kconfig option. This removes a warning from gen_header.py
about lxml being not installed.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20240409120108.2303d0bd@canb.auug.org.au/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig                 |  8 ++++++++
 drivers/gpu/drm/msm/Makefile                |  9 ++++++++-
 drivers/gpu/drm/msm/registers/gen_header.py | 14 +++++++++++---
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f202f26adab2..4c9bf237d4a2 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -54,6 +54,14 @@ config DRM_MSM_GPU_SUDO
 	  Only use this if you are a driver developer.  This should *not*
 	  be enabled for production kernels.  If unsure, say N.
 
+config DRM_MSM_VALIDATE_XML
+	bool "Validate XML register files against schema"
+	depends on DRM_MSM && EXPERT
+	depends on $(success,$(PYTHON3) -c "import lxml")
+	help
+	  Validate XML files with register definitions against rules-fd schema.
+	  This option is mostly targeting DRM MSM developers. If unsure, say N.
+
 config DRM_MSM_MDSS
 	bool
 	depends on DRM_MSM
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index c861de58286c..718968717ad5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -156,8 +156,15 @@ msm-y += $(adreno-y) $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
 
+ifeq (y,$(CONFIG_DRM_MSM_VALIDATE_XML))
+	headergen-opts += --validate
+else
+	headergen-opts += --no-validate
+endif
+
 quiet_cmd_headergen = GENHDR  $@
-      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
+      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py \
+		      $(headergen-opts) --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
 
 $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
 		$(src)/registers/adreno/adreno_common.xml \
diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 9b2842d4a354..192123cf7976 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -538,6 +538,9 @@ class Parser(object):
 		self.variants.add(reg.domain)
 
 	def do_validate(self, schemafile):
+		if self.validate == False:
+			return
+
 		try:
 			from lxml import etree
 
@@ -567,7 +570,10 @@ class Parser(object):
 			if not xmlschema.validate(xml_doc):
 				error_str = str(xmlschema.error_log.filter_from_errors()[0])
 				raise self.error("Schema validation failed for: " + filename + "\n" + error_str)
-		except ImportError:
+		except ImportError as e:
+			if self.validate:
+				raise e
+
 			print("lxml not found, skipping validation", file=sys.stderr)
 
 	def do_parse(self, filename):
@@ -586,9 +592,10 @@ class Parser(object):
 		self.stack.pop()
 		file.close()
 
-	def parse(self, rnn_path, filename):
+	def parse(self, rnn_path, filename, validate):
 		self.path = rnn_path
 		self.stack = []
+		self.validate = validate
 		self.do_parse(filename)
 
 	def parse_reg(self, attrs, bit_size):
@@ -853,7 +860,7 @@ def dump_c(args, guard, func):
 	p = Parser()
 
 	try:
-		p.parse(args.rnn, args.xml)
+		p.parse(args.rnn, args.xml, args.validate)
 	except Error as e:
 		print(e, file=sys.stderr)
 		exit(1)
@@ -941,6 +948,7 @@ def main():
 	parser = argparse.ArgumentParser()
 	parser.add_argument('--rnn', type=str, required=True)
 	parser.add_argument('--xml', type=str, required=True)
+	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
 
 	subparsers = parser.add_subparsers(required=True)
 

---
base-commit: ab556156cafa24ec7de9e89bc18fa15637c21a59
change-id: 20240409-fd-fix-lxml-eecc6949f64e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


