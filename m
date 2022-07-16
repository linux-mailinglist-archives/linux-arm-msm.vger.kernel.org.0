Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C53576F94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiGPPBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiGPPBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:01:16 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5B717A87
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:01:15 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-fe023ab520so12724362fac.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f3tz7nvmrPAAR/RbLohjcCYMNjuNkgsggyYfatjl8N0=;
        b=YiWcxBuOViRE9C2TQS67I+4SQqQNXu0Du8TD/CdP5T/IkfjcgiVIzaOQk4GsRZONyB
         hBHfBwShdm2mIwahbj1sBf2itVCOk3qz4dHIuupJPaLTr4cCA9RBRsFJskIaLAMBAd8Y
         tRFi/QEnIVTLqyIQtVJw9SUcqIMnW48GEdQagNbrphc2Yp1Vfb7Rwnf1genmNH1hGZwc
         e52msSV0HOqNGDigwkJYGyuDJgZ9qQA3Nz3pdqiDs8NFYPX1+6BYTCeFIruPhjSYahkG
         7w1hwRGRtSRX4rMQ17fXM/0MAPMh4hlVvlVgtuDVnRQSCVMJKdyhpNE7Gn4JBFVFAHYS
         Zp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f3tz7nvmrPAAR/RbLohjcCYMNjuNkgsggyYfatjl8N0=;
        b=7TMBOQWDpWeIL+7RmhVQgbrDz2OXtwU1sXgG5tlANlzn33oHOVT4t2z03W5pHI03/b
         CvfSFLirQsPjJg0h/lDpyIIrETHG1VM+stlDBVhlJh+Qxq0eNyw1qxk6GBCn2M4rO1G9
         GhwQRPaaTrmWxahbuLHsXv1zZ9hCPQsFDWj5BKWYM5K/PzDzftjIbdI/PfsQrtkc8+kr
         2/+6bERR4Uppg5UROtV1cmQ8dDc/of8IUf52kdrbeyaRZfEcCrPtfr0JIn7xalptTJXP
         es6AUsVgH9EIU6/8viieITjnuZvz0UqxgLgMD3GKsRt1Fy88lmXl9B2X27HH42SWO0kG
         hCaQ==
X-Gm-Message-State: AJIora/AY4YHtLQdmZOqOcce+nC9EQCAryaaInuPV9gUvTKPJg/iZWzY
        +YKuv4kn7Cdo/A4HZ/+UUqaY0sTu8wtpdg==
X-Google-Smtp-Source: AGRyM1tLjSavEbjob5lq7rZJRnxO6mQsgS28vxTpRXsEGIO9iCrfC5M0YSjPOt2YndJ0FtgU1AYqhA==
X-Received: by 2002:a05:6870:14cf:b0:10b:f83f:fde with SMTP id l15-20020a05687014cf00b0010bf83f0fdemr13662254oab.234.1657983673883;
        Sat, 16 Jul 2022 08:01:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w62-20020a9d3644000000b0061c4c925c87sm3045273otb.78.2022.07.16.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:01:13 -0700 (PDT)
Date:   Sat, 16 Jul 2022 10:01:11 -0500
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
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: sc7280: split register block
 for DP controller
Message-ID: <YtLSt7NH4c5itRzI@builder.lan>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
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
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a3def1022ea2..e54c2000b098 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3810,7 +3810,11 @@ mdss_edp_phy: phy@aec2a00 {
>  			mdss_dp: displayport-controller@ae90000 {
>  				compatible = "qcom,sc7280-dp";
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
