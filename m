Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A001D43BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 04:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgEOCuu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 22:50:50 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39987 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgEOCut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 22:50:49 -0400
Received: by mail-ot1-f66.google.com with SMTP id d26so779867otc.7;
        Thu, 14 May 2020 19:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ozglBc+sLmCi94fyi9hM4nMjLfjck0uiAKDPMtJ/ktQ=;
        b=ECr0/UAyKyFFDJ2ku3XmPI+IYNoD1zjVfsHkXTU2ANlRVHZ7cWvSfbHLwLqLA5cUjY
         vKdcBSdLDbpY2qiojfBzO5Jvu6FcYhDmwPi6YOpUlgIo9wJ8RJcSr6F4p9T0QKAalWob
         yFpd0XwOpIHnTRoZqAS1QQR70nfhZ98klOnUFf4FILfn4QKiiXxStBtctn+rmTQ8lHcj
         H34xjdQA/aAV5Kp1CmtaO6INa3715cnwGMFGg6/pBpMKygs1vVSDQU1kJNyLNbx03cvD
         ZiomcyYOdIdjCexPmshbyprfnu1HfHe+RAqg6O+s9x8975NhwsrVGv40zE1v15kGeLNb
         MPlQ==
X-Gm-Message-State: AOAM531svvF5TG5dhnjmLUyBgVQRJZqOpJbqQbsDQcoj/lkOIRkppxiL
        qvWrbtwzjIaOW0YAyZrW1w==
X-Google-Smtp-Source: ABdhPJyf3I3BEvGznd2LmPlqdpXGJf9rz4M+SJAOYC+ZrQGj/mDBIoUotlVom7IQ3onC2yi+Xbff4w==
X-Received: by 2002:a9d:7414:: with SMTP id n20mr773057otk.61.1589511048634;
        Thu, 14 May 2020 19:50:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o17sm237457otp.79.2020.05.14.19.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 19:50:48 -0700 (PDT)
Received: (nullmailer pid 30844 invoked by uid 1000);
        Fri, 15 May 2020 02:50:47 -0000
Date:   Thu, 14 May 2020 21:50:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sarthak Garg <sartgarg@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V1 1/7] dt-bindings: mmc: Add information for DLL
 register properties
Message-ID: <20200515025047.GA27895@bogus>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
 <1588838535-6050-2-git-send-email-sartgarg@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588838535-6050-2-git-send-email-sartgarg@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 01:32:08PM +0530, Sarthak Garg wrote:
> Add information regarding DLL register properties for getting target
> specific configurations. These DLL register settings may vary from
> target to target.
> 
> Also new compatible string value for sm8250 target.
> 
> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 5445931..b8e1d2b 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -17,6 +17,7 @@ Required properties:
>  		"qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
>  		"qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
>  		"qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
> +		"qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
>  		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
>  		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
>  		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> @@ -46,6 +47,13 @@ Required properties:
>  	"cal"	- reference clock for RCLK delay calibration (optional)
>  	"sleep"	- sleep clock for RCLK delay calibration (optional)
>  
> +- qcom,ddr-config: Certain chipsets and platforms require particular settings
> +	for the DDR_CONFIG register. Use this field to specify the register
> +	value as per the Hardware Programming Guide.
> +
> +- qcom,dll-config: Chipset and Platform specific value. Use this field to
> +	specify the DLL_CONFIG register value as per Hardware Programming Guide.

Board specific or SoC specific? If the latter, imply this from the 
compatible string.
