Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E211B153B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 20:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgDTS6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 14:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTS6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 14:58:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66C9C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 11:58:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u6so11270654ljl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyRaasLaLoASyW1/WLmX+C7yyhvEwUVdH1hzQw3fL7E=;
        b=aAUNKvGCyrKNt32Q53YuPu83JPr2m78bZjek5JeaSOZXAWOSGrhq63lYEotLTLwyTV
         2lxdxzeM41bnfDEQPDVTPB4Z22UZOiLWy8uftsHy958As20WxujgDFn06bFQ7IHSzo0F
         djukFCXip2VwGYwTsqmQhzPG4l+oDShfVueps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyRaasLaLoASyW1/WLmX+C7yyhvEwUVdH1hzQw3fL7E=;
        b=Xta78wMjU98tkDQtXOxSJv9G5cAspHsRFQmrb1KN2sjfUIHTd1E8EAsNwzEFH4e6yo
         Inbbzt5lWm1hWXRakdmeTdOPMgEMrlesTyck1GD8b4XUopsHnT+4If2hetAXxS7odWUU
         +iAuZAqLDpwCFGhSOs2qc5mm7LSfBsSiLDWhIlSGm8pe6vFhJh2JH3uKkOwKYr5bzwyw
         PQJbHSXs7Mgp/PT6EUSCS+/Aimke4q2gpN2TI3/G8s8wSFDfr6WGYFgcU6U8jn6pOfNi
         R+TD87I8xUMhnlAhb1yJTqpTen59ToSC4v5RTwncD0nOSE4ItHmEXlqZX1hCTaFoFBpd
         zIPQ==
X-Gm-Message-State: AGi0PuaGwnoof4LbXLpEgnNvvFNTWFrS6cCOy8qdKtR1bHZY9bwHHYvj
        ZwyJyQSsRJp/AkpfLljejvnX9NddIrA=
X-Google-Smtp-Source: APiQypKjPSB9JxGQbr5FSn+ni0IL2wnyLCTyCIYr5yHf9vXKiWIu55TiN5ha+KvSLkJVAKWlmM+kdg==
X-Received: by 2002:a05:651c:1209:: with SMTP id i9mr10175073lja.250.1587409114127;
        Mon, 20 Apr 2020 11:58:34 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id f4sm208446lfa.24.2020.04.20.11.58.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 11:58:33 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id e25so11280901ljg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 11:58:33 -0700 (PDT)
X-Received: by 2002:a05:651c:449:: with SMTP id g9mr11325281ljg.278.1587409112751;
 Mon, 20 Apr 2020 11:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200415071619.6052-1-sibis@codeaurora.org> <20200415071619.6052-2-sibis@codeaurora.org>
 <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
In-Reply-To: <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 20 Apr 2020 11:57:56 -0700
X-Gmail-Original-Message-ID: <CAE=gft62yeCsK0U87doWmKhD0YC57fRB6-3g3aOLBJON4PY36Q@mail.gmail.com>
Message-ID: <CAE=gft62yeCsK0U87doWmKhD0YC57fRB6-3g3aOLBJON4PY36Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused
 q6v5_da_to_va function
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 20, 2020 at 11:53 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Wed, Apr 15, 2020 at 12:16 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> >
> > Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
> > dump function.
> >
> > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 14 --------------
> >  1 file changed, 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > index b781fc8de3597..6a19e0e77236e 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -196,7 +196,6 @@ struct q6v5 {
> >
> >         phys_addr_t mpss_phys;
> >         phys_addr_t mpss_reloc;
> > -       void *mpss_region;
>
> Hm, this doesn't build for me on our Chrome tree:
>
>   CC [M]  drivers/remoteproc/qcom_q6v5_mss.o
> /mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1118:16:
> error: no member named 'mpss_region' in 'struct q6v5'
>                 ptr = qproc->mpss_region + offset;
>                       ~~~~~  ^
> /mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1520:9:
> error: no member named 'mpss_region' in 'struct q6v5'
>         qproc->mpss_region = devm_ioremap_wc(qproc->dev,
> qproc->mpss_phys, qproc->mpss_size);
>         ~~~~~  ^
> /mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1521:14:
> error: no member named 'mpss_region' in 'struct q6v5'
>         if (!qproc->mpss_region) {
>              ~~~~~  ^

Whoops, ignore me, I missed the other patch in this series.
-Evan
