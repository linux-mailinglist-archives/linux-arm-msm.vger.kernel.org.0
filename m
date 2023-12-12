Return-Path: <linux-arm-msm+bounces-4452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC280F682
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 20:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23FA9281FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 19:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0917681E36;
	Tue, 12 Dec 2023 19:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqW+x99T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D0CAD
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 11:21:44 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c4846847eso23896925e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 11:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702408903; x=1703013703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umUMg8BrauQqL1p4Yx4u2IynFqr2rPCz5Y0+oad9/5A=;
        b=eqW+x99T0KuolBrcizi9zlPxeuQPIFYK02cLb9iaujZ/uuZ5AZpU2kR88amoafzmA7
         BvQdjjld1qzucRwHbVlDMJlnqrn4zk7nVs2L5yE3L+AJxlzJzIvb0J3BnRnRZIf1p1Zx
         KCSReO57W8WYKteChNJBSDcgsA4qvNhnEnej/LSHgyBkRIihfozmA95/vMGBfy0rCak1
         SgxHULUe/FKJz3THKZeLBKmF0xwXEz6JJetu4VhH1mMLgfWVP+u4+lmyiNoCcL8wv5dI
         22CZmXfg8S+UNDWOjcwUUWxA3Z/+qiWAnrLC185yZJjD7ykPaQ+xvZdsNeTLVheBabnx
         yHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702408903; x=1703013703;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=umUMg8BrauQqL1p4Yx4u2IynFqr2rPCz5Y0+oad9/5A=;
        b=MtEt/9R889G23eQj0CGe9rf+REvRr7KiQnSMcEfHheC7zqfTSI/mXJtHwKlUp7yLWe
         ShuZEIPO9vmYHLnO5eV4wu3tg40W+rCFsUufW0yNVqHRX2828MvyN4xPYemNN4+dEGhl
         2RJExK/Xk9hbWTvIZiAs5qmplHUiS1LqlFHvoFoGCJ7LUKaGQz5PQ5XDqfTS4vsZwIEN
         guHErfFIhIymY0kKb0ave7pdr4cE2erl/gnRLKBs0UzautWIJoSkEhKHgbj1EFDFIMdn
         7dwifCcxJ0nQ8Z7LT+og0O8gNVksmzbbesQYVmlQcW+VkJuvH1GgxpRc0L2K0Q2JUgA8
         amMg==
X-Gm-Message-State: AOJu0YzYraV/Fuvp1qZ0eTWfrkfESAdx0/vEyKbd2CEZFORMUa7UCxTR
	z6SzIekTkQhv2JSSNu6/v1xUyMPc4vES1xGgbbQQOS+j
X-Google-Smtp-Source: AGHT+IHOpNYLk/niT+UHxBHpm9cf053siWF8dCfESMTse3qUqYYB6ibasMV3ihVnvRAr9vU6ktB3cg==
X-Received: by 2002:a05:600c:c1:b0:40c:2aeb:a7ca with SMTP id u1-20020a05600c00c100b0040c2aeba7camr3115859wmm.57.1702408902998;
        Tue, 12 Dec 2023 11:21:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:92fc:7790:1480:63bf? ([2a01:e0a:982:cbb0:92fc:7790:1480:63bf])
        by smtp.gmail.com with ESMTPSA id b1-20020a05600c4e0100b00405959469afsm17722407wmq.3.2023.12.12.11.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 11:21:42 -0800 (PST)
