Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C9E53FE91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 14:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbiFGMSx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 08:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243578AbiFGMRn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 08:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5EA77F7485
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654604153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oMK24xIGG6wu595QaPQlChtbwsTC3JSyEhFxYI/TvBY=;
        b=FjUq0gs+Ne4/F5RXNkuLGNYNE6i12mTLsGAi87Scneatkv3b+jCoueak5RcsCcD9GWntWJ
        4fWeAcZ3ClsPhLgSwzTEKmh3XBzzs9nOJ6frKpHjrUf9agnxC3lHxKYF1HHeOhe5kwvPNS
        bQefxyAbpAdI4a7HgWjzzy7ClINr3pA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-8YMY78WjOtSHrnKrMscWTw-1; Tue, 07 Jun 2022 08:15:52 -0400
X-MC-Unique: 8YMY78WjOtSHrnKrMscWTw-1
Received: by mail-qv1-f72.google.com with SMTP id v15-20020ad4554f000000b004646455c054so10737156qvy.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 05:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oMK24xIGG6wu595QaPQlChtbwsTC3JSyEhFxYI/TvBY=;
        b=vFAykuw3nDV/7u/hCsugFO+0ADD+8k6fE3mKLpUpZv632E9YBs/8Jqu9ZHHmtVypE1
         5mWRpfhioG4H/e/mmFUjBPchNtSjRPGZl2q004HJdvWJnfSoLpTb2tu89xTF6FYP50hs
         bM9A+Sk2rP+DzXVPwFkJ1IO1O+5Bkqd1qXbw2DPLC/tGNzW2358POXouz0PyZwX3sRAQ
         x/tOcHpIbT1XEuTR2mnyqcT3dg0h7LqP+A0VPfsl/NIBqmFVIdApI1u/x9FxeoeAxfBN
         Tp668z4yY70+zgiJqGJGdfICUAJaYcabNJxUlfnw8a5GYd9BHGLElQt4Q7rkfXrdL8M3
         6TfQ==
X-Gm-Message-State: AOAM531tsYNfp0uXEOljQF7wDCcSjB6RgtAEHRk8fNTEs0O90KeMB4bd
        tlZB/uDAN7FQt/Kok2yO1QlEjJJLYVTkvvTc61uWZFwDE74EmjQyFG3qLiWEfu1XVc1EWL0kBJe
        y3FGRuiu5I1Lw2QgIEo9VTEYlSw==
X-Received: by 2002:ae9:df87:0:b0:6a6:acfe:f1ed with SMTP id t129-20020ae9df87000000b006a6acfef1edmr10438252qkf.579.1654604152062;
        Tue, 07 Jun 2022 05:15:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0A1/Z3+7HGeA0k9MPhFMYSifjOBR8tuyrQVy1bAdH0gssRyCDYA3k9yt79LLbL7gI80w4HQ==
X-Received: by 2002:ae9:df87:0:b0:6a6:acfe:f1ed with SMTP id t129-20020ae9df87000000b006a6acfef1edmr10438233qkf.579.1654604151818;
        Tue, 07 Jun 2022 05:15:51 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id bl33-20020a05620a1aa100b006a6f1c30701sm353511qkb.115.2022.06.07.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:15:50 -0700 (PDT)
Date:   Tue, 7 Jun 2022 07:15:48 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Bump parent usage count when GDSC is
 found enabled
Message-ID: <20220607121548.fhzpjcmoahlkue4t@halaneylaptop>
References: <20220606212112.3617731-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606212112.3617731-1-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 06, 2022 at 02:21:12PM -0700, Bjorn Andersson wrote:
> When a GDSC is found to be enabled at boot the pm_runtime state will
> be unbalanced as the GDSC is later turned off. Fix this by increasing
> the usage counter on the power-domain, in line with how we handled the
> regulator state.
> 
> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 44520efc6c72..a1fa7c4cff60 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -420,6 +420,9 @@ static int gdsc_init(struct gdsc *sc)
>  				return ret;
>  		}
>  
> +		/* ...and the power-domain */
> +		gdsc_pm_runtime_get(sc);
> +
>  		/*
>  		 * Votable GDSCs can be ON due to Vote from other masters.
>  		 * If a Votable GDSC is ON, make sure we have a Vote.
> -- 
> 2.35.1
> 

Makes sense to me!

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

