Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94F84216AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238727AbhJDSkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:40:16 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:35647 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234678AbhJDSkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:40:15 -0400
Received: by mail-ot1-f52.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so22811062otj.2;
        Mon, 04 Oct 2021 11:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gi9whHJHCckrxGFMJNFgaZ43tSyX5tZHz5rNi4nABKg=;
        b=RAya1rv7SBXKP18l0CBpXqRLxknvUkVYw8uW5ko2Ol+VJvP4mXRqLCCARQL+jRYPSl
         J7h5pL5Lnqf36zcvPH6XDJmSHl1vDyxhGPdSYjzvTY4gktioUeJDjLuUw6nolURJEEKm
         mXQxzZLc9X/uW2gJ3iTA7MxAznTw5gqWbHeX0hw/0j6gdH3TpMVJg/QGnmLKOjrB2XLN
         mFQ8GmEQn8cZIql1lGROuJ+l2DXGDzwxRwFYj6Yv2fwIyNTMdKlLjgj1qvkSmSdha6ft
         eXqAnIpZ8MoTPAQ+B6/dAbgOjY6d5+feUNnffKN+MnYd+VgTA2o4326RVCqnLYeKkVEx
         wbyQ==
X-Gm-Message-State: AOAM530DsPYGn8WMF71su0z8t+ePdcQPxyDtmWrumXRw8D0gs55Poxi7
        qF3Gw2gtgmu9/817Q+VBkfcex8tarw==
X-Google-Smtp-Source: ABdhPJxuxXQQZFMuwC+FOU/i6MqUOi2PEIw5HNg+VX/IARPsfBFJemh87ZiOr1JXLMQrJnQ/y5Ufug==
X-Received: by 2002:a05:6830:204d:: with SMTP id f13mr10563025otp.123.1633372706295;
        Mon, 04 Oct 2021 11:38:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s13sm1204984oou.11.2021.10.04.11.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:38:25 -0700 (PDT)
Received: (nullmailer pid 1627915 invoked by uid 1000);
        Mon, 04 Oct 2021 18:38:24 -0000
Date:   Mon, 4 Oct 2021 13:38:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 10/15] dt-bindings: soc: qcom: spm: Document
 qcom,msm8916-saw2-v3.0-cpu
Message-ID: <YVtKINeJ2Z2dslMT@robh.at.kernel.org>
References: <20210928171231.12766-1-stephan@gerhold.net>
 <20210928171231.12766-11-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928171231.12766-11-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Sep 2021 19:12:26 +0200, Stephan Gerhold wrote:
> Document the qcom,msm8916-saw2-v3.0-cpu compatible that is needed
> for cpuidle for MSM8916 on some devices with outdated (signed) firmware
> which is only capable of booting ARM32 kernels without PSCI.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
