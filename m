Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6531A42CF42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 01:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhJMXl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 19:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJMXl2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 19:41:28 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501D0C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 16:39:24 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y12so17265825eda.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WdEtrH2QRDpnzls2IxG2rd0a0s9g62DLEGXgbSRM3ss=;
        b=ns7wHRqK4CyYrtr6TbYRx8VyQAYygtOIWIqsJXSw0bBCIlKJMzyTQ6+HunNGaO5RdX
         QYvZq9rPs/LSbxwIDX/bcAPNQL5y4FzNm5DXBL0CejTV+fD1kuEsOAu1Bt7qH+FhphsA
         PLBfYNomgco6fOsnhTuwLC8ABn+rmKqkmy4xMZyIusOxh65Tg+Hh3v43YtsYTmZ6bq1a
         j6cNl9yyJm/Ojqsv5feV/v0PvqxrVzR0nwnQ49EpHXmxAdnbadC3SLXQRKAcHF3PPW2j
         29Dh4hx/cBqiwUBhHNsSvc+NguK5RPFxO/Vqsld38yzeQEDRHTNWt3JCANp+vkMm4L+d
         DF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WdEtrH2QRDpnzls2IxG2rd0a0s9g62DLEGXgbSRM3ss=;
        b=5ZLEgwTpzo06j9DgwHYkO9OtWk/+oTTYLnXQRY6SSH2NWrvW6KJy90cbcmfOvL0YzJ
         MthImsDMd+hxPZ1Eqqp1jt0XB0b04H82mDtzS2uU88ke9SdpPREJIzZwyhfF79VqQWwU
         HrG39dUecjusvh9Pa2yJ/cuFkL6nDUVS8x/UtqdkzoBym69htNOPHoIc0j5pPO+ZtzYo
         vydnDWwHTA5GJSEPVD13C6MjY0pMffV4dYFjj8qv/WAy1tkVfFriF286FN++Jg/BpqCW
         pplezyZSxZy92WJOn5haM41/XoIZeKB1RWRjDLQT6BDXBtbIjGHI1F71mvvLFo7ahN3f
         3SDA==
X-Gm-Message-State: AOAM530nAfzMe0pGo0Vj9KyIjgMf5jbUFOzkK+97nn2bkSmz66NN1bYy
        erJ2OG6MRny+6yc0JRKDFEf5i65adkkxsMFWCLWbew==
X-Google-Smtp-Source: ABdhPJzpXKAztTVaOQPaHf8DJKpawtd4+fsjDbT8v3TC4AljgsqDvOOKYx9N0mqfFYwiFj18MstpjXFVOVkJctvXbXI=
X-Received: by 2002:a17:906:5e52:: with SMTP id b18mr2714251eju.560.1634168362749;
 Wed, 13 Oct 2021 16:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com> <CAA8EJpoqawEDKfKiPzU1zYACa8hU16Ly00tsb0d6BU_jLQMEWQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoqawEDKfKiPzU1zYACa8hU16Ly00tsb0d6BU_jLQMEWQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:39:11 +0200
Message-ID: <CACRpkdaTODHT=7JMd3d3An5W=p1CW_kyPFRQ030CBQ1o_s3o0Q@mail.gmail.com>
Subject: Re:
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 13, 2021 at 5:46 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Wed, 13 Oct 2021 at 02:59, Linus Walleij <linus.walleij@linaro.org> wrote:

> > I am happy to apply the pinctrl portions to the pinctrl tree, I'm
> > uncertain about Rob's syntax checker robot here, are there real
> > problems? Sometimes it complains about things being changed
> > in the DTS files at the same time.
>
> Rob's checker reports issue that are being fixed by respective
> patches. I think I've updated all dts entries for the mpp devices tree
> nodes.
>
> > I could apply all of this (including DTS changes) to an immutable
> > branch and offer to Bjorn if he is fine with the patches and
> > the general approach.
>
> I'm fine with either approach.

Let's see what Bjorn says, if nothing happens poke me again and I'll
create an immutable branch and merge it.

Yours,
Linus Walleij
