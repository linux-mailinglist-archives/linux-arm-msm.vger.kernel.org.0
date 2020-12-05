Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983FB2CF971
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Dec 2020 06:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgLEFJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Dec 2020 00:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgLEFJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Dec 2020 00:09:25 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C73C0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 21:08:45 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id h3so8787588oie.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 21:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AyIY+EP1kTc66souxbGUy1GbHLsA8jmF+Piubmnixrg=;
        b=Xu6x42sQ1atznZ0iEomRJXMcKGTuKh6ZDCRRe7CxjO3ZgK1dhOyyWz6ij18ltWhinJ
         eGnIJzJJoE8zPoQoSUtXxJ1td9idp8bvulMv7XgzaZNA6SBlAsiJLw8OgJcZ3dJ09l9v
         BjpO6BoyTYUoUQVkiAg/OaHsoXcE3iGgqDGCQgY2HYXZG6mYrS3JEBSqulb4w3kHq6zr
         Z97fk/eQSyVzC2plrSfBYetG382Q1NLGVIyy5egKaU9rK4RKwKJSSuamhiRU/coiozt2
         nBgCwbui2AE7RqmR/GyrTs/P9bYLkxDg5nHaSz2xyyLSibzZIRkvgfcO0tAg8s8ClQ/k
         Gsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AyIY+EP1kTc66souxbGUy1GbHLsA8jmF+Piubmnixrg=;
        b=B94HrZuuEw0joW21JmiU6EEkqGyvvz10nvasoaHX70WJXQfpmnr5TeEIk409jhWMeF
         DZSAeRQ2vEGqOEvvu1qHebrT2EwI+bSH1lFXhYpju2mOQEi0YPvgF46K3R+di+3s6rKx
         k6jT0M3qCpN1BTosC3S1N8gzdN71A8ACvq/yFJiYcaOPdpgcFCkFbC+oa0wCkON0wBJO
         BlEGproOZlLNesjBFzDZIxAQXkdlqhyl0Fy7HHQUxD5Dtfwx4mEiaalnSnvn337nwdcN
         iQjA7urvzEIgH6PjlByOZYvaondLiO1ih6cPbendnR1KZF8PSe67dpwdA5KN8vUZiHIT
         dbKw==
X-Gm-Message-State: AOAM533CqG4r+jxqrltycbG4uPouXlCihAexU/JWYauBuAC9INQuB/VL
        ++EmQ1hFHQ84OI6my4CKyy2d0EwvMqUghA==
X-Google-Smtp-Source: ABdhPJzkLJCnxgkfJHUfmcZd4KJw+CTxck3Yq502Yvm5toYbmwFiU0T5vVOgIlRFHqNeMw1Wb0wpcA==
X-Received: by 2002:aca:560c:: with SMTP id k12mr5526899oib.134.1607144924456;
        Fri, 04 Dec 2020 21:08:44 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m81sm1181090oib.37.2020.12.04.21.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:08:43 -0800 (PST)
Date:   Fri, 4 Dec 2020 23:08:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     agross@kernel.org, sboyd@kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: mmcc-sdm660: Add MDP clock source CXC to
 MDSS GDSC
Message-ID: <X8sV2UOipnhP1Y78@builder.lan>
References: <20200926130306.13843-1-kholk11@gmail.com>
 <20200926130306.13843-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926130306.13843-4-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 26 Sep 08:03 CDT 2020, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> It is required for optimal performance and to avoid MDP stalls to
> retain mem/periph on GDSC enablement: to achieve this, let's add
> the required CXC to the MDSS GDSC.
> 

Can you please explain how you came to this conclusion, I don't see the
reference to the MDP_CLK_SRC in the downstream kernel.

Thanks,
Bjorn

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
> index 234aca7c873b..7b1384cf8506 100644
> --- a/drivers/clk/qcom/mmcc-sdm660.c
> +++ b/drivers/clk/qcom/mmcc-sdm660.c
> @@ -2572,6 +2572,8 @@ static struct gdsc mdss_gdsc = {
>  	.pd = {
>  		.name = "mdss",
>  	},
> +	.cxcs = (unsigned int []){ 0x2040 },
> +	.cxc_count = 1,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> -- 
> 2.28.0
> 
