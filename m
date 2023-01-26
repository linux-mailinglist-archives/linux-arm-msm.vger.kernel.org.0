Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3101267D8E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 23:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbjAZWz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 17:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233076AbjAZWzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 17:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5508F568B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 14:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674773692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=p5Ykxjtl3TsXTsPdCfEmgAHl6ut65lEBsB3rbec3S1g=;
        b=Eb6ok/WQi0UMu/mIdXk944q/xUH9jrt3rkQGdwMjqFi2olSvBnILAH4GVEUqcXFx3457DK
        xqFg7KZZNP+sRQTCKVmuaH6D2zWLY9f7eK2ICawZ1yGpfzMJuuORS8EgvSdyw+U+AtP7L0
        X5krHlU5aYhQAI04KpSTiHdE3k/vapQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-f3IbAXcIP-ie3hJ3jNz8HQ-1; Thu, 26 Jan 2023 17:54:51 -0500
X-MC-Unique: f3IbAXcIP-ie3hJ3jNz8HQ-1
Received: by mail-oi1-f197.google.com with SMTP id bg13-20020a056808178d00b00364af0a66f9so1264899oib.14
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 14:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5Ykxjtl3TsXTsPdCfEmgAHl6ut65lEBsB3rbec3S1g=;
        b=bqPNIGCZyAEtPL3AUlRfsaj1Nl6i1fBz08iIB4BKy3lAj+pCETkvkG+WNZntS95+DK
         jgGdbxzCvABFkJoeCUiaL6YAPLedET+iAD1zpr3TwMgDfTQjo1eyz8tiVS0VW9pp3d7Q
         WmNPVpI0InSYfjlS4ozCdG8DewtjYhpfnayQkxfj0q1r2T+oi3/lGngKv0imu8EqGoZs
         BTjNTVK6jgFQ1ebH8U5Qz600PtT0wbqSQ2sjmb0udeJsfGq4kutwVBA2CVVvCvPlGFVz
         ArFJIH7hgs+3fgRJvYM15sWuIWy6fxfCJBi7ignoDuxZBLLms0mDsA04koIbkMbBTfdS
         vAnQ==
X-Gm-Message-State: AFqh2kr+GElxbolR5q0S/xuJSk2Al/NGNESnM1rH0x2NB5KoE5I2A/nL
        60mXaijOSFsKL7aKZJDRPl8nrC7o9rYw1+rE1VEXYLxp7elAmSTdDq/IOgiojHg6ROGkNvtqmZq
        ddy4VQiOQ/YJ2CDjZl+i93H3PSA==
X-Received: by 2002:a05:6870:1609:b0:15e:ce8d:f65c with SMTP id b9-20020a056870160900b0015ece8df65cmr23449621oae.23.1674773689407;
        Thu, 26 Jan 2023 14:54:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdeliN+wRD0ouJycj0uRxI8ORwWz77jZBv4UziUIwkNFHcqUC+w2hRdyGCIUFpexruansoig==
X-Received: by 2002:a05:6870:1609:b0:15e:ce8d:f65c with SMTP id b9-20020a056870160900b0015ece8df65cmr23449601oae.23.1674773689119;
        Thu, 26 Jan 2023 14:54:49 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id u2-20020a056870304200b0015b64f8ff2bsm1043015oau.52.2023.01.26.14.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 14:54:48 -0800 (PST)
Date:   Thu, 26 Jan 2023 16:54:46 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sa8295p-adp: Add max20411 on
 i2c12
Message-ID: <20230126225446.rjckq5p35zeozphq@halaney-x13s>
References: <20230124184440.1421074-1-quic_bjorande@quicinc.com>
 <20230124184440.1421074-4-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124184440.1421074-4-quic_bjorande@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 24, 2023 at 10:44:40AM -0800, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The SA8295P ADP has a Maxim max20411 step-down converter on i2c12.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v1:
> - i2c node had changed name
> 
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 41 ++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

I realized today this has to do with the comment over at:

    https://lore.kernel.org/all/30166208-ba9d-e6e6-1cd2-807a80536052@quicinc.com/

and I just didn't realize that the schematic I've started looking at
black boxes the SOM/SIP which holds this... darn I thought I could see
more than I could :(

I took a similiar patch for a spin on sa8540p-ride (which I'll later
submit), and things worked fine (I'm not really consuming the output of
the regulator mind you).

Downstream devicetree indicates all of this looks ok except for possibly
the below comment:

> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index bb4270e8f551..642000d95812 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -266,6 +266,27 @@ &dispcc1 {
>  	status = "okay";
>  };
>  
> +&i2c12 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c12_state>;
> +
> +	status = "okay";
> +
> +	vdd_gfx: regulator@39 {
> +		compatible = "maxim,max20411";
> +		reg = <0x39>;
> +
> +		regulator-name = "vdd_gfx";
> +		regulator-min-microvolt = <800000>;

Is there a reason you chose this instead of the 500000 I see downstream?

> +		regulator-max-microvolt = <968750>;

Likewise, I see in this brief description of the regulator
that the upper bound is higher than this (1.275 V). I am not sure if
the values in the devicetree are supposed to describe the
min/max of the regulator itself, or of what your board can really
handle/needs (the latter I guess makes more sense since you wouldn't want to
accidentally request a current draw that could melt something.. that can
be fun). I do see you've got that min/max in the driver itself (now that
I peaked at that patch).

https://www.analog.com/en/products/MAX20411.html#product-overview

For what it is worth, I also see a SIP document that states vdd_gfx min/max
is 0.56/1.03 V, which is ultimately what you'd feed this into. The
downstream devicetree uses the max value you provide though.

No idea how much faith I should put into the SIP document's bounds, or
downstream, but I thought I should at least highlight them.

Thanks,
Andrew

