Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9612EAE39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbhAEP1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbhAEP1F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:27:05 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D98AC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 07:26:25 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id z21so59304pgj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 07:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2IfTh+7P30cnAb9hMGVmci8Ic43r8KpVRp+A5H8J4iU=;
        b=S0LEjAkku+YyUL1G7akra9KxevmkELjODiE4jRbbTqHjXj/FmiY59ctnhsQU51PeTu
         mreoQLgG5yRaF2QzZtv/46tfV78xUjCJ/1UjBvPk/LvgJoq1WDBUttIeKenE7VbmF7/r
         5qwFOdL9Fup7F57EmWuv+DPYeu0Yalfv8oDrmjfPcv2Wfkp+yos9iHhFf7t8q+5aBrbH
         WmzTzX1XCOOPRIYbKdD4O9tSXqtuWwTmLe7km5Nds4G2e1hpebv6Eb/3/qKCsad53RFC
         SZu1MJw8TcEofhWvDlz4R+w9631gpCdbHIiiuWKdrhEcT5wh5yCslgn1RtRC059uUuIR
         KSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2IfTh+7P30cnAb9hMGVmci8Ic43r8KpVRp+A5H8J4iU=;
        b=NuHcXksqbycaevuAZPML9+j/4btGA6GdW2NXPWB981VI+EYRkh7VwHCojg2F/SZ5Do
         Xr1f8CK7TEqkZlitLttqrvZCjJVzhvPtFgB0lEML0l8exmcZFPqV8F/03wck8zvB+Z6+
         96T8g/JoA9+GLwQHvoW54XVTNGdW+juRVQiwVFrS9dWG7fbHJzt9A2fQYS/aDi/T8tFX
         b+lpRCh48tShLZ0QesOF3G0/9cS8HE/FFpqPyMkqlG0qaxNrm7nHOwspNdoByrJNowK8
         BNygS7Ajdjw0ieA4dKR1Odvw4eqf5CGGLrc/d1wf/zO1EK0wLc6EOqQtP4jsU0FcOl9s
         cIJQ==
X-Gm-Message-State: AOAM530G1ssEaUExurKnlX25il+7DrPAtVKZNMd1htnasIrVPNHxJ/ss
        rfiWC3wEjdFwmKIqgM7l1DoCxVynGhLa
X-Google-Smtp-Source: ABdhPJzgNCXLpcd+jHudTrmjH76P/B29WFjENBjne62uDn9CXh2/SalV0ggWrQqfrLa201fVg69zFg==
X-Received: by 2002:a63:308:: with SMTP id 8mr75816485pgd.15.1609860384825;
        Tue, 05 Jan 2021 07:26:24 -0800 (PST)
Received: from thinkpad ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id n15sm172564pgl.31.2021.01.05.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 07:26:24 -0800 (PST)
Date:   Tue, 5 Jan 2021 20:56:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] mhi: unconstify mhi_event_config
Message-ID: <20210105152620.GA14794@thinkpad>
References: <1609836975-5758-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609836975-5758-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 05, 2021 at 09:56:14AM +0100, Loic Poulain wrote:
> Some parameters may have to be determined at runtime.
> It is the case for the event ring MSI vector.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  include/linux/mhi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 62da830..48b1b2a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -290,7 +290,7 @@ struct mhi_controller_config {
>  	u32 num_channels;
>  	const struct mhi_channel_config *ch_cfg;
>  	u32 num_events;
> -	const struct mhi_event_config *event_cfg;
> +	struct mhi_event_config *event_cfg;
>  	bool use_bounce_buf;
>  	bool m2_no_db;
>  };
> -- 
> 2.7.4
> 
