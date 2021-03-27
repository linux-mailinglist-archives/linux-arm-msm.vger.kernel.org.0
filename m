Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8939734B7E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 16:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhC0PSf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 11:18:35 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:36498 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhC0PST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 11:18:19 -0400
Received: by mail-oi1-f171.google.com with SMTP id c16so8841874oib.3;
        Sat, 27 Mar 2021 08:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jiqs1sPzbcW5tGT47fVhUihixlaVNRFo8MPPX+t7mB8=;
        b=VHYRl7kPo9dy11jqTt0Ts+WC9gR1C+mCCfEWRWArDnGcgNy5wVQHgpeC6LQMuoMV5s
         gr41xdCB35wwg1xh6Z8zs097iUQ84bBFJoC1OGp4VZ73XAu7/J3u3GlTXH9YXvMgCSm6
         YNX6S09qoX/F+Xw6Xb6S8ARHPz16ktL15fQWWP1opLs5/pBd5h9g9Je0+C8e3ANH2/Kt
         74+Y3GXDqGjO29pB+VKaFDs3dhgj2oyfytlUzTBFR2xFyqxo2csOagq3hhBbnUoyxPIw
         dlmVRE4tHNHkG6qtIvegd2FA9fdX4fZT98jGSqosqBkzc0jKEQy6+SfLHoMtV190Z69f
         wHbQ==
X-Gm-Message-State: AOAM533sKt5Ua+h3smmnebZ1KRkLvjfS7exJMD0I2WeLL7yOYKqgJTsH
        z5EjLQ9plIvgSAISsg+Zdw3UkTK0CQ==
X-Google-Smtp-Source: ABdhPJxFnrvHXqppZ/WdfTsHlsu1YTMRHuzWw9ug1erQoKRbRR1Iz6LAzy+26ujq10RyFNkaX5P55A==
X-Received: by 2002:aca:534d:: with SMTP id h74mr13737935oib.152.1616858298617;
        Sat, 27 Mar 2021 08:18:18 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.102.185])
        by smtp.gmail.com with ESMTPSA id r20sm2943888otd.26.2021.03.27.08.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 08:18:18 -0700 (PDT)
Received: (nullmailer pid 136673 invoked by uid 1000);
        Sat, 27 Mar 2021 15:18:13 -0000
Date:   Sat, 27 Mar 2021 09:18:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: qcom,qmp-usb3-dp: Add support
 for SM8250
Message-ID: <20210327151813.GA136621@robh.at.kernel.org>
References: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org>
 <20210326175809.2923789-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326175809.2923789-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Mar 2021 20:58:04 +0300, Dmitry Baryshkov wrote:
> Add compatible for SM8250 in QMP USB3 DP PHY bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
