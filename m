Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB1742FB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 21:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbfFLTND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 15:13:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39379 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfFLTND (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 15:13:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id 196so9452465pgc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2019 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T+RRgg1K5LwClEl17mECCpFAJnPrxCkPYv4gJ/BZlgo=;
        b=WcncelRIf/GhuCYp31jFfmC/CT6gi9hyGO8tZtDqa3S6I763xjCea8yODKmDo/SK0M
         Oz4BKUZU5706cuMRBI8ksIz3TVzUDglZHgHYxOdna+5Qrfxp0bQwAsSIvqWUXP+8Gua7
         HQSKA+I8pSN/RBDfOimd6xuTlV7zM/uzwRhMVC6MlsqKZ2k5261Q7gOubWik/0DuTaAy
         lR8yYhu9rqIBuncO7aBzMKZIdXgZD+tJC9+FYWt6lwj/EgH575dhO9h/8ufCZlgD0Jq1
         BH89C/yWVhXL8M005z/KdU1z6hDilRA8Se3NkE38zClneJphRKvB3hj7NwMxmQKBJl4Y
         6BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T+RRgg1K5LwClEl17mECCpFAJnPrxCkPYv4gJ/BZlgo=;
        b=e14JCMV+Z8iokOCi/laBlTG9nS12KDrs3Z7otA3UVzkGgIH2AjiPteIfHyK8MWstck
         48OGaVigK/zDYCnfEa1uRO3dFrF4EQXVtJUUf1IFrmLySlsRju5uEoABPHF/n/bB1O+f
         2hZOzBpuHtm3AYvwbllBBcKr1Gx2o3P2BCv4a+XrNg5sJ3ewHo3KO0lX2l5MhorI4Te1
         9ZC9vFHKwn5QFsLfW9egHgkRZPw7UOeqmU3iCoyomgoh983MEcRK+z6shlmiR5XNnVB7
         V8l8Q9b8VI+uCiv8DUhwnF/NxjLfoyM0Tjgc0n7iBdzTKzckVFtx5zPcFjF/DlN9hvhE
         T4JA==
X-Gm-Message-State: APjAAAVxhtNcjvHQ10VqyN0G6yhbvFw7790qFbbsprNQxv82qV9Ezfr0
        z6rWEA9Uu3o3JGbvEElbXJho5A==
X-Google-Smtp-Source: APXvYqwILt61lSMu2MlpNBfbNURs3gIUH9XAmDY/cSvzbtjVDYAc25LwFlB5j4/TEyd5sKywi+jDuw==
X-Received: by 2002:a63:31d8:: with SMTP id x207mr25147871pgx.403.1560366782531;
        Wed, 12 Jun 2019 12:13:02 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j2sm308430pfb.157.2019.06.12.12.13.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 12:13:01 -0700 (PDT)
Date:   Wed, 12 Jun 2019 12:13:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1] clk: qcom: msm8916: Don't build support by default
Message-ID: <20190612191347.GE22737@tuxbook-pro>
References: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 08:52 PDT 2019, Marc Gonzalez wrote:

> Build QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 by default only when
> we're building MSM_GCC_8916.
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Not sure why these are default at all.

But both drivers are used on platforms other than 8916 as well, so if
anything a fix would be to rename the APCS_MSM8916 to something more
generic (such as QCOM_CLK_APCS_GLOBAL) - but then the content should be
updated and the APCS mailbox driver as well...

Regards,
Bjorn

> ---
>  drivers/clk/qcom/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83cc361e..d5b065f64afc 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -21,7 +21,7 @@ if COMMON_CLK_QCOM
>  
>  config QCOM_A53PLL
>  	tristate "MSM8916 A53 PLL"
> -	default ARCH_QCOM
> +	default MSM_GCC_8916
>  	help
>  	  Support for the A53 PLL on MSM8916 devices. It provides
>  	  the CPU with frequencies above 1GHz.
> @@ -31,7 +31,7 @@ config QCOM_A53PLL
>  config QCOM_CLK_APCS_MSM8916
>  	tristate "MSM8916 APCS Clock Controller"
>  	depends on QCOM_APCS_IPC || COMPILE_TEST
> -	default ARCH_QCOM
> +	default MSM_GCC_8916
>  	help
>  	  Support for the APCS Clock Controller on msm8916 devices. The
>  	  APCS is managing the mux and divider which feeds the CPUs.
> -- 
> 2.17.1
