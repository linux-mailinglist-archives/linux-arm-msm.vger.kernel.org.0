Return-Path: <linux-arm-msm+bounces-31906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB997AF73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA6BF1C22274
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CC3175D35;
	Tue, 17 Sep 2024 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQLVzbpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CBE173355;
	Tue, 17 Sep 2024 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571665; cv=none; b=NZ9lWFYTduMpRTfqWzCmHy6fdkb8Tz/1U5bxbduRx1MzMd1kM7w4hl0L5Bw1/rzkUdsz4y4WdtkIvuYPJXqtxSPL7a5gh/iDakhFa6kN8W9zm4KKmycOp5nT1GNzVbYdZo1+NaWKXVrBg0lx/hh2euaB+k4pV4eYc07/J9I7o3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571665; c=relaxed/simple;
	bh=oUM/CI16gozvDWhTcSfQS9qAoH2wC/uZWKXcoKsNOYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTcGwiPVx1QybcRaFWZ+PBSZMdj7KJg1s1IhEoFA9uQCZExbsT//q/Y0uSsjFfLKqYi0/jqkC8p+I1S0tsWgnCk8f2C1/OHL55TTdUTuIzY6PeDjgjyj181ThCy6u9LU8MHVrU0dTKM5/iVb2FGTaOFjkChIpbPvJ5JQN5M2h14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQLVzbpg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so9688386a12.1;
        Tue, 17 Sep 2024 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571662; x=1727176462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
        b=UQLVzbpgcXmODz1Ka0HLITGAVfv9n1WOKsjpaZr+ezNgo2ZYMCgnfulRU1qBuXje2S
         hpeqrHRNHhWWs9Ts77DFu2TRRgA1SBEzK2JXOnhM1XZXaTT51KSo5y74wP5RLP2wxYZj
         bCgsUx45VTfliCuNZ4Fyt1kFcCmkCk7jYgW/MTHAlMQntg6MfWGXZBSRHhA4XU17mtYa
         /pFB3IUq0dI88y0jlrbL0He3KXCbdYSN7gw/3X0iaZwZ+pkeYcbtYNW3KlQsnhUHZ20w
         cpe7AUKdVopuPiHwtw7/38df2LeJK2uMUBIjO5ikgtXCFqVjA+s9tZ/EypY4/WCRNqoI
         j/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571662; x=1727176462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
        b=S1Tjh/pcFUaySunmRwL/yzZ/CRzzrkverjmcW1p0uKlC6OeBVt2jXkag7cXUa2T67v
         Yz+GtQee00NtSM8Psy/Tq82FRPFvZ9ZZ90DeBY6cOh80koVnexb7+2W91gi16oKzyCmp
         q8KJjtrERz8AMUDdzlyz/FY5gZHcCgNiOr8HzcC1ikv0s5OVPt/39eurSqMwaXIjoJ4u
         6wMZ+6th854SsLr0dwwS1n03HLn3w1fP/7qwDpFLHRgDWnxWfOdXkiQyaZZKE4BUYQL1
         N7Upe/Lw7qmBbwkm8J88wYmUkktmZJ8xpSj3THnuJqTzLh1ISJAVkhw6AQMWMO5yyZiT
         n9HA==
X-Forwarded-Encrypted: i=1; AJvYcCUYNq4CiywipQ3xE5L51EK0Q6jGrz5UB3dEU+6eRQRgqLNjBi1ah0TMKa0GX6ORB1/eMM9br8FRsI0ByDGh@vger.kernel.org, AJvYcCUvzT2zwipL/ypFEXw0A+rXCmZoqSaTZOjZru1csYy9+Z+XXHKx7eYWKntcL7J7A1jbh4WwKroPdg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzhKr7h9Z3o4DRc9vM40YabwfElmxdOhXiX6HdW8dzzueN8tzU
	9uReG5NUoILgBLome2F8KQJXdGWoV/CFsh9iSKIg3hyoqGeK1o45
X-Google-Smtp-Source: AGHT+IHgneGDCvJuxMRUcqIWZw4uzYYuRjuOQs2kAUZFFCJ7+1IpBxUFHDLvCnNqQZCBHN99FvEkiw==
X-Received: by 2002:a17:907:2da2:b0:a8d:2b86:d76a with SMTP id a640c23a62f3a-a902a8f0fa2mr1858239566b.32.1726571661866;
        Tue, 17 Sep 2024 04:14:21 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:21 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:14 +0200
Subject: [PATCH v4 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-4-95d48012e0ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=1210;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=oUM/CI16gozvDWhTcSfQS9qAoH2wC/uZWKXcoKsNOYo=;
 b=2VCI1aS4Z608h4Pi8Gj+VwTsW96XSeLQLdg0E8YySWBTbyreJtftTWlxqeZG4DnDHwcxzZkUb
 LOdjawpPx98DHEwkwqrEnzluBHfkfs8CBILQYtp77Hwt4fB2dM6H8KJ
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f..fd31d1d7a11e 100644
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
2.46.0


