Return-Path: <linux-arm-msm+bounces-73756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 233EAB59C45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C961C03548
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A634345722;
	Tue, 16 Sep 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lP++sHly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F58293C44;
	Tue, 16 Sep 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758037129; cv=none; b=rkDQUnr4piyiV+93cGjPc8M3AOXEPU+WRfrU4HF4+DNiqsEGwh81XsIy9uBGipBtiDv6/OvPhI3xd/svMUrpkiIbkOvZFoflwFxqGX5VBf4ASsTmmVywsTU7BG9yPso/lP9mpNyGESNRCffinKdRE6W2hkQVXetjyGJsJknCXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758037129; c=relaxed/simple;
	bh=P3wG5soFYqyWrmIaLuRgRoQgSQObMaGfwT0bw/aoPl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpcUQLvO6v7pd4rtX3Q4Mt7zJr3AAC2MAqVBcvbXKppezc2PMiEzwdwEVW/t38Bh4hWuGONz6F+VlEVpCdFsegyGYjMDom0IWpW403dN+WVVeyZkJm8nzqv1hls6/QSsw2HSRyMRWP/zSRWbehruZBfBH0tkVOmiRDPVsKdxM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lP++sHly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8668DC4CEEB;
	Tue, 16 Sep 2025 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758037129;
	bh=P3wG5soFYqyWrmIaLuRgRoQgSQObMaGfwT0bw/aoPl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lP++sHlyj7k0eEAPOf/uITuuhvToi25EFQBWluFvV7SJpQKeEHmsvioVssY+/G0iI
	 V5NtNobDYKbYhyI/nWtyCS2bHlV8+ah3+ApYUWNIR5ISUw8Fpj+Mp8JdRcWT30AUNr
	 GKMWp/v5yWLfI04NGrVEXFRKIghcL95tO7Lhq5N1zZgKJ7RQd6xPDG40eexlcci7aK
	 yUXONV5/nJLKfE9dnDvuVcGy4Ar2A5b/U/MXkrx9er5n2X/DQDyuHf12HrRp2isiQn
	 7CJ3U60bctuWmjJNqjiFBzllsI5i7/YLU+u99IFK5DDq7l6BWfOWlDlIuD8r3ElNMG
	 U5JhcG2VR4hXw==
Date: Tue, 16 Sep 2025 10:38:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
Message-ID: <kisbrykgmv7kigae4fdqm7uwkodwhhlgysja4cfaegr3zvvwiw@m6jahyjpy46m>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
 <bsjcwbwvvw4eov4aaf4xk2bes4p4wsxvb53rsxkwhgd7bk44ix@wnbvksy6m3li>
 <e90501b8-6af1-4473-b4f5-2fe1f118a5b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e90501b8-6af1-4473-b4f5-2fe1f118a5b4@linaro.org>

On Fri, Sep 12, 2025 at 09:23:00AM +0300, Vladimir Zapolskiy wrote:
> On 9/12/25 05:09, Bjorn Andersson wrote:
> > On Thu, Sep 11, 2025 at 04:12:13AM +0300, Vladimir Zapolskiy wrote:
> > > Make Titan GDSC power domain as a parent of all other GDSC power domains
> > > provided by the SM8550 camera clock controller to enforce a correct
> > > sequence of enabling and disabling power domains by the consumers.
> > > 
> > 
> > I don't understand which problem you're solving.
> > 
> > Are these GDSCs children of the titan_top and your patch is describing
> > that so that when a client is enabling any one of them they will be
> > enabled in order?
> > 
> > Are you correcting the description of the hardware? Or is this a hack to
> > trick the system into performing the operations in order?
> > 
> 
> Consumers of power domains are unaware of power domain hierarhy, same
> with clocks for instance.
> 

There are several valid cases where this might not be true.

> When a consumer turns on/off a power domain dependant on another one,
> the parent power domain shall be turned on/off, and it shall be done
> by the power domain provider (camcc in this case), if the power domain
> hierarchy is set. The changes in the series establish the hierarchy,
> otherwise the CAMSS driver as a CAMCC consumer is irrecoverably broken.
> 

Excellent, here you're saying "X is parent of Y, this needs to be
described in software". This is completely different from the original
"let's just make X parent of Y".

> > 
> > Please start your commit message with a problem description, then a
> > description of your solution.
> > 
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> 
> I've started from "describe your changes in imperative mood" section,

The 7 paragraphs leading up to that are important as well ;)

Looking forward to v2.

Regards,
Bjorn

> I'll resend the changes with the reformulated commit messages, thank
> you for review.
> 
> > > Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > ---
> > >   drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
> > > index 63aed9e4c362..b8ece8a57a8a 100644
> > > --- a/drivers/clk/qcom/camcc-sm8550.c
> > > +++ b/drivers/clk/qcom/camcc-sm8550.c
> > > @@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
> > >   	},
> > >   };
> > > +static struct gdsc cam_cc_titan_top_gdsc;
> > > +
> > >   static struct gdsc cam_cc_bps_gdsc = {
> > >   	.gdscr = 0x10004,
> > >   	.en_rest_wait_val = 0x2,
> > > @@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
> > >   		.name = "cam_cc_bps_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > @@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
> > >   		.name = "cam_cc_ife_0_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > @@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
> > >   		.name = "cam_cc_ife_1_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > @@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
> > >   		.name = "cam_cc_ife_2_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > @@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
> > >   		.name = "cam_cc_ipe_0_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > @@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
> > >   		.name = "cam_cc_sbi_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > @@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
> > >   		.name = "cam_cc_sfe_0_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > @@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
> > >   		.name = "cam_cc_sfe_1_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > +	.parent = &cam_cc_titan_top_gdsc.pd,
> > >   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > >   };
> > > -- 
> > > 2.49.0
> > > 
> 
> -- 
> Best wishes,
> Vladimir

