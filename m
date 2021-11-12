Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A144C44EDD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 21:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhKLUXe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 15:23:34 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:41928 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhKLUXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 15:23:33 -0500
Received: by mail-oi1-f178.google.com with SMTP id u74so19981298oie.8;
        Fri, 12 Nov 2021 12:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FHAHvJXqc7YauDRk++zPCE6QbPKdD9mhBY/GUlSuKMg=;
        b=2QWwyr1wq0i8eMQGPkDEjKQTVhus9nkByE+am9tMGXOIvN9V+WMjj9Xr7J2cObRU8/
         jZ6FoXvw7o3EexL9dc5ZBIPEtbJEgPmGTlBjKyc6di154eklKYxnF3rP06CDBfsA1rJy
         LlQ2mLx3wBrVTYfKGO5syuDidk+J3Ub9ZXm/HhlBRnvlYCebyQXhzihkgw2vLKjA5HaW
         C9rB0FQ6UxgJBdL8U0f5u6fCGqJAIeL5av1bAgY8Xwub37qZwcq8HzTOdXFvpf09KaOR
         wN5lXGTMUCQitXN3d4xd4o7GB1kYY/rA7RKoWyWXunLn3ueLEibSq/fK/v6eOL83oMyj
         JrHQ==
X-Gm-Message-State: AOAM530jvVPa7TM70fa0WEhY2Ao5TaBi7byGo/6Ua0FXol9ItI8lnjgy
        3pJO5y3hUjnpumB09ZVMNQ==
X-Google-Smtp-Source: ABdhPJyKDKafvtu7MZSwgxcSVR4oHySF5h93fYSAI2sePzUnLJDed0Q+bHOoaUdHzhwsjSk81ioqrQ==
X-Received: by 2002:a05:6808:1283:: with SMTP id a3mr6753537oiw.110.1636748442189;
        Fri, 12 Nov 2021 12:20:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r5sm1536856oiw.20.2021.11.12.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 12:20:41 -0800 (PST)
Received: (nullmailer pid 3302639 invoked by uid 1000);
        Fri, 12 Nov 2021 20:20:40 -0000
Date:   Fri, 12 Nov 2021 14:20:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Introduce Qualcomm eDP PHY
 binding
Message-ID: <YY7MmEj0xi3Er4z3@robh.at.kernel.org>
References: <20211103234410.1352424-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103234410.1352424-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Nov 2021 16:44:09 -0700, Bjorn Andersson wrote:
> Introduce a binding for the eDP PHY hardware block found in several
> different Qualcomm platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Dropped DP compatible from the binding
> 
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
