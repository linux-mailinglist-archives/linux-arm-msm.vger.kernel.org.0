Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D852D30E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 14:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbiESMwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 08:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbiESMwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 08:52:50 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125625EBD2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 05:52:49 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2fefb051547so55627467b3.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23wYU4DFAa+ccpD7+FSwhamoprzmEj3uDp7y0mActEo=;
        b=hfVL1dn/CgRCgf3U75wy4kei3hEDHCT7kTa5uANX2GJ8BG1qjcXzySeFkxn0EBZQPH
         MB1pi9I4Kdo9ax6W3xIeUXcNT3pA87zN6lRvFyo1ouv22GGJRpBQOz55ACqbhtLPDf4i
         aLt2uqaHwUBUfqmIJ52m5+2pAitKtND8vjnKUIfbzoPVzzO1EwzkEvaKKgYnPsHli7A5
         Dorni3TXvSxoFs8RchOX2AWsTxjBh7FSyzDmh5xa/d2oC1yjL6xBeIJHvqsFV5cp3HcE
         PIgcA83sAOE1VCGFRH3WSQLgcgWfSqN4Mplllj7w4qM7DrH4bLPwuGX4diQTj1hMw7YM
         X6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23wYU4DFAa+ccpD7+FSwhamoprzmEj3uDp7y0mActEo=;
        b=7RRoGrOOjSoOdPDgRnTQ74iNgo2U8emxJIgwHnzd23ugsotbm+OYOtL1TN+Q25qPRe
         APnT+Ic1tWepDSwFQ5gxEVvbXT3sOP1NEtIX0L3wsxb59Agcou0AIMadkhoO7ofcG3n8
         5LUaTJINUFy6wykTG8RcxWXaK4W5z31dwuseU+/5uNlHWGWhOOaulYQX1zmhGZag4fhK
         TQlzhEcDemuaFMbA1/HQIjbN6XaIC6MgGu6NlFmKbyy3TupNvqBV4ilCN2Lo6L34uExU
         DMfvM4We7dmwnHKi6tXdMKqdPhcSxKMqoIXKwOA/W16EqslmU2kbGKGpgH9rsWLbp1Rq
         mmZQ==
X-Gm-Message-State: AOAM532IbnywBk1UwSpUPZH4U2Euzxxx4+vsalhZi/UbPgrUamQk/Jp9
        f25h23uNIsdoqNV33mOElakT5qVGIPca8p7sap102LXVcKc=
X-Google-Smtp-Source: ABdhPJxz6cNg9i52zldSUDmMCQa+r0nA+q1e1LrZhZWANGaqec5fjxKPgL7jrlpfvhenfuyisrtAWwQXgmtp6oGrwNA=
X-Received: by 2002:a81:1154:0:b0:2fe:d5a4:f26b with SMTP id
 81-20020a811154000000b002fed5a4f26bmr4719985ywr.140.1652964768333; Thu, 19
 May 2022 05:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220511220613.1015472-1-marijn.suijten@somainline.org> <20220511220613.1015472-4-marijn.suijten@somainline.org>
In-Reply-To: <20220511220613.1015472-4-marijn.suijten@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 14:52:37 +0200
Message-ID: <CACRpkdaH-+VvTpy4NkiEwce1wEpsPYknOoF6ebxHxfdvVZaNxg@mail.gmail.com>
Subject: Re: [PATCH 3/7] pinctrl: qcom: spmi-gpio: Add pm6125 compatible
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 12, 2022 at 12:06 AM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> The pm6125 has 9 GPIOs with no holes inbetween.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

This patch 3/7 applied to the pinctrl tree.

Yours,
Linus Walleij
