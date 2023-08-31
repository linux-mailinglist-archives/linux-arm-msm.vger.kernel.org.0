Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46BF78E90A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 11:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242986AbjHaJEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Aug 2023 05:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240833AbjHaJEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Aug 2023 05:04:15 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E137CCF9
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Aug 2023 02:04:12 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d66f105634eso352931276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Aug 2023 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693472652; x=1694077452; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EP5BZ5K3ZE2Pv+daLf3Z5xOE89jzoMtdEYKXKltONtI=;
        b=w2zcrDrVoFU/fkOeFET2k1tuxpd0M3Dd140GlcvM18nL33DsTUPy9cZGXHIsJ7hiat
         jKzHeo7AW9cwQg/pz8sLq0X3rxd0QuG/cT4KKwEbUzDRDHkQHrfBCOLVB7TJhJWDxYd2
         +q2agvYaprOoIB+O5HpTaDvfaoLzcAo8VLjnFiEl8W7iCznxgRoBKeyVUZCLFMTleLgm
         aTaq9lzf1+SO6cS3dgczZfe7sYPpF7SCo+glEiJMw1jM3aCcct3+S2ydo7+YNMoiB5zq
         Dv9nJOOjrXgPWNpFIcP2NgymUZ2K26/3N8nEQgFDE5cIeZ5zKT7pcuKHNqF7ANN2IhGm
         M0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693472652; x=1694077452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EP5BZ5K3ZE2Pv+daLf3Z5xOE89jzoMtdEYKXKltONtI=;
        b=krqRAKY67XRRq9lS8yvk4XHeX3FG5M8FBiN6vJLIQCBsMYFYruhlzGDyplhMDaR6ol
         qKoGWotBlfxPUR+FLzvp1eewdspUMoGPgfsxQmq1gXcoccBDBSWJu9ATHoZNRXyzfX7D
         S8xcWow261jLGmUKqliIGL7+p0H5EqxpoMMQabvwVQDfV3ZSjvs0vIz3VPC3szyXhIXu
         X7ar0NEoyw5Y0YQb0fkZ8VIS3aP4mhE+ott7uSvTV2V6+Fv5E4LzuavlRpNWrKJsntoA
         hlJ03CbkdhcEKRlMdhe74+Hs5Xu7p1kxzdXyRsjG5+ckeCS7kP6xxZHAR0+2fXy6T5iA
         auNw==
X-Gm-Message-State: AOJu0YwE2RHe/6HijYsMYHwSLVZ2DdcWDW7//ped/8peGkgR+Ntwkay9
        0bIThHXFeobHLNyfyzrrru7bq3sK6LNY4hHXb4h4uQ==
X-Google-Smtp-Source: AGHT+IGehtGlJIPJafHY2MmAezN7Q363OmOcjqCTAtgV2JV18r+NtcaCGcVXy1e3IqPacnn/e6Yebu3QeMS+pEFWfK8=
X-Received: by 2002:a25:d794:0:b0:d6b:1531:bc6d with SMTP id
 o142-20020a25d794000000b00d6b1531bc6dmr4269044ybg.30.1693472652133; Thu, 31
 Aug 2023 02:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org> <20230324202244.744271-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324202244.744271-2-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 12:04:00 +0300
Message-ID: <CAA8EJprF==p87oN+RiwAiNeURF1JcHGfL2Ez5zxqYPRRbN-hhg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: apq8096-db820c: drop simple-bus
 from clocks
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Mar 2023 at 22:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> 'clocks' node is not a bus, but just a placeholder for clocks:
>
>   apq8096-db820c.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>     From schema: dtschema/schemas/simple-bus.yaml
>   apq8096-db820c.dtb: clocks: xo-board: {'compatible': ['fixed-clock'], '#clock-cells': [[0]],  ...
>     From schema: dtschema/schemas/simple-bus.yaml
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This patch broke audio support on DB820c. Now the divclk1 clock is not
registered, as drivers/clk/clk-gpio.c doesn't have CLK_OF_DECLARE().

Stephen, What would be the best way to fix this? Add CLK_OF_DECLARE
support to clk-gpio.c? Or simply move divclk1 from /clocks into a
separate device?

What is the rule, which clock drivers must support such device-less
binding using /clocks/foo nodes?

> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index 4476e2e22816..b599909c4463 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -63,7 +63,6 @@ chosen {
>         };
>
>         clocks {
> -               compatible = "simple-bus";
>                 divclk4: divclk4 {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
