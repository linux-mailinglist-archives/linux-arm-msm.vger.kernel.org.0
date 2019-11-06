Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502D4F0EB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbfKFGGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:06:44 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39009 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfKFGGn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:06:43 -0500
Received: by mail-pf1-f195.google.com with SMTP id x28so14816053pfo.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 22:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fO9CrBS473r9XGUdz2X4YAYhNUAr7K3z7Xk6Z0Ias98=;
        b=kGSS6/NUHh/Fup/XJqoBe7jFEOS/vhjKWUgVhYRmZPp8vAgibEJRH+LeErMLdkJDx3
         EzQ2Wx7l9W5MDFG77PYGVDSBk9cJ8ET3GILuFwVMIG2mGrrgaXu4IS60yUyzyvvsyoZf
         +APwEWRSu1UJcUOmmH6ObV4Uqpq6LMHq9C4C+9NtSkjqcP1hnKI5wvA+eKGOVGE+ngSh
         IIf8XsRlCuHU1AD8xqXq0mq4SuHMceFUenOZELkEsp24HdiRHecs6U9ztWpsNKGMwvDV
         en7jQCnooWBjC/HBpnYG+LQEGzs8U7+r577jDwL4C+wpvihc3UWfQJGgH36ZIleCiaRs
         dngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fO9CrBS473r9XGUdz2X4YAYhNUAr7K3z7Xk6Z0Ias98=;
        b=omoT4SOeFc1JQ40RNN5jUP36Pe0n2/RfQgIg4XwhHyX5VPZr1ElSFRlzZ4A1bp/pVC
         OZEHgKZq/ardSUBEKjedlbomqGxs/FfN4NfPsKHDKOpdSbWDt0OMvcNfGz7tgOUgiS/N
         uWnOM5xESJz8N3HswSg0e0yZJPeA+vHXEOBsEc9HRNwMWXO7wDWtzefwC57WHHQI50Fu
         ft2e0rdcHRnQl+KhITU2t050wyObZJWuAZclnQrBT4I21ETfcCWMwRm9jbdGa4nK1fTR
         7toDbhqVcpw/fKr9fIoa55MLw4Z+xQMZNBjl1CBSTi1k+x7o6Sbw2S7HkAPWg8dedD6k
         tIZQ==
X-Gm-Message-State: APjAAAVUbYBCN0DorbuknmH5mcrHUd9b/t83hxetqwL3zXEwA2dBxfMF
        yAXLa45q2WC7mwi1b+v9WPY98A==
X-Google-Smtp-Source: APXvYqzu7WZCjQLQEg/l+E5HdBN9m1CmE4icYgrdQXZDWyNLvvUNorLU3uA/VqSewS4wkLAOvt7rQA==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr945937pgb.22.1573020403012;
        Tue, 05 Nov 2019 22:06:43 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l33sm7283735pgb.79.2019.11.05.22.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:06:42 -0800 (PST)
Date:   Tue, 5 Nov 2019 22:06:40 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     saiprakash.ranjan@codeaurora.org, agross@kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] firmware: qcom_scm: Remove unused
 qcom_scm_get_version
Message-ID: <20191106060640.GH586@tuxbook-pro>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-5-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572917256-24205-5-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Nov 17:27 PST 2019, Elliot Berman wrote:

> Remove unused qcom_scm_get_version.
> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/firmware/qcom_scm-32.c | 36 ------------------------------------
>  include/linux/qcom_scm.h       |  2 --
>  2 files changed, 38 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index b09fddf..b7f9f28 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -291,42 +291,6 @@ static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
>  	return r0;
>  }
>  
> -u32 qcom_scm_get_version(void)
> -{
> -	int context_id;
> -	static u32 version = -1;
> -	register u32 r0 asm("r0");
> -	register u32 r1 asm("r1");
> -
> -	if (version != -1)
> -		return version;
> -
> -	mutex_lock(&qcom_scm_lock);
> -
> -	r0 = 0x1 << 8;
> -	r1 = (u32)&context_id;
> -	do {
> -		asm volatile(
> -			__asmeq("%0", "r0")
> -			__asmeq("%1", "r1")
> -			__asmeq("%2", "r0")
> -			__asmeq("%3", "r1")
> -#ifdef REQUIRES_SEC
> -			".arch_extension sec\n"
> -#endif
> -			"smc	#0	@ switch to secure world\n"
> -			: "=r" (r0), "=r" (r1)
> -			: "r" (r0), "r" (r1)
> -			: "r2", "r3", "r12");
> -	} while (r0 == QCOM_SCM_INTERRUPTED);
> -
> -	version = r1;
> -	mutex_unlock(&qcom_scm_lock);
> -
> -	return version;
> -}
> -EXPORT_SYMBOL(qcom_scm_get_version);
> -
>  /**
>   * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
>   * @entry: Entry point function for the cpus
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index f8b6525..05a1c7a 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -59,7 +59,6 @@ extern bool qcom_scm_hdcp_available(void);
>  extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>  			     u32 *resp);
>  extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
> -extern u32 qcom_scm_get_version(void);
>  extern bool qcom_scm_is_available(void);
>  #else
>  
> @@ -101,7 +100,6 @@ static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>  				    u32 *resp) { return -ENODEV; }
>  static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
>  		{ return -ENODEV; }
> -static inline u32 qcom_scm_get_version(void) { return 0; }
>  static inline bool qcom_scm_is_available(void) { return false; }
>  #endif
>  #endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
