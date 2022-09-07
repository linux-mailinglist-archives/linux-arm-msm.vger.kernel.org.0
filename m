Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 677105B0DA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiIGUAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiIGUAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:00:10 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E164BD2B;
        Wed,  7 Sep 2022 13:00:09 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-128121a9851so3378990fac.13;
        Wed, 07 Sep 2022 13:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ezjz3pR0ZD7JxS32x6H4PWVYd4DbErGzq0myuVFhl7k=;
        b=JurLEW8O+tN8t0lmeeO82CmahiwsSMpurD0WSUdSvj/qwYjT9FHboWgr8Tw20YGkvX
         aXi0UM3LX4U4SJBwY50pqcu7Eb+Nyp7BawD5Nca8ydop0WhrP23zfwqlOpS2Gk7CH4Sg
         98M299bDGkDys6XwRKROUCTtMSjFgNxwzR5e9R50P1uwQ6mYEVatSmQzfEaT44JjZyOW
         zjMTDNSPzn5BKmRwYT8AI4V2s+ZnK4Avi/jwgqD/RR37dr1v7t0ojnAymduNgWmms1GK
         mEJOYZuxSrYUOF01iI4Qe0mr43QoDHc4tRfMRB1NxR1JSOnFA0wh0dvflWpbxgPyT7f9
         fChQ==
X-Gm-Message-State: ACgBeo3UXuKOrAPkuxhaZN70ZVVO4B3dJnvLCUZY3909uIzUdfPLYlE+
        EWJd/NKd77rK9bksk8wUoA==
X-Google-Smtp-Source: AA6agR6mtZOVx+jt1TqJIGzVJ9zUjh/ebkpMh6FfEDDo2YrBSHibeAEp46mZ6ufVap+F8l2EmOwnIw==
X-Received: by 2002:aca:2810:0:b0:344:e898:35aa with SMTP id 16-20020aca2810000000b00344e89835aamr44380oix.279.1662580808956;
        Wed, 07 Sep 2022 13:00:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o84-20020acaf057000000b0034484c532c7sm6821240oih.32.2022.09.07.13.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:00:08 -0700 (PDT)
Received: (nullmailer pid 113022 invoked by uid 1000);
        Wed, 07 Sep 2022 20:00:07 -0000
Date:   Wed, 7 Sep 2022 15:00:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220907200007.GB98468-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 01:23:04PM +0300, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 44 ++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 46 ++-----------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 41 ++---------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 46 ++-----------------
>  6 files changed, 64 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..bf5764e9932b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,44 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties (common properties)

Qualcomm Display DPU common properties
