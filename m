Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC977AC4CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 21:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjIWTZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 15:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjIWTZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 15:25:33 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B9819A
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:25:26 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59eb8ec5e20so48282627b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695497125; x=1696101925; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bxesPwbKK+IbMVfBmjWGgUeL1XEUWzxsSpby7O2MdPw=;
        b=DlfYuI5aGglWeu/+eBC0xwDAVUpKuie/z9nXzJ/nnqYKlx14qw0kjlf06AKAdQp/Ny
         rxkioxZ4J6Jmka5r/+889fxTKMai5aI21JP0MZfv1Vm+221dMOM6tylkpuP6tdyosFhh
         OM4CSpVx4V9PqDMw/bBUP+ZgTmlXdqN7kVQUw5e0diqhppLoaU1S/F0AVJBdbjKX8CfY
         1v4AhEu7imk722Zoz2aXGQqLR4pUMfhq6RJf1+A6U43/zzJQnBdetwhE53VYURh7ntx5
         ufq8Cle/r+s45ozuR+uQASts9gSZn3/zKyb6fecutdorudCcT6VsCU/h+00qFBjQh6/z
         LyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695497125; x=1696101925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxesPwbKK+IbMVfBmjWGgUeL1XEUWzxsSpby7O2MdPw=;
        b=pHnoPSk0jLS2U2sW3yWpS+xuSL/biO4QNxnKJPfa5ikWeKLOM2Di25omqCckUGqHNm
         tv4j/KAd/MsirxhZ0nxg3Wq+YvC4JRlcjUQvzraRPh1Dl0VQoIT3QQowkOpPBi5c6qEb
         cR4RfZwwJ0L6QZj+YtjtWmAFt9Tabbaqo/R9VDxlrqUj3zVq/h6iklk71gGlbKiPm0mB
         iABFri3XP4Zef7G1pkEfMximL3yr5yU+UV7nRn2ZeQMdLwKjvDKnZtYOIJuBppyb9WLw
         UUdkjJ//u9Z1ZCHaZbBNe4xhBHGOuZ8vy08uBXvhj0ERNnSgo020zs8hzudmyVTGyywB
         hbHw==
X-Gm-Message-State: AOJu0YzQgEwj4c43mEXav/LaVq1mQhniI/zpW91oZjRMmZ0dgwwiC2UN
        9LQuR3rZyMSR2+IeDlviYmvy0JXwZg5ku2XIegHLJA==
X-Google-Smtp-Source: AGHT+IG3UL8gjMqkSV9UZreXyPAOKYXw7SQBs9BVE5PjxhebQt4h+VQhMShs+JNFq9ZQ13DzznAVw/do8m3GfWdF7oA=
X-Received: by 2002:a81:6907:0:b0:59b:be67:84cb with SMTP id
 e7-20020a816907000000b0059bbe6784cbmr2608480ywc.26.1695497125756; Sat, 23 Sep
 2023 12:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz> <20230922-msm8226-i2c6-v2-2-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-2-3fb55c47a084@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:25:14 +0300
Message-ID: <CAA8EJppafz38Wp7CUQGyxLoacO0kXexgyJyA27M38gS104Z_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: qcom: msm8226: Add blsp_i2c6 function
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Sept 2023 at 19:56, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On GPIO22 and GPIO23 there is another I2C bus. Add the function for it.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm8226.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
