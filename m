Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B076C46E77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 07:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfFOFYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jun 2019 01:24:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34156 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfFOFYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jun 2019 01:24:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id p10so2718492pgn.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 22:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yNrW6xp0TlnPUlwSYk5j3h7SqKf8zU2qbYKV+9+hWKs=;
        b=K37drCDl2YToHdNt3/k2l0v+EgT7kFzkGif0g3TSgO0Mi2CKUthFhZJmSlgEt8khpM
         f0RYanS9uEM525eHFVUqj26x+9o3gud3UD1v9aNAuc9rndWMFQVZdce//D1P4vxWGTin
         spArlN2S/1WRC+09DYbu92oSzgn8LUWM7KJNPuwZaJlyhMDdc6mfKCnFsc/d0UXBT6mQ
         hpO9iP2HMvr6wXqcKvJij/+IC0y2tZVkJwd+MaoEvhdv7/olByoqxg2tLpe1kbi/WMvz
         pmY4WXSpjbJacVahAz+eSstce15LJDLyKw89JmE2TfDEClC4QeySUkP0aNSlYuadXmCk
         hSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yNrW6xp0TlnPUlwSYk5j3h7SqKf8zU2qbYKV+9+hWKs=;
        b=mPrjS2utvT2yLu7jkVsx5J8xmGK7/VSVHmoK9AJZ/Fz4h20iVkZ6m8SnwJI52Dy0OF
         2LntlPsyxrkvyH20NwyKtdJYVJ+ZIUxXYBv3psPOp8Xif5MQXZZoDdQ0DCyFX4AYVc+7
         YWzwzWyzhHBU9TpU07ivViSc5DY66iSyit4e+QnTpySeS5H7/jLm9ThmPSMhjgS9fKre
         x8krRsvAdGOUvYcVthq3HtjCHGI4N1r2QVNsLOOoow3/kOmBgp28VKNtD2v7PEfclGTV
         yjAg+elaJ/b0P5L90g1uQCt50Pwehx3FJnt/NuhnTHh8FZ0jSJStCRBQYlc2U25OLoGU
         v/Wg==
X-Gm-Message-State: APjAAAVaERVewPE9XPqvQJoCtAF2COWC10GvcHF6qA3Dt80bYU8wBBiv
        vXOiInzO3vWngXKHg5wHzHr0+Q==
X-Google-Smtp-Source: APXvYqzTvXEEYJ3N7K6IN/K+BR9rccVM5BVHvLSzLlaPMDTRzQDWsoNt+nbmV10GcCcZFEZJQ9VrhQ==
X-Received: by 2002:a63:1243:: with SMTP id 3mr14798306pgs.235.1560576239520;
        Fri, 14 Jun 2019 22:23:59 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 10sm4404372pfh.179.2019.06.14.22.23.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 22:23:58 -0700 (PDT)
Date:   Fri, 14 Jun 2019 22:24:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@sonymobile.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH -next] soc: qcom: fix QCOM_AOSS_QMP dependency and build
 errors
Message-ID: <20190615052446.GA31088@tuxbook-pro>
References: <6d97f8dc-f980-7825-4aa6-27f56b25bc3a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d97f8dc-f980-7825-4aa6-27f56b25bc3a@infradead.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 14 Jun 14:47 PDT 2019, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix Kconfig warning and subsequent build errors that are caused
> when PM_GENERIC_DOMAINS=y but CONFIG_PM is not set/enabled.
> 

Thanks Randy, I thought I had all angles covered here.

Applied to our -next branch.

Regards,
Bjorn

> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
>   Depends on [n]: PM [=n]
>   Selected by [m]:
>   - QCOM_AOSS_QMP [=m] && (ARCH_QCOM || COMPILE_TEST [=y]) && MAILBOX [=y] && COMMON_CLK [=y]
> 
> Fixes these build errors:
> 
> ../drivers/base/power/domain.c: In function ‘genpd_queue_power_off_work’:
> ../drivers/base/power/domain.c:485:13: error: ‘pm_wq’ undeclared (first use in this function)
>   queue_work(pm_wq, &genpd->power_off_work);
> ../drivers/base/power/domain.c:485:13: note: each undeclared identifier is reported only once for each function it appears in
> ../drivers/base/power/domain.c: In function ‘genpd_dev_pm_qos_notifier’:
> ../drivers/base/power/domain.c:675:25: error: ‘struct dev_pm_info’ has no member named ‘ignore_children’
>    if (!dev || dev->power.ignore_children)
> ../drivers/base/power/domain.c: In function ‘rtpm_status_str’:
> ../drivers/base/power/domain.c:2754:16: error: ‘struct dev_pm_info’ has no member named ‘runtime_error’
>   if (dev->power.runtime_error)
> ../drivers/base/power/domain.c:2756:21: error: ‘struct dev_pm_info’ has no member named ‘disable_depth’
>   else if (dev->power.disable_depth)
> ../drivers/base/power/domain.c:2758:21: error: ‘struct dev_pm_info’ has no member named ‘runtime_status’
>   else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
> ../drivers/base/power/domain.c:2759:31: error: ‘struct dev_pm_info’ has no member named ‘runtime_status’
>    p = status_lookup[dev->power.runtime_status];
> ../drivers/base/power/domain_governor.c: In function ‘default_suspend_ok’:
> ../drivers/base/power/domain_governor.c:82:17: error: ‘struct dev_pm_info’ has no member named ‘ignore_children’
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20190614.orig/drivers/soc/qcom/Kconfig
> +++ linux-next-20190614/drivers/soc/qcom/Kconfig
> @@ -8,7 +8,7 @@ config QCOM_AOSS_QMP
>  	tristate "Qualcomm AOSS Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on MAILBOX
> -	depends on COMMON_CLK
> +	depends on COMMON_CLK && PM
>  	select PM_GENERIC_DOMAINS
>  	help
>  	  This driver provides the means of communicating with and controlling
> 
> 
