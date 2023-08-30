Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52CED78E07C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 22:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239473AbjH3UT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 16:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239514AbjH3UTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 16:19:05 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598163C38
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 13:18:40 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d7e387c33f3so282486276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 13:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693426611; x=1694031411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQLDwU/5nlJVkLKtn9y3pCNSu2CdyaBTamOi0p9fafo=;
        b=mgFm/UcEfXm5XlIf884UeLhKsItj/NvGLJcZ8m+VCu5I5SzrbUmwsKSUBKh8SfWUxz
         +KrC8dJpSItGaYUru9g8Rj22QotP0P1HNnouJLbGr/PI55nX0HKAYCjCuGk0i/jx/DqR
         jjgbkj91ja4jo+Xf2hD1OQGuuE8F0s2M7eGdWiIVD77VYA8kp6B2EZEY0DVTuk1ulVQ/
         p94r6pT/eENWFn0i6kh5xPHz3zJzkeZk1l70ENPc0l80c9+zbfvEDyYcnyzjoFulwXAq
         gevkLyXEJzyH7CUT6UzyxTgOZ6b5keCTFc80G+RJiyDHrSKMIBGhF++//oWYbd6K+Xkg
         apcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426611; x=1694031411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQLDwU/5nlJVkLKtn9y3pCNSu2CdyaBTamOi0p9fafo=;
        b=ETXYkXy6DgLsaFTiVjb2nQmJ8VEQFLBT4q8k4nXThBkpLdZojnIp60z/XJEZIaNq/z
         kWU9ccQbgWO1SONE9uMLI8vXszfhESGAUFEGVW5uKwZG/yGX7pPvR1ppkuiK4hZIGXlX
         6xEZWGDDBLwEtn/JJXFfptIs5La2GeFKP7iVjzQwr1QaO1d8RAwe4Bg9SakPFgoCFr/T
         HYo0KQcnKmA2RT96EkfFHW7DVtPsWTiRW6cMkMNfsXbxJRo1sC9EpvGhUtCo20Nhih2S
         9KzLEIERti1cEFwjILTNa0jpbs2OLplxwQPebN1SUcLl6gS7gNgDORng3CWN0qzXAz0t
         jtQA==
X-Gm-Message-State: AOJu0Yw4kTOw7vHHNxU9hVv5ht5+aNNBWFG0VayepwiCv1rwVURViQYh
        5s/fTDvQA5I5XLXs4X2MCqi+xGzHHiuD0M82Slac6Q==
X-Google-Smtp-Source: AGHT+IFv7Iqz9PDMTBwkRWX43WVdyu1g8mi2iBNzTPeSuQLXbC3nxFiStH1X7rnhu4oe4LvGcutHKuy/2++Z3ItRKFI=
X-Received: by 2002:a25:d3ca:0:b0:d77:f99e:7b1e with SMTP id
 e193-20020a25d3ca000000b00d77f99e7b1emr3338959ybf.48.1693426610755; Wed, 30
 Aug 2023 13:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230816080113.1222352-1-yangyingliang@huawei.com>
In-Reply-To: <20230816080113.1222352-1-yangyingliang@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 23:16:39 +0300
Message-ID: <CAA8EJpob4WsM6OyAYY5VKJ-TGixPmrHs38F+CT0xLNxq-ci07Q@mail.gmail.com>
Subject: Re: [PATCH -next] clk: qcom: gcc-ipq5018: change some variable static
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@linaro.org, andersson@kernel.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_gokulsri@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Aug 2023 at 11:05, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> lpass_axim_clk_src and lpass_sway_clk_src are only
> used in gcc-ipq5018.c now, change them to static.
>
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 313ff2281ca7..19dc2b71cacf 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -826,7 +826,7 @@ static const struct freq_tbl ftbl_lpass_axim_clk_src[] = {
>         { }
>  };
>
> -struct clk_rcg2 lpass_axim_clk_src = {
> +static struct clk_rcg2 lpass_axim_clk_src = {
>         .cmd_rcgr = 0x2e028,
>         .freq_tbl = ftbl_lpass_axim_clk_src,
>         .hid_width = 5,
> @@ -844,7 +844,7 @@ static const struct freq_tbl ftbl_lpass_sway_clk_src[] = {
>         { }
>  };
>
> -struct clk_rcg2 lpass_sway_clk_src = {
> +static struct clk_rcg2 lpass_sway_clk_src = {
>         .cmd_rcgr = 0x2e040,
>         .freq_tbl = ftbl_lpass_sway_clk_src,
>         .hid_width = 5,
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
