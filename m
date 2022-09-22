Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55E865E5BCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 09:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiIVHFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 03:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiIVHFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 03:05:45 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650DBB72B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:05:43 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id p5so9786326ljc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Y8T+rgCLvbEN+WeN/wV06ekzw8aNybyo9Cr933g/thc=;
        b=PRwS4EvB12v+rkGdwNVdlMLqAgVT+QiU52+kqqCtnAX4fThsHK1wiNaT2jYDt8pR7K
         DsUuvhKEiWW2nTL68D8Mp8gtKcZ8YPRVCXPREfUbLwp+tcccKIUG8XR7yXba/V2tGbU9
         miVdHY2V1AsbAwXiEQuN9XFYAlZqKS6aj6VmKqh9P1OYNVokSIrG/F2tI/baVgJ7AhaP
         D9wQUOzAdt6RjkyMHZQfy3mm0+lrsPkpuONisuFht0kQk3izosEkS4cwPYcXMRh4tXZs
         WBrKAeVM5Rwc0tFvSyLByRuvV5QSEmxq7hNTif2aJ6WLuK/yI0BdvuCwhws3mXmY2PjC
         9Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Y8T+rgCLvbEN+WeN/wV06ekzw8aNybyo9Cr933g/thc=;
        b=KKWRt2Nvr9qlzZZl8bHe/xm5j5IqVpkefeP0/cmFms2E78X79c0KLjSamnwFeUVV82
         drZC9UbV1sYKDhdCBNxvO3Iqbe48v7zpSz4V3SCHdpdras52pXBb7NWBXTOv047Oq+lc
         fUUcpFFxS1ymSUzm+RYhGFs09IHKaq/20zUgPymfh1yemD5gEthQ55/bikrhYcEmUftn
         bDe214tgvFhUO4ToU24SyGGbgkhsFRU6TYzL7Z1JYYEWC/SylLJmYiWFlczPuyBo88vT
         CsmOn+3qINN67uXkmegspGXy34ohnwNMvTVPNdFTD+W3WuOYZRX7R1rTKCp7hGcnps2E
         S35g==
X-Gm-Message-State: ACrzQf2Z0FYYfLlMf8KyyOpLRnXfRXSG4XdYfeXg/27HbVUnMguAvvUT
        9JvCROhCQwM6HD0dDAuuBtYHJw==
X-Google-Smtp-Source: AMsMyM4vAPpJFJDThr0SWQMffyaNAZzsYUD4b943d8K2YixFXmOh73l/deLZmkGyJnJrbcLPijtecw==
X-Received: by 2002:a05:651c:1546:b0:26c:61c6:d053 with SMTP id y6-20020a05651c154600b0026c61c6d053mr603586ljp.218.1663830341671;
        Thu, 22 Sep 2022 00:05:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r17-20020a2e8e31000000b0026c687f9f7bsm491417ljk.107.2022.09.22.00.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:05:41 -0700 (PDT)
Message-ID: <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
Date:   Thu, 22 Sep 2022 09:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
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
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
>  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>  6 files changed, 111 insertions(+), 218 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> index 200eeace1c71..67791dbc3b5d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -14,20 +14,13 @@ description: |
>    sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>    bindings of MDSS and DPU are mentioned for MSM8998 target.
>  

missing allOf

> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
>  properties:
Best regards,
Krzysztof

