Return-Path: <linux-arm-msm+bounces-28714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2B953D05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 23:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD01288451
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 21:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C4A154458;
	Thu, 15 Aug 2024 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIrCfx/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F353153BED
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 21:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723759110; cv=none; b=mK/Ynih7hJMrOq0JXU4zLk82iRvCzuazH8n3ImKDAuPq2R0OnNGa7KwuPK4YP3pscquB5tGgNj9ja2tVFsmxtkqR9N82tRbewzYi1tkCV62PZqNXjShhc4/+rphDQVcEw3rsu02PG7dT1PHOHmusRNu5IPMJpbzqqyp0ATAunhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723759110; c=relaxed/simple;
	bh=0/x7GSCycSUhHwbfSrgpSMj8kPWl5MeZjdh8qGbaMfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Njziika77bvmmordFNXnQD3j0In01AFTMl3vOfqrLJu2OkxvVJyPUG9Sz0VjfhdOxdiNmVHXt/511lId2hsUNAP95+R3RVssVUBuXhpP+/9ridMxlk4JAj/GbQVz2cLe7h+HLGYDVrc3ypmEBafRFgCWYVwS4XNHnQvxTNDriJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIrCfx/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B49C32786;
	Thu, 15 Aug 2024 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723759109;
	bh=0/x7GSCycSUhHwbfSrgpSMj8kPWl5MeZjdh8qGbaMfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIrCfx/l9nbdJl+0eRjgKBlyL3R8wCuWmZ/Mo8d5ndWUL+yCnB6/vbpicZSZC1CMX
	 Q8XEn6G6rCvtI1+1RemdrXZYkpVqQyW/moRsE9hZY59bhrZdzgEnsiSTYSNest0AOY
	 BZFph3IPDkY3Vb9Iqr0Cj+HUnWtmHJQTAv0PpLYQptEGHnStU1dzNRGvYuC1EB2AUp
	 CQkoTtBAle96PO0gQuPcn17Rp8+AG4dEHepOV8X3Cd1SDHod65cWjNqKoRy21L61Ny
	 6mRtg/EYSBgh2TeJ93PEkzutgHP+03E0HAoCd7qqcL+oooTijn84yQ97Wdx0DBAyMd
	 ZDazsQL2K1P8w==
Date: Thu, 15 Aug 2024 16:58:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: tzmem: disable sdm670 platform
Message-ID: <lkfpaovkvkdqrbx5u4rf5nanodymedowyhg2d5wgo5sdrbhupr@i322n4yjgllf>
References: <20240730013834.41840-2-mailingradian@gmail.com>
 <CAMRc=MfPjc=QN729tiN3vxvyO_ECeqqODmjqjoea9E5Z1++TJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfPjc=QN729tiN3vxvyO_ECeqqODmjqjoea9E5Z1++TJw@mail.gmail.com>

On Tue, Jul 30, 2024 at 12:27:44PM GMT, Bartosz Golaszewski wrote:
> On Tue, Jul 30, 2024 at 3:38 AM Richard Acayan <mailingradian@gmail.com> wrote:
> >
> > The Pixel 3a returns 4291821499 (-3145797 or 0xFFCFFFBB) when attempting
> > to load the GPU firmware if tzmem is allowed. Disable it on SDM670 so
> > the GPU can successfully probe.
> >
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  drivers/firmware/qcom/qcom_tzmem.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> > index 17948cfc82e7..5767ef210036 100644
> > --- a/drivers/firmware/qcom/qcom_tzmem.c
> > +++ b/drivers/firmware/qcom/qcom_tzmem.c
> > @@ -78,6 +78,7 @@ static bool qcom_tzmem_using_shm_bridge;
> >  /* List of machines that are known to not support SHM bridge correctly. */
> >  static const char *const qcom_tzmem_blacklist[] = {
> >         "qcom,sc8180x",
> > +       "qcom,sdm670", /* failure in GPU firmware loading */
> >         "qcom,sdm845", /* reset in rmtfs memory assignment */
> >         "qcom,sm8150", /* reset in rmtfs memory assignment */
> >         NULL
> > --
> > 2.45.2
> >
> >
> 
> Ugh... As the list is growing post mainline merge I'm wondering
> whether we should make the generic allocator the default in defconfig
> and SHM Bridge an opt-in option?
> 

Can you confirm that we still need this, and the other entries in this
list?

Thanks,
Bjorn

