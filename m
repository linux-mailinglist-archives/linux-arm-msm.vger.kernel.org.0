Return-Path: <linux-arm-msm+bounces-83009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 68717C7F1DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 73C57345D3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28602E091D;
	Mon, 24 Nov 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="SMGIUgTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC72E03E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967036; cv=none; b=tJhC+YEeFa6AtUqmBV/JcWlE1rjFiQYJYkKCTGPt4u2kkxlrDwIgILn3i+PiftKauW5fjP8nO4UnRK2cdjJ7UdLrbxz4hyv52OO2K/baAhuvKLDdrJeeGjrjDcmvAT936rIlorZ+MB3SoB+KzHKtvqrNNN3vzYbq/AYRMGZESOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967036; c=relaxed/simple;
	bh=d6WN5H/+767vMaQcJjAjNCbjrtbpcRP4HbSZ+EaFPAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ubd7Be/E31Ev3LpBx05aXcXd4BOUzgVgKa4JY9yMNekNxBrSToemeBVEzedLmEdlpH1cIewO6k9Xuw5+Pg/pIKiDJPWTMsEQ0HMUAdHuowtoYZa/fOUa1RG6SrKlmVGh9jHs7t5awAsQdnHv7+QnWJ+iZg3R3wLEhhZ//d3ztJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=SMGIUgTR; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2aa1ae006so513554985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 22:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967034; x=1764571834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SbhPk+cIbagc0g7g2HIdLEmkXHw9QB9UvdhnuSgHsc=;
        b=SMGIUgTRRxYH5DGNp4MNCP7vjvOGwdhbRDTax/z21Rc0bgYIp225y7W9DQsxlVpquj
         t5MweCmOFXhL5GiyCpld9Dd/6qsfRWKhQCSVP+PyUlQzk+JrJI4LWzVi0B7TbiiVMP/a
         Yflp4xK/gz7axfTMW0F3t0syDQRPCY52LIhTuoOcvCy4ISmw9lXBhDwmdIJpZF7K4xmX
         isU+OTtwgbJxUuCJR7rPumSXVi/mnt+dc0+jXtlCpaXMCcDUWsd9aziXGkMaW6kmI/Zg
         6XNFuMqFVt7obA0HD8fQKRRcDU5AMplniL70xqznhgoonifSEy9mQv4uEoBxqMEHrAjO
         cPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967034; x=1764571834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SbhPk+cIbagc0g7g2HIdLEmkXHw9QB9UvdhnuSgHsc=;
        b=nLe04jrSNkRbwr8jGvkLqtW680m2rNTTlmZQmFeHPmnQKqeXPnxPB+b6LzSnzCRjIm
         vggPztVTyLR8B9jXLR10HQfrd+I85VRBo+rD69t39r+RQo4qOB+RUvpm2Hic1jtix/wW
         DcTwFGFz97z7jrGzLjDNYt2YbQTac6DCbPMvYTvvjXpQ/kkwdmrt3yNz6jHUHdrFQD6X
         dhK0a+1oYA1Z3cVGQsobX4KCQjQeFpuThMXptOSY+FroAmAqQSS5xpBDrZr4eV3lZu9C
         HmbmfSWmBYyw3C5INl7qq4bHMU1nIJymJbTRtxdIaZVQAcDzEZRPcN6szE2fjGWVgHYB
         gPqw==
X-Gm-Message-State: AOJu0YwoxyXV7avR2eztkpPVo/LXoXUD+2FC2BhVjmtWqooIf43rjMXn
	Iwxvw+lG1PKwZ7Tv0NF+Cx/RgKA+wZ7STErU1XOnjwnmw5rfCBnk2W6jQae8untvAMCI0hltemS
	i60q6
X-Gm-Gg: ASbGncs/iVE0RBZszkw1mk4izBYwMn4odbLtdsIvqMgem2dsdi+FbBBtANUqVKDulvj
	L0VhYalmIbqzuukcaddFtSrdmYQ7PihMjiyZXF5kEMKOuWeZv6XNUig7dj8zQWkIfmc4E+yWcnB
	OjJ/Vhz3vsm6XKIeasEZzdLOc7470RkTgQkGOIWX7bJoK7fJPmqLWDx1zszOaMhsvXKSw6fmZfg
	l703qnV8IkbB3DNQvmUYGhb2yZvG76o3J+mmOSwxsC77H2MFhDXK1t8+SdNgjNQS301sYs/wEbU
	Eg0tj0gTKhg0kFCONAz6lMXZ2Ybkyq47x13lQ4bsICLUqRXgvV8qrIFMgBemO4PNOWyAchDBeJU
	MRLtg6A/yY1lsoxWj589Le2Q4/WVU8cR0bu3XV0968WQ1jo2lGMLmlAC+IRjhbfG157H1zAC0GE
	1D7n+czpaMEzaSifgjcX1UaM4ysmLUn09clnGt6tIMcbIaANnEjm68K2w9y0dCi4pFPw==
X-Google-Smtp-Source: AGHT+IEBHwNCw3W+jfg9jESuLTfvci7rPCprytBblNB0K+hOqYvW2BCwSblqlDokDkAkj9jWN2s1ew==
X-Received: by 2002:a05:620a:450c:b0:8b2:e922:529a with SMTP id af79cd13be357-8b33d1f93acmr1221802585a.19.1763967032817;
        Sun, 23 Nov 2025 22:50:32 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:31 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/6] ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
Date: Mon, 24 Nov 2025 01:45:54 -0500
Message-ID: <20251124064850.15419-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124064850.15419-1-jonathan@marek.ca>
References: <20251124064850.15419-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trigger is atomic (non-schedulable), and soundwire register writes are not
safe to run in an atomic context. (bus is locked with a mutex, and qcom
driver's callback can also sleep if the FIFO is full).

The important part of fixing the click/pop issue was removing the PA_EN
writes from the dapm events, AFAICT this flag doesn't help anyway.

Fixes: 28b0b18d5346 ("ASoC: codec: wsa884x: make use of new mute_unmute_on_trigger flag")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/wsa884x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 2484d4b8e2d94..0218dfc13bc77 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1840,7 +1840,6 @@ static const struct snd_soc_dai_ops wsa884x_dai_ops = {
 	.hw_free = wsa884x_hw_free,
 	.mute_stream = wsa884x_mute_stream,
 	.set_stream = wsa884x_set_stream,
-	.mute_unmute_on_trigger = true,
 };
 
 static struct snd_soc_dai_driver wsa884x_dais[] = {
-- 
2.51.0


