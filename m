Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C319351875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 18:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfFXQXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 12:23:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38796 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfFXQXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 12:23:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 50B0160741; Mon, 24 Jun 2019 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561393395;
        bh=uk6cBxIXao9iEvJBb+AfcSRpkw/3gQ16yglsIxt1O5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nH3emTquvUEq8PSMFf8nt3svF7D2My627FyozvoVyj7SiqeRRYZK5ZFOtWmDhFYcx
         2d+C+jTZti3k+BZgloTC7tc6yAD8X4EVSbE03aWvmxKvAvGekHyVGXToqs6lLbb/vJ
         qTyroq0hK6JWJbk8uSj4pfm53YhXpRHedWpA5BG8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D56C60741;
        Mon, 24 Jun 2019 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561393392;
        bh=uk6cBxIXao9iEvJBb+AfcSRpkw/3gQ16yglsIxt1O5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IQ3OES0uHQ2eMiOKfaHI2N8wTAzXLK2Nrw5bmRJmWFmJZCNzOyUz8fQyZF1foeleI
         LtRestFPxritDTCWTvsTAX2hH0IwKKkVl7JOwLE0PvDl2YQoXvsB2j1AOuTLqW3nTd
         6xOrcExMqQnrJb86KdXbsNeQ1zmWdgW5TDxXc2SM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D56C60741
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 24 Jun 2019 10:23:09 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a3xx: remove TPL1 regs from snapshot
Message-ID: <20190624162309.GE17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190624162008.21744-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624162008.21744-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 24, 2019 at 09:19:54AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> These regs are write-only, and the hw throws a hissy-fit (ie. reboots)
> when we try to read them for GPU state snapshot, in response to a GPU
> hang.  It is rather impolite when GPU recovery triggers an insta-
> reboot, so lets remove the TPL1 registers from the snapshot.

Not to mention that write only registers are incredibly uninteresting for a
snapshot :)

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Fixes: 7198e6b03155 drm/msm: add a3xx gpu support
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index c3b4bc6e4155..13078c4975ff 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -395,19 +395,17 @@ static const unsigned int a3xx_registers[] = {
>  	0x2200, 0x2212, 0x2214, 0x2217, 0x221a, 0x221a, 0x2240, 0x227e,
>  	0x2280, 0x228b, 0x22c0, 0x22c0, 0x22c4, 0x22ce, 0x22d0, 0x22d8,
>  	0x22df, 0x22e6, 0x22e8, 0x22e9, 0x22ec, 0x22ec, 0x22f0, 0x22f7,
> -	0x22ff, 0x22ff, 0x2340, 0x2343, 0x2348, 0x2349, 0x2350, 0x2356,
> -	0x2360, 0x2360, 0x2440, 0x2440, 0x2444, 0x2444, 0x2448, 0x244d,
> -	0x2468, 0x2469, 0x246c, 0x246d, 0x2470, 0x2470, 0x2472, 0x2472,
> -	0x2474, 0x2475, 0x2479, 0x247a, 0x24c0, 0x24d3, 0x24e4, 0x24ef,
> -	0x2500, 0x2509, 0x250c, 0x250c, 0x250e, 0x250e, 0x2510, 0x2511,
> -	0x2514, 0x2515, 0x25e4, 0x25e4, 0x25ea, 0x25ea, 0x25ec, 0x25ed,
> -	0x25f0, 0x25f0, 0x2600, 0x2612, 0x2614, 0x2617, 0x261a, 0x261a,
> -	0x2640, 0x267e, 0x2680, 0x268b, 0x26c0, 0x26c0, 0x26c4, 0x26ce,
> -	0x26d0, 0x26d8, 0x26df, 0x26e6, 0x26e8, 0x26e9, 0x26ec, 0x26ec,
> -	0x26f0, 0x26f7, 0x26ff, 0x26ff, 0x2740, 0x2743, 0x2748, 0x2749,
> -	0x2750, 0x2756, 0x2760, 0x2760, 0x300c, 0x300e, 0x301c, 0x301d,
> -	0x302a, 0x302a, 0x302c, 0x302d, 0x3030, 0x3031, 0x3034, 0x3036,
> -	0x303c, 0x303c, 0x305e, 0x305f,
> +	0x22ff, 0x22ff, 0x2340, 0x2343, 0x2440, 0x2440, 0x2444, 0x2444,
> +	0x2448, 0x244d, 0x2468, 0x2469, 0x246c, 0x246d, 0x2470, 0x2470,
> +	0x2472, 0x2472, 0x2474, 0x2475, 0x2479, 0x247a, 0x24c0, 0x24d3,
> +	0x24e4, 0x24ef, 0x2500, 0x2509, 0x250c, 0x250c, 0x250e, 0x250e,
> +	0x2510, 0x2511, 0x2514, 0x2515, 0x25e4, 0x25e4, 0x25ea, 0x25ea,
> +	0x25ec, 0x25ed, 0x25f0, 0x25f0, 0x2600, 0x2612, 0x2614, 0x2617,
> +	0x261a, 0x261a, 0x2640, 0x267e, 0x2680, 0x268b, 0x26c0, 0x26c0,
> +	0x26c4, 0x26ce, 0x26d0, 0x26d8, 0x26df, 0x26e6, 0x26e8, 0x26e9,
> +	0x26ec, 0x26ec, 0x26f0, 0x26f7, 0x26ff, 0x26ff, 0x2740, 0x2743,
> +	0x300c, 0x300e, 0x301c, 0x301d, 0x302a, 0x302a, 0x302c, 0x302d,
> +	0x3030, 0x3031, 0x3034, 0x3036, 0x303c, 0x303c, 0x305e, 0x305f,
>  	~0   /* sentinel */
>  };
>  
> -- 
> 2.20.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
