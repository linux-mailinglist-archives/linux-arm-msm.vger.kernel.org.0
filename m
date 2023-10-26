Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026BC7D8A09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 23:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjJZVFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 17:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZVFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 17:05:30 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0061893
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:05:28 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a7b3d33663so11354337b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698354328; x=1698959128; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7tvKP9i4A7CJ6jTg2zl2DLpBGqflQ9GIOuLSkvcrYnQ=;
        b=U45gEWjM48uRo1inh4jCVTL10k88wPRbDD6RnEQwzB8T4abCywWIc4oMS9MCSMNzYu
         EVD0em8anSnKethcmTJtMpF0GkqdlrlZ003CzOhnlm71Xv/ZozcZWOw6buMnYnv6LJpE
         rK60pcY6S+qsxqeBZIHlY8fgEVhUf1KSPQvO8KtWpyhMmcmdkOuNa/Z59cRVvECWJeGK
         o+j1oyr/x+iG9dmbT+LrA2Ah8+p0w4UkmvbcLSVhwJrKBjicrIPV7smMlI/P3daJWOaP
         xr0Vmp0ghtLB9Oh01sWBLYeUgwXYwjDaj1Yj3DT3L8Y2kHXCU+EZ5XChf5WSFykVnXx8
         1R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698354328; x=1698959128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tvKP9i4A7CJ6jTg2zl2DLpBGqflQ9GIOuLSkvcrYnQ=;
        b=ELaFKKcu8RDaGvXP3Z6p9bl7+ZKVvstiAVtA2WAyagh4AAp9pT5Mz/ivt0WHI63YwL
         gdvFkookUyvbgebhVPk+lcLSAghCUEsVTFMUdSGRqXE2IO350pklTXdEZIVmBTQySrd6
         RrFRz/maABLy/nGEFq9EtiiaYJGnwK7+rc3Hghvca7gDitZTUisP/71SfTYdubWEnmin
         5laKD6SIRUopcIaP68q1gTMW5LFyF4IIXBrQxZRYQbBUykxwm7faUcPZkApj64VsrTte
         bINNLT3J9NNLsPD5I4h2YG1Lf+0Zf8s/8B1Y0PND7mp8HJJFKBf67RqjVQI/1VLGCHn5
         +Q2g==
X-Gm-Message-State: AOJu0YyTyn/x71Zc98ufbGqtjkF54k0PPshORlYgP/5xOh57cQZ3i5G/
        i4IDZCuTzcIYz1yOm46kp8M/YXlhEY6hr5cvqw4N0Q==
X-Google-Smtp-Source: AGHT+IHqztsHAMPpem0Cm24hgkWReCxLjW8B68euPJ7kMBXHdNf40CfG/Y/Nz3heXg6kPycfjXRqDbPnBKnN7HN35UI=
X-Received: by 2002:a81:eb0a:0:b0:59f:773a:b14c with SMTP id
 n10-20020a81eb0a000000b0059f773ab14cmr673384ywm.37.1698354328191; Thu, 26 Oct
 2023 14:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org> <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
 <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org> <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
 <ac995dde-b5b3-4dd8-b704-5081cf9f9162@linaro.org>
In-Reply-To: <ac995dde-b5b3-4dd8-b704-5081cf9f9162@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Oct 2023 00:05:17 +0300
Message-ID: <CAA8EJpoiNhJ1Cn9NDMk2OYQ4x-OyxOS2V6Z=8fDsHSyyxdhAnw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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

On Thu, 26 Oct 2023 at 23:49, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 10/26/23 22:47, Dmitry Baryshkov wrote:
> > On Thu, 26 Oct 2023 at 21:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 10/7/23 01:43, Konrad Dybcio wrote:
> >>> On 4.10.2023 02:31, Dmitry Baryshkov wrote:
> >>>> clk_rcg2_shared_ops implements support for the case of the RCG which
> >>>> must not be completely turned off. However its design has one major
> >>>> drawback: it doesn't allow us to properly implement the is_enabled
> >>>> callback, which causes different kinds of misbehaviour from the CCF.
> >>>>
> >>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> >>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> >>>> switched off (and shared most of the implementation with
> >>>> clk_rcg2_shared_ops). The major difference is that it requires that the
> >>>> parent map doesn't conain the safe (parked) clock source. Instead if the
> >>>> CFG_REG register points to the safe source, the clock is considered to
> >>>> be disabled.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>> Would the intention here be to replace all usages of _shared_?
> >
> > Yes
> Then I suppose an immediate followup question would be: "why
> introduce new ops instead of replacing the existing ones in the
> patchset?".

Because using this ops requires doing more than just replacing the
name. it also requires dropping the XO source from the parent maps. So
I'd prefer to perform this migration on a driver-by-driver basis.
Otherwise it might be very easy to introduce a mistake somewhere.

-- 
With best wishes
Dmitry
