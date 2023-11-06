Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05AB7E28F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 16:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjKFPpn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 10:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjKFPpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 10:45:42 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BCBFA
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 07:45:37 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-509109104e2so5985007e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699285535; x=1699890335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4zNa66tU9LDu4ntzAjdNZcWXIQRXUIkVKUhIyKqwfs=;
        b=PIzsxvDPqO5+vspd0rFkS0IMtMHfIucV1f+Tg+o2o032RTzfjAUhGeWImxf707m4ZP
         GvYF7wkHuasJ/KzNuDRBdyDm8FZhdAAgtMD6VQ8xtgXPaHBLz7fkEm2JJY09u7ydTmSd
         U1lg7OKegkhw3EUOISCe4bJa1snjxEjdupLqXazAmL+MtwSsWRD31IuKoouW+60GI1Qt
         JYQAFNRnTSfURHdsFeHazhmZvZX+ZQrtjXTGhROYUIENqfIvReDEMCucGxhqr2ch+ygK
         W1266Iy7WIxBkCiLUfxIbUHoC1E43bhaakioTHZbeDWSwDEprM/7kGryEV30CinMqU5P
         U60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699285535; x=1699890335;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j4zNa66tU9LDu4ntzAjdNZcWXIQRXUIkVKUhIyKqwfs=;
        b=mrcVNpDeMgWwKoL+9iRj+sZLl1G/JQkc4MQBsWud9gW1bB5jnIzEkyDv/r5Fkag3Ht
         upUOJBFU0VNcLdQNFORs5UCl7BiZOT0mxUK5UlRwF3a8B0cPV1Y1syy8xGdG6SJeQk5n
         kpF4BmrSxlZGeXf2hTJMphCtvjRt2YqQq+fz6qyYLzFTdIipxaF+sWMRtAe58YLN/ihu
         QJoWTGLVf/S60doG6jJUjnWjtu8/ivKOb9G2p1SZP8P+xmdDSNvYZO3QCiBkXXzvsQvN
         rzOQFaARJIfD3TbMfLKZA9yKOQ53zNhm3wLdCuxEBamv054oT0Os4tqhMK+LCpunhIor
         QyRA==
X-Gm-Message-State: AOJu0Yy0g4wAie9pneCPs59kELc4bhpB48yiznWy4sWLaoCPxzs2GLCp
        rkZGn7axAC/AU3QpYSFUPsMP1Jc+RpeNC5W7PUp4JA==
X-Google-Smtp-Source: AGHT+IEKrFLBL4eYJLlAb1eNsc/xpLwlEqxPzH/et4FbIUCOtrwSehAb36ib1E4knPd7s7Av6UgHSA==
X-Received: by 2002:a2e:8e94:0:b0:2c5:2133:a9fc with SMTP id z20-20020a2e8e94000000b002c52133a9fcmr22315017ljk.40.1699285535542;
        Mon, 06 Nov 2023 07:45:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7a54:34e:8001:fb7d? ([2a01:e0a:982:cbb0:7a54:34e:8001:fb7d])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c4f9400b00407efbc4361sm12735833wmq.9.2023.11.06.07.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 07:45:35 -0800 (PST)
Message-ID: <aaacd997-4b85-4086-982a-c992ad52831a@linaro.org>
Date:   Mon, 6 Nov 2023 16:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: Add reg bus and rotator
 interconnects
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
 <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
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
In-Reply-To: <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
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

Hi,

On 28/09/2023 13:35, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
> other connection paths:
> - a path that connects rotator block to the DDR.
> - a path that needs to be handled to ensure MDSS register access
>    functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
>    interconnect.
> 
> Describe these paths bindings to allow using them in device trees and in
> the driver
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index f69196e4cc76..6b4ce08a60dc 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -66,12 +66,14 @@ properties:
>       items:
>         - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
>         - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
>   
>     interconnect-names:
>       minItems: 1
>       items:
>         - const: mdp0-mem
>         - const: mdp1-mem
> +      - const: cpu-cfg
>   
>     resets:
>       items:

This is not enough, on sm8450 this still appears with patch applied:
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnects: [[182, 14, 0, 30, 3, 0], [182, 14, 0, 30, 3, 0], [53, 2, 3, 183, 14, 3]] is too long
         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#

This is also needed:
==========><================================
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 001b26e65301..e94e8630cc85 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -30,10 +30,10 @@ properties:
      maxItems: 1

    interconnects:
-    maxItems: 2
+    maxItems: 3

    interconnect-names:
-    maxItems: 2
+    maxItems: 3

  patternProperties:
    "^display-controller@[0-9a-f]+$":
==============================================

Thanks,
Neil
