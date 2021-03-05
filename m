Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A6E32ED8D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 15:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhCEO7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 09:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhCEO6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 09:58:52 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07A5C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 06:58:51 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id a9so2157696qkn.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 06:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qZ3AoTf6cXU1bu8uuC00ZxA2V46t8CB6SICrs+0qcjk=;
        b=env4aw7KLR9Tgvix1pjweQF3uNic1np0s7qWnz+oha8p6xblltNMqVPfju4YQtlm8Z
         QtN7owCUjlpIHROURmnrrtW2Z//xjCf2sQenGXPbG2wZVHyN8qCRT3zBPt7ZPD7g6aF+
         eRdkkzy8HnTNrhl/SDbf0B+KnYg+TA3mUx7Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qZ3AoTf6cXU1bu8uuC00ZxA2V46t8CB6SICrs+0qcjk=;
        b=VyFqC0fsMKdqhH9+xr1yWTjeKkrWWzytqvUBFd5Un5YV0sofH6w6+hCqqu/P32/Q9T
         rYEP5TyM1gj7ykizl/uj0poSKPhRhpbVghzgT0Tgz9b8ZKmOnJaUcuerBlPjRIuIuxp4
         aMbt/rYG/jpng8k8nzfWPJxr34NcqyRzdMRqAC/5p5SkoE+STE8TsfGdfz+t7idUXjDM
         6gizPCZkIe6N9+P0r19IitHrMgNN0aaXr/XrbLhwhvvCGqWHocH/f8ISkFmGNJRFT66W
         4TDD/799f+/e7hs24MElkb23zgwR458ZB9h9HpTQ1Xxn8qwrTxbJPfh3EVGNandkJkTq
         W1Bw==
X-Gm-Message-State: AOAM53157BSwdNMhrKhtS4xFdwKshpsSV0k4ScXvnYU9+Ga0L0ffL64z
        YBa4xs9GZzPLmoMdoNFLOd53e7Ua8EUMbA==
X-Google-Smtp-Source: ABdhPJwg8zESXprxpvHfsum1rozhwu2vhu5KdKF8Wn2rrbjpEqyzZ9ygIz9/OR7UbKmBALDBU1dZRg==
X-Received: by 2002:a05:620a:12d1:: with SMTP id e17mr9253011qkl.203.1614956330655;
        Fri, 05 Mar 2021 06:58:50 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id a2sm1230278qtj.76.2021.03.05.06.58.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 06:58:49 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id n195so2212000ybg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 06:58:49 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr14732960ybf.345.1614956329260;
 Fri, 05 Mar 2021 06:58:49 -0800 (PST)
MIME-Version: 1.0
References: <20210227002603.3260599-1-dianders@chromium.org>
 <20210226162521.2.I7c9190630cf9131b42d521aa1c5b97135012a734@changeid> <6537aec4-7f6e-ede9-12ea-e84bab738d7b@linaro.org>
In-Reply-To: <6537aec4-7f6e-ede9-12ea-e84bab738d7b@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Mar 2021 06:58:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XnS82=62zSyOkn++kt0BD40Qp5EmZ0SWoW25Gs7nXi8g@mail.gmail.com>
Message-ID: <CAD=FV=XnS82=62zSyOkn++kt0BD40Qp5EmZ0SWoW25Gs7nXi8g@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: core: Allow nvmem_cell_read_u16/32/64 to read
 smaller cells
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 5, 2021 at 2:27 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 27/02/2021 00:26, Douglas Anderson wrote:
> > The current way that cell "length" is specified for nvmem cells is a
> > little fuzzy. For instance, let's look at the gpu speed bin currently
> > in sc7180.dtsi:
> >
> >    gpu_speed_bin: gpu_speed_bin@1d2 {
> >      reg = <0x1d2 0x2>;
> >      bits = <5 8>;
> >    };
> >
> > This is an 8-bit value (as specified by the "bits" field). However,
> > it has a "length" of 2 (bytes), presumably because the value spans
> > across two bytes.
> >
> > When querying this value right now, it's hard for a client to know if
> > they should be calling nvmem_cell_read_u16() or nvmem_cell_read_u8().
> > Today they must call nvmem_cell_read_u16() because the "length" of the
> > cell was 2 (bytes). However, if a later SoC ever came around and
> > didn't span across 2 bytes it would be unclear.  If a later Soc
> > specified, for instance:
> >
> >    gpu_speed_bin: gpu_speed_bin@100 {
> >      reg = <0x100 0x1>;
> >      bits = <0 8>;
> >    };
> >
> > ...then the caller would need to change to try calling
> > nvmem_cell_read_u8() because the u16 version would fail.
> >
>
> If the consumer driver is expecting the sizes to span around byte to
> many bytes

I guess in my mind that's outside of the scope of what the consumer
should need to know.  The consumer wants a number and they know it's
stored in nvmem.  They shouldn't need to consider the bit packing
within nvmem.  Imagine that have a structure definition:

struct example {
  int num1:6;
  int num2:6;
  int num3:6;
  int num4:6;
};
struct example e;

What I think you're saying is that you should need a different syntax
for accessing "e.num1" and "e.num4" (because they happen not to span
bytes) compared to accessing "e.num2" and "e.num3". As it is, C
abstracts this out and allows you not to care. You can just do:

e.num1 + e.num2 + e.num3 + e.num4

...and it works fine even though some of those span bytes and some
don't.  I want the same thing.


> , then, Why not just call nvmem_cell_read() which should also
> return you how many bytes it has read!

See my response to patch #1. This requires open-coding a small but
still non-trivial bit of code for all consumers. It should be in the
core.


> > Let's solve this by allowing clients to read a "larger" value. We'll
> > just fill it in with 0.
>
> That is misleading the consumer! If the consumer is expecting a u16 or
> u32, cell size should be of that size!!

If you think it's confusing to change the behavior of the existing
functions, would you be opposed to me adding a new function like
nvmem_cell_read_le_u32_or_smaller() (or provide me a better name) that
would be flexible like this?

-Doug
