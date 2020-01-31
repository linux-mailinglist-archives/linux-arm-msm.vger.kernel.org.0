Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDD714EE83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 15:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgAaOel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 09:34:41 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46437 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728825AbgAaOek (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 09:34:40 -0500
Received: by mail-oi1-f196.google.com with SMTP id a22so7365654oid.13;
        Fri, 31 Jan 2020 06:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nUmVi0dCs2wXilhUIhqJM4VFYVQi4xYLdV662gLZZsc=;
        b=Him9Vg71a6QMq4Y9bOnTrV3C+GRcf1HjOtz7c+mUPz5l4JFk2sXBO6sLg6D65G3HCt
         b10NuuxxiRXA+FLN/dEDXBBDXhdTN8MR58G1cDm8CUx0FsJumZooqxzXDIvx8qleM9fG
         g0suDq2O910D/ufk3rkQ5PlsjYERMeEYlVhqbiQtNxcfXnpViC/dK/cGWhSAZRzbdf+i
         QrMm0EIvedcEQmx5dMrsWwSjjxQuEVUpQzsfs/RRL3+2QZGQXJj4pqFxGpTAZRgxfL3T
         850n6zq9CUOFpsBZqU63ElSO8RHCZmhGuQ2YlnjgBORGiFnjvy6iNufIo6TzKlxqZE8u
         pPcA==
X-Gm-Message-State: APjAAAXVpm6PuYVyK97pLN7PEcUdowPeMgSfgD51kQzk9dndnp3/G2a6
        spVXY2Xo6IRn7TCJJoaTZQ==
X-Google-Smtp-Source: APXvYqy8VwYNzZmHWifR0Z5mOD0hqHLj921igIvd3l/xX7k/2B1jQYUlt8F3Pvynzbe1zOljBO1ThQ==
X-Received: by 2002:aca:ad11:: with SMTP id w17mr6767138oie.85.1580481278589;
        Fri, 31 Jan 2020 06:34:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e6sm3063147otl.12.2020.01.31.06.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 06:34:37 -0800 (PST)
Received: (nullmailer pid 23045 invoked by uid 1000);
        Fri, 31 Jan 2020 14:34:36 -0000
Date:   Fri, 31 Jan 2020 08:34:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: soc: qcom: apr: Add protection
 domain bindings
Message-ID: <20200131143436.GA14822@bogus>
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230050008.8143-3-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 30, 2019 at 10:30:07AM +0530, Sibi Sankar wrote:
> Add optional "qcom,protection-domain" bindings for APR services. This
> helps to capture the dependencies between APR services and the PD on
> which each apr service run.

This is meaningless to me...

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

How many strings can there be and can you enumerate the possible 
strings?

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

Perhaps an example where not everything is the same. The example shows 
me this isn't needed in DT.

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
