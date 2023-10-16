Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC4D7CA2B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 10:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjJPIxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 04:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbjJPIxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 04:53:15 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A5CF1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:53:14 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a7cc03dee5so52444507b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697446393; x=1698051193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0qjL7Jne2EuSY8hJrWaJD0Y2w0iLDuf6rVnD3m4Il5Y=;
        b=xgc028NSAPx6kQQEGoEWI+YHMHnAt9mDVB0tPtr8ZMFeMqlw6AVj67SODYXbXfzCAK
         sqZwyJAlpTIMzvOMG6RJz3qEENDQYm1jeNYLU5rhYHeLQ7MOFcubwZfhxNUhjfGCbjDG
         CZfwbJeO6h6z+EziW0JkyCUv0PRCdCKmDS3s5/Rxb/4ILGfhusiTUGmCU/SVHx3DLj5y
         VvZY1E6L2B9yeTpBIj6DadquAPsh72JWEVxlAKUd08scKGBIIzXOuyOjoPmw6mDV++Z9
         zUqoUCFF5ocpYESHgp1vBGD9SC034vQX0scdYdx0+s8DjvkejI6dWeL/uBqZuerE0Aze
         40aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697446393; x=1698051193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qjL7Jne2EuSY8hJrWaJD0Y2w0iLDuf6rVnD3m4Il5Y=;
        b=ZgaFAZvzlF/J+ZchD/zIrqaZ6OlZfYhvbri3jWUokUKKimB+quOfOrKS4jRJ8fCkSO
         QosPdfUaiWEde/4K0vYfO4aUXLI1qUK69kBPQed+ZyOSpR0WXUa862Xh+0RbUje0xWwa
         Pb+zW/Ep6soJJieq+D0bschawfJx6fxEBb+v6X4nsxTL2HkFzmjcO0uYKKbLqUOG7rsh
         F6bav4mW3fBHTfJPYNFAgqN1pIlmxzyaYlA2XguFR9GJbdozdDVfhQIIHiEbTUPvqgsz
         DBB1UqBD+PEr/fQSj8HTEZF2kIJUFp9bB0TLBO2brG4DEG1nVlFhusylrOfx2dVnccbD
         gNew==
X-Gm-Message-State: AOJu0Yyhhx0JUbZ2+ko42Wl9t1+R14+ooEuz6/+qIiMrUQbtxUMDgiq5
        t61+VD5AO6P70rS7NqAiNLP7W3lpyLRW9O60LeeK/Q==
X-Google-Smtp-Source: AGHT+IH4xBr1KrgiLsfmacR6sZSOPfQzcHLoH+Lo+h6GkkMSCXJ0UKEHTksgQfzA2wSwtVAKncDAED18cfQIE+i3W6k=
X-Received: by 2002:a81:4fd3:0:b0:5a7:dbd1:4889 with SMTP id
 d202-20020a814fd3000000b005a7dbd14889mr17047139ywb.2.1697446393255; Mon, 16
 Oct 2023 01:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231016080658.6667-1-johan+linaro@kernel.org>
In-Reply-To: <20231016080658.6667-1-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Oct 2023 11:53:02 +0300
Message-ID: <CAA8EJpoPSHfRMgzs69Z-Zk0L8z8_8sveh22pj4ZOAwyAPvesHQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-crd: fix eDP phy compatible
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 Oct 2023 at 11:07, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> The sc8280xp Display Port PHYs can be used in either DP or eDP mode and
> this is configured using the devicetree compatible string which defaults
> to DP mode in the SoC dtsi.
>
> Override the default compatible string for the CRD eDP PHY node so that
> the eDP settings are used.
>
> Fixes: 4a883a8d80b5 ("arm64: dts: qcom: sc8280xp-crd: Enable EDP")
> Cc: stable@vger.kernel.org      # 6.3
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index 772953dc428e..31a2a2d27f4e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -458,6 +458,8 @@ mdss0_dp3_out: endpoint {
>  };
>
>  &mdss0_dp3_phy {
> +       compatible = "qcom,sc8280xp-edp-phy";

Same question here as the one I've sent for Konrad's patch. Is it the
same PHY type, just being repurposed for eDP or is it a different PHY
type?

> +
>         vdda-phy-supply = <&vreg_l6b>;
>         vdda-pll-supply = <&vreg_l3b>;
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
