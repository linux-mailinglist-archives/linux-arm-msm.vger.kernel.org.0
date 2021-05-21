Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D9E38CE14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 21:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhEUTWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 15:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235943AbhEUTWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 15:22:16 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C726C06138A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 12:20:53 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id c3so20631509oic.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FyO/JqUhnAJn7rTfn8HMrxZKns8UrOKW6CCN24xNmJw=;
        b=kk8gvTxu2F6FrdI0CCGAN+iKSWE0a9uhN0j8qo4IKMjr/VC0lIWL6XiOgDlPtdF623
         CgDQ0MAS2Pwe7I6Co6Q5OklTQ+cAJo60nXf1pusd86wdqCtcV96QXgcee72pWHjB8o5n
         Af1Aiyu/o9TW7ARVZ+cMLA+XgrXvJbMpY7BXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FyO/JqUhnAJn7rTfn8HMrxZKns8UrOKW6CCN24xNmJw=;
        b=OyP/TfwrYRqmLe1SsG3y/1fGzPBeTO5hjkpMlOAtNHCxtFP4T4a7v76AnA0mP4+5+0
         9URrBv84158QunJI9jYdTBAy61tJUhXR5W2OX1z2jDDRyqGHD45itnTUmKxjbfOj90tQ
         76KuedtlG7Z828XxMWArOOKRwBWMFbD0PIQSZWR20Ajz9H6t8cLZAnAN1528Jr4gacxQ
         ugZwmEJ73pavzxv6xMiXGKRl5H+yRAM1XnLLu3T8otnwNF7hMCW09az46gPGMLzsABFh
         5MkeROMUtm9SjHJBNIJUIDDTkd6oqgsCmJgZBXhE4Ua2KS5exGeVp+VX0I9L5FfgFnpL
         7t3w==
X-Gm-Message-State: AOAM530l49IEbyxeVXZEXoTMgnsW3immvpVexFECwHlqF12FbJ84Cdjw
        aEm/jxqgIr746WR7u/qYb1LyK5Qo6U6HiEP6V+eSAQ==
X-Google-Smtp-Source: ABdhPJy0xJWiKIvi9XlPEdl1F62I8MviS/gKGFUSCatMzFM9St5OGzTTa5zc7lgCaUm5SAQeU9LfXzHShYT8+v3Ub2o=
X-Received: by 2002:a54:4501:: with SMTP id l1mr3318840oil.19.1621624852348;
 Fri, 21 May 2021 12:20:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 12:20:51 -0700
MIME-Version: 1.0
In-Reply-To: <79fdd08e974d6f6e35f0042c98a9415c@codeaurora.org>
References: <20210512082220.7137-1-rojay@codeaurora.org> <CAE-0n52D-K1T0QgxA-S7BXxE3Qk807F9edNyR+2RL4YxRyigMg@mail.gmail.com>
 <70a90d229551bcec21ed74cfd1350b9b@codeaurora.org> <CAE-0n50o1XRnV3HSAM7uhfS8M3kf_m0DrTkqCfYGdnSjpF6Xfg@mail.gmail.com>
 <79fdd08e974d6f6e35f0042c98a9415c@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 12:20:51 -0700
Message-ID: <CAE-0n53f_=AZ2NPwuio6+k3_LpY1dkvKOMrqq+jf25hacVUpNw@mail.gmail.com>
Subject: Re: [PATCH V10] i2c: i2c-qcom-geni: Add shutdown callback for i2c
To:     rojay@codeaurora.org
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting rojay@codeaurora.org (2021-05-21 09:12:02)
>
> Yes, we cannot mark device as suspended/resumed during
> runtime PM operations. Bus will be resumed during i2c
> transfers and before transfer initiation, in __i2c_transfer()
> from i2c-core-base.c there is a check to see whether the device
> is marked as suspended with "__i2c_check_suspended(adap)" call,
> which is "true" in this case and returning from there.
>
> To mark it only suspended during system wide suspend/resume
> transitions, currently our geni i2c driver has only
> system_suspend implemented (geni_i2c_suspend_noirq()) and
> does not have system_resume implemented, which again causes i2c
> transfers to fail during system_resume after system_suspend.

Got it.

>
> Shall I go ahead with marking device suspended during
> shutdown() only?
>

Yes that sounds good. Can you send two patches, one to mark suspend in
the system PM paths and one in the shutdown path? There are various bugs
to fix in other drivers that are trying to use the i2c bus after it has
been suspended and shutdown, but that doesn't block these patches from
moving forward. I'll take a look and see what's going on with
suspend/resume on my board.
