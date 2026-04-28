Return-Path: <linux-arm-msm+bounces-105025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EFOIrDJ8GmfYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:52:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F434875AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F3A30D06F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCECE43D50E;
	Tue, 28 Apr 2026 14:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="m2/vRYhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18413FAE0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777387571; cv=none; b=V/1asjoVA5VoVX0mMWDx1HAxv/wQm0cPFDD6t2rvWPzADt+JQQOFm6/SAenfzOkarTus/GOuleuw04Z3xe5MAQf6tkf3YlxqJZWgX8tOUjma4JScg44AydibW0WKMvLC3CSdmAKAVfYUBS7zVjLAObQe3CPUW4xVaPAFr853FV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777387571; c=relaxed/simple;
	bh=f/dYGP07OBg9DiHyqQLx/Tm6yf1j3LG8UrwHVCI8ms0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X7zT1u6sqU/sZgYcILQoi0U1R26AnmQOENJEAijD/bR/zKZDxO6I8g4K+slC/xVGmwUZ8i5xBVA3cn7igf3VN68gtTdqUWyinGK5/aUeV0LjQNY9HQIWgK83m1Zxh8LjRy5JU261Q/8etT1Mu/3y0B0P+tXDrjC+nT55Nv+bDsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=m2/vRYhp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso100055955e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777387567; x=1777992367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qG2xEq+suvSHE4naeOi+PCYc+DbypH2YZR0qtvrl750=;
        b=m2/vRYhplab9vt81q+bAex6YJgrM/iTeTcw5rWxZtziVJLpR11Gp2aHPrmzP21jy1j
         pZEyycpXc1wxvNy8Eqvh++8d1c4St6M3SxcOEBJM6NY75cjdGDeXSP51sE4DzJ7Ovu4b
         XdEjJrsVl5Dgd3NVXInusze/1mjhxUl8PJB6shHWI6OIJ6WH2c7Su51Y7YLa2HOeOGog
         bWnS4/0EXCJ1tIntunEge8GT9os+Bx46HS0z6CGZhgGKqwuFWoucbd2hQ1DwCrgys5P+
         PsR5e45saOh2iqY5BuFrV9fR2kuMhMWo4Q6P22sEK5JqrN9FEpBRvA/HyVMZiu6vk0ek
         5v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777387567; x=1777992367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG2xEq+suvSHE4naeOi+PCYc+DbypH2YZR0qtvrl750=;
        b=l1jaeAgMMUsWfvyx8tXN+Gi1GlPboGeP6DNKyFCB41INPF3o0xCi7bLIgqpmDDgWQo
         exjYFKnZbkROVP4lHMEoJEntSCcfzJ6YGkrJB1ymibkm8K4ZCuQs8fUYLUbLEKsD0RQ9
         p3u4UvxkYOtM1it6Cip4QLAilzdNwvXb9X7r02vnPWx69JFDL1JHPptchdzgMrHuJsKO
         rPrLy60hnns/m2G2Y2pjyE2Tuf9M586yX50KJHN/ncmusUEwwhDaa5yON/3GVxM870IG
         uZSxShhp2RrmwLP0RTkZziZpez9L3d8EIRt3qFEMFV4RBbX2x7EenEUcIvoD0t7GD5mo
         hJdA==
X-Forwarded-Encrypted: i=1; AFNElJ9BGmqAAY/HGDVvTzbo5x4HXE1mi7IK5/pgXh/y5h1U8fjmnAb7NtmAqqdrIglv3QqNarVf98197o7+R1q+@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqF7r1s6iyNrGPQUtWR85eSY382eC26RCPIJdnEI7GGmKn6QK
	TcZUZZY4DvTf2c//Qfw2rn3MlHHZGerP6lLe7GpGz+d6GzZGLnA0UA2LifpaPu0TZTM=
