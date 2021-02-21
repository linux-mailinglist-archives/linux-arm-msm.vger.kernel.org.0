Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B72320CBB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Feb 2021 19:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhBUSkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Feb 2021 13:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhBUSkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Feb 2021 13:40:46 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C91C0617A9
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 10:39:46 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id g1so45845294ljj.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 10:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=35pzqO9O3l5AL2z+dNGmH+7/+WET1My3h21Jjydq1RE=;
        b=QXZBpyPQ/Nj+N18ro87ronCkYiIuKDrDoItzktNDE5atJOc207NDHNqJkd5bwr4ymm
         B50Mq62BjW8MusaKCAwr/Q/csrVjCzSzSc5imWIO6oaDfdkyXwK1/Fdqjj1uDQcfMiD7
         ImYtNS0DYgAFnlJsi6YkTAZUE7RWPMfL6+YldaA1OP8Sa31H3+WOFyxUXLNxj/OPlaSz
         qa131PnEFzhkG28/Fn92WhKQgrf3HIPzzE9VqhRKObE+7OtuXpKoXF7eQdmdjoBdSoc2
         0AHrMmYWUUbW2haRBDewuYuW6P1nrDZ8n6yQzbnPuea5s8cglEHjDCCnQi4uQgiBM9fn
         +TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=35pzqO9O3l5AL2z+dNGmH+7/+WET1My3h21Jjydq1RE=;
        b=VrohvMC6SSTXTKSgX3zzTYMyOxPKD4qKndbvo6kgjwp7ashpYhoXSTQEo1cbaE2KOg
         IgVrZjrWP9s6VT5soZSaQOsWnUgpwrJ3/E2SrIIxS+2LTDrq6SaXuAz/fsf10NejOI/Z
         LEACh4GYS/TNAxFazjc4HkbDsaa+pNLgHik5EA852rTrYECGCCIpDVOskbO1ga7Yq3/x
         9qH1Ay8e104itVk34TLdQAOTFM8nRry1xyghEW8cL+fMqE40N5Go/EusXSmYytWcb2ye
         f2m4gXMnIKv96x9/2oxA7PkCd+cNRgm2iHo40SckU0qYBD9PFAfqZQNFtyShFmqfgHkC
         6e0g==
X-Gm-Message-State: AOAM533MX+eBgUCJNNktT8sz5a02SsMM8AbqtShwuaB2ej2uw+X5rJeN
        zeLRUkyyQFTWuX1ehNW4qZMqtQ==
X-Google-Smtp-Source: ABdhPJytJb6BG+ryBC3pDHSlSwMSkRTeAhgxj/UdTPjDnv/ZoUtUoo+ADJONRpar4ClobZTsCqCLIA==
X-Received: by 2002:a05:6512:68a:: with SMTP id t10mr11171766lfe.334.1613932785525;
        Sun, 21 Feb 2021 10:39:45 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id c5sm1637566lff.113.2021.02.21.10.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 10:39:45 -0800 (PST)
Subject: Re: [PATCH v5 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor
 and connect to ISP
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-23-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <89be7089-4dd2-caba-a0b0-aec256e7f8a1@linaro.org>
Date:   Sun, 21 Feb 2021 21:39:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-23-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robert,

Thank you for your patch!

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

On 17.02.2021 14:21, Robert Foss wrote:
> Enable camss & ov8856 DT nodes.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1
>   - Laurent: Fix subject
>   - Laurent: Remove redundant regulator labels
>   - Laurent: Remove empty line
> 
> Changes since v3
>   - Fixed ordering of IRQs
>   - Add newlines for better readability
> 
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 5842ab65789c..d89286f6aacb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1108,6 +1108,21 @@ &cci {
>   
>   &camss {
>   	vdda-supply = <&vreg_l1a_0p875>;
> +
> +	status = "ok";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {
> +			reg = <0>;
> +			csiphy0_ep: endpoint {
> +				clock-lanes = <1>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&ov8856_ep>;
> +			};
> +		};
> +	};
>   };
>   
>   &cci_i2c0 {
> @@ -1139,7 +1154,7 @@ camera@10 {
>   		avdd-supply = <&cam0_avdd_2v8>;
>   		dvdd-supply = <&cam0_dvdd_1v2>;
>   
> -		status = "disable";
> +		status = "ok";
>   
>   		port {
>   			ov8856_ep: endpoint {
> @@ -1147,7 +1162,7 @@ ov8856_ep: endpoint {
>   				link-frequencies = /bits/ 64
>   					<360000000 180000000>;
>   				data-lanes = <1 2 3 4>;
> -//				remote-endpoint = <&csiphy0_ep>;
> +				remote-endpoint = <&csiphy0_ep>;
>   			};
>   		};
>   	};
> 
