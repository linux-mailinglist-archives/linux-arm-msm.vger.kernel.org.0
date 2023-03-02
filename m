Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA3A6A8621
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 17:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjCBQS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 11:18:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjCBQS4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:18:56 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7261218A93
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 08:18:47 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id y144so4082295yby.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3EhQnubxJM8atfjMpN5zRydzRFKsqPB0tEX95z/zlwA=;
        b=dL/fAserc+UcXTzCNcuI+plQ0mMCZshyo/7rXL7gQbpTLH343r6Avz9kytbFm0Gs+C
         VGMOe850hWbu8oaREuB+RdLEu8BX12vyFxjO0UUOaU5+hL8Vh6uurEFaVs0syAQTFQX+
         9XvdSjBPGpm5H1tkOXrJMBol9Cn/bbzpIKH1kpEGVoStWfx6ZMns8DCWngz11ugzwm4O
         MScYyKt5shM7gEF8qZ9uw+1e9Oi3FYL6lXlCCYs5anqz5nynPXXSQ/neVgRuwnPK0Nhy
         qux53flZL1Zv4ScqAw6ZUiYIk0Mu8PeEpR/5Mo0nOZgZ3oEFlSwuyly0s+dFjJ3b6Wiw
         Ilzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EhQnubxJM8atfjMpN5zRydzRFKsqPB0tEX95z/zlwA=;
        b=M2+BgRCS5qe8cdO1uPiEsGQVKpCD+jqtbICDR43aQtECsyGOaXJ/SoRZtKPsH+jHsx
         Pieu17zClTA9AfcXLggXyjIzeqUcEdff77Yv9U222ZTb1h+PqLdaG9sdUhzrEX+hq04N
         AYyWl/HNM93oz/v/FaogsJpGpNchGfnLJiRZUHsoz1zA6/MdS6+zMl8qsf2HN8+aio2V
         yToM1HfUYUWHYaMW8K85mthujTCre4HYHBTqod9t3E4sZpSidEjXxOqpffxNc45lU5me
         aUUsXqBYLbtncfHgV7t7alj2pa0JFOTxCtNLSESUEegHhe/5Hh06KYv/30pn8Ak/0IwZ
         NkHQ==
X-Gm-Message-State: AO0yUKWGtawjvptbqymVW2vNnduxinCK6STyZx1OTwrKA1RWV9r/PYfs
        gX86BCsBx9CDd1xaG+tVLmE7iaAEZasVqF+nTuQG6g==
X-Google-Smtp-Source: AK7set9g2RG4Uro281EWN1PXA7Eh7yjnAseXqmszJ+0KCjr92KyYnLJOcsVvcxZJDCj0gy1YvXwiAmBPEggDnVm/bAE=
X-Received: by 2002:a5b:892:0:b0:9fe:195a:ce0d with SMTP id
 e18-20020a5b0892000000b009fe195ace0dmr3839749ybq.10.1677773926682; Thu, 02
 Mar 2023 08:18:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677749625.git.quic_varada@quicinc.com> <405a87eebf3c6a971def16122b70158dd8c7ed03.1677749625.git.quic_varada@quicinc.com>
In-Reply-To: <405a87eebf3c6a971def16122b70158dd8c7ed03.1677749625.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 18:18:35 +0200
Message-ID: <CAA8EJpqoocEYZPsaBe-pQ92ikLCAZD5hV46NZBC29pNv7U4dGg@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: ipq9574: Enable USB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
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

On Thu, 2 Mar 2023 at 11:57, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Turn on USB related nodes
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts b/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> index 8a6caae..6a06ca4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> @@ -121,3 +121,7 @@
>  &xo_board_clk {
>         clock-frequency = <24000000>;
>  };
> +
> +&usb3 { status = "ok"; };
> +&ssphy_0 { status = "ok"; };
> +&qusb_phy_0 { status = "ok"; };

Please follow an example of how it is done on other platforms. DT
nodes are sorted, newlines and empty lines are inserted in proper
places.

> --
> 2.7.4
>


-- 
With best wishes
Dmitry
