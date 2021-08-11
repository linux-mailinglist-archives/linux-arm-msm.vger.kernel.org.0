Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F453E9AEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 00:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhHKW2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 18:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbhHKW2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 18:28:39 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B167C061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:28:15 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id j18so4592833ile.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HyKdeL30nXjjFb5Hs6FMYvBRYqvi5QvkjAnHbuiglD0=;
        b=QCwujtXDpFac1+c3HFwq4Ii1fAtlXHlagEYEoW7I3r3AVCOYscSfxuKibuQ3gtUekL
         d42WQZkTSRB4Q1FUNYD0SwqdRbApQIHBpZQ3s6yl8LYLU6AZNQDEVTW8lBAyd/LZyDSR
         DhpfTycnoYVenCWQ1CW6HzUFzPmP+7NyGB95c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HyKdeL30nXjjFb5Hs6FMYvBRYqvi5QvkjAnHbuiglD0=;
        b=neHiC3jCsilzJ8gktDxAevCqN1j1hCETXF3/IfULuhjx1teZKWXu4pYK2ToJJ4J8Tm
         1C8tpzLNkF7E9XuFr8ePu20bahXGvd468Wpwyc/Mal9fAAM7JHS3EWwwSAI+zPgJMLTq
         iadq3j4ghusOoHcMXdX2/WHpvd179qowsmNV7NawVt6oUKH0U3SLQHt7KAtBPPKUTp7N
         TBueMsAwg2rRQXNDNIpm9vJGJk6sS1gpIYXhu7wz/OMa9wJoV5zwUZo17+ANz0ruls6C
         xUNyqsMo3pd8du811H7eLralRPFL0wWndDnwPvsXj8Ckr64PfKTMP7IEGgCsEEHw04Sh
         HBgA==
X-Gm-Message-State: AOAM532Ltd9yoFjfztmuwGibe/Yq4CSG/ekpb/Vvf6mDX+4zRhE44h8g
        uziHzM14u3eOzsThg+1cjj1Db2pM3qnJlZdX
X-Google-Smtp-Source: ABdhPJxB59O/evfV84dyNiJwYf6r+rexQKEayElrVWxFDIRTIJw/CPG3EvJlprEa3rxvXOsPIxzDvw==
X-Received: by 2002:a92:c70e:: with SMTP id a14mr472598ilp.299.1628720894289;
        Wed, 11 Aug 2021 15:28:14 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id j6sm364346iom.5.2021.08.11.15.28.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 15:28:13 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id 188so5686232ioa.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:28:13 -0700 (PDT)
X-Received: by 2002:a05:6602:2159:: with SMTP id y25mr603783ioy.61.1628720893305;
 Wed, 11 Aug 2021 15:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210811194719.856593-1-swboyd@chromium.org>
In-Reply-To: <20210811194719.856593-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Aug 2021 15:28:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xks_cSAEWMUxCriLbhAQ11CkVUrJJ97waMgGUVF7mPyg@mail.gmail.com>
Message-ID: <CAD=FV=Xks_cSAEWMUxCriLbhAQ11CkVUrJJ97waMgGUVF7mPyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link for HDMI
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 11, 2021 at 12:47 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This should be the dai for display port. Without this set properly we
> fail to get audio routed through external displays on trogdor. It looks
> like we picked up v4[1] of this patch when there was a v7[2]. The v7
> patch still had the wrong sound-dai but at least we can fix all this up
> and audio works.
>
> Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Cc: Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Fixes: b22d313e1772 ("arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI")
> Link: https://lore.kernel.org/r/20210721080549.28822-3-srivasam@qti.qualcomm.com [1]
> Link: https://lore.kernel.org/r/20210726120910.20335-3-srivasam@codeaurora.org [2]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

There were other changes between v4 and v7. Do we want to take those
too? Basically two things discussed in my response to v5 [1].

1. I think we don't need `#sound-dai-cells = <0>;`

2. It seemed marginally better to call the node `hdmi@5`, not `hdmi-primary@5`.

Also, in case you're comparing to v7, it looks like v7 still had a
bug, though, that your patch fixes. It still had "sound-dai =
<&lpass_cpu 2>;"

So confusing!

[1] https://lore.kernel.org/linux-arm-msm/CAD=FV=W3X8W90vPdrDAymzTKj-J7QPyn4ukaLSOhEkCme3+r_Q@mail.gmail.com/

-Doug
