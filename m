Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2479521A25F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 16:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgGIOom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 10:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgGIOom (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 10:44:42 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B3FC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 07:44:42 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id 64so1240036vsl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Kim3CdbxyyOIhVT8nqi+K5F5C7o279gFE7n8I2AhGw=;
        b=PCMgMMIMPYgEiSOnn0WY5wKtX6cQ7Z+UAnP1iiRucoEQNv/MdRE5U9c5KpDE2lrLCt
         kkxmc4qkOKMgwTMSCezsgykchuRt1xzNJss9K4+HJBnMdi7Zw5W/8Z+vfTGJXDvz42Q8
         XIw6BtvVUeg3ghXbZOO7MBapqShWQ1NOc4too=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Kim3CdbxyyOIhVT8nqi+K5F5C7o279gFE7n8I2AhGw=;
        b=dqRf0Kfm5tQcUJubethcCS5KHH0PZ5myEUUPQR/JDG9h0aOkaPV7ZgrkjdbqS5JS9E
         M7Lm1Od6hFFWjQrcdNdZb38xHB13nBLmuPxNEndIqzB7nJfrMom1nf2JwQ1FvUjrHlSH
         4IQbHAM840tO0fJ/o1aPOesDNIgAzd7HPSI6k9QNIGyFbe6f7LR6T7O0g5FjqLrRemhv
         2y41ELnf0CL3njcx0RFdEwGRYpMjm1LAdbgGEqOyD0G3UoIzmCp2vXdfrR+Ty3IbC0t4
         62V3hgUvpP/NrmCu8RQAaGvQ1+Av0fjJOewbd7NPe5JeUm76uolnRDxhsVFj3Art1+gm
         37ug==
X-Gm-Message-State: AOAM532oA0m0dymvW9w5nr7TcQM2bbVvzRvtwKmP0fYnMkaloKT1k+Ip
        iS41G0DYbJPVEGgVK/t3d21S/YpiDMU=
X-Google-Smtp-Source: ABdhPJwmY2FP43clRHBPtmbUmDuhiVvwI4hTcqfPue4wxAsuNpXyd9iysKZx7IeCxzF0uAFVEh+/Cg==
X-Received: by 2002:a67:6812:: with SMTP id d18mr51121175vsc.227.1594305881311;
        Thu, 09 Jul 2020 07:44:41 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id d3sm444051vko.51.2020.07.09.07.44.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 07:44:40 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id e10so488966vkm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 07:44:39 -0700 (PDT)
X-Received: by 2002:a05:6122:78d:: with SMTP id k13mr41715186vkr.28.1594305878997;
 Thu, 09 Jul 2020 07:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200708163922.1.I0b701fc23eca911a5bde4ae4fa7f97543d7f960e@changeid>
 <23e53f2b-02b0-2c9b-a165-4ca5a2c84a89@codeaurora.org>
In-Reply-To: <23e53f2b-02b0-2c9b-a165-4ca5a2c84a89@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jul 2020 07:44:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrD0TMCNG-2JZ6_f67+yU8Z+2ofkqMvp=uA9rB2bS6og@mail.gmail.com>
Message-ID: <CAD=FV=XrD0TMCNG-2JZ6_f67+yU8Z+2ofkqMvp=uA9rB2bS6og@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Set the clock properly at runtime resume
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>, ctheegal@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 9, 2020 at 1:55 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> On 7/9/2020 5:09 AM, Douglas Anderson wrote:
> > In the patch ("spi: spi-geni-qcom: Avoid clock setting if not needed")
> > we avoid a whole pile of clock code.  As part of that, we should have
> > restored the clock at runtime resume.  Do that.
> >
> > It turns out that, at least with today's configurations, this doesn't
> > actually matter.  That's because none of the current device trees have
> > an OPP table for geni SPI yet.  That makes dev_pm_opp_set_rate(dev, 0)
> > a no-op.  This is why it wasn't noticed in the testing of the original
> > patch.  It's still a good idea to fix, though.
>
> good catch, without this (and with OPP tables added) we would end up removing
> the performance vote on suspend and never put it back unless the rate changes.
> Perhaps a similar change would be needed for spi-qcom-qspi too?

The quad spi already patch had this fix and it actually mattered
there.  That's what made me go look back and realize that I needed the
fix in the geni SPI.  See:

https://lore.kernel.org/r/20200707131607.1.Ia7cb4f41ce93d37d0a764b47c8a453ce9e9c70ef@changeid

I'll send a v2 of that with Akash's suggestion of checking the return
value, though.

-Doug
