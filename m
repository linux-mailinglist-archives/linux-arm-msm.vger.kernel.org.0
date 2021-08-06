Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA853E2E7F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 18:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhHFQsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 12:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235319AbhHFQsD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 12:48:03 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A717C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Aug 2021 09:47:47 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id c9so10505946qkc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Aug 2021 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JQWFrnNzTtI9LuvTV+uAT4ZmG2GcYIu5m4Avp/erLrE=;
        b=b3bF5OByhTXDvv8pb21sDc94lpDuEjadHjcrERNBE/KKSNP4y5aI/S958VoizNcdZP
         uRVAP6LcwKodjN1SNOdUiYPf9sVyYK7rbEaOsZmQCUYNzO4SqbXlu61ceDh/sWLGTZii
         QsddCMPzcoYqeUumdWITi6EJtZgLRJO6KuSFKlOU9LNPKM+KqyeasndCTX5z+ok43Wtb
         zcwyIwO3xSYkiEmqunmKeAO9x4pVUX82PL4BW/LQCLW8x02OzxVK0rjEGg7xscdiQolH
         DTh56/aRfI8szfVffVe1wJzersHlyr0QMgrwdeRq5w8NPyfjZSpuUKYmDphGGTL0/AYT
         ylJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JQWFrnNzTtI9LuvTV+uAT4ZmG2GcYIu5m4Avp/erLrE=;
        b=iKOMXfrxDrMM4FjzkrpuBP+L4g4xgpucsxiqpt45hFywivdB6h0cfEjXCdZDHr/wdq
         w0ec1PTPnBD6ayUCf56uzakxz4QY856LXZLC3whnZH0UvCQkjeLuEDZRxIYkLqDO0mJ5
         Naf7CSqdkP01aXkm+V1Sy1eZkXH8nHxxL1TXdJvEpsJznOdAepCATJxRDslvPHsDF0hJ
         OFBZuy5FDMNjaYTLEBIizc8Tf3bhHDovpU9AkmGGvsXvYy5K3WalwiTuVPyRY6W1L2EK
         SJSQi29Q5m7UonNmdKMRZomcSzY92MyTjWLWFrMAs1G3AAkSuLQQruTcbSgbPPF6Ti6J
         XGBQ==
X-Gm-Message-State: AOAM530Vu81kQ27Kk6NdAv5TnIagcacKmW/Eio2neTZ5206c5HBq8h0u
        JoxSKyoijc1o7DKmZnwBP1LXPX5+cQXo3GsfyhXtkg==
X-Google-Smtp-Source: ABdhPJwKTnf9wbDqZd0co0u/cBVa/N3fEQEBqUPCal8Mb0meFU8dcPhqhZarab2rncGnzXtws5b8IvOTPbhXBn/2C8k=
X-Received: by 2002:a05:620a:4141:: with SMTP id k1mr10865784qko.434.1628268466257;
 Fri, 06 Aug 2021 09:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <f65f219b-3f2a-63ac-5bc5-84d4f0b58f6d@kali.org>
 <3892649f-4748-b712-c28d-477e40aa8007@linaro.org> <30c5756d-790f-894b-d84b-8c4173e7fad5@kali.org>
 <8947d8ba-bed0-aadb-084e-e03029b6fe33@linaro.org> <7b334e55-5632-5e58-6742-802bffdb8fef@kali.org>
In-Reply-To: <7b334e55-5632-5e58-6742-802bffdb8fef@kali.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Aug 2021 19:47:34 +0300
Message-ID: <CAA8EJppTtEn+HuJuMj7jUGs5KDq4H3Xv--ML4uRVxe94XP5PEA@mail.gmail.com>
Subject: Re: disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Aug 2021 at 19:18, Steev Klimaszewski <steev@kali.org> wrote:
>
> Hi Dmitry,
>
> On 8/6/21 2:04 AM, Dmitry Baryshkov wrote:
> > Hi Steev,
> > Could you please check if the following kernel commits also show this
> >>> behaviour:
> >>>
> >>> - 170b763597d3a0a79f135e4d83a38462c3964fdf
> >>>
> >>> - f4b43ac0b0af1d115effd08133046a694ac33dc2
> >>>
> >> Yes, I have both of those commits, and the issue still shows up.  This
> >> is with 5.13.8 - additionally, I have a Lenovo Flex 5G which is running
> >> a tree based on 5.14.0-rc2-next-20210721 and it shows a similar issue,
> >> with the message being
> >>
> >> disp_cc_mdss_edp_pixel_clk_src: rcg didn't update its configuration.
> >>
> > Thus I have asked you to check if the issue shows up if you build one
> > of the mentioned commits (they are between 5.12 and 5.13). We are
> > trying to narrow down which of the changes broke your system.
> >
> Apologies for misunderstanding, I thought you meant make sure I had
> those commits in my tree.  I have tried reverting both individually, as
> well as both together and the issue still shows up.

Uhm. Could you please just checkout (note, checkout, not revert) each
of those commits, build the kernel and try the resulting kernel?

Two additional commits to try (checkout, build, try):

- c68da22dc9cc39ced8fc30b65fca5ce2f9583735

- b2150cab9a97c1fcc15684200a6020b6d231106d

Also just to be sure, could you please also build the v5.13-rc1 and
try running that kernel?

So in the end I'm asking you to try 5 kernel builds.

-- 
With best wishes
Dmitry
