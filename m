Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51DC4754925
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jul 2023 16:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjGOOIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jul 2023 10:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjGOOIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jul 2023 10:08:43 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C886D1992
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 07:08:40 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so44863631fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689430119; x=1692022119;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ll+dFRODO/7ee6rRlWXrO/wH1U0TwY1Wqw8OK3QY9U=;
        b=Kw7fSn1NkSVkKGb3Cl/TVCZFuPgCl18Mb1lDONdgsL1l72mZ/audBVhO2kdo4MNX3d
         kfQpU7tgK7Y1/e4naNhimnpGpcatIcBjppEraE+KwYCm6eNXQavCMBjZqTWlddt4fWNo
         j+bKCRbUVR/FvrOv1+C4OlUFhwLxV05C8Ft/AWz+juDr3xLzUqH1BtCmOyL5x/CB21zE
         9WSqG0NWpadnB6XujTiqccMTV49m4tLJvrbgmtZVGHCXhaskyn0Qq0MBhlOLtromjzwI
         ZiPwr8g9nE/Qhc4ZGA2wS4K1WNuQlMMyCW+GuU66eu+rlUX9yeVUzcNRkibnl5vKA9Ld
         NHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689430119; x=1692022119;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ll+dFRODO/7ee6rRlWXrO/wH1U0TwY1Wqw8OK3QY9U=;
        b=jysF1yfuJhZy84ctFM8ingXzOwF+GEExWn+bpWzRezt54xv97xFORShI+jDWoZ4QaW
         fH5E1b7eKGDgx3vGLyE+msghwKRAWC3namUM6Yiiqiy7OxIIRC+D7OkKzj8Qe+MA2Rvj
         xd8xqhpF1Qwnok2kbZP1KEAusFehNe2OWuE45DMDvFJNNjf2pkDVHpk05HflBLGskVHO
         +C7q+D9NwDMZNY+xvXtoDVH/qkTBzG2ZvbM0fZsf6fp071SX14/whViTf22Pjzg8CNJL
         i6+jzdlXyj+p+BhbmmIZZ2aBtDgPH5sQDjKGKNrSBeXKFV0pTt66yPPzlrjdMmRliLW9
         yiww==
X-Gm-Message-State: ABy/qLaimJtgo3Tl8nUlZX7VbymO9bMIL6TOJ5Y8youBD7RFZT2Rn62B
        DdK/CdWZ/4Kc/JdEJSlAAjROt8vTsduzcWNsWns+bw==
X-Google-Smtp-Source: APBJJlH7VKNPGyyy4U7Wb6bR6bZlBUUanCcsH6t6s5sQy0mmPU5TmlD3Ev1JRSoDGDOv2Wdn01X4wA==
X-Received: by 2002:a05:6512:1190:b0:4fb:9f93:365e with SMTP id g16-20020a056512119000b004fb9f93365emr6344267lfr.41.1689430119087;
        Sat, 15 Jul 2023 07:08:39 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
        by smtp.gmail.com with ESMTPSA id m26-20020ac24ada000000b004fcdea129b1sm581684lfp.279.2023.07.15.07.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 07:08:38 -0700 (PDT)
Message-ID: <3275085e-e4ed-6b0b-c108-cde90a8283b8@linaro.org>
Date:   Sat, 15 Jul 2023 16:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ARM: dts: qcom: msm8226: provide dsi phy clocks to mmcc
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230712-msm8226-dsi-clock-fixup-v1-1-71010b0b89ca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230712-msm8226-dsi-clock-fixup-v1-1-71010b0b89ca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12.07.2023 09:52, Luca Weiss wrote:
> Some mmcc clocks have dsi0pll & dsi0pllbyte as clock parents so we
> should provide them in the dt, which I missed in the commit adding the
> mdss nodes.
> 
> Fixes: d5fb01ad5eb4 ("ARM: dts: qcom: msm8226: Add mdss nodes")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> index b6ae4b7936e3..d2d09f2f3cee 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> @@ -404,8 +404,8 @@ mmcc: clock-controller@fd8c0000 {
>  				 <&gcc GPLL0_VOTE>,
>  				 <&gcc GPLL1_VOTE>,
>  				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
> -				 <0>,
> -				 <0>;
> +				 <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi0_phy 0>;
>  			clock-names = "xo",
>  				      "mmss_gpll0_vote",
>  				      "gpll0_vote",
> 
> ---
> base-commit: 40b055fe7f276cf2c1da47316c52f2ff9255a68a
> change-id: 20230712-msm8226-dsi-clock-fixup-ad8bfd411eb9
> 
> Best regards,