X-Gm-Gg: AeBDietsYpfKwhRulli+rOdqM2pJ2MecW4eJisFmjtAoLga2iymfrSBeRcEj8kmK9EJ
	QL/e/I4D0C0MDrJ/4Ard8G0KRcvDES64hZVgBYdRwuEbuwrEXnAtDLOxt7OEeVFDuUM1sRDci3J
	q5FtkGZlYk/q7ujtYPkX0f7E0PxTRNf+uHoBxA8uIbfFRx9R6xK+Uy/SkH2Hl1TdEtQ3tulCRC0
	DU5rtTDWl/R+d+SQD3xK6dAHrhxdE2N3NnQ+fk+RaknMYwhQA3SunG0yECA7EXcM33PgetlCpjJ
	1T01G0ANeLzJxshAAaTjNDIdNozvHxKSl63jOBEa28YCiVsrsQFJs4cHlQV72plOojQdxfnB1DK
	gn+aOkL9HvCTW1VcnEa2BOk+VomEJfb/tsd2w+k6zXQVmzu5dU2CQxpmrQ+Gg95XFvOKgvYIHtc
	s9S3WsuPaYq/OyvZtR/Q9fO6CetVPGVi0pzSkHlAro+ibZqIfIJaqOsevL1d5M+uBKLTVzOv44O
	76X3sSyf/M3en4fxzsT0WIXYw==
X-Received: by 2002:a05:600c:8590:b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48a77b19b5emr38612635e9.21.1777387567055;
        Tue, 28 Apr 2026 07:46:07 -0700 (PDT)
Received: from localhost (p200300f65f114e083adbfb3674088b9a.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:3adb:fb36:7408:8b9a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a775f56fcsm22197915e9.25.2026.04.28.07.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:46:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Don't use UTS_RELEASE directly
Date: Tue, 28 Apr 2026 16:45:53 +0200
Message-ID: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=f/dYGP07OBg9DiHyqQLx/Tm6yf1j3LG8UrwHVCI8ms0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhswPJ5Q+HL7Ty3Ps4TXJJ/8TctzLpjKnzthXfTTkh8fMG fdelVRKdTIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwET5+9v+eXXtzPpbev5dm yy1691LNyRrFyaWioi+Lty3141+e/i7PpWTqppVnuM/3P0u9fzKpoNktwkqy4/6BkznPUuae4XI QfXj09r75oY17gl8dujCv2u2X0LKXenLlhmKWGkfdFwsvPPDjyeSjf7Rjtxzrb4jm1M+YqJ292v PzkpPvBbx1v6dWZAaXKIb+Epl3UiDXQFtovcLnbVrVwdlxObIOETOKGyZWayked8jQ0Dj8b/bbs kOfLqSxVxbLKGb2uMoqZsnphsj0lEYK5NxzY9+uKhjBdfzggTrFrqqvJf2mLUFZKuvf//LLDVVs ktL5ppndl+2aGNzb49hb0GPWV9Orw/o59th/ro3Tz94DAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D7F434875AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.intel.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105025-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,linux.dev,gmail.com,poorly.run,somainline.org,kernel.org,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20251104.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

UTS_RELEASE evaluates to a static string and changes quite easily (e.g.
uncommitted changes in the source tree or new commits). So when checking
if a patch introduces changes to the resulting binary each usage of
UTS_RELEASE is source of annoyance.

Instead of using UTS_RELEASE directly use init_utsname()->release which
evaluates to the same string but with that a change of UTS_RELEASE
doesn't affect msm_disp_snapshot_util.o or msm_gpu.o.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 4 ++--
 drivers/gpu/drm/msm/msm_gpu.c                     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 427d3ee2b833..c6eda3cf2e62 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -5,7 +5,7 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
-#include <generated/utsrelease.h>
+#include <linux/utsname.h>
 
 #include "msm_disp_snapshot.h"
 
@@ -79,7 +79,7 @@ void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 	}
 
 	drm_printf(p, "---\n");
-	drm_printf(p, "kernel: " UTS_RELEASE "\n");
+	drm_printf(p, "kernel: %s\n", init_utsname()->release);
 	drm_printf(p, "module: " KBUILD_MODNAME "\n");
 	drm_printf(p, "dpu devcoredump\n");
 	drm_printf(p, "time: %ptSp\n", &state->time);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 930e54d1b0a7..3f3925b11eea 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -13,11 +13,11 @@
 #include "msm_gpu_trace.h"
 //#include "adreno/adreno_gpu.h"
 
-#include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 #include <linux/sched/mm.h>
+#include <linux/utsname.h>
 
 /*
  * Power Management:
@@ -196,7 +196,7 @@ static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 	p = drm_coredump_printer(&iter);
 
 	drm_printf(&p, "---\n");
-	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
+	drm_printf(&p, "kernel: %s\n", init_utsname()->release);
 	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
 	drm_printf(&p, "time: %ptSp\n", &state->time);
 	if (state->comm)

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


