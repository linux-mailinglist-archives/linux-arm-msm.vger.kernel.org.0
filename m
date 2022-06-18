Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FED550505
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 15:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiFRNLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 09:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiFRNLG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 09:11:06 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B851B175B3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 06:11:04 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id x75so4938224qkb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wquY7m+5u8zDvkgq8g44qdh5YB1CQChX80XVZX2MZ80=;
        b=y8/TAgYKS+Q5inWVBs2qbDR8MhtvK4bYbt0oMqYXbnfgxJmfrtnJpq2hPuYuxTjZwG
         IGgS0lUwm9xIx+rluQP8w4JAFzcj66osBUWz9vMZK0NX/1fNJPI2/wxUCjit8uHIXKaJ
         L9EuFJKZiOB5WpXR9JXxjYWTGvoUvTDiqvZZVUz9ks/SyoYQnCBc835CXwQI2w3lNkwm
         7ezsyhwCxuypfjvqtgO47BxBo9HfARyHhIs4NTkHwwr+EDZ9KU+15WcmcJ7vI/h5kIhH
         S1GyCoEJHWI2bxsfU+1orNDRdiaG/sZDwhzn3CjfLnnxNXadtgdO1k2WBa9C1HgkgzzR
         VVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wquY7m+5u8zDvkgq8g44qdh5YB1CQChX80XVZX2MZ80=;
        b=SNOzetAAc2jS2pesyyG0kafRvVT1spDgZer6QhL0zgtuBTBfIzh9ujOVCBIF4AYIxt
         PO53hzjz+3qxBrfN2se6IIClw7zPCUfkytsrZ8b3hBLDfF+WxDFm8wsespRg+i3nx8q4
         p65FnuWBylvmr3r6232GY0bOUc0w9AJXlAVA0p/oEzkO7gJoSKlbyhXEkgo1X1oo0YqC
         asSoRt6dMeyANtjcrqiGYF9bfnABtQXDwlmInwtpI8LQrHIqh0SipRIEQNLKzB3WojWt
         b/KASm+tM8Jh3i6azFrTvYb0D253oJ2ypRayi5zwFTtWPt9cM5BGuMBk0onde++ZWybQ
         wXOw==
X-Gm-Message-State: AJIora9gWlVBwG6ojVVAQVflUJa12L2nYIjhB25RTvS59OKZfuDU8Cuq
        bG0yjn95BDPVdqaVsUdFwAzWq8ZwjNCZqclRErtoag==
X-Google-Smtp-Source: AGRyM1uGZlGNgP9v6/NOxAXr3c9+0O1rleQKWgObtCmYBXh2b+WfMrw9eplCBeMl7qB7irZGPnqWSZKagEMtatzc/Xg=
X-Received: by 2002:a37:a83:0:b0:6a6:7e4d:41dc with SMTP id
 125-20020a370a83000000b006a67e4d41dcmr10567239qkk.59.1655557863865; Sat, 18
 Jun 2022 06:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-8-dmitry.baryshkov@linaro.org> <Yqy2YHpl93kEQRYU@gerhold.net>
 <CAA8EJpozu6PoWC-kOpFB9OSZLVZaZt6ZkUpYo=bOr0zhErkWqA@mail.gmail.com> <Yq3MzJ58d0fbsb3L@gerhold.net>
In-Reply-To: <Yq3MzJ58d0fbsb3L@gerhold.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 18 Jun 2022 16:10:52 +0300
Message-ID: <CAA8EJpqeCqD32QioE8SHR=D0acA6FGGTtQ0qRtGp4FDTv5bD7A@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8916: add clocks to the GCC
 device node
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
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

On Sat, 18 Jun 2022 at 16:02, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Fri, Jun 17, 2022 at 11:34:24PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 17 Jun 2022 at 20:14, Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > If we want to change this to the actual votable clock later this should
> > > probably be <&rpmcc RPM_SMD_XO_CLK_SRC>. AFAIK that clock exists in RPM
> > > on MSM8916 but was never added to the clk-smd-rpm driver (for MSM8916).
> > >
> > > Not sure where the pin-controlled BB_CLK1 is coming from here. :)
> >
> > It came from the schematics I had at hand (db410c). It uses the
> > BB_CLK1 together with the enable pin. I'll probably use xo_board for
> > now and postpone changing this to rpmcc clock until the next attempt
> > to read msm-3.x code.
> >
>
> Hmm, you're right - BB_CLK1 goes to CXO on most MSM8916+PM8916 devices.
> I think the msm-3.10 kernel still controls it via the RPM_SMD_XO_CLK_SRC
> though. Quite confusing. :)

I will take a look. Thank you for noticing this.

-- 
With best wishes
Dmitry
