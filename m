Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D262347C7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236641AbhCXPWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:22:52 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:39545 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbhCXPWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:22:35 -0400
Received: by mail-il1-f182.google.com with SMTP id y17so10070635ila.6;
        Wed, 24 Mar 2021 08:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GtowwS/wU/vZd5vWrLwgIPo/HaMnMEY0MdKIDWURfhY=;
        b=mEtUurwWGljHioQJlFsOUlAw6IDvvrVd3Vra9XK2l4+/Kjea+ugTL9hy5iIXcVbhAB
         jWtaN+/2YMmiIkyRLaFuJ8h9qkuXRFph/tFjnr0pyEM0cBavwqSWJEWN+aIq3d4sXvFT
         5afiZXBXXY9uvruJYrAYgYm3St6vA014kvF2mWNa1warnkhxWpWs7CaxVj7RJfKNvf4m
         Jb3+VqgmJpUc42iENKpcxVaJHzj5omubGmdqByP6N1Nrmr8aFr+4wEVrxP514vm+2WPl
         +GM8zkJq3liu6s12n8cNG2cYzGWllsWTsrSscFeOEgVxrULIz7ZjI7CfA+zqRBYfxpBh
         mKKA==
X-Gm-Message-State: AOAM531S99I32m9jR5JpAKM502Ew8k79GXSVyYGNWYlc8gxuJs/cCK9+
        5Me8p4F4uAzQeUfrWYYu5vBq1Z34/A==
X-Google-Smtp-Source: ABdhPJzNeEXeTZZlQLwWhDD3rZoUo0D8GplZczjwkY3W2mXuGa6FhOS6qU8MeuNFLdsOcLslYCSCgg==
X-Received: by 2002:a92:c607:: with SMTP id p7mr3012190ilm.70.1616599354823;
        Wed, 24 Mar 2021 08:22:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a7sm1236269ilj.64.2021.03.24.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:22:33 -0700 (PDT)
Received: (nullmailer pid 3090798 invoked by uid 1000);
        Wed, 24 Mar 2021 15:22:31 -0000
Date:   Wed, 24 Mar 2021 09:22:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH] dt-bindings: mailbox: Add compatible for SM8350 IPCC
Message-ID: <20210324152231.GA3090764@robh.at.kernel.org>
References: <20210312051203.3555751-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312051203.3555751-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 Mar 2021 10:42:03 +0530, Vinod Koul wrote:
> Add the compatible string for SM8350 IPCC block on this SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
