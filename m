Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AA8577FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 12:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbiGRKdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 06:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbiGRKdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 06:33:38 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66901E3CC
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 03:33:37 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id o26so8368830qkl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fCe9AacXKSKGVawkGu2UXZD3mKgfm5ZQJ8K9AgWpXc=;
        b=zuFPFlVQPcn3layONbxbMAD3I1QvoIuVuM/d43mpykcnsyNe0aeUldrmzCWtKvIFd+
         a/X7Sn5oZPmmuCnkFunxhr8GyoRR5icP1CrvvTQUo2kzSPD9U5CyobFNZxXeQsNbuPxK
         RIlZI7SmAo496DhG5+VOlvuyT8Ht+OREuI3YTbQHxsZiGMYlS5RfmwkTcVcoMvykcop6
         ONZxj3aZ0oUeTBzbzQzTbUQ06NdBeu26EqMyywR1fXqT7hUIG8hKU1dH5w/gAhNpP5yB
         3Eveo4jTdKNT2GE9+TYRB1EH8LJhNXtUdUP6viw0IKxZFR0/KEkiJu/CeF/jDa9WvdNH
         0iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fCe9AacXKSKGVawkGu2UXZD3mKgfm5ZQJ8K9AgWpXc=;
        b=ZRM9lH3bLCWai8Q0lYiJOTFf+SfiBovypo5/5FtYbz+Yz0k+KudCpw/trw7X5Hm3XR
         n/JJN95rfzRGkg4o4XkSqPygH8Qpg2I2rUWWcpe3d5O6dVFNyE/ZXZo6OpdIPvaTZj33
         ahDazfkwW09C1mAwFPv/MMxCOOVmR85wzsmuxB6gihVe5tx3SzLvSURYzSqg7qlpl27u
         sEU9kl5ws61+jbIU7So+MjX5rLI51laZx6omTLlUYDbWjsYbQ8E85Wn5ZCtAlELTUzV+
         TlhXWP5pkr2kOcd5fJurXKeKkflscXi3KMExqjtpxyjcrQJVKYry7MlW873dvtal5XBG
         iAeA==
X-Gm-Message-State: AJIora+7fOQ45dGAZ96wi97s3hBZ3lbU2doSM+nwCVPTBXxbcQ1xz7w1
        SkCZhatKcMsbRORa2Sbn3RCccpoIzXBKmT4xMfzvtw==
X-Google-Smtp-Source: AGRyM1vVHMIW3XBEONPBPubg6hvT9MlZNp5mZ/KimJiQynHiomqrhBhqPA9PiDk8CiPVx5wSq62jI52vzIkTD9rDYok=
X-Received: by 2002:a05:620a:2403:b0:6b5:e818:5f1a with SMTP id
 d3-20020a05620a240300b006b5e8185f1amr2608906qkn.203.1658140416959; Mon, 18
 Jul 2022 03:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220717213645.1147342-1-bryan.odonoghue@linaro.org> <20220717213645.1147342-3-bryan.odonoghue@linaro.org>
In-Reply-To: <20220717213645.1147342-3-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 18 Jul 2022 13:33:26 +0300
Message-ID: <CAA8EJppnnjphLJC2fFW9Lz06fUZTw8kxS6L+s0kP0+i+1Yh+_A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add clock-output-names
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Jul 2022 at 00:37, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add clock-output-names as optional so that SoCs such as the msm8939 which
> have multiple a53 PLLs can latch the appropriate output name in
> drivers/clk/qcom/apcs-msm8916.c.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index f504652fc0ea2..7497e4c930ae7 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -63,6 +63,13 @@ properties:
>        - const: aux
>        - const: ref
>
> +  clock-output-names:
> +    maxItems: 1
> +    items:
> +      - const: a53mux_c0
> +      - const: a53mux_c1
> +      - const: a53mux_cci

You have probably meant to use enum here. However, is there any reason
why you would like to use fixed output names here? You are going to
use clocks DT properties (with clock-names or using indices) anyway,
so there is no dependency on system clock name.
Compare this with apcs-msm8916.c, which uses a53mux@unit_address.

-- 
With best wishes
Dmitry
