Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DC5F3C84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 01:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfKHAFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 19:05:22 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37737 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfKHAFW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 19:05:22 -0500
Received: by mail-pl1-f193.google.com with SMTP id p13so2763008pll.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 16:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6v8SDASei3Tghr78YejZDJe+lHNiHbnoi8Ih1OcL+t4=;
        b=sNNo/6xY8cV71z8yUITd9T6QMhWR2byT8RR+WQ9M9RA9YDVTnBxr4TJNhvvQWkEHYA
         MjecelzZ8LqwYKcMf+iRTn01U1XYydW74ERI8vYg9vK7RFOCMP0Ipsn8v8KYJKq1WlE9
         MCCtoeyb6+9tVOwJyGCru4Z6hLQyT5Xoo8Vzkys83N8S9enIdiN2vFJU/ZuAjdMVRVHx
         R/F9Ni9zXJGi3f7HSXL9/YIYQlZY2qqF9pTCXwZreedu02yMwiAMjYnO36gTzztWReZp
         s9nHQH7fgT9KarVy+jPGRr79YKKOFC/5dQUs/WaLNTFTuRa2LDzfCs6gRUxe3R2uBMij
         YiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6v8SDASei3Tghr78YejZDJe+lHNiHbnoi8Ih1OcL+t4=;
        b=gOpBC2jIDE0zCpnxmkBhiNH/Rsr5KD5mrEfxryTSZpzYsdSbrtIHQsV8a/faLmVfXP
         hvmb4aCRi8oPs9vH9XlNOnLcB7MdaFp7Rcxrbi1kxsQLjqEQ8UKkgj3JzSi0NRYwwSS8
         Ae8gw80mOSGDO/jBd6SJfvo/isjtPh2PYlEcoNxhesw/ZCZOweL5G1FS52dh7ESgxSnk
         vBbbv371lUNd8v9C4gbuUHT4ZvGmqXa3XuhPv/AIafIyIjXhGVdIYFD2Reh9fFXRLbF1
         MPaCKYzIHsVwj43peNeB1WepqB453RoYhPimxt3lPdOgIQhZoSRodhRJlZRuBBR6FBsP
         B9wg==
X-Gm-Message-State: APjAAAUrFwPJYxjWv/hM1IV+j/n6Tv8VWl0ZC3mthtMmUJYX7wGZZNiF
        9i+Ph3nDIB3y5JV2IbYXuRpvOw==
X-Google-Smtp-Source: APXvYqyjgVcPt6Onvd740Fiv2iqgkI3f20+LTNFnzIdCDMgsn9wHISmYgEmxLnfOgQmdR4ne8H9RQQ==
X-Received: by 2002:a17:90a:a416:: with SMTP id y22mr9267397pjp.74.1573171521083;
        Thu, 07 Nov 2019 16:05:21 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v3sm3522772pfn.129.2019.11.07.16.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 16:05:20 -0800 (PST)
Date:   Thu, 7 Nov 2019 16:05:18 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     saiprakash.ranjan@codeaurora.org, agross@kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] firmware: qcom_scm-32: Use SMC arch wrappers
Message-ID: <20191108000518.GC3907604@builder>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-11-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572917256-24205-11-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Nov 17:27 PST 2019, Elliot Berman wrote:

> Use SMC arch wrappers instead of inline assembly.
> 

I presume this is the point in the series where you can drop the
CFLAGS_qcom_scm-32.o from the Makefile? Please include that in this
patch.

Regards,
Bjorn

> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-32.c | 71 ++++++++++--------------------------------
>  1 file changed, 17 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index b7f9f28..e3dc9a7 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -10,6 +10,7 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/qcom_scm.h>
> +#include <linux/arm-smccc.h>
>  #include <linux/dma-mapping.h>
>  
>  #include "qcom_scm.h"
> @@ -121,25 +122,13 @@ static inline void *legacy_get_response_buffer(const struct legacy_response *rsp
>  static u32 __qcom_scm_call_do(u32 cmd_addr)
>  {
>  	int context_id;
> -	register u32 r0 asm("r0") = 1;
> -	register u32 r1 asm("r1") = (u32)&context_id;
> -	register u32 r2 asm("r2") = cmd_addr;
> +	struct arm_smccc_res res;
>  	do {
> -		asm volatile(
> -			__asmeq("%0", "r0")
> -			__asmeq("%1", "r0")
> -			__asmeq("%2", "r1")
> -			__asmeq("%3", "r2")
> -#ifdef REQUIRES_SEC
> -			".arch_extension sec\n"
> -#endif
> -			"smc	#0	@ switch to secure world\n"
> -			: "=r" (r0)
> -			: "r" (r0), "r" (r1), "r" (r2)
> -			: "r3", "r12");
> -	} while (r0 == QCOM_SCM_INTERRUPTED);
> -
> -	return r0;
> +		arm_smccc_smc(1, (unsigned long)&context_id, cmd_addr,
> +			      0, 0, 0, 0, 0, &res);
> +	} while (res.a0 == QCOM_SCM_INTERRUPTED);
> +
> +	return res.a0;
>  }
>  
>  /**
> @@ -236,24 +225,12 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
>  static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
>  {
>  	int context_id;
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(LEGACY_ATOMIC(svc, cmd, 1), (unsigned long)&context_id,
> +		      arg1, 0, 0, 0, 0, 0, &res);
>  
> -	register u32 r0 asm("r0") = LEGACY_ATOMIC(svc, cmd, 1);
> -	register u32 r1 asm("r1") = (u32)&context_id;
> -	register u32 r2 asm("r2") = arg1;
> -
> -	asm volatile(
> -			__asmeq("%0", "r0")
> -			__asmeq("%1", "r0")
> -			__asmeq("%2", "r1")
> -			__asmeq("%3", "r2")
> -#ifdef REQUIRES_SEC
> -			".arch_extension sec\n"
> -#endif
> -			"smc    #0      @ switch to secure world\n"
> -			: "=r" (r0)
> -			: "r" (r0), "r" (r1), "r" (r2)
> -			: "r3", "r12");
> -	return r0;
> +	return res.a0;
>  }
>  
>  /**
> @@ -269,26 +246,12 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
>  static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
>  {
>  	int context_id;
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(LEGACY_ATOMIC(svc, cmd, 2), (unsigned long)&context_id,
> +		      arg1, arg2, 0, 0, 0, 0, &res);
>  
> -	register u32 r0 asm("r0") = LEGACY_ATOMIC(svc, cmd, 2);
> -	register u32 r1 asm("r1") = (u32)&context_id;
> -	register u32 r2 asm("r2") = arg1;
> -	register u32 r3 asm("r3") = arg2;
> -
> -	asm volatile(
> -			__asmeq("%0", "r0")
> -			__asmeq("%1", "r0")
> -			__asmeq("%2", "r1")
> -			__asmeq("%3", "r2")
> -			__asmeq("%4", "r3")
> -#ifdef REQUIRES_SEC
> -			".arch_extension sec\n"
> -#endif
> -			"smc    #0      @ switch to secure world\n"
> -			: "=r" (r0)
> -			: "r" (r0), "r" (r1), "r" (r2), "r" (r3)
> -			: "r12");
> -	return r0;
> +	return res.a0;
>  }
>  
>  /**
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
