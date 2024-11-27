Return-Path: <linux-arm-msm+bounces-39246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E789DA18B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 05:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A5E168173
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 04:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1352F855;
	Wed, 27 Nov 2024 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRNANRtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C3320E;
	Wed, 27 Nov 2024 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732682741; cv=none; b=ayliHncRATRmJGN9mpMxiFOBPh8zQ3sgZSD5+HKMS5IEgL+A0slg2dsKbIhGhnyBuzw1K4HVz9OLxkp4LZ/RZlgWczKTnsoY4jCmEfixdyRfLUO1ZcK86LMHEJdS8MRRh6UZ7iViiRdwepcg8wSa3rXN9JHcmAj2fzzzV0xSlJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732682741; c=relaxed/simple;
	bh=jwWouk2doTDSnMPVqlNYcds+EY7AkvBTULO2Iq6KJeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fz30R7BabbKANfxpzmr+6YeVZWHdPzV0rCey6SEVnzC5KDiouxCR5vVEOsQjAHL3LV9xzPuGdVTlbvRF8sx0LhK6jorepeeFIM6fsYOIv/5w0DemRDA1tB+ECKegyDoRWrW1QD3Prx10oAe2TZIlrtctFw30lOyuKA9Jl5ISs1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRNANRtd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EBCC4CECC;
	Wed, 27 Nov 2024 04:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732682741;
	bh=jwWouk2doTDSnMPVqlNYcds+EY7AkvBTULO2Iq6KJeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRNANRtdQlYm6Z4c34jUJUtU6S5BKJVLPJFE2ZSv1X8IlqoeaDp2dlA2spQx2X/9/
	 jwqxfV155bpTVixnIwP+frf13Pfwf49ZaS8p5QqIhOeHk/0qMS72zOq3DGhhySackH
	 b5VoXFb8DiOWm/EJwkMkG3X5UAplVIIbMYNFHhpVzjTh7mm7k9LeA1+1koY98HyCGd
	 LRm+iFXFvBhNlhjhYJiiY46Di0SuLfV0Faz29hpANM0oJlwxwil/NEMaZ8jSsWspaC
	 nHMmS8kHg+AG8Hs0aDUoqvcJJAzKm4TJJwR1ag8MBKUvV7ymBb6uFfh/3wQ6j6EkJQ
	 j0OsYqy9K8hbw==
Date: Tue, 26 Nov 2024 22:45:38 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kuldeep Singh <quic_kuldsing@quicinc.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, Andy Gross <andy.gross@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] firmware: qcom: scm: Handle various probe ordering
 for qcom_scm_assign_mem()
Message-ID: <oq7on5krzvq2lsla4irfi4cr2lwnzejpowglzmovon7ye4dgsm@yqibu2el6j3l>
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
 <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-3-7056127007a7@linaro.org>
 <CAMRc=Me=Eu6+SpdguKurWgQDrpuo4qTCwWO6GfzS=YuA9vUzOw@mail.gmail.com>
 <a5343627-a325-465e-b744-747d4c1b2cae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5343627-a325-465e-b744-747d4c1b2cae@linaro.org>

On Wed, Nov 20, 2024 at 03:19:00PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2024 15:07, Bartosz Golaszewski wrote:
> >> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> >> index 5d91b8e22844608f35432f1ba9c08d477d4ff762..93212c8f20ad65ecc44804b00f4b93e3eaaf8d95 100644
> >> --- a/drivers/firmware/qcom/qcom_scm.c
> >> +++ b/drivers/firmware/qcom/qcom_scm.c
> >> @@ -1075,6 +1075,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> >>         int ret, i, b;
> >>         u64 srcvm_bits = *srcvm;
> >>
> >> +       if (!qcom_scm_is_available())
> >> +               return -EPROBE_DEFER;
> >> +
> > 
> > Should we be returning -EPROBE_DEFER from functions that are not
> > necessarily limited to being used in probe()? For instance ath10k uses
> > it in a workqueue job. I think this is why this driver is probed in
> > subsys_initcall() rather than module_initcall().
> Uh, good point. To my understanding, every resource like function can do
> it, e.g. clk_get. Whether drivers call it in probe() or somewhere else -
> e.g. some startup call like there is plenty in the ASoC or DMA
> device_alloc_chan_resources() - is responsibility of the
> driver/consumer, not the provider of that resource.
> 
> With such explanation returning EPROBE_DEFER is ok, just like returning
> anything else (e.g. EINVAL).
> 
> Now about this function: it is not exactly "get a resource" one, but
> still the caller might want to call it again later, which is implied by
> EPROBE_DEFER. Maybe this should be EAGAIN instead? Just like
> power-supply is doing in power_supply_get_property().
> 

The return value here will wander up the stack and I'm not convinced
that all callers will handle an EAGAIN in a favourable way.

The way we've dealt with this before is to say that if a client will
call qcom_scm_*() they must call qcom_scm_is_available() during their
initialization and handle the EPROBE_DEFER accordingly.

Regards,
Bjorn

> Best regards,
> Krzysztof

