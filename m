Return-Path: <linux-arm-msm+bounces-61597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DAADCAEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 14:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2A8C167808
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AC923B615;
	Tue, 17 Jun 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XzRqVbyn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B732DE204
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162826; cv=none; b=diKzTfosgIJfgnmg78t9rEj5cky5u6802TIraIZnntY0xdUb1p1wQpZVPJ5hdMCnL66nqrTjH7D6aAKGEUsFYfdbKPXPUKg1tDQQxSzteXLVZqAfBa5xqtzdS+A+fUuPbv35kR4aQ3hlZvmLx6vPsDB1mu0NQnQZAuL9d5WhX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162826; c=relaxed/simple;
	bh=DwcF0NlBlxdXmxZ4P1HYVbWm6Pa7UHrd11SXdQpckGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=inxte0t0YVOLYow6mkzLdOtNmE6l9kVZPBLLyZzAapFLBSpftbbref5QmnLxN2kYdPC8cRpqjLqGe7aYyx+fQULnObn12pPmqKA4mVOltsRZFLmrUHDiIlJ7fjtcuO9KyPOHBObmc9ZrH2iD6ygqmIXzBIdrsEjmVLmMEqt/jxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XzRqVbyn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so8956029a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 05:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750162823; x=1750767623; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUdlhR7H14Eo2mUGN1/ZO0ngxMr42fTDow94RiXbg9k=;
        b=XzRqVbynNd/r2xzQiulK4z30Aj6DqUqr7Er9Kse1EcAWN0XZrv0OqKodNYzrvnOXDO
         DaIc5Oexp+IZMSsBpjfPpgCxD84vNKLwpKk3pAV7+RkTufKPWef2YZ7Z1IKphQSvRCgC
         Vbm5EZ6jHH5gubpYBezmXiB/fhRlpdnSk1CHi99+MytzGLGU6OGVr77gX0YsSWPhGVdn
         TqbSvMa4lcOnF3iwmmoiqVy8UGYFJNqlHDoz2pZdR/kG7eZI9KwcFwd2xWFaTpwP9sIP
         Jlkvhjr8EiwvvExTF4akwg/iHdN9hKYlSKy5IYNWHi40J40SoS2Qmsm9WTV14pS0H0or
         7BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162823; x=1750767623;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUdlhR7H14Eo2mUGN1/ZO0ngxMr42fTDow94RiXbg9k=;
        b=tJs49jIO97q9KpJYLI0MXDzMTjNjjYwLZG7XqJj0gHyAsuWm/6o1r0KJ/nYqM7S/hi
         fil3qWQ1YInFGxY28KUaLWd96SHEubrtyYfuMueQb2Dwr6AR5QmR8BdTVQhWcvadvIVD
         Fqw1Oz/+5bp+zCvPNIDEUj/eesfikoxagSpCWIUSWBlIP2H6hFQVgRoQRRUk1IYxb1Kl
         quIplUXRxfM3NDAs8RhmWiiXxYmG1lclzB6PkiXP7vDPuT49asyuUzNB4bN47lb+SC0I
         VYqOcj6DznTxkU6m72LrKSyyTwtP+BqyjKXONyvTJOA5uLZK8WUXc3jHxM+e8Tjya0lp
         FhZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5CSGU9MFOlgBTSWjHFfMOWbribwAJZVeSUa6hdtDBFuaEmn207xzTkUacArHapMrl0ET1A/Mt4ywSHvxg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QdNL4BcQUlgBaA4NMX6Py0/5g43UDQ32hANhuz4qHC5RZbTG
	mvwy4ujJUzmXqrxCVnGIp11WNZFGazG/JGqAj6PpVBIWqqtkfit9amrxWm/IrzDJ6NI=
X-Gm-Gg: ASbGncsZsxtvsIRHTUTpIkI/Q0pn22NnzmU6ZQt/9dr4iBVYGb2NlqfoHUZHV8fQE0C
	F3qrw8izQHxJJoUgZ9TNswaCSYga5t3/OvVyd/J8v7UzCLXjo8fgI71QZjamhcTh12KD4hz4aD7
	YZetGsrL7igso9Fo1hue+Tg/nkTu9o4Uff5t9urCgHbBBHoqJgopJnkwmIZa2e1HOCcKtXtXmmT
	Qcf0x118kxpLSWmMFHhC27OlEGI4VmFWK60LPXr10Ypvbruvj2bhoj/wpj9nq/H60xuPSxQAMqX
	HAOqTLA/Wvs9g994TgKKG6vTTtDDs+LrWUmxLK491b4TuZWgB5zZs8y+W/oJBzE7FAVprapAk1I
	0s3ZvtMDZsSBNAtePye0cgPBfB9ZGccBy
X-Google-Smtp-Source: AGHT+IHXdzCpZsabrbUfZ1/mAGhW1nkU1uiB24DWPjENG/rLfQm1pdzkmZDiD5h6daPKGYzfxXx5lw==
X-Received: by 2002:a05:6402:3506:b0:607:32e8:652 with SMTP id 4fb4d7f45d1cf-608d09998eemr11138714a12.19.1750162822453;
        Tue, 17 Jun 2025 05:20:22 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a8c34asm8053834a12.55.2025.06.17.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:20:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Jun 2025 14:20:12 +0200
Subject: [PATCH] ASoC: qcom: sm8250: Fix possibly undefined reference
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-snd-sm8250-dep-fix-v1-1-879af8906ec4@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAHtdUWgC/x3MSwqAMAxF0a1IxgZs638r4qDYVDOwSgMiiHs3O
 DwX3ntAKDMJjMUDmS4WPpLClAUsm08rIQc12Mo2VWs6lBRQ9l6FgU6MfGPtBhe98yZ2FnR4ZtL
 8n07z+35i7VCTZAAAAA==
X-Change-ID: 20250617-snd-sm8250-dep-fix-4393fa3a1f72
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthew Croughan <matthew.croughan@nix.how>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

With CONFIG_SND_SOC_SM8250=y and CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS=m
selected in kconfig, the build will fail due to trying to link against a
symbol only found in the module.

  aarch64-linux-gnu-ld: sound/soc/qcom/sm8250.o: in function `sm8250_snd_exit':
  sound/soc/qcom/sm8250.c:52:(.text+0x210): undefined reference to `qcom_snd_usb_offload_jack_remove'

Fix this by declaring the dependency that forces CONFIG_SND_SOC_SM8250=m
when CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS is =m.

Reported-by: Matthew Croughan <matthew.croughan@nix.how>
Fixes: 1b8d0d87b934 ("ASoC: qcom: qdsp6: Add headphone jack for offload connection status")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e86b4a03dd61d2d3ad6a4d9602f69effbaefaa83..3d9ba13ee1e5250c7c4ecce664ff5a62dddf5094 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -186,6 +186,7 @@ config SND_SOC_SM8250
 	tristate "SoC Machine driver for SM8250 boards"
 	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
+	depends on SND_SOC_QCOM_OFFLOAD_UTILS || !SND_SOC_QCOM_OFFLOAD_UTILS
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_QCOM_SDW

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250617-snd-sm8250-dep-fix-4393fa3a1f72

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


