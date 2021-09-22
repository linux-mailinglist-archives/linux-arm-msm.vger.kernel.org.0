Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90732415286
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 23:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237833AbhIVVSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 17:18:09 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:44754 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236476AbhIVVSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 17:18:09 -0400
Received: by mail-oi1-f181.google.com with SMTP id o66so6490699oib.11;
        Wed, 22 Sep 2021 14:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kh4Ghm6qYxW1QP5eDOkkCFbtlvfqc6r3kIiF78R6ML4=;
        b=lLGBv2P1znFv8iFW1oNzmvvxK2BdIpXvpH2wzrYTbZED0bYgvUWe2NMI+Q4M3qoW6D
         /+92y2lJ34AaXAaEeWMa+pRCSDF2ykgE3hrXnecZjHtjj3UkWC6EAc8/aYXB2p9qSJKf
         K5WWP2rDOJ6YKw6HBmlbVlKsg8oqoS7KzH4rDMJX1fNb/GVY7/u1i/oyWyWYXQJ+MYRY
         K5vJA/vT1E1dLmfI6VVJ04624KjBVGNZUgfzW7Z0KSEHxrwIu3UuXo+g68k8QeNMsFYN
         SiqKnwxvJWehVBy5Bm62ucncmqYjo0UIfAKOU41HXBUAj/J8QRHqcDaydDQ9h3rvzCjE
         LfWg==
X-Gm-Message-State: AOAM531+8O6kU3pHaUuWOSUL7lG2G2n8n/i0Q75lUxZNHeuPrbDIjp8q
        10N+J2mtdpB87iCcWgd/gQ==
X-Google-Smtp-Source: ABdhPJwKzojWvsxGCdpvga72I3IhSMl5L8xtOQdbUXjk42Y7eW8ZDGoiKlWf+b/oOud7SP6AAwzn/Q==
X-Received: by 2002:a05:6808:2110:: with SMTP id r16mr1011645oiw.117.1632345398451;
        Wed, 22 Sep 2021 14:16:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k4sm792618oic.48.2021.09.22.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 14:16:37 -0700 (PDT)
Received: (nullmailer pid 1308640 invoked by uid 1000);
        Wed, 22 Sep 2021 21:16:36 -0000
Date:   Wed, 22 Sep 2021 16:16:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,qusb2: Update maintainer email
Message-ID: <YUudNLH6wsgQVk/c@robh.at.kernel.org>
References: <20210919033519.29559-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919033519.29559-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 19 Sep 2021 11:35:19 +0800, Shawn Guo wrote:
> Manu's codeaurora.org email address bounces.  Before he comes
> back with his new email, fill Vinod's address in there.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
