Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F1555001D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 00:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiFQWoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 18:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237295AbiFQWop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 18:44:45 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8AA3D1F4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 15:44:44 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id p63so4138033qkd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 15:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SsHom7fa7K11h5Z+EC2x7vWqMHsLLcNeUKbkAxVftlg=;
        b=l2XOKmsmiWpgOjjHLMOpi7Zv68ynOEAHCQ3IR8TUjHt/94Q11yMFhAIHRipQeI/dSY
         57FV3aWU+G7NhSmJjcDDP4IY97hYF9kYxaHhNrBZsoSAFflQzqtGBFbfFLfHEpY0s7JR
         swMS8B5EMSGEF7715U4HXOnr+e4IDMR84O+X5awxCkxbQzWyqoLHiO7rW8AqROjohcno
         fSMC9RdHj+iy1FIargoy1ofp2iomD+0Xy5jHOBZ7yC84zx/HNkSs5pfWPT6/wOmnb8Wq
         ORBjI8Z+67zStgT1TYmLcovCQdWKeOvRTj9mUxFtFGORzRv55VIaAKQM2lRLZyevUobR
         7+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SsHom7fa7K11h5Z+EC2x7vWqMHsLLcNeUKbkAxVftlg=;
        b=zEb6IIIzbN44hI67urvqr5MSe5TJ5kQ7WFpV6NgJcqMgg6sR1weHJ1O2GwvOAUu24g
         SwwxQjenUR+6CxhJEoxSyPJ0EwyRU4hPmw6v/H/KtpMD3Edah/sL12Hho82Gp4tl8Kma
         AIZiwTv3fB9VQHaDC7/vvZL7WMLuKlRo914xmnOFXvBR3rTNGyPTev/vom0Btyhg5Mv3
         1MGUOR6z0TBjCmajkTi1d3wuBDYBjuXO7Yh68Bge40iKZj4rNcUKVATF4/MAJYF2BLc8
         H88fZGIlHcZH7KEOEtOEcP1GqsHIWCjXc4RLb2g6pT28Lde/eI++nug9EadU920dCjMT
         ROrw==
X-Gm-Message-State: AJIora8hNS2AhmeKFjYdf+gduyc7DIzc3D2FEf0VptdM7HLv9GmXmHQT
        TrdptHmgbWSj7dAUJkn73G9wRzxCSzr6noWlkv0wTA==
X-Google-Smtp-Source: AGRyM1sKMqi/QiZH7b6TJUgOiNNmTZrbNaLS0uaw9hML94QgqMwRyHecaPBWZyRyh9A9C8hLipCVVjbb/wQo63rBCoU=
X-Received: by 2002:a37:a83:0:b0:6a6:7e4d:41dc with SMTP id
 125-20020a370a83000000b006a67e4d41dcmr8921379qkk.59.1655505883958; Fri, 17
 Jun 2022 15:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
 <20220617122922.769562-6-dmitry.baryshkov@linaro.org> <20220617220104.E0FE2C3411B@smtp.kernel.org>
In-Reply-To: <20220617220104.E0FE2C3411B@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 18 Jun 2022 01:44:32 +0300
Message-ID: <CAA8EJpoH8ZP4_fWo3-=n6Hm+CJRNrLCbkZMbqxuc1CRuL+9nqQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] clk: qcom: mmcc-msm8996: use parent_hws/_data instead
 of parent_names
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
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

On Sat, 18 Jun 2022 at 01:01, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-06-17 05:29:21)
> > Convert the clock driver to specify parent data rather than parent
> > names, to actually bind using 'clock-names' specified in the DTS rather
> > than global clock names. Use parent_hws where possible to refer parent
> > clocks directly, skipping the lookup.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Any reason to not move directly to DT index numbers instead of string
> names?

I think it was agreed that we use indices for new drivers, while for
the compat drivers we use .fw_name/.name.
I think I can use a .name/.index combo, but I'd really like to see
some established examples.

-- 
With best wishes
Dmitry
