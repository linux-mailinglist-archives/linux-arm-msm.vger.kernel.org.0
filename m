Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87EFC655042
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 13:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbiLWMXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 07:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiLWMXG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 07:23:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A864F5AC
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 04:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671798138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S1HwigiBXzR+33Qj15n947bgxDdgr8XCfr3PoMuFRgU=;
        b=OSdVMNiFfAu4Ks+kEfh+gO0JBN9dT9+ALAMOg+e21VJxIXHJfcP35uEyA+8sQ996MQnXsL
        jLCCSfoOveMbnzneTKA65gxeSVJcFBMM5rpcn2vtKv11ygqH3K64zOitDp4oiH9jugPchV
        yPnWg8qmsS1Y+0ebMSuRppDJkIN7PxI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-IGM4kN1cNC6vOFesYkY6Vg-1; Fri, 23 Dec 2022 07:22:17 -0500
X-MC-Unique: IGM4kN1cNC6vOFesYkY6Vg-1
Received: by mail-qk1-f199.google.com with SMTP id ay34-20020a05620a17a200b00704bd9922c4so2912272qkb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 04:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1HwigiBXzR+33Qj15n947bgxDdgr8XCfr3PoMuFRgU=;
        b=ZyXnEsjo3EZY5Kc8x9OxDimvrTeScX0p9CP5xVnM+HqhkvRVJl5hlEgM5Mk4RRhVo8
         KnWBuOpF6PsnIZPgcOAtfsHCvctd8Ey8p/P9TGirU4I/GsXimEkOeOdqG1n2AqKBVrI6
         Teh2k7gtCmN/6ladN0/MtokddOYAmQeNrZWtN2tpiut6IVseLuba0Wx0pTD/A2LhMpLn
         cBqh9Qi3pri0AJ1razbixTBHrWOvuvO/lkav1bvh41fCMKJMP/VTbI1vTB7tW+NWb7uX
         OMztrfLgpLW0Y1/uOqHnFJrZCt2872zECyedy7PG8GrhQ3ZcBt7nkuRdyU5r3zhlSH8M
         W01w==
X-Gm-Message-State: AFqh2kr73XbqFHcqA1ZhsJGOD6tkcYZj4vzxa/rNTxGwEj9EujNkrONN
        YtT8PDmkBAJlM1vPwYMZTMppV/ClmFnxqAQpdXEEz/97j9eVsRcqIZxVgFIZD9appw7dTR10j5X
        +m8NsDzgsXLn6NQji4LMDM9lSsw==
X-Received: by 2002:a05:622a:1a08:b0:3ab:6e0c:166b with SMTP id f8-20020a05622a1a0800b003ab6e0c166bmr4586392qtb.47.1671798137058;
        Fri, 23 Dec 2022 04:22:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtuy/cAgKKIkhssIauVBEFzgx+91czS0/pNhPTxFAecy61AF1+PjIa+q0FQV4Y++aFHwlCWHg==
X-Received: by 2002:a05:622a:1a08:b0:3ab:6e0c:166b with SMTP id f8-20020a05622a1a0800b003ab6e0c166bmr4586371qtb.47.1671798136823;
        Fri, 23 Dec 2022 04:22:16 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id q27-20020a37f71b000000b006cec8001bf4sm2119584qkj.26.2022.12.23.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 04:22:15 -0800 (PST)
Date:   Fri, 23 Dec 2022 07:22:14 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        quic_shazhuss@quicinc.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc8280xp: add missing i2c nodes
Message-ID: <Y6WddnmaREQlt9gq@x1>
References: <20221220192854.521647-1-bmasney@redhat.com>
 <20221220192854.521647-5-bmasney@redhat.com>
 <Y6WEzkcP31S2JGrL@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6WEzkcP31S2JGrL@hovoldconsulting.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 23, 2022 at 11:37:02AM +0100, Johan Hovold wrote:
> On Tue, Dec 20, 2022 at 02:28:51PM -0500, Brian Masney wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index f1111cd7f679..a502d4e19d98 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -813,6 +813,38 @@ qup2: geniqup@8c0000 {
> >  
> >  			status = "disabled";
> >  
> > +			i2c16: i2c@880000 {
> > +				compatible = "qcom,geni-i2c";
> > +				reg = <0 0x00880000 0 0x4000>;
> > +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
> > +				clock-names = "se";
> > +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> 
> I'm aware that the two current i2c nodes has these two properties here
> in the middle, but would you mind moving '#address-cells' and
> '#size-cells' after 'reg' instead where I'd expect them to be?
> 
> Same for the spi patch.
> 
> I can clean up the existing two nodes (and binding example) unless you
> want to do it.

I'll clean up the existing nodes, qcom,i2c-geni-qcom.yaml, and
qcom,geni-se.yaml in my next version.

Brian

