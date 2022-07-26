Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E355817EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 18:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239574AbiGZQvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 12:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239220AbiGZQvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 12:51:42 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1737FF1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:51:41 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id q3so10202209qvp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VWMoKp9O5cCiRpNuzRIWvI2y6hcDEynzvi/D30qooR0=;
        b=HMaz/pzZvwOUMpkU+vB+/CnvI0SflgzV9nihYoRVV5heuSGNVpKF+tsrlwVtfCPQaX
         PzMJHE4FfjsBp+6ZnS79PYmW7UuuL+wD3IP3ELl+xhYKThjpR358BBZhqGHHeoh+wM7p
         lsJ7ZQki6uCaALbV3KMIcAZTvJEbgq5vBDxS+ZGRabCA9XfLSxfeAXkaeQvOxoeSBb1R
         5rBTLz3pvA+ULThEsCyLVsfuCIOk3BOs9IDumjqw9Zp+XIJOisLH15TPQmdw8FCCJmgm
         MeyRH4Bwl+W+X+AiGGBLYLmK0y0ss+8559l7FctE45jVtTaVWLJYc9WTQgiBmK3X2BZF
         rFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VWMoKp9O5cCiRpNuzRIWvI2y6hcDEynzvi/D30qooR0=;
        b=oVC6R38AaJ0b4k+g0ImzNrb9CIqTtg13G3/6d7YcFEes6njK+1AVLCgP6txPjKCsJo
         ICn6pqN9BGUSLuumV24Q2GZPln5Tv3pjHN/SY63aQle6SZ6n0rYZT7gtqJ2P5rZNdwOS
         uBrF4V0PuyPBQeqJhyxqoh9elF6b79vFO61/y+GcsYtIqd08ODgHwr8t2vTK0t3AHPyT
         UXrCnpy1yioG1F64UiDNxriEbMq186vatBukY9z3OkyINpUaaxI2Jvi2/Xumzkxri7OO
         fr4rE2rlLCTt6tko/RXkI/2COQV8HBTTrWa8Sk0G0bXLCg4GisiiyKOg9Qa9AXSMnisL
         drcw==
X-Gm-Message-State: AJIora/C0KUix89Bg/lsYklGrVwRSTqtYf3sx4KXfg2ZzDgwcMq5C8IK
        Gtr9GnZzbMomz8NJi5wUiZ9D6l2k4yUu6jc/3ruzzQ==
X-Google-Smtp-Source: AGRyM1tqjdzZwmfAw2V3/D08e13F0gcRZUYKZyYGFurY02FXQRrZzbTjfN0zFvFiDtrxPDEhB08WpZAe5IzvqkoOJAA=
X-Received: by 2002:a05:6214:2a84:b0:473:2958:2b02 with SMTP id
 jr4-20020a0562142a8400b0047329582b02mr15856621qvb.122.1658854300801; Tue, 26
 Jul 2022 09:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org> <20220726150609.140472-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726150609.140472-6-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 19:51:29 +0300
Message-ID: <CAA8EJprjWz+VhsNVze7=MDqbZR4O3nsrsJQbZj-==TH2RMa29g@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] ARM: qcom_defconfig: order items with savedefconfig
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jul 2022 at 18:06, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Run savedefconfig and order the entries, without removing or adding
> anything.  This reduces conflicts, as new entries should not be added to
> the end, and makes it easier to spot differences against actual config.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm/configs/qcom_defconfig | 56 ++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)



-- 
With best wishes
Dmitry
