Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA85A797449
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 17:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244685AbjIGPhL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 11:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245601AbjIGP3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 11:29:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D301C1BCA
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 08:29:19 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-501bd7711e8so1871436e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100515; x=1694705315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V84DA78dtZTuXZKZG/wAWIhizdAr3uJpJC1Bj2uoDd0=;
        b=vhGMQSSmwMFPWi4v/WlZ6NBG3dIDslFf16NAtx4QAiFiDGdsFjBmB/NRiGBwwQXy2/
         yNyrzBWdzlF9amPHIYcsEEDw/ejUlzN89Td/+7hlu26cOIEiHixmWU+3dbJeBhJKvGRi
         Dt1jHzhACklMYU291r22MaPQaiTH//ztI2P6c0aRUwCcdDxnbb+F+xBMDaKghtvKrfuZ
         iZxVAVUNw4hkjOFnxeVDmleBb4IIRoVNH6M9Qxcss7gDNy/Kc6bINgYST8+/2d6PolhF
         kHs2Cdpa38POtCmXqmuAnHARWhlAQsoZkDhV7NWhO04aq6GbTN67tqetLZ21yPmfhaq5
         V/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100515; x=1694705315;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V84DA78dtZTuXZKZG/wAWIhizdAr3uJpJC1Bj2uoDd0=;
        b=OhZ/OJYdG7aSwcNCHZ9ZqJUaClWLkO6PXaQY3wTP13KG6HLJRUiVZuw1kA2DD3RXBy
         5wW9XS6A91XAYfJggQgF9m+jlhSP+U2lXx2n5i+e0FGopNfdHnbbLE0YP5KPdC3HXcHW
         PpnnZLTMLz5aC7qEY6L/kx/QOAUYq+VdUdnTuMUyPD/XODU7BLw2Y/JK4LpQraylPM68
         pJc0Jupr8cP0lS/4sK/COpTNLaFb7ihXsy0B1xGo7XK7r+KIFMljkoedUjODHjNfw9Mw
         ny3FKDdgHh7FB415LDuu+6A1eocouSLPdYcg9jLne+ClOiSs0ttzQFfS2Ffy6g+im9MN
         ar0A==
X-Gm-Message-State: AOJu0YxZYiSGiUr5rssCu8l1nnSpWmQWOmPtx7sU42DfBV1EnJYzUnZb
        eA3iT5IOCe8W4JAynL+C+YyHfng5we3fiFPumLPcqa9q
X-Google-Smtp-Source: AGHT+IE35UZ3oDSKDs4eDo034ZR//TkueBwcC+n7RKXhfWjT87LfVsZlV7e+LXPDTn9qBHwjjzcskw==
X-Received: by 2002:a2e:3019:0:b0:2bc:c4af:36b9 with SMTP id w25-20020a2e3019000000b002bcc4af36b9mr3715304ljw.52.1694073427086;
        Thu, 07 Sep 2023 00:57:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86b3:b829:fa6a:1a8d? ([2a01:e0a:982:cbb0:86b3:b829:fa6a:1a8d])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c204700b003fed630f560sm1708756wmg.36.2023.09.07.00.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 00:57:06 -0700 (PDT)
Message-ID: <47bc9843-bb40-4c4f-a6c9-6b43b15a78c7@linaro.org>
Date:   Thu, 7 Sep 2023 09:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 1/2] irqchip/qcom-pdc: Add support for v3.2 HW
Content-Language: en-US, fr
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     "Maulik Shah (mkshah)" <quic_mkshah@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230905-topic-sm8x50-upstream-pdc-ver-v4-0-fc633c7df84b@linaro.org>
 <20230905-topic-sm8x50-upstream-pdc-ver-v4-1-fc633c7df84b@linaro.org>
 <e3af689b-5e37-49f6-84b0-ea8649d1943d@linaro.org>
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
In-Reply-To: <e3af689b-5e37-49f6-84b0-ea8649d1943d@linaro.org>
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

Hi,

On 06/09/2023 18:55, Konrad Dybcio wrote:
> On 5.09.2023 15:19, Neil Armstrong wrote:
>> Starting from HW version 3.2 the IRQ_ENABLE bit has moved to the
>> IRQ_i_CFG register and requires a change of the driver to avoid
>> writing into an undefined register address.
>>
>> Get the HW version from registers and set the IRQ_ENABLE bit to the
>> correct register depending on the HW version.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Maulik Shah <quic_mkshah@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> [...]
> 
>> +	if (pdc_version < PDC_VERSION_3_2) {
>> +		u32 index, mask;
>> +
>> +		index = pin_out / 32;
>> +		mask = pin_out % 32;
> I get that you're moving around existing code, but would that
> not be equal to FIELD_GET() with GENMASK(31, 5) and GENMASK(4, 0)?
> Perhaps it'd be clearer to read. But don't worry about it in this
> series.

Yes it would, I took the best implementation of the two :-p

I will probably send a cleanup serie afterwards because there's some
cleanup to do all over the code.

Neil

> 
> Otherwise:
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad

