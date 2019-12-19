Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0C2F126860
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 18:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfLSRr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 12:47:59 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37955 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfLSRr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 12:47:58 -0500
Received: by mail-pl1-f196.google.com with SMTP id f20so2888422plj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T1xXSYuN/agEP+xV7gR2YsC5IQk2uBuXdMCptm0m2YY=;
        b=LnwL81uJzzHpQGW58xTLid7cnT2djPHkv4Ix1kkA+y3mk249gC8TuTISQnyzyotyvR
         GyrXXz8pSMkQCGZKN87K77JEeY6MIF+M9UKKVsbZTWFw2RWST60PkhbUouCoWzY5eggA
         /JVtw0QINwXh9GTwNFh+9uWyDM5/are+lQXj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T1xXSYuN/agEP+xV7gR2YsC5IQk2uBuXdMCptm0m2YY=;
        b=WOkYRijHUoLVjgfkayWC9SrfdHlIOHUVl/ox5h6h2TV1i5yWtm6L/lTNeLJC/VXbOM
         JdTRg+0Lnr/StAMLChFJCT3SEklGiqVoBTkhJt7WhhvhX7gmqEtGXErkY/Ajb2DdKZ+p
         mrSWDyEgaBRcncZ5/2ELqH4HcKxzrpranjTxQU4DQEwL0MXQkb9WkKMG2w1bWnwkpOb5
         6lqh+aPgMEaCcWJJtUaoo06tRP+Ed9jKZB1nP7cy2Gx3YYbF2BIKq7ysvSW7jAPUExdO
         jQkCG9otueEtPtWCqBp7I0wO9zxsD5QwOHv33gBV8+S0QTszpkVbRQWsFCJEUIdBHrFr
         U7CA==
X-Gm-Message-State: APjAAAUxC/NTvTr9BfVHC17MkJUYOWe7Dj6Be5/2omq7x9RmTUgfWWKn
        ZIme78I1xYmP4xBLZY3Fb28wbLyWOGZwLg==
X-Google-Smtp-Source: APXvYqxSvas1HYsFv66zRl2Qk5NQy60MqFsqe7M1+Z+WlhN/myDxxhPJLJMBff2b/jwrzeoQaazX4A==
X-Received: by 2002:a17:90a:cb96:: with SMTP id a22mr10875633pju.96.1576777677975;
        Thu, 19 Dec 2019 09:47:57 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id g11sm7967658pgd.26.2019.12.19.09.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 09:47:57 -0800 (PST)
Date:   Thu, 19 Dec 2019 09:47:55 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
Message-ID: <20191219174755.GY228856@google.com>
References: <1576741521-30102-1-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576741521-30102-1-git-send-email-pillair@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 19, 2019 at 01:15:21PM +0530, Rakesh Pillai wrote:
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---

This does not apply cleanly against the current qcom/arm64-for-5.6
or for-next branch, looks like you need to rebase.

>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 189254f..b2ca143f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -248,6 +248,11 @@
>  	status = "okay";
>  };
>  
> +&wifi {
> +	status = "okay";
> +	qcom,msa_fixed_perm;

What is the status of the patch adding this flag?

> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
>  &qup_i2c2_default {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..ce2d2a5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -42,6 +42,12 @@
>  			compatible = "qcom,cmd-db";
>  			no-map;
>  		};
> +
> +		wlan_fw_mem: memory@93900000 {
> +			compatible = "removed-dma-pool";
> +			no-map;
> +			reg = <0 0x93900000 0 0x200000>;
> +		};
>  	};
>  
>  	cpus {
> @@ -1119,6 +1125,28 @@
>  				#clock-cells = <1>;
>  			};
>  		};
> +
> +		wifi: wifi@18800000 {
> +			status = "disabled";

nit: the convention seems to be to add this at the end of the node,
which IMO makes sense since most other fields provide more 'interesting'
information.
