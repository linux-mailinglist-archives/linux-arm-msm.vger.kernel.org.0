Return-Path: <linux-arm-msm+bounces-32280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD60F9844B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4681C24007
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77F91A76C0;
	Tue, 24 Sep 2024 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhuytiBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C71A727A;
	Tue, 24 Sep 2024 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177449; cv=none; b=YIfareXiccvYQ+Slh9WP+KynyqhAIgRnE3NsXPXHQ3gcuBorU/I4TOQjEIpA619PXQ3eXbOvpdmmY8jZvsY4zYs6cFnbYI23qpj3n4QlmJP2xljeaKMo6tt1wpVITADwM3zhLm70gcSnM0MhfAK1T6ytvho0SHNbecZqGEinAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177449; c=relaxed/simple;
	bh=HrcVfm6GphW+dkH2/eI9roTkaCaCbkN7M4JC5UFjlfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sQYMSPGBzG/jJRTfehNrONSKtc0FXn+Rn/qE8s3g/OsKHwbAIsOHU401iSFLBEspLU8Xh6obwUC2fMR5ABy00rv0Q1jANaCAD2U6DGXzF41a56Qk1nSzJzvQS/ynbQIaWukbMnL+o0lvf5JAZfU6LYbL0rslqYxW064LgyT7dHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhuytiBO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso901639666b.0;
        Tue, 24 Sep 2024 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177446; x=1727782246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
        b=YhuytiBObKnSIGbngynG7RABJk3NI9vqPWFmCW+mv7g7wu+Hni8EyPL//uXKi3Z+TS
         p6/uvqlvt62TCY8RWxxEb0x2Oi5F63JnzK3x4GagMkzUPk9mok/P4F/G2ir19g4c0UWI
         nVEWsxLfdJ82wik0CoZkQEN4W72/LtgF1yUtBYxL/9my70+6CBdwsYN3ALhQA3jatHVC
         gHqEDb4e5oEz1Z93JRoKi4w5bH2kqjoKgYFaA6XC+IONcS0N5ulgE88vyk0y9nL22mcs
         2NAJMWt/DvuYFsn0Wz430YmqEk+FIdfzMdDGj3pykjFZNtY2h+Wer6tBloaCO4k0fP/N
         QypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177446; x=1727782246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
        b=FRsJRUnJ5KS3FCvDcGQhoDo6JyCxiuwYTfbJk3/G5jPNHhPdF7/nsHc2Syuld/YcdO
         YeCoA/r2i+l+YWTBt3scDuCEunlpeE8PmZEVy4a3lSvhWy5kCu6Co2d8VKoeoTjB+HEZ
         7YVLs+c9dqil+HEVmJnR9n2ropr42XTcMm+tOYnTBJ9SAJJwNt5GgaOYGX9dUsI3CkR4
         YcD9IjptQ2yt47g/4/eUFYIuF0us47ggIJVBR5q8ONpH7u8c6YD+86qIJws0g3vow/VA
         uBhKeEyEK4IR0zHcN3M7+6/iu5WS5GBicdNgTVBOoZykT0AJXxyYMVcqdk5PGh70dgBf
         UXGw==
X-Forwarded-Encrypted: i=1; AJvYcCUh/TkETXlasW7DcIG3c23Tf39qVg3dwFAmkxlqUdIDPnkqJmOFDvbg43xEWMNzk4JHNLpyyn8zsyUKmUlc@vger.kernel.org, AJvYcCX6ByzO+ExU1iaeNZDS7k9CmwGhSzxmQ8yJdMDIgEHQprWcrs85SuVj5E+nxv+NLFGIOYU3tkk930U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0VLY5Rd4DhqTEWrUKLdo8aqTQXHucjPn5fFOn4Z4MqYC/aPT
	XT/MkTfciAQ58IOqF/2MpxVBUrgsZOU0udusFvHR5Dl9O5lPZ7QDbQATtsAO
X-Google-Smtp-Source: AGHT+IEaWx/441QIk2rtllfpJ1s+7PSPQeqyJQiFATxUwsmjwWsOBcZRgKQs+F7ZKPPkFcaq+e7HRA==
X-Received: by 2002:a17:907:e64f:b0:a8d:555f:eeda with SMTP id a640c23a62f3a-a90d4fdf82cmr1509225066b.8.1727177445942;
        Tue, 24 Sep 2024 04:30:45 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:45 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:39 +0200
Subject: [PATCH v5 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-4-0be2bf81c187@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=1479;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=HrcVfm6GphW+dkH2/eI9roTkaCaCbkN7M4JC5UFjlfM=;
 b=AyFPAFOk2mxFmrI1dnga0J8a6dYRNWGg482028ks8r3gY41J5JokFfnV5rBBLARPpqungLuE7
 JDreZFdmJbvABkCO4dnf3j+aNlwa3SSjw0PGgr0wxpdSn3/7UiL8qYR
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

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


