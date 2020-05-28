Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728221E6E54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 00:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436848AbgE1WDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 18:03:11 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44872 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436845AbgE1WDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 18:03:04 -0400
Received: by mail-io1-f65.google.com with SMTP id p20so142738iop.11;
        Thu, 28 May 2020 15:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BVo7bwcyHNQhbNQlvK9k2FqD/huUhkXJ3cTPpto8QjM=;
        b=Xha2xGn9u+dU0dRqRg1JI4LTW2jA2Hs4bgFLLsEPTdstdLk3+wXs8DXGk1i0hrX1UF
         8Ety1poX1I17LNYAoKDz6/xcIxaiIiFNSwdkmQZzXg03L26N2IPbvzRiuoDTTRfmGwpW
         6cpeN5ocIng4Oy1mWV92Zz9kkpNiiJWHSH0OXo9umsH3MICyMxUumWrWKJlbQxr1XhUq
         KD336NL9s8BHwxlzMWTCWc9C0zzSEL4J0V9F1VaGcoadHsBZGhSWLrS1sGMdBq67JFOZ
         2IrCfDtmxcOPap7a7U28d4deLylSsWrcarBFpIthl310bd1PYkQhquDi7VTNQqYHpOAS
         zduA==
X-Gm-Message-State: AOAM533AbMb2hR3P7jlI2NHWEGRFAOnxSWkTUVTkgWeZeenJVLnkcKxw
        u6MB0gW8LfzdrH9C3Qy3xg==
X-Google-Smtp-Source: ABdhPJzNW5gQ4aaMX82/bIdYGNG7tdR9dwc4EDAGFh0RCIznKrCd+mSB4tA6dHiC/erY5Uap94ohQw==
X-Received: by 2002:a5e:a705:: with SMTP id b5mr4126254iod.12.1590703383914;
        Thu, 28 May 2020 15:03:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v15sm3962090ila.57.2020.05.28.15.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 15:03:03 -0700 (PDT)
Received: (nullmailer pid 762177 invoked by uid 1000);
        Thu, 28 May 2020 22:03:02 -0000
Date:   Thu, 28 May 2020 16:03:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add devicetree binding for
 Qcom IPCC
Message-ID: <20200528220302.GA762089@bogus>
References: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
 <20200520084854.19729-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520084854.19729-2-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 May 2020 14:18:52 +0530, Manivannan Sadhasivam wrote:
> Add devicetree YAML binding for Qualcomm Inter-Processor Communication
> Controller (IPCC) block.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/mailbox/qcom-ipcc.yaml           | 80 +++++++++++++++++++
>  include/dt-bindings/mailbox/qcom-ipcc.h       | 33 ++++++++
>  2 files changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>  create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
