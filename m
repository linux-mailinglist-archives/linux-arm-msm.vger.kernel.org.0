Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92867DF09F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Nov 2023 11:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345942AbjKBKyy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Nov 2023 06:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346098AbjKBKyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Nov 2023 06:54:54 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373EDE7
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Nov 2023 03:54:48 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c50906f941so11016961fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Nov 2023 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698922486; x=1699527286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piXqh6med7lV1eaz1Jju4bjZkrBzVnMssp83vd2Cu+Y=;
        b=ViMdUV88vVbKfqvO2sbqCQdZauWcM4vG/eFkPHzj0F1ySGp0GxDdSLp4CRjSKsPdIh
         kG1fOFHMo6z8UcOhtIc4STMJ0tOXpsXiWkxZKGp8eHG8tgtJoatmce3e+q711oxDXi18
         X+Di/+44x7N2u7P1AMZ+FN8VbbAQ/mPwip+nWUEvL8lNbubCIIMo6oRVJUimmAUEx8ZL
         pfAp1ImaBvgtW4LU4CAJPrtqfgLKB8EPCw5IBvphJRxFLceeHlqhubRO47A1cSxKPujN
         tsbVooHD3OPRjyGgf8O58Z1EeAfgkBxQi6jthIAK+snG91BseV2iwQIYxz6x5RCLn7g7
         YwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698922486; x=1699527286;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=piXqh6med7lV1eaz1Jju4bjZkrBzVnMssp83vd2Cu+Y=;
        b=l88wSpQ9bWDIEyWekwj53EA+5TxwoaGa5wo/xcz7yr5zqJqBeRX98L+30+SNplAFLr
         W5NUWijxRZcQZdTs4UUTpioBuqh1Ohz1Q/WC99amkhom6HGfIPBPpYAJewxUtbuOPUe/
         71mBoNqj68Dm8dUgDoZT839zweWuwEx9hUkT+Dk2103rh461AxNfJXCdyCDJ7Sz2lvy5
         yVfsGCk/5Oh6YAt3Uoj4lNYoFuume0CjHd6gDVWm1c17V55rey1BvxmljRRkpaz6+AOK
         yhmXg4qDYbANE03pk2hrFVOzXa1ay9Pp3RHgrCVS7+/cueDvgrzzf7gZ2h3NZsot8CxU
         ThiA==
X-Gm-Message-State: AOJu0YwYwESsRd19KMsV7pC07dwPJaQT6yBioY58oO89BBvF4KJY0AGQ
        5TzGO0aWB7ZPuiaIlLWB8K9ikg==
X-Google-Smtp-Source: AGHT+IEMHtTKlX2B6Bh7BKcLi48ztvax40b3xL24ImYFyWLI40g2EHksyHfmMYFC/HC8+aNhcn1Rfg==
X-Received: by 2002:a05:651c:200c:b0:2c5:2d7:412 with SMTP id s12-20020a05651c200c00b002c502d70412mr12168960ljo.19.1698922486291;
        Thu, 02 Nov 2023 03:54:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4ac1:f109:811c:51be? ([2a01:e0a:982:cbb0:4ac1:f109:811c:51be])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b0040596352951sm2555261wmb.5.2023.11.02.03.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 03:54:45 -0700 (PDT)
Message-ID: <e86fa7b4-635c-4fd5-9b3c-ade96ddf5c0f@linaro.org>
Date:   Thu, 2 Nov 2023 11:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 2/8] arm64: dts: qcom: add initial SM8650 dtsi
Content-Language: en-US, fr
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-dt-v1-0-a821712af62f@linaro.org>
 <20231025-topic-sm8650-upstream-dt-v1-2-a821712af62f@linaro.org>
 <691f1781-906c-411f-90f6-e1cc71062253@linaro.org>
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
In-Reply-To: <691f1781-906c-411f-90f6-e1cc71062253@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/10/2023 11:01, Konrad Dybcio wrote:
> 
> 
> On 10/25/23 09:47, Neil Armstrong wrote:
>> Add initial DTSI for the Qualcomm SM8650 platform,
>> only contains nodes which doesn't depend on interconnect.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---[...]
> 
>> +            CLUSTER_SLEEP_1: cluster-sleep-1 {
>> +                compatible = "domain-idle-state";
>> +                arm,psci-suspend-param = <0x4100c344>;
> I think this parameter signals the AOSS to attempt system
> suspend and CLUSTER_SLEEP is a shallower, separate state.

OK, so downstream call this state "APSS_OFF" and the other state
calling 0x41000044 "CLUSTER_PWR_DN"

On sm8[345]0 and qdu1000/sm4450 there's both states called CLUSTER_SLEEP_0 and CLUSTER_SLEEP_1,
and referenced into CLUSTER_PD cluster power domain.

I assume this is the same as SM8550, so what's the issue ?

> 
> [...]
>> +            qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
>> +                      <WAKE_TCS      2>, <CONTROL_TCS   0>;
> Is <CONTROL_TCS 0> the correct value?

Yes it's the right value.

> 
> I think it looks good otherwise
> 
> Konrad

Thanks,
Neil

