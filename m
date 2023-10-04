Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7287B7EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 14:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233191AbjJDMJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Oct 2023 08:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242297AbjJDMJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Oct 2023 08:09:00 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D491FA9
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Oct 2023 05:08:56 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f6492b415so7990887b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Oct 2023 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696421336; x=1697026136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uooSCEajVBYK+4N0+yQr6mZZtZ+slaSkRYJcX2gZXHI=;
        b=kDoGAw34oxM+nOzkNmfq7bdgUXnevfn7o3Z9hPM7hYXbFDy+fQac0vGhjC8i3V8/75
         TAO4U7TzvXGPdq7wRTtc1TPZlGeTdySMMHX9DXMAT51qacvtN5wyNENyqn5pWC6YjiaU
         V5qSfvKhfVCEr4zSh7pqvFyZqFeSnXe8SysRkh4w+z6phIWWy7MuwQaGSzotjS21yRWG
         PEbDRVKoA7psgdRRy4km4RKk6T1/31S7BKM0Zy0kYqZvCw526IOxOSF5D4rseTzh7lKI
         IXNrUtQpHwmqhiPOOfbSayL7WpW7wydnwrLhOb5lE2fOexuvmBu1gnfcU4jZg42pc01w
         ygMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696421336; x=1697026136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uooSCEajVBYK+4N0+yQr6mZZtZ+slaSkRYJcX2gZXHI=;
        b=H3na2UUjynLL1UC279aOUPe7bs1WSN2qlnFXf6v5izpoxKx+WN09mth5TzBLtR+AG/
         yT40azzb9a38esbFl2X+P64pSQn5Vw0RsBlmZz/Df8L+N4//cICQQr7qO4EBRub85VnZ
         LnSDPgq8pvEBreV9dkK3GHJTSw8tdupn/umILhzSREeYDRQJakqYwMcpfG2BSt6e3QsY
         MNYP6rVFgUbxQXJJVBRDNJ3nVlMOzeaqQhVqDfbeGKHBS1bxCRUBZ4cMEguRbK1cuieq
         +HIBxu/q6AzthWbuUCBo2+8lHFqhgJXdlfogtt3eEuQlM16C7J5p0m7KnuBYujTH0nSw
         527w==
X-Gm-Message-State: AOJu0YxZ3W4WmPJmJG7JQPYc4ENzJX24Rw+gOzxq+jwCGH2I7ajtbd8p
        ghnbxaK7f2xjC3XXl/s5p20FanCqWFmSoDNTlEattQ==
X-Google-Smtp-Source: AGHT+IGtNE8Bdim5k+kYMkJxXavlzqknUeIEsO5VdfFSg069KV3TIGpu0ks7PhJezu1+AvnccNCYRy4M1pbtuCRnghc=
X-Received: by 2002:a0d:d801:0:b0:59f:79e7:6e5d with SMTP id
 a1-20020a0dd801000000b0059f79e76e5dmr3952734ywe.15.1696421335974; Wed, 04 Oct
 2023 05:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org> <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
In-Reply-To: <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 4 Oct 2023 15:08:44 +0300
Message-ID: <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
> > clk_rcg2_shared_ops implements support for the case of the RCG which
> > must not be completely turned off. However its design has one major
> > drawback: it doesn't allow us to properly implement the is_enabled
> > callback, which causes different kinds of misbehaviour from the CCF.
> >
> > Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> > clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> > switched off (and shared most of the implementation with
> > clk_rcg2_shared_ops). The major difference is that it requires that the
> > parent map doesn't conain the safe (parked) clock source. Instead if the
> > CFG_REG register points to the safe source, the clock is considered to
> > be disabled.
>
> Why not have a new bit in .flags ?
>
> Instead of lying about the clock being off, mark the clock as "parked",
> or "safe parked" or whatever term we choose for it ?

The main problem with adding flags doesn't fully scale. From the CCF
perspective, what should be the difference between parked and disabled
clocks? How should it treat the parked one?

From my point of view, the 'parked' clock is as good as 'disabled',
because the end devices do not work with the corresponding clock being
sourced from XO.
We already have a similar implementation for the PCIe PIPE clocks,
which reinterpret physical 'XO' source as a 'disabled' state to
facilitate disabling the clock before turning the genpd off.

>
> I feel 'disabled' should mean disabled and 'enabled' should me enabled
> when I read a value from debugfs and if we are parking a clock it should
> have a clear means of being flagged as a clock that should be parked.
>
> An example. I recently inherited some autogenerated code for camcc on
> sc8280xp.
>
> One of the clocks is marked as CLK_IS_CRITICAL by the autogen code
> meaning "never switch off" but CLK_IS_CRITICAL stops the camcc driver
> from doing runtime pm_ops to power collapse.
>
> The solution I have is to remove CLK_IS_CRITICAL and to hard-code in
> probe() the clock to always on.
>
> But if we had a CLK_DISABLE_SAFE_PARK flag - then not just for rcg but
> for branch clocks we could differentiate away from hard-coded always on
> in probe...
>
> ?
>
> ---
> bod



--
With best wishes
Dmitry
