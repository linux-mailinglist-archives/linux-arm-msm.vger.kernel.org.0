Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D411B7C72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgDXRMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgDXRMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:12:08 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE72C09B047
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:12:07 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id a10so10202870uad.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgtbAaNw7D/+aQV1/hPHHraWHOu1y3EAsDYZqoRW2VI=;
        b=WQmEe0r9JmPQULI/cPDvdQAflJ7w7AR1GX8c4BJLVR3/w4H1SuLX61QI7afCu1ln3m
         a4K29DhKyDt7ddf7LzyOxi/5mwvi4ebrc24lWKGI0Ye1Kwx65jyF1YTZEZCSV4D3GTkx
         zcWHDSR6WOBLVdLOVatChqrcKR/qzyUoHA0vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgtbAaNw7D/+aQV1/hPHHraWHOu1y3EAsDYZqoRW2VI=;
        b=gh+HBCFop6t0szZhEWWugGfc1f0mPbYAB95v/dOwBTed+wo9iNWwG8vJfRFovNmfsF
         imj7ArM4E2ldm/mdKjjOeao/Pjn4ZoKWzRv0+qeMbW51t6LyeaIhcJ1w3bTGjE7lgoeD
         Lr0NStcxlluV5lMSAANTzanguksHX+OwmS2e38yrm64vTeUW4mW0hPl6jl9qVlC2yQ3F
         l2ryZmmRzDtWX56gQ14V/kSqlk+pGZ5kTUlQUg18pZlfuv2R02aBZT7wrGHmFY44dKjx
         dUaov5wTV3AzOQ8LyJ4MRKJkXXagxNwRQaSIUOp99i7fUcVjjTvyDdXnu00PraVAiHzt
         uk+g==
X-Gm-Message-State: AGi0Puaxo6If1UZ7CyiZQw98OcexWEkn2L7sXraaDOAzZ6xyUHSmpPJd
        MQT18Yq6eneqMlM6gLdAbo5m913YkOA=
X-Google-Smtp-Source: APiQypLFRCAg0mDNzUha5uogffqF22tb27kuGAD/jP6y2LS/qSe1WnTB0lQ/hXXHwBz5hUadGa5kFQ==
X-Received: by 2002:a67:8b46:: with SMTP id n67mr8623028vsd.35.1587748326090;
        Fri, 24 Apr 2020 10:12:06 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id k124sm1728406vkb.40.2020.04.24.10.12.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 10:12:04 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a7so2279104uak.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:12:03 -0700 (PDT)
X-Received: by 2002:a67:eb17:: with SMTP id a23mr8662654vso.111.1587748323043;
 Fri, 24 Apr 2020 10:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200424045414.133381-1-swboyd@chromium.org> <20200424045414.133381-3-swboyd@chromium.org>
In-Reply-To: <20200424045414.133381-3-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Apr 2020 10:11:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6YiD=ORDuuRsYVRJriv+jJie3=HoF7MokWbj5Wx0rew@mail.gmail.com>
Message-ID: <CAD=FV=U6YiD=ORDuuRsYVRJriv+jJie3=HoF7MokWbj5Wx0rew@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: qcom: rpmh-rsc: Loop over less bits in irq handler
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 9:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> readl returns a u32, and BITS_PER_LONG is different on 32-bit vs. 64-bit
> architectures. Let's make the type we stash the readl into a u32 and
> then loop over the bits set in that type instead of potentially looping
> over more bits than we will ever need to.
>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
