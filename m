Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947922AD873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 15:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJOOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 09:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730525AbgKJOOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 09:14:54 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A9AC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 06:14:54 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 79so12582606otc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 06:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T9nUfLb+QLQPTkg3AquA/X12iHNZUp2yVfXlTA+PPU4=;
        b=vVcPZHkh0l4LL8I1pxa4yWvbHqy0mxTYP7ow7Nd6sfgTbsPHE4QIPYfF5aX4gO/Kwn
         lyGi1ttrljEtz+LFyCW7Lr4LOxhVe96i3gnivyvY/jYFHZo+URHT0v59xw49rGzuc077
         gGpHbRZowa26qQGaNC/8gy8xt4VPgO78aMR1P8kuvAANNZvG2U7URnTawO5tSRgPB1BF
         mtTfA2tblTe70CeHUrUCo5n7Ri0KpxzHbRbxaoKNPk11cYBJqkGvShIXLanUDtIJnaLK
         F5izPBWWifNNGIZ4zuFa6f/SrchFTt6u3JbyCEQRXmGi9mQVAfp525BfDPpdulEMnIpq
         u0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T9nUfLb+QLQPTkg3AquA/X12iHNZUp2yVfXlTA+PPU4=;
        b=giiuCewFYjEzWdaUHlQXCZ9HJoJAoFFNhrr8NgXjfVGWAWJjV73vbGaS7eMtWP6IJf
         Sqykru+Q09EFB1ganfQVG4XHq7KCQMwUvOy2qn1UN28CJXX5lBTDyAR6z40t2X3tA64b
         6aB7fA+IKri4WJS8iHQt0YPfP6FOUvoMKzQG5T9rN5wLmqzsuhHeEdy0lo20aFmJsCF+
         4Wwl9w9uHoQwYym4Yk9ztjwVSF63L6VD7GefvCI1Pl4jzhmviAJ4ZmPs2GCHWSeq8rSG
         /W7oDb57y56T/UGESsgesBx6xlspXcb4bP05YeQRomURkT/Rs7KNK6NWt5Q/9sHUHhD3
         eX7A==
X-Gm-Message-State: AOAM53305eHWu+qU8FNUu2QN8/miVbr3+ssBwEiQP1GuTI6FDMNzle1y
        +fCR/odIjfdeOi1RsFwag+UIywmVaL6IZ1wRUG8mKw==
X-Google-Smtp-Source: ABdhPJwRO86c13kzB8/54MFkxpkQIpnbN9BnIHo9LbAkm+KL014xKHRNvFUF9ulevilNweqU/AXjZCRomtU7NoajQh8=
X-Received: by 2002:a9d:3d06:: with SMTP id a6mr13495736otc.368.1605017694179;
 Tue, 10 Nov 2020 06:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20201028043642.1141723-1-bjorn.andersson@linaro.org>
 <CACRpkdaBbdC5_6y=w5eL-jJ_Mk+toKWy8kj9t-UWx02wNfjo+g@mail.gmail.com>
 <d1c2a25e-3cb1-5d67-d038-be80094c64be@linaro.org> <CACRpkdb=qt7rNORLs3VJCa=Wg1yzgL5-1wujOr4r+GhRUx3_yA@mail.gmail.com>
In-Reply-To: <CACRpkdb=qt7rNORLs3VJCa=Wg1yzgL5-1wujOr4r+GhRUx3_yA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 10 Nov 2020 17:14:43 +0300
Message-ID: <CAA8EJprJzambszvQfbR_t34POWqNN=RMVJmqdbTVoiwCf=Ys0w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8250: Specify PDC map
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Nov 2020 at 16:58, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 5, 2020 at 4:01 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On 05/11/2020 16:59, Linus Walleij wrote:
> > > On Wed, Oct 28, 2020 at 5:36 AM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > >
> > >> Specify the PDC mapping for SM8250, so that gpio interrupts are
> > >> propertly mapped to the wakeup IRQs of the PDC.
> > >>
> > >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > Patch applied for next (v5.11).
> > >
> > > If this is urgent and needs to go into fixes, just provide me
> > > a Fixes: tag and I will move it to the fixes branch.
> >
> > Yes, please:
> >
> > Fixes: 4e3ec9e407ad ("pinctrl: qcom: Add sm8250 pinctrl driver.")
>
> OK moved this over to fixes and added the tag.

Thank you!


-- 
With best wishes
Dmitry
