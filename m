Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5965B2113AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 21:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgGATjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 15:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgGATjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 15:39:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15328C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 12:39:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so3757667ljn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 12:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uZLgRyeqLIrejgbskRWtUMI2dY4YQCIX+GY0py5r3AA=;
        b=S69Z6hVz4wBbcWfEPDTLxOfydDlRKVUspZAmALfKiePq4efP4D6Zy/HnkTrZixiCmy
         Ot40/jExbO/G56aM0fEZsfzeJIC3kCvsxrM7MHZqzW1HJEEA5UTAiUuuECa6C9aUljR+
         zCe1fEdW+aHQAlQoaCXz6DY9c4jxfT6LcKyQivUp/xGtatGLTUNnwj6aAa/FWUWiG9K1
         bWQfTOvQY0EpekmLmMomA0vYwaXO07Hu72AKOO1B90d4yUJX1W3dMZUDfX17J7iVY1pG
         fllXRQrJrjqemB9c2daT5zN3LzqeuPJW/vRph40oc5de9fK+rU2K+xUO9rJc4nLbCpB6
         ZJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uZLgRyeqLIrejgbskRWtUMI2dY4YQCIX+GY0py5r3AA=;
        b=Lgun9b2h7t8lHx5B9wIWkq0eZV+BlzE7tNBqHdOsvAgRY7bwTok4/376HoGXIaP8gF
         Qx6liEYSj5z6JVOkPId1edybVRD8YJMF5Z9H2PEOOlotT5dBi/JB8wr64tbAW4DG7cJr
         +pCULfVasQb6WvAMXoMkKrC3NgvGx8mKzFXYicKCI3AHs4jjTYysQHVAfXNgfEpSo6XG
         L9Yaj9IGjTaPEg7Qtewq3/13XG6wZqa3wFDevqGq4hG1ji2R3Y7iW4ORAeAbmJsf+ir4
         EQrPt2T4Y/jBL8XxvqltwgowvMF+VL84EDv8hGazTOyGDESy5VIng1J1ogE/Fko5WqdH
         82wQ==
X-Gm-Message-State: AOAM531GFnqEL4glBb95foEq2taiQYgLYnlF8E18W8+LQo7Vhuc+bsOm
        kxZlR1LH8Xh5MjMSsyia7gc4hQ==
X-Google-Smtp-Source: ABdhPJznwKrMubCqqzSMTK6VHjJjbQbSK8SWzIJNnS6XVefIEXAhs3wc0iBxGIMfRySbgrsw6uZjLQ==
X-Received: by 2002:a2e:b4ce:: with SMTP id r14mr5133513ljm.88.1593632359481;
        Wed, 01 Jul 2020 12:39:19 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.65.203])
        by smtp.gmail.com with ESMTPSA id y24sm2126434ljy.91.2020.07.01.12.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 12:39:18 -0700 (PDT)
Subject: Re: [PATCH v2 07/13] dt-bindings: clock: Introduce SM8250 QCOM
 Graphics clock bindings
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200629172049.30452-1-jonathan@marek.ca>
 <20200629172049.30452-8-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <caa05cad-ff88-fbcb-ce13-9e43133afb7b@linaro.org>
Date:   Wed, 1 Jul 2020 22:39:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629172049.30452-8-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/06/2020 20:20, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8250 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   .../bindings/clock/qcom,sm8250-gpucc.yaml     | 74 +++++++++++++++++++
>   include/dt-bindings/clock/qcom,gpucc-sm8250.h | 40 ++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
>   create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
> new file mode 100644
> index 000000000000..2b9c8f97b76d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8250-gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller Binding for SM8250
> +
> +maintainers:
> +  -
> +
> +description: |
> +  Qualcomm graphics clock control module which supports the clocks, resets and
> +  power domains on SM8250.
> +
> +  See also dt-bindings/clock/qcom,gpucc-sm8250.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-gpucc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 main branch source
> +      - description: GPLL0 div branch source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: gcc_gpu_gpll0_clk_src
> +      - const: gcc_gpu_gpll0_div_clk_src

Missing qdss_qmp_clk here.

> +
> +  '#clock-cells':
> +    const: 1
> +



-- 
With best wishes
Dmitry
