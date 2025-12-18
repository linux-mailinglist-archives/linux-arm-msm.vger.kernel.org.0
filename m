Return-Path: <linux-arm-msm+bounces-85619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C3CCA17C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 03:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CC1C3007964
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 02:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B2B212F89;
	Thu, 18 Dec 2025 02:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaFyr8A0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C901519AC;
	Thu, 18 Dec 2025 02:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025226; cv=none; b=gZVhBupa9UXDTGuLnhxa9NU8M+Q+jddVrF1CRjc1ekeaHZ62t69vywTDmskFAFW1BnK76WiRJRZACgYNJ3aqeLSbVx/p8A6CCQKsslHFsyWj/PAdC2tzIbU6/4qEWdLddnCYAjUxaPxCmSzxsCTjVVax4b17KPvUjB+i6D1UP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025226; c=relaxed/simple;
	bh=at+cvYLRwIHU0Dw66Rjwt8ZWOv/hRjjnl+jMCyTxKrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1AbQ+qyenqdO9L+YbV3nYPjOoMZOxWjgt7ZDRGHgfOoIa8+OPHzXX3akvOpQZIzMmGl2vYkCgPTm6covKYw3+DwwwY4HAGKb8jvdhsPziflLKlDIGN0iZfetqJllZbRi2sMI3NRldX32yU/ImCXAPWCCxvRSQnBbb+vK6BsG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaFyr8A0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF1AC4CEF5;
	Thu, 18 Dec 2025 02:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766025226;
	bh=at+cvYLRwIHU0Dw66Rjwt8ZWOv/hRjjnl+jMCyTxKrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DaFyr8A00vwzWp/3aYYNHinkqeBjbUTIbSRb3a5BcqoMpec2WKBI2q4SlSwTfsj1l
	 GVDr+9ynh80h0d9RSpBHCwLJLUg/Vwqvle2ikkMo7ruvJQTW1IegT2zJupKIFbjiiq
	 OSz4HYYPkzrWlsWm+oWdqYjKYIKDxWM1TCGCBEy8LBN7dkAm93Dtj2i3dKL7AkOhO0
	 6xjYQDD7wNeFmA6SW65Uv0PsxmVnXSykkh/DVK1eMSmuMuZj/AP/LEN4tRFoRPPF5B
	 rKDcWeFvWK82TLUhw+tUdSeykxlgMPC/p2Yf0m1+Pc6s1tH0PFi0t296wguGWIq7L9
	 3IlU+WfnEtqmQ==
Date: Wed, 17 Dec 2025 18:41:54 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
Message-ID: <b3sfrp463snupwgxssoenq37tooecoy7wgmy4arw62hbhq4suv@qj5fma65jztw>
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
 <ilxtc76huyt47fqueiko5t5o6xe6kgc6bunlxenbqlg4dzltha@clpk2bpraax7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ilxtc76huyt47fqueiko5t5o6xe6kgc6bunlxenbqlg4dzltha@clpk2bpraax7>

On Wed, Dec 17, 2025 at 06:39:00PM -0800, Bjorn Andersson wrote:
> On Tue, Nov 25, 2025 at 11:42:39PM +0530, Taniya Das wrote:
> > Update the RPMh VRM clock definitions for Glymur to add the suffix to
> > indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
> > C8A_E0 clock resources.
> 
> This clearly explain what the patch does, but could you please start the
> commit message with a paragraph (or sentence) that explains why this
> change is done?
> 

Never mind, I figured out that you have resubmitted this patch as
20251209-gcc_kaanapali-v3-v5-1-3af118262289@oss.qualcomm.com, but in
some way that patchwork wasn't able to detect that they are the same
patch.

Thanks for addressing my request in that version.

Regards,
Bjorn

> Regards,
> Bjorn
> 
> > 
> > Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/clk-rpmh.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a370ab2d96c34fa8e7a090e8427b11008318c02f 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
> >  
> >  DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
> >  
> > -DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
> > -DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> > -DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> > -DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> > +DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
> > +DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
> > +DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
> > +DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
> >  
> >  DEFINE_CLK_RPMH_BCM(ce, "CE0");
> >  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> > 
> > ---
> > base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
> > change-id: 20251125-glymur_rpmhcc_fix-5daa36a1e8ff
> > 
> > Best regards,
> > -- 
> > Taniya Das <taniya.das@oss.qualcomm.com>
> > 

