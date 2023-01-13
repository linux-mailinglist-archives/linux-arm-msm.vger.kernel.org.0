Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A4366A4CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjAMVIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjAMVIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:08:11 -0500
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E6C871F1;
        Fri, 13 Jan 2023 13:08:09 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id p17-20020a9d6951000000b00678306ceb94so12899808oto.5;
        Fri, 13 Jan 2023 13:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ACwV8GdlK5Pn0GPirboYIEragSvuKbdIfuMOvJXHSM=;
        b=nctiXKvOwuflX5gBAZVXjzd9H0CwaIi/NsCPdZ35Sz6cwMlZy+QCbst6HOKh0OFIQ4
         saBIxPuZDKGYAgsS+lNf4xeq5DSTCRXVfZilN3aZFSemuk4J8kjlwC9CZ8KtQ3BZRlme
         /fTP6crX7L9LmVdSkaj4GB32E0YsCIiwtz5m9OHN/fNgk/Rh0HWIjjt2RJr0AxcekCVW
         TM5H39ebERks4CB3/IflSbHCCdc/9ip4ucNfLHQ0/7Xze1MH2fLH0IKZU7swVB8YN402
         b4NOZU0/9y8oOKt/tpsi/A9hLF2fxlKLPghSAXMfAE/APSiUAsRub/6hlhacB9rVffkf
         2vAw==
X-Gm-Message-State: AFqh2koow+7dnCm7arh6fKI/I+coL4vnF9CxkT15BoO4hwK9ADMw/P1b
        eC2T1p7fn68TcUny0fOGyg==
X-Google-Smtp-Source: AMrXdXtOCyFNSTM7/jynGGVXcLk6sca17HjsYUlJ2g4cHUoMhCLJo9KZbNWVX4kBQpjW+02DAUFr1A==
X-Received: by 2002:a9d:7416:0:b0:66c:37a2:d87d with SMTP id n22-20020a9d7416000000b0066c37a2d87dmr5097303otk.26.1673644089136;
        Fri, 13 Jan 2023 13:08:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c26-20020a9d481a000000b006849e3aff8dsm6381829otf.44.2023.01.13.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:08:08 -0800 (PST)
Received: (nullmailer pid 2923605 invoked by uid 1000);
        Fri, 13 Jan 2023 21:08:07 -0000
Date:   Fri, 13 Jan 2023 15:08:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display/msm/dsi-phy: drop unused allOf
 clauses
Message-ID: <20230113210807.GA2901424-robh@kernel.org>
References: <20230113063351.24131-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113063351.24131-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 13, 2023 at 08:33:51AM +0200, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml          | 3 +--
>  .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml          | 3 +--
>  .../devicetree/bindings/display/msm/dsi-phy-20nm.yaml          | 3 +--
>  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +--
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 3 +--
>  5 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 3ec466c3ab38..71702151bafa 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -9,8 +9,7 @@ title: Qualcomm Display DSI 10nm PHY
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -allOf:
> -  - $ref: dsi-phy-common.yaml#
> +$ref: dsi-phy-common.yaml#

Convention is how it was. Partly this is legacy because earlier versions 
of json-schema required the 'allOf' form or everything in addition to 
the $ref would be ignored. I left these thinking more than 1 $ref here 
might be common. But probably more common is a $ref and if/then schemas 
and I'd somewhat rather keep $ref at the top and if/then schemas at the 
bottom. So maybe this is the right direction.

I don't really care to define one way or the other if we can't enforce 
it in the meta-schema. I don't need more nits to look for in reviews. 
Adding a check (i.e. allOf must have 2 or more entries) would be quite 
invasive and wouldn't allow having 1 entry when we expect a 2nd entry 
soonish.

Rob
