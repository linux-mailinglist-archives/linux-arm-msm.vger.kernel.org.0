Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C04674EB3A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 20:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240660AbiC2SqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 14:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240657AbiC2SqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 14:46:17 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD81D9231B
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 11:44:31 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id o20-20020a9d7194000000b005cb20cf4f1bso13336787otj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 11:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TXaz4286jMNGdXyhQ13L0J9FASaSI8wTBmENtm26sxU=;
        b=LGgGYvTXhCdS8899UMrshBWp0IpjZL3Nx7vtnf7k5tqCy1jtKYmJRBXlwttfmlKMtc
         gZQfMnkktD8E7VdvNFppeuLQoc22TI3R/FuBRwFK1974HkoxAOCtFOj9J66SaaaNJYEr
         b4gAS4CxqLBqaWQO9XbrXSZv5EUr7lpUXxX70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TXaz4286jMNGdXyhQ13L0J9FASaSI8wTBmENtm26sxU=;
        b=nPJV1LCBFFTxIA/ddLMmqWbkOTW0vdmrh4Tgh1xV5nHAMO1S1xSilVLALQEtsXQobM
         W7LE7Cdp/QK6i9Qb6QMxC2aOrzFA9tiGaerQKKYLs8SSEcwOx22bRTmoW8jUdI9RfzvJ
         lmCYHyyiFNUFpdiSwVmDyW/59zMM/y0pODQ185HfS0nL2+g4+bDllryj2nSs/8La6n/H
         FNfoF72SFcB4ZYsM/2T8uXzsk9blRIctgUHBqdVBENZ/56k32wa2fEUSBIHi9bk3v5Eh
         fPEDnTz43/7EgkmjFbigz7vR00HHFqDt76z964c0bvzJTm/MoeVN3O4B0ipUoj5Uqi2s
         0wYA==
X-Gm-Message-State: AOAM5334fhIl27q2gRWrpT5vIdYy7tMXg7l+pvQ1SGCFtzfdgrlkOdrS
        0DIxUifUPQcsOM9UQGCw3T/QWvjhtyzm0fkBQ/zn6Q==
X-Google-Smtp-Source: ABdhPJzi0hL+HMSvvqMRlNBmhCRR/n6gtPrAzo/F0w66SWL9L2EcQrLaI8fAcAvsTcsa32azun07zW2V7vzTE89LIv4=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr1728803oth.77.1648579471152; Tue, 29 Mar
 2022 11:44:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Mar 2022 20:44:30 +0200
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VEZ6pTuqsjWaNAeMc8_szDDZSXdmU9K3FdQpdyU0VKLw@mail.gmail.com>
References: <20220325234344.199841-1-swboyd@chromium.org> <20220325234344.199841-2-swboyd@chromium.org>
 <CAD=FV=VEZ6pTuqsjWaNAeMc8_szDDZSXdmU9K3FdQpdyU0VKLw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 29 Mar 2022 20:44:30 +0200
Message-ID: <CAE-0n53PJMg8meRsy=6aXBktrjQ8wBKqtbcShKW2YoxTJYQw-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joseph Barrera <joebar@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2022-03-28 09:04:57)
> Hi,
>
> On Fri, Mar 25, 2022 at 4:43 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Trogdor boards with a detachable keyboard don't have a trackpad over
> > i2c. Instead the trackpad is on the detachable keyboard base. Let's move
> > the enabling of the trackpad i2c bus out of the base sc7180-trogdor.dtsi
> > file so that each trogdor board that is detachable, of which there are
> > many, doesn't have to disable the trackpad bus.
> >
> > Cc: Joseph Barrera <joebar@google.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 4 ----
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 4 ----
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 4 ++++
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 1 -
> >  4 files changed, 4 insertions(+), 9 deletions(-)
>
> What about pompom?
> What about trogdor-r1?

Oh I missed those ones. Will fix it!
