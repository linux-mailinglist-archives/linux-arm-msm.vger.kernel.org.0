Return-Path: <linux-arm-msm+bounces-83010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4DC7F1E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8DEE3A5FA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CBE2E11B0;
	Mon, 24 Nov 2025 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="A3xEhEF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107832E092D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967038; cv=none; b=GDA2Za/Sot8+Za4r97WTzErs0Z2DuEEWsxcePilDDM1VQSPKbHSr6bl3mBW/FTF1mMKiay65gIF5BzeXg7DEWcPpfOqcc+Dsu5h4hsNFfadnN8t/ygyzfJWpcj0wmGEFhynsoULMBCBi5Jd+mOAXecmQEiuKF5uC5Z/Ny274izA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967038; c=relaxed/simple;
	bh=c+evDW9Elw7Jyi8FB04DPqmRYklgmrA1qBTttF7Xz90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRsTMR68o/wBdKtZ0rnLeg1U+zU+asmL6aykuGAKQT/MErPg8zc0siY9SV9ALH13JqyvRpTDqxrAPNFgOAlLA8XGvk5StVoxH92j7tcHO359hMu60hoiFtbbiWtLqX/ygzKT4K4hu7lq8Rry5Z2Iu0DCDaW9lB0l9suklDQxuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=A3xEhEF+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2ed01b95dso403125985a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 22:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967036; x=1764571836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skch7R/1lPkeyinutaXG2JeYSmt7c1u7ahV+p8uoSAQ=;
        b=A3xEhEF+omTdzdqkWNz6hWHQ0wnvhSm6xIJm8qDK1vDrsRmiRF4yRuNyOEW7mFwMuy
         3xYrGFsz7VzRGs73pLmSW94ncSEN8ht5CgzYC8K/CayyY9WUxnK8Mmt1f/pWZzws/fKT
         s7voHp0FQWwqSFCOVfh2dsePSW7/8j6P6vSX/rIwUsqowuotz+0plifVfzYATHZ0gOMn
         jlHFIkDxBtRjmYGgMZNXTj1wf4AiLNv5Oc0cw6/7yNrqlHQNgwHK03ZqyCdbJxc77dc0
         tp3m+OypecaeJVAwRKyFtfwGIgNaad+890fJhp+g55jNUH2yC7VgZ2FMXh4O7on28HoU
         +dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967036; x=1764571836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skch7R/1lPkeyinutaXG2JeYSmt7c1u7ahV+p8uoSAQ=;
        b=TAHupmxGFvsLUohZKLKNGP1/ZcTwaPrXFGAa59xM5mepiaybh0O/wj1XXS1GFRYecd
         T6RI0e4K3rMT3IR2zO3wl45JUGv3NsCxWQ3wxxjLW5LKXiv5B8XUzjwbcFSlUQrgnLVU
         aI9pbPhYwZDeGl56qCCIhcodwKPGSGceGP8P7Dd4hZk97QpN1tDZ8HBo2wPU+21PtJhn
         /u2I9VaVKRfXl53uJZMvas/8xmXP9HgSJ3pqhAHHFK9B8gmw+dgnEGvPC5HRr6vMGsE/
         skCWbN+fmZvMsQWRRwbRumP1iyTFxmbE+QFX1/eEYN5g/UL3xNF6FB4v3Pjl0hm8ts9R
         aJQA==
X-Gm-Message-State: AOJu0YzHJ+OVgfYRxRAJ94/rWGFUzNuOr4G7nVHbElrFNek0Nmxe57k3
	xyiiKdFdAGYVC4T+EJFDMft5yyy6N8xMJ6COwMv9gYTypVF/3G22BcchXzF2hcxpVwvACelU5oA
	cQdRx
X-Gm-Gg: ASbGnctaolCSKyZjKv6VPilE2SQ3ekDak37AupR3Qg7uPe4Er5FRTEe8umoTEItzrW7
	4t4owVshJcX6HQt4wfBKRoVp1bs8TTVbNuVpQIA0i1pgI/SsjhMzqh/cgvPqXV3SSEqhDxlZIaa
	6EAu3TuMNZQPGcU4uEYSKnaKgnM4mHMhtsw80XLoYgC2FaeqgeNkWOC7ig0OAKMbj7u0Z2s5aa/
	Gg/FsSLVzUtWjBhEPniE1mTA7uyeSOkMdxRhCmaui5ssbt/OpVDqeRmG4eNnrj0fInVA/ZQ+5Wc
	BwhD6v0TiUgrXUymfs6i+KpDua/l0adxR1L4eksqT3k6y66AYzOHz0W9ghLGpqeEAtufVaiwt4r
	V4S/4DMix9oHpsEQAo4k+IK9h+K327+0S/fzjBzetgeybxweRXG0zP1mYPC5NfZZg/DxOmstOmj
	4MrLxexrDQwrsTxmK2GnrtA0F5cIl9zRMyUjVvQ7y3TahM4Osk1CRkvvdKGCHlkXC9lg==
X-Google-Smtp-Source: AGHT+IHhRRyQV5IXdiBdHoXPIY1Kec5ywogEhdJKq7fTD97tVKBwhIq12TY3XSAEWfkk2ZC6mRZpSA==
X-Received: by 2002:a05:620a:31a6:b0:8b2:dd5b:fe80 with SMTP id af79cd13be357-8b33d48706amr1402951785a.79.1763967035481;
        Sun, 23 Nov 2025 22:50:35 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:34 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/6] ASoC: codecs: wsa883x: remove mute_unmute_on_trigger
Date: Mon, 24 Nov 2025 01:45:55 -0500
Message-ID: <20251124064850.15419-3-jonathan@marek.ca>
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

Note I only tested the equivalent wsa884x change.

Fixes: 805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/wsa883x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa..06e963b5e853e 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1396,7 +1396,6 @@ static const struct snd_soc_dai_ops wsa883x_dai_ops = {
 	.hw_free = wsa883x_hw_free,
 	.mute_stream = wsa883x_digital_mute,
 	.set_stream = wsa883x_set_sdw_stream,
-	.mute_unmute_on_trigger = true,
 };
 
 static struct snd_soc_dai_driver wsa883x_dais[] = {
-- 
2.51.0


