Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491C9452CFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 09:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhKPIjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 03:39:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:42810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231863AbhKPIjv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 03:39:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 804386152B;
        Tue, 16 Nov 2021 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637051814;
        bh=/t0e4IeDXzGKX4p1dz+7mNaAA0MK312fgunnrIZK2/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J2TtRdSs9kDyxUNmQcdD8K37GrC1+1ceOUQ8AgOG2c+w+aVDjdRbOrkKwR1N7nD2f
         i9up4SKEbp2TP7BcbDvVm8A9dV8J3naetdo/ao38ihMKXO+r7PdKebCeTPRG47TUNV
         /BWp6cQR87apiVhFXMoadjS48cLPmnlhe6lXTPAtFDYIxPAm32Z4lqDVRgzfWd3HNE
         St0tD6P+GnHfw5vtOhtVcmRk5ZE3LkKPg0dDr2P3gfLKI2srMEH+xaoXfSpCCyReiQ
         KR6xl6rqOBlBt+DtnQ8uzmoh3aKasSkGpfRjqsofBXNWIRnwzimkyqx5XDtbx/RNQ/
         Z65DxgQWg0mhg==
Date:   Tue, 16 Nov 2021 14:06:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 6/6] dt-bindings: clock: Introduce pdc bindings for
 SDX65
Message-ID: <YZNtobehz9MUq6mz@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <0943c652b09dda026545cc10f44b0c535088072f.1637047731.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0943c652b09dda026545cc10f44b0c535088072f.1637047731.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add compatible for SDX65 pdc.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> index 98d89e53013d..ce631d853db4 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -23,6 +23,7 @@ Properties:
>  		    - "qcom,sdm845-pdc": For SDM845
>  		    - "qcom,sdm8250-pdc": For SM8250
>  		    - "qcom,sdm8350-pdc": For SM8350
> +		    - "qcom,sdx65-pdc": For SDX65
>  
>  - reg:
>  	Usage: required
> -- 
> 2.33.1

-- 
~Vinod
