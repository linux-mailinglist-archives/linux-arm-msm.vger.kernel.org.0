Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3175B6C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 12:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbiIMK61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 06:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiIMK6G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 06:58:06 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0885F22F
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 03:57:54 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m3so10913564pjo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=oecofVMrcCfLyVCVWoV6+PgNwd31Jhh4K2JgKw6ALKM=;
        b=OU5BpUXJqwh+x0q2JoTTulUldi4JBs6zIF1xVeSxip7z3hA5lNh8JhLOKACWiot3MM
         NBR1IzVqsO4wAzVa3Pp6/RE1sRrrWqQFZnYm3fg/tJr2jdi2kxjreMsL1TX1wl9yxTRw
         rKF7Xvy96vhado2/ZPEOM1uItzyHiZx1OwvxKllFcDTkqD2/zCIm+ta/JkvVqkesf4Cc
         cav5Uro0qKwyjYRfTtyYlXT81COF6IHi4jGv1XKSqXCAmtYzKIh2D6Wa2uKQ3i4nVG8u
         FyYlUl2HT3ToQh2qFTH0JjkZWdpswOmSIFz9Gyw2p5mLoD6AsPclzh2eqok6Z4thjApY
         8QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oecofVMrcCfLyVCVWoV6+PgNwd31Jhh4K2JgKw6ALKM=;
        b=dSoAJ4Wi8LX1DDNfz13Dt339Prh9qSB+tEndWfGlFsBp9MqzRk8opPFPdvsz90VPAd
         LN5RAbUVj3eeh1K7EwplP7OqTF1PczLqc+CyY5SKTKLSvIL8BP5zh9wqL7KyF3PKkIPj
         54wY9K9Pe0Jsra3yUcLkmdLW9gs0azTF36z4SMi6Dw9ubJaRjOhmiy/+Ds+ETzpFFGPy
         CVhHAKbuXAPlZAmmr/EQHoaE0EdsLyO9hzwg0zFlQq6BmlcNKrdF1PPzvYEXECyA5OQh
         Bsmux8o9f/UTiHmkzrPi2Hpl0BdyaY7h1h4HzPqBrpp4eWRJMcdCPBiACJVpPdte0U1a
         764w==
X-Gm-Message-State: ACgBeo0TuGZsfCwtTjk1h2ODGQTssP6YgKcy5FECQuy4WW2U1XHMM/sy
        iydvzXCH+JSjn7b9uzg2vGIE
X-Google-Smtp-Source: AA6agR54HVbJgY27UAeqFdFj6GgyYH6g+KFP3wrsO5pAbNf0KTIemd7XibKY7hR/Tk//NhRD5prcxQ==
X-Received: by 2002:a17:90b:380d:b0:202:56b2:4ef8 with SMTP id mq13-20020a17090b380d00b0020256b24ef8mr3508672pjb.2.1663066662120;
        Tue, 13 Sep 2022 03:57:42 -0700 (PDT)
Received: from workstation ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id c21-20020aa79535000000b0052dfe83e19csm7720788pfp.16.2022.09.13.03.57.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 03:57:39 -0700 (PDT)
Date:   Tue, 13 Sep 2022 16:27:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        steev@kali.org
Subject: Re: [PATCH] arm64: dts: qcom: thinkpad-x13s: Update firmware location
Message-ID: <20220913105734.GD25849@workstation>
References: <20220913054030.3234-1-manivannan.sadhasivam@linaro.org>
 <YyBWZOMz3mKlje05@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyBWZOMz3mKlje05@hovoldconsulting.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 13, 2022 at 12:07:32PM +0200, Johan Hovold wrote:
> [ Resend with Bjorn's address updated as the Linaro one now bounces. ]
> 
> On Tue, Sep 13, 2022 at 11:10:30AM +0530, Manivannan Sadhasivam wrote:
> > The firmware location in linux-firmware has been changed to include the
> > SoC name. So use the updated location in Thinkpad devicetree.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> I guess we should pick a commit prefix that we stick to for changes to
> this driver.
> 
> 	arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s:
> 
> is arguably unnecessarily long even if it follows the pattern of some
> other qcom dts.
> 
> Shall we just use
> 
> 	arm64: dts: qcom: sc8280xp-x13s:

This looks looks better. I did look into the earlier commits but I found
the prefix to be too long, so went with the last commit prefix.

> 
> which matches sc8280xp-crd? Or stick "lenovo" in there as well? Or just
> keep the whole thing unchanged?
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index c379650e52b1..3b7943d6e164 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -554,13 +554,13 @@ keyboard@68 {
> >  };
> >  
> >  &remoteproc_adsp {
> > -	firmware-name = "qcom/LENOVO/21BX/qcadsp8280.mbn";
> > +	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
> >  
> >  	status = "okay";
> >  };
> >  
> >  &remoteproc_nsp0 {
> > -	firmware-name = "qcom/LENOVO/21BX/qccdsp8280.mbn";
> > +	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn";
> >  
> >  	status = "okay";
> >  };
> 
> Change itself looks good otherwise:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> 

Thanks! I will respin with the agreed prefix.

Regards,
Mani

> Johan
