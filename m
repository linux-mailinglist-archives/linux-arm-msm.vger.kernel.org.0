Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B201F6C474D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 11:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjCVKPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 06:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjCVKPz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 06:15:55 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71F35650C
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 03:15:51 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v25so12944294wra.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679480150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm9HBOFg2FeE/gF/2Wf9vf6aafreUYFQgzgGk5L/6e4=;
        b=LsC1Lb26wFjGXK0ez4T9mqRA7Luemfa5iGUWFheBhFTRpRYRILv+qKkC2GQZWL1fS6
         /2B6whrFiLBun9/bZ7eoge1Iwl9vPWLJMIIXwfztY+Vw/P7UD9/TUTNw7mRbGPkwFtYd
         bRd8Ww+5lm//IO8U1lOrGDW8Ba0NVdu/ZpqtJgUKkuQ92JFX29Us/qTrGhmoZyTialpV
         n8jL+Q8Ghkxfjr9sbUu9JmBuMHK0MLloOR4fwG1SIlqTWFII9brgMsjXnZnezvbzWtE0
         UwT5R6tG/u88u0qWEzem91+6BNNBX4dW14dWFytaPl7g0NVI7J+Lp1mWe0LDY1F/nLF1
         8YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679480150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gm9HBOFg2FeE/gF/2Wf9vf6aafreUYFQgzgGk5L/6e4=;
        b=sw3NGo7mRQE7i8zED13afVKeGgWvu9GDe9legKgeGH60gUW/rXGXPmYmUqk+tUpABb
         nGhBBoLAXDtuSmYBs1FB0IMDfeMaU8bfyyAs0Aq6cDV21ZcjL30Ka7IoPfKICsdqmkyl
         56lQVB4ntQfc/VX13XlJ3iE1pMYEEq+tr8Str+yQB1taYsJk6sg2LD36y1jozo/7WNFd
         97quaaQdkE+lpwVrV+cl/a3h6wPOmHpYMKKL8NZTqzUjp2m5KaiCtPVdKlXwCq/LjD0o
         U3SNYPDDOxSb0yUOceH7DrF2baBLBDg127EvWUA878TjvY2AE0/c0xBB1PEpc95ugVAV
         s+vg==
X-Gm-Message-State: AO0yUKX0oc2Z+WJzu4YEETvn+trvapnRM/QqgBH5Otb2TXWJLNcRQ9ql
        O+W8X3Jyz5ibUFTuy7RlY81wKq3Z8esb17ggRW7I+A==
X-Google-Smtp-Source: AK7set91sMpg/DjYNxhi53xj5l50D5U9PRwEL0svQxCY6aJArZydyhMQqIhZTNDf22OlCoHqmVxdg5C4AyhYjuVSlPg=
X-Received: by 2002:a5d:6641:0:b0:2d0:58f9:a69 with SMTP id
 f1-20020a5d6641000000b002d058f90a69mr1136893wrw.4.1679480150272; Wed, 22 Mar
 2023 03:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230322-topic-sm8450-upstream-qce-v1-1-b76eaa1824ff@linaro.org>
In-Reply-To: <20230322-topic-sm8450-upstream-qce-v1-1-b76eaa1824ff@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 22 Mar 2023 15:45:39 +0530
Message-ID: <CAH=2NtwoLbjNV88DHbS27CwYA_Y-uoKAamKorhaUnany9akNWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add crypto nodes
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Mar 2023 at 15:34, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add crypto engine (CE) and CE BAM related nodes and definitions
> for the SM8450 SoC.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 7c1d1464a1f8..d7e0a1993558 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -4084,6 +4084,34 @@ ufs_mem_phy_lanes: phy@1d87400 {
>                         };
>                 };
>
> +               cryptobam: dma-controller@1dc4000 {
> +                       compatible = "qcom,bam-v1.7.0";

This should be "qcom,bam-v1.7.4" instead, as per the HW documentation.
Please refer to my patch here:
https://lore.kernel.org/linux-arm-msm/20230321184811.3325725-1-bhupesh.sharma@linaro.org/

So, if you want I can modify this and fold it in my overall dts
patchset, for which I am about to send a v2:
https://lore.kernel.org/linux-arm-msm/20230321190118.3327360-1-bhupesh.sharma@linaro.org/

Thanks,
Bhupesh

> +                       reg = <0 0x01dc4000 0 0x28000>;
> +                       interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +                       #dma-cells = <1>;
> +                       qcom,ee = <0>;
> +                       qcom,controlled-remotely;
> +                       iommus = <&apps_smmu 0x584 0x11>,
> +                                <&apps_smmu 0x588 0x0>,
> +                                <&apps_smmu 0x598 0x5>,
> +                                <&apps_smmu 0x59a 0x0>,
> +                                <&apps_smmu 0x59f 0x0>;
> +               };
> +
> +               crypto: crypto@1de0000 {
> +                       compatible = "qcom,sm8450-qce", "qcom,sm8150-qce", "qcom,qce";
> +                       reg = <0 0x01dfa000 0 0x6000>;
> +                       dmas = <&cryptobam 4>, <&cryptobam 5>;
> +                       dma-names = "rx", "tx";
> +                       iommus = <&apps_smmu 0x584 0x11>,
> +                                <&apps_smmu 0x588 0x0>,
> +                                <&apps_smmu 0x598 0x5>,
> +                                <&apps_smmu 0x59a 0x0>,
> +                                <&apps_smmu 0x59f 0x0>;
> +                       interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "memory";
> +               };
> +
>                 sdhc_2: mmc@8804000 {
>                         compatible = "qcom,sm8450-sdhci", "qcom,sdhci-msm-v5";
>                         reg = <0 0x08804000 0 0x1000>;
>
> ---
> base-commit: b12b871ec9079b0baefa69f8a869712682d16020
> change-id: 20230322-topic-sm8450-upstream-qce-04daf8d81bb1
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
>
