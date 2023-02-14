Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C053696362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 13:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjBNMUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 07:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbjBNMTx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 07:19:53 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CAC27D4E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:19:20 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id mg23so8363813pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ovmXEYXrq2+vyqNrmh/+q0b8mG/0E3L5r82zzYP6cY=;
        b=y8YgAGJfycz1eajRJ3OxTa4gkUBalpbYdEOoYAYdodFrxH7XPByIgLUcaGSp4OzY0D
         ABUGzaPq4R89DzXn/eU14LySsYBbuRK3Zjj2HhRz0kKZrU2lnVWAsBYyCUbd9DSQ0zqt
         WZyqJbY8WTiHMuBnuFfANGR3knj0390epLD8ZZF2hc+S+QGQNzROGsnvnjojcpHKXEsO
         RpUIZz5CD7EWOJADMlJvCTHedS46Nha9+LCMNADtUfJtgl4L1q23xdYqKfPM2+Z2YS4u
         k6UxDfXpK0+wJDJiHaTIHQ8XLr6jJv3lHC+zOSZUPFUOChfdSN2sWbzLdJs8XGcRmfye
         TyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ovmXEYXrq2+vyqNrmh/+q0b8mG/0E3L5r82zzYP6cY=;
        b=GC065mYm8AAcGWathzQS9bcjFar3RSecYTZwGPPDuGLSIots48gQMyYfHY6+fGA797
         isCKN8+0ZxccWEvE0Ic93fQuYhAOYNoPW6nD9x4JB9o2+ZjoyT5WKOvxw8d56iwL6VYO
         yTnpmCocmgXtcYkx7sFBjSfe2/l0b3l2Qapi4dfdZeTYUwiP2N7pfZuRFoOUpaXWGKGP
         NTQoSYqh6IOj2gQqxCfnz7q+LlhSOlUJ2yuN2Cc/Fe1Q35F59Wmh8WSMVix3YUYL597W
         c/e2QAQobaetDhLBqdTDZOhawuWhTzWN+vTaoXYAunXbf2sVuOhwcW0RKnPoZXeQmkHk
         nHlw==
X-Gm-Message-State: AO0yUKVe2gJV3jHGufouSnRiYOu4TtOb+F0d0AILAQec+Te0oBdL/KPu
        edEqVNYS4ge+WjevX/4nyFeBtuA4k1NojhFTtmzVLQ==
X-Google-Smtp-Source: AK7set9iaXemtEt75X9jSSXzKMgJee9mLgR7Giz8FYkln7bdKK9+0dWJXw2hqvNJePGa2aMmUpJ8pMP9IrEdaGyyvv4=
X-Received: by 2002:a17:90b:602:b0:233:d176:4e5d with SMTP id
 gb2-20020a17090b060200b00233d1764e5dmr2278579pjb.121.1676377159630; Tue, 14
 Feb 2023 04:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230213205529.2104120-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230213205529.2104120-1-konrad.dybcio@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 14 Feb 2023 13:18:42 +0100
Message-ID: <CAPDyKFoT47Dx8gZgRHF=pYYHqFp89vNoi6YK58e9G32-SyYw=g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sdhci-msm: Allow 1 icc path
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Feb 2023 at 21:55, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Some SoCs (like msm8998) only have a SDHC<->DDR path. Allow this case.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 01f77a77987c..64df6919abaf 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -127,11 +127,13 @@ properties:
>        phandle to apps_smmu node with sid mask.
>
>    interconnects:
> +    minItems: 1
>      items:
>        - description: data path, sdhc to ddr
>        - description: config path, cpu to sdhc
>
>    interconnect-names:
> +    minItems: 1
>      items:
>        - const: sdhc-ddr
>        - const: cpu-sdhc
> --
> 2.39.1
>
