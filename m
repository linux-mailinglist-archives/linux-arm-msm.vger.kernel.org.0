Return-Path: <linux-arm-msm+bounces-31908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D3397AF87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3C53B265EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373A817ADF9;
	Tue, 17 Sep 2024 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5jXNGTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D217A591;
	Tue, 17 Sep 2024 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571670; cv=none; b=lCWuanHZ91pmE3XIbpRuLd7F7/k676icUYAuRLNKqcb7JiNTGyGN7OWDEE+0did6qxPBdzMR4zdoKM3dv0RW3EKR9PFEgoioUGU+1HhF5fqUggx0iQ61NEhgHb0snM1FcbpemWUTwg1Iwl8L0MPFpMwTg1zS11c+Fv6cmzNrVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571670; c=relaxed/simple;
	bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqqL1F2wYfVaNTTsykNR07+bd+K9VGK31Ts9N/ZcOyZSM5JDeDkp0h8rCy0xo2lBiq1FI198IrnTqaINoM0L+0lXiw6pP850/3ITts9k1N1T7pa7yoIzQ0fyuePAxVsrUPT+HWvaiaAz6lytynMlmnox/PE0o2yJua+tzzkTS+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5jXNGTH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53654e2ed93so5939206e87.0;
        Tue, 17 Sep 2024 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571665; x=1727176465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
        b=D5jXNGTHHQA7c03gHdQ6xcz2irXg8YprH+tebbmiXbhZ9eQ0qc9eXQHlbzcSEL32Zb
         cXOTvauQoi/EBaHcEC3CGjESAT3R/JktRngvvAjMAQfifIBYJSCrK2yYN/Hz86ff1o44
         nxyr73LJ34+iGGq3lQO/s4iF7pM3gx5Al9UBKyaVZneCtgqoLh8EvI/Ew/Gw0dIuRWPG
         4z8IpWDccNVPtKTW4D6LnFsZCgpq7RffC7ZxOKAgL2kcVNPEHoNqEni2ickfEKQqJMCK
         A6QzHFaMud+PIiss+b55JGavBaBQGjRJz4PewNF/KO053fgCDiLTKMq/RqXnJHmPopUN
         hacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571665; x=1727176465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
        b=inWsEZ+oYF37X85XZbwPOE3ol2q8YJlFljhNc48wJZnOnvME3iM6/dHiBjrb6HyD3i
         XZZyJ1wQQAUVVkijEb8JpoWs8dXTdjxmdPJS3GAcVt/jtcnV2+bnMWH/YV0xNperzjlw
         cB/szWwyAktadno0YZxwT5VFnPeapURJIBE1GsowmYR+akUF8J20XSXuQMyc5tE0jRsJ
         mMSUQa88m/qZPwFX9S17Zw3oY/JiqYx4A0ZN6YiR43IS5zlJfnvxSpdkPY7PAWa7lXnG
         VpdJttzSsePm0iinFpS/W1atop571PL9GX/D2TurPr4T2ZwWnRLZps+gHxyJOVBwqeio
         am/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrM288MnoNEReSBagIsyqqBvTfABKuZcqYpCypyzQAEA9x1IWlUwQRFnUPyINUybKSmW4xM1ix3Fk=@vger.kernel.org, AJvYcCXpRoOfLu4Z6u02jt+51H0Jee9WLOMCfemtrPOHe2qVRwFw9HHsXswYpTs0J7AZu6AkxPBpMpZis19iQ9d3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ltspIxe6no/LfDYr8VeYqXUX8ngm+PlqRn6XvYaNSF/Z1okZ
	YjYZTfvqam9b4/2q9zv1XlHler55E1CyAmAOfriGisOB5IHIiVmQ
X-Google-Smtp-Source: AGHT+IE43HUTMcvg5JPGXBf28PLzvI1fH4Km7StHBX+xWMhU+QpuFfK2hgWczU0D69DxDYdSxCzUFA==
X-Received: by 2002:a05:6512:110d:b0:536:5816:82ad with SMTP id 2adb3069b0e04-53678ff4b27mr9354969e87.57.1726571665303;
        Tue, 17 Sep 2024 04:14:25 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:24 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:16 +0200
Subject: [PATCH v4 06/11] drm/msm/A6xx: Sync relevant adreno_pm4.xml
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-6-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=3764;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
 b=LavGzjE0gZg8Jbw1qTXAm9ohHGbmvmV5uqhK5TpSFaHXALTVqMsf4VS3aKzyRdChm90JHepAR
 NG5HoyAZn+hDbXNjPE9jVC9gu77SGobCE8Gzod4x/omBen6tlwG+nG4
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

In mesa CP_SET_CTXSWITCH_IB is renamed to CP_SET_AMBLE and some other
names are changed to match KGSL. Import those changes.

The changes have not been merged yet in mesa but are necessary for this
series.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    | 39 ++++++++++------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index cab01af55d22..55a35182858c 100644
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
2.46.0


