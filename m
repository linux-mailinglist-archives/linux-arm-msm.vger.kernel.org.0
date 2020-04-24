Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6321B6D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 07:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDXFhV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 01:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725852AbgDXFhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 01:37:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F088C09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 22:37:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id y6so3494796pjc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 22:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+pEdo7FoT+8rIIkf67cF+HbAagDt9BJysxaSwF5QNvI=;
        b=gR3uh2RkgZKafzMCtjDQgnqKxzdnSwbnGNph9VqDIc/5TxuFkOOEJRxo4ROgDp9fBt
         ckFtsizxYOVyfPkrK0T5q0UqsHxQhw0zgvepKKwYISEPP0vf2Un5lffLleYF8cFhUjIE
         FcFjXC7wcfQG3RkWX0Q4JfBvBOCd0081cZ5kQHaryCSewd5sn+3oVB47VZdY6WLcggz5
         WSeB2QeKjI4Ow11xC6aHyW6cSGnV7gapAFi5e+Lm1VlFgPYwuB2otw1d6zB1wrAMrtN+
         AVBBQRIYP1jaFtefFOQoXBYsUbtWN2N3mYMY2o52yQHvtpLfeucCdMxga5+bk5Dwl9cc
         LSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+pEdo7FoT+8rIIkf67cF+HbAagDt9BJysxaSwF5QNvI=;
        b=FwQQzHu0DoybP1xu5ckQMQUUXQWKxi9Yts3Azvd9M68w3qlw+81GyjMxyAbFnsikdT
         fO8RC9FEVKUy2i0cBmV1A+UfFhSmZc4RHsxHdjiQDW33X3H2vbxlALPUinDCr1uHdv67
         7FoLaPFjhkEyWMMSjbTVLPSy2OAxkuPwnhPM19Ad/DlY5EVLnmbkfaTMNVhZ6TJ3Iahu
         eSZ6kcfRSlvIqkFKOSffg6Zf0djJ4CvYm4p+xIPyTfcq/7vDbHlAf87Il7jYty4WqiRo
         zyb9u636JVkPkLeW2+OgYZVmcbzx0K/n2v3UoN2de5XoLtCAadfjaGmN/Rme45/W+FoI
         8S7Q==
X-Gm-Message-State: AGi0Pua25S5sPHBsxsQoQyK8qF9Zwhdr5Ne5eKz5mxvIJ2V5oxFtcjZI
        8G7LQm07Nwz1tTXJeS2IMr4Lmw==
X-Google-Smtp-Source: APiQypLEmG4Dhpgbc96eigaH0M+6gvJ2ml+eyScVCRhE0VcMxKP0oupLYOgy/Qsurk5KtHG5Wqy7xQ==
X-Received: by 2002:a17:90a:37a3:: with SMTP id v32mr4764052pjb.2.1587706639783;
        Thu, 23 Apr 2020 22:37:19 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y21sm4424636pfm.219.2020.04.23.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 22:37:19 -0700 (PDT)
Date:   Thu, 23 Apr 2020 22:37:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition
Message-ID: <20200424053748.GX20625@builder.lan>
References: <20200424045414.133381-1-swboyd@chromium.org>
 <20200424045414.133381-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424045414.133381-4-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Apr 21:54 PDT 2020, Stephen Boyd wrote:

> Move the WARN_ON() into the if condition so the compiler can see that
> the branch is unlikely() and possibly optimize it better.
> 
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/soc/qcom/rpmh-rsc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 462dd267afef..f7763f008e03 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -373,10 +373,8 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>  
>  	for_each_set_bit(i, &irq_status, BITS_PER_TYPE(u32)) {
>  		req = get_req_from_tcs(drv, i);
> -		if (!req) {
> -			WARN_ON(1);
> +		if (WARN_ON(!req))
>  			goto skip;
> -		}
>  
>  		err = 0;
>  		for (j = 0; j < req->num_cmds; j++) {
> -- 
> Sent by a computer, using git, on the internet
> 
