Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86A230DCB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 15:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhBCO0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 09:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbhBCO0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 09:26:38 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3209EC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 06:25:58 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id h16so16526084qth.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mj7d/khLmSJGOWdA9KEA2tHAZXerllRPwSPFlYrXYDE=;
        b=CLouXu9kdbw5ue3bej+GffpgCOInIG53qraBZ+gFloJTP+x8CeoUdC3+1rQA+AoJsu
         cB79f2y7yBSuvQ9IbVOIQMg8eirhJc98lEOtTsFaQ91cJqJvZ2ZNuULuUFCFPu8x6Laq
         IIgidbwWOO6G+51pZAiY0rHgqpPFjIG/Fl+jcnPYN7lRM0Pg20wO40Xhdvly3z9Nm940
         ySoBqsuVf/AMaqHM8KK8ykDXSTB3KMo0yK8bsoVt7MnIjG75mERJdvglALEysyCxHwIG
         briqhtlIueM7b7hslj+Bm+p8Gt+fUOppSY4XqyO20+gM17WB+ic4tpHxj3xIVvXqRvUd
         lTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mj7d/khLmSJGOWdA9KEA2tHAZXerllRPwSPFlYrXYDE=;
        b=KkJEcqS9ofycuTBmWrM9aCjsXqhfmJ02P2LPUtCngu+rFa224bSfyvCnIbtLwbjX46
         Uv81CB+OgViow6AhHv0wo+9rNkWgtxM5pY/Aw1I4F3kfwQyGg9OC7NzX4n9xsOyvMEuB
         PB+OZzW5FNv5VFvHi4vXPfeeuiQh5z2puzJIidgYr7XrH9wP4Svwg5B0ws+chH1Wv0fk
         SDyrDa6gg2sMq40ITL/KkSiodD275B9BZlb1lhpNvXE16wiFpZmYtB4+sylR+fjHLWNq
         a9OrycYcJeBEzhf5kCmWPyvCe8068fWTalDuwR0k1MD9m0s4dKmmCzLszrW8L+lrh0/V
         ZfEA==
X-Gm-Message-State: AOAM532PxWXra6rEF2BJsBVX0RIuyxQjfH/g6Q3U23qLTfeOoYSl3Aev
        /dcg5O+ciIDooeoXVlRTU0FuYWmkLIVFP9Rxoz6oC9qXNXMQEaFD
X-Google-Smtp-Source: ABdhPJw9rrFCh/eyG9dq2SfkoyV/boCPNgtEDs6i8pzhdhcbg2lz/bQuyt4Npxl5AkxoJ8YYXhazn0GNXLe70AXob/E=
X-Received: by 2002:aed:2821:: with SMTP id r30mr2573930qtd.364.1612362357405;
 Wed, 03 Feb 2021 06:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 3 Feb 2021 17:25:46 +0300
Message-ID: <CAA8EJpquw_HBT+x=go_378_ZVqLiHmq7y9FvBEgoqESaTosy4Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 3 Feb 2021 at 14:53, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> - Adds some missing indices to the videocc index
> - Adds videocc clock tree hirearchy for msv0
> - Adds a regulator to power the videocc consistent with downstream
>
> Once done we can move on to enabling these clocks in the DTS and switch on
> the venus.
>
> Bryan O'Donoghue (4):
>   dt-bindings: clock: Add missing SM8250 videoc clock indices
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
>   clk: qcom: videocc: Add gdsc mmcx-reg supply hook

I remember now the old discussion about these two clocks
(https://lore.kernel.org/linux-arm-msm/160092826778.310579.12225989905897101118@swboyd.mtv.corp.google.com/).

Is the message. reported by Jonathan, solved by the mmcx-reg supply?
Also are these clocks necessary at all?


-- 
With best wishes
Dmitry
