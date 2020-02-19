Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA2A164F92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 21:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgBSUIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 15:08:31 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45377 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgBSUIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 15:08:31 -0500
Received: by mail-ot1-f67.google.com with SMTP id 59so1368409otp.12;
        Wed, 19 Feb 2020 12:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nXxtRM6f2jt8ayWG1c/acsbNLpFxWVreueJEPdmTXOo=;
        b=HoX5TEXOyJef6vEvLY011bvOl/RQLcliPl5ZdJzR37bmX0HGHB3YxeNErAIMYayFHz
         oLf9ZMkDRHqAnkNgtRYp83pQJ1eRmL67434gxV37HTg4hqyjY0YuELxBGBCebWgO26WT
         3SzkOn2ITuugibAem/aClId2oJW2CgZGEUEMb0jaelLGNJH0fV/g9JmXW9KBIOWQgEJQ
         P+3JAkQGkZQS+wlxozKalCu3qk2BTxRHbIELQC5MZiIUs+24Yl7cc+1UpNZpAcyhJ0l6
         bM35fn92iiQ/osefNw1pFOmx37rywrix6EY93tZ7cEM9MaCKypNEGW2FrG9RCu6fx8U0
         UwBw==
X-Gm-Message-State: APjAAAWqlGw/ZbrvfM6DWKntuFD3WLtDqmeZC4IzsljPyhJDUiRZpDfW
        NDabsSFCc8D39bRQeg0fUw==
X-Google-Smtp-Source: APXvYqyoLoGDEXegS/LPzNhi25kf+RBpBzucu+O+846cQ9H0W1aDtu/TkotCfT99oMMTTJ6zWGpszA==
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr21679753otq.75.1582142908897;
        Wed, 19 Feb 2020 12:08:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x22sm263707otk.23.2020.02.19.12.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 12:08:28 -0800 (PST)
Received: (nullmailer pid 20348 invoked by uid 1000);
        Wed, 19 Feb 2020 20:08:27 -0000
Date:   Wed, 19 Feb 2020 14:08:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org, dianders@google.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V2] dt-bindings: mmc: sdhci-msm: Add CQE reg map
Message-ID: <20200219200827.GA17094@bogus>
References: <1581434955-11087-1-git-send-email-vbadigan@codeaurora.org>
 <1581680753-9067-1-git-send-email-vbadigan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581680753-9067-1-git-send-email-vbadigan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 14, 2020 at 05:15:52PM +0530, Veerabhadrarao Badiganti wrote:
> CQE feature has been enabled on sdhci-msm. Add CQE reg map
> that needs to be supplied for supporting CQE feature.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
> 
> Changes since V1:
> 	- Updated description for more clarity & Fixed typos.
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 7ee639b..ad0ee83 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -26,7 +26,13 @@ Required properties:
>  
>  - reg: Base address and length of the register in the following order:
>  	- Host controller register map (required)
> -	- SD Core register map (required for msm-v4 and below)
> +	- SD Core register map (required for controllers earlier than msm-v5)
> +	- CQE register map (Optional, CQE support is present on SDHC instance meant
> +	                    for eMMC and version v4.2 and above)
> +- reg-names: When CQE register map is supplied, below reg-names are required
> +	- "hc_mem" for Host controller register map
> +	- "core_mem" for SD core register map
> +	- "cqhci_mem" for CQE register map

'_mem' is redundant, so drop.

>  - interrupts: Should contain an interrupt-specifiers for the interrupts:
>  	- Host controller interrupt (required)
>  - pinctrl-names: Should contain only one value - "default".
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
> 
