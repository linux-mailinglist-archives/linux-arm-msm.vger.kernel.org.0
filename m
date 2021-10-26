Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF3343BB21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 21:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238852AbhJZTnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 15:43:31 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:39905 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238834AbhJZTnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 15:43:06 -0400
Received: by mail-oi1-f171.google.com with SMTP id s9so168096oiw.6;
        Tue, 26 Oct 2021 12:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LLULUJj+QNshXgKbuMSNhu7it69eHLrJV5G/+xbvi/o=;
        b=FAreHhLd9x4Ztnq92E0g4C8a62Ctm0W1W4v913ZAYQLUadxPYksXVb61TT7sCF7ASE
         NdWncqTqBiH96D1wlUrEY0ARVRqIjCRi0Bb1xHxCzZsfTw7YVqhjQtQLPmrE8OnxaSUA
         yqAGsbc6TgjXI32Sap7BF2IEBzfkKYx5TKqp0AtHIUS5rMrtvHuN9UK2AOqFH4e9GhtA
         C0yFuJIW2sQfVDh/KCkDp6k+LYRr/W+aWwIXCjlv4ZOcdAChO7LwDeO5+PwIHeA3IJxR
         l6I4Lord1uh2sEwN4WPOm6yz96q/zyKJLbAysh8iMrqv6NLslFIkMXSyvkj5wIC+sfd3
         BGKg==
X-Gm-Message-State: AOAM531t/TsdpKUFrsw7Y6e9DxyXHNSUJMFsWIbJ9qhiIOb9qm73aKJS
        1XmmfZ/3CCPVqKtsUMW7Sw==
X-Google-Smtp-Source: ABdhPJzKSUCOQ7CdAzHTt0kmnPUglC0+sjKpOzmThp5FgVnnSoLSEr3zbfv0D10+APlMxJXZQVGYbw==
X-Received: by 2002:a05:6808:1a92:: with SMTP id bm18mr594923oib.0.1635277241847;
        Tue, 26 Oct 2021 12:40:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bk8sm5117784oib.57.2021.10.26.12.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:40:40 -0700 (PDT)
Received: (nullmailer pid 3106663 invoked by uid 1000);
        Tue, 26 Oct 2021 19:40:39 -0000
Date:   Tue, 26 Oct 2021 14:40:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     herbert@gondor.apana.org.au, robh+dt@kernel.org,
        bhupesh.linux@gmail.com, agross@kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        davem@davemloft.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 09/20] dt-bindings: qcom-qce: Add 'iommus' to optional
 properties
Message-ID: <YXhZtzikw9KTi+h7@robh.at.kernel.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-10-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105541.68045-10-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Oct 2021 16:25:30 +0530, Bhupesh Sharma wrote:
> Add the missing optional property - 'iommus' to the
> device-tree binding documentation for qcom-qce crypto IP.
> 
> This property describes the phandle(s) to apps_smmu node with sid mask.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/crypto/qcom-qce.yaml          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