Message-ID: <cea465e6-ff24-4552-b4f6-a0594ea9ea6c@linaro.org>
Date: Tue, 12 Dec 2023 20:21:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] soc: qcom: pmic_pdcharger_ulog: Search current
 directory for headers
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
 <20231205-pmicpdcharger-ulog-fixups-v1-1-71c95162cb84@redhat.com>
 <320864f5-fdd2-4345-a0dd-b97bcf17f473@linaro.org>
 <k77ayy4xwlnghjefvw3yl4aenwyq272pezjaazx65bvdle37et@5fnbae4fxnjz>
 <zwzpbhcb4ggs3kdf72jvjlpe5cpa26vbjs6qw4nyedhcgwcrza@67in3h243yyx>
 <139f9af0-ca6a-4a58-ae18-79ef6fac47e3@linaro.org>
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
In-Reply-To: <139f9af0-ca6a-4a58-ae18-79ef6fac47e3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/2023 17:52, Neil Armstrong wrote:
> On 12/12/2023 17:15, Andrew Halaney wrote:
>> On Tue, Dec 12, 2023 at 09:54:48AM -0600, Andrew Halaney wrote:
>>> On Tue, Dec 12, 2023 at 04:23:20PM +0100, Neil Armstrong wrote:
>>>> Hi Andrew,
>>>>
>>>> On 06/12/2023 00:05, Andrew Halaney wrote:
>>>>> As specified in samples/trace_events/Makefile:
>>>>>
>>>>>       If you include a trace header outside of include/trace/events
>>>>>       then the file that does the #define CREATE_TRACE_POINTS must
>>>>>       have that tracer file in its main search path. This is because
>>>>>       define_trace.h will include it, and must be able to find it from
>>>>>       the include/trace directory.
>>>>>
>>>>> Without this the following compilation error is seen:
>>>>>
>>>>>         CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
>>>>>       In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
>>>>>                        from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
>>>>>       ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
>>>>>          95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>>>>>             |                                          ^
>>>>>       compilation terminated.
>>>>
>>>> I never experienced such error, and no CI even reported it, can you explain how you got this ?
>>>
>>> To be honest, I am unsure why I'm experiencing this (and until I saw
>>> another thread about it today I thought maybe I had screwed something
>>> up!).
>>>
>>> I just took it as an opportunity to try and read up on the tracing
>>> infrastructure and sent this series. Definitely no expertise with the
>>> in's and out's of tracing :)
>>>
>>> I'm able to reproduce this on next-20231211:
>>>
>>>      ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make mrproper
>>>      <snip>
>>>      ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make defconfig
>>>      <snip>
>>>      *** Default configuration is based on 'defconfig'
>>>      #
>>>      # configuration written to .config
>>>      #
>>
>> Realized I missed a step, actually enabling tracing and the driver at
>> play here... but the result is the same.
>>
>> Attached is a config where I hit this.
>>
>>>      130 ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make drivers/soc/qcom/pmic_pdcharger_ulog.o
>>>        HOSTCC  scripts/dtc/dtc.o
>>>      <snip>
>>>        CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
>>>      In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
>>>              from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
>>>      ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
>>>         95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>>>      <snip>
>>>      2 ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] %
>>>
>>> I even tried it in a fedora container with the above build commands and
>>> the following podman invocation (plus some package installs) and saw the error:
>>>
>>>      podman run -it -v ~/git/linux-next:/linux-next:z quay.io/fedora/fedora:latest /bin/bash
>>>
>>> So I'm unsure if it's a fedora package version thing (which I'm running on my host)
>>> or something else... Once I saw it was sort of spelled out in the
>>> examples I referenced here I just decided it was something needed
>>> fixing, regardless of why I'm hitting it while others seem ok.
> 
> Interesting, I don't get the problem with the same tag, same .config but with gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu
> 
> I'll try with gcc 13.

Ok tried with ARM's arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu (https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads),
and no error, and I even tried with https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/13.2.0/ and same no error...

Neil

> 
> Neil
> 
>>>
>>>>
>>>> Thanks,
>>>> Neil
>>>>
>>>>>
>>>>> Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
>>>>> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
>>>>> ---
>>>>>    drivers/soc/qcom/Makefile | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>>>>> index 110108e23669..05b3d54e8dc9 100644
>>>>> --- a/drivers/soc/qcom/Makefile
>>>>> +++ b/drivers/soc/qcom/Makefile
>>>>> @@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_PDR_HELPERS)    += pdr_interface.o
>>>>>    obj-$(CONFIG_QCOM_PMIC_GLINK)    += pmic_glink.o
>>>>>    obj-$(CONFIG_QCOM_PMIC_GLINK)    += pmic_glink_altmode.o
>>>>>    obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)    += pmic_pdcharger_ulog.o
>>>>> +CFLAGS_pmic_pdcharger_ulog.o    :=  -I$(src)
>>>>>    obj-$(CONFIG_QCOM_QMI_HELPERS)    += qmi_helpers.o
>>>>>    qmi_helpers-y    += qmi_encdec.o qmi_interface.o
>>>>>    obj-$(CONFIG_QCOM_RAMP_CTRL)    += ramp_controller.o
>>>>>
>>>>
> 


