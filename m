Return-Path: <linux-arm-msm+bounces-2061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93D7F9E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBCE61C20DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 11:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6938618E32;
	Mon, 27 Nov 2023 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGm6aBoR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D358A185
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 03:14:06 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso5609939e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 03:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701083645; x=1701688445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmbmBmRRdKxpX6icnQb8EoGEatT9K1QsmoojXY70vRs=;
        b=qGm6aBoRhWoWlTCx9X4WyaoJPVaNWCCnY///vPFoQiim2v4caZ8nzvXMg91JGyJ71I
         B2nT76g9s41BdgMdVLqMvE5XVw2Mh5CTLFo2f4GJqlPyudDhPkPGwfGgZ1g65r57veQB
         DLZ9JiJDNBp/238wA0rZuutMncEZct6vcw7V6DJT1CjqeYaP9NK4i5CaYzVbcCmwqbLo
         f9MvsXjPSAPyFI+Lc0OLXtoG4bfoH+pJq/3+iJWd4kHG97RkaHLagldWRi7oqneNsqY6
         MscaxDxZlWAhWShn43Qn/Mzq/gRxxKOPyRGEQlP90QtMQTWZ7LGtwqLlzyVoRZQZP1OX
         Socw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701083645; x=1701688445;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UmbmBmRRdKxpX6icnQb8EoGEatT9K1QsmoojXY70vRs=;
        b=LUtFM9s2FWkVaV3GkbbcaR6yCz1A6a31znch2LC/Z2lL6v8Mw/gZetij2D0DAw24NB
         MlysGSTO1RcqvvaHdVE8w1m5oH+vqu5OgG/JXPgRPaQ421hnv4IzIO+ILOI/gAepuPTN
         B5g+kdjihuXS8spRNxNIBmkGN54ZsoWfd6P/BNXHdrXl/7vf4Ms/A/XeEbgbOh7WSZIf
         W8D6/SE+s3PfOB7g1hti+XWYCdcZ3HBJlRdG5bOSv6PrvlHwSdSIO56FRWPHZGZO9d1E
         9ZzbKdteLXlhy+00CCOtccdpHlfCte0iaJh+P6IE3FwcfyaIqWubl8rPQHKk/j47H/Rl
         0ZaQ==
X-Gm-Message-State: AOJu0YwH3Cg3JCoH7cBFRXqX+3m9+7msfaH8rAHj5HS8tFdJSympUTTa
	VB1VY7Ejt1avmpytLb7SF+GWjQ==
X-Google-Smtp-Source: AGHT+IFRj8knH6GfgaWHI+KGJP+wSNIDn1kOEjrcPBY5sjtNKeumJ0oOv2DOepgjLxkE14Mc3R1ELQ==
X-Received: by 2002:a05:6512:6c6:b0:503:fee:5849 with SMTP id u6-20020a05651206c600b005030fee5849mr10155461lff.53.1701083645039;
        Mon, 27 Nov 2023 03:14:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff? ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
        by smtp.gmail.com with ESMTPSA id s11-20020adfeccb000000b003316b38c625sm11715511wro.99.2023.11.27.03.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 03:14:04 -0800 (PST)
Message-ID: <9a6eb36d-fba7-4b8a-8571-4823720f7a27@linaro.org>
Date: Mon, 27 Nov 2023 12:14:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: enable IPA on sm8550
Content-Language: en-US, fr
To: Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org
Cc: mka@chromium.org, quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
 quic_jponduru@quicinc.com, quic_subashab@quicinc.com, elder@kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231124181718.915208-1-elder@linaro.org>
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
In-Reply-To: <20231124181718.915208-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2023 19:17, Alex Elder wrote:
> Add the basic DTS information for supporting IPA on the Qualcomm
> SM8550 SoC.  Enable IPA on the SM8550 QRD platform; GSI firmware is
> loaded by the AP in this case.
> 
> 					-Alex
> 
> Alex Elder (2):
>    arm64: dts: qcom: sm8550: add IPA information
>    arm64: dts: qcom: sm8550-qrd: enable IPA
> 
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  7 +++++
>   arch/arm64/boot/dts/qcom/sm8550.dtsi    | 39 +++++++++++++++++++++++++
>   2 files changed, 46 insertions(+)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

Thanks,
Neil

