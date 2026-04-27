Return-Path: <linux-arm-msm+bounces-104775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKd9AWWZ72nQDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:14:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 782EF476EC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D65D305EAA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B442F3DFC98;
	Mon, 27 Apr 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLvDgVCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC63DCD86;
	Mon, 27 Apr 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309944; cv=none; b=dT4yROo94bNRRe7RFZoOv8Xtu13KmEqkYSw8X56tqS5woS36ccWOamBbtrIPekYFla+8YwcQxJITEoifMVaZ6XxnpVNI4ZolULSePOBwjibiG/i/qIoUqzbfv7al+2sc72ScWgivEPcZxCr3mdYoELTloccoQD//qUAg19SFbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309944; c=relaxed/simple;
	bh=x0wHrDndajbvYbniFczkxqF+4dEPk/mWr4CD3Z4w7Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHtUrWHisQLOdEQ9WU3hKZP6fl2BLu6a7F2O3m9q5Ek9E4t+jp4cvdVGb3/dzOXBhJiD1rIe71fzB0i7u6ePfTqKASp968TRE56bFdbZk57n7gcvHxRhcP0UEctSG4UXG0sjNagdajibpfexxYAh1ljiiv7LZyUZ47Ni9283KVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLvDgVCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928AFC19425;
	Mon, 27 Apr 2026 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777309944;
	bh=x0wHrDndajbvYbniFczkxqF+4dEPk/mWr4CD3Z4w7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLvDgVCcWK8XkASGaMG6D+dTQdb5LsQFRLnhywkX+UtFXNR7mv6vJAiVl/MotnIhg
	 Q/h5dkQxyt/Jwt5obJMOZQ/WkNWLU1a1TWMhFqf1LMMxcC+6JRtY+Xfn5Bt5Bo67Vz
	 X3xgesHl9UEBuUg4GhVOzui8Gq8TLiOx1mciTcmpORucvT3pwE1bZvxtQ7ZBQ+yg/R
	 D9fp7fZtypiZ7shEovNeh2AzLJ7ZOpRRvhBj/WSYdRGNZ/FvPnQirdi8IRrVyWyh7W
	 ziLhFAklzFy6NEGEhVBBi0tZJawZpFQRTAyccuySUbLyggMFc2M4LadkHH9pQiG5Tx
	 gkHIwyIEHKgCg==
Date: Mon, 27 Apr 2026 12:12:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop
 disp_cc_mdss_mdp_clk_src from getting parked
Message-ID: <ae-YlXZAuWqgPd-c@baldur>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
X-Rspamd-Queue-Id: 782EF476EC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104775-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Sat, Apr 25, 2026 at 02:33:51PM +0200, Hans de Goede wrote:
> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> to stop functioning. The EFI GOP framebuffer should keep working until
> the msm display driver loads, to help with boot debugging and to ensure
> display output when the msm module is not in the initramfs.
> 
> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
> 

Wonderful, thank you!

> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Could we attribute this to one of the commits that changed the parking
behavior and get a Fixes: here, so that we could pick it for -rc?

Regards,
Bjorn

> ---
>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index aa7fd43969f9..cd45bedf2649 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -580,7 +580,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_6,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> -- 
> 2.54.0
> 

