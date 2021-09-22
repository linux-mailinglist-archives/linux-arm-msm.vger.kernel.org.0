Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1F84151B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 22:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237701AbhIVUzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 16:55:17 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:46970 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhIVUzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 16:55:16 -0400
Received: by mail-oi1-f171.google.com with SMTP id s69so6372796oie.13;
        Wed, 22 Sep 2021 13:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7UQgPbHiiI5fROteq8Hvll/XjdnlIJK9D0aOFIIzhqQ=;
        b=t3WnURjeSCIuh/rkvI/L1RqKNy4BtXL50wSDruLx5jDk6Lsp0mlPUUQOV1Vcd3VIac
         sm3EM+vDrbJZjKgCSUb/I3Q1vWrR74gIyIJWD1Pop7rw0TOHiSaWQNF3E7SZg/VC1rws
         2NLE/8T1dwXRYQi52NImWDAbd1Gxh7OH1T1w71sh4DP0PBJD25/WU5I+4PMZi/T4z1gd
         SbyNqrZM7HFTjOP3f0LTndUa2jR7ou30OJPk/vMUHuo1V+LkF8ugSbnyJRI33RU62afi
         zo8EiicNymqxnHxtztD3qLUsHDmyRzfkwRrGouWlWHT9JMqaV5bCVb1rDhOIjRGGHnO7
         bj3A==
X-Gm-Message-State: AOAM5300fDxa8LDQSxdYygzIG5y8AtFsff5nVG/M5lfBG4DSzObW1ewJ
        P/HMpOI98LU+ADXFGkod0Q==
X-Google-Smtp-Source: ABdhPJwS6+PnDPVLGjmSDm2lajZEue3vo99r/gZh6GWIc5NC9a7fkexwjqMNrK2Fvx+5LHXUA+TFPw==
X-Received: by 2002:a05:6808:aaa:: with SMTP id r10mr6338506oij.75.1632344026237;
        Wed, 22 Sep 2021 13:53:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y83sm780487oia.47.2021.09.22.13.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:53:45 -0700 (PDT)
Received: (nullmailer pid 1275452 invoked by uid 1000);
        Wed, 22 Sep 2021 20:53:44 -0000
Date:   Wed, 22 Sep 2021 15:53:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qusb2: Add compatible for
 QCM2290
Message-ID: <YUuX2KBf7+6YFcVA@robh.at.kernel.org>
References: <20210919031110.25064-1-shawn.guo@linaro.org>
 <20210919031110.25064-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919031110.25064-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 19 Sep 2021 11:11:09 +0800, Shawn Guo wrote:
> Add compatible for QUSB2 PHY on QCM2290 platform.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
