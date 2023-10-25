Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48537D6ABD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 14:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234787AbjJYMD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 08:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbjJYMD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 08:03:26 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8CC13D
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 05:03:23 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so84761021fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698235401; x=1698840201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQH9hfxBqvrbyAFGsLU+DTMSlGBAqUdJi4YFk5BbgA4=;
        b=PDbnyb1mCg3WIyFWtA082PrVr7YNwz9uk6+S8NClUpeSEiY/Ig5Z0XcmTqQpGePgUi
         J9h62Y4YJLPPYQFparVtvzVcI4XOaYT5r4OzKMeDrGva0TcffJNjqQg4kWbTBg3u4L1B
         ZmSLcEgi4pcbbXVF7eYlEKHzkYx7t29tdpx8ZqT1kpZbnngsMzGr8X4CdZUgjPeuiCvr
         H/4lFAw4+TjsJrn2vJnmS9KJyy4eD1Zypx9YnEHQtbTqteDo/PT5cTV2Kniu9mWU+O81
         8EbvcsEdL09YcuDQDdjfQq0wM0iiNbs/Z6Ly73F4PQx07uMdy+wR7GWJhKa9eFh35xWr
         KTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235401; x=1698840201;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qQH9hfxBqvrbyAFGsLU+DTMSlGBAqUdJi4YFk5BbgA4=;
        b=RG6K/j1tP1oQeVV5A/wsrm0BF2F+rqUinYV9RMz46uxNKXE9DFNhxIb1sxwtyx6JtA
         9x9E65qKh2GUWuReykJ2Lc4/7Uty/5k+c6Udr8LqNSez0Cr1+825jCJ5OFjXMuWPzEEz
         /h+dWRtk6ndJYRBso3BlkeDfZ1UQH4uD2xl3Qxd3yQE0j1wPhfBVK/ZQDUUlD7RPB6K9
         eX5pvlUMFXtoULVWSaIhvqTHAp4eiAJuUD5pZR7I51ksncKEjjeS0gOmGuGJ9DvwBcIF
         Hpc7mqoxZ1HRSpVbgCiEUeaux9LKxSR83y7bGRE2PzYASHqlClbwO26+Fqvo5YmbJRCY
         pj3g==
X-Gm-Message-State: AOJu0Yyf6sbUMnniGVaoDB9mYy3+3XkIAKGYrRWkthgssPNRdPxjBsfa
        WOfZXbEVqYqlhMOYH7GZOjKl7w==
X-Google-Smtp-Source: AGHT+IGVXVhOLLdx21okCQqyVuR9pDSGdwbMyuG/tE9Dl1Y9A9EH8GiCvaHutQIHj6KJTe41Elcu/w==
X-Received: by 2002:a05:6512:3c83:b0:507:9854:3b95 with SMTP id h3-20020a0565123c8300b0050798543b95mr11680090lfv.14.1698235401182;
        Wed, 25 Oct 2023 05:03:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4b03:ec74:6374:5430? ([2a01:e0a:982:cbb0:4b03:ec74:6374:5430])
        by smtp.gmail.com with ESMTPSA id x18-20020a5d60d2000000b003248a490e3asm11928891wrt.39.2023.10.25.05.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 05:03:20 -0700 (PDT)
Message-ID: <ea655f75-9f15-4fdb-832c-e09b4e7839e7@linaro.org>
Date:   Wed, 25 Oct 2023 14:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm
 devices
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
 <20231025115620.905538-2-dmitry.baryshkov@linaro.org>
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
In-Reply-To: <20231025115620.905538-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 25/10/2023 13:49, Dmitry Baryshkov wrote:
> On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to

    s/sevral/several/

> UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> easy way to recover from it. Since we have no easy way to determine
> whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> such platforms. This allows us to enable UCSI support on such devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/ucsi/ucsi.c       |  3 +++
>   drivers/usb/typec/ucsi/ucsi.h       |  3 +++
>   drivers/usb/typec/ucsi/ucsi_glink.c | 13 +++++++++++++
>   3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 61b64558f96c..5392ec698959 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>   	u64 command;
>   	int ret;
>   
> +	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> +		return 0;
> +
>   	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
>   	command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
>   	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 474315a72c77..6478016d5cb8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -317,6 +317,9 @@ struct ucsi {
>   #define EVENT_PENDING	0
>   #define COMMAND_PENDING	1
>   #define ACK_PENDING	2
> +
> +	unsigned long quirks;
> +#define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
>   };
>   
>   #define UCSI_MAX_SVID		5
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index db6e248f8208..a94e2df6fd45 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -6,6 +6,7 @@
>   #include <linux/auxiliary_bus.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/of_device.h>
>   #include <linux/property.h>
>   #include <linux/soc/qcom/pdr.h>
>   #include <linux/usb/typec_mux.h>
> @@ -296,11 +297,19 @@ static void pmic_glink_ucsi_destroy(void *data)
>   	mutex_unlock(&ucsi->lock);
>   }
>   
> +static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
> +	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> +	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> +	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> +	{}
> +};
> +
>   static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
>   				 const struct auxiliary_device_id *id)
>   {
>   	struct pmic_glink_ucsi *ucsi;
>   	struct device *dev = &adev->dev;
> +	const struct of_device_id *match;
>   	struct fwnode_handle *fwnode;
>   	int ret;
>   
> @@ -327,6 +336,10 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
>   	if (ret)
>   		return ret;
>   
> +	match = of_match_device(pmic_glink_ucsi_of_quirks, dev->parent);
> +	if (match)
> +		ucsi->ucsi->quirks = (unsigned long)match->data;
> +
>   	ucsi_set_drvdata(ucsi->ucsi, ucsi);
>   
>   	device_for_each_child_node(dev, fwnode) {

With typo fixed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

