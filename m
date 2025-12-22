Return-Path: <linux-arm-msm+bounces-86141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C4CD50ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75ED7300CAD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC5532C31E;
	Mon, 22 Dec 2025 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7o7n3y+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180932BF46
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391943; cv=none; b=fzPGXv/s0Ww1HlDSg7x6r+nC4CJUzq//rNppMWH68jyQIIp9pbmVrZB27h9QAxa7mQi8PohyIipWIs3eVPlum27apT7ON8+Lh3ZJ173D/uUH7pypFabUFEY2RF9f8gVzZg61/2muzpHRauve9KX/CkaF0JR9u9fsjSQ8kuZsZ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391943; c=relaxed/simple;
	bh=ZBKwFw/eHYoONtVKVezRTboDnUoeSjSt8KmXn5wFi9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puA6WWBId2OW55r0EiWD4im5gy/lj87RCGwaIgVqRrqgbo5u2QuIhvsIdtInNPE/hXPoYhvqgn1xPCU0hNV9UW1Kq89l39WGRED58ZNVs9KL4IoX4UgmfROmAbGE75NQ6EvHAsk2scosc0WOtFTCLnfEJWVfxf7umUf2S7NlcnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7o7n3y+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a12ed4d205so31658305ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391941; x=1766996741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=K7o7n3y+5E+dmFQ1NebpkmhMGdpKGcGkUyoe+Z+/F7l6WIJivmbBubZHfiZQSGhL0c
         9s04DOiGCFazGYOvHF1JQZ23INDj/op+OoSvgPYK9QYQGm/3lTa/ldNAg3HZMRXnwCBo
         N8zICLpD7TCII6ys+QZBQUMPEpWjDOLmUBp5GK8yOPeaNDxR82y/y5lO3xuddeD8+DA7
         moKV7icVpcFa9SoiZh7/zXmenATW2PCcQc3Y0t3iVBZDrNcOUsgWaavxa3d1llbq1ohG
         1y64UgWW5bmsMD2VzBVg0T8WW4VxxO/GG0l1qJXi9QpAw12/hpPlmFjOUFHKRF2mwBP4
         Kl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391941; x=1766996741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=K5GScntFCe66Fb5PSe7BvKrnu+/y6n3sZ1OPNd9InZgxvSVouK1Kl9Ojo/SOg5VR/P
         MlvoQoImf5u7p0wP7B6QsEVu9Y+TZyCrME2h7r5/w3HGVjNP8KzfRnlR7HMbNcUe4kwv
         qIO4agKEUOBDKNfnrJePyJ/Mqn3negdHXPd/NOLoAYPeA4GRuisuDBfSBi0DfFR+3Lz4
         rZoI0M1wLQ9VvKo1mzmx5ECCFYGTWNfSpjOjbgQvd5b2tI0WYNtH8Zp9JGULH1Vb+BiU
         /BTh4E0tyn+YgGAZkDDS1gqIVWEcCqLf/6KfmMzLtnoGSM7ENT1pBx/1KuaN9RWKsWRB
         En+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZy0zdkA/L2CAqlN9mS1uLP6kUHPe7QyZNIhjzpx1SM+KYMFra8F5D/sWujqUUV2jXWAx1MwuzyTT9jcb+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdx4sVVCX29RnjOvbqfewz5lig7H7pv+eIAYbuORLUZNq0G4Hi
	9d6T32sXjjowLUoofK6R3o+1zYUzlBr7yMb46c0el0ZuNFcwCeLUOh42
X-Gm-Gg: AY/fxX7bANN4KaODLFFNESw7dk3HzAZMevk79D1wHNFjFXOHhsMbGlB/X1x7LQtFdwi
	W0HnxwRC8LlwvETJSfco9EAUKVSkHWGkQ5HLLRQOFcvfIc+VGQ7rC2ZIY/T8cVFD6W/fNbKEuPh
	zJydmKZkGB7JGeYj8/f8hlKE6xpjHaT8y9n2kZnzpqbq8CGCMO19sW4qzr/CD/2XyEsUEoM4WHv
	l1Tlg4rbg9Dq8pfqln6NYXTgJWz0fw/Zwmi4zcsdJQDWKFcv/tCRjRVFy0c68mBSXOX1+DEDoaX
	5xljcLtSyWahotZ/C4tiD+L9upQVr21gn35qTEXeiBkIRAcJgkCiZ5NBUOhuGDhKBLBfa+9OiM7
	dam5UK/I46+GS18s/TWa0sVgxPry6QCiHP+jEo5/mq4VJ360q/Ui1kyoNIib4PjfOJbbSMkwEE3
	RxAPIkO46u
X-Google-Smtp-Source: AGHT+IFewFiHLSSMkteVB5+mJ427GMrWESNV1s0gzG1qZwVux0iZoGglO5KJ+zZHGWbOk0GOGu+BPQ==
X-Received: by 2002:a17:902:ea11:b0:290:91d2:9304 with SMTP id d9443c01a7336-2a2f22052f9mr107996865ad.4.1766391941481;
        Mon, 22 Dec 2025 00:25:41 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:25:40 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v7 24/31] dyndbg-test: change do_prints testpoint to accept a loopct
Date: Mon, 22 Dec 2025 21:20:41 +1300
Message-ID: <20251222082049.1782440-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b2bdfdfb6ba1..fa81177e8089 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,25 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +198,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.52.0


