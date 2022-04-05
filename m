Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 371294F4BF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1575412AbiDEXHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1572992AbiDERmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 13:42:35 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051C8B91AE
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 10:40:37 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso3299748pju.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bmdZR+jb7U9hOHhffMWtGTEUc07VUkF9UAiv6MrZTR0=;
        b=hdLDj6MHZR788Hh/YADN8CarIVT+/LULSlHEAQnhRsZu6ECl3DWAe/7VBEB0NUP4Q9
         I2tUx1NM8N1DxpVJcW5YNOP4BdlQhL+YqGEPqwY25dTW1XdZTgrpeidt0xR/lmeSAK/8
         mXq0nMfY1SI7jt8tDexuSasvLLmqr0zZeV9Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bmdZR+jb7U9hOHhffMWtGTEUc07VUkF9UAiv6MrZTR0=;
        b=Dgwd1NolI/vWm6vc7x5brlqmc/BikluFM4gqRj3kVMtu579+y1qXFRES1sU947l/bx
         Ji7J/vfE1rCiHjS81oJtZnQwP9p5WjDijPW5+Ov+VGnCNQ8B5BYP9QOw34fTbhaHrvgQ
         BzkOA0vKZq41FTQtxe7aVrzxTbdNZ+vSYKFiK0TsLNOYzIa2/nxRBVZy4F9e+7kaNvoV
         MwSedU/fv28o1sEQ7TXVa8cPpcI2H2zSo2TT3bid8LZdZ0Idwjlbtck6aKkPeQ1iMETJ
         HWIf+fqQQqnpTiUH/Uh20pYiWKcI4cH1bz/7aNm1UPtSwoGzT9BJXH1nSYWoXtEDOf4J
         SzUw==
X-Gm-Message-State: AOAM532iHgbHmiYWaeYnfj8Phbm4hV5o9m4KFM/NMPCncWXmF1Dlu9A+
        c+0dFXtxiFcPr+OKTrqEDDjdPhitEuXe/g==
X-Google-Smtp-Source: ABdhPJzecQhLVvt+Di0OuJSMrftbsU81/OCL9+jLim1kqYCG7+LORAfpHejgugGm1IcGOu2t4577JQ==
X-Received: by 2002:a17:902:c2d8:b0:154:2946:4ff with SMTP id c24-20020a170902c2d800b00154294604ffmr4598001pla.99.1649180436498;
        Tue, 05 Apr 2022 10:40:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6b63:d403:e31b:da39])
        by smtp.gmail.com with UTF8SMTPSA id f19-20020a056a00229300b004fb157f136asm16947948pfe.153.2022.04.05.10.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 10:40:35 -0700 (PDT)
Date:   Tue, 5 Apr 2022 10:40:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add WCN6750 WiFi node
Message-ID: <Ykx/EgOmNP/8M6b2@google.com>
References: <20220328071057.2454-1-quic_mpubbise@quicinc.com>
 <YktHHOww7VkbIxfE@google.com>
 <abd0c3eb-38d3-6673-9e1a-6bf04755e5f2@quicinc.com>
 <12f69c15-8cff-6e15-45a6-06fc3bc9112b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12f69c15-8cff-6e15-45a6-06fc3bc9112b@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 05, 2022 at 12:00:11PM +0530, Manikanta Pubbisetty wrote:
> On 4/5/2022 11:56 AM, Manikanta Pubbisetty wrote:
> > 
> > 
> > On 4/5/2022 12:59 AM, Matthias Kaehlcke wrote:
> > > On Mon, Mar 28, 2022 at 12:40:57PM +0530, Manikanta Pubbisetty wrote:
> > > > Add DTS node for WCN6750 WiFi chipset.
> > > > 
> > > > Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> > > > ---
> > > > Depends on:
> > > > - https://patchwork.kernel.org/project/linux-arm-msm/patch/20220328070701.28551-1-quic_mpubbise@quicinc.com/
> > > > 
> > > > - https://patchwork.kernel.org/project/linux-wireless/patch/20220328060937.16738-2-quic_mpubbise@quicinc.com/
> > > > 
> > > > 
> > > > Changes from V2:
> > > > - Changes based on DT binding concerns
> > > > - Rebased on ToT
> > > > 
> > > > Changes from V1:
> > > > - Corrected the case for hex values
> > > > 
> > > >   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  7 ++++
> > > >   arch/arm64/boot/dts/qcom/sc7280.dtsi     | 46 ++++++++++++++++++++++++
> > > >   2 files changed, 53 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > index 069ffbc37bc4..a82e9aa7bdc5 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > @@ -551,3 +551,10 @@ &remoteproc_wpss {
> > > >       status = "okay";
> > > >   };
> > > > +&wifi {
> > > > +    status = "okay";
> > > > +    wifi-firmware {
> > > > +        iommus = <&apps_smmu 0x1c02 0x1>;
> > > > +    };
> > > > +};
> > > > +
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > index b757e8ad1199..dfd9fa077903 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > @@ -85,6 +85,11 @@ reserved-memory {
> > > >           #size-cells = <2>;
> > > >           ranges;
> > > > +        wlan_ce_mem: memory@4cd000 {
> > > > +            no-map;
> > > > +            reg = <0x0 0x4cd000 0x0 0x1000>;
> > > 
> > > Pad the address to 8 digits here (not in the node name).
> > 
> > Sure
> > 
> > > 
> > > > +        };
> > > > +
> > > >           hyp_mem: memory@80000000 {
> > > >               reg = <0x0 0x80000000 0x0 0x600000>;
> > > >               no-map;
> > > > @@ -1808,6 +1813,47 @@ mmss_noc: interconnect@1740000 {
> > > >               qcom,bcm-voters = <&apps_bcm_voter>;
> > > >           };
> > > > +        wifi: wifi@17a10040 {
> > > > +            compatible = "qcom,wcn6750-wifi";
> > > > +            reg = <0 0x17a10040 0 0x0>;
> > > > +            iommus = <&apps_smmu 0x1c00 0x1>;
> > > > +            interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
> > > > +                     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
> > > > +            qcom,rproc = <&remoteproc_wpss>;
> > > > +            memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
> > > 
> > > Where is 'wlan_fw_mem' added?
> > 
> > Sorry, did not understand your concern here.
> > 
> 
> Well, I got your point. wlan_fw_mem is already present in SC7280.dtsi.

Sorry, I thought I had grepped for it and didn't find it, but now I see
it's there.
