Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523647CFA9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 15:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345828AbjJSNNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 09:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345843AbjJSNNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 09:13:48 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C1B182
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 06:13:46 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a7b3d33663so106366017b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697721225; x=1698326025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5ChxAd/tAofPv7khr4Z6g73hAZNzmOJAjL/O4rF+Kk=;
        b=dFG1cjb+9/V16wKOVwYPMCamWFW3GTEW/Woju68SieEcec0+vf279DTCU4xqrGIf2z
         KG45eTcGp95GaOSFNK4kpMY7lKCEsSEL/M5hf8ovvz8NJ+Po2BShUlLXvluMOIQwieXi
         AVNXwUbTsWs5DPr/gaHUcCnnTNfblslxPd6IK0TCrGkdGhiiIJ5ngzWz85EP0++1Q0oQ
         MXH68ZGKNrlOiQA8gCcO+o9kwR8iwIZ9K6Gs6hw8mhNciDm56i1bLbu2tynWDyYPXKWX
         YRjJSD1qGLd32mb+0vyYXltFcJp8m3B2SVwkE7uxubY93to+g0/FbG3OjaD6E+OXWbfX
         B1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721225; x=1698326025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5ChxAd/tAofPv7khr4Z6g73hAZNzmOJAjL/O4rF+Kk=;
        b=l5zNk6VNAZMyOlDlfKKmCcyWSq31vzxwfaVzSKxFJHWmo8MWL6eVrMPrtDaYcJq91a
         H6hoyW5oSE3EqGVHUlDz7aeFZPC19CsJlsTIFM0rPf/5z+l8nWno/+tj9O1TJdKW30Rr
         TgiXDnGIztUc2J8Kpdq/Snorh2aoosb/bPyvUrGJzRDBryNILRp5N8lFzQDraTiXBI80
         ycK+aTJ3usbkK2uNF9knAOuwpMhg5IHhpKx9nAjjz2KEIlExuycXhCYHlKRtZxIvKXMQ
         5On5B6NqcP5bWtjfKgkg9ZcAAEWrRq0JC3O5bOXeswKS7dtGpiztFCewvnJe0DEf7oOK
         Y3pA==
X-Gm-Message-State: AOJu0YxmYoxxrfaoBCgjEbA7zpk49sdRxqeiXwua/nTqaJLZMh8jNN/P
        IXsA+0ZO5YjAINubi4EapG6OR2neQo3A1puH7ewGlA==
X-Google-Smtp-Source: AGHT+IHHv5diCJ9edZeJViOL3pSd2253dXP9+SzRMkkAG2TKUPLe4GDcEKLsBUj2IrUb1nL3nyd6h1S4hyQu5T850po=
X-Received: by 2002:a0d:f281:0:b0:589:f995:eb9f with SMTP id
 b123-20020a0df281000000b00589f995eb9fmr2396557ywf.45.1697721225666; Thu, 19
 Oct 2023 06:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697694811.git.quic_varada@quicinc.com> <5e1c2ff9522dd29e69f286dbbe1c867433763629.1697694811.git.quic_varada@quicinc.com>
In-Reply-To: <5e1c2ff9522dd29e69f286dbbe1c867433763629.1697694811.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 19 Oct 2023 16:13:34 +0300
Message-ID: <CAA8EJpp64kdRbGYSqP302FikKuP2MYmRGePN0zKMygShPsCjKQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] clk: qcom: clk-alpha-pll: introduce stromer plus ops
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        sivaprak@codeaurora.org, quic_kathirav@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 Oct 2023 at 11:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Stromer plus APSS PLL does not support dynamic frequency scaling.
> To switch between frequencies, we have to shut down the PLL,
> configure the L and ALPHA values and turn on again. So introduce the
> separate set of ops for Stromer Plus PLL.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4:     Ensure PLL is enabled before re-enabling
> v3:     Use prepare/unprepare instead of disable/enable in clk_alpha_pll_stromer_plus_ops
> v2:     Use clk_alpha_pll_stromer_determine_rate, instead of adding new
>         clk_alpha_pll_stromer_plus_determine_rate as the alpha pll width
>         is same for both
>
>         Fix review comments
>                 udelay(50) -> usleep_range(50, 60)
>                 Remove SoC-specific from print message
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  1 +
>  2 files changed, 64 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
