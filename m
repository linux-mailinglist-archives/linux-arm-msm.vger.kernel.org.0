Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D209570E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 01:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiGKXQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 19:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiGKXQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 19:16:42 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDFA8689D;
        Mon, 11 Jul 2022 16:16:40 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id e5so6377564iof.2;
        Mon, 11 Jul 2022 16:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZuF76X4YU6JvnI68syJ5Md9tmj3eXB8XjFf0wgCrB4Q=;
        b=I7DhB7psMn9Yb28a+1TG0Wfav0RqJHLqSvptuGjGqs8ph6D00A+/Dj46XkJQv6LZyW
         4dDY0MSOEoVr0LGkG7F/wTh9wqtP19VJrCPiOTI+AGLEF90zOOcwqld/oc985Xe23JVQ
         +2vfZgxweHrigiyHX2qjNXLHLflGOOko6gbywpdieH/0zfaiOt+WIcGKMLTsOCubhyQA
         9wI4N06SHIqIBMMBVkfz7IiEf1nC1V59L6ErPKDle1UhQBbDG6qJm+LgqcXb4mUXcVIm
         PLBNCjbRzSE74ue3fOhl9DJVuubbGruQ46AglSmtlqndtiPW1UZDfDqbaTOSGHL3b5Po
         8uoA==
X-Gm-Message-State: AJIora/xHr4FpP04s7MC6LhqGgN+jfgJjH4YwmJ3zI+sTEglpCttxrVL
        yGJnF4whXHLamTuL+GPGIA==
X-Google-Smtp-Source: AGRyM1sU451jGTNs+lIP9oT36bsvBr/mKWq8MTrg82xUx4ilv9OJhxoiFPZNt1ca/5UOJUxRv3rGeg==
X-Received: by 2002:a02:a890:0:b0:33f:22b8:cb0b with SMTP id l16-20020a02a890000000b0033f22b8cb0bmr12033107jam.136.1657581400017;
        Mon, 11 Jul 2022 16:16:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n2-20020a056638120200b0033ebf04f624sm3433362jas.152.2022.07.11.16.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 16:16:39 -0700 (PDT)
Received: (nullmailer pid 453057 invoked by uid 1000);
        Mon, 11 Jul 2022 23:16:38 -0000
Date:   Mon, 11 Jul 2022 17:16:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Message-ID: <20220711231638.GA449827-robh@kernel.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 10, 2022 at 11:41:32AM +0300, Dmitry Baryshkov wrote:
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 391910d91e43..52cbf00df0ba 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -70,9 +70,21 @@ properties:
>    operating-points-v2:
>      maxItems: 1
>  
> +  opp-table: true
> +
>    power-domains:
>      maxItems: 1
>  
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
> +  data-lanes:

But this is the wrong location for 'data-lanes'. It belongs in an 
endpoint node.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      maximum: 3
> +
>    "#sound-dai-cells":
>      const: 0
>  
> -- 
> 2.35.1
> 
> 
