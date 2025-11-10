Return-Path: <linux-arm-msm+bounces-81040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1DDC473E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5ED3B06EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C83313E06;
	Mon, 10 Nov 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3UKjnX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76131355F;
	Mon, 10 Nov 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762785315; cv=none; b=dhchazKegpdj/NLCXivlxy4tr2D3PJNeU05STXO9xhzEWA71ta5pYBO970ohHFXa+HiQq4+2d7Q+ad1fHo5T3YyGwNJXLc7PaI5e9b4mJ+wlAqxuSyKWQ7N2r4lcTSNR/XuXB099zW8Knmwy9TCBoL28D6gdrmnJ+JAQPND+TbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762785315; c=relaxed/simple;
	bh=H+NeCQZyJ3FrRAyNmW1uwJi2sTQM5CPCDpAyzhoE1nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRLcexf1j4ng77n9DViI595F7/SBkWYoVY0dthsngMEI9UqvhVqKl+W3El/BwdLx9IDgjlzXCMdHhcDr1YK0rhvuodxTbphw7eYVWfy0HBFlIAzFd1L5vK+8ex9R414Nuww+9MzpUffCOkRZqVy8b/b0MBXsxN7icJcuhg4rX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3UKjnX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037CFC19424;
	Mon, 10 Nov 2025 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762785315;
	bh=H+NeCQZyJ3FrRAyNmW1uwJi2sTQM5CPCDpAyzhoE1nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3UKjnX8hUBPhrVYuuBNZfHdauDMLUzlXl65kSP7yd4j/iPDwmNgqMjPQasE3l/+a
	 LN012CHjB7A5J3Tm4oLVPyhJIUlv74CnNgCVTTbvKlRy06M4z0dQ5Zc4IjUr9JTmcb
	 yutHNZUZxZHOdBGqjolmM6kOYokzwnmwUo6zmJsHhiBNNVg0AJwlzYmKdnlxQs5HH6
	 1o6zeo7buInBDFgnOoYlC6Xxa6Kza16jhdq+lXcXDU/ZABPSmbHoLhyGjkTE7ViVpL
	 /wYjdAWmP9brLyMjhlzXuA4y5Uj4+IXc/NSmGa+55hDOUlpxHHKkFKozjgYDHWGA6A
	 9csQy72zVAGGg==
Date: Mon, 10 Nov 2025 08:39:20 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V1] mmc: sdhci-msm: Avoid early clock doubling during
 HS400 transition
Message-ID: <wshfjbdjmoe5hfsmh2rrwxiy67wo4k6i7bzap4hz4n5j22uiol@xz7wfxaw4bve>
References: <20251110063801.641866-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110063801.641866-1-sarthak.garg@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 12:08:01PM +0530, Sarthak Garg wrote:
> According to the hardware programming guide, the clock frequency must
> remain below 52MHz during the transition to HS400 mode.
> 
> However,in the current implementation, the timing is set to HS400 (a
> DDR mode) before adjusting the clock. This causes the clock to double
> prematurely to 104MHz during the transition phase, violating the
> specification and potentially resulting in CRC errors or CMD timeouts.
> 
> This change ensures that clock doubling is avoided during intermediate
> transitions and is applied only when the card requires a 200MHz clock
> for HS400 operation.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..eca6a09a4547 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -355,7 +355,8 @@ static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
>  	 */
>  	if (ios.timing == MMC_TIMING_UHS_DDR50 ||
>  	    ios.timing == MMC_TIMING_MMC_DDR52 ||
> -	    ios.timing == MMC_TIMING_MMC_HS400 ||
> +	    (ios.timing == MMC_TIMING_MMC_HS400 &&
> +	    ios.clock == MMC_HS200_MAX_DTR) ||

It's a bit ugly that sdhci_msm_execute_tuning() passes ios.clock as an
argument to msm_set_clock_rate_for_bus_mode(), which then calls
msm_get_clock_mult_for_bus_mode() where you reach back into ios.clock.

In fact, having msm_get_clock_mult_for_bus_mode() reach into
host->mmc->ios to get ios.timing, seems a violation of the original
intent of the prototype.


How about cleaning this up and passing "timing" as an argument to
msm_set_clock_rate_for_bus_mode(), and then pass host, clock, and timing
to msm_get_clock_mult_for_bus_mode()?

That way we avoid this mix of passing parameters to the functions in
both arguments and in state at the same time.

Regards,
Bjorn

>  	    host->flags & SDHCI_HS400_TUNING)
>  		return 2;
>  	return 1;
> -- 
> 2.34.1
> 
> 

