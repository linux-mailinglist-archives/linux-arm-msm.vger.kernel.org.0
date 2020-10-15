Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9353428F392
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 15:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729760AbgJONqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 09:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729543AbgJONqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 09:46:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB60DC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 06:46:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b1so3632820lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lpSXdaWuU/6COGOcHpr2bLNzbwX0ucQjW3uoyXQpUkY=;
        b=VZfFogEfemTr56xl428GCHtrlFvPHfhh5dj8KtBbktrwjRkJi+4dgFayYmHCqkSqgi
         tQKfTotWUZ8FPjZrJTAV7AP+O5nFRhbPeJFj83M+OTxv7pnYgBCvFz60tBRdkOxzUDB+
         tOqMR5NX1erw+FWRkAk65Y2ErReviykrP6S+IlyTgiQ3mGuZ83SvxmeGoGciLYGvC/e3
         AIP6pAOa1BvDIrUBHrqYHbR2VoF3ZGCv+bu4Wh+Kj6uqNkqAGeNSqEwwSYvd+QMG35+c
         H3xBAn3vG24e/AJwiJxNhlNDjjKAoVrWrWLrLQOLzxsYLVUOPOsuP60xlNyU5hZUCagH
         O1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lpSXdaWuU/6COGOcHpr2bLNzbwX0ucQjW3uoyXQpUkY=;
        b=cW3p1WDCQ+G2qohrcHTT65rJ2yltvq+PF+nr9n4BIGO7SVX5RPm9xtxn0rHkjGCGuj
         ejtJuh8egb9kiu7x/o2T0D/cgaINETi2KZqjxBIVvicJjHXFZk8vLnBAHmInEmDXKk5d
         xyCwG+qjFpwr/epjGVIv1fAATu0nS+3qshjHQkxizRMRs96l5SH+MtdAbqUGc8SDjcfC
         4cDXccB12XgNsLxYbmB4gCHN/XijNDOgSxDfc2o+J0IVqYb1jHtQ7dmXOopFRxPDnlM2
         p6/sMYrDVZTsSe5zTJA5fdkgRpQ/DyYKM5S4LYktoajnu5ngyzr69xEMO/40pHKLNvGg
         PQOQ==
X-Gm-Message-State: AOAM5335frjDW5K5AemjRP4SqdJZEEgVIN4aOW9596hBLCD0AZwNZYay
        7oG1quu63xRAMADq54/SqMyP9KYRYLmKak3MK6Lf+g==
X-Google-Smtp-Source: ABdhPJzQVhr0MMNzKgdiVR0noDJaHS0oQ/mwqQtAcL1VdTct7o7Hm7xA6/UXYjE4L9oM3GtTQnnlnCttl4RmK5sn+2M=
X-Received: by 2002:a05:6512:3b6:: with SMTP id v22mr1043854lfp.536.1602769589120;
 Thu, 15 Oct 2020 06:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
 <20201009135231.GA6655@sirena.org.uk> <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
 <20201012135025.GF4332@sirena.org.uk>
In-Reply-To: <20201012135025.GF4332@sirena.org.uk>
From:   Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date:   Thu, 15 Oct 2020 21:46:18 +0800
Message-ID: <CALprXBYfuqtJKtSrK=5pAS9N0V0Jb3CYv3EMZeGZ4OxF++dMAg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
To:     Mark Brown <broonie@kernel.org>
Cc:     Ajye Huang <ajye.huang@gmail.com>, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 12, 2020 at 9:50 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Oct 10, 2020 at 12:07:54AM +0800, Ajye Huang wrote:
> > On Fri, Oct 9, 2020 at 9:52 PM Mark Brown <broonie@kernel.org> wrote:
> > > On Mon, Sep 28, 2020 at 02:37:43PM +0800, Ajye Huang wrote:
>
> > > > Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> > > > for 2mic case.
>
> > > This doesn't apply against current code, please check and resend.
>
> > Thank you for your reply,
> > This patch depends on  Cheng-Yi's patch series
> > https://patchwork.kernel.org/patch/11773221/.
>
> That's "ASoC: qcom: dt-bindings: Add sc7180 machine bindings" for those
> playing at home.
>
> >   If I misunderstand what you mean, please correct me,
>
> A version of some SC7180 patches was applied.  However it does seem like
> that didn't include any machine driver bindings so it must've been a
> different, similar looking series which is presumably waiting for a new
> version - please resend based on that new version (ideally these patches
> could be picked up as part of that series).
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

Hi, Mark

Thank you for your reply, I understand you point now, I will resend
when it is done.

thank you.
