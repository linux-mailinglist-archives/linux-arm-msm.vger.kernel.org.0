Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF37C7936BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 10:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjIFICe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 04:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjIFICd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 04:02:33 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B47BE62
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 01:02:19 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31de47996c8so2962318f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987337; x=1694592137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Q/8k13q+5XZeW7dJElu9hPVofhu2/s41H2N9As5n/A=;
        b=Rhj0Ok6RNxStpuV8x7x4OhdoLOgAkA93DTFxjhquKDfnDltiJBE4YVOSZnfdnutRBC
         OC+njfvikH7vldJuYqEIxEDOcz+T/+rAs1yr++UP5ZBK1X1fobArUfdqWTtyDR8tSQ8c
         ACLcAdOOPmwDRW0etAUo51FEU51jx93YXeY3piITGXBDnY70IbdcwopyZntF6BG840XT
         BG2GsqKAKoKHSygg3zw+n4InsHlibaX1lDnfT8t/qnoHArIz3G6vne+3ObJy2QtSjapC
         wKD7MfQecJBBYRdPHRYj2RjbI6JqJVcvaRa0l/p4IGPfNlIvTWwXPslT2A8bAFEGq1OL
         i97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987337; x=1694592137;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Q/8k13q+5XZeW7dJElu9hPVofhu2/s41H2N9As5n/A=;
        b=hqZ9+VbmhGa51XZNOkJ7Wn7H5oWywenLfSCpnpik5LujZ8MIY5RnHN2LRL4+nG0O8m
         FcC4xWenq6nRrg/SifXJHF+Spna4YXT01J+fCAUnRN2DORM+2XwDFD6hAZPultWDppzF
         bNOVpdOjTowmTNiUtJ52phgVusvgjrmbokzGNiIo+2uUi/jJ5JqmPp4sTnhjlu4mOuXi
         R15vzHCowRFfnC32dXmHXKLWI4Pey7lwnyrW3IZ+uDJBLy8oFnFsP8C0nzAuj3+Yp9oI
         7P2RTNKEZNYk0snq+HneqwgUE9l9x/UuFft+sTQqPTMybwM63VtgM+QnVd4vu7NzsYyT
         OICw==
X-Gm-Message-State: AOJu0YxUCcb6M5uGoTgM8CLOODNmPwvnDzx2/X7MOr0Ms8Z88d22wvig
        p19TqsSk9PI+9/ZnRti7D85+eg==
X-Google-Smtp-Source: AGHT+IEh9Tf9DTRpI0c7dAyiFDgg8EtimVMWBVUgkxKx/fllGTgrYE9yKt6WnvkoBW64AdEyOOMHBw==
X-Received: by 2002:a5d:4087:0:b0:319:79b4:a8ba with SMTP id o7-20020a5d4087000000b0031979b4a8bamr1583817wrp.41.1693987337513;
        Wed, 06 Sep 2023 01:02:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd? ([2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd])
        by smtp.gmail.com with ESMTPSA id ay30-20020a5d6f1e000000b0031f65cdd271sm577301wrb.100.2023.09.06.01.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:02:16 -0700 (PDT)
Message-ID: <4f6ec540-9cf7-4505-ada8-2e203eaafca6@linaro.org>
Date:   Wed, 6 Sep 2023 10:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] phy: qcom-qmp-combo: correct sm8550 PHY programming
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
References: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
 <20230906075823.7957-2-dmitry.baryshkov@linaro.org>
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
In-Reply-To: <20230906075823.7957-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2023 09:58, Dmitry Baryshkov wrote:
> Move PCS_USB3_POWER_STATE_CONFIG1 register programming from pcs_tbl to
> the pcs_usb_tbl, where it belongs. Also, while we are at it, correct the
> offset of this register to point to 0x00, as expected.

Konrad already sent this https://lore.kernel.org/all/20230829-topic-8550_usbphy-v1-1-599ddbfa094a@linaro.org/

> 
> Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
> Fixes: 39bbf82d8c2b ("phy: qcom-qmp: pcs-usb: Add v6 register offsets")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 2 +-
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index cbb28afce135..41b9be56eead 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -859,7 +859,6 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_tbl[] = {
>   	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
>   	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG1, 0x4b),
>   	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG5, 0x10),
> -	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
>   };
>   
>   static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
> @@ -867,6 +866,7 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
>   	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
>   	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
>   	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
> +	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
>   };
>   
>   static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> index 9510e63ba9d8..5409ddcd3eb5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> @@ -12,7 +12,6 @@
>   #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
>   #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
>   #define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
> -#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x90
>   #define QPHY_USB_V6_PCS_RX_SIGDET_LVL			0x188
>   #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
>   #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
> @@ -23,6 +22,7 @@
>   #define QPHY_USB_V6_PCS_EQ_CONFIG1			0x1dc
>   #define QPHY_USB_V6_PCS_EQ_CONFIG5			0x1ec
>   
> +#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x00
>   #define QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
>   #define QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
>   #define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40

