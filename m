Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C889E7936B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 10:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjIFIBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 04:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbjIFIBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 04:01:31 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EBCE58
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 01:01:24 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401da71b7faso33403265e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 01:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987282; x=1694592082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iacyrJQBRhEYzvp25ziq2vSW7I+eHVISs/3iilhXySg=;
        b=SIZGWfC8kS4aG+Cheq7JD3iLPObguwjaFEXZZkPeddWrjVEOqKL9efYMfmDLJ3NrCF
         6TIal5vYA1ONp4I09unOtgeUB3w7YuaZn0Fw7wO/KjcysDJEZNxwKKI0DuLOfUFehZQn
         w0P19ttKBvi1D29xB8JSsDMJ18oCAuF2HqZgaPECEar0UBr6vklCfkoao3uWsS2UvdJ7
         Xm8cO8f2SGCIjqDBJBFLIeTr/hd1/oQxcaxVx0xx4Pm32kYVKxa6YFPZU9mUg6ZYlc2C
         6pw+JqiEpfs7/IKcEc2W2TKDHsBK0HbOUN4D+knzX/G6TyESBunAIBQWS9ff7+6SHuoz
         5JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987282; x=1694592082;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iacyrJQBRhEYzvp25ziq2vSW7I+eHVISs/3iilhXySg=;
        b=F3nu4lzDWxGsTsS4lUJ5bMqiJhElFveoVL4qemHiHfSwGAPD/Evu/aC8E4j5B3gEAQ
         7ImmJot9OJIYJPcH6NwvxlLFaVECNbDJbMbV0XlyMYJUFgNVnvvIK8Ic/aq7PfaqgVk/
         H8HI4/W5RxiwNJmSe7/bxqFHYVAgV/aMp8Paiut3Q6g7f0BV3AVPo7uAkv+9JEE9dkK9
         sIEF2TMZNyKfSo0P25qerRO/R2PD4ceXzuyhwVjvM7/iv1dGH+pDs4VYp5C7QKAolwcC
         YFPzYr7e6g4G59qr7X2DAXoX7kZ+c9zi+dalfrf3YEUy81nv/34JWgn9wBJsTjaNm2Cw
         1AxQ==
X-Gm-Message-State: AOJu0YxI2GJzIDg8vfqqal+gH5C8bMDTtS21T6boLogrz3DRkLZWvLPG
        j+kUZ+e6xCXAlcrYz/vYCoNLxA==
X-Google-Smtp-Source: AGHT+IFUkCkp5b1k9uUnvwcZZyeMI9mvJjJKv2FEZpg0/LhShP4vJvD/ReuVKCBa81vTCt3dNV3gnA==
X-Received: by 2002:a05:600c:2811:b0:3fb:ffa8:6d78 with SMTP id m17-20020a05600c281100b003fbffa86d78mr1567287wmb.36.1693987282483;
        Wed, 06 Sep 2023 01:01:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd? ([2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd])
        by smtp.gmail.com with ESMTPSA id ay30-20020a5d6f1e000000b0031f65cdd271sm577301wrb.100.2023.09.06.01.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:01:22 -0700 (PDT)
Message-ID: <df1323b5-29c0-4daf-8ca0-cb6a85171d9b@linaro.org>
Date:   Wed, 6 Sep 2023 10:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] phy: qcom-qmp-combo: use v6 registers in v6 regs
 layout
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>
References: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
 <20230906075823.7957-5-dmitry.baryshkov@linaro.org>
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
In-Reply-To: <20230906075823.7957-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2023 09:58, Dmitry Baryshkov wrote:
> Make sure that we use only v6 registers in qmp_v6_usb3phy_regs_layout.

Why that if the registers are the same as v5 ?

Neil

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 12 ++++++------
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h |  2 ++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     |  4 ++++
>   3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index bff6231d7de3..9c71a132afea 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -194,14 +194,14 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>   };
>   
>   static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
> -	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
> -	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
> -	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
> -	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
> +	[QPHY_SW_RESET]			= QPHY_V6_PCS_SW_RESET,
> +	[QPHY_START_CTRL]		= QPHY_V6_PCS_START_CONTROL,
> +	[QPHY_PCS_STATUS]		= QPHY_V6_PCS_PCS_STATUS1,
> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_POWER_DOWN_CONTROL,
>   
>   	/* In PCS_USB */
> -	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
> -	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
> +	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
> +	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>   
>   	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
>   	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> index 7c16af0b1cc3..0d0089898240 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> @@ -8,6 +8,8 @@
>   
>   /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
>   #define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1		0x00
> +#define QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x08
> +#define QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x14
>   #define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
>   #define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
>   #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
> index c95d3fabd108..496c36522e55 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
> @@ -7,6 +7,10 @@
>   #define QCOM_PHY_QMP_PCS_V6_H_
>   
>   /* Only for QMP V6 PHY - USB/PCIe PCS registers */
> +#define QPHY_V6_PCS_SW_RESET			0x000
> +#define QPHY_V6_PCS_PCS_STATUS1			0x014
> +#define QPHY_V6_PCS_POWER_DOWN_CONTROL		0x040
> +#define QPHY_V6_PCS_START_CONTROL		0x044
>   #define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0x0c4
>   #define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0x0c8
>   #define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0x0cc

