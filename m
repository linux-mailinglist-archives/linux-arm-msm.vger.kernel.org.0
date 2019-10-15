Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A12FD6F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 08:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfJOG1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 02:27:49 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45681 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfJOG1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 02:27:49 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so10297601pgj.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2019 23:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k5eIEG1/gLx0erMcT6WJ5ct3wjvosArYgfGc6QVQQXM=;
        b=eG2kFOCINOfTU7RMqrQbCJMdHPI7tVrQoMqDYn0Xa1y4JM0t36oUF+nwZk5e6GZ81y
         ZkqaJh2iLwLueKtIwDgcBeOlp/bFIbT+XL30e+zNDUEIv/OL7U0BEV4IldDW/QL+CPBg
         73Us+47xLzbK90seyxwYYCrSS6unCEdspkuAnVNihAqom7KsFr1Z1d9bihFskCDbEGwf
         9l2WBdpxdnMFLc3ZOVVIZshDR59viVkRH8i0+874uWAC3ZQDfwlCQfFIsOmk0MP4UVvj
         I/Lt+PmL3mXY3QI83Hk3+LLBgj9B8LgHE2NQA9Jtc9W67IE2pGSfWlz4nqh46cRY0xh1
         g1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k5eIEG1/gLx0erMcT6WJ5ct3wjvosArYgfGc6QVQQXM=;
        b=ZsyD4wU/HZp+oRI46U/S335QW6vNkHsUn54w40xCUUNjP0iOwsQEYspRAhfpFSQfYC
         axzTYpFXMwl396GwmC2jyns7Ma3QgSIoaoczrIrOLJObmDnf9bor/dIDIBc+1oNYR8Hp
         SkGOxlPNiJmoWWq0DX0kJEoLrxpZTBAs/RiGW1C6yVlCF9TdPk7h3gDiOL4bPbagIkQl
         XVEzlmyQwjH39+aNNKXwuQhX9rIkCYEr4JWr/0GjAhpSTn2IW5VLn1ivLY/cP+PFQNfU
         jsSsvuM5I0/SN+9/7l31JQZ8+ySm9jvul+VRzvvpCm4I3pqklmHKRO4+Dq9th0wKrVC+
         CzOg==
X-Gm-Message-State: APjAAAWEtT1gAnysFwrf4QHcxWVgTxAYB2MrxHF0Z4Iw5dP3vd31V2HX
        tEPvFVRv5bKSKb72hjyETE1CDA==
X-Google-Smtp-Source: APXvYqzhmwcv+fCSsN/FiQs4MRlCLKvFXHjqsRUklAlobdqcmo7w0pGtSLJtHkN+RYOtXpMTh0brfg==
X-Received: by 2002:a63:2309:: with SMTP id j9mr35711070pgj.3.1571120868520;
        Mon, 14 Oct 2019 23:27:48 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w12sm3333477pfq.138.2019.10.14.23.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 23:27:47 -0700 (PDT)
Date:   Mon, 14 Oct 2019 23:27:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     nikitos.tr@gmail.com
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net
Subject: Re: [PATCH 1/2] arm64: dts: msm8916-longcheer-l8150: Enable WCNSS
 for WiFi and BT
Message-ID: <20191015062745.GA4731@tuxbook-pro>
References: <20191012145821.20846-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191012145821.20846-1-nikitos.tr@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 12 Oct 07:58 PDT 2019, nikitos.tr@gmail.com wrote:

> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> WCNSS is used on L8150 for WiFi and BT.
> Its firmware isn't relocatable and must be loaded at specific address.
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>

Both patches applied

Thank you,
Bjorn

> ---
>  .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> index 2b28e383fd0b..e4d467e7dedb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> @@ -18,6 +18,16 @@
>  		stdout-path = "serial0";
>  	};
>  
> +	reserved-memory {
> +		// wcnss.mdt is not relocatable, so it must be loaded at 0x8b600000
> +		/delete-node/ wcnss@89300000;
> +
> +		wcnss_mem: wcnss@8b600000 {
> +			reg = <0x0 0x8b600000 0x0 0x600000>;
> +			no-map;
> +		};
> +	};
> +
>  	soc {
>  		sdhci@7824000 {
>  			status = "okay";
> @@ -68,6 +78,10 @@
>  			};
>  		};
>  
> +		wcnss@a21b000 {
> +			status = "okay";
> +		};
> +
>  		/*
>  		 * Attempting to enable these devices causes a "synchronous
>  		 * external abort". Suspected cause is that the debug power
> -- 
> 2.19.1
> 
