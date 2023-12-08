Return-Path: <linux-arm-msm+bounces-3889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E79809DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68726B20AF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5CA5398;
	Fri,  8 Dec 2023 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BiLWDijD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741041722
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 00:04:55 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-334b2ffaa3eso1740989f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 00:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702022694; x=1702627494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6opCHd4WvW95nVFpdpf5Kniwie9yCSnn9rNT1ayHF4=;
        b=BiLWDijDyB12v4uWo1i1xwDx0dzq7EYdsht+2mLEARGy5bzfjx+4kIorazRHfHW6fc
         MleDM4XJP3plk3ffbKzjSvY92kFYcuyJZZb2M0p7KQYSDOE59Hfr0zMziOezG3vzQZku
         AWEPqL6l+mAR0Z6SahoSvDEyr+ocnRXhFV4IUqs9tmeIFV/39oUdsUXxjziJBOBEyP89
         iMCNXTwRxPxrGIJp/yCXuGeRiRf+6jlYSglIPsFp72ahYQ+t4pwcu/PU56KpXY+6Qk/g
         CM0C7ohFsNUTVwW30wRsdvgy1EW//PkKVQxLGOxwMgtEI6HFbPVoXgLWEEBNYR6lpOMK
         nbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702022694; x=1702627494;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W6opCHd4WvW95nVFpdpf5Kniwie9yCSnn9rNT1ayHF4=;
        b=FLVrUGEQkVDcAMVb8U6bXQ5GPcuwnhWcIPQLT3n3Him57IvQK1Cetk7ptT1M+SjpId
         X5fqSC/kTwS/V8rwtLOfKOpqn1rXv8OqWY/6zWRwzJYIPvJSwHZ2kKvUfCIRM5FKXF6w
         ft3ccjOMI5DIOzp0HAE9ssdeSzQPQQ/lS4YwPc8ThFnNXGD3W2z6xMq+8VU2Umh0E6o9
         8VRRHt1QvAFVuwS4HbCzCEcwH3BAxxr6PO9YaxYgNArjnBALSa/HomDsAOGu9by71N/a
         VVYI1ccybPiTom5DhP4GnTvjMhsqGmto6JGDl4tYeeypzwHYFCPF8h8TwR94S5l1lfZ7
         aQeA==
X-Gm-Message-State: AOJu0YxthRqIckcOXFRsWw4lZCZqbLhauPH7HoHrV1uMX7++cuqEgffK
	tge0mxN2ythGh/AW9z+9YXnpzw==
X-Google-Smtp-Source: AGHT+IHmlkQSTGIdaj/XYoVzkHzIRUMw65mFtmCq6OjLkwBWWk28yU4UzT6cw5mlygYMg5u76mq+0g==
X-Received: by 2002:a05:600c:b8d:b0:40c:3187:b022 with SMTP id fl13-20020a05600c0b8d00b0040c3187b022mr475893wmb.125.1702022693797;
        Fri, 08 Dec 2023 00:04:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ada:86ec:5358:ef2a? ([2a01:e0a:982:cbb0:8ada:86ec:5358:ef2a])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c450d00b00405c7591b09sm2042540wmo.35.2023.12.08.00.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 00:04:53 -0800 (PST)
Message-ID: <886193d7-2b27-4637-8af3-8358970f7419@linaro.org>
Date: Fri, 8 Dec 2023 09:04:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Add DisplayPort device
 nodes
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
 <20231207-topic-sm8650-upstream-dp-v1-3-b762c06965bb@linaro.org>
 <44c36d3f-dacd-4ca9-b92a-5febdc5d1340@linaro.org>
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
In-Reply-To: <44c36d3f-dacd-4ca9-b92a-5febdc5d1340@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/12/2023 20:47, Konrad Dybcio wrote:
> 
> 
> On 12/7/23 17:37, Neil Armstrong wrote:
>> Declare the displayport controller present on the Qualcomm SM8650 SoC
>> and connected to the USB3/DP Combo PHY.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> [...]
> 
>> +                clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> What about PIXEL1 clocks?

PIXEL1 is not defined yet in the bindings, but available since SM8150...

# grep -l PIXEL1 include/dt-bindings/ -R
include/dt-bindings/clock/qcom,dispcc-sm8350.h
include/dt-bindings/clock/qcom,sm8650-dispcc.h
include/dt-bindings/clock/qcom,dispcc-sm8250.h
include/dt-bindings/clock/qcom,sm8450-dispcc.h
include/dt-bindings/clock/qcom,sm8550-dispcc.h
include/dt-bindings/clock/qcom,dispcc-sdm845.h
include/dt-bindings/clock/qcom,dispcc-sm8150.h
include/dt-bindings/clock/qcom,dispcc-sc8280xp.h


> 
> [...]
> 
>> +                    opp-162000000 {
>> +                        opp-hz = /bits/ 64 <162000000>;
>> +                        required-opps = <&rpmhpd_opp_low_svs_d1>;
>> +                    };
>> +
>> +                    opp-270000000 {
>> +                        opp-hz = /bits/ 64 <270000000>;
>> +                        required-opps = <&rpmhpd_opp_low_svs>;
>> +                    };
>> +
>> +                    opp-540000000 {
>> +                        opp-hz = /bits/ 64 <540000000>;
>> +                        required-opps = <&rpmhpd_opp_svs_l1>;
>> +                    };
>> +
>> +                    opp-810000000 {
>> +                        opp-hz = /bits/ 64 <810000000>;
>> +                        required-opps = <&rpmhpd_opp_nom>;
>> +                    };
>> +                };
>> +            };
>>           };
>>           dispcc: clock-controller@af00000 {
>> @@ -2996,8 +3086,8 @@ dispcc: clock-controller@af00000 {
>>                    <&mdss_dsi0_phy 1>,
>>                    <&mdss_dsi1_phy 0>,
>>                    <&mdss_dsi1_phy 1>,
>> -                 <0>, /* dp0 */
>> -                 <0>,
>> +                 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +                 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>                    <0>, /* dp1 */
>>                    <0>,
>>                    <0>, /* dp2 */
> I noticed that this is not in line with your mdss patch [1]
> where there are only two DP INTFs available.. Unless all of
> these controllers can work using some sharing/only some at
> one time...

So, yes there's some more eDP PHYs and MDSS Interfaces, like SM8450 and SM8550 BTW,
but they are not used on the current SoC Packages, they will perhaps be used
in SoC variants, but for now there's clock inputs but no physical output
for those DP interfaces so they're ignored, in upstream and downstream.

$ grep -l -E "DPTX[1-3]" include/dt-bindings/clock/qcom,* -R
include/dt-bindings/clock/qcom,sm8450-dispcc.h
include/dt-bindings/clock/qcom,sm8550-dispcc.h
include/dt-bindings/clock/qcom,sm8650-dispcc.h

Neil

> 
> Konrad
> 
> [1] https://lore.kernel.org/all/20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org/


