Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A3B1E9EED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 09:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgFAHNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 03:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgFAHNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 03:13:54 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB79BC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2020 00:13:52 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d10so3060492pgn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 00:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AKvqbopCxSK7alJn7A9xL+iWVXBO/n1hj0E6fA+LFb0=;
        b=tM0kt67QldyP7UV8LOqknHLW1pqpuz6T4a4193cYANsI0dLhTR+AvmgGrrLvY7qfDB
         y3jgzSATCCoppYN3TwpQcMhGQ5Vs6sugkQzSMAwu+6PNoqKUDD6igy8oq+GIgXnzkTLI
         qnq1pymicpTqSqF0IciL4WVWjRC7elv7kXeKrUJ3VTS68tf1zuagl64dgRlpEjAV3wa5
         YOpbij7oJdeSM3fzOc4a80b8AvIZHAuyxzaH+YY8xjQZiE6p7VXIplgThtKQ23OGoNb4
         bdHXoyXInAr2XLJayp4P5RxZWpp+kDl/WBj4vFIBceiekeSi33HBJ/KnfZA0dIwO1SrB
         Yo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AKvqbopCxSK7alJn7A9xL+iWVXBO/n1hj0E6fA+LFb0=;
        b=i1xOzV2xZpcLCHutRfKHBD8zusYI07tWZArxrWh3f9fFdd0cBJPrcvWXaVcdffP062
         iNhE662WFp/bQ4i0w+VnDcjddjOZQ0ynYc8/ojd9mdURDNU+bJYoKo/KM6pLPkVhBrtr
         OcobrQc0L3dTuROyj9N6lIHTk442f/wYBIk01iCU6MwM6F8l+B6ot1dxXRhtRco20Zig
         SFpg9OBraf4v8+9sp/YJnXTi/oFp3awjwEw3CePPfaRpbBYoVUrc5BmGQq8ZH6wEIqX+
         dX6iOrq92tDvOo5ECwthe1ik+zz7heUm0rXsaFICpvz8PEZUuSddHlZVsgQCR72f+d3P
         sUVQ==
X-Gm-Message-State: AOAM530wxZgZiweVU/u4OgQol29leLiRpLT9nNgYCMmotmp8LqnUYAqs
        tWd3UdkFCwaPg9ZXUICHkuKIjQ==
X-Google-Smtp-Source: ABdhPJzOENz9gqJsxWrUDSjLfjGRJlNnZ8GK6nwzJja6s5/O4OFU3DcW+6Kp4hfJ2S5EwsRpMRdJQA==
X-Received: by 2002:a65:68d2:: with SMTP id k18mr18217100pgt.110.1590995632387;
        Mon, 01 Jun 2020 00:13:52 -0700 (PDT)
Received: from localhost ([122.172.62.209])
        by smtp.gmail.com with ESMTPSA id z20sm7146224pjn.53.2020.06.01.00.13.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2020 00:13:51 -0700 (PDT)
Date:   Mon, 1 Jun 2020 12:43:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org, nm@ti.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, saravanak@google.com, mka@chromium.org,
        smasetty@codeaurora.org, linux-arm-msm-owner@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] OPP: Check for bandwidth values before creating icc paths
Message-ID: <20200601071349.gbuyfaasdu27a3bd@vireshk-i7>
References: <20200527192418.20169-1-sibis@codeaurora.org>
 <20200529052031.n2nvzxdsifwmthfv@vireshk-i7>
 <0205034b0ece173a7152a43b016985a7@codeaurora.org>
 <20200601040742.3a4cmhrwgh2ueksy@vireshk-i7>
 <ee51e55bdf518832e4ecb2faf98c6b58@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee51e55bdf518832e4ecb2faf98c6b58@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-06-20, 12:09, Sibi Sankar wrote:
> On 2020-06-01 09:37, Viresh Kumar wrote:
> > On 29-05-20, 19:47, Sibi Sankar wrote:
> > > opp_np needs to be subjected
> > > to NULL check as well.
> > 
> > No, it isn't. It should already be valid and is set by the OPP core.
> > Actually we don't need to do of_node_get(opp_table->np) and just use
> > np, I did that to not have a special case while putting the resource.
> > 
> 
> I should have phrased it differently.
> opp_np needs to be checked to deal
> with cases where devices don't have
> "operating-points-v2" associated with
> it.
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index a5d87ca0ab571..06976d14e6ccb 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -344,14 +344,14 @@ static int _bandwidth_supported(struct device *dev,
> struct opp_table *opp_table)
> 
>                 opp_np = _opp_of_get_opp_desc_node(np, 0);
>                 of_node_put(np);
> -
> -               /* Lets not fail in case we are parsing opp-v1 bindings */
> -               if (!opp_np)
> -                       return 0;
>         } else {
>                 opp_np = of_node_get(opp_table->np);
>         }
> 
> +       /* Lets not fail in case we are parsing opp-v1 bindings */
> +       if (!opp_np)
> +               return 0;
> +
> 
> sdhci_msm 7c4000.sdhci: OPP table empty
> sdhci_msm 7c4000.sdhci: _allocate_opp_table: Error finding interconnect
> paths: -22
> 
> I see the following errors without
> the check.

My reply unfortunately only considered the case where this routine was
called from within the opp table. Are you testing it for the case
where you are adding OPPs dynamically from the code ?

-- 
viresh
