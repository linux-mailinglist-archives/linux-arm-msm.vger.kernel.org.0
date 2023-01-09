Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E630662AB6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 17:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235060AbjAIQAk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 11:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236518AbjAIQAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 11:00:08 -0500
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82983752E;
        Mon,  9 Jan 2023 08:00:07 -0800 (PST)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-14fb7fdb977so9032222fac.12;
        Mon, 09 Jan 2023 08:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmIlgEFtXavdJf8Lq/cH9FoF1zSgoXLLeAA66q8BH/Q=;
        b=QhF9+MF97Qin3wRXeeATzE45LAiiX8LDMR5ZTzkWWL6legA/PbiU0D9D0q7yP4GcHz
         DcPsPOnJTJTStyPnN8CIquZjUjgxtaQulMW1WOezA/b9f82d2V2UEzPemHoTGILmaO2E
         PNfugrphmkPA7jfnCR4NDcHomd0e81vkjyuelcxmGUlWnlwg8SQNOA9zjHjrgTd9WrQ1
         BLnUSBmuT7xD5UHVDEKK2pIsWnjn1wttkRJa+NjQyf15FV0WXQ689rQFcP/yqd5JX3ob
         q1TQ+hwkesEO7dAVbWo5SQafioMzCwxiqS6tBwViiHx6WxPRzro0ONXqlfAZbc0d+CuV
         6nQQ==
X-Gm-Message-State: AFqh2kopHx2ogiZMTpsTtip54FRvh23rjgwZCNtMMmhi/f1TMkaAzevY
        ZM3aIIJ0tL/hmoPq0xcBZg==
X-Google-Smtp-Source: AMrXdXuXJvBT3dt96q3KMmD15McdlaQh3O3qs1191wR2cMHTCinqo+Y5JobLAeehoewg+Ou02LotoQ==
X-Received: by 2002:a05:6871:891:b0:148:6804:e60c with SMTP id r17-20020a056871089100b001486804e60cmr37077630oaq.35.1673280006846;
        Mon, 09 Jan 2023 08:00:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h24-20020a056870171800b0014f9cc82421sm4366524oae.33.2023.01.09.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:00:06 -0800 (PST)
Received: (nullmailer pid 722135 invoked by uid 1000);
        Mon, 09 Jan 2023 16:00:05 -0000
Date:   Mon, 9 Jan 2023 10:00:05 -0600
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
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: rename mdss nodes to
 display-sybsystem
Message-ID: <20230109160005.GA721066-robh@kernel.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
 <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
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

On Mon, Jan 09, 2023 at 07:13:57AM +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdss nodes to
> display-subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index 59f17ac898aa..ccd7d6417523 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -15,7 +15,15 @@ description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller, DSI and DP interfaces etc.
>  
> +# Do not select this by default, otherwise it is also selected for qcom,mdss
> +# devices.

for NON qcom,mdss devices?

> +select:
> +  false

select: false

> +
>  properties:
> +  $nodename:
> +    pattern: "^display-subsystem@[0-9a-f]+$"
> +
>    reg:
>      maxItems: 1
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index c218c9172608..47fde9b6779f 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -15,6 +15,9 @@ description:
>    encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
>  
>  properties:
> +  $nodename:
> +    pattern: "^display-subsystem@[0-9a-f]+$"
> +
>    compatible:
>      enum:
>        - qcom,mdss
> @@ -153,7 +156,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    mdss@1a00000 {
> +    display-subsystem@1a00000 {
>          compatible = "qcom,mdss";
>          reg = <0x1a00000 0x1000>,
>                <0x1ac8000 0x3000>;
> -- 
> 2.39.0
> 
> 
