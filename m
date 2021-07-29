Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5663DAC51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 22:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhG2UBG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 16:01:06 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:39545 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhG2UBF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 16:01:05 -0400
Received: by mail-io1-f47.google.com with SMTP id f6so2821094ioc.6;
        Thu, 29 Jul 2021 13:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RXP6K1wIyYRxvLAYaYwOm7HemWSaNT0LgWv3Dij0oMo=;
        b=JaQxa3huBa/mbNIL1hB7q/KLryvAl0XQA+ZffjzrAu3LqsBDV97wg3VOEcM82Xei82
         tKanAwEVpWkqqVw0tjUUkOzMZqwk0O18qRvlAvQ62RYSQ0WyJAEzPuB7JQz4J1g+3oyi
         KqObnbzMIKR7fRSgbWoJRw5DkMCvG0P/++qH9X3/bRsP5ipl9dEOHsPLTLDX1jFgGUau
         jcYEu4AKBEbMSC867uJpC8S59xILfSG+FhQYgrfLTa315QFHobchniQ8t2GWlUscw5a9
         Ntt7ISeldklMr5st0sS/VEjRA0uPxwuOcuduIT8zrZDl0DI29HPpe0eoTvbrd6r5sCAP
         ezkw==
X-Gm-Message-State: AOAM531RGSqqAB7rho63iYpxJXXMSpJPJ+G6cAVg3XjiTfnwgrlYvKNS
        m8Pvqfcurk76diqGOLb0+rNu4U0BOA==
X-Google-Smtp-Source: ABdhPJx0wYbPhjn+z3CxRd5p6aEqdjNBfJCQ0krHCOeiRJ9o9ZU9Lm5aqjB9xrj5r2Sz5UEDXAKVHg==
X-Received: by 2002:a05:6638:1915:: with SMTP id p21mr5884034jal.104.1627588861054;
        Thu, 29 Jul 2021 13:01:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p21sm2734695iog.37.2021.07.29.13.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:01:00 -0700 (PDT)
Received: (nullmailer pid 786531 invoked by uid 1000);
        Thu, 29 Jul 2021 20:00:59 -0000
Date:   Thu, 29 Jul 2021 14:00:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] clk: qcom: gpucc-sm8150: Add SC8180x support
Message-ID: <YQMI+4j8Nl7veuyU@robh.at.kernel.org>
References: <20210721225329.3035779-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721225329.3035779-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Jul 2021 15:53:29 -0700, Bjorn Andersson wrote:
> The GPU clock controller found in SC8180x is a variant of the same block
> found in SM8150, but with one additional clock frequency for the
> gmu_clk_src clock.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml        |  1 +
>  drivers/clk/qcom/gpucc-sm8150.c                      | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
