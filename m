Return-Path: <linux-arm-msm+bounces-32281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A569844BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A3991F267EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E140B1AB6C2;
	Tue, 24 Sep 2024 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIwuqa/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259881AB528;
	Tue, 24 Sep 2024 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177452; cv=none; b=ZlEVKObVxc1Lsru+mnGP7rESKlpLXGqc7n1CFONdCxcEv8HqGGzOz0GcgwINDh03nYE2IifwlCLLJRFhvOyBPsk+j4ZgUpNVElzqhe+D2JkOmc1HXB2et1q+s34uUJ2LHn99HPsBNmH2CVdguv6kl84Zd0WD4s+zWZHsPINekTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177452; c=relaxed/simple;
	bh=+/10yM8zg55qjZOGGUuysVO4iKnvZxJ8Izq/9aSEglE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrR6ExrjqaqFeTgAWSVB6jOymPl23OY4PAxkaaCJi7gzCMJFSHOG8hRN9dV438Y1wWpzXCaPdUiixxQI+RLIT/nlJQo2lHCTWfFVkQzz0GRQg3zySzbxKy3VQvXI00IV/b54MWLV3CksxhHFBx4NIpfmlFC0QnbsEQZxgMI2wEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIwuqa/o; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso901647266b.0;
        Tue, 24 Sep 2024 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177449; x=1727782249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
        b=iIwuqa/oDkZg3P0KRHwwqNuDHXLY51+HHWDAtGFDPh15EXQEl7Xqb3a3oCuuvM8+O1
         2iRVx1p/05ZxfsHVZZIl0uP9K1xxRxPoqn5NARYvIZ1PhGAb6+QFOfaZXU5KCRkxeysl
         +qFJZEY6udJnrdt92W+DYrF2o9pc0Z6NzPuZLpuqU0i09AbAhiPIrjYvHzrlLpq5YNu6
         s7lKWKMbGrDtXQL9+g85wslVozbWmcX1ZznyfoVuGGGj1FcaTHnggwAGXNepY9E2Wl+M
         +q+Pv8S78U3UJINhs4AHb+PzPS/drc3WctWquhYSEGLjCr63U3/VkiKG7+ximn0kLW5I
         N73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177449; x=1727782249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
        b=jEI/otZ/ccsV0GEEmqCeTpHccq6x4MZ0jJXEeipuItn3cvYhk/s3iHBNc8RhIImHmI
         iCC3WYrfmDjMg42n9grLNoA8veekbVZdMezZ6u44ZwXjPFOl7dE85PCjMysBWnDGLQvs
         hJmYIrf2F9FwRv7DQstpD1ki3uilHjoiUl5c40RSU98QyK+cUzGnv0CUShAz9buUiBT0
         t3INKaJlZI5MVSZHLtHBGL5UUV5xV94G2bhaO8ZOi32Q1Cb2i0pDMKk9hXp1pNYuukT0
         wCaDV5q6rKM03SsLAQQIAMmVRdLnOPl6kC3joQhWtOCjh3oDMoQyY9Ci443DgoguBhgG
         WfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZeyTr2c1lrSdKFS90r5oxoU5+1EGgx+mh2nvERfpb6imOO1vqlRpDemj4YGH0Zguz8SjOSObUHQM=@vger.kernel.org, AJvYcCWlykJRPkN7yyrPmQdU5TLK/ZzTFvampshLlrI2d++A6GEOacFoJ7EzuKG52fZTRP/ZsyiqhplH9ZNqqmH7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj3DafOaw2J8SPsuU8HdTHsZCNYObyKd487mQvLn5F18/pvYZy
	LE2XNy2XXxVO8pMLvbUJQCOMyyKGfppuFwBZfoYbB5bX1tQwwOILU+AQzlv+
X-Google-Smtp-Source: AGHT+IErz9hD3HXcUZ8zsEDBlbSHEiXxhi3ARFvXu7Oa/zUPkedKDRb+Z2DdU3o8WeitShdAYKIs4w==
X-Received: by 2002:a17:906:c103:b0:a7a:be06:d8eb with SMTP id a640c23a62f3a-a90d5152147mr1813051566b.53.1727177449502;
        Tue, 24 Sep 2024 04:30:49 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:49 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:41 +0200
