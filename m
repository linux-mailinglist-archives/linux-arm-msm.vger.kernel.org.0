Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEC756296B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 05:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbiGADLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 23:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbiGADK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 23:10:59 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A90B64D7A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 20:10:35 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id be10so1873551oib.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ifsT2wWYpR3GIDej6kj9iuP5yZJl2zk/c+ZcBDquvTw=;
        b=DDdHHzPUj6tFM3Ado8BDbAXR1U26zWTe596bqmQ+wliUkAycKWe8nh/xaLuyN5+n2m
         MkSS20r3t6l2QBmxiYnXdE2ojj1h+c7tM8TEtkrV3Bc0uw5crJ1aXaRgn4J7a2CWZn75
         EXABTWG1upx+Itdm4FfqWQJhB/m89c6kUsy9ZTAr61gpt6szAZIvRcI6DB3COTImR/+6
         0DbSS+izNcy4A4GZr0uivE7PsU4AZY9Q8jhSsnxt9c8njk+6YhntErSsIvF3DotMNY9+
         had/UYOLX6kH+xLBpJtHKQztJC8AMv54fU9BLmBqd54Kv350XV1oTPke/zIaa0VXybCn
         TSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ifsT2wWYpR3GIDej6kj9iuP5yZJl2zk/c+ZcBDquvTw=;
        b=bIEnx+6/iz5Ke/G1KXDwEgXTadMDg7A7UQt17lwGib7ILWuEWQj3tibFvCAplSjkD9
         MvXh88WOWMNlPSGKNOZ2q8ni5X8ZCnhC5Vs46dChN3CPI0tpgUjWS2YLxoRjn85vtCrp
         dH5wkS2Bb4S3G3r9Ky4lJIQculIgAyXWuYBgSNpD2VQ3sjgTbUqyzXObRU2WCMW1Zejg
         2ULS/1zRe7lf9KIfx4wRKilzZXd/bSLdEcPi0tqR144SkW7QnpdLEV6LUk3Eej5IdbSq
         K89f6vBYzQvLlaSdahoKDzSTKP4nBIqQjL5H3ehdxEyHg2xQyRbzXHnNRh4IJ81uHTXI
         8dhw==
X-Gm-Message-State: AJIora8DYtCXswuuDhhM0Mv5H9vzfhx+5O6dljV2TvntehHfgjfObNPv
        kb+u2QEsliFPZNGjNtr6rAvW7tHo9cfk/g==
X-Google-Smtp-Source: AGRyM1tPh3ymkg591521d/uHcA5BmIIn6/MhffzQolzJ3zLSYJ/eM4iUBUrmz60HDpTZg0p3+dct2g==
X-Received: by 2002:aca:3b06:0:b0:32e:8bb7:bef7 with SMTP id i6-20020aca3b06000000b0032e8bb7bef7mr7365838oia.246.1656645034261;
        Thu, 30 Jun 2022 20:10:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i16-20020a05683033f000b00616b835f5e7sm10387117otu.43.2022.06.30.20.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 20:10:30 -0700 (PDT)
Date:   Thu, 30 Jun 2022 22:10:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org,
        jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sm8250: camss: Define ports
 address/size cells
Message-ID: <Yr5lo799md1XcAkU@builder.lan>
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
 <20220606132029.2221257-4-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606132029.2221257-4-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Jun 08:20 CDT 2022, Bryan O'Donoghue wrote:

> The ports {} address and size cells definition is the same for every
> derived 8250 board so, we should define it in the core sm8250.dtsi.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 2bc11cad3a44..aa9a13364865 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3395,6 +3395,11 @@ camss: camss@ac6a000 {
>  					     "cam_hf_0_mnoc",
>  					     "cam_sf_0_mnoc",
>  					     "cam_sf_icp_mnoc";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;

Adding these without subnodes that make use of them will cause
dtbs_check to complain.

So although it would save a little bit of duplication, let's add them
when/where it's needed.

Regards,
Bjorn

> +			};
>  		};
>  
>  		camcc: clock-controller@ad00000 {
> -- 
> 2.36.1
> 
