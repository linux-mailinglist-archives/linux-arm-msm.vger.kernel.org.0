Return-Path: <linux-arm-msm+bounces-32781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B798A61D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BEAC283E51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFD81922E4;
	Mon, 30 Sep 2024 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJ8ZdTN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CA5191F75;
	Mon, 30 Sep 2024 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704375; cv=none; b=SMfZo8kT2wT/Z7MrgxQi2X3Cp5ai8oMBC7rdn4qZvhzvOfhaV/GMGS7EkC9DpM4wNN0zh290ZwnADdGTSN2jZRbvGXuG9b1blMozXN1K8YdcBnpJZVv2IL2c1jyANgtEBqtPnEtlDkVLOvu0hxFGJBNoIGCgsMA+7bTlkdJ7vWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704375; c=relaxed/simple;
	bh=/wWoq9phTQOtf3DbnY9akGSVrFARm8V71ASGyLN3bu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKc3UgElmLvipmI0gaZ7Rdnga5PSkmfjSGWIiczVcYlPorIIudq0HSeosCUPs0YPa/vb8TB1KNAsFv9dysQSeZfETeAAB3HtQQMAJVmkupmRL8fPErnj+S7Fi5Ve+b6rxLX0/NRm4P096DdhdZNqHoKiHujC9aWq2EP+Jhgw4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJ8ZdTN7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c721803a89so5750821a12.1;
        Mon, 30 Sep 2024 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704372; x=1728309172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
        b=SJ8ZdTN73QkG9eDYfkOn1enx2q5glHsMdDBzcMyifBUXTIX8+wLdr5tIRDPbygfNDe
         jw1oyWMWp+/ksX9LmBcxvshEWvOfA76V8ujHdwCJ4bdFqnqkPGIgd11Iv6NsSQ/1psHO
         Z6uzs3AwquRpugOYeTC54Y90cL59xtwl/lC3x+uoLAZ1eFUn5hQtr1pP9PEgAZpJDw6J
         mvoTjMYe7MKFN4m6CDSRak2HuooRlwi+cuJvKtHaZrjE0m09Gy6OV2UNUHjb3fxyiNre
         7Ki7J6pArhUOhhjRdtvsxYTMV9Jwtrwe9/Ewa78InVga8x9mmL/61pTljO81l7mdHBke
         6mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704372; x=1728309172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
        b=ewvtJZL5IyzDXfq1sQUX3xJiSN0nRxuE+JfEiR9ckxmlKwU2uJI1e8Nbfw4bUhXH0I
         HfWfW71jzSK2ImpuV+V+o0pGWeB7O24n+pSD9nyMRRq/c+3j61tvKVX184oIsxhU49f/
         1+1ltPtALmdOBY6vfeUAlIvA/AQnjWvmosclDIaBaUe6ikAkheVc+2K31nJWihVkyFup
         +lxXGGhQBIM4HQZA0+784+L0gUI51G6l3mn+yuXRcWuPRuPi1euYQbmJ9Y7f2eIc44xC
         qi/gJW1gfw2P5FiXktJzswn3lIDswnCH0VMrnYySe9Kflc+qvYs9ta6EwhoSVubyCOdF
         0DKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUynoWRXqt/GZzCX9yN4xlAoS9VEhGYMcX7lIm+kRApSZ+hf81w9vjCioonUj3lGGDuldT8a10kGiRQWHp+@vger.kernel.org, AJvYcCWKbXHEtyUQImgFklByOzE/6IAW8POkiuqlctUERKJ49aly8O+ujHlq7w8bIkkhkpHxGPMzD7rGY1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9k0c2UiuXfFGtq711dmdr5peTo5SnS9mqdL+9ITBMB+n5DO2+
	Zw+qnvWaQcsadxLxBbSJd9hepGaxsiyKjoAzuXi5kw5DchB+f2Ah
X-Google-Smtp-Source: AGHT+IEtEHvA++ACAq3+/Xn8PG90rxIADGbdFhcm0asOS75rHEmMB3MrcHbNxTrRQNa66Fn864KPBg==
X-Received: by 2002:a05:6402:34c4:b0:5c8:8381:c1bf with SMTP id 4fb4d7f45d1cf-5c88381c226mr8680369a12.3.1727704372364;
        Mon, 30 Sep 2024 06:52:52 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:52 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:42 +0200
Subject: [PATCH v7 07/12] drm/msm/a6xx: Sync relevant adreno_pm4.xml
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-7-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=4077;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=/wWoq9phTQOtf3DbnY9akGSVrFARm8V71ASGyLN3bu4=;
 b=47iWK2j17SvgYMevDnKcX9MYYXBX8tLf6jqCulkRTmMTXG4gLjA4OKUlyksvgteyBIqChCyvv
 TepYYJSTT2TCq5ZNoJBtZx1Pm0264bU1fTYjgGm5b0/lLy7oPBXaaWw
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

In mesa CP_SET_CTXSWITCH_IB is renamed to CP_SET_AMBLE and some other
names are changed to match KGSL. Import those changes.

The changes have not been merged yet in mesa but are necessary for this
series.

Tested-by: Rob Clark <robdclark@gmail.com>
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


