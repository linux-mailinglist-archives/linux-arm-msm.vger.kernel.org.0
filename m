Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18D2E55DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 23:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfJYVbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Oct 2019 17:31:40 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42771 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfJYVbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Oct 2019 17:31:39 -0400
Received: by mail-oi1-f195.google.com with SMTP id i185so2542070oif.9;
        Fri, 25 Oct 2019 14:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GkCrIPby4aIl+m+VPmyhAnO6PjCV+Xrq1KJMKAegWqI=;
        b=psZnkn5w8MHE3c1T1wyyN5peZtEmQUk975lQV8Uek/rhRALHfXA/AACsNxRu6c+ACo
         qhwGALcO/XzjseZsgaLdKRGXbtSk30VzhMa3utIiRxZGC2IJE+DntImPgiJyKJGMRz+B
         nDN627zy+0PexW0z2X0cE3Zj1PxDF9GgdUf7gl92sNnyUwqeBSb1sH8ZncN5fTBYydqN
         RZ10PAbKzDW4VX7C3zOM2Tt/SrWVOCfhABheYWwx/kDUSJ3BvAFav7BrzldMPfE1ZHZU
         5vgk+SXWd0q95B5y66QsIIFtTEzp24PrllpzmlQi8oEkD+BHKN8rigV31cZb21MGrcsz
         m6Og==
X-Gm-Message-State: APjAAAWxymVMjmyszNgoWvxEJAUTc1L5kcvg9vXHOjTLEHsy0Q9/6btl
        n1o1KHlu1KVpsZZrPaAAjw==
X-Google-Smtp-Source: APXvYqz/XgD4tQoCZ5nNSQAsYeC3a+Y49GcWQhGf16miNmKKHKk5cagof0/c9/ZiG/MsIyHkEHRODA==
X-Received: by 2002:aca:5714:: with SMTP id l20mr4645087oib.175.1572039098759;
        Fri, 25 Oct 2019 14:31:38 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w13sm892687oih.54.2019.10.25.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:31:37 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:31:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 12/13] dt-bindings: qcom,pdc: Add compatible for sc7180
Message-ID: <20191025213137.GA20004@bogus>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
 <20191021065522.24511-13-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021065522.24511-13-rnayak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 21 Oct 2019 12:25:21 +0530, Rajendra Nayak wrote:
> Add the compatible string for sc7180 SoC from Qualcomm.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
> v2: No change
> 
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
