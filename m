Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B316CD183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 07:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjC2F0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 01:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjC2F0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 01:26:09 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CBB30CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 22:26:06 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id d10so8579527pgt.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 22:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680067566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQIXqBu8Ww1KbLzbdxyi7eKblMVEL5V0lkPPVDOGsus=;
        b=zC6OuQGl8ITaMlmisTb73e1nyeSHXNqCU6pMeR4mD4PNlLAhxqKU3oIvKuUioBZIGE
         mM9fIW0jsQq+WlnGW8cE4LZbMU1wAAawDcBU0TUKBNO1qBPRsJjzdt1zExgMVeQwIs2l
         z0gPsuF8iawtG2k0lNQXJJPBbpqVLoyWns0Vb/OJ6biAVyZZqh3MINDKRRjW4vGHxC5i
         lq7JC2eZPPoFXajT9Wu0Wxxxqu69zk5FGtYOpp8+XyyzMs8zWbTIW56FFahuMTX+uKpu
         ZzjvbXZsaznUeAxazyCYuezUCb8cSWeo1crqyq894VdFu1+62ZAz8xyN773KX7FePJ+4
         4yMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680067566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQIXqBu8Ww1KbLzbdxyi7eKblMVEL5V0lkPPVDOGsus=;
        b=tmtQAPBFD2cGlkN1Gg08JDwM4Pvte4Y3mXmnAFMzl7VHdIoZ48SLm8fe7CTeEvJwcK
         WHjIK+bPYX+bkOlD40dTXYz4pbtLineMgsUZdC6zxodZMVbliWEzZB+Ljq4azl2AcYk4
         MvOvsicFFQRJTs3BJ1CmVE9tzlvq6BIF8NuTZsHZattaqV3qDWsNVlTYWKlOrgqsDUJw
         MPMjTFF+wXoOtocUlVZtmJBjx0xQrJxakb/vqUM4wOpV5GBr2D8NivNe1b3aS3oXeEcy
         YckahSFspkrjz+1CFQBvM/Iet5Qr/yX6A3/6sxLOsSZijj5excit4ru7ZMzmphmobQiC
         tFFQ==
X-Gm-Message-State: AAQBX9fdL9wzScIVjNhirX2yV5eWt9hB6fsfYa+8VgmWammfgx7MkwDJ
        X1GkQ3Y5c1wD5HH+mZReEp1A
X-Google-Smtp-Source: AKy350aGXfZ5LQ5WZlCLH4Xf/5IlT9NCsh8UH8ET+/ub4ddsq/suqjDPww+ZkZ3gzRT1bxojKMvTXQ==
X-Received: by 2002:aa7:93c4:0:b0:626:6a3:6b81 with SMTP id y4-20020aa793c4000000b0062606a36b81mr16936230pff.15.1680067566189;
        Tue, 28 Mar 2023 22:26:06 -0700 (PDT)
Received: from thinkpad ([117.202.191.80])
        by smtp.gmail.com with ESMTPSA id j19-20020aa783d3000000b0062d2a66397esm6595484pfn.136.2023.03.28.22.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 22:26:05 -0700 (PDT)
Date:   Wed, 29 Mar 2023 10:56:00 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sc8280xp: Add missing dwc3 quirks
Message-ID: <20230329052600.GA5575@thinkpad>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
 <20230325165217.31069-2-manivannan.sadhasivam@linaro.org>
 <ZCKrXZn7Eu/jvdpG@hovoldconsulting.com>
 <20230328093853.GA5695@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328093853.GA5695@thinkpad>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 28, 2023 at 03:09:03PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Mar 28, 2023 at 10:54:53AM +0200, Johan Hovold wrote:
> > On Sat, Mar 25, 2023 at 10:22:13PM +0530, Manivannan Sadhasivam wrote:
> > > Add missing quirks for the USB DWC3 IP.
> > 
> > This is not an acceptable commit message generally and certainly not for
> > something that you have tagged for stable.
> > 
> > At a minimum, you need to describe why these are needed and what the
> > impact is.
> > 
> 
> I can certainly improve the commit message. But usually the quirks are copied
> from the downstream devicetree where qualcomm engineers would've added them
> based on the platform requirements.
> 
> > Also, why are you sending as part of a series purporting to enable
> > runtime PM when it appears to be all about optimising specific gadget
> > applications?
> > 
> 
> It's not related to this series I agree but just wanted to group it with a
> series touching usb so that it won't get lost.
> 
> I could respin it separately though in v2.
> 
> > Did you confirm that the below makes any sense or has this just been
> > copied verbatim from the vendor devicetree (it looks like that)?
> > 
> 
> As you've mentioned, most of the quirks are for gadget mode which is not
> supported by the upstream supported boards. So I haven't really tested them but
> for I assumed that Qcom engineers did.
> 
> > The fact that almost none of the qcom SoCs sets these also indicates
> > that something is not right here.
> > 
> > > Cc: stable@vger.kernel.org # 5.20
> > > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > index 0d02599d8867..266a94c712aa 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > @@ -3040,6 +3040,13 @@ usb_0_dwc3: usb@a600000 {
> > >  				iommus = <&apps_smmu 0x820 0x0>;
> > >  				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
> > >  				phy-names = "usb2-phy", "usb3-phy";
> > > +				snps,hird-threshold = /bits/ 8 <0x0>;
> > > +				snps,usb2-gadget-lpm-disable;
> > 
> > Here you are disabling LPM for gadget mode, which makes most of the
> > other properties entirely pointless.
> > 

Checked with Qcom on these quirks. So this one is just disabling lpm for USB2
and rest of the quirks below are for SS/SSP modes.

> > > +				snps,is-utmi-l1-suspend;
> > > +				snps,dis-u1-entry-quirk;
> > > +				snps,dis-u2-entry-quirk;
> > 
> > These appear to be used to optimise certain gadget application and
> > likely not something that should be set in a dtsi.
> > 
> 
> I will cross check these with Qcom and respin accordingly.
> 

These quirks are needed as per the DWC IP integration with this SoC it seems.
But I got the point that these don't add any values for host only
configurations. At the same time, these quirks still hold true for the SoC even
if not exercised.

So I think we should keep these in the dtsi itself.

- Mani

> - Mani
> 
> > > +				snps,has-lpm-erratum;
> > > +				tx-fifo-resize;
> > 
> > Same here.
> > 
> > >  				port {
> > >  					usb_0_role_switch: endpoint {
> > 
> > Johan
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
