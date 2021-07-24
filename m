Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A4E3D4A0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 23:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhGXUj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 16:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhGXUj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 16:39:27 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2B6C061575;
        Sat, 24 Jul 2021 14:19:58 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so14102625pja.5;
        Sat, 24 Jul 2021 14:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrQTgfYxb4sMEFndiic56YM5fd/XmWPBVVZiCJmDU3A=;
        b=AyIzaGkv/Im541g4Qsf/Lc79csVXe4x76K8EOMHzMBCL010i9LWMIYEfVbHFbLGZMD
         t500Ie70Co8F4/KxPiJFRCQWxlmhd6yw6Lih5krnGqNtgCtYqtkF6MPbRUh2Sfzr64Jh
         DcaiVIJRg7bubACzCgXFJwbVV2BgRnhTZlAGyLxLSzYFm4w30T+fDiqgHgQsYakI8Q7m
         /YVz587LQ3E6pel6X4n+qwGzXe0QPlaP3RI1r4Wi+wygU7o0NP8BeVMyKdaHI/DNF9HA
         ySDjtIF8hk8ViSVmM5vl8SF48Y/b3zul3BOw0oBmiGwnJ3Ho5XHEFPVts9RFMMCvcNVN
         Dsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrQTgfYxb4sMEFndiic56YM5fd/XmWPBVVZiCJmDU3A=;
        b=qNHM1CS92GrFBIE5qEWpFG7Bci2dzSaCt5urJJ7PFhhtuYK82D/dlAMtsAIvO52CmB
         Fo2/1VZAlQn2GpXH6yscQo/5F/ZzYAvmnF8NQBaLTgBHpsrgvaHRNxGPwQ7WREyLd8+I
         BdFCUqxigLzYkvuMuV+9kqU7gWyXdAwTjaGAZdt1lFSlZBtp4V+0s8zMg1ApT2X0/tSV
         JRKa2YuFz6HoxYfv6yBWUZqx150m5qufpkNcwaPW++vuDGW8HoRQsawPVeE3bgFgpKMs
         X+TSgDvXinpVtzVSVAPYaxdAQefSVklhNCQ7IphHSkU14G0DfxBtV8upI5ym5aVGG2PB
         V4qw==
X-Gm-Message-State: AOAM5338N94iefsanMA/ICHIhRFBY2HcByh+jLwArVB76JQnPMztZ4Gp
        NxBRHr9zkzlfcZmQHFfJMFxUp12L3k//qRU8yjE=
X-Google-Smtp-Source: ABdhPJx4rwJVqGHGGbgkoc2L04hJbRDpZcoXvzIax3ntAJ+T8I+mAH8F8qV1PPPP80UpoEPr4GBbVWsdAE6x4uWXaFw=
X-Received: by 2002:a17:902:ac90:b029:12c:e7a:c183 with SMTP id
 h16-20020a170902ac90b029012c0e7ac183mr1082659plr.21.1627161597928; Sat, 24
 Jul 2021 14:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com> <ec8050c5-c013-4af6-b39e-69779c009a9c@codeaurora.org>
 <f5ed0ee7-e333-681f-0f1a-d0227562204b@gmail.com> <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org>
 <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com> <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
 <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com> <87v951ldlt.fsf@kernel.org>
 <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com> <87pmv9l1dv.fsf@kernel.org> <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
In-Reply-To: <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 25 Jul 2021 00:19:21 +0300
Message-ID: <CAHp75Vc7HDvCiT9Fp2hRsPTzNpRmm0E5yRHSuhpyD1Gqkf2FfA@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP bursting
To:     Ferry Toth <fntoth@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 24, 2021 at 11:59 PM Ferry Toth <fntoth@gmail.com> wrote:

> BTW there is a secondary problem not related to dwc3: the console is not
> working well and loosing chars. I can connect through wifi/ssh though.

You mean even on the kernel before any crash happened due to DWC3 stuff?

-- 
With Best Regards,
Andy Shevchenko
