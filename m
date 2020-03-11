Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC3E180CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 01:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgCKAf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 20:35:58 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:47066 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbgCKAf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 20:35:58 -0400
Received: by mail-vs1-f66.google.com with SMTP id z125so198866vsb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 17:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dj9AJ6DgaDsv1owS/OBbLL2hfYDA+jQ+pn99BxM6NK0=;
        b=Xvp73QVkE935ImkOQZQ+bEOpPwsbuCXEDpTploRsshH27YQ78Xl8+Y0jFMALJsZJZr
         COzdzjlC79Gv7YvIvlLm5q5CV+nQ2Ev6nEv7Vjcy3ZClRMVySqOoIRpKLvz0puB76HFz
         JEwAyCg6gASt+sShiUPPEjJJxdmcSiyvoLNac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dj9AJ6DgaDsv1owS/OBbLL2hfYDA+jQ+pn99BxM6NK0=;
        b=iVHq424VFgrGTc9ms98LXAIWh5uFMqR8NvkiaZowxBmtDJPISFhqpRGTBbYFWlmd12
         /yNCnOyGtmB1XqptTZXLrlmGTJYrXw9xuk6A+fGPj0Sf8zLeou8tqCP7V5j34dJLWkIS
         BM/psd61UFaYI9HJ1ZQ/26BT2FPDr0eWN60Nw3vyf7p9vY60os70JcpEhYn43xWIx4oV
         sZeKU9EGnv4UAhJDG+vvF9969QLdKNysU1iP+DXbEJ/i+lOYeRsbmyIo2p4gvHVv5Wge
         pWMGklyVETARdh2tfZv5htdhTAVndNOAg89rC/1FhMqPOAshqrMh6YQAzIN4JZ08oxuJ
         1O2A==
X-Gm-Message-State: ANhLgQ18PnCHGvoNJddtnqMPx6Tfi3g3l1Yv1hZN42qzMBSJ5+Wv493w
        G133SZCHmRpfCFPzt+wC6pk9I/jUaVo=
X-Google-Smtp-Source: ADFU+vtvBqZzjpChOOtxrOHubd539wuyShsK2i+/tJuxsbJKM/ou09poqFQNmUXf/TVD/h4wibSyXg==
X-Received: by 2002:a67:f885:: with SMTP id h5mr429583vso.81.1583886957006;
        Tue, 10 Mar 2020 17:35:57 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id s8sm11303340vsk.13.2020.03.10.17.35.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 17:35:56 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id k188so218280vsc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 17:35:55 -0700 (PDT)
X-Received: by 2002:a05:6102:1cf:: with SMTP id s15mr403204vsq.109.1583886954828;
 Tue, 10 Mar 2020 17:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200306235951.214678-1-dianders@chromium.org> <20200306155707.RFT.9.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
In-Reply-To: <20200306155707.RFT.9.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Mar 2020 17:35:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrUMSf9005eCta0rf=4BaSWNGwTDsuja2pFtqauaC25Q@mail.gmail.com>
Message-ID: <CAD=FV=UrUMSf9005eCta0rf=4BaSWNGwTDsuja2pFtqauaC25Q@mail.gmail.com>
Subject: Re: [RFT PATCH 9/9] drivers: qcom: rpmh-rsc: Kill cmd_cache and
 find_match() with fire
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 6, 2020 at 4:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> @@ -889,12 +793,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
>                  */
>                 if (tcs->type == ACTIVE_TCS)
>                         continue;
> -
> -               tcs->cmd_cache = devm_kcalloc(&pdev->dev,
> -                                             tcs->num_tcs * ncpt, sizeof(u32),
> -                                             GFP_KERNEL);
> -               if (!tcs->cmd_cache)
> -                       return -ENOMEM;

During later code inspection I happened to notice that the "if" test
above the code I removed can also be removed.  I'll do that in v2.
The code after the v1 patch doesn't hurt, it's just silly to have the
"if (blah) continue" at the end of the loop.

I'll wait on sending a v2 until I get some testing / review feedback
on v1 or enough time passes.

-Doug
