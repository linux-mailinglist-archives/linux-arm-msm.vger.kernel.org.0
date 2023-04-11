Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6424D6DE677
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 23:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjDKVdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 17:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjDKVdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 17:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB3330F5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 14:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681248778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+t+CxMKTyH/KF2IDw9V8sVAPX3jzq2X9B3VftBWKIM8=;
        b=ci+HL+FCsQtt9Ka7u4mygfLU7vPVDQoO0IeVzLDjkMtw4E0R781kyudNQDJOXnzMJcE5FP
        F75gLJmZ6+3F6eJgw0Ua0RnriBo1OPIfpOE7L977RSXq4Mz7ZWPBflin9m/FIAZprMD+Gb
        hzL8QyUJaIf5ZhRdOFauawH+f6F8D38=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-uJ4o25u7P8ajBY5aPrCN7g-1; Tue, 11 Apr 2023 17:32:56 -0400
X-MC-Unique: uJ4o25u7P8ajBY5aPrCN7g-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-17fd0d597dcso20516526fac.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 14:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681248776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t+CxMKTyH/KF2IDw9V8sVAPX3jzq2X9B3VftBWKIM8=;
        b=K3hMONs6GMhiPAvkkNA0WjhTCucZCwDMsooYaRbeuvzwXNZeskK13F3wFIm10wWmFI
         0XBixQxQcVNZJoivcIx3o5ZGDgTfroHuA/sPa78K37lIO4SUIcfIbZsq49mc0GWRBo37
         T8iysDFy0rYN91vXrLU5HclRacadtYggVfzJTDuBiLgoqq9ozTgQn7IjdmQFT7+wU3Su
         gEDjQzPunAwg2IqqYPnRo9Mv7he34i7MpLBBzeX0wQSfbKF/DZlse9vFNeV4UOArebiT
         0qRngwW/MB9tyL4UFXgDpGLx3tt8S0rspbySbAAozKxLWM/ow/yO7Al2IjT64Cu2NHrK
         vpAw==
X-Gm-Message-State: AAQBX9eHrheD9M9i3elLTMuqoATkemcF0xjFzWpN7RPtmN7b71eUt7Mg
        OzoUXu5lQFXbWaWroUGlEmCbf0iZyjlVDzcGi8rzEGDpqN989TkLhP44QTtArz+v+8FFNJ4w34m
        ZWq1jx4p5RCFGyjDdPMatzROdQA==
X-Received: by 2002:a05:6870:968a:b0:17e:e1ac:2f09 with SMTP id o10-20020a056870968a00b0017ee1ac2f09mr7337635oaq.47.1681248775876;
        Tue, 11 Apr 2023 14:32:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YKCSvz7scMdahh0PoFCkZ798gWjD4Hs7SmFZvehvpUk2bQfOgV9GhWwVgZIxZfad9VMP7s/g==
X-Received: by 2002:a05:6870:968a:b0:17e:e1ac:2f09 with SMTP id o10-20020a056870968a00b0017ee1ac2f09mr7337629oaq.47.1681248775663;
        Tue, 11 Apr 2023 14:32:55 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id tl19-20020a0568718a1300b0017f84f81f3csm5506089oab.52.2023.04.11.14.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 14:32:55 -0700 (PDT)
Date:   Tue, 11 Apr 2023 16:32:52 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8155p-adp: Make compatible the first
 property
Message-ID: <20230411213252.xdgt57msr5lwnbrf@halaney-x13s>
References: <20230411203144.471192-1-ahalaney@redhat.com>
 <88d41729-86be-95cb-2fda-1b809f07ed6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88d41729-86be-95cb-2fda-1b809f07ed6b@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 11, 2023 at 10:44:36PM +0200, Konrad Dybcio wrote:
> 
> 
> On 11.04.2023 22:31, Andrew Halaney wrote:
> > As stated at the below link in another review, compatible is always the
> > first property.
> > 
> > Follow suit here to avoid copying incorrectly in the future.
> > 
> > Link: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#ma76b4116bbb9e49ee4bcf699e40935d80965b3f3
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> Thanks for this patch!
> >  arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> > index 459384ec8f23..8c773b856eb1 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> > @@ -351,19 +351,18 @@ &ethernet {
> >  	max-speed = <1000>;
> >  
> >  	mdio {
> > +		compatible = "snps,dwmac-mdio";
> >  		#address-cells = <0x1>;
> >  		#size-cells = <0x0>;
> Since you're already touching this file, can you make the
> -cells values decimal..
> >  
> > -		compatible = "snps,dwmac-mdio";
> > -
> >  		/* Micrel KSZ9031RNZ PHY */
> >  		rgmii_phy: phy@7 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> >  			reg = <0x7>;
> >  
> >  			interrupt-parent = <&tlmm>;
> ..remove the useless interrupt-parent..
> 
> >  			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>; /* phy intr */
> ...and the similarly not very useful comment here?
> 
> Konrad
> 

Gladly, I'll wait a few days in case someone points something else out
before sending a v2 patch series tackling each of those little bits.

Thanks,
Andrew

> >  			device_type = "ethernet-phy";
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> >  		};
> >  	};
> >  };
> 

