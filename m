Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2326071F9BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 07:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbjFBFnL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 01:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbjFBFnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 01:43:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C191A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 22:43:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30adc51b65cso1526606f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685684587; x=1688276587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNTg+KuLBbcTe5HDJe8O03xlL6tR45AjRJnyQRIY63E=;
        b=t+5e6M32D48uebn5lqVZohvfd6CQuRjE8hp4CEoy/uc9tWUsuAUoZ2qX2po9RVG/5h
         GkJJUQKo7LEzljbhWFao2eUdJrxbEvAlrxXO+1MhwdMNfjFEWhB7y19PI4r1EQKFDQeW
         SW4lMo3jDW3OCWEHj8QvNPspIJYjDH5U1EzvJnxtx3/swyzGt7rrIrVcsjkcGRntsTdI
         O5PrjcXu/gfSkv1Cbf/4GoMVBvctFMTMgSk0dH3Wn4YuIj2y4COmdXHAnr6AedBM2VI/
         zjRZEcLTvtNLweP4t6Nz5IWghaCLBuMDMKz8C33BsQC0TS0ijQp0+fPWE2n0ngzIyu+j
         9MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685684587; x=1688276587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNTg+KuLBbcTe5HDJe8O03xlL6tR45AjRJnyQRIY63E=;
        b=fgj1Jb/NAKedD+TUXK8LR2I34XWSXKT5IAEGh1HRh9qIDFcCWPUIR68TFK1hMuiEQT
         pkOOpYD4bQ+h4VDpPFzOsv9u8SLg+rcZW6IhYCnpMiNm2kutoJXi/5Mxffl6tfy6oXIE
         O78sBZgsNGVDXvswG39pp6KryC0UUA7liKiy/Vxk78tF5asjkVlgNpJGKLYhathsG9/F
         aYVAlc107jLO1oE1DNf7TA/XlTPxvWcXAhx/y/mbMIUUWxEc/mGXqoKrRC6Gr+Z+2NCn
         9GnsB/Zt09/syvBQPigbNsgLtg1b0w2f63dqUbsrJNrTqeAjp5+T7/3RHWWMZAwVqXFn
         Qwzw==
X-Gm-Message-State: AC+VfDztY4Fj6hb+zTNbn5MkBTHBRI656AKR/6R13osAsa+wOh2i7/ha
        35Z/jLaXQaqN+0rU3ynFBcCwqQ==
X-Google-Smtp-Source: ACHHUZ5m3+HGO2Q09xGpHY7AnCCpDNZfAg5pNondET17bqvD/cQcPcbYOXnBlS2NfNQ79ctkLbpC/g==
X-Received: by 2002:adf:d84a:0:b0:309:4a0f:facc with SMTP id k10-20020adfd84a000000b003094a0ffaccmr3238420wrl.40.1685684586965;
        Thu, 01 Jun 2023 22:43:06 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d5386000000b00307c46f4f08sm551869wrv.79.2023.06.01.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 22:43:06 -0700 (PDT)
Date:   Fri, 2 Jun 2023 08:43:05 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8250: Add missing interconnect
 paths to USB HCs
Message-ID: <ZHmBaVFF7Vys9dev@linaro.org>
References: <20230601120029.38859-1-abel.vesa@linaro.org>
 <20230601120029.38859-2-abel.vesa@linaro.org>
 <eb7b8485-6c6c-da4d-cf90-334139b21ce6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7b8485-6c6c-da4d-cf90-334139b21ce6@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-06-01 14:22:35, Konrad Dybcio wrote:
> 
> 
> On 1.06.2023 14:00, Abel Vesa wrote:
> > The USB HCs nodes are missing the interconnect paths, so add them.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index e5c60a6e4074..eefd3dcbb2e1 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -3750,6 +3750,10 @@ usb_1: usb@a6f8800 {
> >  
> >  			resets = <&gcc GCC_USB30_PRIM_BCR>;
> >  
> > +			interconnects = <&aggre1_noc MASTER_USB3 0 &mc_virt SLAVE_EBI_CH0 0>,
> > +					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
> You need to update #interconnect-cells to 2.

Ugh, missed that. Will send a new version.

Thanks,
Abel

> 
> Konrad
> > +			interconnect-names = "usb-ddr", "apps-usb";
> > +
> >  			usb_1_dwc3: usb@a600000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0 0x0a600000 0 0xcd00>;
> > @@ -3810,6 +3814,10 @@ usb_2: usb@a8f8800 {
> >  
> >  			resets = <&gcc GCC_USB30_SEC_BCR>;
> >  
> > +			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI_CH0 0>,
> > +					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_1 0>;
> > +			interconnect-names = "usb-ddr", "apps-usb";
> > +
> >  			usb_2_dwc3: usb@a800000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0 0x0a800000 0 0xcd00>;
