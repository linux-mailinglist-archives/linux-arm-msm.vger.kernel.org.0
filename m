Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042646018DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiJQUKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbiJQUKH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:10:07 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33F7A47C
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:31 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id g11so8471227qts.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W8TFmEbmI2bCUFDVtq5Szd/lYPbHgYUBIg2C6cX7oo=;
        b=dgmP2kWIfgR33atEWxif93c0jFuDfHYh/Z0f0J8yw0e/UpfDCR86001/k/R/nbWawJ
         njzrh8+UnGxG1o8aXVTx4CMwB3MkIg+CIBRWOhROqBBrpr5dsdndzQ0HTh+DTM4e2USW
         0bpT03T4W4hbB0Tl1WUL4RbhNne9Ztx428BqKkdoKph+MJimrUNPXDq20EhsgXxbQ8Dc
         CXvDrZ7+7HgQMPUjHKo6fxr82XKNey9zufnVr+GV7jEW6MKLjCkIYOk/WwV8U/4xwwiZ
         ZN/Z6DL0ygcWtd9P2UV9CYsQn3MkWMyLXpmwrRCYT2oelOVOB4oa/DwPDdnqm4gjVW13
         ZZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7W8TFmEbmI2bCUFDVtq5Szd/lYPbHgYUBIg2C6cX7oo=;
        b=DVYFQSUqf6yvd916hy9hs9Tbvh2um4wIncKCLDRhWdnXTEBG4MdCOYBiFezlFL6d8r
         2/pDh9Bh/OcmvBX0qZJUfsIgJ/GlcZCk8gNi8cN1bQd8ILOtpvuvmE/bo2ZM6uT9a1cw
         zvEx3khSQ1dhn0DkNUchbhFwiyYpKuftZ5zEbclp0i9R5SNEWqwd3c6aBEwftcu/4GKH
         PEZexxcKAJggwxT2aixHlxG38vcejqk+WDCMSimvSgWJkeO/LizphKJbmBr5LBadDFBn
         hW1x01iUoFYOjhiKFN1qgk4JxVySup+h/oTZEhPJJpDjwzy5P9SWcIoRHHBvF3Q2r72q
         fNEg==
X-Gm-Message-State: ACrzQf1px4WfDMXikui7h/+kM1taxsc2/8099Jof87nby51Fs1dj0UuY
        ydoOxubZ9UA2vovbgi7RtlOPhg==
X-Google-Smtp-Source: AMsMyM7/g0xWhbMnhF1YQ4S+RHCGrgcVGYG7Kv+CASJaB8MG4gPr4iw6IVi5k/8WLnXBMpj82PmL5Q==
X-Received: by 2002:a05:622a:48b:b0:39c:c920:d8fd with SMTP id p11-20020a05622a048b00b0039cc920d8fdmr10347560qtx.330.1666037347093;
        Mon, 17 Oct 2022 13:09:07 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 19/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: do not require function on non-GPIOs
Date:   Mon, 17 Oct 2022 16:08:00 -0400
Message-Id: <166603728602.4991.352835239998109956.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-20-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-20-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 16 Oct 2022 13:00:20 -0400, Krzysztof Kozlowski wrote:
> Certain pins, like SDcard related, do not have functions and such should
> not be required.
> 
> 

Applied, thanks!

[19/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: do not require function on non-GPIOs
        https://git.kernel.org/krzk/linux-dt/c/0ec9c96fdaab2ee920bf58747af78e0f98697bb3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
