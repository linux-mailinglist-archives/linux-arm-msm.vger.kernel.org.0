Return-Path: <linux-arm-msm+bounces-47935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02137A34BAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159833A10BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3411FFC41;
	Thu, 13 Feb 2025 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyZxuFem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A821514F6;
	Thu, 13 Feb 2025 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739466883; cv=none; b=Azsj41/Ag092lokoIgYL0Teqz99FaCHh79o/mB8a3QNGEoTrFjzwqX9RCcdQQbY8k2b+OLbRO0Ttw57+lVQ6ARc776MkGmZI5rF0BbUESdZX4xlJgoGZlRN1U81McYcVLGeBys8+gvCzX/21/6du0U0Jc6fAhXAJPrY5aFm08Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739466883; c=relaxed/simple;
	bh=GcsVikiIX3LK72p/q3Te5VOgFxkdd86cKUDlsZnDRbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLeRjrr9wwZ6Mvuwi44G6D0eck+aZx4LQ/57T3jVbjeqhw2iq1PhPp+urWNoaVP7bAx2DX2390AviqFo1NNyldUbObWJ8VFSyIMYdyAGOh4sotGHjrR6v7COnsl71uuvPHkwB5bTa+WvbpDDzqaTJjHMjSkrkDBGmdV0FWGC774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyZxuFem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B639C4CED1;
	Thu, 13 Feb 2025 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739466882;
	bh=GcsVikiIX3LK72p/q3Te5VOgFxkdd86cKUDlsZnDRbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyZxuFemm0qG1nQAfJ/7yDJRsrFl/tfIxgfMSXK52qWDCstv1e3X2RKIk84Ey0bLv
	 KNPPG+SDLMyEVirYOvwsklUX8tzX427C2x1cuIi11RasCjoQqXEgW918gc0DZuvFQb
	 03vlgRs7ZEoJh3VTokjmcPqk/adurYAPftE7P5cwzL2NINDqeTgswh3yVkkd1y0QP4
	 0NqC25FWKaMfYD2vyEijOoJ/spV6A8VOKJmjk39yLH1ffv2XZC31d5H9TiuWDtVwqQ
	 UUJYw1WSecGGNd16cRVd3sNHapF1/rHErblOV5gLqbJOmgXvGQ9h8X0A0fMm6sv1PV
	 PNhOvSnxZ1lYw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1ticnb-000000006th-3RSi;
	Thu, 13 Feb 2025 18:14:52 +0100
Date: Thu, 13 Feb 2025 18:14:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-pdc: Workaround hardware register bug on
 X1E80100
Message-ID: <Z64oi_UVsJAxmm28@hovoldconsulting.com>
References: <20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org>

On Thu, Feb 13, 2025 at 06:04:00PM +0100, Stephan Gerhold wrote:
> On X1E80100, there is a hardware bug in the register logic of the
> IRQ_ENABLE_BANK register. While read accesses work on the normal address,
> all write accesses must be made to a shifted address. Without a workaround
> for this, the wrong interrupt gets enabled in the PDC and it is impossible
> to wakeup from deep suspend (CX collapse).
> 
> This has not caused problems so far, because the deep suspend state was not
> enabled. We need a workaround now since work is ongoing to fix this.
> 
> Introduce a workaround for the problem by matching the qcom,x1e80100-pdc
> compatible and shift the write address by the necessary offset.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

I've been running with this patch for a while now and it allows me to
wake up from deep suspend on the X1E CRD using the power button (or
GPIO interrupts with further patches):

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

