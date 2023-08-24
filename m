Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAEE786DE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 13:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238028AbjHXLdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 07:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbjHXLc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 07:32:58 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7275F10FE
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 04:32:56 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d77b9d574f8so1644909276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692876775; x=1693481575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rh32VvfI5MkyHqwl9PZI/qELeAQhhvR1x3Jaeolc9mM=;
        b=wkj3UmKSMWiZfcUaifqnSMUa/8ve0lUQdivdDRinWio6U6CuuUln+AIFsT0bJDb7XS
         qFmv0JfZDCTnKag1Rc53F+v6A8A5tfAIP2V0eM1xPgJd0gClcCRYagUzLXvg/qeGLoCb
         WcpJ2DlV73oJBbFwfOXIzyquXIMA/p6cURPVOLH2ZvE991gNTDEIFVjRJLQdjM4/4O8K
         Ofs+UiRj1t298z6nSmT+LVTESpcpn2NMCkbly7IF2MOsR6LTMojh8WD4WSgK/c8jCCtI
         LV7Zqado0VOWDtHuOHi8S+Bnl9gIzM0lPdVS9Gj2wA1APm9uKWBK6iNiJjjxLc5deHmR
         qAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692876775; x=1693481575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rh32VvfI5MkyHqwl9PZI/qELeAQhhvR1x3Jaeolc9mM=;
        b=lsLXqvR/PYyEuK4nvKEDVICvP9EzVsDGS3OdDKfRZMEyNfemSib4hWc2vvidK81s15
         eWpkMiFpnkRGdug8rxkf084KtWrIS60YarHDYpvf+xkl3Vp60aZ6ijEc/vJqAYeIX2iT
         j2L36hSVVdG1TQAbZztTNgZHLLc3E5kNBxsnylW+FIfhjksx3CwHK137RJ4UgnuMNztp
         g1LR/Hc1QvKytHqCI7BetmSTlezPqdxXbrEyV2kGU0a5k/q8nTjFzVMEUXnn0yS1tqOV
         w+z0t1b3JoD438qjw+q4HzRru/O9RyG8fbazHcdDro32KSaXwDwjxjZMRA7/HX1wFFeH
         UMjQ==
X-Gm-Message-State: AOJu0YxYCk+yZJeYE688BVDnLQSYpbDzgOco8bOY0QmxsEECku2pSr5+
        ZFpCRcrg7WAEPlVTZ2p4hoH8fr+hzh9QydkZJkxJ1g==
X-Google-Smtp-Source: AGHT+IFrZ3KxdMcBDzpZmdn8uhtDr6jdMdipqQ5Lp34DLjAgvFiZAgLJzef2cvHpmKgcaBCIWzFUpKySloB7CLGBGCQ=
X-Received: by 2002:a25:fc15:0:b0:d62:ba45:539f with SMTP id
 v21-20020a25fc15000000b00d62ba45539fmr16370282ybd.43.1692876775688; Thu, 24
 Aug 2023 04:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
 <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org> <20230613175626.aesimqz2alcqjtok@ripper>
 <e3f69e9d-7c23-d5cd-e203-f1e435ba063a@linaro.org> <0ca1922a-5d21-2c00-7514-6f90a9d2cb03@linaro.org>
 <e86e9efe-b377-4cbc-8603-f308ea65d2b9@linaro.org>
In-Reply-To: <e86e9efe-b377-4cbc-8603-f308ea65d2b9@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 24 Aug 2023 14:32:44 +0300
Message-ID: <CAA8EJpr1GBykvwSA5x9HTY5MuvFOdLFjJMkWWdV1qK8W0no0rg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8996: Use read-only RCG ops for RPM
 bus clocks
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 24 Aug 2023 at 13:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 31.07.2023 13:01, Konrad Dybcio wrote:
> > On 13.06.2023 19:54, Konrad Dybcio wrote:
> >>
> >>
> >> On 13.06.2023 19:56, Bjorn Andersson wrote:
> >>> On Mon, Jun 12, 2023 at 11:22:48AM +0200, Konrad Dybcio wrote:
> >>>> The config/periph/system NoC clocks are wholly controlled by the
> >>>> RPM firmware and Linux should never ever alter their configuration.
> >>>>
> >>>
> >>> Does Linux need to know about them?
> >> Not really, but it allows us to get rates of their children.
> >>
> >> We can get rid of them if one can argue debugcc is enough. Unless
> >> we need clk_get_rate for some reason.
> >>
> > Any opinions?
> So, do we drop them?

My opinion would be to drop the NoC clocks unless there is any extra
value (like child clocks).

-- 
With best wishes
Dmitry
