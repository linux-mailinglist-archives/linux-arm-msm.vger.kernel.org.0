Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE75B3FBF2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 01:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238907AbhH3XCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 19:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238842AbhH3XCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 19:02:08 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D5AC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 16:01:13 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso20495487otp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=SBvWEFE7ZHRV6dF93YeVztgkppDJ5iGt+SWnxMoR3Zo=;
        b=K2aL61yrvUo2pFacIrBVkLxIAHZ0ijDkNx0/BdyNj2ChxOpGGi2qY7C9FxzMzGGMOu
         I20sjcqzzPEaxBrwdCj351IE5YaIWm0Wx/E/ou/QxI9ebJ6K/zg86A+ujSPHIphzLG9K
         RA8odMrTuEgsYD1dRHXJAjSU2vAdSrFMTRgIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=SBvWEFE7ZHRV6dF93YeVztgkppDJ5iGt+SWnxMoR3Zo=;
        b=HD2UJ9LxSGPEk9nVHkhemb+Zi56icDCZLHEyNmzz0bQ+i3uOMaTAxAyp+4s5kYSGK0
         wqYmNRj1jHWwwc2tyrEdeLOVd+S/4ubQ51/9GyUqQ3FBfDQpiLG5PSa6ObK5K5eDJvui
         pjoA13k5U0oEeM9qj3Hojs18pqcLI/zOvxh+gN1JosHqzCnzjGY72fTW2brMGwT6nA8P
         7DH9wlNwOFvP1jD+fC9gr1Liu6UVUDyDc9+keWrJfMjhw89z4oi/UgbrJwmwMxPbxfnp
         F+7rxLdvpmMn3zkKtmwfA7uw8K+yZWLuG2nOA30L7/s7JAxyVAg6xFjBw9EfKu6q88aN
         dgKA==
X-Gm-Message-State: AOAM530rEDp0T+MDLXqUsd6V4KKN/gTfs0oRWM/57sFJ7WAcrnVwArGB
        vGABgW3irZmO68ackPnkjipJVb0Mj3CCN5/bD1j9iQ==
X-Google-Smtp-Source: ABdhPJzSgj0nb7XkGDvk91kYGxUZ0WsaC4P3ErcshYBpH3DFM0ygLAqpUPjQZwKpE4ssB9Qo4tK9MMB77S1hsManWOI=
X-Received: by 2002:a9d:123:: with SMTP id 32mr22337333otu.124.1630364473117;
 Mon, 30 Aug 2021 16:01:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Aug 2021 16:01:12 -0700
MIME-Version: 1.0
In-Reply-To: <ff8ede00-008e-4dfb-7a39-19242d421462@codeaurora.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org>
 <1628161974-7182-3-git-send-email-deesin@codeaurora.org> <CAE-0n50CM=DpXx7fzrcnWox+ZSfqvWuEb-R_rTP8ghR+bd54eA@mail.gmail.com>
 <ff8ede00-008e-4dfb-7a39-19242d421462@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 30 Aug 2021 16:01:12 -0700
Message-ID: <CAE-0n52YXvTzvK4B3Aggg1fcRyjy=+HzNADP315-J0iJ8bMWUQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] soc: qcom: aoss: Add debugfs entry
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-30 04:46:53)
>
> On 8/5/2021 11:58 PM, Stephen Boyd wrote:
> > Quoting Deepak Kumar Singh (2021-08-05 04:12:54)
> >> It can be useful to control the different power states of various
> >> parts of hardware for device testing. Add a debugfs node for qmp so
> >> messages can be sent to aoss for debugging and testing purposes.
> > Is it ever useful after device testing? I'd prefer we not apply this
> > patch as it looks like testing code that won't ever be used after
> > developing this driver.
>
> This is not only for testing. Some user space clients can also use this
> to send messages to aoss.
>
> One such example is setting higher ddr frequency during boot and
> reducing it post boot from user space.
>

The debugfs file system should not be used by userspace to do things
like that. It's a debugging file system, not a configuration file
system. If you want to expose userspace control for this it needs to be
done in a different way.
