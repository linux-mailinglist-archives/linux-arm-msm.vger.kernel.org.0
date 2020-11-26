Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93582C51F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 11:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgKZKYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 05:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbgKZKYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 05:24:05 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A928C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 02:24:05 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 34so1345513pgp.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 02:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2R023jK/jySyc2ThkcodiKMCIemCYz5dhfsXGWcapeo=;
        b=WtG8edUFIOQfbtmFC2x6S1vHUdNfwiyjTSJ+r49nQ9DX0E97XyQQIyo+By/GhK9mJj
         jLXpTUDznUDBc06D/YMvXfmrX2eOjXuH4EBpW6IUQVHYNTtKYx/fcoS1cRuy/NJdOJ5O
         vRVvOzrDgyadv+XN3m0rt7f7yST9Ybes6zITEazlr5x2rECiW1M92bpx67KRogJD4xme
         N+X1UIQ/c/uKO3gmoZ5H3hxtfITwysBWVm8xaEO6h2EiRj9BZfhc+5CiAq5vPh5LQsTH
         2MMZfK9Pdx+nvG2oQd7RzUD3XEVo2n6bAC+VQ2EZ0xPgWAyEHAeeNufrnDlpBBkHr2lV
         ar4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2R023jK/jySyc2ThkcodiKMCIemCYz5dhfsXGWcapeo=;
        b=cx/XxgZrp6wpwCVchoR3zhpfnmert4QS2AGxb9Ftw3sKdabg1dXFCphnyshR1xc2Pr
         AUAWlxq+KO3p6UIunh7Ukxww4mCGDUFABBHsmKLZtElMXr7rmA6+zoA/YPnL4EAd7egq
         +dwOmTbY+t++vyKQTe5pB4YQ2pVGwNG+uPDlnAHAcTnqZb74arfUGsHLc74SmA5QDGN6
         ZbPPzlm/3/KTkw6SzZsk6i14eD/nTusrDMMd5A9z3HZfz+8+9zywEjSakuZRzYMnoWOL
         FifgY3lGU9auOCaHKuHjujPMLo81MKU1w1r4u/hNPH5e2gGaCm6G+0jYVIDF7OQ56xBv
         /Ltg==
X-Gm-Message-State: AOAM530jwANDthmWxOQ5iMD0d2RoFLy+lhbzsNuIiqjIBMviAcUXRn7m
        WrWc8AO9B0vpDm2v3jMp7sYu65F9LfEpGXTzfgEDFQ==
X-Google-Smtp-Source: ABdhPJxADi+2kXJcVCY0WNWjC0G9/YRhXjQmT0GZkyuRMtxP0Vfa1rFm2NfNcmJoeMh0ygcyGlxJteijEEUdY4vxjrU=
X-Received: by 2002:a17:90b:19c4:: with SMTP id nm4mr2809398pjb.222.1606386244819;
 Thu, 26 Nov 2020 02:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20201125123710.28491-1-andrey.konovalov@linaro.org> <2a0f255c-1e58-aacc-40ec-86aaca72f500@free.fr>
In-Reply-To: <2a0f255c-1e58-aacc-40ec-86aaca72f500@free.fr>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 Nov 2020 11:23:53 +0100
Message-ID: <CAG3jFyuAKkSAVOdwVfTg=34ziFWcEr4SsjMmdx2hqZ+fGP7u0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "media: camss: Make use of V4L2_CAP_IO_MC"
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Andrey,

Thanks for finding this issue, reverting and coming up with a better
solution seems like a good idea.
With the above nit fix, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 26 Nov 2020 at 11:20, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 25/11/2020 13:37, Andrey Konovalov wrote:
>
> > This reverts commit c90f1178dcac30dee5ddd29ec0513e7589aa866e.
> >
> > The assumption of "Each entry in formats[] table has unique mbus_code"
> > is valid for the RDI entities, but not for the PIX ones.
> >
> > Reverting this patch and creating a new one which handles the PIX entities
> > correctly results in smaller and more straitforward patch than doing the
> > changes on top of the current version.
>
>
> s/straitforward/straightforward  ;-)
