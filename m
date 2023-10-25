Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0844B7D6ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 14:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbjJYMDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 08:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbjJYMDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 08:03:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EA3184
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 05:03:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507d7b73b74so8052115e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698235408; x=1698840208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByS5CQnJ89mhopYzrf6X8u1aolP08AkIubwh3iCpm10=;
        b=ShR4eykCVQamDksxMcrTvWRoMvPdxKag6NMEGggw+e/RcNG/TiJKD8NulGA5rTpbh0
         2Mizdax0G5mtgVhvf7k1yx9Dvjg4Hgjj0DrNJlM4FT75EcaBfPaGYF6o0kLDMy0Bsg8i
         rAr+Kt7UP6p404pjKFYJh0H8IdX/NgJYvpzPi33cZ5rL3hyjfLhCOrHI3FQarLSMX+RS
         KoQeKbcGMEJ8qp9NdkeEDPEMDgBVrkmyueBiClQ7zhr4TboShdUcKMIwGuCOe9j5g8rl
         dUHVXHqjbMlYUmRD/WVhwQCgigD3Ttn224C1fKvG6emXbaYnDmRUl2+BRZxSrPknap2q
         gV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235408; x=1698840208;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ByS5CQnJ89mhopYzrf6X8u1aolP08AkIubwh3iCpm10=;
        b=LJ/LAeg8Ju/dsZ2V4rpKioxnDMUPlUKrgaqkLBNVS48jsvqFKnE7hQss1H0HNm1arH
         YZFVIAVRsLRA5gMW2mWpsUTcZrJbVmGpOZ6PZlJoKcO2W9jpCv7jRbT7U/JxNREK/fnI
         gBQD9YLsiWdz9mqj4oSnDT0grT/yC2/RfIhcw+qlgPxYJNa78uBiliv9Qxf1JKX8Yx3e
         IBYxaTtw8cfd2TZlaUcdNO4wBQwDQ/bPPtost3faIN74uAaIzJz51Kv60dFYigIIbP1E
         cTWeY0GUKzgQ4OfPpZg9jDTs5F/MwMYeVQIZ2AuUgM2/w8Tz91Gs1ArthrQOvUwRig85
         7GDw==
X-Gm-Message-State: AOJu0YwGRTe0f1Ixiy/8ICQ/KaVGYMv/Yr89hXYpTMP/lRkdBx0YJWIj
        OREfrOQwh/TmqPZHqX6gsZi1t3aYQbHx580pd1uJ3tyG
X-Google-Smtp-Source: AGHT+IE4ZafaOSAeZrI6sYHc42usWlZb4m2AGVFDfMck77WgT78ftLn/4zoAH9TzCwJKQC92tAJuXg==
X-Received: by 2002:a19:5014:0:b0:507:a40e:d8c6 with SMTP id e20-20020a195014000000b00507a40ed8c6mr10050159lfb.11.1698235407849;
        Wed, 25 Oct 2023 05:03:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4b03:ec74:6374:5430? ([2a01:e0a:982:cbb0:4b03:ec74:6374:5430])
        by smtp.gmail.com with ESMTPSA id x18-20020a5d60d2000000b003248a490e3asm11928891wrt.39.2023.10.25.05.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 05:03:27 -0700 (PDT)
Message-ID: <544e5eb4-ffa7-4afb-b063-58c9127a9608@linaro.org>
Date:   Wed, 25 Oct 2023 14:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: enable UCSI by default
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <20231025115620.905538-3-dmitry.baryshkov@linaro.org>
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
In-Reply-To: <20231025115620.905538-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/10/2023 13:49, Dmitry Baryshkov wrote:
> Now as the issue with the UCSI_GET_PDOS is worked around, enable UCSI
> support for all PMIC_GLINK platforms except Qualcomm SC8180X. The
> mentioned SoC has slightly different UCSI implementation, which I would
> like be tested properly before enabling it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/pmic_glink.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 914057331afd..71d8901a9389 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -18,9 +18,6 @@ enum {
>   	PMIC_GLINK_CLIENT_UCSI,
>   };
>   
> -#define PMIC_GLINK_CLIENT_DEFAULT	(BIT(PMIC_GLINK_CLIENT_BATT) |	\
> -					 BIT(PMIC_GLINK_CLIENT_ALTMODE))
> -
>   struct pmic_glink {
>   	struct device *dev;
>   	struct pdr_handle *pdr;
> @@ -263,10 +260,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
>   	mutex_init(&pg->state_lock);
>   
>   	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
> -	if (match_data)
> -		pg->client_mask = *match_data;
> -	else
> -		pg->client_mask = PMIC_GLINK_CLIENT_DEFAULT;
> +	if (!match_data)
> +		return -EINVAL;
> +
> +	pg->client_mask = *match_data;
>   
>   	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
>   		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
> @@ -336,14 +333,16 @@ static void pmic_glink_remove(struct platform_device *pdev)
>   	mutex_unlock(&__pmic_glink_lock);
>   }
>   
> +static const unsigned long pmic_glink_sc8180x_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> +							    BIT(PMIC_GLINK_CLIENT_ALTMODE);
> +
>   static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
>   							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
>   							   BIT(PMIC_GLINK_CLIENT_UCSI);
>   
>   static const struct of_device_id pmic_glink_of_match[] = {
> -	{ .compatible = "qcom,sm8450-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
> -	{ .compatible = "qcom,sm8550-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
> -	{ .compatible = "qcom,pmic-glink" },
> +	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
> +	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, pmic_glink_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
