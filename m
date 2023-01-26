Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1AC67D9E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 00:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbjAZXpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 18:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbjAZXp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 18:45:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDF444BDD
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674776640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=D6x+r4xBxzWNTUBQ9wWxJcF9cSfkhbk7GYZAcyVsQuE=;
        b=XNsjjnCTjjAEm3ZVYto6w3FrLulcqLmhxbKArwX9Z67p3zX4+aEXu6EkNXzcOtRQVaLZym
        D0DIP4uzDuaYQ41aJsU53ukOWQtq0O+dRzG5Kc1KsNIEwpNv7xhIWlE20lYBewbperwZCw
        d0pfWq0+ZF7mdnEkpSjWnp2gL5YL9wM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-674-qQmkV4ZROmSeM10pTToEWA-1; Thu, 26 Jan 2023 18:43:59 -0500
X-MC-Unique: qQmkV4ZROmSeM10pTToEWA-1
Received: by mail-qv1-f71.google.com with SMTP id i17-20020a0cfcd1000000b005377f5ce3baso1729680qvq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6x+r4xBxzWNTUBQ9wWxJcF9cSfkhbk7GYZAcyVsQuE=;
        b=LTKqQEVfEUNN7Kgognmqkg23VdpkMsm7Mb+xP+p9XYYdymLMajZGo8uoPjbuNWn9+b
         N5b7B6qBckFuVDk0IG/9cJhDlJPoLHsxvL0NEsYhnBsXD0S9qFL6phJAk0P7P+08JAEl
         MzLIpmZSkMSGb7H1miUnrN+/0WdRjDYlSeOfcVWC98ndM81xcvMOFfrAU9HSO23tjsBC
         X7Fv+NF57ZRHe4ehWCVF+w2MWGf+1qXm+/p34ZlqVLBOI3z0hlfauYHc4mc0blvLlQHX
         cgMQz324WWGc1Xn5++UuYP3u0r7/NTR5gmdmOXTkjo7RL3CW6DuGdJX38QLsP7WKF/5k
         8HxQ==
X-Gm-Message-State: AFqh2kpXAIhNHLmYkrGArEt89S00ajg5h2QVtfEEbEds9A0oRMYpNn5m
        /jV+wCcO30RmXuLFOJEMCrcVmd3fT5fFtbQo/iNVqvbuYmZW0hApSeXZhgaIktCvcnWeCt9JFby
        n1GkL4rRYsNFBld3BP+IOBrDpuQ==
X-Received: by 2002:ac8:5b90:0:b0:3a8:30c9:ba8f with SMTP id a16-20020ac85b90000000b003a830c9ba8fmr75296073qta.28.1674776637543;
        Thu, 26 Jan 2023 15:43:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLlX6+9As1/MaxSpF4UPb/cDCzNiumeo2i7JN2dW6PE3AVlgjfl2TMXpyrpihN2fyrXG6xnQ==
X-Received: by 2002:ac8:5b90:0:b0:3a8:30c9:ba8f with SMTP id a16-20020ac85b90000000b003a830c9ba8fmr75296051qta.28.1674776637308;
        Thu, 26 Jan 2023 15:43:57 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o12-20020a05622a044c00b003a82ca4e81csm1622521qtx.80.2023.01.26.15.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:43:56 -0800 (PST)
Date:   Thu, 26 Jan 2023 17:43:54 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sa8295p-adp: Add max20411 on
 i2c12
Message-ID: <20230126234354.437bajx7lckafg4z@halaney-x13s>
References: <20230124184440.1421074-1-quic_bjorande@quicinc.com>
 <20230124184440.1421074-4-quic_bjorande@quicinc.com>
 <20230126225446.rjckq5p35zeozphq@halaney-x13s>
 <5a638130-89c3-871b-c233-55048a162870@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a638130-89c3-871b-c233-55048a162870@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 27, 2023 at 12:35:37AM +0100, Konrad Dybcio wrote:
> 
> 
> On 26.01.2023 23:54, Andrew Halaney wrote:
> > On Tue, Jan 24, 2023 at 10:44:40AM -0800, Bjorn Andersson wrote:
> >> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>
> >> The SA8295P ADP has a Maxim max20411 step-down converter on i2c12.
> >>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> >> ---
> >>
> >> Changes since v1:
> >> - i2c node had changed name
> >>
> >>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 41 ++++++++++++++++++++++++
> >>  1 file changed, 41 insertions(+)
> > 
> > I realized today this has to do with the comment over at:
> > 
> >     https://lore.kernel.org/all/30166208-ba9d-e6e6-1cd2-807a80536052@quicinc.com/
> > 
> > and I just didn't realize that the schematic I've started looking at
> > black boxes the SOM/SIP which holds this... darn I thought I could see
> > more than I could :(
> > 
> > I took a similiar patch for a spin on sa8540p-ride (which I'll later
> > submit), and things worked fine (I'm not really consuming the output of
> > the regulator mind you).
> > 
> > Downstream devicetree indicates all of this looks ok except for possibly
> > the below comment:
> > 
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> >> index bb4270e8f551..642000d95812 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> >> @@ -266,6 +266,27 @@ &dispcc1 {
> >>  	status = "okay";
> >>  };
> >>  
> >> +&i2c12 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&i2c12_state>;
> >> +
> >> +	status = "okay";
> >> +
> >> +	vdd_gfx: regulator@39 {
> >> +		compatible = "maxim,max20411";
> >> +		reg = <0x39>;
> >> +
> >> +		regulator-name = "vdd_gfx";
> >> +		regulator-min-microvolt = <800000>;
> > 
> > Is there a reason you chose this instead of the 500000 I see downstream?
> > 
> >> +		regulator-max-microvolt = <968750>;
> > 
> > Likewise, I see in this brief description of the regulator
> > that the upper bound is higher than this (1.275 V). I am not sure if
> > the values in the devicetree are supposed to describe the
> > min/max of the regulator itself, or of what your board can really
> > handle/needs (the latter I guess makes more sense since you wouldn't want to
> > accidentally request a current draw that could melt something.. that can
> > be fun). I do see you've got that min/max in the driver itself (now that
> > I peaked at that patch).
> Yes, your suspicions are correct and the DT sets the actual ranges
> for the voltage regulators on this specific board while the
> hardware reachable ranges are defined in the .c driver.
> 
> Konrad

Thanks Konrad, then I think:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com>

is appropriate since things are within range on all accounts. I would
appreciate an explanation on the current min/max values though if possible!

