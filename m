Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DEE1D31A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 15:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgENNp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 09:45:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:43744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbgENNp0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 09:45:26 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FC942054F;
        Thu, 14 May 2020 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589463925;
        bh=BiyP19s8ArH79tbowm7Md7c5VYSdaAeLlwmIsR16syE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KajdqBrH81XEVNYOh/a8PIo3/kb/e2owHgWHMPDdeB4GQ3X5E3E1phiTooLAkNa80
         TLdxD64/QO/QMzEPLRauoyehamXgtHgTNmsGaEpOFgGQVGv0sMszopoXoDEdwZqieo
         XnwCk/RnWwSTKrnoIiYrRrtX9NiRLcFfwXXkmUdM=
Date:   Thu, 14 May 2020 19:15:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8250
 remoteprocs
Message-ID: <20200514134521.GU14092@vkoul-mobl>
References: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-20, 11:00, Bjorn Andersson wrote:
> Add the SM8250 audio, compute and sensor remoteprocs to the PAS DT
> binding.


Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Changed adsp power-domains to lcx and added missing lmx
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt         | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 9938918b2fea..c18c1b8d2869 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -21,6 +21,9 @@ on the Qualcomm ADSP Hexagon core.
>  		    "qcom,sm8150-cdsp-pas"
>  		    "qcom,sm8150-mpss-pas"
>  		    "qcom,sm8150-slpi-pas"
> +		    "qcom,sm8250-adsp-pas"
> +		    "qcom,sm8250-cdsp-pas"
> +		    "qcom,sm8250-slpi-pas"
>  
>  - interrupts-extended:
>  	Usage: required
> @@ -44,6 +47,9 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sm8150-adsp-pas:
>  	qcom,sm8150-cdsp-pas:
>  	qcom,sm8150-slpi-pas:
> +	qcom,sm8250-adsp-pas:
> +	qcom,sm8250-cdsp-pas:
> +	qcom,sm8250-slpi-pas:
>  		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
>  	qcom,qcs404-wcss-pas:
>  	qcom,sm8150-mpss-pas:
> @@ -105,10 +111,13 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sdm845-cdsp-pas:
>  	qcom,sm8150-adsp-pas:
>  	qcom,sm8150-cdsp-pas:
> +	qcom,sm8250-cdsp-pas:
>  		    must be "cx", "load_state"
>  	qcom,sm8150-mpss-pas:
>  		    must be "cx", "load_state", "mss"
> +	qcom,sm8250-adsp-pas:
>  	qcom,sm8150-slpi-pas:
> +	qcom,sm8250-slpi-pas:
>  		    must be "lcx", "lmx", "load_state"
>  
>  - memory-region:
> -- 
> 2.24.0

-- 
~Vinod
