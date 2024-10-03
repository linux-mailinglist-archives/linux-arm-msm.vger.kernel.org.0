Return-Path: <linux-arm-msm+bounces-33034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3024198F3EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B538A1F224C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0A81AB6C2;
	Thu,  3 Oct 2024 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQPvzEMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDCE1AB51B;
	Thu,  3 Oct 2024 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971992; cv=none; b=dRqIlh3OcibwmOlTbZe4kvtuilwLeLapnb0Q+zLQ5ADrxLwTaVDo9MFp5LXGH/ZEw/MqDTNeHCs4M8EgDzFLfRkBjwoIDVgLMftum5G6qf8fcMuc6pSXf+EoNLYlUfkDbHRzpzkpZNhl7QcG4/WRzOgPOd6ilPX6+PqMe9z04yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971992; c=relaxed/simple;
	bh=/wWoq9phTQOtf3DbnY9akGSVrFARm8V71ASGyLN3bu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWtn9JHcBdTiX49XwYZXcxe50BN7/JBkk6pEywoIPdpKbxpslUuALlsknt3tQMAixIC2YJetWPs7iL+x+Cy8Rv4pGyYqt1T4Xzh4le0vxWcNGMfU5LqwBV43Nl/z7ayKoFd/3r3T5uywRkTRAIyYQIE5wX0/Rqged2kuO/sRGVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQPvzEMN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so1628528a12.3;
        Thu, 03 Oct 2024 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971989; x=1728576789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
        b=VQPvzEMN75+VUsGSSw5uoLcldyoaOEeWiWQ11GvylLPtvFfrhDSho0NcwOKcGQ/U1Q
         5XlLxM4xNUexucbf0SByNNOq1tczCjbkct5UKhukdNen5SnZ9sqseCEE1GdHB5+G7uR0
         YMlf2MLoDLP92/EPpJPYZYZIb2hFkON698kWdsSiailVDc5zztJwr6mnd96wCjWHmFo5
         a486mYr0nlN4bLFxfBB2cF7KMbunItDA7aSs4KfWgVe8JS7ljbRRwoYcwes0TiRIs249
         Q9oq7IRgfbtr2Ky5U/Ct01NPStkOUm3WQTl5tW7deWZ1unNqj9ZbNbsjpuax4QYCd40b
         uMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971989; x=1728576789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
        b=W4m7Ckay0unK1kFtIQ8MPdjjYAvPl2J/W/k88+El+QdyFAbZeAUqRhOeDv20E3qpVa
         qeTULLUMH3VrldAvRkMx1POH75SdStgC28UW/Kk2Fw4qWZUPJSFbDRj7OLnxqHj8jXyI
         iJAizSPdvrqllXiZXZ2D6Tjd0NeuBVu90cRpkcxJrNMXqGtW62Mkr+y/AS1iUSFRdIiW
         t2umqFHplUq/GVI46PqmSk3pleLsHDPfj1OBZ9os+6YqcRGH2PQYV3PHFjpTaWw2bMQs
         gNyKVHfACdwmMYzfNWiggBOS3kxD6eQXo8oDvtgaMqeBHrUAUYzuV9IqS2YQwexMPyiI
         wpOA==
X-Forwarded-Encrypted: i=1; AJvYcCWY1ZtrWbNf/QOdsQ+5Vk7n8U0HGKEnIe1lmxIDmE6PVJZdPm1iG2bfZIHtYtLW7ZvNkGv2EBY/Db+nvX17@vger.kernel.org, AJvYcCXfTax0pmV9pBdharOImKeqb+y5WaKdh4bbHeFy77WY/GBbrVMuQXP6gpPa5RMmNzuA2vbIw2qc6kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/96bnxb+c/2mzSAemkc1BlAkcrY+Epmb25e5iD9ufF0uKwJW
	H0ZKuxSAbmBI6CPW6j+E8IEJ1oMPN+xneFMthYaAoJezHLRMVhjw
X-Google-Smtp-Source: AGHT+IGg/TDD/UYldRFd8ivNHm2MIlLo9pvXM/gzWhUsgFDb2pAQT6s+UHg74nIw8fWIUyKnZdcvcA==
X-Received: by 2002:a17:907:97c7:b0:a8b:6ee7:ba2c with SMTP id a640c23a62f3a-a98f824db49mr738159766b.16.1727971989285;
        Thu, 03 Oct 2024 09:13:09 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:08 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:56 +0200
Subject: [PATCH v8 07/12] drm/msm/a6xx: Sync relevant adreno_pm4.xml
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-7-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=4077;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=/wWoq9phTQOtf3DbnY9akGSVrFARm8V71ASGyLN3bu4=;
 b=5854X32F856DjAwSnBjK85C7m0P/bTPK8DLJl9ecjF/Dxr1LQ433uDvWULajpwG9UmztXaDfi
 p9alhQFBtD8DhF7RkhdiORt79G5Rllz6wp2f91q4f5ZFdXMksUrDJOk
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


