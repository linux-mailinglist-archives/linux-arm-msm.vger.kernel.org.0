Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8714C042B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 22:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235894AbiBVVyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 16:54:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbiBVVyp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 16:54:45 -0500
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7604BA1BC0;
        Tue, 22 Feb 2022 13:54:19 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id j7-20020a4ad6c7000000b0031c690e4123so10505017oot.11;
        Tue, 22 Feb 2022 13:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/fswJzUEDkCYZUBest3dcpOg2Q5z120D3pTqYi+RKE=;
        b=d5myjFVnnDnsew0St5QVAzQuSIsFD8DhOmHGPTIK5Ji25ByCR29B2Q/CniUfeeok7O
         l4m2x6e+qOEt2lZpibogNor4tNKE3ZrpMCaOOpP7/Em3Sg8se6g4jFHm+KxOqy0SOcF9
         Mffgdcf3q15ndKO2MdRwrB/bKqER6SAyd3Rcx2zIl7drkcqSZtb4kLmQgB7VaA73dp86
         hpCqf6yHDCA5QsoBOPME6I7o5Zf1no+sN5g51/2tgoGfDvTJvDPP+e/HthOoWMMUILMi
         9tv3YOxlgjCeBDH2l4FPrnDe58jSNovkOYf+kCQmp2k3HMzaxcz3+f2ewlOqqCL8z3J+
         EyeQ==
X-Gm-Message-State: AOAM531uJk6Q5aheyf9hw3ql0gevmrVWtH1Oj8fQp3g01nnkgrTaSyfo
        fqG7WaXGG0oxUP5MmY8k0g==
X-Google-Smtp-Source: ABdhPJzn+fP7rFhHV2awMmAZS6Y/PbNN9AVIOEBNbdAYP4d8fs58Cc9AtHpwNE+aGYlGkIX1kjq/kQ==
X-Received: by 2002:a05:6820:827:b0:31c:923f:bced with SMTP id bg39-20020a056820082700b0031c923fbcedmr2713380oob.79.1645566858755;
        Tue, 22 Feb 2022 13:54:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n18sm7888084otr.48.2022.02.22.13.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 13:54:18 -0800 (PST)
Received: (nullmailer pid 3655791 invoked by uid 1000);
        Tue, 22 Feb 2022 21:54:17 -0000
Date:   Tue, 22 Feb 2022 15:54:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        robdclark@gmail.com
Subject: Re: [PATCH v2 3/3] dt-bindings: msm/dsi: Add qcm2290 dsi controller
 binding
Message-ID: <YhVbidYOF2n4aqjl@robh.at.kernel.org>
References: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
 <1644853060-12222-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644853060-12222-3-git-send-email-loic.poulain@linaro.org>
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

On Mon, 14 Feb 2022 16:37:40 +0100, Loic Poulain wrote:
> Add DSI block specific qcm2290 compatible string as valid
> Qualcomm DSI controller.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
> 
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml         | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
