Return-Path: <linux-arm-msm+bounces-33031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A28398F3DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 732171C21A46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AAA1A7AE7;
	Thu,  3 Oct 2024 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8jTYpJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E461A725E;
	Thu,  3 Oct 2024 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971987; cv=none; b=tSPF7Uc2inT6LP8ysyJ1e9uXTqr9rbZ/mpEdK7mgsHnvkLgX4uq+6igZ0Sk0vFDzkBSJImWCbxo0scJl1eCtliG/WdCKgzIIUCdN9TLQxFmAJOpxGxakATmg7qGAcWJAMMx6BrBJQhs9eXFmDkiRca63BsOfxqpt1aGar0aZSqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971987; c=relaxed/simple;
	bh=95uWYhYXrJwsS/Si/bR6gRgvDdDmC6nz9iFGaH/gMIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYMhr4X5IbuLVdGYuBMJQes5D5wQ6EqbR1hAfM9RgkqJEWQ8KDXLhWOI+TYOQQMiwRyi3uLb854Dr8Mf8Dq7+2YXIkUXAvZtF3h85z/57sMHAZ6HvOoSKJM/jKxWQpoIu+Fu4Rpz6Zj1ae8XnTnomZy4yYAjHnGvrQejUqM1Pf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8jTYpJZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so145624766b.2;
        Thu, 03 Oct 2024 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971984; x=1728576784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
        b=N8jTYpJZwbGrwZO+XNwXvRJXsosKu6qybWL0O83270+/Zw9ivyE4De/yTtuH3mddSw
         D5SuwR/Y/tMWMNV6SbBipSBVF2cykWP+InmTSlz99FSx1ziypdJFuTIQPv2HfntaZBJr
         HQqI8Q+TmpqajBxz7JOpFq1lTHpDojPaDjM/4PMek25IsVieb6uy2hKa4qDmVvpOjALd
         hY7RkQ/xtbu1ZYFoMozA8uFUyGTdPKrdBY82PFOouqcW2sTvfir15yXY8vJFh38J0ioR
         3DDBRYdTtnRb1QWW4/wGteLSA2FF97W4iM0Bg6eGsVf8jUNi0m2PnuArejSFLCeyTI/S
         yVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971984; x=1728576784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
        b=C/ybYr1C1T+Dpfk/hln7EIZg1eLkvR96xShr5+YzACCbxmw1297Q0UWCjtfall/k28
         cpI0ua4BEldhGkWvH25twN//dWlF21wj7BeAu2QoXxZiYk2JDvMPzpih6kqRkccp8PCe
         XIG4X9mmqT+Lk8v58OJZduA09FuQ43l6DuXx/yYqopDvp7JhoRsTIGU4CxmYGxMV9y7K
         ztEUgEB0k4rRpXiCgAR0fGGj2ViTDWrkigAm4WSeLfCTVywlVZ9Vt6+kv/4v3a0JX5sj
         +5Xy6LaNr9RB0lJ+2o1NisJ7JmhhAMBUwncdk8ELiL6W+ISQTdqPGfgvmAOOGncn1XsR
         GokQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIUY241K5Dp+ufFOOPzY86sgR6yFTkAEhx00UacRxlvrP9fYHih9FCn9xTENPM0fejC4BTKXiNUvJ4qH/4@vger.kernel.org, AJvYcCWducP1/JGf7ABNzECrfxmt6TK8C1+TLWsA7gfH23xoC7BvwcSJ8rqVmKpVNhPGziD0v50L83Kur7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5eeGrUP+uJnA0WmUD5qW8c3sGuVmxjrY1sFlZMmXGgMPv6B+
	+3YGlVRriO5BkHwyOIUwwm2g44F/2onZu26jOQs/YmJX2mAw7jL0CcGIjg75Hop+cw==
X-Google-Smtp-Source: AGHT+IFAw9TWSHxvADxQ23Ohd8gd7pyUJ1VF2ICdjKGvRf0zDATNhgB+Gao4F2lCt+cReeKRzfUdUA==
X-Received: by 2002:a17:907:7ba7:b0:a8d:7210:e295 with SMTP id a640c23a62f3a-a98f820a7b5mr620924266b.10.1727971983820;
        Thu, 03 Oct 2024 09:13:03 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:03 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:53 +0200
Subject: [PATCH v8 04/12] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-4-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=1523;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=95uWYhYXrJwsS/Si/bR6gRgvDdDmC6nz9iFGaH/gMIk=;
 b=NMHsNg8FHqzK322WlIXiE3vzgXWMVxXgrSoNw2PJTSBYYSgtHyE+fwI/sJiv3kXLNY42Kh38j
 AzstkrtmzP+Daw+BJi1y/uCfEMROet/14ww3bE8Iz9B0L8F+Uaxs+4d
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+		<bitfield name="STOP" pos="0" type="boolean"/>
+		<bitfield name="LEVEL" low="6" high="7"/>
+		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
+		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
+	</reg32>
 	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
 	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
 	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>

-- 
2.46.1


