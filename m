Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E090B581799
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 18:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239570AbiGZQkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 12:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239582AbiGZQkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 12:40:16 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D652F649
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:39:52 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id x11so10796947qts.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pYDd241FvaKCpO6of8uslrgdtlqNOaqdsV1BUmVY4DE=;
        b=Wp9eRiyhFAw+310douCzpEFBmmFZX447/ljG/YQaS4bLyl8r6OuvfGnhfThCb0btmE
         M8x6uAw4O9KV3E+2RnBZFR95NJfvMxkTuzalqJ1OkVadY4JGooRtBgA8diDGKzkK/haD
         kIYeol7TmyTu32xpEfRRXiI5pyLF28/NqIhi7ucPz2pWW29dVHetQ7w6McuYTw7xxmvG
         3IFdV5S5ApcyA9jcZiVeRA7uZhfSxKTVg8NNFa8VqGkid0niAHotUYUriNXWQ0nwA7o7
         ydo0JHDXRD7aKUoFWz5d6sScSGjGlrlGJMKihM5SNukwwymTmqARgtFLduaT0nRf+cva
         E8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pYDd241FvaKCpO6of8uslrgdtlqNOaqdsV1BUmVY4DE=;
        b=zC0u6LYawciZXxKA+qs5kgKIYK4aBF4K9eRYcQhUlOWzjacuNN+QWzp5uvYsGHu6yN
         kC35ihAxMFD1ibk1k5Qdf+piHtDnZgtPzvMNtpD+nAOj352DI8XpIF+rKb+2nceTE4s0
         foc/R6PRkOagiyM16evML6Fwwc9n9WuPBVRTM0pxu2Ul8M8YZlYzamUbhCjxVMzxhR7n
         SX/CNXhtNP/E+dbp9vhBnnB5QiY4engIxodfxRYHf9nZ2Har9UeYV0wbk1UIfGLdM6u4
         D2a8XhnPB0MLnpmbgWJXu3TBsG5U6htWm1HUyHvQFWl0CA357AjsMqqMr0DATHWpuDQp
         s+AQ==
X-Gm-Message-State: AJIora/LB4RF/3xBt6i2y2t7bI6900nM3/p7ynjGVRYQhukGGiiFHiVb
        gVLUwuktX4WNbKKU/3YWe7c0oMRTgGTpnGbh9supYQ==
X-Google-Smtp-Source: AGRyM1vEzG5t3aRQgT+Z2aqBlNPxEjBg4wmsVTxjhOcNmhCE/SF1C84yqtk2xgmVCVhC+1Y6j5/7JiSKk0+B1n+sBtw=
X-Received: by 2002:a05:622a:178a:b0:31e:f9ff:c685 with SMTP id
 s10-20020a05622a178a00b0031ef9ffc685mr15624221qtk.62.1658853591828; Tue, 26
 Jul 2022 09:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220726142303.4126434-1-abel.vesa@linaro.org> <20220726142303.4126434-4-abel.vesa@linaro.org>
In-Reply-To: <20220726142303.4126434-4-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 19:39:40 +0300
Message-ID: <CAA8EJpofiQ+5OA5UQz4uU1U3hE8iECzBD-Adda7g1mo5wPBo0g@mail.gmail.com>
Subject: Re: [RFC 3/9] clk: qcom: rcg: Add macros to collapse definition
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jul 2022 at 17:23, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add macros for a visually more compact rcg clocks definition,
> one for each type of rcg2 ops struct. These are only the ones
> used by gcc-sdm845 driver. More will be added later on.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/clk-rcg.h | 40 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 012e745794fd..e856d472a14e 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -180,6 +180,46 @@ struct clk_rcg_dfs_data {
>         struct clk_init_data *init;
>  };
>
> +#define __DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,                \
> +                               _hid_width, _parent_map, _freq_tbl,     \
> +                               _parent_data, _ops, _flags)             \
> +       static struct clk_init_data _name##_init = {                    \
> +               .name = #_name,                                         \
> +               .parent_data = _parent_data,                            \

I must admit, I do not see beauty here. I'd prefer to be able to use
either parent_data or parent_hws.

> +               .num_parents = ARRAY_SIZE(_parent_data),                \
> +               .ops = _ops,                                            \
> +       };                                                              \
> +                                                                       \
> +       static struct clk_rcg2 _name = {                                \
> +               .cmd_rcgr = _cmd_rcgr,                                  \
> +               .mnd_width = _mnd_width,                                \
> +               .hid_width = _hid_width,                                \
> +               .parent_map = _parent_map,                              \
> +               .freq_tbl = _freq_tbl,                                  \
> +               .clkr.hw.init = &_name##_init,                          \
> +       }
> +
> +#define DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,          \
> +                               _hid_width, _parent_map, _freq_tbl,     \
> +                               _parent_data)                           \
> +       __DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,         \
> +                               _hid_width, _parent_map, _freq_tbl,     \
> +                               _parent_data, &clk_rcg2_ops, 0)
> +
> +#define DEFINE_QCOM_CC_CLK_RCG2_SHARED(_name, _cmd_rcgr, _mnd_width,           \
> +                               _hid_width, _parent_map, _freq_tbl,     \
> +                               _parent_data)                           \
> +       __DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,         \
> +                               _hid_width, _parent_map, _freq_tbl,     \
> +                               _parent_data, &clk_rcg2_shared_ops, 0)
> +
> +#define DEFINE_QCOM_CC_CLK_RCG2_FLOOR(_name, _cmd_rcgr, _mnd_width,            \
> +                               _hid_width, _parent_map, _freq_tbl,     \
> +                               _parent_data)                           \
> +       __DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,         \
> +                               _hid_width, _parent_map, _freq_tbl,     \
> +                               _parent_data, &clk_rcg2_floor_ops, 0)

Too many variants. I'd suggest making the default one (&clk_rcg2_ops)
and the extensible (with variable ops).

> +
>  #define DEFINE_RCG_DFS(r) \
>         { .rcg = &r, .init = &r##_init }
>
> --
> 2.34.3
>


-- 
With best wishes
Dmitry
