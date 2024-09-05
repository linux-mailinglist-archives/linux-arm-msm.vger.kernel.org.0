Return-Path: <linux-arm-msm+bounces-30958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D23396DC89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CED84B2689D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AAA19DF52;
	Thu,  5 Sep 2024 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fbsjkb49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A719CD12;
	Thu,  5 Sep 2024 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547898; cv=none; b=cDcLphPekIuUAf4UR3UT8Vs9dRsD0GxIS+88j8lXGq6UoTXRCTqw+UCsPLPJCmuEuY8e0DesDJKtpydglHagO/SOtKek64sio7ZxRrJhhMsE569aT3iRZBvnNEvGPBO3fMJHxfFDNy2XVZGcci9S0wZANjzYrjG4yoxO+uWm7tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547898; c=relaxed/simple;
	bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpYYTfUuHFyBK7BA1m1IzfJ6Ka/qP99zJtgGBV6kD+h7L8Gj9+7Iv4If70hPAxgUl7CQ+ofMg+GVG+L80fIUc/4RA1JcrSua+nraqWHhxxAw2vuQHTZ/4dAHPrZ50epejhbTF+Ba2dgRDzhNyoLLBlDqF06V5Jpx1DyLcTwYOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fbsjkb49; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86910caf9cso370569166b.1;
        Thu, 05 Sep 2024 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547895; x=1726152695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
        b=Fbsjkb49xm24KZTh+qkSg+avsr7AmG+IEA7W7nJVIj8SLw/tCbKW/gpEMCNr1+mg1M
         t0LuEbwAwpXDRac6lt8NAfOFVNvBWseDZovTd4L9IFj5eo/qrgtmuAESsSKAb10voFRC
         4AfuugtFB3pb28nbuxEc8Pl5L5fkyoLpiLMiSa1a0KLtmoJ76SDq3uIVQxvTmBfMbkFM
         iqETrKcINPTiWbMJebwgUZcXLVNh1MnYIMrXvqCa36sXhdHcKfcIQxGPOAqSPw9tur6n
         dH2QUTH2l5Kzl+wtTxcCc9QS1EokUnturazUJXCJzVl+Ne8CyiB98EhgGmgUxxdzT6/o
         Jslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547895; x=1726152695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
        b=e5eK/X5JduGG05TMoshk6tMJmk3gO7tMlrf8EXuqsDl9jkdbAHZ/lRMb6/LGHN3IwS
         uCeyUaY/SaHCEkRMUTbUgTrG0XVvDkK75AqnoKcy9ZX0AOBiWz62QFBM9tIzSukUecBM
         0kPHDPVdcZf5SqEjuutaXAVEbc9l6+QgQvoU3LzT9RGJViCmQoRJfruIwMOmRYfIbzel
         dEDUgZJ5G3OxpiM5DlCDfSq6fw+yl1esigxFsASRF/m+Mtd8tRqR/L7ATOMB+gXrgx7j
         34QfQW7ICo2zw6tDeiKVb8QkHHn1ykd6GWladA9f99gScfjnj55KNFha3gfLuWb9ld3e
         qZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCUI7L0gaL3C0fIGX3UfDjD+y1R/tH5LeLfVfI9DCEQxtxTjg86UNVw7CLxYQ8UwrGJ3K6IF0GKN9j4=@vger.kernel.org, AJvYcCVhVUkLj+40zshzPEv8T4pSvzWKKUZLXvyPInOV/ZJaKBYYTmiIYCyAaIVVOHQdj1gcAcFE4FZGUpQAlfp+@vger.kernel.org
X-Gm-Message-State: AOJu0YzlEEapb0O2gpmVVReDlwao5fD7cb6tbqk5Reen0hscTdftIRfq
	retqURFRbqTjbum/FBRtIPHF6sQ76jDb/E08Xt2iYrmy3DvXyHUD
X-Google-Smtp-Source: AGHT+IE5UQSl+WtlgnpxePBQvDH47cv/J7+XI+eIwVmdijVNuH5dElK67nTmbEB4l9EcGraswn7mNg==
X-Received: by 2002:a17:906:ef09:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a8a42f8af0amr597545866b.4.1725547894568;
        Thu, 05 Sep 2024 07:51:34 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:34 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:23 +0200
Subject: [PATCH v3 05/10] drm/msm/A6xx: Sync relevant adreno_pm4.xml
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-5-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=3764;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
 b=K5z6+gJ9F0BUwR3UCDyC7rv+AaTI7U2htDGXQBbB6BnTM0gnx0WfMyXwNGBhrHavVE0Iqoznh
 YCwKNM9d3zWA1YpbZcQ+DXZU8cmXrIJ/oOtvGUTOpGxobVaiDiLk++c
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


