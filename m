Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E640702D49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 14:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242141AbjEOM6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 08:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242118AbjEOM6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 08:58:05 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D26A4
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 05:58:03 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-ba6e8965227so6008444276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684155483; x=1686747483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HXqDQRh3lmw332MPRvHZucQcQJLpqaLIK4wu8oQfcgE=;
        b=nW1I839PaX6h9dZPy+wPPlK9E5my1YR0mZqI+8SXWJ54ChnlV3NyrP7PDtv8FARxgv
         N+KlKw1wbJROgv1WvJ1ahWUn0cMtxt3javmg9ag+Lj4akVdt6pRDaC+OTqhD/gzHFmrL
         b7qEI0nqk1VxyYDYY1RZL2bF/O9OwqhtkvQ+ZUnXIg0qnZL4yn1miukLr2fMWWnF8z6I
         wG9hwC30pN6HwkGGAfF6c5Sb8Dl0d15fcHKMQrnkoXsqOWHk2e5HFwrwAtINadH4IUOU
         6bYrCPRaiiiy7TOk659Ql1aP6p55wlCi6ACZXlFBLkXSVyVvEfpz/9kdjDkOHfdy9tVx
         HeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684155483; x=1686747483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXqDQRh3lmw332MPRvHZucQcQJLpqaLIK4wu8oQfcgE=;
        b=cvOeW+4eHWYhF//2fiLjgNVHs5Ppp0689aslOaEK5mkiUp17jOHCzq+jhPIZ1dLnwW
         K6crlGvdGKOXB/g3STBHKCEKjZdfSngkPUasQBCKdSC8inlqnKGaWs5nzx18aO+OshEG
         /9ukC1W0FBCnMptKBW2+ZlFXzrOyhSKaJJDyIiVwlsPIBb9AqEgTH3CM2cjRq446qhdf
         jsvrU/176if2WnmEb10myTrATn0q0x/0VjkdUSbgfVIAvLmn8WOalQw+5DrvP90v0pt1
         90xZjYEKw/2JDBc93aiudmU2AUAG1me9O9OW1l+2vBtAgnSsnJAr2uVvXFtxPDPstS6u
         Y11Q==
X-Gm-Message-State: AC+VfDzUYAWb8VBWyVCXJXdbae932sn6I0bq8Mjs3XpAh7uYPTQRP1ca
        l8QHzRMp7V9IWASGSqW/WnOMY0B3Rp/qwWSvj+3bH9t6hyC/y0Tpi0x0xQ==
X-Google-Smtp-Source: ACHHUZ5HcaVgTLl9wGnyPOESD2iVVb16GOSG7yMh3VRdCQ/p+kSj3yrx3LaanFXqAed3eneQWizWHF6gPhbKR7UzPZo=
X-Received: by 2002:a25:adc3:0:b0:ba6:ba75:2315 with SMTP id
 d3-20020a25adc3000000b00ba6ba752315mr10259485ybe.47.1684155482912; Mon, 15
 May 2023 05:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230509161218.11979-1-quic_jkona@quicinc.com>
 <20230509161218.11979-5-quic_jkona@quicinc.com> <7faf4c16-98ff-f27d-d1fd-3058370c06f5@linaro.org>
In-Reply-To: <7faf4c16-98ff-f27d-d1fd-3058370c06f5@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 15 May 2023 15:57:52 +0300
Message-ID: <CAA8EJpo1iMj90BPc6gYngSrJqd8WWArRndgbcVg1fYBKBpVfAQ@mail.gmail.com>
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

On Mon, 15 May 2023 at 15:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 9.05.2023 18:12, Jagadeesh Kona wrote:
> > Add device node for video clock controller on Qualcomm SM8550 platform.
> >
> > Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > index 6e9bad8f6f33..e67e7c69dae6 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -7,6 +7,7 @@
> >  #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> >  #include <dt-bindings/clock/qcom,sm8550-tcsr.h>
> >  #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
> > +#include <dt-bindings/clock/qcom,sm8550-videocc.h>
> >  #include <dt-bindings/dma/qcom-gpi.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > @@ -759,6 +760,17 @@ gcc: clock-controller@100000 {
> >                                <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> >               };
> >
> > +             videocc: clock-controller@aaf0000 {
> This node should be moved down. Nodes with unit addresses
> should be sorted alphanumerically.
>
> > +                     compatible = "qcom,sm8550-videocc";
> > +                     reg = <0 0x0aaf0000 0 0x10000>;
> > +                     clocks = <&bi_tcxo_div2>, <&gcc GCC_VIDEO_AHB_CLK>;
> One per line, please
>
> Also, any reason the XO clock does not come from RPMhCC?

bi_tcxo_div_2 is an RPMhCC clock with the fixed divider.

>
> Konrad
> > +                     power-domains = <&rpmhpd SM8550_MMCX>;
> > +                     required-opps = <&rpmhpd_opp_low_svs>;
> > +                     #clock-cells = <1>;
> > +                     #reset-cells = <1>;
> > +                     #power-domain-cells = <1>;
> > +             };
> > +
> >               ipcc: mailbox@408000 {
> >                       compatible = "qcom,sm8550-ipcc", "qcom,ipcc";
> >                       reg = <0 0x00408000 0 0x1000>;



-- 
With best wishes
Dmitry
