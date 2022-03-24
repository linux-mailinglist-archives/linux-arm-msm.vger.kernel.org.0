Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D75F74E64E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 15:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348871AbiCXOTT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbiCXOTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 10:19:18 -0400
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0AF237F1;
        Thu, 24 Mar 2022 07:17:47 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id j15so9431168eje.9;
        Thu, 24 Mar 2022 07:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uAr2LmhOnG9njQ3xLzX6xb3TsAHcFF9ng+jWbhHfouU=;
        b=1td0jCJ5mrYX8rEKJVqtLwHUKlRnIOrgsNh5muhAF0NMDn8PVzf6PdgdplUz+FkdNm
         Hcn21cKQ5VFbHcbXmYUY0F5pDqBb0VwTtyH9ZwhWn2V25WJVOu4hp/Zb6Qs2VOkr2z5q
         bWgPuFnXyOfbpVT1BuJVWjmE7bLPqukkrT9ckHRAkCHQYN549/kAJuOJTrRyqYIz3aJX
         FP7QQgRy63/wFvEzMSqWImZD+dZfYcGruvzPIjf4AWTwWrYtjjoPIxe+yC4qXIngPKIa
         N8guMS8Z+r1Rif/1c6JDs0wtchlD/+ZIjvqXdyBE7H+PfdHO2JTQfqQjw5sUq5UrKETN
         j0Jg==
X-Gm-Message-State: AOAM532dH7knR/I1Y9nkOR+JRzWxu7W49HGAgo2dj9FcaXhEyLCOolZT
        eVNKK6qcgJFOZbZFeShjt2g=
X-Google-Smtp-Source: ABdhPJxxIzTIDlCaGLEv2LtBqkMu53tRhx3kR6Bbq/H21Vu7dtcvHnJzVijXpA0abZ88DVONT+kmTQ==
X-Received: by 2002:a17:907:6d2a:b0:6df:e513:5410 with SMTP id sa42-20020a1709076d2a00b006dfe5135410mr5920079ejc.544.1648131465364;
        Thu, 24 Mar 2022 07:17:45 -0700 (PDT)
Received: from [192.168.0.157] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id ks20-20020a170906f85400b006e091a0cf8bsm254970ejb.16.2022.03.24.07.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 07:17:44 -0700 (PDT)
Message-ID: <6616ccbe-2836-25f6-97e9-c4b25a0bab62@kernel.org>
Date:   Thu, 24 Mar 2022 15:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: display/msm: another fix for the dpu-qcm2290
 example
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2022 12:55, Dmitry Baryshkov wrote:
> Make dpu-qcm2290 example really follow the defined schema:
> - Drop qcom,mdss compatible. It's only used for MDP5 devices.
> - Change display controller name to display-controller as specified in
>   the yaml
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index d31483a78eab..6fb7e321f011 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -160,7 +160,7 @@ examples:
>      mdss: mdss@5e00000 {
>          #address-cells = <1>;
>          #size-cells = <1>;
> -        compatible = "qcom,qcm2290-mdss", "qcom,mdss";
> +        compatible = "qcom,qcm2290-mdss";

That's quite unfortunate choice of compatibles. I would assume qcom,mdss
is a generic fallback compatible but it is used in different way - as a
specific compatible for MDP v5. The bindings here are for a newer
device, right?

It's already in the bindings, so not much could be fixed now...

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