Subject: [PATCH v5 06/11] drm/msm/A6xx: Sync relevant adreno_pm4.xml
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-6-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=4033;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=+/10yM8zg55qjZOGGUuysVO4iKnvZxJ8Izq/9aSEglE=;
 b=aGLOObRVomwIrZzz/M89QJO0d+zNY0xCMeTM6HojEggtQw3SR2iF3NGT9x8vwrUUtcHSM3X/p
 K8kOV3FoEsdCnJnQKiWJO5/PFNv67OkMc8CvBfhiKbK5unkj7Y+nkfS
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

In mesa CP_SET_CTXSWITCH_IB is renamed to CP_SET_AMBLE and some other
names are changed to match KGSL. Import those changes.

The changes have not been merged yet in mesa but are necessary for this
series.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    | 39 ++++++++++------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index cab01af55d22268ccf88f1a5032b6081d8e4e475..55a35182858ccac3292849faaf12727257e053c7 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -581,8 +581,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
                 and forcibly switch to the indicated context.
 	</doc>
 	<value name="CP_CONTEXT_SWITCH" value="0x54" variants="A6XX"/>
-	<!-- Note, kgsl calls this CP_SET_AMBLE: -->
-	<value name="CP_SET_CTXSWITCH_IB" value="0x55" variants="A6XX-"/>
+	<value name="CP_SET_AMBLE" value="0x55" variants="A6XX-"/>
 
 	<!--
 	Seems to always have the payload:
@@ -2013,42 +2012,38 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
-<domain name="CP_SET_CTXSWITCH_IB" width="32">
+<domain name="CP_SET_AMBLE" width="32">
 	<doc>
-                Used by the userspace driver to set various IB's which are
-                executed during context save/restore for handling
-                state that isn't restored by the
-                context switch routine itself.
-	</doc>
-	<enum name="ctxswitch_ib">
-		<value name="RESTORE_IB" value="0">
+                Used by the userspace and kernel drivers to set various IB's
+                which are executed during context save/restore for handling
+                state that isn't restored by the context switch routine itself.
+  </doc>
+	<enum name="amble_type">
+		<value name="PREAMBLE_AMBLE_TYPE" value="0">
 			<doc>Executed unconditionally when switching back to the context.</doc>
 		</value>
-		<value name="YIELD_RESTORE_IB" value="1">
+		<value name="BIN_PREAMBLE_AMBLE_TYPE" value="1">
                         <doc>
 				Executed when switching back after switching
 				away during execution of
-				a CP_SET_MARKER packet with RM6_YIELD as the
-				payload *and* the normal save routine was
-				bypassed for a shorter one. I think this is
-				connected to the "skipsaverestore" bit set by
-				the kernel when preempting.
+				a CP_SET_MARKER packet with RM6_BIN_RENDER_END as the
+				payload *and* skipsaverestore is set. This is
+				expected to restore static register values not
+				saved when skipsaverestore is set.
 			</doc>
 		</value>
-		<value name="SAVE_IB" value="2">
+		<value name="POSTAMBLE_AMBLE_TYPE" value="2">
                         <doc>
 				Executed when switching away from the context,
 				except for context switches initiated via
 				CP_YIELD.
                         </doc>
 		</value>
-		<value name="RB_SAVE_IB" value="3">
+		<value name="KMD_AMBLE_TYPE" value="3">
 			<doc>
 				This can only be set by the RB (i.e. the kernel)
 				and executes with protected mode off, but
-				is otherwise similar to SAVE_IB.
-
-				Note, kgsl calls this CP_KMD_AMBLE_TYPE
+				is otherwise similar to POSTAMBLE_AMBLE_TYPE.
 			</doc>
 		</value>
 	</enum>
@@ -2060,7 +2055,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 	<reg32 offset="2" name="2">
 		<bitfield name="DWORDS" low="0" high="19" type="uint"/>
-		<bitfield name="TYPE" low="20" high="21" type="ctxswitch_ib"/>
+		<bitfield name="TYPE" low="20" high="21" type="amble_type"/>
 	</reg32>
 </domain>
 

-- 
2.46.1


