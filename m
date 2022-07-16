Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A292576F90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiGPPAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiGPPAu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:00:50 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B38917A85
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:00:49 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g20-20020a9d6a14000000b0061c84e679f5so2956163otn.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OCzu8o65jRXe8kPCqql1dkNy/KOHUusXq9Qq20UZz6c=;
        b=jByed41fI6hFQz2xdF/cZBTRCTWtuNRpqfrzM4D+IZWUez7IXqMrYxyVT2I8UjNexH
         zodo3jqlUMaE/1Zk96unWmzq35cPuROjwHnFo8pNHCmlCr5P5lOz2HMAiiVztod4gA5z
         3mnF/oK0KHg2toiZoqdO6yJHd3TJSW+q8o6PGAgoSGS0rhqFz3IyxagddxIbGb8MSZcx
         Zo7z3EhOewZTZZ4ZLi5fUO5D6BpDPsXyLFPdLfi9o3pepa5WM6YWRaJef/N5UMx+KhCp
         U+kXGkV9/4Dnp8fpeVMUmYuPH7mlQ9Xv9Bnqk2Cw1L3nscgk6F56I57tD4xPMRw0Bf9d
         Y+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OCzu8o65jRXe8kPCqql1dkNy/KOHUusXq9Qq20UZz6c=;
        b=wFO/AeowMRsx9dfWgrTET9MmbyYUst67iq/CRgrlKVJ4ECyaKIOxW3tDIbHmiuGlAe
         0Hi2E1nTCeGWr+pyKunADXztYItG7VqGznvmfMD5vz5TNU9vSBRG0YmIKeRuYJgKZftT
         M9KlAtqGIHncOBwAEnMffaSf6cF9APXKyy4rQR+d4agMQv4WvM0EOIo/x77vMuWo+n8Z
         ZkS/GvdQQWuXvx72oGvdFXZBneNwIeH5lOnkY0Ip1tPdwptnojykxuBHtJkAMzSDgebq
         uIKw1X8+dwm1XVyB7CRzFIK9BddRkBbGl1E1e9GcB/r16JEHrm0ISDYG5zxl2BVrWLrN
         sX2A==
X-Gm-Message-State: AJIora9f4SJdp1vPRhTS9zr/Q6SQQSr+i5j+QbzQgYVumncT7IRr0kaP
        H5KvwISu0VLqO4WM0HlVimk01A==
X-Google-Smtp-Source: AGRyM1svToWbvX0jHGW2fdza8Lv63PzW2QBjLT84JxmK5lubx1xwBrqWz5tlH1ij8hv06lzx3HJqbA==
X-Received: by 2002:a9d:6443:0:b0:61c:7f6b:fef8 with SMTP id m3-20020a9d6443000000b0061c7f6bfef8mr4573896otl.319.1657983648466;
        Sat, 16 Jul 2022 08:00:48 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d8-20020a9d51c8000000b0061c7ce09091sm2684336oth.67.2022.07.16.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:00:47 -0700 (PDT)
Date:   Sat, 16 Jul 2022 10:00:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: sc7180: split register block
 for DP controller
Message-ID: <YtLSnj9UjLBBZGFK@builder.lan>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 10 Jul 03:41 CDT 2022, Dmitry Baryshkov wrote:

> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 47ce5787ed5b..875808cf0614 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3080,7 +3080,11 @@ mdss_dp: displayport-controller@ae90000 {
>  				compatible = "qcom,sc7180-dp";
>  				status = "disabled";
>  
> -				reg = <0 0x0ae90000 0 0x1400>;
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0xc00>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
>  
>  				interrupt-parent = <&mdss>;
>  				interrupts = <12>;
> -- 
> 2.35.1
> 
