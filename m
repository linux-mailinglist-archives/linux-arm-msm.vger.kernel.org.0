Return-Path: <linux-arm-msm+bounces-15598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AB4890817
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 19:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93F5F1C2C61E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 18:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB0280616;
	Thu, 28 Mar 2024 18:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Srlt5lru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3527D414
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649757; cv=none; b=M7TdLtOouw/nG26xjrbpT6QmWA+BJLk4GOS6d4xZyDgMaeulqAHb+fi3xkToexgDqowH8i6KzR6cZkKtUG+FDfjmxK0Du/raRmY+admjnrWJQAN/ucspC1MbC6zoPr/BAlUFTMJ8S5orYcfdswWWSVDpRaQbpFoG1MQIfL7Xj9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649757; c=relaxed/simple;
	bh=XYumxhYQMlVXPyD6eFz7QV/Af0iVgBK9pjvmrjbn53I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XBoDXfcOwLTe0mruSFYKfviIwufXruU13KG7YdMmQEc73ppLBdxyMqHhUIYrQcaC2I6z/FEcpYUqN62LDaRyhRFi59NLOD6tJOf2eA+nNmwJkz3qgWBzGJql5FwCXEGQl2xqv33tL3hMeAeVvvnWWJ6KgqyPA+ws2dEDK3MB1m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Srlt5lru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E00FC433F1;
	Thu, 28 Mar 2024 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711649756;
	bh=XYumxhYQMlVXPyD6eFz7QV/Af0iVgBK9pjvmrjbn53I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Srlt5lru4pZE9gnz9nYJ33Bhg1GtU7BoRo14z6mUvxVjUafLV/W5t6OcD48DTSLun
	 K/NHOlsULIG1LYtQux+ai9Eloc6jc66HzJznVREy0ej7GJ7VsK/vmL2COHrbr6ZYWI
	 1kgTjRatEz0LYKEQuxt794DRZqHmhlyNhCpUQCjjzD7rJy05ebhSBRTqVwzlhKbLgQ
	 lpQl5x5eqyLAczCE28+3xNbCzG8V2lKQ5qeKNh4Y6+GOipTIG0izLnGiPeF1uVHN02
	 BpztGVoGQVN35b2g3j4+dpKTXci8wGRg0nQ/iFGh6NO/9y6gsyt6VxvFNnSEWF43VP
	 CdaVM2ijP9MlA==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, kernel@pengutronix.de
In-Reply-To: <20240307180359.190008-2-u.kleine-koenig@pengutronix.de>
References: <20240307180359.190008-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] soundwire: qcom: Convert to platform remove callback
 returning void
Message-Id: <171164975143.128475.15075246895425655363.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 23:45:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3


On Thu, 07 Mar 2024 19:03:59 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: Convert to platform remove callback returning void
      commit: fe12bec586332f3f84feea6dddad15d40889034a

Best regards,
-- 
~Vinod



