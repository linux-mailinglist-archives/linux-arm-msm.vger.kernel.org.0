Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A93645669E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 00:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbhKRX41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 18:56:27 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34565 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbhKRX40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 18:56:26 -0500
Received: by mail-oi1-f181.google.com with SMTP id t19so18063838oij.1;
        Thu, 18 Nov 2021 15:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+lqm9/QYwQyfOn6VRe3znowYCDjXXWTjuX9a2tTLRb4=;
        b=qjDygU2gTmdg6Ti1dqFpg9gp2J4TugdJrK/ywS2UcmNWTX9OIwQmFRC/Jz8HfhiE8H
         Yefl8OzrohTaZscBSrZz0gk5QfxMToF9/2oTxZgT8uGHOLEopkG3RtK54KjmAc64HOyd
         /lBeN30GyoQ5BowGJfOpqZQzXaAcJo82EsuzOTk5MfiU73HOXDiUJ1qTiSu5lTPFHqyv
         Mtc6Tv/EEACK80nVkZNtH7wRWzTgjKTNEByjbVG9iVutZDEayyXDLCtnPKG1jM9ptOJs
         KIoxFKWAPk2abChFVSN9cEF4T/ZpMBoySBC+zlJcbkF7HMSZefAJagOw78ykjwb1AofQ
         vKnQ==
X-Gm-Message-State: AOAM5301P/vahqT7o78JryYjyYtKPVU5lRXWwJl0A4Vx+te8l55oZyI/
        gxvm8i59jvtjZdStmFu5iw==
X-Google-Smtp-Source: ABdhPJzBPEmK6VgWrWnAFE8f+0DlKvEv0++MLyq+ouPqtEjVbXohZeA0q9AEmlMcUnjn+eB5WhAcBA==
X-Received: by 2002:a05:6808:1403:: with SMTP id w3mr910084oiv.80.1637279604854;
        Thu, 18 Nov 2021 15:53:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j14sm348413oil.43.2021.11.18.15.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 15:53:23 -0800 (PST)
Received: (nullmailer pid 2020777 invoked by uid 1000);
        Thu, 18 Nov 2021 23:53:22 -0000
Date:   Thu, 18 Nov 2021 17:53:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     agross@kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, robh+dt@kernel.org,
        stephan@gerhold.net, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH v5 08/22] dt-bindings: qcom-qce: Add 'interconnects' and
 'interconnect-names'
Message-ID: <YZbnclzaf0auyn16@robh.at.kernel.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-9-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-9-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 10 Nov 2021 16:29:08 +0530, Bhupesh Sharma wrote:
> Add 'interconnects' and 'interconnect-names' as optional properties
> to the device-tree binding documentation for qcom crypto IP.
> 
> These properties describe the interconnect path between crypto and main
> memory and the interconnect type respectively.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
