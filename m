Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098CB4FF04C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 09:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiDMHGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 03:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiDMHGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 03:06:31 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052122DAA7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 00:04:12 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id c1so962652qvl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 00:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BU+xGeDrL0dqggaTnsKhPbMe9pU5gcDq8YBrXIQqSms=;
        b=j25nlSHuu/5tzcW2TTcBM051LooSj8CFdP6VXZvKujMRwCsr6WOMmza1414SdddWK4
         ITM8/meETeUGEg2jjKjC3xQWHklU8EBitC+30UJ1WUF35PU2+qsxhMbKthp8bhDdnI9K
         DvBdt8UmUBk7nWwwEH3sCV5m3PKTEOAKeWKq1va10J0aj6scBkPcUs4OfcIM6p4d3zrn
         RIXeFaw0+9N+GVmNFOa63ZNE0QrtlhK5V1jeoazUCOkgyB70hjVSQRoHrnmdg2lpLOJ2
         U2+dPF20AWH7jIsbJZe7FAZJNEFEGY3p/BxSy1vuuaxdp75C87hGfLxspCT2xccr1Eyt
         1YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BU+xGeDrL0dqggaTnsKhPbMe9pU5gcDq8YBrXIQqSms=;
        b=Pcik/owBZHD/jNiamPmacWBDiQXI99bCJYQASDNGfMLdml20BUGhRS7WlYHnqf+gGZ
         XjLAboK8DECCpJJtvbrQtGf1MzC2fJz/ROXnSz3V0unwN+Zg8wZR/Uebhi2l4luGOEnd
         b20SPNu16+fETlOPYm6e0XIcE9lQH1iESjJA6Z2lOkti66fU5sZ0WH6sqDpwEOdrbWgw
         dAHDjGNAkxMuwMOjM2dKYlWsuTth+vBm/IVZSqKMFO4EJ2MfHJtmdk5HC4XqI1RYc7VG
         Qet7OQvyweiHM72ApnG3NWAAWo1SjQgRS9AjdJ/DLiKfZQ3rImw2GVaNqRhZWVwDwZKa
         G+Jg==
X-Gm-Message-State: AOAM531WlANyiONM/xhphqfb6PVnHLGgNcPvIgzxT3krwilxC/k258tC
        S/igTVtHbPdU6DCSLKRuZ5kRKmX2lvKD/LaZXJMhog==
X-Google-Smtp-Source: ABdhPJzuIHESbnHURnzZxCFN8adjB+/3Hl2djJNXF6wvoqTVn5r4Dwl2bGvdrjsJ3UemVSogR2tIaz+E2GKr0lJnoLE=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr34905670qvb.122.1649833451148; Wed, 13
 Apr 2022 00:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220310220723.3772-1-ansuelsmth@gmail.com> <YlY3rPpYvclK8L3z@builder.lan>
In-Reply-To: <YlY3rPpYvclK8L3z@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 13 Apr 2022 10:03:59 +0300
Message-ID: <CAA8EJprEYgWTp5KJ1TSGC8EKbuw1XP+jz7D5BaCP0rEsEPVsuQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom_scm: Add compatible for ipq806x
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Wed, 13 Apr 2022 at 05:38, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 10 Mar 16:07 CST 2022, Ansuel Smith wrote:
>
> > Add compatible for ipq806x. Just like ipq4019, ipq806x doesn't require
> > Core, Iface or Bus clock.
> >
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  drivers/firmware/qcom_scm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > index 7db8066b19fd..7348c5894821 100644
> > --- a/drivers/firmware/qcom_scm.c
> > +++ b/drivers/firmware/qcom_scm.c
> > @@ -1338,6 +1338,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
> >                                                            SCM_HAS_IFACE_CLK |
> >                                                            SCM_HAS_BUS_CLK)
> >       },
> > +     { .compatible = "qcom,scm-ipq806x" },
>
> If you in your dt do:
>
>         compatible = "qcom,scm-ipq806x", "qcom,scm";
>
> Then we don't need to update the driver for each platform, only the DT
> binding.
>
> And if we some day need to quirk something off qcom,scm-ipq806x we have
> that option.

I suppose that ipq806x might need SCM_HAS_CORE_CLK. Or, more likely,
an interconnect vote, once we have interconnect drivers for
ipq/apq8064 platforms.

>
> Thanks,
> Bjorn
>
> >       { .compatible = "qcom,scm-ipq4019" },
> >       { .compatible = "qcom,scm-mdm9607", .data = (void *)(SCM_HAS_CORE_CLK |
> >                                                            SCM_HAS_IFACE_CLK |
> > --
> > 2.34.1
> >



-- 
With best wishes
Dmitry
