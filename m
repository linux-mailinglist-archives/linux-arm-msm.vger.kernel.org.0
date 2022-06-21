Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE395538B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348065AbiFURQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352979AbiFURQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:16:30 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBCB2C115
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:16:29 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id i17so14685578qvo.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/VXF4wZsajiLZ27XUCezGyggM3iqXR+nz/WtobXbYGw=;
        b=yUCgL5NNh5M/w5/KACbTNIRzgoFojv313dbaWlmPUxm/5wNIzvzoKUW/Hkh9d4itlz
         I6QOCZNTwd3EFPTNZSoq8K/mZOwEanuAzV7b+FhbSY9pkV2yfMowiViZ0P7v96k1yxuX
         t06rGa4bikZGGZTKJvInmFV+ufV5yZ2+pXLKS44UpmEDmecFMEnU/eP/StMz8+uwkabm
         FyY66vyuJFTKB4wents0lhn3hW5G5cmlwfWagq+VM/OK3W/KJrrn0uytiGPfQ1lIFdOz
         SUtwp6Wdu/Y5A1qciJsbfSIQfmy4YmTw9xAJe2gf4a7+hP+DTNZhfXD+WKVElSpym6Eh
         FFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/VXF4wZsajiLZ27XUCezGyggM3iqXR+nz/WtobXbYGw=;
        b=1Aoy5EuCuxWWWsN5OAz9WrihoYvrPvYHgMlyXufjRu0HmQFY1fUaH5CY/qW2VzRZyM
         M32w1rl6yc3DHkz5JRia97MbDwPWSzUL+2TQV9p0zcTXuEnV5Pvi393++AJMIZFXj8Q4
         dFd24aYLV4SJy041qx43ZoIpcyG14f0rp6yumBdSF+2Yxg7jfyUXzKQM+vON1EWmDgle
         tB1z+i4qTnCuKCGywbzTvSoQGCH1L/RcajdNYIw3yyZuI7JY078/R9gEhdOotjO2FxSX
         yvOlzF0hACKpAe/OG1BRac8ABssP/WdyTsYh8PsPN+/AwWGw7/PE82yP6bt/Mbgk166J
         IK1w==
X-Gm-Message-State: AJIora8fIE4rJjq8FWI35EFon1WgSf0KCKix1LtOEh+CtpUC1tHd0Y4l
        OnCr0zVLrdwMxzbU5G123xlSed+yhcy0bMEqQEyEKw==
X-Google-Smtp-Source: AGRyM1stGSNYjI11WE3KDgYEAFNCPA+04rh0ka7mFyaXhv77wFBY0VQijwcZnC+nsOEZwtvWAJcodjISHbYNuzpY9m4=
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id
 1-20020ad45b81000000b00465ded80780mr24148932qvp.119.1655831788201; Tue, 21
 Jun 2022 10:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220621163326.16858-1-ansuelsmth@gmail.com>
In-Reply-To: <20220621163326.16858-1-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:16:17 +0300
Message-ID: <CAA8EJpqew-v5PAsecjppCJ=EbaVejqJrWxpAMM8xpu6Cg_qo0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add pcm reset for ipq806x lcc
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jun 2022 at 19:33, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Add pcm reset define for ipq806x lcc.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
> v2:
> - Fix Sob tag
>
>  include/dt-bindings/clock/qcom,lcc-ipq806x.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/qcom,lcc-ipq806x.h b/include/dt-bindings/clock/qcom,lcc-ipq806x.h
> index 25b92bbf0ab4..e0fb4acf4ba8 100644
> --- a/include/dt-bindings/clock/qcom,lcc-ipq806x.h
> +++ b/include/dt-bindings/clock/qcom,lcc-ipq806x.h
> @@ -19,4 +19,6 @@
>  #define SPDIF_CLK                      10
>  #define AHBIX_CLK                      11
>
> +#define LCC_PCM_RESET                  0
> +
>  #endif
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
