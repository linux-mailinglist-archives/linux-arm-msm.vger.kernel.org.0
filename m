Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E6D6ED075
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Apr 2023 16:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjDXOn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Apr 2023 10:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbjDXOng (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Apr 2023 10:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27415FF1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682347367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xKVDH1fRnFTxaQHNAq/+pZJ5S9HufV5S7nytyAVR7K8=;
        b=WA3d70Gp9wcRqI6rhZONR6qqS32V07kxcO7y0nvZCXEKspU7mx8pAsP1x6dEdLhOWtXnLi
        wjk+qwL6PmXO8FDnx8j0nIYBNvN0TeCI86wVtMX1kOOauIEg8MhprbU7QFxHSBGB3WbZmb
        F5Qi5e8ChPCFQOF9WnptEjLwU3Q01wU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-DZ8Sd0mnM1m5aPjrczYcBw-1; Mon, 24 Apr 2023 10:42:45 -0400
X-MC-Unique: DZ8Sd0mnM1m5aPjrczYcBw-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6a601684a90so3441010a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 07:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682347363; x=1684939363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKVDH1fRnFTxaQHNAq/+pZJ5S9HufV5S7nytyAVR7K8=;
        b=R8ud+5+19N4cpK/Q5CZEII1G7pBKEJMs6tVtRrnRrzilJ0zJqaS6GNw94ePx7x/AHr
         /+QYDT8c/yIOIgc4+sxv0HqQx6ND/dWnUhOvwY8aSZgIrPervbuDnpPLEhrPH2M/brPu
         NE6ny6SE4Ofjsg2ke9UMEfJqHxeGf5rcMt1+wsMHR1k45AAQ2CzcNKVnDjoWKZoRv0Uh
         XajG9ZKJQ7tdxHYNBc6udJnJQfMKyjx0TL7WHJlam7NiKOVpnJrw8cpw20Z36RpqBRhp
         S8KRZmnuRWO8w9l+Ix0j7NsqWZV53vyfluXd9XSXQZqdXUxntyXjEaiVMSa1N/2OyaxD
         o3Jg==
X-Gm-Message-State: AAQBX9eXgKGaYnGGcvhfPnvPyyQNBFm8SdnpqRz5vWyFTQVnOLCgJY2W
        UA9j+YaV85J24CIn+PmEex4E7aH4vVLb7Qunyhcxm2e+aHxYQ2uw6ZcTza78629MhKaMbCOawKF
        0F85r4WGAnQW2h2BpXk4dL8elew==
X-Received: by 2002:a05:6870:4591:b0:183:c9a0:ef36 with SMTP id y17-20020a056870459100b00183c9a0ef36mr9673790oao.40.1682347363283;
        Mon, 24 Apr 2023 07:42:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350YrhVgqfa1Uos07nqjj6F0iGhFGp2/4fsfP02k0X2y7sWPvqACZpOZtmnxiYHj7UMetzujVnA==
X-Received: by 2002:a05:6870:4591:b0:183:c9a0:ef36 with SMTP id y17-20020a056870459100b00183c9a0ef36mr9673780oao.40.1682347363027;
        Mon, 24 Apr 2023 07:42:43 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id h22-20020a9d61d6000000b006a6168665f6sm4770319otk.43.2023.04.24.07.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 07:42:42 -0700 (PDT)
Date:   Mon, 24 Apr 2023 09:42:40 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     krzysztof.kozlowski+dt@linaro.org
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        bmasney@redhat.com, echanude@redhat.com, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, sboyd@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sa8540p-ride: Add ethernet nodes
Message-ID: <20230424144240.h7mykl65fae6ygss@halaney-x13s>
References: <20230413191541.1073027-1-ahalaney@redhat.com>
 <20230413191541.1073027-4-ahalaney@redhat.com>
 <a295939f0058373d1caf956749820c0d.sboyd@kernel.org>
 <20230413210127.s5dkek6adp5ndern@halaney-x13s>
 <7b2b2eefb4b7b6ef8ac2a3176286a97b.sboyd@kernel.org>
 <20230414145844.wyg6pt623pzqwh5l@halaney-x13s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414145844.wyg6pt623pzqwh5l@halaney-x13s>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Krzysztof,

Some advice below would be appreciated. I discussed offline with Bjorn
between the two approaches below but it sounded like ultimately we'd
defer to your preference here!

On Fri, Apr 14, 2023 at 09:58:44AM -0500, Andrew Halaney wrote:
> On Thu, Apr 13, 2023 at 03:05:26PM -0700, Stephen Boyd wrote:
> > Quoting Andrew Halaney (2023-04-13 14:01:27)
> > > On Thu, Apr 13, 2023 at 01:47:19PM -0700, Stephen Boyd wrote:
> > > > Quoting Andrew Halaney (2023-04-13 12:15:41)
> > > > >  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 179 ++++++++++++++++++++++
> > > > >  1 file changed, 179 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > > > index 40db5aa0803c..650cd54f418e 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > > > @@ -28,6 +28,65 @@ aliases {
> > > > >         chosen {
> > > > >                 stdout-path = "serial0:115200n8";
> > > > >         };
> > > > > +
> > > > > +       mtl_rx_setup: rx-queues-config {
> > > > 
> > > > Is there a reason why this isn't a child of an ethernet node?
> > > > 
> > > > 
> > > 
> > > I debated if it was more appropriate to:
> > > 
> > >     1. make a duplicate in each ethernet node (ethernet0/1)
> > >     2. Put it in one and reference from both
> > >     3. have it floating around independent like this, similar to what is
> > >        done in sa8155p-adp.dts[0]
> > > 
> > > I chose 3 as it seemed cleanest, but if there's a good argument for a
> > > different approach I'm all ears!
> > 
> > I wonder if it allows the binding checker to catch bad properties by
> > having it under the ethernet node? That's the only thing I can think of
> > that may be improved, but I'll let binding reviewers comment here.
> > 
> 
> Thanks, I was curious so I played around to answer the question via
> testing, and you're right... rx-queues-config/tx-queues-config aren't
> evaluated unless they sit under the node with the compatible (i.e. it
> doesn't just follow the phandle and evaluate). That makes sense to me I
> suppose.
> 
> So, I guess, would maintainers prefer to see option (1) or (2) above? I
> want that thing evaluated.
> 
> Option 1., above, has duplicated configuration, but is probably a more accurate
> representation of the hardware description.
> 
> Option 2., above, doesn't duplicate rx-queues-config/tx-queues-config,
> but is a weirder representation of hardware description, and only
> complains once (which is fine since it's shared) when the binding checker
> runs (i.e. only the etherent parent containing rx-queues-config yells).
> 

For what it is worth, I prefer option 1 above :)

> In the below example you can see what I mean by the "only complains
> once" comment as well as illustration that the patchset as is doesn't
> allow rx-queues-config/tx-queues-config to be validated by dt-binding
> checks:
> 
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % # Purposely introduce a dt-binding error on top of the current patchset                                                                                          :(
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % git diff                                                                                                                                                         :(
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 650cd54f418e..ecb0000db4e2 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -54,7 +54,7 @@ queue2 {
>  
>                 queue3 {
>                         snps,avb-algorithm;
> -                       snps,map-to-dma-channel = <0x3>;
> +                       snps,map-to-dma-channel = "not-correct";
>                         snps,priority = <0xc>;
>                 };
>         };
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % make CHECK_DTBS=y DT_SCHEMA_FILES=/net/qcom,ethqos.yaml qcom/sa8540p-ride.dtb
>   DTC_CHK arch/arm64/boot/dts/qcom/sa8540p-ride.dtb
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % # That should have failed
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % # Move the whole node under ethernet0, have ethernet1 reference via phandle only still
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % git diff | cat
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 650cd54f418e..451246936731 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -29,35 +29,6 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> -	mtl_rx_setup: rx-queues-config {
> -		snps,rx-queues-to-use = <1>;
> -		snps,rx-sched-sp;
> -
> -		queue0 {
> -			snps,dcb-algorithm;
> -			snps,map-to-dma-channel = <0x0>;
> -			snps,route-up;
> -			snps,priority = <0x1>;
> -		};
> -
> -		queue1 {
> -			snps,dcb-algorithm;
> -			snps,map-to-dma-channel = <0x1>;
> -			snps,route-ptp;
> -		};
> -
> -		queue2 {
> -			snps,avb-algorithm;
> -			snps,map-to-dma-channel = <0x2>;
> -			snps,route-avcp;
> -		};
> -
> -		queue3 {
> -			snps,avb-algorithm;
> -			snps,map-to-dma-channel = <0x3>;
> -			snps,priority = <0xc>;
> -		};
> -	};
>  
>  	mtl_tx_setup: tx-queues-config {
>  		snps,tx-queues-to-use = <1>;
> @@ -223,6 +194,36 @@ &ethernet0 {
>  
>  	status = "okay";
>  
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <1>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = "not-correct";
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
>  	mdio {
>  		compatible = "snps,dwmac-mdio";
>  		#address-cells = <1>;
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % make CHECK_DTBS=y DT_SCHEMA_FILES=/net/qcom,ethqos.yaml qcom/sa8540p-ride.dtb
>   DTC_CHK arch/arm64/boot/dts/qcom/sa8540p-ride.dtb
> /home/ahalaney/git/redhat/stmmac/arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: rx-queues-config:queue3:snps,map-to-dma-channel:0: [1852797997, 1668248178, 1701016576] is too long
> 	From schema: /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> /home/ahalaney/git/redhat/stmmac/arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: Unevaluated properties are not allowed ('max-speed', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth' were unexpected)
> 	From schema: /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] % # That warned as expected, since snps,dwmac.yaml failed on rx-queues-config it warns, \
> 									and since part of the schema failed its not inherited (hence the Unevaluated properties warning following) \
> 									also note how only ethernet0 (@20000) is evaluating rx-queues-config since that's where the rx-queues-config node lives
> (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac] %
> 
> Thanks for the review!
>  - Andrew

