Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2552703C3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 20:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242319AbjEOSPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 14:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245205AbjEOSOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 14:14:44 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD65B1C053
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 11:12:21 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-55a829411b5so120981087b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684174341; x=1686766341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UG/nFHajbw6yGBJ4fCskpIHD7pUkyYFl7ARQwWR7+5g=;
        b=e4wwH+a1K8FA8UbtOQBmqfe6jF7c6u1C5D92koHM17o1iBgPKALC6S9in/UrMcNEH1
         FC1jlwEpdp3FvhUppF2bixpI8LPEmwn1Bc2Z2hWFRjqF25FInk9kRfh4WbNFjU/jM3ZW
         ZeLLoIykVvZq3vorbIYg/PjMkB2w1noBVIiqYelQEH4eWa/bhMNR36h3s8IQF268FzT7
         gYlZdWF56fc7grjcjJeHLrXzSMi4UKEyMJouQBz7BbJ/of1qdvV+DIDVDNaQJ+cG60lX
         TBXSFkBQcnSzuUjOKNg/YykesABAjk0KEQLsL5AepFZtoICaUKqkpwYLSJlk3bRwLr9u
         kkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684174341; x=1686766341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UG/nFHajbw6yGBJ4fCskpIHD7pUkyYFl7ARQwWR7+5g=;
        b=PSsJi84QurMhZ95rTK7kzCyQ4W4bbBzbXtscr7jcY/qUqbRchIklAAnQHUD+Y+42qC
         7aax2Q0ftp+i9cjQB1eJmilSWusj6fnNguIxZ1RrDkFiSUCrqO+jSTg0kxV8EBBOjbym
         be1wGum9tvTh/2vyGb3CTsDKUvbD7DAHbI17fzk3ENvYHQP/iyYMCvF3Q6Z1Y4KV6Y/V
         8zjzKxHyPtvm8JlBHBUQ9fYh4jyORjJLsFaEqWPQX47VBNUWnKB/ER5kF9i30w5djn+P
         DWxF9hVin8E4RpeWv7ThHv8h1FW2e4ZSQbhx+OU+QctsNPMiigszDVsybeZfIkLjmreu
         n3OA==
X-Gm-Message-State: AC+VfDz4kMoI+lVZmeRh4Mpk9mfVr9uN7gvyIfTKJm09UH4SffPTbznZ
        w5SB+R3qsVGjSWY+ImGsBl7b0AwkUX6Nben9/iz/cQ==
X-Google-Smtp-Source: ACHHUZ5Je4xHDAe5fAqetLKWX9Q5WA/cboHR794VQTukqIEajO+ASQg+ec6Wn/TrZhVsOgwuhlftAuFikK2s7X/3scM=
X-Received: by 2002:a81:8605:0:b0:559:d97c:6fd6 with SMTP id
 w5-20020a818605000000b00559d97c6fd6mr32416639ywf.21.1684174341008; Mon, 15
 May 2023 11:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230509161218.11979-1-quic_jkona@quicinc.com>
 <20230509161218.11979-5-quic_jkona@quicinc.com> <7faf4c16-98ff-f27d-d1fd-3058370c06f5@linaro.org>
 <CAA8EJpo1iMj90BPc6gYngSrJqd8WWArRndgbcVg1fYBKBpVfAQ@mail.gmail.com> <68c3f24f-99a2-ad7c-9371-33ccaf5740dd@linaro.org>
In-Reply-To: <68c3f24f-99a2-ad7c-9371-33ccaf5740dd@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 15 May 2023 21:12:10 +0300
Message-ID: <CAA8EJprfVJxaGT80OxX6HXP5E8yCmpA3K82CL5JQdS923w7whQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8550: Add video clock controller
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 May 2023 at 16:08, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 15.05.2023 14:57, Dmitry Baryshkov wrote:
> > On Mon, 15 May 2023 at 15:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 9.05.2023 18:12, Jagadeesh Kona wrote:
> >>> Add device node for video clock controller on Qualcomm SM8550 platform.
> >>>
> >>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 12 ++++++++++++
> >>>  1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >>> index 6e9bad8f6f33..e67e7c69dae6 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >>> @@ -7,6 +7,7 @@
> >>>  #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> >>>  #include <dt-bindings/clock/qcom,sm8550-tcsr.h>
> >>>  #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
> >>> +#include <dt-bindings/clock/qcom,sm8550-videocc.h>
> >>>  #include <dt-bindings/dma/qcom-gpi.h>
> >>>  #include <dt-bindings/gpio/gpio.h>
> >>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> @@ -759,6 +760,17 @@ gcc: clock-controller@100000 {
> >>>                                <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> >>>               };
> >>>
> >>> +             videocc: clock-controller@aaf0000 {
> >> This node should be moved down. Nodes with unit addresses
> >> should be sorted alphanumerically.
> >>
> >>> +                     compatible = "qcom,sm8550-videocc";
> >>> +                     reg = <0 0x0aaf0000 0 0x10000>;
> >>> +                     clocks = <&bi_tcxo_div2>, <&gcc GCC_VIDEO_AHB_CLK>;
> >> One per line, please
> >>
> >> Also, any reason the XO clock does not come from RPMhCC?
> >
> > bi_tcxo_div_2 is an RPMhCC clock with the fixed divider.
> Hm, I don't see it neither on -next or in this patchset..

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm8550.dtsi?h=next-20230515#n41

-- 
With best wishes
Dmitry
