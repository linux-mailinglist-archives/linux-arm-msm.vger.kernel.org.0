Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A945F111B27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 22:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfLCVwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 16:52:51 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35626 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfLCVwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 16:52:50 -0500
Received: by mail-oi1-f196.google.com with SMTP id k196so4884860oib.2;
        Tue, 03 Dec 2019 13:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vijuoyGz6GUZvHcPpz+bvQ7MWAlCVVOushCfQSzf/gs=;
        b=ePCA8z5DcGMIaqGuJ6svvvx31yQBYO3ftKV2/v0mLTpimEVBnH9OTjm3hrxvYmLEiy
         GGiPD1yf6ADOOJflIZlKAtQgPvbhs6dUr7fDkME39G6cDPQ2mDQSpyHTLCFg8QkVqEsD
         dWgMWtKkeP2LQ4ofNOUlXCLBBRUQucT3OEwjCUH0RyHmobODYHV1hc4/pCx3kV5Fmjo3
         ZTK7rrcn+akXk8bh4PR0oVqBf472oV2q/Fyech4Q9zcVXeej7jcMbp9ukuUEd1WLK2cw
         tBSK35whrwd/xtfwL7vSkPZgBWqcVTHT5AoTII0m4jduo/sVQqcqTsvoDcaquz8mgQln
         taFg==
X-Gm-Message-State: APjAAAWBRciAIFs/s1+jmBWO/GRb58a7iQ2IwMkmKiqEJCBCN0kYg7YS
        1obNFFJplp7rMLlMVCAfXA==
X-Google-Smtp-Source: APXvYqz0gYkokJcRjAqW8HiCvCyT6Me5ecBgGRpMvnyg9nu0rLlU67ybTofoHvPmkvfDTGJCeKnwSQ==
X-Received: by 2002:aca:5490:: with SMTP id i138mr175572oib.34.1575409969548;
        Tue, 03 Dec 2019 13:52:49 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s83sm654773oif.33.2019.12.03.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 13:52:48 -0800 (PST)
Date:   Tue, 3 Dec 2019 15:52:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: apr: Add protection domain
 bindings
Message-ID: <20191203215248.GA1688@bogus>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9c591-d04928e8-6440-488c-a956-3b5c9b8988bf-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7ee9c591-d04928e8-6440-488c-a956-3b5c9b8988bf-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 18, 2019 at 02:28:00PM +0000, Sibi Sankar wrote:
> Add optional "qcom,protection-domain" bindings for APR services. This
> helps to capture the dependencies between APR services and the PD on
> which each apr service run.
> 
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

Is name and path 2 values? Length is always 2?

You've got the same values for every case in the example. Is there a 
defined list of possible values?

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
