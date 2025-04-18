Return-Path: <linux-arm-msm+bounces-54741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBEAA937B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2897F1B64AA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90085279909;
	Fri, 18 Apr 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yO989wWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7B4278162
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982047; cv=none; b=sJXW0lNJ711mbMone7c8JdX68Eegemd3E66UfCbpABLUV1iDKJRVnlqkkp3OHNsU7CWYEsJnOOyPrLiALoI+z7a0nZ4AFoHZl8gF7Y9ELDhVrMHJxRM5T6ho5TKRprf5z+gu/Qje1/1RfB1J+Eu1jI0ZqNqHWcjggsIdgJ/6iFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982047; c=relaxed/simple;
	bh=m+PMYJAHzPiWvmBUN7s4MjbXhEue3cg4fhj99Fq5amM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwzFp8wX0JLUbLeGKdvJh2yRvZIUm1MNnGYD0R8cvJBvsdGZGpIkd8dbC46WyUKJtH4HpUaOTqXaK7ykY2yIlWw6lqArStgtZ0YRFd+phPYASCGmTLLw1GuCkD3DGvaiwF7AUf/473yNwXhghPRk4jK1SwnQfDNfzU8LbRvR8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yO989wWw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so346296666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982043; x=1745586843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCvYbcr7LrU2lgzZsZvyD/7tb6wHoKL1gjL7KsvY9pE=;
        b=yO989wWwaqXWZeANO4cgUBdurOAAhBhva8LIB/3AA0+Jo+/sB53Uf6hbkPjvq38MFS
         XYmEfeW5MBr8xpvXF025xW4ld1DEhVnDDM1/pbDq3sOhetI50ZYISVnuus0KfQM7NoGV
         RA0cwdiUPZEAwfI4E1FRTcOffPqOGC1XdDwWloERpAXwGRqfKDGV/TClbCTjo7pXlfAk
         gadrFufbSHXj+1MvB99P0PmROMvTlYTGmEy/mP5NxbUTHNk429Yt8PZSObOmSZqFzrPk
         nFEqrlRuYuWcwKIQCt+WuSEZnTkfoN3SQGq87gDq0nqwUVzaYHQsI/54C/QVwE1Kr0GY
         T0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982043; x=1745586843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCvYbcr7LrU2lgzZsZvyD/7tb6wHoKL1gjL7KsvY9pE=;
        b=kwBkfQ4F6IndpVM9tGeK+RSF9sFKB6gB9CU1FsPWVTkzyDrVG2AAbQQ4T7e+3Cspt4
         8jZMZ/92REfmKPkGuuIGnzzoYECz0uwZKsLdd/93jogfFURWjUOgzJgcSZgJPRhVjR/i
         kfgdcGmGwDVjgP7E6+BGHJw9cwX2r1hMew2WZ4F01zo85x1pft8gqNP2Tu9FdC22PlKp
         4AXnKgHthRXnrBiAt/RDnC4LriWIxw1DzVB0Pd0VC4QeOFwZowq29crrshZuJ2ZDM8iY
         mnpcRniCaxTywa+AlHzW+FyDG6djEncemXaAuIQCqJlkQDhkmA3qQqSBiFwAiDNUz/pr
         lx7w==
X-Forwarded-Encrypted: i=1; AJvYcCW6Om7rPC1jZ4++msunYEuXdtP85ZzH8aIeZ/9djrBex3CsnGojL/gajJjiQpPBu8Sc7JgRMcwDOLLbdEz4@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGXxJ9zwv+hKfJJRZ31iGcp+PsJNyLEd3O+5A4FO5txuMCdND
	+ItBFXTBfm1uRTmjYXCCoSg5nlSq+UTIaFjtZWutijUU13H9V1CBxrbaXypUf2g=
X-Gm-Gg: ASbGncvwmFYuOtCQ5hYg1WLURONQG6bZs5RMIWTIPkwo4uxQ7ASDbvTMNLtyZjQS2l1
	npMnmXnCiBGK2A0HxARU1KhHFkXK7ohV5Kp8GheA9SHsufIICyO8bhnl65NmSmAqtcAc8KHlZOL
	u65ppC22LFZUKHM0D1GdxgAXFJISigK2n6gr7Lj+ghfSb47o0Ma7ZspqAkJ3XV8Fm9QNr/ZFYGU
	btmMmEkNBDaVUWddST2E2WsMJ65xcJjk+S11eX/VRC4cSFdZtkkR2Sw3v2pxB8NBQG43sABLqXP
	mBnow2N5REpAE4SZcgtQAtDLn4yw4YwTRDnVkEdRlUh469k03nT+S4DMQrC7v2vFM8ehhXYNb+L
	tp6joii2znXMxgA==
X-Google-Smtp-Source: AGHT+IF9i+qy4bQxvdAhaulCC58fLAGLSGbyOONZRqFPtLgJ+j16vp+WVixcc2FWtwJrg/V/6FPSZA==
X-Received: by 2002:a17:907:9712:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-acb74ad7dcemr235285266b.6.1744982042862;
        Fri, 18 Apr 2025 06:14:02 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:45 +0200
Subject: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a..ec5372e18a9c9bc6a80412adcc5ec473e9730620 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -211,6 +211,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0


