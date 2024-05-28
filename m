Return-Path: <linux-arm-msm+bounces-20702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA8D8D12EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562832812C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39E41411FC;
	Tue, 28 May 2024 03:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVnESjZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1B51411EE;
	Tue, 28 May 2024 03:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867196; cv=none; b=mjoQcpIbzLML+rOuRkg2wm8N7x3LIiK4gES1vPez7p0hFqQZEauNgpXrpimXbblCzHUfTqzD3QieWfIidiTc5rpuNQg9DX3qSWN02SpGQjS54UaMm9hdO8rer9jFkALfgO2h+HmqDP6zDNQ22Y77DnWYOH9lra6EXY5khYe+VvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867196; c=relaxed/simple;
	bh=ePolhgu5YoE8VC+tgwK1GBDAtJFQCMUH13dsPkQNicA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJQrVxAcmly6vy7VqYhybyAfSukagtsj8UPvTjJPIXjtCro9K0LcKiWJs/3jEsAAYUuwyeHOPOVGC21Ft4xsGrJqaEs5ocJy4pDz/R6SAfUevqhbQPksPAIdlxgKqg6kADTCAefWtTkQiChPYipa0GRE3bgXZ32S/rFTVsNiWGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVnESjZq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684BEC32782;
	Tue, 28 May 2024 03:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867196;
	bh=ePolhgu5YoE8VC+tgwK1GBDAtJFQCMUH13dsPkQNicA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bVnESjZq5kKpQGW0UD/44OL6keNLrYU/4xNMGGz6LuGn0IHaoyPlzCtu+Y2NsI6C+
	 qDZY5Lw8Kjlwdz58ApVycu8M2kZYAEEpZ7AIbM3S5jLc6/VKUcscSJNAfKHGnR9a4d
	 PHJmEpDTaFgx6GUHdsRaSY72HavZ6X7W2KMMR4vC+yfPVo728CauvjvbZkQR8TN710
	 V96vtzUp9FP1iJvriuttBfFay4kGyJOGUbzjX2TfJ+7VBYfhFlbh45MKso77W1SOTz
	 BOzKkfuj7m4JdSBDUNCCZRVwdZTIBZYZGv0ImZ1qD5X9SYwuimXUHOxQ6vzVy9RHXr
	 qHtCmoT/3Bt3w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers
Date: Mon, 27 May 2024 22:32:35 -0500
Message-ID: <171686715159.523693.11051218263082972635.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509184129.3924422-1-swboyd@chromium.org>
References: <20240509184129.3924422-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 May 2024 11:41:28 -0700, Stephen Boyd wrote:
> Dan pointed out that Smatch is concerned about this code because it uses
> spin_lock_irqsave() and then calls wait_event_lock_irq() which enables
> irqs before going to sleep. The comment above the function says it
> should be called with interrupts enabled, but we simply hope that's true
> without really confirming that. Let's add a might_sleep() here to
> confirm that interrupts and preemption aren't disabled. Once we do that,
> we can change the lock to be non-saving, spin_lock_irq(), to clarify
> that we don't expect irqs to be disabled. If irqs are disabled by
> callers they're going to be enabled anyway in the wait_event_lock_irq()
> call which would be bad.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers
      commit: e43111f52b9ec5c2d700f89a1d61c8d10dc2d9e9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

