Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3589C1DD2E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 18:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgEUQOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 12:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgEUQOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 12:14:48 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D60C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:14:47 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id s21so9538857ejd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xjOTfRMBvOrjyRjGGxfchGlW797g4I+Gr41RQ6ILdN0=;
        b=NPYzd/MDzro01OEVQy/u9F/1NirGs0scbXnE76RgH1VwYMZVAQbyYouimpAklubZWg
         4uVSGer0ifL7G91K5YneioSC2DfnpSDY/3tNG6BBVmLmOqKTl8GAwcjRIg8wPeIDl64c
         Yp4FRlMXFBi85VO9kXJJkJUhPyM/h3ZGSTYe3mBuEyDNpq+A1JYWammjnVjkQcKdEMkW
         fb62OhwTIkb06adhGMuJBuznLn+y4/5anZ8E/MH6mORsC/7zhrrUpU5YFlmT5GRHJhv+
         77c7C6pwJVwpTKyeB3wsxyfQBvx8ch0Cap+3uaBuwEwR0qejOVOYsOtTulXGkwgEx7ui
         LTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjOTfRMBvOrjyRjGGxfchGlW797g4I+Gr41RQ6ILdN0=;
        b=pxNUGPoVCW1SPU+5iVn9padoPou5xNvTLmqM8u/GAPHEHSLr8D+HDvsn9tt9FXzbjr
         jytWSNIPrcDkF5nwGnFEUpJnHW7TWAM3JpPktzalJ+vZVi8j/81T9wvMxP63KxCsirTy
         bfgdG3TKHy5ufLC3Z7TOIOha145QwlaPlAHtx0lj8nxyfoHMr53VhRR8o83vCGy5WbAQ
         e9cFoaj5OPtzNbbP/jzlnV67Fg3jHQVCxR/uxsWMUFBnlCZGxrGuMwAnUS7bRdEj0MSg
         6V3imyutmySQr783Ic0S56qRXsY3sApZDcHJfU9V+VB/Wg9VQPBUFEriyM97MLy2Xk0Q
         IsDQ==
X-Gm-Message-State: AOAM532Gxwq3Nbxclw8zV5lXr32YZhWr8+od5rQw4Okt4E5f5KAuF27J
        5tD70bqc4mVBLLb77n8iXMGxSY8Z8F0S71vqX2HDlA==
X-Google-Smtp-Source: ABdhPJwCqfzV4Vc/GT9UuwF37cEiACc8XZstqzqXNH7DNKAAANTprGZTPCY/bD6ifvzxJOppnOUqWnD1xW6fCRojTtc=
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr4549369ejj.359.1590077685912;
 Thu, 21 May 2020 09:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org> <063325edbcff869fde60c2af484e009c0b124ae4.1589894597.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <063325edbcff869fde60c2af484e009c0b124ae4.1589894597.git.saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 21 May 2020 17:14:34 +0100
Message-ID: <CAJ9a7VjfmkDZikiW2R7jd2aq0Dj-xNgStKLhoOsow_KRV4RH+g@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] coresight: replicator: Use CS_AMBA_ID macro for id table
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 May 2020 at 14:36, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Use CS_AMBA_ID macro for dynamic replicator AMBA id table
> instead of open coding.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-replicator.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index e7dc1c31d20d..c619b456f55a 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -348,16 +348,9 @@ static int dynamic_replicator_probe(struct amba_device *adev,
>  }
>
>  static const struct amba_id dynamic_replicator_ids[] = {
> -       {
> -               .id     = 0x000bb909,
> -               .mask   = 0x000fffff,
> -       },
> -       {
> -               /* Coresight SoC-600 */
> -               .id     = 0x000bb9ec,
> -               .mask   = 0x000fffff,
> -       },
> -       { 0, 0 },
> +       CS_AMBA_ID(0x000bb909),
> +       CS_AMBA_ID(0x000bb9ec),         /* Coresight SoC-600 */
> +       {},
>  };
>

Reviewed by: Mike Leach <mike.leach@linaro.org>

>  static struct amba_driver dynamic_replicator_driver = {
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
> _______________________________________________
> CoreSight mailing list
> CoreSight@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/coresight



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
