Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3737835A63B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhDISwh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:52:37 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:41522 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbhDISwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:52:36 -0400
Received: by mail-ot1-f47.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so6625418otq.8;
        Fri, 09 Apr 2021 11:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iW+c0DKJQJq1vGFIot6Vzo1aRU1B51Syt6iZoq7G0j4=;
        b=IBCcMKR2N4CB4SSO3oUBQldL961Xifysld1CnGhq7CehXw+aApKOt3xoMOfst6/Rr9
         m3b/qa0sXAO0b3Sa8eAPi0xfNo4qvldQV/aEoEs26RnirWCnn5A4MIiMJKrpK3qOIX8E
         BVF+3xufSjGIIQKa9Lc0Wqv+Srx1fTShK1l1wbYGQfQBc2pJrWaqW4uWVnAlnKLuqrmb
         pNKfI19b1hG0mMeb4tqaz7jyxzKY2CG8qYNkwuKO7MRy2ir/FGU0nstE20nfuOsVb9fy
         /vfVJzhfeS8220vJe5j5ptbA+OW2KX1aodHnkqvGiDMwP9PK2zorIlkj6Qj465IIR0tG
         xSqQ==
X-Gm-Message-State: AOAM532H7mUcO0YyP66CNm6jJjjmfZRsBf1H0spJepKZ5PQ1q0Vg2foD
        ZCw4703V52BI20AzHprUGkY0RKwdXA==
X-Google-Smtp-Source: ABdhPJw4AsdBT4iO90ZjRT1/Wk7L0kuFmzlkIt5N0e1L4URET5kA1ltDTCl+f4D+PFZxjGdF093lew==
X-Received: by 2002:a05:6830:16d3:: with SMTP id l19mr13637233otr.79.1617994342350;
        Fri, 09 Apr 2021 11:52:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p3sm658789oif.53.2021.04.09.11.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:52:21 -0700 (PDT)
Received: (nullmailer pid 3952539 invoked by uid 1000);
        Fri, 09 Apr 2021 18:52:20 -0000
Date:   Fri, 9 Apr 2021 13:52:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/15] dt-bindings: arm: qcom: Add binding for
 Thundercomm T55 kit
Message-ID: <20210409185220.GA3952493@robh.at.kernel.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
 <20210408170457.91409-13-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408170457.91409-13-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 08 Apr 2021 22:34:54 +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for Thundercomm T55 Dev kit based on SDX55.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
