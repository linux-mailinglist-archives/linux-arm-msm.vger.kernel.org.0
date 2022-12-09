Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A15648745
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 18:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiLIRHp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 12:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiLIRHG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 12:07:06 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCA5A3870
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 09:05:37 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id c140so6228598ybf.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/9lqzL8oZxDL1569exX5YdO2wK0A/N3Nq2LidbPWQo=;
        b=O2sgNTTpu4+f1z7RaiuywBXHznwKn7oohJ0SsYKciDvJdgz1KByoN+lG65QlQ65EyY
         DnHrPpFnJKtPBoghXu/fMSEWXgaiHpQHTDZLp8EjdKBTVbO5FAtnb+tTEaZWFskrxdI5
         ozFDtWHnzmpO5E7PDdpMmvI0ejkmo6OLd84mpLmuCCYcSrrGSPVaHUgxHSOg4Zj4GpbN
         3kl7jpwez0Q876GntLKTAC+hoDA1hlu/EBmGuCJ04d/MGHcq2zQHuTsW7axepMurTbDT
         1Ui4RhK/5RAh3eLGG6NcZ88Z9oQWEe3rQa5j+R5Tu920AZuCIGpys2nbR1s314W1ovYP
         ch1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/9lqzL8oZxDL1569exX5YdO2wK0A/N3Nq2LidbPWQo=;
        b=hr/Ow7umQl+ZCdVvGqL3xNJHPGdw3ITQcQ+CAXU4tB0wFdQurgCo4O6HoA9JJa1/eB
         hNk/2TT4F//YPxJJew4v+nsSbPVtEgVpYNxF7iC9yr/fFFOgwTga2G2czkNxrzqxQq1F
         yHSXPGv6lDHQmvbqpFi7wXx1y+yzKUDtyLhbAeMJbsMZi7zK21vxM75XM3hKDtGWGHW9
         dM5OJwmR6mU5NGlYqBFkhKj5a7QWyuncbu2nSQZShLFVUIGob9usoGLYJjrEjXv0iAn3
         qyEL84GWrRwYV6sUhpBahSgaKNBvmTtMTRbK9uNrC8nV6S/vlg44AtgTubOwOg65l8yF
         i31g==
X-Gm-Message-State: ANoB5pkvQV9dDIeq7En8Ohm04s3b0TgrPjOkd36hWkARecjUlSsj8qsV
        wfr7TBouRxiww5fmb4aGSqsZ9l4i2BBHa9CVnuQVSQ==
X-Google-Smtp-Source: AA0mqf4s3Mtnfz9NzdoiqJVnGJFq75/XQF89HCf1bEvEfT/pCCTHt8Es+waUQ1GO55xwHc+7yR6TVMny+DZWGbLBrrA=
X-Received: by 2002:a5b:e8e:0:b0:712:faac:e6b2 with SMTP id
 z14-20020a5b0e8e000000b00712faace6b2mr1649056ybr.632.1670605536934; Fri, 09
 Dec 2022 09:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-3-dmitry.baryshkov@linaro.org> <74af29ba-0eaa-0c20-ea66-c5636162aaaf@linaro.org>
 <CAA8EJpo7+h34YCBc4+vBi22eNNO7xAa8FhwjHkU-4ZvcZx-tvA@mail.gmail.com>
In-Reply-To: <CAA8EJpo7+h34YCBc4+vBi22eNNO7xAa8FhwjHkU-4ZvcZx-tvA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date:   Fri, 9 Dec 2022 18:05:25 +0100
Message-ID: <CAGE=qrpdcBM-s5yx7P4B+QcSsNxvjZZBswymr6Rx3hZA+YtR5w@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] clk: qcom: smd-rpm: enable pin-controlled
 ln_bb_clk clocks on qcs404
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Dec 2022 at 17:28, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 9 Dec 2022 at 18:14, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 07/12/2022 01:14, Dmitry Baryshkov wrote:
> > > The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
> > > clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
> > > them to the qcs404_clks array. Add them to make these clocks usable to
> > > platform devices.
> > >
> >
> > Please use scripts/get_maintainers.pl to get a list of necessary people
> > and lists to CC.  It might happen, that command when run on an older
> > kernel, gives you outdated entries.  Therefore please be sure you base
> > your patches on recent Linux kernel.
> >
> > > Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
> > > Reviewed-by: Alex Elder <elder@linaro.org?
> >
> > Wrong character at the end.
> >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
> > >  include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
> > >  2 files changed, 4 insertions(+)
> > >
> >
> > No, bindings are separate.
>
> Argh, I didn't realise that this piece also goes into your realm.
> Please excuse me.

That's we we have checkpatch:

WARNING: DT binding docs and includes should be a separate patch. See:
Documentation/devicetree/bindings/submitting-patches.rst

Such issues are solved with tools. You will not miss any maintainers
if you automate the sending command (e.g. with identity and
tocmd/cccmd). The same with mixing files - checkpatch tests for it.

Best regards,
Krzysztof
