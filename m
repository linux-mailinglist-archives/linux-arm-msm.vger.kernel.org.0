Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5531DD2E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 18:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgEUQPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 12:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgEUQPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 12:15:51 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D6BC061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:15:51 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n24so9531662ejd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gVHUpsuQm+bKL96a7CfOqZrm+jleDB2J28xLqoPWwiY=;
        b=sG+wpcNcUVaxIH63DMEzmnSwEOteWvdjiug1VEh17tOp1TmZBVyzzOldFzH8ePGX0o
         kRPwOnMQQnvPrZvHoeICZ16QyH2mdZphpotYrUqXf408FzCoLgys5LlFpkoin7UTHIJe
         lDWmDLC6RRnJyZkU4fwBb317Fzs1XNLBgL8gmOZypX5XoSz7gPM96vIbV/E0rS6gL6ER
         IAH1JEnuBOQz5ZksmGYnAw9hqpUUUkxqakHZXfgpqThbnDx3jZibaV5TEBLF7N3Hd6OI
         60qM2310bzuT378a0g57MeujW6B6/go7npHmvSoLgogz2enm1og9AZH3mWenNnxnObE8
         Sq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gVHUpsuQm+bKL96a7CfOqZrm+jleDB2J28xLqoPWwiY=;
        b=nwm/eBNPQ+sLllEKLCyiYQqUR4AxThzfCRiJ2MphJNtV6hz/1TIygjPj83xplADpxx
         8xle/VelZD7/wbVgAvoYBr7wPqomdXxDfPBNgAk57TN2Fh0/m4K7/EHgMYuUdwEIGlzx
         XQV5jX8Lj34k2Wj6031OS1EaxVUARuMt4jYwZ9J1lnRgyatMDm9Sr88kEN13jVM09kvb
         43b3th9FTpxUvlzquWkxa2EMXYe+/PYw7fyt30RF6Dkk3tVY4n69yLwm6/VwxKdSKmTz
         c+j6q6lkGGzrD8xt7D+yZ+NOQGVgJ7BFIMPRsh9CTKYU3k6eGdE9CfNgnbKlByB6DvJ/
         RT0g==
X-Gm-Message-State: AOAM532qELnLDFmsS7nRh6uKqdRjhQcS+kBR1hc5obC6VfycQ6h3/BFR
        Y1T5XtVHI1klfP3neKyEmSZyjs9I64EL3p745KPjQA==
X-Google-Smtp-Source: ABdhPJy9PHqzZ7boc4GrY8QI8T88GaC87U1y0orStjuhWQ3sKuYdpLx+13nc8v1EbVOzAV/VtB491beIWIB6s6WqIGY=
X-Received: by 2002:a17:907:20c6:: with SMTP id qq6mr4194902ejb.194.1590077750057;
 Thu, 21 May 2020 09:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org> <f655b47f35530ea159f9b5a4116309d58ba73da5.1589894597.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <f655b47f35530ea159f9b5a4116309d58ba73da5.1589894597.git.saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 21 May 2020 17:15:38 +0100
Message-ID: <CAJ9a7VjWD70gewE5U456OOeFicJongSQO0nZOuiAAA+3R6R=4A@mail.gmail.com>
Subject: Re: [PATCHv2 2/4] coresight: catu: Use CS_AMBA_ID macro for id table
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 May 2020 at 14:36, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Use CS_AMBA_ID macro for coresight catu AMBA id table
> instead of open coding.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 16ebf38a9f66..1801804a7762 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -568,10 +568,7 @@ static int catu_probe(struct amba_device *adev, const struct amba_id *id)
>  }
>
>  static struct amba_id catu_ids[] = {
> -       {
> -               .id     = 0x000bb9ee,
> -               .mask   = 0x000fffff,
> -       },
> +       CS_AMBA_ID(0x000bb9ee),
>         {},
>  };
>

Reviewed by: Mike Leach <mike.leach@linaro.org>

> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
