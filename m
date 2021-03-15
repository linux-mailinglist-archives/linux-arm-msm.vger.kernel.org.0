Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65DA33C7C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 21:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhCOUdC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 16:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbhCOUca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 16:32:30 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB17C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:32:29 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id t4so33112875qkp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2ls2+uQXDv8BpiLhF8FqA6hSrXbISTdm9YVC3CFyBI=;
        b=NQkFyzbcqkBAqXKfDSY3JuEJR6crZshUOu6rzrEW0jsngl9EWtEH1RBMVVvCwjc6Ok
         q7rx5p5Av34yZ1bbeLphUDbwXPMMGbqNZ1KuUnWI+G8WdFMZFNJDlIBb8m1NXAXRfL0P
         hBWjbNt4w0IsbjfgXCV5/qUoBq4haMlKWj8IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2ls2+uQXDv8BpiLhF8FqA6hSrXbISTdm9YVC3CFyBI=;
        b=uoWW9we71n7bNsZjgEUr6GFqJWWRHmDBsvrDuON9ySNMWfzT4+w0NBQpT8SuTe6xKQ
         HiZuiVl+lfUTgVUfeRcf6E1XUYfDQ3aZ6hxN7UsRiAXjtqyZltEIk+6DIcD5trfRLL60
         90AqSLbZTrXZp/XIQkdRhjyFhzCyAQtSzva9Seqt0F33M9z/Z+EqFd29osS2QZLOATv9
         FoSSSVsCLsXYwdJc6RmBppe1LXUzJdKgcvDX5HJelQScv+hfaInMowXiagfh49AodfU6
         Qn3o1+daAV0vSNtyjlZ/sFrISJSvE/tdulmeiNAX3LHOb4rVYPV65vMRMnWsJw6d6t+k
         /lqA==
X-Gm-Message-State: AOAM533QySEH+diC9dvO6qZZiUxJWfG30mn4on+Qr+3KSBp1TI+albE4
        43Remw1JgyyOWcXBVPpg/SKX/XpsVv9ClQ==
X-Google-Smtp-Source: ABdhPJypISS7JMTUcnQPRhhTPKHIgc4XXd29JYPHVsxtfzrR5D90OPZiPkTkxqtCeCM8PrqjqSybUQ==
X-Received: by 2002:a05:620a:2295:: with SMTP id o21mr27708798qkh.349.1615840348823;
        Mon, 15 Mar 2021 13:32:28 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id h6sm11513496qtj.75.2021.03.15.13.32.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 13:32:06 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id m9so34568383ybk.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:32:06 -0700 (PDT)
X-Received: by 2002:a25:dc4d:: with SMTP id y74mr2030271ybe.79.1615840325780;
 Mon, 15 Mar 2021 13:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210315132256.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
In-Reply-To: <20210315132256.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 Mar 2021 13:31:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uj+uFUrFxi_96KuzeBtFY_dQTLOfr74vzztCHsy_oivg@mail.gmail.com>
Message-ID: <CAD=FV=Uj+uFUrFxi_96KuzeBtFY_dQTLOfr74vzztCHsy_oivg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add "dmic_clk_en" for sc7180-trogdor-coachz
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 15, 2021 at 1:23 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This was present downstream. Add upstream too.
>
> Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Cc: Ajit Pandey <ajitp@codeaurora.org>
> Cc: Judy Hsiao <judyhsiao@chromium.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This applies atop the patch ("arm64: dts: qcom: Add sound node for
> sc7180-trogdor-coachz") [1].
>
> NOTE: downstream this property was present in each of the board
> revisions. There's actually no longer any reason for this and I'll
> shortly post a downstream patch to fix this.
>
> [1] https://lore.kernel.org/r/20210313054654.11693-3-srivasam@codeaurora.org/
>
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Argh, I just realized that upstream actually has this in -r1 but not
in -r2. So confusing! I'll send a quick v2. Sorry for the spam.

-Doug
