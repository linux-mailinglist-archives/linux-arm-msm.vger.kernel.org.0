Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE393518C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbhDARrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbhDARlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:41:17 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03C4C02FEBC;
        Thu,  1 Apr 2021 09:35:03 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id m13so2325363oiw.13;
        Thu, 01 Apr 2021 09:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KlUEVAQWKKMC6WmrOaozIA/WbDO/aRHlhtO4HdU7p0w=;
        b=M8tuLRWagF/8GymxZmiiXXjNIqPhnsghw8OHR2tWDGzLJFDpCZXc44w62u7iyGlJwm
         gAXrzmAHNKT+6lvSxhlr9rETiY7XQmPjtz1nje89XqFmHP1Amc26TBvATCYRiOb2E8xE
         K7k3gNmGBNGZ+fG4MQwiNkaL0vetrt2lKd4LmMAHbTMv4IB8gy7eMP5HQZJrV2YBGHXK
         4Q8rGozSNYXMOp/9MtbU+fmkoR8WLwsQCKvzKS4joQ9efqgSK+5sW2M98/x10uiDIFco
         WNIFQNGCrPcAA2TU9i3k2hd9qok8E3gw747JBwIBZ1snXQTofI4HPmvEA3PpxLMv3XiU
         mN7w==
X-Gm-Message-State: AOAM5305LlDiufJwYozggLUHKMM/0xoiCQwZItz/s+Y0aQdSe82Ab2Or
        fBKfcpY5egbpwwcqpTN/a3zGq/DV8w==
X-Google-Smtp-Source: ABdhPJyscx428vC89YJUwIC9VUFcDOGdaUAcQCoOrObtzB8inxUwOmB3G6LXHPVe8CUV4A3IC5z/cQ==
X-Received: by 2002:aca:1302:: with SMTP id e2mr6462641oii.170.1617294901664;
        Thu, 01 Apr 2021 09:35:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x20sm1111662oiv.35.2021.04.01.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:35:01 -0700 (PDT)
Received: (nullmailer pid 567808 invoked by uid 1000);
        Thu, 01 Apr 2021 16:35:00 -0000
Date:   Thu, 1 Apr 2021 11:35:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: media: venus: Add sm8250 dt schema
Message-ID: <20210401163500.GA567497@robh.at.kernel.org>
References: <20210215160254.1572615-1-bryan.odonoghue@linaro.org>
 <20210215160254.1572615-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215160254.1572615-3-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Feb 2021 16:02:54 +0000, Bryan O'Donoghue wrote:
> Add a schema description for the venus video encoder/decoder on the sm8250.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sm8250-venus.yaml     | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> 

Applied, thanks!
