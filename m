Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD0E3C5EAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 16:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbhGLPBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 11:01:32 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:41723 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbhGLPBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 11:01:31 -0400
Received: by mail-io1-f41.google.com with SMTP id b1so23068411ioz.8;
        Mon, 12 Jul 2021 07:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1loPbvTCfkhyM95LyhC23pJwncwU0abnpYThuTKSdkI=;
        b=VKnWGhs7M0rw/++TeuUzujAXmxm9ExrBfJvJuETUU/OtZoEfB5BD/gbZBiTN+RKyMO
         8RwvpY/JyddeH2UpVM1Dr1cCvomtgqbpwDNHsFZAl9qjfOeBoiI3pzomxLCLDjV5mZYW
         TPaVztKWUrERlzm1YZCJzxw/Bfkf3Wqp+YEWXgUUSPyfXY/yJwBg4Xcsts8BK1DpH+MI
         B/MmGfNWEVp569brR+o+FydBbobGWlHT+oWGndrsqshex4Fuv2s4mw9NmTLjTpgUPecZ
         FH8Lv+8gPsGU5taJ7umjXoeOYY3yaIhfyFWHuzLQ+gnhPoAsCyJC4QLn6nMBUlASeURI
         1+4Q==
X-Gm-Message-State: AOAM530Jxz3ckQKqyirLr6jXfy+BkA0LUI2IOTxes+vWIPnNQ2Z2EMQ7
        cZ6Vae+6PPBE1Tb/KoMNOg==
X-Google-Smtp-Source: ABdhPJxhABbANI+LkckmheGK22kDLLImUSjMN2XGDNtWQAa/dZW3E8W2vBFWdYeTpXqK7Pe7UXQf1w==
X-Received: by 2002:a05:6638:100b:: with SMTP id r11mr14625101jab.85.1626101922369;
        Mon, 12 Jul 2021 07:58:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x13sm8056459ilo.11.2021.07.12.07.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 07:58:41 -0700 (PDT)
Received: (nullmailer pid 1920683 invoked by uid 1000);
        Mon, 12 Jul 2021 14:58:38 -0000
Date:   Mon, 12 Jul 2021 08:58:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Benjamin Li <benl@squareup.com>, linux-clk@vger.kernel.org,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Update qcom,a53pll bindings
 for MSM8939 support
Message-ID: <20210712145838.GA1920623@robh.at.kernel.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
 <20210704024032.11559-4-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704024032.11559-4-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 04 Jul 2021 10:40:31 +0800, Shawn Guo wrote:
> Update qcom,a53pll bindings for MSM8939 support:
> 
>  - Add optional operating-points-v2 property
>  - Add MSM8939 specific compatible
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
