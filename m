Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29C63966FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 19:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbhEaR0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 13:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbhEaR0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 13:26:15 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4F8C0494D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 09:00:26 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c31-20020a056830349fb02903a5bfa6138bso4558575otu.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fN1lwP5lK2ZHeH7sczhOwIckpr3tPGWDquAjHKUZXog=;
        b=hNYKEID4JhJQ2mBGmIIN/br18BpZwaCLF+jE9UTlU9G4HQaAIT8PKYg7Xi2ShY9p0Z
         HJ8jwKvkcDwZpduFmnUREoPTfGTi45BgDoW21Pe2B5/y9w49N6OQ53Hf61LTOqE2mdLL
         p41UdZh4U0m7xMBwP65sa4LSlne0ieiElX5+Z8uunSaN1FGtToqZ5ZcukecMif5DbvSV
         Aklse3P23K5Q8Nnz2Os4uKcIOWjl/3M0wQ3LfF6/6lf4Ql6oyCkETyTm9aqwAlRiE6tr
         8DKj0ZQxQtouvz89gHFm/TYaRI6Yeg11WhW0oD4Fy5fkkMN0Lgda4Zy1Ab3/DToUcXOb
         7UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fN1lwP5lK2ZHeH7sczhOwIckpr3tPGWDquAjHKUZXog=;
        b=fzxBeEL8gutjIGcYMkx/QnNPl14S6j+sAP1OwKYElD7yC23tiRILRPcW5XcUc4lC/e
         ZaAJYFZGNgrsZRujePPseG1J6/k3aZ1b2uDTVxVyHYqBczAohGNpiJHQ/StRz0F9km8O
         KRcuiIFis0Bo3+om+t8PRtmNQ673H40AyBhUltuwMtMp0CPDIOGaGk34PSsdGDgFMHuK
         LHMcIfAbjxWQj0Ividbyfs/5jTPTU67jiCFzKbk557uyYaNyhFcmVsQLm/Igx7dDy057
         SUcVXVuXyoYGQQaVdtnusO1i3WTiLuSC8JEjZeuHkXUcixlE3n1BBWmG9YXu1XwbFtHm
         NzFQ==
X-Gm-Message-State: AOAM532ccGQsuPJVvztRRpc364eODf+fp3O1Z0/c7/feLYLFi3THhdOL
        6MkFpzqlfOrRjZG2zWlDF8+0Yg==
X-Google-Smtp-Source: ABdhPJwDCCFNnIT0y3dFNpGmgGCryNc2EXOVlWu47wca+TIuoheauQKmB2zZiFIG/mzl0af1KpUMHg==
X-Received: by 2002:a9d:4105:: with SMTP id o5mr3928515ote.20.1622476825730;
        Mon, 31 May 2021 09:00:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x14sm2924059oic.3.2021.05.31.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 09:00:25 -0700 (PDT)
Date:   Mon, 31 May 2021 11:00:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linus.walleij@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Fix duplication in gpio_groups
Message-ID: <YLUIF84u6VjHyNnp@builder.lan>
References: <20210526082857.174682-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526082857.174682-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 May 03:28 CDT 2021, Manivannan Sadhasivam wrote:

> "gpio52" and "gpio53" are duplicated in gpio_groups, fix them!
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Fixes: ac43c44a7a37 ("pinctrl: qcom: Add SDX55 pincontrol driver")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sdx55.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> index 5aaf57b40407..0bb4931cec59 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> @@ -410,15 +410,15 @@ static const char * const gpio_groups[] = {
>  	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
>  	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
>  	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
> -	"gpio50", "gpio51", "gpio52", "gpio52", "gpio53", "gpio53", "gpio54",
> -	"gpio55", "gpio56", "gpio57", "gpio58", "gpio59", "gpio60", "gpio61",
> -	"gpio62", "gpio63", "gpio64", "gpio65", "gpio66", "gpio67", "gpio68",
> -	"gpio69", "gpio70", "gpio71", "gpio72", "gpio73", "gpio74", "gpio75",
> -	"gpio76", "gpio77", "gpio78", "gpio79", "gpio80", "gpio81", "gpio82",
> -	"gpio83", "gpio84", "gpio85", "gpio86", "gpio87", "gpio88", "gpio89",
> -	"gpio90", "gpio91", "gpio92", "gpio93", "gpio94", "gpio95", "gpio96",
> -	"gpio97", "gpio98", "gpio99", "gpio100", "gpio101", "gpio102",
> -	"gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
> +	"gpio50", "gpio51", "gpio52", "gpio53", "gpio54", "gpio55", "gpio56",
> +	"gpio57", "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63",
> +	"gpio64", "gpio65", "gpio66", "gpio67", "gpio68", "gpio69", "gpio70",
> +	"gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
> +	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84",
> +	"gpio85", "gpio86", "gpio87", "gpio88", "gpio89", "gpio90", "gpio91",
> +	"gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97", "gpio98",
> +	"gpio99", "gpio100", "gpio101", "gpio102", "gpio103", "gpio104",
> +	"gpio105", "gpio106", "gpio107",
>  };
>  
>  static const char * const qdss_stm_groups[] = {
> -- 
> 2.25.1
> 
