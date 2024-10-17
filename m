Return-Path: <linux-arm-msm+bounces-34773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF449A29BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 966A5B2F3E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 16:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1101E0DD3;
	Thu, 17 Oct 2024 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciipJH8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F991E0DCA;
	Thu, 17 Oct 2024 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183865; cv=none; b=NF3g12AEsm2VuGLwshP8q10wLnaB1rynrVeqcCQwf182V/FSwc0yLu3hnEo90t//oFPquttN8vlxdVVEoYtKyuLSrs4PN3jLSjfLF5G09LoYdd+OihHz/QOWvid/Jez/Soq+X8umgFJpfVnvX9ZpPxhhswRbu2oX7I4bF+0ySbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183865; c=relaxed/simple;
	bh=mWVAxP270eizg+NnieHw5y6Ei6lA/IiWWZmJ1Makxbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miL/bfArCgmLj8pdJn1FhKQxsB9dOUQCiYXQUmbolqb8FrTrs8kHviCQFUTo/R23alSWEqk7A61gIwD1mprBq2CFATE2Uw3s3rmryskTAfW8do3G0dBgDiCJssiTGDLMSat7WWJa6XEBnYxtiqBqAuQD0fTai9msTCZbC71jIb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciipJH8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F65C4CEC3;
	Thu, 17 Oct 2024 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729183864;
	bh=mWVAxP270eizg+NnieHw5y6Ei6lA/IiWWZmJ1Makxbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ciipJH8U6IzHb52iUHwuJjDu2drcUx8yvwVKx66zIM1CSx46UGPkekCwmMO5RWHhQ
	 lRWBy8VAml+ls7XuJS6tB81ePHpFAKAYIackjkxUxnG4AVs1E7LGEUZh4hidCaLC8w
	 PbsFzGTIbUcU0ZCt4BzeKlw14ZFeGgdEKjMJWwKQNTtSwwNDkEPD6kHcy+SUTY0C7U
	 FV58ToKdts/zDXsXEv0Xjcm78Z5RBgS1le/PC+jmkq0N0T3xGXvg+SOQSVQt7hjYM2
	 uhNoJmwTKFycDxSp2NpAlIEQBI50uOoGr9mMTKEQNCie03+wpoel1jlB0oH2xvauqX
	 aplUpQc7f8FKQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 09/10] clocksource/drivers/qcom: Remove clockevents shutdown call on offlining
Date: Thu, 17 Oct 2024 18:50:40 +0200
Message-ID: <20241017165041.6954-10-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241017165041.6954-1-frederic@kernel.org>
References: <20241017165041.6954-1-frederic@kernel.org>
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


