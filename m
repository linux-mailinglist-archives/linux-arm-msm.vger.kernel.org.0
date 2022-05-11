Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C92523683
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 17:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbiEKPBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 11:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245305AbiEKPA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 11:00:59 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DB25F83;
        Wed, 11 May 2022 08:00:57 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-ed9a75c453so3088574fac.11;
        Wed, 11 May 2022 08:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vBTrUV1JVs542plxfiXyvT5BXPWLoJzHzGRMGx1WPJY=;
        b=6JYTgOIP0hsnrI8FXQYty/BhzJtk9S5uKu5zWs30TCZ9bt3OGZrkTYSy1K7NQAPND+
         6ze1KOz+SXTC/sA8J59AO/dd3PVBSVnXc4gVeDxgn4t3uBsNc9Zamq+ERYnYinAHH42h
         Z9SWCTAmFuzi8mwjN/gfZ43kLi3KNsRwr29AKzomZQ1bGJM2Z56vBwKol8d+3CQcRx2K
         eFjYjheCD5/Ep1x/RD5jX0Cvw2UJqQiYyOa0Y9w9tqEGO4w4DhyzfBVD3BcLHbg7gOST
         Sgsr4SLaL3Ia9f9AmL/0fRPYTang4PxNMug6CZixBcl7Qgsy1Pzy+Qj5VzuekfV5g/NK
         wOWA==
X-Gm-Message-State: AOAM532qpz1J0gQYxaxe08pLa8badXseNbQIfWPGiWZfhCRJQ657pi0u
        CiT8RPX3Ig+InLsYUdLo6Q==
X-Google-Smtp-Source: ABdhPJxUMkdBpn8c5m5HjGueLUxw+LXyBeQTusye1isd9tLanUxiMmZsorwNzC3AQJcEgc6ftiQEhA==
X-Received: by 2002:a05:6870:4284:b0:e6:26d2:9fdf with SMTP id y4-20020a056870428400b000e626d29fdfmr2864914oah.107.1652281256708;
        Wed, 11 May 2022 08:00:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n84-20020acaef57000000b00326a7d33635sm812208oih.27.2022.05.11.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 08:00:56 -0700 (PDT)
Received: (nullmailer pid 305854 invoked by uid 1000);
        Wed, 11 May 2022 15:00:55 -0000
Date:   Wed, 11 May 2022 10:00:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
Message-ID: <20220511150055.GA305799-robh@kernel.org>
References: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
 <20220509090059.4140941-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509090059.4140941-2-vladimir.zapolskiy@linaro.org>
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

On Mon, 09 May 2022 12:00:58 +0300, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v4 to v5:
> * fixed a typo in a usage example found in the yaml file.
> 
> Changes from v3 to v4:
> * renamed a filename in $id value after the rename of the file itself.
> 
> Changes from v2 to v3:
> * renamed files to match the compatible value "qcom,sm8450-camcc",
> * fixed a typo in a usage example found in the yaml file.
> 
> Changes from v1 to v2:
> * updated qcom,camcc-sm8450.yaml according to review comments from Rob,
> * changed qcom,camcc-sm8450.h license to dual one.
> 
>  .../bindings/clock/qcom,sm8450-camcc.yaml     |  89 ++++++++++
>  include/dt-bindings/clock/qcom,sm8450-camcc.h | 159 ++++++++++++++++++
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
