Return-Path: <linux-arm-msm+bounces-32613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E23D987A86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC9C82822CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C4E1885A1;
	Thu, 26 Sep 2024 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCkNjXfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C5188587;
	Thu, 26 Sep 2024 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385428; cv=none; b=l9ik5eo+dEBs8xvXoM611yiq/VUZngio43zPLO1g8TiBz1KgWoL0Y51etk2D9zCxSDVqwNcwJq+g+6NZWEo94xg/xC5eqqWbPO2+2OKZzM87bJsqu+B0lkTVngQ5vNmwANX6IWUCHinbdvjT7Fvk6kfGrCp4wfSMy+rD8u5A+iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385428; c=relaxed/simple;
	bh=+/10yM8zg55qjZOGGUuysVO4iKnvZxJ8Izq/9aSEglE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfGuS9OqmVThHSzMaOmsMCbvqDaTpdui1hL1o8sLGkRu2aDCKjG7Zr4XLAYQXMNearOi1IWYaI7AjfpxH3UVJC4zNysq9VK15KjSvJENtd5OdmXs9WXxDp4wm28B2vWZ2Esyp6pA9xKTPQg1eYWMXtRJQC1KTYJpJzqqu1lnmTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCkNjXfZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d56155f51so167938866b.2;
        Thu, 26 Sep 2024 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385425; x=1727990225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
        b=BCkNjXfZXhBdO+2FWnfrqpcJ5TooPBGoJsyK2DG3S850qHgzAx1rh9eUWqOopEWR1x
         JgDAlk/QMf8RiXnUYmKIkgscBDMFNhcfNPuwBVr6bX3W4psB4mhLI4MvogJCs2VCtYOl
         46PTnoMcpXCDffuhXsPOqwQiWeZT06geZUWB0JwN+zJ6iySg729pDzZR8y1Ufk2NzhXF
         JyXquycjOnb0sSxVTloPmQ0fY6MbyoUyfWHR+Ym9lGnS4Ai1xBxIEWNa4o+ibghkpeyq
         EzqLZNdcXYdwF11zIEN1HMyY3gIbbmc+w/UoIym4rRljYQCIiwq6UHAZdS04S/3jUetk
         hKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385425; x=1727990225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
        b=Ms20gbFWpRB9S6R5Ov7U3coGsiKjursnEqHDWK6AucwnHiOoSlopOsDpMzxlv6SGDJ
         AgQI86n2iSFEuiFYhwV4BJ/Wp58sWX5HfbJ2/YCjt1rse4bzYHul8P3qB5OXEc4SuEnR
         8sw1JC2RPc9Q93P68sk8Xf/ww7T3WOzHJuA9DptVwFmLwhW6nxG6QfLAEZMFTKwxUhdf
         7ukmD+8U5qIrV479l4W5k+fYPuROEN9jobXn4DfDtdFLzwNlma6Tiegf9NGDrOWu6hPM
         V+TVXiiW6JLOhuEdWKOvNiM/sSG+4pRqiL3Bn4SEsUQBofQzpjLq9iBFLkw6YxY1V9k4
         XyOg==
X-Forwarded-Encrypted: i=1; AJvYcCUsrapDnIuQsRGOwgcvA+e23MkKOg6D+BQcWTnDOWAccgltjbc7QasFPiPZjgpwU1vEx1dVhbMGa4A=@vger.kernel.org, AJvYcCWXrRXIhQ2qzVZdbFatC+1oqaZA7wUj7DMQ8Yr7SW8Df0/jUPSTzffqIPS462zOXMWxHSg5PYAKANtpTllK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+C6xGnTJ9G7KQjW4Odv9ohvPCNGusSFMynx5uVk9fx/O+L3MK
	HCYI5pftzPmHItICA+qlWQF7L4B1QhMcQnzKOlZeB8Wq7jB1R922
X-Google-Smtp-Source: AGHT+IGJuQv7YVMS3b76MEqSfxuMWDwIlk6D91pEby+w1aoMgw03XSMhXb0YzT7F1DU6/Zg7342Zkw==
X-Received: by 2002:a17:907:944e:b0:a86:743a:a716 with SMTP id a640c23a62f3a-a93c4c2791fmr66290166b.53.1727385425193;
        Thu, 26 Sep 2024 14:17:05 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:17:04 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:48 +0200
Subject: [PATCH v6 06/11] drm/msm/a6xx: Sync relevant adreno_pm4.xml
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-6-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=4033;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=+/10yM8zg55qjZOGGUuysVO4iKnvZxJ8Izq/9aSEglE=;
 b=gv6nI52xnz/kVdnR4lknsl1zvWz6DMg5CLSswnLhy7uzKDs/Q0RBB+cyObaTHSc4WqCXO2BUp
 lTFtVlekgn/ADxnw+Pk2C5DRcgYrJP+SIPr0vWGcEUNSiFA8mQaz0Wn
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


