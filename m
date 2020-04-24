Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50741B6D54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 07:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgDXFgx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 01:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725823AbgDXFgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 01:36:53 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9C8C09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 22:36:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t9so3502659pjw.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZhnONtykAfnsqa3IwkU1k8fhowiK4Exd+SQDhYlxkkE=;
        b=TfGgPPK1TxT3gMb2eG8p5CMEtzEyu18TYw54WstOEXZqF21dCs6qJQG+nvSUs1+a35
         iAX1DZKjE/o9OctBDxHYW66jJj4RXh5CLglh0R31oAmwjOL7pW+cYeg2fs5l0/ecFggW
         NDsP+lX3nuoZ0vTEJnGACD3nPLdyZpNuJrV2pHg/LvSzvnBuuFHZs6nmapUTTBPnvZPZ
         +lCfJa9Ir+IXhtCbzbK0JvKKgrig+WObsgtyXrGIDRBhkBZ+PdKdQuCJwUs7scDyTELr
         PnAHMXhn20dEM+Ir1cKfQjsx2AiznpX3mlv1mgv2wA2CPYuYJ9P14TAsrnJwV5lNAZGt
         i7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZhnONtykAfnsqa3IwkU1k8fhowiK4Exd+SQDhYlxkkE=;
        b=h2IeZvNRr7cbFbuQfrxdwtlSWuTzqwIl19wGjVHvFLDdzhpu7YkTNF+qFkmzHZuhym
         vYIKuw/Pa2g9HannMAAXVvguOzlfHM5W11uaqYVVPDjyQ3mmwdmBUikWK7pgEbB0t0QZ
         5JucI3riyWCKUuylebt7mclL2GMx0OlvyhQW+mu/z8fTfzAgv9Kdrew4cUhaunsENkKL
         shZf4B43d8wAL/lhJMFGd8oH+Iizitf0rm6JXX3U0MHKBo/mSs4lJ58//4wSjIyelPZx
         B/HUPopbuhVph4AJj5dNtQj5iHRqDa3+gdx6Jk+HyIZzYEYLf4ewA9x23ovHiYQk/rsJ
         Tklw==
X-Gm-Message-State: AGi0PuZUywYuIzP/KPQpoKrtmLKcLE8/Rqx4fkYDlxHjSExXCU2vxM4y
        vyjKFUlG3a7zd6boOgMDlao498lmfF0=
X-Google-Smtp-Source: APiQypLiHMqhyAGxLqmuGbbCEuklJYAieSPoChxeYti7LoKjj/AQ3szJ44XCT6e0cwR+DJh46437RA==
X-Received: by 2002:a17:90a:23cd:: with SMTP id g71mr4337368pje.174.1587706612508;
        Thu, 23 Apr 2020 22:36:52 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b140sm4402370pfb.119.2020.04.23.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 22:36:51 -0700 (PDT)
Date:   Thu, 23 Apr 2020 22:37:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] soc: qcom: rpmh-rsc: Loop over less bits in irq
 handler
Message-ID: <20200424053720.GW20625@builder.lan>
References: <20200424045414.133381-1-swboyd@chromium.org>
 <20200424045414.133381-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424045414.133381-3-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Apr 21:54 PDT 2020, Stephen Boyd wrote:

> readl returns a u32, and BITS_PER_LONG is different on 32-bit vs. 64-bit
> architectures. Let's make the type we stash the readl into a u32 and
> then loop over the bits set in that type instead of potentially looping
> over more bits than we will ever need to.
> 
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/soc/qcom/rpmh-rsc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 76e0294a672c..462dd267afef 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -365,13 +365,13 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>  {
>  	struct rsc_drv *drv = p;
>  	int i, j, err = 0;
> -	unsigned long irq_status;
> +	u32 irq_status;
>  	const struct tcs_request *req;
>  	struct tcs_cmd *cmd;
>  
>  	irq_status = readl_relaxed(drv->tcs_base + RSC_DRV_IRQ_STATUS);
>  
> -	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
> +	for_each_set_bit(i, &irq_status, BITS_PER_TYPE(u32)) {
>  		req = get_req_from_tcs(drv, i);
>  		if (!req) {
>  			WARN_ON(1);
> -- 
> Sent by a computer, using git, on the internet
> 
