Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD7F4173082
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 06:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgB1Ff4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 00:35:56 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:52054 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgB1Ff4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 00:35:56 -0500
Received: by mail-pj1-f67.google.com with SMTP id fa20so818164pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 21:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0GJyp688+zVIA9RAELyTu++JtY5GE6ftYiBpGjoOZZA=;
        b=QTqAFVL1XB04RNS9sYNDcXXmTzRL0jvx5CqJkfHED/y2rrNKqqBI13hdy1qaJdy3L5
         k5kOmFqOU8Z3xr3nm1CLYXHU4nsb4gJkZ4Dh6hejVHLLbutYSAMw6q7Ae/XWkdhjCVf+
         Scv/Pq7ujo+FCvmb5+uuXlI6fsUAocqPgctrNWHJMlVgfziVP8yz3bJR7VGTdpXXYCKT
         9tVrxbdeKTCmHeUhjwaqiTmbVNFceFz/p9WoTlnwexSbFBTuQM8VJECJfi8NWdu3dWxU
         PIyYveKVYmnXplQ/NfxEdOBTxkILtiDDNIULSYfQ9sgU1eOY+RYieTlZalYJ0XIYq8GV
         zBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0GJyp688+zVIA9RAELyTu++JtY5GE6ftYiBpGjoOZZA=;
        b=FEO1onmcddOBEOIOZjGPapGftnZgk56xddUaNAYP4T/zZsDmIgxZpOG8mRy706y6u3
         IND1qCJAf+wyfKIONbslCWsx2DXG5rqZ+VE0c1g1auh6WVw5b6dV4p0cqhwmESMdAWct
         bZwsv/uNspFCQap+yYzewP5uVKHoMEDga3aemdnE5WDUCDZD1B0yX3xinSQ1DqQN6adi
         VTouOtAX3bL0S6/uWC5qN+0H2cBTW+5Riv0jBDhpxxihj6l3eSMn+XHDnDEaBUWqhtY2
         bdLl1A1U1NmA30vgpWwEMRV85fa4DXjRAlEwtNkjxsLAXt30QCpjgnlzswQqXT9A0Car
         HBQw==
X-Gm-Message-State: APjAAAXaZ0+UTRtkdv15drYoBklYJJ8Sd5yKukRqsVBUhECac1EJF/GE
        eCzAq7bP+2LT+5AhTycE7EdJ5oqBlxQ=
X-Google-Smtp-Source: APXvYqyirMSHVRjCCxcV5wU5H0zwkMqjx2vvSv6NAvs47VYPqge4V0xBX7vOP9O+r+1Rl3LwTeBXUQ==
X-Received: by 2002:a17:902:502:: with SMTP id 2mr2382085plf.151.1582868153642;
        Thu, 27 Feb 2020 21:35:53 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v29sm8277892pgc.72.2020.02.27.21.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 21:35:52 -0800 (PST)
Date:   Thu, 27 Feb 2020 21:35:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org
Subject: Re: [PATCH v4 2/3] dt-bindings: soc: qcom: apr: Add protection
 domain bindings
Message-ID: <20200228053550.GD210720@yoga>
References: <20200226170001.24234-1-sibis@codeaurora.org>
 <20200226170001.24234-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226170001.24234-3-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 Feb 09:00 PST 2020, Sibi Sankar wrote:

> Qualcomm SoCs (starting with MSM8998) allow for multiple protection
> domains (PDs) to run on the same Q6 sub-system. This allows for
> services like AVS AUDIO to have their own separate address space and
> crash/recover without disrupting the other PDs running on the same Q6
> ADSP. Add "qcom,protection-domain" bindings to capture the dependencies
> between the APR service and the PD on which the apr service runs.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> index db501269f47b8..f8fa71f5d84ba 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> @@ -45,6 +45,18 @@ by the individual bindings for the specific service
>  			12 - Ultrasound stream manager.
>  			13 - Listen stream manager.
>  
> +- qcom,protection-domain
> +	Usage: optional
> +	Value type: <stringlist>
> +	Definition: Must list the protection domain service name and path
> +		    that the particular apr service has a dependency on.
> +	Possible values are :
> +			"avs/audio", "msm/adsp/audio_pd".
> +			"kernel/elf_loader", "msm/modem/wlan_pd".
> +			"tms/servreg", "msm/adsp/audio_pd".
> +			"tms/servreg", "msm/modem/wlan_pd".
> +			"tms/servreg", "msm/slpi/sensor_pd".
> +
>  = EXAMPLE
>  The following example represents a QDSP based sound card on a MSM8996 device
>  which uses apr as communication between Apps and QDSP.
> @@ -82,3 +94,41 @@ which uses apr as communication between Apps and QDSP.
>  			...
>  		};
>  	};
> +
> += EXAMPLE 2
> +The following example represents a QDSP based sound card with protection domain
> +dependencies specified. Here some of the apr services are dependent on services
> +running on protection domain hosted on ADSP/SLPI remote processors while others
> +have no such dependency.
> +
> +	apr {
> +		compatible = "qcom,apr-v2";
> +		qcom,glink-channels = "apr_audio_svc";
> +		qcom,apr-domain = <APR_DOMAIN_ADSP>;
> +
> +		q6core {
> +			compatible = "qcom,q6core";
> +			reg = <APR_SVC_ADSP_CORE>;
> +		};
> +
> +		q6afe: q6afe {
> +			compatible = "qcom,q6afe";
> +			reg = <APR_SVC_AFE>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +			...
> +		};
> +
> +		q6asm: q6asm {
> +			compatible = "qcom,q6asm";
> +			reg = <APR_SVC_ASM>;
> +			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
> +			...
> +		};
> +
> +		q6adm: q6adm {
> +			compatible = "qcom,q6adm";
> +			reg = <APR_SVC_ADM>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +			...
> +		};
> +	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
