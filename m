Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7B87E265B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 15:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjKFOMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 09:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbjKFOMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 09:12:34 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFC9191
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 06:12:30 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso28419995e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 06:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699279949; x=1699884749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UW8OyDjFKxtjol+dT9GLHS+Z/D3YkbAjmLVTJp/MhM=;
        b=ZDQrMPEk9LFGmfxjgGwcNOZ/THI7Ma2Xllez/1Br38mGefURgMViMwfqktIBf8Lqoo
         j6+KJNFWWSG3mUBpvpn/kkUax0IMJoIfuxpZQ6sZZ/rr02VGAVEeUOLaHNxGXvfG6uZO
         MKTjqk1mz9N9WbQrkCbBinPhimtBNIy7Zemo0zrIk7RwALlUflI+fCbt+ZlCiFFl8C77
         2F2soVYVniELqyObXfnmFalHv2/STkOoeZ+A7OX1wyI8IIRmTbJ3ayJClG4kFMWtWaPD
         vRbMma0XoI1+/OxELM4sCVa0gr9SVhe2Y94Ue8P2sb0mXtI6xHkc1YPt3kO3WyYGNih7
         /YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699279949; x=1699884749;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2UW8OyDjFKxtjol+dT9GLHS+Z/D3YkbAjmLVTJp/MhM=;
        b=tAfBo0hwyU51k/laivde18qe8Xn4RKSes0bEKUm77nbR0YEFGOH7zdIkBBP8Ho7DBV
         rIM6hBSP6k7A6tP464nHwuo0FU1MPOoRNy4fU618TsdKvy/khytdaRXjirSZW/YOy4Mt
         FYPgyRpZQ2vYuJWJ/fUk4nWvQ/RqX1rdxr8ZbdmVylCShBEF+xVwKHN7I6wXobV7dtaW
         3pnOxMPcBcr0X+Dr7Yab8chtShnvg37RwueorjFz/cQbTMh5zp9ddAvCz7kS3fEu1jy6
         sZJZyDU4yqJa0EkJes+t9fRMmXnXHD3w6W+lKMlQ3YMgw5fd1ym4QyS56u7Cee45aHHe
         J3Dg==
X-Gm-Message-State: AOJu0Yyni8L/Fv5nlNc3rpgIXYg8ZDBygkfgPYoDcQCJhl2Q9Rm/RkO/
        NhrU5o7RFm4133llRO2GIeAjCg==
X-Google-Smtp-Source: AGHT+IHGi1Jhsnzg62gOMi19F89UcfjyG0t2H2SyW3GrtqUMKA104ODJpGoIiUs8OdUxuyKurtyrzQ==
X-Received: by 2002:a05:600c:1c84:b0:401:b504:b6a0 with SMTP id k4-20020a05600c1c8400b00401b504b6a0mr22875441wms.3.1699279948941;
        Mon, 06 Nov 2023 06:12:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7a54:34e:8001:fb7d? ([2a01:e0a:982:cbb0:7a54:34e:8001:fb7d])
        by smtp.gmail.com with ESMTPSA id j6-20020adfea46000000b0032fc609c118sm6500108wrn.66.2023.11.06.06.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 06:12:28 -0800 (PST)
Message-ID: <1f9ff23e-51f0-47a7-82a6-d9709d52109c@linaro.org>
Date:   Mon, 6 Nov 2023 15:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [RESEND PATCH v2] dt-bindings: qcom,pdc: Add compatible for
 SM8550
Content-Language: en-US, fr
To:     Rob Herring <robh@kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20231103224304.764730-1-quic_eberman@quicinc.com>
 <169927974215.213488.494934081428498717.robh@kernel.org>
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
In-Reply-To: <169927974215.213488.494934081428498717.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 06/11/2023 15:10, Rob Herring wrote:
> 
> On Fri, 03 Nov 2023 15:43:03 -0700, Elliot Berman wrote:
>> From: Abel Vesa <abel.vesa@linaro.org>
>>
>> Document the compatible for SM8550 PDC.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> ---
>> I noticed this patch was never picked up while running make dtbs_check.
>> No changes since it was last sent except the trivial rebase that came
>> from me picking the change up.
>>
>> Original patch:
>> https://lore.kernel.org/lkml/20230127132558.1176730-1-abel.vesa@linaro.org/
>>
>>   .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> Applied, thanks!
> 

Thanks for applying, same problem will appear for sm8650,
do you think you can also pick it ?

https://lore.kernel.org/all/20231025-topic-sm8650-upstream-bindings-pdc-v1-1-42f62cc9858c@linaro.org/

Thanks,
Neil
