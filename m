Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0686896F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 11:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjBCKgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 05:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjBCKgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 05:36:20 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D1F1287F
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 02:36:08 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso3479603wmq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 02:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/Alxt640yrbBa/XKQU7mj/9+hAa4yXrPlBn7QlwrTE=;
        b=UjMbcFzGrptxieT8o0hY0a98JtOb5i2tKgzNSLNc00SCxbYt/RbwL2n0oavc/67Wki
         NaDqSTrkPlpjAUzlZLYGxtrXVOxw6iFOedrlC1W4FZFBIvq4o7oylRzqr8t4mK3WPQxM
         9+Yg5tkXnHqIf+wjjK6SaOWUmNujCKLWwDIVUMjokI/tm5QPr9eAvPeXN2L2fI0b4naC
         7gCAhJhPJZ1BwLQpQOaIuxcOo8vqCzlkan0H79F6ESArv4JAq3c29OZmVvdTBC5ffow0
         lVthbZ3HSGI+IinbBlShyBximjaEZKjmT8UdtMG+RclwdjK4K+f7vy2FdTvcO3gZ72Fa
         rMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/Alxt640yrbBa/XKQU7mj/9+hAa4yXrPlBn7QlwrTE=;
        b=4BVHVgRYxn6qmjQHYaV7QNCRszIIbd36fOXKMTuOLtvFH3b48QMiW0ARWN1AiFP2sY
         jEQFkYPnebNpa+gBw693ePa4wTj+yjQIkC8sEVlG61KMJHXh7LUQooT998eDe/1UoIOn
         K1kao9/zHuUIS7qbWbncdLsx2BBPS62aNzSUJWpfd4wOV6vDhStpWNpCgVjnVHDj9TCm
         DmrY+JiQH0dqpKDjo3P5NJdX9U/AEH1S5y8+FY775zw4YKEOfaKiKPky8wqFaA+Dvjlq
         F1vn/wPY3jMqul9LwwGlyEZ8JSYezJxPc67oMLuZyLMm+2xg7e5ldrPFRZ66nfTf3kik
         pbvg==
X-Gm-Message-State: AO0yUKUZiDmDu8RLksmBCh7enRd6wj1aMxufLXtPZ80FOeRWHTcH1oP9
        c+xzvbvm0huegOZsVVXJYBNskg==
X-Google-Smtp-Source: AK7set9DX2k6HQ89nim3kkE+cfA616Ab/IB497UNILR3ETsNFyXK6hLtrXWaLZGzH0PNLB6MmgDXeg==
X-Received: by 2002:a05:600c:3542:b0:3df:ee00:d230 with SMTP id i2-20020a05600c354200b003dfee00d230mr125428wmq.11.1675420566970;
        Fri, 03 Feb 2023 02:36:06 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c355500b003dc4b4dea31sm2460668wmq.27.2023.02.03.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 02:36:06 -0800 (PST)
Date:   Fri, 3 Feb 2023 12:36:05 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 12/12] arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and
 controllers nodes
Message-ID: <Y9zjlSl8+Dqqc/5z@linaro.org>
References: <20230203081807.2248625-1-abel.vesa@linaro.org>
 <20230203081807.2248625-13-abel.vesa@linaro.org>
 <Y9zaT0SA5yahuBoW@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9zaT0SA5yahuBoW@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-02-03 10:56:31, Johan Hovold wrote:
> On Fri, Feb 03, 2023 at 10:18:07AM +0200, Abel Vesa wrote:
> > Enable PCIe controllers and PHYs nodes on SM8550 MTP board.
> > 
> > Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> > +&pcie_1_phy_aux_clk {
> > +	clock-frequency = <1000>;
> > +};
> > +
> > +&pcie0 {
> > +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_default_state>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&pcie0_phy {
> > +	vdda-phy-supply = <&vreg_l1e_0p88>;
> > +	vdda-pll-supply = <&vreg_l3e_1p2>;
> 
> Super nit: add newline for consistency.
> 
> > +	status = "okay";
> > +};
> > +
> > +&pcie1 {
> > +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> > +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> 
> Neither controller needs the new enable gpio?

Nope, none of the controllers need it.

> 
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie1_default_state>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&pcie1_phy {
> > +	vdda-phy-supply = <&vreg_l3c_0p91>;
> > +	vdda-pll-supply = <&vreg_l3e_1p2>;
> > +	vdda-qref-supply = <&vreg_l1e_0p88>;
> > +
> > +	status = "okay";
> > +};
> > +
> >  &pm8550_gpios {
> >  	sdc2_card_det_n: sdc2-card-det-state {
> >  		pins = "gpio12";
> 
> Johan
