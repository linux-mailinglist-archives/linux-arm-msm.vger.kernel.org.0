Return-Path: <linux-arm-msm+bounces-25170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE4926310
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 16:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A6D1F22A55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD2917BB39;
	Wed,  3 Jul 2024 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jZJ+FeSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A21DA30B;
	Wed,  3 Jul 2024 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720015765; cv=none; b=Ov934M0tDx1qve9wyzx5y1IkB8zaDrH1u3kOCPfaXzfKg0/uHVKfaPBYkmvEhI8g0lj6Gvx9p4Kqsa1Imwg7YPFBCw2PNnZ54mFWVQzHG+pTZ3PI3rNZ2ZEdas+rFNB7LReIvWEotT2LLnoB057L1A2Rcm3AXBroaVnLPh4jWS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720015765; c=relaxed/simple;
	bh=KOEr66kO/U5HDZJss2QxmjfpmOLru0F+aJ1bM1+yhPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J949iEpuHi1kVSr0Vu72dp36r1wQ1YEkTJYny/oD4gWlApJpXHnmkcsm7WDIF5JZGw0y2wkmGjB89vJOtggMYgyBe4ds4iUSs57Ei6pASMA8/jTab0mCZEjC/jtSc9tG31pk6yhHp/J5feTZL0DP9vXuLgzfqNb7zwQCB/7q/N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jZJ+FeSO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE76CC2BD10;
	Wed,  3 Jul 2024 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720015765;
	bh=KOEr66kO/U5HDZJss2QxmjfpmOLru0F+aJ1bM1+yhPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZJ+FeSOmhChR9Hct4fN1zbchydvmD/t5X8MBnfVXRHC2p1tn8BsY354NwtJryqBI
	 oZMc0Y5X68KD3gq4kYrfvPauLQy6uytDOKx5lCeEHK8dW/g5q4jBE7wEU7WRblCybw
	 M0XwuKAtaYQmnEdlmbaU4deVS69k8DknJ7k+mZPU=
Date: Wed, 3 Jul 2024 16:09:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] serial: qcom-geni: fix lockups
Message-ID: <2024070326-stability-glamorous-fcc1@gregkh>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624133135.7445-1-johan+linaro@kernel.org>

On Mon, Jun 24, 2024 at 03:31:32PM +0200, Johan Hovold wrote:
> Since 6.10-rc1, Qualcomm machines with a serial port can easily lock up
> hard, for example, when stopping a getty on reboot.
> 
> The first patch in this series fixes this severe regression by restoring
> the pre-6.10-rc1 behaviour of printing additional characters when
> flushing the tx buffer.
> 
> The second patch fixes a long-standing issue in the GENI driver which
> can lead to a soft lock up when using software flow control and on
> suspend.
> 
> The third patch, addresses the old issue with additional characters
> being printing when flushing the buffer.
> 
> Note that timeouts used when clearing the tx fifo are a bit excessive
> since I'm reusing the current qcom_geni_serial_poll_bit() helper for
> now.
> 
> I think at least the first patch should be merged for rc6 while we
> consider the best way forward to address the remaining issues.
> 
> Doug has posted an alternative series of fixes here that depends on
> reworking the driver a fair bit here:
> 
> 	https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@chromium.org/

I'm confused.  Should I take this series, or Doug's, or Doug's single
patch that they say resolve the immediate issue?  I can't tell what was
agreed on here at all, so I'm going to drop all of these patches and
wait for a resubmission that everyone agrees should be what is taken...

thanks,

greg k-h

