Return-Path: <linux-arm-msm+bounces-112534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kkBdNaOkKWrPbAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:53:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CB85F66C114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:53:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=rOJGTR0M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112534-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112534-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72D39300CF1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE09F351C2A;
	Wed, 10 Jun 2026 17:53:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F474349CCD
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:53:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114012; cv=none; b=CGdrkLzC8BipB+fsPw0BRJLu0YNsUWAa3PaSqeWJkVhUpSA/bZayK3vdvYtXZRM1yEv+0hnHuHBPQtZoSbmEiI7GGgyngw6xjbqiNvYg1gE3tydoZL/k7dsaJSKM1g6+yyeBavDxKH3ilp141bS0QVGSP80xLzRTQp9r3eMEW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114012; c=relaxed/simple;
	bh=iiyiLCmokktwOtjZ960yR+DKQfaNTU0ATNJuMUK9sy8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k0QzRuv4J9rb7pWUOYJA38XKe2IXGJZrLKrzvQloQHdtgocYxKzRHbFpywoTXVchY0t/dFhd62cpF6spJryqanQV2NAdS64/MQXkeG9Wmj5cidmlEGbKpbTpyQKEP1YJAtJ3767OTVtEZvhB7IiTkFryeygqTL/X44+7M7gByAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOJGTR0M; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so57920155e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114008; x=1781718808; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UnDtFKdEvW/DP/U/HdjN3QuQRr7tgJb5Z32jZ2PKP1A=;
        b=rOJGTR0MH/nEk/kcGXUDqc88ZWsdR1wCKYzDA3v5onseWxGdkPgtJHIMPk+USFDCss
         7jEOpyYtoeu/Ee0fqpN47/134pPA7WdDnWvCpZbaeQw6TprWuuwS+8vwn39YbUZ2uPUa
         UTcIt+E/t4PHBn9bQa12hcWHTIwKwvoq9xaMXjon/ClPn5EqFXmPQ5xYICRe8lilMut9
         kNMVIbtD9C7NDOH2srEnAzB7KuDOcMwSXqhUQo+ZICKt6Dxs8UxowTleJaZ9wJa2gQyj
         u4Ah5n6A2viiH+T9QEWrxz5QXfbcmmjfoIk/kuT7Jb+Gtn1wZc8PDTKC5ao7/VagzCZ8
         pPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114008; x=1781718808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnDtFKdEvW/DP/U/HdjN3QuQRr7tgJb5Z32jZ2PKP1A=;
        b=IC7W8LOStSUIu8CFsdYwxqqoII4EfC6IZXWVvjsK+qf9wIIWUlCY6PUrkAW8cAjhMu
         RcBdsdvu9816WxpSUcQ4HFWBdOdcoMCGq1yvANnx0IkfF9DgxJICgGmm+LEeNFI/V8Iv
         DLLvZrbTKRENVkvmGt9aEGjbd4BjlwY63nzU7NcGoEWLkidLmv9QmVl19iArG7/o4Pzj
         RMYlSexQwbGw2qSca35HGAxCeV4bGHFyi5dDETLF9EsX984ax9LrNvpZJaETMigQNr1w
         q1NP0TCYsTFrB9yDMjj3d6p3RVBLUy0k8Cyqb9vqoqzAPTBQwXyLUEHW5EKEFX74K3u9
         k/Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8Lpp1uvVPfYyojoV1K905o/Xw7bE34MBC8m0P9CvOkih2jTw3j8Z7hcNsGIZB3L56bJb+bqiaUBEG3kgx6@vger.kernel.org
X-Gm-Message-State: AOJu0YwPVIVqtzaS1BGK96qI6g4S6NmuN1W40C9BwnGzjLpBQ2MiLXgJ
	n6WaauhFSPO6/sTHBMnkV3k4L5SPxuTDnnHZ7QGcUg8fe7aaUQafkVbTuTA8jVsUkeU=
X-Gm-Gg: Acq92OGAv3I7H6EE5TFsAfTaCzGmHlEMClFpCX0YfBYeuJfsXgv3WOIKpoL8V4Hkk7Q
	GmZkkzr3Qb2wAi/AC5xD4ErWJRCjOWQ2CdulPTVl7P5vZRbpC+L2YN996f/Rsuhpt3O+6/9WCR6
	xErI6WNNQmsdc05/5GrYp18jSF2IYymJIMIfyl+Lqwq+ssl2KQ0PsaX++tnj0J6LFYsc9tM7yrx
	1uSSHWPE5miQyN8W4/j/9UOj0Ry34TvIrfvFYlA+FX132reJX8NBhS+iakgjJat9HTuAgwLjw6B
	kADMdKAP1eoVO6YC4ThmKI53SI80KmJuk8wIfvP8ryPR6CHygnSrIpTJalSjLoVgv3Wvkx4Srl5
	f5rlcKvbVcxsgByPdVkvMyjJLYhTYmcTfSpP+lLlCW3CvzENhGQgrvg8kJCv8qm4rEsuk/mid9Q
	qZnbS+ZVRtXezXo/LOsAdzwiX0k/fMQe0OF8LAjDWDC0HuvA==
X-Received: by 2002:a05:600c:a51:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490d724314cmr106934435e9.33.1781114008509;
        Wed, 10 Jun 2026 10:53:28 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm73553248f8f.9.2026.06.10.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:53:28 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
Date: Wed, 10 Jun 2026 19:53:09 +0200
Message-Id: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWkKWoC/yXMwQ6CMBCE4Vche3aTAoLWVzEcahlljQWzBaIhv
 DtFD3P4DvMvFKGCSJdsIcUsUYY+IT9k5DvXP8DSJlNhitrUxrLTkOY7HiVAOQQZGE5fX25hT3l
 V2fKMI6X/W3GXz699bf6O0+0JP+5BWtcN5Er7EX0AAAA=
X-Change-ID: 20260609-arm-arch-timer-mmio-early-de97155938e4
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112534-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mark.rutland@arm.com,m:maz@kernel.org,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jack@jackmatthe.ws,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB85F66C114

Jack reported a regression for some single-core Qualcomm platforms (e.g.
MDM9625, MDM9607) that no longer boot because no timers can be found during
early boot [1]. These platforms rely on an obscure timer setup where the
global Arm MMIO timer (arm,armv7-timer-mem) is used as the only available
timer for the CPU. This setup used to work fine until commit 0f67b56d84b4
("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone
driver") when the early timer initialization using TIMER_OF_DECLARE() was
removed when moving to the standalone MMIO driver.

There doesn't seem to be any other usable CPU timer on those platforms, so
this series restores the early timer support using TIMER_OF_DECLARE()
inside the new standalone arm_arch_timer_mmio driver. This is pretty ugly,
but I could not think of a better solution so far. I tried to keep the
ugliness for the two probe paths as limited as possible. :-)

If someone has a better idea how to solve this, I would be happy to try it.

[1]: https://lore.kernel.org/r/46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws/

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      clocksource/drivers/arm_arch_timer_mmio: Refactor for early init
      clocksource/drivers/arm_arch_timer_mmio: Restore support for early init

 drivers/clocksource/arm_arch_timer_mmio.c | 180 ++++++++++++++++++++----------
 1 file changed, 123 insertions(+), 57 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260609-arm-arch-timer-mmio-early-de97155938e4

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


