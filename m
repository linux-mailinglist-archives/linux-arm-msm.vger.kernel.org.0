Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B0F25DF43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 18:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgIDQHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 12:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbgIDQHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 12:07:10 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2976DC061246
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 09:07:09 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id i17so6965535oig.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=doLJDgNe0qt085BNPu/3Io3kfNCUU7JOawvznIdKbdg=;
        b=Bls3T86mzryTn+qU1zsr/9PYb0zkdzQQ2ypAxX9SKP9tu98U+eVySYDoXF3jIyFa8G
         XH3HYfOWR693y7ALBNUYECipnhoSVq9uQtmNNn8ZNJMY3gWyc7pbJWqOcy39gmSAsouj
         U8vUn6yRiuL/09+Q3ZPurtyUqlRFuuSAdVbkVyt9CLW/Hw0QFIVg8PBZUUjOuAjxdnu1
         Eak3IlxA4JLKEFyjL/fgoyooxv3/37UcREE9CZ1SSFV7DDDliFlyEcDpvFWUzCLDScXZ
         bwWi0RyelmbdQqrcGz83/qEBJCTQpYYw3g4kHp1J/RwwCAauH4+RwTUXB4UB+CfxXbSP
         lZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=doLJDgNe0qt085BNPu/3Io3kfNCUU7JOawvznIdKbdg=;
        b=c7FK4GLvYlK+1pDwQW9iGOI2GhkHXLQNvMKZE7s213ke7OkNcbZSwT3hh4mVsBXtsd
         vinxv/wh9CeGqKpYVQbm2uBEMFiNaNTS4/kh+lIP9U9vJ9d8MsjHoBhXK+oe/aIg/9uz
         frhV252Vtv2gcIoNck03R1D4sAjWWaQ1UUy5McHQDMmURbb807pYIzc1l/pkEnTWX6OU
         qDj7Zc6RXTpswFFYIT+mEAJxOzSecKkdkGz4P6jUBnwAcAIxr3+hUmPMf5T9/pl5z979
         vsqUb9pLLotgNszjcbbxXKhm5Hq8ZTCXjxV7VQtVna86Vj0NegC2kItOleKMfK8U9Xw0
         1Jug==
X-Gm-Message-State: AOAM532feJaftsEp/O/2AQsrWH65gEHUO2zwlilFR1sCJXUIxeDn+NPI
        fTH9RUCpgjZIohk7/nszQTv2Gw==
X-Google-Smtp-Source: ABdhPJyW9FGADBJOCZRrQYFZdHWHjGtQOzqZty0xfmulX35Zut5RGG3F7ZSeSB47qhRZIBUayNPRPA==
X-Received: by 2002:a54:4f85:: with SMTP id g5mr5738063oiy.27.1599235628680;
        Fri, 04 Sep 2020 09:07:08 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id w1sm1370649oop.16.2020.09.04.09.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 09:07:07 -0700 (PDT)
Date:   Fri, 4 Sep 2020 11:06:58 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v16 20/20] arm: dts: qcom: sc7180: Set the compatible
 string for the GPU SMMU
Message-ID: <20200904160658.GJ3715@yoga>
References: <20200901164707.2645413-1-robdclark@gmail.com>
 <20200901164707.2645413-21-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901164707.2645413-21-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Sep 11:46 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> split pagetables and per-instance pagetables for drm/msm.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b3833e52f..f3bef1cad889 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1937,7 +1937,7 @@ opp-180000000 {
>  		};
>  
>  		adreno_smmu: iommu@5040000 {
> -			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
> +			compatible = "qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
>  			reg = <0 0x05040000 0 0x10000>;
>  			#iommu-cells = <1>;
>  			#global-interrupts = <2>;
> -- 
> 2.26.2
> 
