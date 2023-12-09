Return-Path: <linux-arm-msm+bounces-4073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C780B1E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 04:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907F428155A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 03:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C440610F6;
	Sat,  9 Dec 2023 03:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWGblCDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A127F
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 03:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96368C433C8;
	Sat,  9 Dec 2023 03:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702091957;
	bh=SLaF6IE1Yn5LfSEved29p+6U9oFQ5UxNbVEWHYgWroI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWGblCDCoYH1Yt3S514ZcwZfMnwlKoOox75g1Hwe0D9a05eO3Ij375MDOVH00cfB7
	 F9GSmpPY0qsgPlVdlD+BztWy3UrErQrwLV7Sb+RamBia2AZhc5BoMS3LNzqHt2P/oj
	 zdRy6OVi6ZQLYJ9S3OH7WBv5qbbhhkJLpH87zkVHCovy+4WW29Q1kmcr0oeSSAD8kh
	 R0r3cCDTMx5MIjBaE/M3V39vUVWRV+ZrpCvEI+oUa32tAIt75g7dGNp7pJ+e3gIvZl
	 YXnTMSVQhTMGzNCy5T39kX9AbHITYWHzuNle2XYqjG/zcD6+arijgJs+bJSEyf91Ho
	 MqaSQYU20KGfQ==
Date: Fri, 8 Dec 2023 19:23:51 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: 'Bjorn Andersson' <quic_bjorande@quicinc.com>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] soc: qcom: stats: Fix division issue on 32-bit platforms
Message-ID: <i6umadq3losoudlpdpj3pst2gizevwlvqgohcewcaanvu2svow@ojionieh722v>
References: <20231205-qcom_stats-aeabi_uldivmod-fix-v1-1-f94ecec5e894@quicinc.com>
 <e59bb661054945f7a77b2f67c70d30f7@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e59bb661054945f7a77b2f67c70d30f7@AcuMS.aculab.com>

On Wed, Dec 06, 2023 at 02:07:16PM +0000, David Laight wrote:
> From: Bjorn Andersson
> > Sent: 06 December 2023 00:44
> > 
> > commit 'e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")' made it
> > in with a mult_frac() which causes link errors on Arm and PowerPC
> > builds:
> > 
> >   ERROR: modpost: "__aeabi_uldivmod" [drivers/soc/qcom/qcom_stats.ko] undefined!
> > 
> > Expand the mult_frac() to avoid this problem.
> > 
> > Fixes: e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  drivers/soc/qcom/qcom_stats.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> > index 4763d62a8cb0..5ba61232313e 100644
> > --- a/drivers/soc/qcom/qcom_stats.c
> > +++ b/drivers/soc/qcom/qcom_stats.c
> > @@ -221,7 +221,8 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *unused)
> > 
> >  	for (i = 0; i < ddr.entry_count; i++) {
> >  		/* Convert the period to ms */
> > -		entry[i].dur = mult_frac(MSEC_PER_SEC, entry[i].dur, ARCH_TIMER_FREQ);
> > +		entry[i].dur *= MSEC_PER_SEC;
> > +		entry[i].dur = div_u64(entry[i].dur, ARCH_TIMER_FREQ);
> 
> Is that right?
> At a guess mult_frac(a, b, c) is doing a 32x32 multiply and then a 64x32
> divide to generate a 32bit result.
> So I'd guess entry[i].dur is 32bit? (this code isn't in -rc4 ...).
> Which means you are now discarding the high bits.
> 

entry[i].dur is 64 bit, so this should work just fine.

Arnd proposed that as ARCH_TIMER_FREQ is evenly divisible by
MSEC_PER_SEC we just div_u64(dur, ARCH_TIMER_FREQ / MSEC_PER_SEC), and I
picked that patch instead.

> You've also added a very slow 64bit divide.

Without checking the generated code, I'd expect this to be a slow 64-bit
division already. But this is a debug function, so it should be fine to
take that penalty.

> A multiple by reciprocal calculation will be much better.
> Since absolute accuracy almost certainly doesn't matter here convert:
> 	dur * 1000 / FREQ
> to
> 	(dur * (u32)(1000ull << 32 / FREQ)) >> 32
> which will be fine provided FREQ >= 1000
> 

I'm quite sure you're right regarding the accuracy. I think as this
isn't in a hot path, the more readable div_u64() feels like a reasonable
choice.

Thank you for your input and suggestion though!

Regards,
Bjorn

> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

