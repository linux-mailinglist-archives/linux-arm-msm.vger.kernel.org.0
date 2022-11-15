Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D28B628DF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 01:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236661AbiKOAIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 19:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236693AbiKOAIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 19:08:31 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C331141
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 16:08:30 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so32328835ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 16:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e8DEyGtnR3E51A3LHZsY+6bNt9izsNvoJTKMNpkota0=;
        b=b6losVzSt1LsO1uAuD3bhs2NGAXC8uf9KiabRTwzuTa1mNOajTwAvj9lgPz9xCqgB0
         OdhliqNT3S6ehFbfekme7ex+RkUMXEWjyv6U1s2uSsBulLxff149DQJCXq1NlLq4UFuO
         MfstcMGHw/zmNh7ohyPGNT6fQZUtaFre4lAxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8DEyGtnR3E51A3LHZsY+6bNt9izsNvoJTKMNpkota0=;
        b=B4BV/vv83eiIAQF7jHjtHvji7kCaim6lbXmfUdjhOdCqfIQMD9moO31bInatP7jVWY
         ku4wOwQ+EprGrk7jjo64qlSPdWK7vI00fyaEVIFDZBeaFvAsxpek/67+sY1FOqCQqwyZ
         5XBlnuZyYPQWgEtE9qNX3DJcZnTyKzvcqxceHvUGSdG2ga/sKwFbJxvfJz1tTo2LxlOB
         zTgcd279yCnj7BcBAPFeAfdxiUYdy6bgbC3gT9K93x0n4Tij0TVWByuIQP2B3nqooVKp
         YYfIxm0j82Kk1V4Tl7AhupWVoqO/R4I+nHJ6txUzR63SkvbmcliTQr6lkldjIiNf1wxj
         Uw3Q==
X-Gm-Message-State: ANoB5pmUlGmGn73q9plyQBEbzB2qqHJqNjyp9nItjpGhv3HZHfH3J0PS
        Gza5M+VJLvhM0znCyJQRcCD1F6H/PNmDoGkh
X-Google-Smtp-Source: AA0mqf5hDC/5d62EQQqjPs6w5hsnznwG+bQ76DsTGgvZ74KvQCmrCWni8sp7p38jCjvvctxx8x5Hgg==
X-Received: by 2002:a17:906:8556:b0:7ad:e518:13fd with SMTP id h22-20020a170906855600b007ade51813fdmr11851045ejy.323.1668470908165;
        Mon, 14 Nov 2022 16:08:28 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7d742000000b004623028c594sm5398927eds.49.2022.11.14.16.08.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 16:08:21 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id v7so8632467wmn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 16:08:17 -0800 (PST)
X-Received: by 2002:a05:600c:1c97:b0:3cf:b0ed:de9d with SMTP id
 k23-20020a05600c1c9700b003cfb0edde9dmr9143461wms.188.1668470896844; Mon, 14
 Nov 2022 16:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
In-Reply-To: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Nov 2022 16:08:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UD-mcLuV0qSOQiQZyb8+HbpOEORdMQB6g9+_teB1Yn_Q@mail.gmail.com>
Message-ID: <CAD=FV=UD-mcLuV0qSOQiQZyb8+HbpOEORdMQB6g9+_teB1Yn_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: qcom: lpass-sc7280: Fix pm_runtime usage
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Fri, Nov 4, 2022 at 6:57 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The pm_runtime usage in lpass-sc7280 was broken in quite a few
> ways. Specifically:
>
> 1. At the end of probe it called "put" twice. This is a no-no and will
>    end us up with a negative usage count. Even worse than calling
>    "put" twice, it never called "get" once. Thus after bootup it could
>    be seen that the runtime usage of the devices managed by this
>    driver was -2.
> 2. In some error cases it manually called pm_runtime_disable() even
>    though it had previously used devm_add_action_or_reset() to set
>    this up to be called automatically. This meant that in these error
>    cases we'd double-call pm_runtime_disable().
> 3. It forgot to call undo pm_runtime_use_autosuspend(), which can
>    sometimes have subtle problems (and the docs specifically mention
>    that you need to undo this function).
>
> Overall the above seriously calls into question how this driver is
> working. It seems like a combination of "it doesn't", "by luck", and
> "because of the weirdness of runtime_pm". Specifically I put a
> printout to the serial console every time the runtime suspend/resume
> was called for the two devices created by this driver (I wrapped the
> pm_clk calls). When I had serial console enabled, I found that the
> calls got resumed at bootup (when the clk core probed and before our
> double-put) and then never touched again. That's no good.
>   [    0.829997] DOUG: my_pm_clk_resume, usage=1
>   [    0.835487] DOUG: my_pm_clk_resume, usage=1
>
> When I disabled serial console (speeding up boot), I got a different
> pattern, which I guess (?) is better:
>   [    0.089767] DOUG: my_pm_clk_resume, usage=1
>   [    0.090507] DOUG: my_pm_clk_resume, usage=1
>   [    0.151885] DOUG: my_pm_clk_suspend, usage=-2
>   [    0.151914] DOUG: my_pm_clk_suspend, usage=-2
>   [    1.825747] DOUG: my_pm_clk_resume, usage=-1
>   [    1.825774] DOUG: my_pm_clk_resume, usage=-1
>   [    1.888269] DOUG: my_pm_clk_suspend, usage=-2
>   [    1.888282] DOUG: my_pm_clk_suspend, usage=-2
>
> These different patterns have to do with the fact that the core PM
> Runtime code really isn't designed to be robust to negative usage
> counts and sometimes may happen to stumble upon a behavior that
> happens to "work". For instance, you can see that
> __pm_runtime_suspend() will treat any non-zero value (including
> negative numbers) as if the device is in use.
>
> In any case, let's fix the driver to be correct. We'll hold a
> pm_runtime reference for the whole probe and then drop it (once!) at
> the end. We'll get rid of manual pm_runtime_disable() calls in the
> error handling. We'll also switch to devm_pm_runtime_enable(), which
> magically handles undoing pm_runtime_use_autosuspend() as of commit
> b4060db9251f ("PM: runtime: Have devm_pm_runtime_enable() handle
> pm_runtime_dont_use_autosuspend()").
>
> While we're at this, let's also use devm_pm_clk_create() instead of
> rolling it ourselves.
>
> Note that the above changes make it obvious that
> lpassaudio_create_pm_clks() was doing more than just creating
> clocks. It was also setting up pm_runtime parameters. Let's rename it.
>
> All of these problems were found by code inspection. I started looking
> at this driver because it was involved in a deadlock that I reported a
> while ago [1]. Though I bisected the deadlock to commit 1b771839de05
> ("clk: qcom: gdsc: enable optional power domain support"), it was
> never really clear why that patch affected it other than a luck of
> timing changes. I'll also note that by fixing the timing (as done in
> this change) we also seem to aboid the deadlock, which is a nice
> benefit.
>
> Also note that some of the fixes here are much the same type of stuff
> that Dmitry did in commit 72cfc73f4663 ("clk: qcom: use
> devm_pm_runtime_enable and devm_pm_clk_create"), but I guess
> lpassaudiocc-sc7280.c didn't exist then.
>
> [1] https://lore.kernel.org/r/20220922154354.2486595-1-dianders@chromium.org
>
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 55 ++++++++++----------------
>  1 file changed, 21 insertions(+), 34 deletions(-)

Is anything blocking this series from landing? I noticed a few other
patches have landed since then to your Qualcomm clk branch, but I
don't see these there. I assume it'll land through your tree.

Thanks!


-Doug
