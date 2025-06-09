Return-Path: <linux-arm-msm+bounces-60667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23EAD238E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F399B3A641C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7324A1DEFE8;
	Mon,  9 Jun 2025 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMNaY9o5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA62192F1;
	Mon,  9 Jun 2025 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485836; cv=none; b=oC/kCxCWIbsRnxl0u1qnddIdBzABtCXcxtrhaLGuVv6mZIzg6St+6UpMbLTvc6lBOmPYBLoN/E4gcAozqmQZW2V5IYJoHENNPnixFPQplrW686y7qmAHiWm90JeLi7YSG0e5ON8tojxmZI5cBg5f6FRTCEWpcP1AGTRhwJ4L8Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485836; c=relaxed/simple;
	bh=tAuxNvbxSwpy1+qI0aq2zcU198vntvJtWfnUZiLo/qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hTTld7crbLJSD81pQeHHt64wSxYvRadh58rSUqc8jByl2zlV61N4pEdkoZbKNFcQYFKSeO/90tBd6yUn7hbjJ0uUMj3TFO43Xrz1a8Eqvfm42LptEVO9bcdfcm6sQnNy94NoCMPaL7E6/6Pt9cNLcmwctyMnGgUHgM036pPAbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMNaY9o5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440D1C4CEF0;
	Mon,  9 Jun 2025 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485836;
	bh=tAuxNvbxSwpy1+qI0aq2zcU198vntvJtWfnUZiLo/qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QMNaY9o5EUyOvFMXhwX0XQD3mxl2kTyjng83JGxHKUA5qiGPWmijiyc+Qzt/lgyR0
	 +FhuGSA4xlbjOrUh+JfV5YpkbRu59CPgg16RO6mHbBFMeCqf4ZiD+01Gud6RiLIHsW
	 58NQoLbpBY8mS9zoHokzdac0jniPM/8igpNZSRsXs3QkSvq/UepjlXQULKy3vXbZTV
	 tzeNn2bp1ZIKPuD4bgaitYemHrPpWfmS6FvthudLDDT9Qj6Iz6kVIkCtH7jHgkRZ9N
	 A1GOzN/0UIwlQnF6N3Bl3qzZQ2B09/VsqjKwpwU1CVyXxFqdqcHg7z3LlLy5GyDWWs
	 2YddJSQCeJZTQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250523085317.11439-1-johan+linaro@kernel.org>
References: <20250523085317.11439-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] soundwire: qcom: demote probe registration printk
Message-Id: <174948583390.818152.14215125858704023461.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 21:47:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 23 May 2025 10:53:17 +0200, Johan Hovold wrote:
> Driver should generally by quiet on successful probe.
> 
> Demote the Qualcomm controller registration info message to debug level
> to make boot logs a little less noisy:
> 
> qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: demote probe registration printk
      commit: 5b8c1f39b5e46505cf9cf7775759a9e9c2bfc2d9

Best regards,
-- 
~Vinod



