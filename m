Return-Path: <linux-arm-msm+bounces-46292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BEDA200BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B22B8165081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22451DBB19;
	Mon, 27 Jan 2025 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohpJOPhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B093A1D90B1;
	Mon, 27 Jan 2025 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738017653; cv=none; b=k9Lm8Z6R0zdLCz5zBoqorG3E7pKKQhNF7/+IzdTH5Cs8LW/VqO3xuTd/6jTWslJ17cJm7irYObeukdYE8rtiqw9HThSFbik2HdOGPocgq4Fmy6nFj56LXx5V0PRPJ7Wrv+nwDOSa2fGUpwzJyzuhwC2TCAxLZSVa3GE9jePnYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738017653; c=relaxed/simple;
	bh=8n6GFq2wSsDW3UJiuOFend+qwj0qBJNXurbpJnrEFGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzzsBsHkor5bfJmuFQoLw/pIT+mxNgUmpWuEkN7awGtpKXHTyGcPULo0x0ggUhyfxfY1NS8rvhlU9aOMMD6IX1sei5nm1cmE6oN37e7lUab33l1ZpQ0mbnMNUAi/+7YCYapEzz2EeihPRYA2QUqzJbIb36CHQtwQkZKxVADjFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohpJOPhh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB268C4CED2;
	Mon, 27 Jan 2025 22:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738017653;
	bh=8n6GFq2wSsDW3UJiuOFend+qwj0qBJNXurbpJnrEFGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohpJOPhhj8jAFO655veGMIMxliz9kaesGQVF5VL6+7F5BqBXW4u4qQSBBJXDBtXxr
	 apYbv9TPCKrf4WX09+K+RiquAl8cyDrw3vHsVWEhcFR9lrZaRXa+19n5eUc6RoGUpa
	 miXj2dtTDf13Q8HmBY07woVRhn0n1SzgfC8dpgjsSZ+61Hj1YC2PS50zbhzGZw7Hwn
	 +l/Hh6jSarFT7I6GLNUKC0BcdpZljClIcoe5IGmbc65uLER7aWrb+XkI1waAK7Sozq
	 7Rx4xAq7EttpFoGQTwEyNC5rCth1qjUObYxA8ZIYA5ryhSK22fRU+SN3bjo/BsJVs0
	 ztTRL2NHgxmhQ==
Date: Mon, 27 Jan 2025 16:40:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <hn5lcdbdmvdntmufgvzju2xsvxwplxeoechzgtxgmqkcswooxc@6zuqbfyriqnc>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <Z5fJFRMHIvKoN4cE@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5fJFRMHIvKoN4cE@linaro.org>

On Mon, Jan 27, 2025 at 06:57:41PM +0100, Stephan Gerhold wrote:
> On Mon, Jan 13, 2025 at 09:11:33PM -0800, Bjorn Andersson wrote:
[..]
> >  118 files changed, 8389 insertions(+), 670 deletions(-)
> > ---
> 
> This is quite a lot of code and new files for a temporary migration.
> It's also difficult to test these changes fully, since there are
> separate overlays for each SoC and sometimes even each board.
> 
> Would it be easier to just duplicate the dwc3-qcom driver for now?
> Making a copy of the current dwc3-qcom.c would be just 1000 lines of
> extra code, compared to more than 7000 for the overlay approach.
> 
> The copy (e.g. dwc3-qcom-legacy.c) would keep handling the old bindings
> with the existing code (that is known to work to some extent). We can
> then improve upon the main version without risk of breaking any old
> DTBs. If we decide to drop support for the old DTBs at some point, we
> can just drop dwc3-qcom-legacy.
> 
> This approach is also not pretty, but I think the risk and effort would
> be lower than making sure the overlay approach works on all the affected
> targets.
> 

I like this suggestion.

It's much more isolated and we know the current state of the driver
works with the current dtbs out there - so backwards compatibility would
be handled. I also did end up having to use separate compatibles for the
old and new binding/driver, so this should be quite clean - i.e.
nicer than the overlay-based path...

The one drawback would be that devices that isn't updated to a new dtb
would not gain the upcoming improved support for role switching, or any
of the improvements in pm_runtime-support (as I assume we'd only care
about the new driver). But I think that's worth the saving in
complexity.

Regards,
Bjorn

