Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B481C5540E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 05:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356125AbiFVDaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 23:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355626AbiFVDaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 23:30:03 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8085B338A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 20:30:01 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id bd16so19576920oib.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 20:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O2Zo0/T+pbzGGqD3NX7uhkMxO+SgalY6CRu61yBvhTo=;
        b=ClpWJcpyv/ij8ZnnpKV4ihKj9nqjSvWw/sdhvd/QJ+YFc0wFOcEbN7zE7y827fA3vQ
         oBk1nw7kmYGrUCGAhnLPXNr//TQIAfDe7qUt3zl2sZp6fRf4r5kN+NZ/lWcc7nCNtHhp
         z0FIVOKRdubi2aiN93jvP5lsgo7B/07M5S8yFkopGYMC28QbwEPhEoeRrLBMEiYZ1kge
         y+wajf0NUfcKoZLB21L62Dpr5eopgsg3pnSnBKQWEfxPizdDkikd4Y6l7gE8RAADwlht
         ChJabFrUcVfkBhY6KC65K4veTCvhW7x6JbNLopkKGxphd/3rmuU9f7Ne1xI9ddKp1keH
         v+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O2Zo0/T+pbzGGqD3NX7uhkMxO+SgalY6CRu61yBvhTo=;
        b=D5ohAvLuaeivNSqxvVLVZgquBBfbFfLNiuN8HXT/gVkl81yDsxhMplAORYguKo2rFL
         dGofjKgVyqOgWMWCzz+pLNQrI/uCnZIZPMzcIPobYIELzgnSvREanoJIdWCHj4c/VB2N
         7r/Y8SA2SRuOULVDyhEdeYFY51rYY7khQzQGD3/ax8ZElVLlaNiavJ8anVeSNiSd27RQ
         FLmeHE2mCOq+oGJ4m+9j9eWXwiEcEV6gB3vRsD8r3hWsAe08sSo3WWJyYBLHmgExHUG2
         IUO1lL2xh53TeWX9khc4iJJV7kvNmhy+Mztixcleujsa3GeaZmpQpl0xiI+xbxod7v2X
         psSw==
X-Gm-Message-State: AJIora9buA57umx3YA0nuJ+A0QLVE6kQfm8T/z6dNUJQrj9Nm8Ikkb3/
        9s16WanHCRB0HB6UO3YPcCw7MQ==
X-Google-Smtp-Source: AGRyM1vIKICL8I66soG+AX2D+s7hDdneOCSmerHxCbCAMmmTzhge9cUZdcMd1x0kc1i8RZQY2Jq2UQ==
X-Received: by 2002:a05:6808:150e:b0:331:39bf:2228 with SMTP id u14-20020a056808150e00b0033139bf2228mr761906oiw.9.1655868600831;
        Tue, 21 Jun 2022 20:30:00 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s22-20020a056870e6d600b000f33ced2c50sm10025103oak.56.2022.06.21.20.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 20:30:00 -0700 (PDT)
Date:   Tue, 21 Jun 2022 20:32:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add SC8280XP platform
Message-ID: <YrKNNQ2h6I8aseiW@ripper>
References: <20220607214113.4057684-1-bjorn.andersson@linaro.org>
 <20220607214113.4057684-3-bjorn.andersson@linaro.org>
 <79443fb4-5c09-a33f-594d-71ac93cc0317@linaro.org>
 <YrE84tLOpJtzrNW4@builder.lan>
 <9a31a488-f4fe-33f5-84e7-fe4509769d7c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a31a488-f4fe-33f5-84e7-fe4509769d7c@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Jun 23:53 PDT 2022, Krzysztof Kozlowski wrote:

> On 21/06/2022 05:37, Bjorn Andersson wrote:
> > On Wed 08 Jun 03:18 CDT 2022, Krzysztof Kozlowski wrote:
> > 
> >> On 07/06/2022 23:41, Bjorn Andersson wrote:
> >>> Introduce initial support for the Qualcomm SC8280XP platform, aka 8cx
> >>> Gen 3. This initial contribution supports SMP, CPUfreq, CPU cluster
> >>> idling, GCC, TLMM, SMMU, RPMh regulators, power-domains and clocks,
> >>> interconnects, some QUPs, UFS, remoteprocs, USB, watchdog, LLCC and
> >>> tsens.
> >>>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2195 ++++++++++++++++++++++++
> >>>  1 file changed, 2195 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> >>> new file mode 100644
> >>> index 000000000000..4143813643ad
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> >>> @@ -0,0 +1,2195 @@
> >>> +// SPDX-License-Identifier: BSD-3-Clause
> >>> +/*
> >>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >>> + * Copyright (c) 2022, Linaro Limited
> >>> + */
> >>> +
> >>> +#include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
> >>> +#include <dt-bindings/clock/qcom,rpmh.h>
> >>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +#include <dt-bindings/interconnect/qcom,sc8280xp.h>
> >>> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> >>> +#include <dt-bindings/power/qcom-rpmpd.h>
> >>> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >>> +#include <dt-bindings/thermal/thermal.h>
> >>> +
> >>> +/ {
> >>> +	interrupt-parent = <&intc>;
> >>> +
> >>> +	#address-cells = <2>;
> >>> +	#size-cells = <2>;
> >>> +
> >>> +	clocks {
> >>> +		xo_board: xo-board {
> >>
> >> xo-board-clk
> >>
> >>> +			compatible = "fixed-clock";
> >>> +			#clock-cells = <0>;
> >>> +			clock-frequency = <38400000>;
> >>
> >> The clock is probably on the board, so the frequency should be rather
> >> defined in DTS.
> >>
> > 
> > It's an interesting question, but I don't think it's possible to change
> > the rate of this clock from one board to another.
> > 
> > So I think it's best to keep this in the .dtsi, to avoid unnecessary
> > duplication.
> 
> It does not matter whether the frequency can be changed or not. This is
> the same on almost every SoC and the same comments appear every time -
> the clock is a property of the board, not of the SoC, so it should be in
> the board DTSI. To avoid the duplication you can indeed keep here most
> of the clock properties, but the frequency must be in board DTS.
> 

I find this to be a rather strict interpretation of "board specific",
but I'm okay with it.

Regards,
Bjorn
