Return-Path: <linux-arm-msm+bounces-34758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF429A26A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EB411C228F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E191DED74;
	Thu, 17 Oct 2024 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX17GTGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449B91D47AC;
	Thu, 17 Oct 2024 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179082; cv=none; b=giuYkKe44C6F0RrWJyw50rvwfLLHDf2oO9AdOLou2Z7ZALS+ZMR6wE28eYfI3TjHRHksJTp0zaH4T5qbZEtLEHjPDeGOVEf0nJISeDAwIDqhhyAeq8KhEH9w1ezaNAtmOSGrPHXagbeHUiFPmgSag5C2Q1iXHIYU8bQz1uu+ibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179082; c=relaxed/simple;
	bh=yOgy16ew7fdVvk3EOFbXWHFgvL3i+snYRifRdjtz4ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hQyej/igimVkD3lwyFfs1Qfm44ICN9kxBCkInA9ZHpd21lz5Gx0qEnOseovNt+mTRw290xYVepUAi0RYitHTU0MuniFAq7G6Q6siWAAnMJBF1nZLp0omjnh1cyDws1sTsnQ5rtNsckICNejwuEWDUozPY6Q5TycjUjHutakr1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lX17GTGc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC5EC4CECD;
	Thu, 17 Oct 2024 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179081;
	bh=yOgy16ew7fdVvk3EOFbXWHFgvL3i+snYRifRdjtz4ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lX17GTGcYSeFwPRm5INwovwUslt4v7chxycBPHrGFNuoj6saEBRwSlLKQSIaB123m
	 oDIFrtTOWt1/pbbgMhZeTK5uw2LYPk8Itay8qkf5ZHihn8FsF7MBXLK86fA8RzDYly
	 bAy/kpfP9V5jUi8ZlWg+W1+JlGtBtPQeFsCKJBD0DZuR7k7HZZWDvbi/EYuug/QOz0
	 PP+ZRvjnZ774iVFxKcpB7RhCLNEwI2xdDrVnkO8q8I60lEv8MeLDl4QZN+UYraFhRJ
	 7VooCaLYqlrWr2AOYadKP2Q3m7PrVCl7+k281uD0aio0xOJgGAaFaT/XuZods4kebt
	 rwWe2d3AUt3mQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240911115253.10920-1-johan+linaro@kernel.org>
References: <20240911115253.10920-1-johan+linaro@kernel.org>
Subject: Re: [PATCH 0/4] phy: qcom: qmp-usb: fix NULL-deref on runtime
 suspend
Message-Id: <172917907975.278159.209159976898815690.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:01:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 11 Sep 2024 13:52:49 +0200, Johan Hovold wrote:
> When working on suspend support for Qualcomm platforms like x1e80100, I
> ran into a NULL-pointer dereference in one of the QMP drivers. Turns out
> this issue has since been reproduced in two more drivers.
> 
> Johan
> 
> 
> [...]

Applied, thanks!

[1/4] phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
      commit: bd9e4d4a3b127686efc60096271b0a44c3100061
[2/4] phy: qcom: qmp-usb-legacy: fix NULL-deref on runtime suspend
      commit: 29240130ab77c80bea1464317ae2a5fd29c16a0c
[3/4] phy: qcom: qmp-usbc: fix NULL-deref on runtime suspend
      commit: 34c21f94fa1e147a19b54b6adf0c93a623b70dd8
[4/4] phy: qcom: qmp-usb: move driver data initialisation earlier
      commit: 1dd196f9004848d0318e8831f962cc76255431d8

Best regards,
-- 
~Vinod



