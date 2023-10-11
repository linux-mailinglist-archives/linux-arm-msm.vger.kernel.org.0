Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEA17C4D50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 10:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjJKIfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 04:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbjJKIey (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 04:34:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9489D58
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 01:34:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-503397ee920so8299015e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697013279; x=1697618079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKjNKmVwLteJ2rdG4Wdm/YqXtcBPxrCX3IBRkzT5D44=;
        b=lWISzXS6ZQEaq9xF8jucanZOoSH+KHoqjdY7z5VdCEwKOyvPeethObSzwixcowezBL
         w4uK8ovbx9xTrn1TjBtyu3l/nVE7OZYzKFQ7Ggj1zDjfJESWtouL5UBQveWCdEracf4D
         KK879i0CmOhNzHL5hmjfjn0zluYgzPZouKTkFCGB2jeKmkZHsoEhKl2Blyph/8uNnS86
         EZg2xfuWrdY6eRvpkfKorvBry85/upOaF/M+XLQc3qtiErgYLUWbTwb6tPwWdQ8XFZZh
         Q6i/vd1WT79aijx8pkL8++JtEHOWO8HYGWiTpbzSwtMAihV2IPprWDzl7VFoN2xH+fQF
         SnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697013279; x=1697618079;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FKjNKmVwLteJ2rdG4Wdm/YqXtcBPxrCX3IBRkzT5D44=;
        b=XMFVfiW0aBMaKsFIXRYcTS4kHMekw6T+WFiGmnaOdkZeYkqCDsle/uItJF8HCyb2Yw
         sGkeukVB/4TTkxP+dY66OTfGMoCNHEl60W/0bj3omFETxhk3/OJm9m33P52erl9WLxkz
         TMc5S9M4UyQ1N+Ci7TkxS0nZOnf6WgwX1x+KX4HKWWS3ysdEOBAzzFbFSqRG56PukGFp
         cKoBLr3HP/r5sefEKhdD1R84ZxlDOTsnRZgUi/6UmdAkTlhfQVI0iTQXIPUX/g6b7LRZ
         GI6c2HWLPltGJPvdH+ubtDy0snAxFHypklG/1y4mo5kBu8ouh45GxBx1HRH9NWqj/JPn
         9QUw==
X-Gm-Message-State: AOJu0YzFL/g+dvj2j2MDV6Aw+sLWpYLvt8a2NNKN+q261twgXzIJctHQ
        O3FphuONKnYHcSqEbcWxKAfIzg==
X-Google-Smtp-Source: AGHT+IEZ+xF7gk+iiMVaYujK7+HvKygwHOtNr4X6sKuh1VeAOiudExW5SBYVdPOvx4vKD+tuVThMIA==
X-Received: by 2002:a19:4f4d:0:b0:503:2683:ec7b with SMTP id a13-20020a194f4d000000b005032683ec7bmr15734530lfk.33.1697013278872;
        Wed, 11 Oct 2023 01:34:38 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id v3-20020adfa1c3000000b0032d8354fb43sm1523507wrv.76.2023.10.11.01.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 01:34:38 -0700 (PDT)
Message-ID: <f7ec06f9-7c03-4614-9b3b-d09dad0c6c46@linaro.org>
Date:   Wed, 11 Oct 2023 10:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] soc: qcom: pmic_glink: fix connector type to be
 DisplayPort
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Simon Ser <contact@emersion.fr>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2023 00:52, Dmitry Baryshkov wrote:
> As it was pointed out by Simon Ser, the DRM_MODE_CONNECTOR_USB connector
> is reserved for the GUD devices. Other drivers (i915, amdgpu) use
> DRM_MODE_CONNECTOR_DisplayPort even if the DP stream is handled by the
> USB-C altmode. While we are still working on implementing the proper way
> to let userspace know that the DP is wrapped into USB-C, change
> connector type to be DRM_MODE_CONNECTOR_DisplayPort.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 9569d999391d..6f8b2f7ae3cc 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -467,7 +467,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>   		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
>   		alt_port->bridge.of_node = to_of_node(fwnode);
>   		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
> -		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
> +		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>   
>   		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
>   		if (ret) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
