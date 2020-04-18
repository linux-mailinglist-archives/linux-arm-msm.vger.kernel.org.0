Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCA41AEA71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 09:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgDRHM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 03:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgDRHM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 03:12:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55745C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 00:12:58 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id np9so2089116pjb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 00:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9O0aopEBCTCXPKDGoPBM1d5DxPebLrpuZOmwI1ViU3o=;
        b=MPlfhCuKMdPN6iwOaMoNiLqFWiHzDyLpZekidDQ3S2s8nfg8lcoExi4mNEXiCILHsF
         WVKeT+UjynS9gCiho2r6P1agy/eepg2dweqpEudDsa+G+3nD/jv+H3iMPAv6iPZwJWua
         9ppv2By5BIUqYldgqrKfgNkl6iGCEyBIWAnFmn5ylMiOI33pmId2kN+mI2VmMZtv5IFh
         h/KW/qeBO9r6d+xuSh9PQKNe40pkZtT6qHKMXNdSmz1xkaD6pjI+OgysQZuVbuOgpT3R
         uSeHHJAfY9M+njg1+MICXHUGV7dp3aA65dKHOSxVY0HO/HiS65f6E/osJDeVM/B4f6ch
         jkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9O0aopEBCTCXPKDGoPBM1d5DxPebLrpuZOmwI1ViU3o=;
        b=gZu7gk3GhSBL7cwXYeusUadtzFSsyMX71c3YqaviSUnOPJARxcyNYhtiKZxA9AjPzh
         UYEWAU+2BTeQXWAwQVQCw8wAjEWYe5h2k7M+IbVWpZLrIpUAXxWgmAQ13MoBQe7s57sn
         CATebjZXjs3zP3/0uwNPTlTYCqpXa4KARglLyRg9XOCWZkDRrPnX2rsBUp2PD+KI1C/6
         INkhFRB7e7z/1iky6GnlDOuEOKSFFioDyHPu9o5g8Bsrwa/mu4O/+5NhMtuFNjyLFzYW
         78tIFwJx/MeHRz8xSY+wESBOQiRJDK99AJjye4m+DtFoM0W04hMtROPQtTS/CIMiXyZC
         pvzg==
X-Gm-Message-State: AGi0PuahE7WYLHQU6cecrQ3+9QhPRuXSUVCWCRj16v4JStNRECsqgPPt
        wgNeziP+XANCib1ggUTebv+v5w==
X-Google-Smtp-Source: APiQypJOOUmRIXjCLoJCDfAURUKxoqz5ld8ftLF9ax/JQ06GdXXPxgL3CYNk5DQJPwa83qYQRrR/dA==
X-Received: by 2002:a17:90a:9b17:: with SMTP id f23mr8804210pjp.118.1587193977569;
        Sat, 18 Apr 2020 00:12:57 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d8sm16157965pfd.159.2020.04.18.00.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 00:12:56 -0700 (PDT)
Date:   Sat, 18 Apr 2020 00:13:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     agross@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        jejb@linux.ibm.com, martin.petersen@oracle.com,
        p.zabel@pengutronix.de, cang@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] scsi: ufs-qcom: remove unneeded variable 'ret'
Message-ID: <20200418071317.GO20625@builder.lan>
References: <20200418070625.11756-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418070625.11756-1-yanaijie@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 18 Apr 00:06 PDT 2020, Jason Yan wrote:

> Fix the following coccicheck warning:
> 
> drivers/scsi/ufs/ufs-qcom.c:575:5-8: Unneeded variable: "ret". Return
> "0" on line 590
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/scsi/ufs/ufs-qcom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 19aa5c44e0da..701e9184adff 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -572,7 +572,6 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	struct phy *phy = host->generic_phy;
> -	int ret = 0;
>  
>  	if (ufs_qcom_is_link_off(hba)) {
>  		/*
> @@ -587,7 +586,7 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  		ufs_qcom_disable_lane_clks(host);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> -- 
> 2.21.1
> 
