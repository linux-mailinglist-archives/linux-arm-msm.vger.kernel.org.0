Return-Path: <linux-arm-msm+bounces-30267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D13369665B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 537811F22404
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CD51BAEE8;
	Fri, 30 Aug 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iryu75+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EBD1BA89B;
	Fri, 30 Aug 2024 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032004; cv=none; b=gLBET+Lre5w9qwQiAnXsKeBJXBVrly6hD4H/sIjF5OFtGhio/IwEscFtjM8V69dLqaA5VgYaK2nwqwm66ZfV4F9E4g1pglVALVgLATc/STB16ckHrhaZnnq+5olaVO5g24urY5nrQGfiB0qM0GZt0dJAAsCU5rVQzFKYbQpyCiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032004; c=relaxed/simple;
	bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nurAm7nSmOM0opTYH+xOw2MoBSnYiMWrSu5lUMRrAueJZaRV7+SwV7j8TSux+R4XELiHy4h4ZG9mr/NQCRof5EdUdqAqkFjneWty0FofgsQcAiXDoI3ZbRpjrwwoKUBHd7qNVYTnEZ3vXRNDY+0dvmMoig4K1UuRPQ6rNMbhqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iryu75+f; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so221975066b.1;
        Fri, 30 Aug 2024 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725032001; x=1725636801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
        b=Iryu75+fDWvBzOGsr42rgtUxmJPAbVdgWm6zWquG5Muk+GKh6QI3/FcYuaFeue0mfp
         gPNlZacpSssUrtYdXS81lrre3fx3tzGbeSlZFqes8H+qqeARhDnfXKrXDCqIGMHz9ssY
         bwUuDx3wztc4LFiXd7jhjTTK3Ra9XdnULeB/YpcpqG2R4laTIq5VNXsV9kry/NsHk3GW
         pgtzm2ncKQ30MqpDd/2bii9lduuIZG8xwsNHLOcPRrN7fAt3V8+EIRaZGOcF1x/MUbY5
         7LRwYchSBF6/0/cGJuGMQ4CSqPsW7izIFucMcwEWD574itYK8GvD8RakbgWqfNX6uzV6
         jNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725032001; x=1725636801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
        b=X8S/74CQOHEYQUYKuEek0YnZ+PUWyWAk4gSdrvCNb+g+j7gM5bl8WaPrq2l741VFXX
         wHo4NaVRrG//7+TqxWXDsgr1aiZ8DYKhJHEGlFY8TikV1G7ZBwI/laR4e23isqkiSEyA
         zI/9jszUYvWBw1Kl+q5iU/q5WnJvfz6/aLgzOV9OB9Syg6dw2RP7asd6x1QMQpOUxcAh
         S9N/krUYzG5b6f+LrnSBk1zHEozN85buDqQtzDe8Q6+6r9jJDgKGcO6FrCUTOxeNtcf+
         YNZtm7pJFjnjOp/g24JAOCRjz8ZGQUCJG4E58JlfsFtphD/zVky78AbQbgD5xE0X1Mtg
         5JYw==
X-Forwarded-Encrypted: i=1; AJvYcCW3cX/+b90Aa3mPsQ6HSL03z0pD6PVuTtqlvHtBR23F5pOg2t3feCBZK06aP1CH1pMUC/UeEhPlvqhYSYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhq+KDbDbsKary8v4PWURFaGnC3mERCKbtRwNldG8hygwoVoic
	+tJMV9mlh6m/VKbzcwKC9Wb8pruA0liiOrBhY7jDhXDrAY4Qx86yMfr17wkK
X-Google-Smtp-Source: AGHT+IFH2wEYI+hFF2p89nqVCo1HfRyQ5wJgwJ8qmGjuO3Fc4y/1NfomGCHq5aGUlyl2GVNGOpBueg==
X-Received: by 2002:a17:907:6d23:b0:a77:b3c4:cd28 with SMTP id a640c23a62f3a-a897f778186mr453987166b.9.1725032000860;
        Fri, 30 Aug 2024 08:33:20 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:20 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:47 +0200
Subject: [PATCH v2 5/9] drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-5-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=3764;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
 b=bUnjrq2VlhxQnp/Tzbw2NOJF74x/cBbbPl/wLAphrgZDN5b3n3SihHfkUlZ5W5CbGkAENRw15
 u5bw4qlUuSDCGCfzNnUtD1d3L/0z5vaVKnQ+0wPvTr9XerS8R9vjx6N
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


