Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70FB4150A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 21:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237231AbhIVTsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 15:48:45 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:35605 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237222AbhIVTsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 15:48:45 -0400
Received: by mail-ot1-f48.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so5200807otj.2;
        Wed, 22 Sep 2021 12:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=myTJLV9zsG1rotdSXj4TizWpiAcw50ZCHhmQAOdwguA=;
        b=eGNyCJmB0NeZMjPSbWgqbcyXEsutDwc/Wh13JyXbkuw9ejfhIkBZ8rTP0m4ulYz68H
         AgEIisypySX0YAODbJ0lD+ELSntsCxMpHp4DZ6/2gMr2ICpHnc7IyzU6fAQQz/1vifcw
         xXJc8aFMRvPfiAk/QFwPr3nJrP5xAyj9NPHUpWMLjQRgbQSP4hCPX8rMK+wbiv79uacN
         bsZhAFg9xbQoa/FsGjr6znxKeqn39Bocnl1wGR9EPlu/I8feBaAhcCnrcJ12EaICCbrD
         3jEaB3dxtp6/a3tB7y+zcRxtBv71TWdWKLJBi8W3jlaQL4PFxdCqIrgwITd3233ZjTNV
         sRZA==
X-Gm-Message-State: AOAM532bRKXHCOdWtljYRaBSowdXrt7T04Kv9eCsGj+UgsGLYd8AE0kd
        C3egBG+/raCMRMjEyjFHZZCPBD3iCA==
X-Google-Smtp-Source: ABdhPJzpxfotwvZ4m4Ux+FhJTp1Po2sHUTojjYBHQrfe0Y2NIYv+7KpulcADDhbDReeG2PcW6D5lmg==
X-Received: by 2002:a05:6830:791:: with SMTP id w17mr847457ots.108.1632340034527;
        Wed, 22 Sep 2021 12:47:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c5sm712984otb.35.2021.09.22.12.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:47:14 -0700 (PDT)
Received: (nullmailer pid 1175763 invoked by uid 1000);
        Wed, 22 Sep 2021 19:47:13 -0000
Date:   Wed, 22 Sep 2021 14:47:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: qcom,rpmcc: Document QCM2290
 compatible
Message-ID: <YUuIQbOPO1m0Xg7k@robh.at.kernel.org>
References: <20210917030434.19859-1-shawn.guo@linaro.org>
 <20210917030434.19859-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917030434.19859-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 11:04:33 +0800, Shawn Guo wrote:
> Add compatible for the RPM Clock Controller on the QCM2290 SoC.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
