Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79EC866859A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 22:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240679AbjALVia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 16:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240459AbjALVhh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 16:37:37 -0500
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959F010BE;
        Thu, 12 Jan 2023 13:30:08 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id d188so5197550oia.3;
        Thu, 12 Jan 2023 13:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGDJAlac5FfnEqlyVg+zh7XlFC4ayDXPYpMmXvUUmEs=;
        b=GW1ET40DgSqgRqVwQNJ2XdEBERJt49Ql3lELTp0PAr0CTMwrd1bZU7moIsTObsTyt2
         MYNBSSgBihfsiX0pIXiIVMDFvbOAbLBu1eJkXRKkx072RGt09vBlcDvKeTZHY1ON/KAd
         EPn7EHkG7Pbb+oQSIvgLrEqsc5cwkL1wpWTpMUSnSbEQ9/topfFjgsx+iHdVgKdskmaX
         2MKlUcCL5yzH942x9DbQ3XxdD1UHPLe5wZOwBT2oYN+fI87jhl/PR5dhNmgluabi506p
         NVEWUiOijbxHeiP9RGKZLNmFm3xZwy2t+MMRfk03upQ/SERauM0eU96onZ/3CNTnpK4B
         9QNQ==
X-Gm-Message-State: AFqh2kpYw3m+WojrnXvqcMYse/P/Oyr+Wa0Sq5QsuWvHPL5/uV31FL3V
        07xF9FXJXbphF+/yUF+8B9hGIs4BPQ==
X-Google-Smtp-Source: AMrXdXsulqDY06Wl7vya3HQU6RgXIwd3IU/V/n5L87+rA8ae+ZBcG9CaZ19DW/c0OBq6zHLD+ugKRA==
X-Received: by 2002:a05:6808:49a:b0:35e:cf1a:9cd0 with SMTP id z26-20020a056808049a00b0035ecf1a9cd0mr36993466oid.14.1673559007884;
        Thu, 12 Jan 2023 13:30:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t17-20020a0568080b3100b0035bd1909a66sm1092343oij.57.2023.01.12.13.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:30:07 -0800 (PST)
Received: (nullmailer pid 259006 invoked by uid 1000);
        Thu, 12 Jan 2023 21:30:06 -0000
Date:   Thu, 12 Jan 2023 15:30:06 -0600
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
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdss: fix HDMI PHY node
 names
Message-ID: <20230112213006.GA257510-robh@kernel.org>
References: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 09, 2023 at 06:54:53AM +0200, Dmitry Baryshkov wrote:
> On Qualcomm devices HDMI PHY node names were changed from hdmi-phy to
> phy. Follow this change.

Okay, but foo-phy is generally accepted...

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml          | 6 ------
>  1 file changed, 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
