Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911F4348259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 20:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237992AbhCXT6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 15:58:55 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:38767 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238080AbhCXT63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 15:58:29 -0400
Received: by mail-io1-f50.google.com with SMTP id e8so22839821iok.5;
        Wed, 24 Mar 2021 12:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ckz74ZkgmnFeD8eQMB4UJB/Am1mTvPA8wYzxy5HDh8g=;
        b=kW+6JyfdpX3npOpH8Q1yUSwNEC55UisqWhoz8q7d7YfFuIA4xpfEvGocKDPjnLIqM5
         lUUZI1ZF4J3kB4TDbS2RT94Eg5CYlDM5OjGavk30Sf1b/nOo2iuGmhXSA8+OSdEoYt+7
         jbydmVA7yPZDZwoCWiK1WBv7x9EBhYRIB10akZYL/54HZdTNGQ7kpv8rNnksD2vvhMFJ
         I73aSvNqgDcm0EQ/gDMhogVGAFAFfvee3qncrY2WsJwjtcYOd4rttqZDZIO35QJM2EOY
         sUIHsMFt7pGiXBO2IB6KBiCcnDT56+nE1j/pEZw2nwnHsDp83q+pyr46LPIkNbcOg4t7
         XE6Q==
X-Gm-Message-State: AOAM532gUC6jQiVJpvB87slJSyjeozwiYUe10nya1Q2vasReQKXwjdWV
        LkvfTfZcNFYA1cY0hZuSkA==
X-Google-Smtp-Source: ABdhPJy1Icpeq/9CfPDN8APc8tPGVDrDk4uBbBlAilmuMzm4H8LSBAibB/0f7fhpZqajauZV/FGp6w==
X-Received: by 2002:a02:c002:: with SMTP id y2mr4449322jai.107.1616615908972;
        Wed, 24 Mar 2021 12:58:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z17sm1543306ilz.58.2021.03.24.12.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:58:27 -0700 (PDT)
Received: (nullmailer pid 3525447 invoked by uid 1000);
        Wed, 24 Mar 2021 19:58:24 -0000
Date:   Wed, 24 Mar 2021 13:58:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dt@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH] dt-bindings: msm: Couple of spelling fixes
Message-ID: <20210324195824.GA3523377@robh.at.kernel.org>
References: <20210320192553.29922-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320192553.29922-1-unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 21, 2021 at 12:55:53AM +0530, Bhaskar Chowdhury wrote:
> 
> s/Subsytem/Subsystem/
> s/contoller/controller/

Rather than worry about trivial fixes, please convert .txt bindings to 
DT schema instead.

> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26f60da..586e6eac5b08 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -2,14 +2,14 @@ Qualcomm Technologies, Inc. DPU KMS
> 
>  Description:
> 
> -Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> +Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>  sub-blocks like DPU display controller, DSI and DP interfaces etc.
>  The DPU display controller is found in SDM845 SoC.
> 
>  MDSS:
>  Required properties:
>  - compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> -- reg: physical base address and length of contoller's registers.
> +- reg: physical base address and length of controller's registers.
>  - reg-names: register region names. The following region is required:
>    * "mdss"
>  - power-domains: a power domain consumer specifier according to
> --
> 2.26.2
> 
