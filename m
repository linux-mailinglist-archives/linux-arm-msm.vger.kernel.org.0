Return-Path: <linux-arm-msm+bounces-84544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D65CA9F99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 04:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 373B6312FD02
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEC11F875A;
	Sat,  6 Dec 2025 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m42q4Bq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA853B8D4A;
	Sat,  6 Dec 2025 03:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764991739; cv=none; b=GeDrclQsCeBhgq10FLqzlUtz9hXvVixZ5FsllgbBBQM0nF6xr2xOaYjUGmDTg535XdpGtnX6iz3y8O7LsidKDhMP8+DAFcxmET5lU/rxrUMZlENK+BQhJg6e3p4qFzESTA6AS8YExxtR93uDCmKye3S3gt3jshW0X/Ge6R0Sdh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764991739; c=relaxed/simple;
	bh=0a7Ns2M6sEf4LDbayDwwxEh898Y9DINV0uVzzrxzmzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4MK6VHMNAXIRpXJIiovFg++YjhUCEGAekM+pLQinGmn+ev1yvhFoSnP6MV3Tu2nZGPulyusjTckjfCso/vIZR3g8yT81b6MWVsy4adZSeuwHIfcy0n52fTP/9cMA0dI9y0i6LXZCDhc8tZ0deWUbqFRwutJcIhR5UC8Dv67PwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m42q4Bq/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19660C4CEF5;
	Sat,  6 Dec 2025 03:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764991738;
	bh=0a7Ns2M6sEf4LDbayDwwxEh898Y9DINV0uVzzrxzmzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m42q4Bq/vQzvRFt9k6MiujrTFUap2q1cYw0Ndn80rgTXaj5zenR0AZTRyNVXCPd6u
	 X8Qo8EjZVkYur50uU8ygr07KBZP0efgqyPgYVMG6wM9DA69SfOBZbli7/3qJ4zSIgC
	 Cn9EET7wRgW0Avnm6JPDH+O3cD3v1BUOOGuFtuQX9niMfytJMp0lEES368IWtNlgOF
	 qeerrSGaipAi3i9G62Hj4Iv9LF/lBkOKvtF2uQFhWKSvMnvTSJ1ReOz/+x0aw1wq30
	 gJFf4wD42apAg5GJ6v1km6LXuzPWsWnGvJK9C7XDF1cdc8qQUo1CUsiTHLtPXGenul
	 UNqNBsXVPctbQ==
Date: Fri, 5 Dec 2025 21:35:18 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, 
	konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of
 qcom,halt-regs
Message-ID: <p35eenkcktshiat63auykuch2mxztp52tw5ak2meidsxys6e66@vad4bpkdkgk4>
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
 <qszmet2vcmricxze56b5p2jegmqwc4io7fewhhniqskyic636v@lnswyat7577p>
 <87ba595e-353b-4c8c-b398-9f8245336f05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ba595e-353b-4c8c-b398-9f8245336f05@gmail.com>

On Fri, Dec 05, 2025 at 08:19:57PM -0600, Alex G. wrote:
> On 11/29/25 3:18 PM, Bjorn Andersson wrote:
> > On Fri, Nov 28, 2025 at 07:32:05PM -0600, Alexandru Gagniuc wrote:
> > > The "qcom,halt-regs" consists of a phandle reference followed by th
> > > three offsets within syscon for halt registers. Thus, we need to
> > > request 4 integers from of_property_read_variable_u32_array(), with
> > > the halt_reg ofsets at indexes 1, 2, and 3. Offset 0 is the phandle.
> > > 
> > > With MAX_HALT_REG at 3, of_property_read_variable_u32_array() returns
> > > -EOVERFLOW, causing .probe() to fail.
> > > 
> > > Increase MAX_HALT_REG to 4, and update the indexes accordingly.
> > > 
> > 
> > Good catch, thanks
> > 
> > Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Hi Bjorn,
> 
> I noticed that v1 of this series is included in the pull for v6.19 [1], even
> though there is a v2 [2] with some of your and Konrad's feedback included. I
> wanted to check if this is your intention. I am okay to go with v1, and am
> happy to submit any further improvements after the merge window.
> 

That's strange, I should have sent you a "thank you" email when I
applied it. I added my Fixes, and must have missed Konrad's input (or it
hadn't shown up yet?)

Without looking at Konrad's feedback, please send a new patch on top of
what I did merge if the changes would be beneficial.

Thanks,
Bjorn

> Alex
> 
> [1] https://lore.kernel.org/linux-remoteproc/20251205200342.119676-1-andersson@kernel.org/T/#u
> [2] lore.kernel.org/linux-remoteproc/20251202162626.1135615-1-mr.nuke.me@gmail.com/#r>
> Regards,
> > Bjorn
> > 
> > > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_wcss.c | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> > > index 07c88623f5978..23ec87827d4f8 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> > > @@ -85,7 +85,7 @@
> > >   #define TCSR_WCSS_CLK_MASK	0x1F
> > >   #define TCSR_WCSS_CLK_ENABLE	0x14
> > > -#define MAX_HALT_REG		3
> > > +#define MAX_HALT_REG		4
> > >   enum {
> > >   	WCSS_IPQ8074,
> > >   	WCSS_QCS404,
> > > @@ -864,9 +864,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
> > >   		return -EINVAL;
> > >   	}
> > > -	wcss->halt_q6 = halt_reg[0];
> > > -	wcss->halt_wcss = halt_reg[1];
> > > -	wcss->halt_nc = halt_reg[2];
> > > +	wcss->halt_q6 = halt_reg[1];
> > > +	wcss->halt_wcss = halt_reg[2];
> > > +	wcss->halt_nc = halt_reg[3];
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.45.1
> > > 
> 

