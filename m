Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0550A620E14
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 12:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiKHLDr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 06:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233966AbiKHLDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 06:03:44 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D356D1275F
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 03:03:42 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g12so20719626lfh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bQVpwbAqUwvMZxArhzUm1x6Cngachlupk+1gKRPWrk=;
        b=HruJgZ9ZZvr/Iqxom+HIu2t27taQi9qozy/OZxN/xcvuaVCTl60h8WqfS2STUrXyKR
         uUdp1APaeZHg5S91WsuRHM1UggL+UdLcOUa/sldJJKKXDAQqAywITDeg+fBNm7b+oef1
         C9uP5hr2G+JorbIWcyWvnj710UpR/owDrv7FFnfzUMIoi1j8+VYvqCFRLMvfjaAny8OL
         BqGTXdXZN5Ak4SN3t2BtYMr3C0AtBuzZp9//74Sjw/bPp/xmVBe1K45OAx+2FO6uMisX
         ZoQTRVYxlWKPMVOh3XIlbjzJ1ntHQYJishIBxRfy4Lz92bMKcrqmJTOOpFy5l3IGm8oK
         xdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bQVpwbAqUwvMZxArhzUm1x6Cngachlupk+1gKRPWrk=;
        b=wnwaKEoBOJDjuzGILnzIxo2i31PeiruN5fJfbDVVa8V5enBtHSTWVn/TTvKALkD0bO
         no1zMcxduhhpo3hDwoGcD3TOyOtGV+Bz+N3autKrmizbY9NV94OEtLhTayP80tNkNvRu
         6vZDQsuSMOVZjWY5PPksCLFseEbe9oL7VZDAkHMRDHsUy+94tUyRYyvi8mPTW9EwTRDC
         TSRvHd40wIvLu/1b6tilRNpZD6SY6bD0bG90TT8ynFc5YooSGy9uOtm4q/t0Ts4YGeVf
         sCrrbRWw+f+fnG9UefWcTk/NuERiOR5MSzYQOH41RPDZe2KXGgzIawQyBho8jthXoMc1
         IPrg==
X-Gm-Message-State: ACrzQf3gcZw9suyxkB+lQf8Z5QFq0NL2MxkqBIF9qaCE8mndUokK7ogL
        Z3icLQgQ1SWmo0fJlV0Dx9RH4A==
X-Google-Smtp-Source: AMsMyM7YLNyTL/Qlmb+4TtANJeNNFqtIAuqgsICoq0pwzcmY7vaLTFigwtJrIkF5QT3PZlK0TrwphA==
X-Received: by 2002:a19:e34f:0:b0:4b0:6295:1887 with SMTP id c15-20020a19e34f000000b004b062951887mr17650810lfk.529.1667905421119;
        Tue, 08 Nov 2022 03:03:41 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id w13-20020ac2442d000000b004aa8cae6889sm1737878lfl.262.2022.11.08.03.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 03:03:40 -0800 (PST)
Message-ID: <1dd1dde8-b252-b594-48c6-3f4096ab9862@linaro.org>
Date:   Tue, 8 Nov 2022 12:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <20221024164225.3236654-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024164225.3236654-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 18:42, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 52 +++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 44 +---------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 39 +-------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 44 +---------------
>  6 files changed, 62 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..8ffbc30c6b7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,52 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU common properties
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  Common properties for QCom DPU display controller.
> +
> +properties:
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.
> +
> +    patternProperties:
> +      "^port@[0-9a-f]+$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    # at least one port is required
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

You do not have these properties here. Require only these properties
which are defined here.

Best regards,
Krzysztof

