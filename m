Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA854FCC21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 04:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiDLCG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 22:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241449AbiDLCGZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 22:06:25 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41641115E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:04:08 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id c18-20020a056830001200b005e6ed2a21c9so3108704otp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zvoTA19lOSf+RxDApoV2g7DS34QXv7Uz6a91gdazgbA=;
        b=ixp9N3OdCGMLEWbM85IfczdFOK7x+zrcNuK3oJ4WhGQxYpvj4UfCQAnTEUrqBqlyE6
         ut2nO/TwJIq6HLJ4OKIwqEqhzJTUUpdWdkczYCxo21mHB2iCymaDiavkq0M8+flowO7L
         4noEM57ZTiBbtarzb9G0UaxFmSZOfJyEo+AnT9VekGmz6IPsTmVsydW9IJjo7ZgQS0EI
         JhK/lb0XUaSl1aLVhDtWOuOfLhVd0xmzLQckqEoK4gpdiyDQ/hzq5C5sbrdsdJ0r9g8D
         JeAzyB/cvIzpW+XQe50o/MI/TQ9qJFBHRvV5APtZal+jyzEckldKZDD+gXzTk+rygGp8
         QopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zvoTA19lOSf+RxDApoV2g7DS34QXv7Uz6a91gdazgbA=;
        b=ZKaiKpDMYNdqCnFZ6da2Sy+cyLvYYOic8jA+ypgm3EkN39n1IfqzTwWOOsP4btTM6w
         ckC+SERWNkSwjx7Qc0MdDOMxNKI+jyBMq6AOma1KgJImIx1y8UTN3jOK9JUulaqgSN1S
         reZwC7iBGbmJMUeEraD0W4LIctehWEWVRpZqLj+ysOX5qNxV5hqwcSP83ojVlLFnN8oU
         oWHlnHhJ4FKCSF03RkTyJ6CNzMmyUZN5xAd23k4McBAGqp9zMAVkXmIpNH0yoSdU1TeS
         eLuKMCQI1GnpQkaR5yXVE8qBK8U8te1o+pWoUE1bjIwe1ACWOzPko+po9RTomJcmVKKG
         rEhg==
X-Gm-Message-State: AOAM533SNAi/bomHiGQI5m0smVU5dNtNt5AEqLQ+ANTwbGgtAj5S5nLx
        UfrNKoJF9tZrTsRQEMC6XHUtiw==
X-Google-Smtp-Source: ABdhPJwi6fbVaWoKpsh9S0HWoxo7SRLOfsxglqmhbKSzasOJYyo3IRZ+780Yb9Se1kR1rsouyJuaeQ==
X-Received: by 2002:a9d:7486:0:b0:5e6:c299:4ab5 with SMTP id t6-20020a9d7486000000b005e6c2994ab5mr6521984otk.95.1649729047530;
        Mon, 11 Apr 2022 19:04:07 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u139-20020acaab91000000b002ecb2639985sm11937935oie.20.2022.04.11.19.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 19:04:06 -0700 (PDT)
Date:   Mon, 11 Apr 2022 21:04:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8250: camss: Add downstream
 camera pin definitions
Message-ID: <YlTeFYp6IoPJfHEb@builder.lan>
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
 <20220409164556.2832782-4-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409164556.2832782-4-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 09 Apr 11:45 CDT 2022, Bryan O'Donoghue wrote:

> There are a number of pin mux descriptions for the CAMSS block which are
> defined downstream.
> 
> Bring in the definitions now. Subsequent changes will optionally activate
> those muxes for different sm8250 based boards.
> 

I'm not able to spot where these are referenced, are they not used or am
I just failing the search today?

I would prefer that we don't sprinkle pinctrl states that potentially
might be used at a later time...

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 471 +++++++++++++++++++++++++++
>  1 file changed, 471 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 3d6c617de045..91ed079edbf7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3687,6 +3687,477 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges = <&tlmm 0 0 181>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam_sensor_mclk0_active: cam_sensor_mclk0_active {

Please don't use '_' in the node name.

> +				/* MCLK0 */

I would prefer that we don't inherit the mux/config split upstream.

You can either do:

cam-sensor-mclk0-active-state {
	pins = ;
	function = ;
	bias...
};

or:

cam-sensor-mclk0-active-state {
	mclk0 {
		pins = ;
		function = ;
		bias...
	};
};

And depending on how this state is actually used you could lump together
the configuration of several pins - with different properties - in the
same state node.

Regards,
Bjorn
