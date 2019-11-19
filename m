Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40CB910173E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 07:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbfKSF6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 00:58:42 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42379 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731017AbfKSFtF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 00:49:05 -0500
Received: by mail-pg1-f193.google.com with SMTP id q17so10787607pgt.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2019 21:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7OLkh5H/ucrzGh1Q5+S7PwZCVoMIrIc0kVwMB4oywiY=;
        b=T79AY6oCrcY9WkARAR7g/vMcApkFufxFzSkYgKFVG58CkLC1gyMOK9RpUVuHOzLN9V
         UuUQbtcRVeh0oZbSGc/N2TZubqVgmPQbg+73q//z1IclKQSvUgmkmJTT+uTLSgst3OxE
         BKJEMKrHvTJW6p993n/SDnzcBFpFe+aZz0UoEos+Qu+kZNlJa+hJWqX3BDbI01vGZ/F4
         ll1047nAJQBf7Q9/pk/72wMVV3EfsekmiW1t0VKX0UFmNNdmobNqXFY0WRC9YKvMrxfy
         JG6PL0/QGnWypkuEXvbzHZ1YJxUtdLgPM8KcxuTgWKh8bPlRDh/ulakfOvfz11v0Re/9
         OK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7OLkh5H/ucrzGh1Q5+S7PwZCVoMIrIc0kVwMB4oywiY=;
        b=O2zCjnnQ81m9KjbQJAGI07uKbpig4qPepsrVIAWdRAFTKGGZWeA8zr16EZBpALpgEb
         Q8ZOHJhH2pdG9EzYs6IVTRKzs1gDu92t18lo9f2BHDU1Mo7zM+Pzb1sJ6GF6QUx4Wuvg
         60HmRGfvo4JvFj/tDLcZ1BxxiYSZaAt9q+rykfe0BuxRM8x/Vo+1U2Im4NBfxX8lbCjB
         JNWKk8nZwgh7GueqbecTMmX5+27jjf9QKkD/KWr+K5QgWTXWHFaLmEBdaT0F+pKp3Ku7
         CcbVGFAg6rqc+YjQJr/KWVua3cI6OS5ST4hDaGdhCStksfyfakiLFn29m6Ru4KzqY55/
         q4uw==
X-Gm-Message-State: APjAAAWC+QYZuXy0oesJ1oRgzYuj4Mo+sEAUhj2vqRTTQ8RRf5uDale/
        r4Uqqry+nAx/p+Po0hsoF2IcaA==
X-Google-Smtp-Source: APXvYqzSv72HWYX9/l0aZSvtiLQMSrYlS422iAg/YV7tQl3rYW8UQlPAgnqgdjjuFBx37ipGmPSzbw==
X-Received: by 2002:a63:4961:: with SMTP id y33mr3649995pgk.264.1574142544341;
        Mon, 18 Nov 2019 21:49:04 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x21sm22210789pfi.122.2019.11.18.21.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 21:49:03 -0800 (PST)
Date:   Mon, 18 Nov 2019 21:49:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: apr: Add protection domain
 bindings
Message-ID: <20191119054900.GD18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9c786-fcf80f4e-9b57-4d6b-8806-9ca408e21b55-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7ee9c786-fcf80f4e-9b57-4d6b-8806-9ca408e21b55-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Nov 06:28 PST 2019, Sibi Sankar wrote:

> Add optional "qcom,protection-domain" bindings for APR services. This
> helps to capture the dependencies between APR services and the PD on
> which each apr service run.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> index db501269f47b8..f87c0b2a48de4 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> @@ -45,6 +45,12 @@ by the individual bindings for the specific service
>  			12 - Ultrasound stream manager.
>  			13 - Listen stream manager.
>  
> +- qcom,protection-domain
> +	Usage: optional
> +	Value type: <stringlist>
> +	Definition: Must list the protection domain service name and path
> +		    that the particular apr service has a dependency on.
> +
>  = EXAMPLE
>  The following example represents a QDSP based sound card on a MSM8996 device
>  which uses apr as communication between Apps and QDSP.
> @@ -82,3 +88,56 @@ which uses apr as communication between Apps and QDSP.
>  			...
>  		};
>  	};
> +
> += EXAMPLE 2
> +The following example represents a QDSP based sound card on SDM845 device.
> +Here the apr services are dependent on "avs/audio" service running on AUDIO
> +Protection Domain hosted on ADSP remote processor.
> +
> +	apr {
> +		compatible = "qcom,apr-v2";
> +		qcom,glink-channels = "apr_audio_svc";
> +		qcom,apr-domain = <APR_DOMAIN_ADSP>;
> +
> +		q6core {
> +			compatible = "qcom,q6core";
> +			reg = <APR_SVC_ADSP_CORE>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +		};
> +
> +		q6afe: q6afe {
> +			compatible = "qcom,q6afe";
> +			reg = <APR_SVC_AFE>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +			q6afedai: dais {
> +				compatible = "qcom,q6afe-dais";
> +				#sound-dai-cells = <1>;
> +
> +				qi2s@22 {
> +					reg = <22>;
> +					qcom,sd-lines = <3>;
> +				};
> +			};
> +		};
> +
> +		q6asm: q6asm {
> +			compatible = "qcom,q6asm";
> +			reg = <APR_SVC_ASM>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +			q6asmdai: dais {
> +				compatible = "qcom,q6asm-dais";
> +				#sound-dai-cells = <1>;
> +				iommus = <&apps_smmu 0x1821 0x0>;
> +			};
> +		};
> +
> +		q6adm: q6adm {
> +			compatible = "qcom,q6adm";
> +			reg = <APR_SVC_ADM>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +			q6routing: routing {
> +				compatible = "qcom,q6adm-routing";
> +				#sound-dai-cells = <0>;
> +			};
> +		};
> +	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
