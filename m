Return-Path: <linux-arm-msm+bounces-88317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1249FD0BC30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 18:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D69093008894
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 17:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A91927FB12;
	Fri,  9 Jan 2026 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvoQCd7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282DB54763;
	Fri,  9 Jan 2026 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981050; cv=none; b=L45/LU5keJ03/100Aegof9AJRu/MLMcJ1CGe9fVT/s+OrY9HOMqbrPL+jnQJxUida6r/5YzmJ9Kre4ntk8Cg3eMxjY3JtTXt7+zHqTxxy5ruoORHkQ252905Eiso40rTho5eiK7lzDYk9KiPIH4TXH4y4oMeVuPfLQpGuHUomFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981050; c=relaxed/simple;
	bh=8PhSao9uMJFk+J0HXROjvaNSIa0Lee+U2jcKlvVBRKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VonLsOEiLzdN1oFbY4UVc75nzFtqqjZDzhbXqfC7en7dVnFT6kJ7dvr92WRKfi7SH33GWhh9RxGqj77ZdE/0xERnD4gi3lORu+i6zkNj8HPJX84DqNYr88FqOxWh8YCJ1YqBh9GRjrqoJHAt7MZbj5fN9/ij0R+GrSRLPDhkQJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvoQCd7/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBBBC4CEF1;
	Fri,  9 Jan 2026 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767981049;
	bh=8PhSao9uMJFk+J0HXROjvaNSIa0Lee+U2jcKlvVBRKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvoQCd7/+Kz/IUkv1Uht6QGxxBYjZiChBkbaJK7rtKu2AsQ4WRe3WvtkJU2K7jQsm
	 xPSk4BNt53pLK4MygnhqndH9UBv3C1xWACokq6K1wRXre9JQeeoBAglYK8Si5XlV72
	 5fFiFFTzOkTFp78FL+VvdlDF9GD+kfdzP0vtOlrXt9HgmLBCJRDBCE6/pIQolv6D4l
	 E8TOUua4r0e0Czw9RaHKNnaZBlUps9HzEBVD2FzcHqPj3p/MF4FdUwwVBkklb2ymWu
	 /R8be/oqNhbd7P0209b9eaq5icvs/ZF1R/BwnHmju2hVzvm+JAtClqyZWJUKv6ryth
	 tpniUEbJ8qBLg==
Date: Fri, 9 Jan 2026 11:50:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>

On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> > On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > 
> > > > To make sure the correct settings for a given DRAM configuration get
> > > > applied, attempt to retrieve that data from SMEM (which happens to be
> > > > what the BSP kernel does, albeit with through convoluted means of the
> > > > bootloader altering the DT with this data).
> > > > 
> > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > 
> > > > ---
> > > > I'm not sure about this approach - perhaps a global variable storing
> > > > the selected config, which would then be non-const would be better?
> > > 
> > > I'd prefer if const data was const, split HBB to a separate API.
> > > 
> > 
> > I agree, but I'd prefer to avoid a separate API for it.
> > 
> > Instead I'd like to either return the struct by value (after updating
> > the hbb), but we then loose the ability to return errors, or by changing
> > the signature to:
> > 
> > int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> > 
> > This costs us an additional 16 bytes in each client (as the pointer is
> > replaced with the data), but I think it's a cleaner API.
> 
> What about:
> 
> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> 
> I really want to keep the data as const and, as important, use it as a
> const pointer.
> 

I guess the question is what are you actually trying to achive; my goal
was to keep the base data constant, but I'm guessing that you also want
to retain the "const" classifier in the client's context struct (e.g.
the "mdss" member in struct dpu_kms)

If we're returning the data by value, there's no way for you to mark
it as "const" in the calling code's context object (as by definition you
shouldn't be able to change the value after initializing the object).

You also can't return the data by value and then track it by reference -
as that value lives on the stack. This has the benefit of making the
lifecycle of that object clear (it lives in each client) - but perhaps
not a goal of ours... 

How come the ubwc config is const but the hbb isn't?


If we want both the per-target data to remain const and data in the
client's context to be carrying the const qualifier, the one solution I
can see is:

const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
{
        const struct qcom_ubwc_cfg_data *data;
        static struct qcom_ubwc_cfg_data cfg;
        int hbb;

        ...

        data = of_machine_get_match_data(qcom_ubwc_configs);
        ...

        hbb = qcom_smem_dram_get_hbb();
	...

        cfg = *data;
        cfg.highest_bank_bit = hbb;

        return &cfg;
}

But we'd need to deal with the race in cfg assignment...

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> 
> -- 
> With best wishes
> Dmitry

