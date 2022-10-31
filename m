Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507F161320B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 09:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiJaI5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 04:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiJaI5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 04:57:08 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB65D2DE
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 01:57:07 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so27696455ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vtw4OpHZk9Ob2MsTgTuIb/CtLxYKY/hRYURfQhdTAc=;
        b=yoLJWPG7IV8EKls3S+16cBmJT+D/mWQ6vpko6wiS039qoDSGn4oKGS1qLk6/ysyPzm
         A2vS8N9/SltB0t0ok8AH++bhVolO1+AoM5uXnw3aKM/tYR8ZALlPzk21GBG6gWxq983B
         oH+HDIRquwJopXP/2W0dIuRjQd92lwIecIrMdfL6Y5bjAcSWH6LDjCYmjrWf7ZV02K2Y
         4RgJFNa6ZcVS678T9Gxbxr4M1WzNSwFdVM4+Vc25t/pZa8DpB1JXIZAsAw8oF5yvokdh
         FD3OhYmQushDHs523+g0HWcS4QZFDy03HVb49MbKh/8LT4tb3RJ4HPydGkeGeBjjWdXB
         nFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Vtw4OpHZk9Ob2MsTgTuIb/CtLxYKY/hRYURfQhdTAc=;
        b=C/WystzkgKFx/u6v0OdCM5QetQKgLxxJ5z85RBklISXBQJfkuuvzwFW8ZuNiVzM1i+
         EjEewpgECQbWecNe9gwmoiM3BIuCC+dJpdYDBnm0qbF9zwGR18hGE4y2sEkJOgXDGf+s
         QaF9WNLEkg931cp/Ij5RCpzt/6eGydlCmkEXJawjss1zu+vH17rHEFfuDOboIcUADpw7
         cv5rnusGjf2QOQShWnWoTPCjFzT4Mqc+jhG4XaQfGNN6FTsoMIJcVDhHvHlb31oXtJ8Z
         sngQZK7ojcF2XsfNRSwKlX0lsub0Hm3W7+t0O7b5JzKqMCOd9NO9YGfpIdzx/Sqpy3DG
         oX0g==
X-Gm-Message-State: ACrzQf0AK9NCK8zU0VaD13D2n4RtZTzKYlK0OLH6qOeuUSJjFOx9gKBd
        0TNfmRMlxWYWQw03HEqrclRm7w==
X-Google-Smtp-Source: AMsMyM4WFYGV3H8V7JnQGlBRkPZbqZmePn1YREUndJY7KOkYPaNePxn7cbtP/WuBWyWDzqZBbEkl/A==
X-Received: by 2002:a17:906:9b87:b0:733:1795:2855 with SMTP id dd7-20020a1709069b8700b0073317952855mr12045923ejc.156.1667206626330;
        Mon, 31 Oct 2022 01:57:06 -0700 (PDT)
Received: from localhost (31-151-115-246.dynamic.upc.nl. [31.151.115.246])
        by smtp.gmail.com with ESMTPSA id w9-20020aa7da49000000b00461a98a2128sm2968199eds.26.2022.10.31.01.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 01:57:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 31 Oct 2022 09:57:05 +0100
Message-Id: <CNZZFA8BSZG7.27R0S7MZV50IX@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Marijn Suijten" <marijn.suijten@somainline.org>,
        <phone-devel@vger.kernel.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        "AngeloGioacchino Del Regno" 
        <angelogioacchino.delregno@somainline.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        "Martin Botka" <martin.botka@somainline.org>,
        "Jami Kettunen" <jami.kettunen@somainline.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Luca Weiss" <luca@z3ntu.xyz>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] arm64: dts: qcom: pm6350: Include header for
 KEY_POWER
X-Mailer: aerc 0.12.0
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
 <20221030073232.22726-5-marijn.suijten@somainline.org>
In-Reply-To: <20221030073232.22726-5-marijn.suijten@somainline.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun Oct 30, 2022 at 8:32 AM CET, Marijn Suijten wrote:
> Make pm6350.dtsi self-contained by including input.h, needed for the
> KEY_POWER constant used to define the power key.
>
> Fixes: d8a3c775d7cd ("arm64: dts: qcom: Add PM6350 PMIC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Thanks for fixing!

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> ---
>  arch/arm64/boot/dts/qcom/pm6350.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm6350.dtsi b/arch/arm64/boot/dts/q=
com/pm6350.dtsi
> index 18c14257e2c1..111f4c1c56ae 100644
> --- a/arch/arm64/boot/dts/qcom/pm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm6350.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
>   */
> =20
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/spmi/spmi.h>
> =20
>  &spmi_bus {
> --=20
> 2.38.1

