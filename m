Return-Path: <linux-arm-msm+bounces-36305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318009B4A48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6386D1C2242D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4CF2076A9;
	Tue, 29 Oct 2024 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2pelnak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CC2076A6;
	Tue, 29 Oct 2024 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206515; cv=none; b=s1eCuCNTfzEUsRmeoIpDXwjNCB3qYsS6ZCytZuwSvi/N3YT4XJ8gTY+aCugkBiNykyOCwC8MQnGlW4ERlD0/SrRLtWRB4n+HhyN6mXx6ec37cF5dKsbwr7afYPM5qOasxcYuO0wTPdNKla/faDva3YMilL/PexGmCXJ7ASd8uDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206515; c=relaxed/simple;
	bh=mWVAxP270eizg+NnieHw5y6Ei6lA/IiWWZmJ1Makxbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkWfGxix1xnbzq1AX5AKuhF4fcDTUcGf0Ydy5s8QGna6pDia0BxDewYEmzQcToK819fhjFJJ5SIrJjC79gN5xWSGu22uF2cJ63Wztlow1NxppfWub5pV35zvQDCgZ+cDoq04IcPyoFqQxJrUlNfg8eyFmAWoCLuJLVlvmhrjV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2pelnak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C19C4CEE5;
	Tue, 29 Oct 2024 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206514;
	bh=mWVAxP270eizg+NnieHw5y6Ei6lA/IiWWZmJ1Makxbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H2pelnakTKlk91z2Oy+go1anhetr5jiOh/51ynxgYpaUibkLynvJMAjd/F7HusRnR
	 iDrU5wZNAUf3DehV17HWij2rfvnNOEJ4kjNKQMm8H3KOdSdihZb+9AGGf1eyw4sBIV
	 53123ycLY94LhauPASR4vXGKaQqXW/Wbkq6gFLNunJEUgRi+hLI9vTEjk7j6DCW++d
	 A/m6qlELFLBBrW4lh+5Iwl/44HsxmApapiHi+IlwfAqaVTI32mx2lhiH1F5UONO1Hg
	 miL+IdC2chO/l4WzvCL5npEM3Ulo567TU+x0pHJdKDE/hh6x7Z+I5Nwoy5rU48BEI0
	 cGONbjzuyxo/w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 09/10] clocksource/drivers/qcom: Remove clockevents shutdown call on offlining
Date: Tue, 29 Oct 2024 13:54:50 +0100
Message-ID: <20241029125451.54574-10-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029125451.54574-1-frederic@kernel.org>
References: <20241029125451.54574-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clockevents core already detached and unregistered it at this stage.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/clocksource/timer-qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
index eac4c95c6127..ddb1debe6a6b 100644
--- a/drivers/clocksource/timer-qcom.c
+++ b/drivers/clocksource/timer-qcom.c
@@ -130,7 +130,6 @@ static int msm_local_timer_dying_cpu(unsigned int cpu)
 {
 	struct clock_event_device *evt = per_cpu_ptr(msm_evt, cpu);
 
-	evt->set_state_shutdown(evt);
 	disable_percpu_irq(evt->irq);
 	return 0;
 }
-- 
2.46.0


