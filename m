Return-Path: <linux-arm-msm+bounces-49182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0264A4250F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 16:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8C5441763
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352FF19AD86;
	Mon, 24 Feb 2025 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPrfsqy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061AB175D48;
	Mon, 24 Feb 2025 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408354; cv=none; b=sp81QQHeM4ZGZA6etPDTGXJ/7v5b4N5dKLN32KZnyPdbQwg02ef3XWDgk2VhKhI2q7zHUuyBgg/lprwq1UNw183luDluux9px1k+luJ8jL+y9qx9UAdonpNRwaymV6UAI9sGawW55pdFopVWBlWc2GCiXmghKIMqdAOvH+U/Bc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408354; c=relaxed/simple;
	bh=ujM50x4BBUOHKlivHdroNLmZ1MmHSsIVHccHWsgkcEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/xl4/5fH+A8lTurQXu8380331KQVfZ55UbPwjsHw9VA056j9g8FX424UjaAZCU6SSZ6Iuqz1MKOuF/a/N7pNaHbKrOwBXeRUbikPhbvefPMYYy3mPWEZ/6ungIY2UvbmArisuBsNy+LBruqilycITpWtX5KhPcfHTZ0QEdV3TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPrfsqy0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B486FC4CED6;
	Mon, 24 Feb 2025 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740408353;
	bh=ujM50x4BBUOHKlivHdroNLmZ1MmHSsIVHccHWsgkcEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPrfsqy0I2jVnLoNwB3eqL44DCzFti9Fg8t7ITPpIP2XZs4coedDArwp+r9zCf4vF
	 Leriuxqe13YJk7+BHkR8MepoyWVNMQJG7Sc2omAiyzMvawUqX6UlY3PfB/qTWAdC5V
	 CW6Y05qG9So7w+0cLQp/f/mkLbrDtvBz73wHQ0ck0+o4kOt8J0twOwvtjIcgKdpgNR
	 1QYX86KTG52TbMTZTYWVRk7s//LZuMhN4tb4YNan2xJvh99sy//8yGqCWqJY76f/sY
	 E0RN2p5WFOE/THTpQoWACIulu68dOElzjIB5a3U+UKab4yqSbU07HVcr6vuSUWPN+L
	 2HayzZgir6L/Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tmZie-0000000059k-2bfo;
	Mon, 24 Feb 2025 15:46:04 +0100
Date: Mon, 24 Feb 2025 15:46:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.13 32/32] irqchip/qcom-pdc: Workaround hardware
 register bug on X1E80100
Message-ID: <Z7yGLDkI1T4laWBd@hovoldconsulting.com>
References: <20250224111638.2212832-1-sashal@kernel.org>
 <20250224111638.2212832-32-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224111638.2212832-32-sashal@kernel.org>

Hi Sasha,

On Mon, Feb 24, 2025 at 06:16:38AM -0500, Sasha Levin wrote:
> From: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> [ Upstream commit e9a48ea4d90be251e0d057d41665745caccb0351 ]
> 
> On X1E80100, there is a hardware bug in the register logic of the
> IRQ_ENABLE_BANK register: While read accesses work on the normal address,
> all write accesses must be made to a shifted address. Without a workaround
> for this, the wrong interrupt gets enabled in the PDC and it is impossible
> to wakeup from deep suspend (CX collapse). This has not caused problems so
> far, because the deep suspend state was not enabled. A workaround is
> required now since work is ongoing to fix this.

> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Link: https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This one was not marked for backporting on purpose and is not needed in
older kernels, please drop from all autosel queues.

Johan

