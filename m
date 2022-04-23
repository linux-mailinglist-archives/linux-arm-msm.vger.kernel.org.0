Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF4850CBA4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 17:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbiDWPVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 11:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbiDWPU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 11:20:59 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1E037017
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:18:01 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id a10so12269526oif.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/iwJYjpEKoA6plPdui6mmgpoHQToHr4LWUTKUs1qAxo=;
        b=dylddhhNvs2jkPpVPnBIzSPhmkPkalbZNGB0P01HX8GsKkLQM5fOBgVq5b/Riv8umC
         wiP3f3ZQ5BL2dbtdhwV+Kpi7kCXlLS+xhzuz62T6mnY9v0GvYOAWIRjKubBwejLcmuaS
         XOM+0TelNX3pQZulsSGczgYxvRCqNp5Pis6kdBoBuY7PbqalYU5HtohKcNXiQTQZGh2m
         aWDDoe9cH7tsg6ev0+Gf18UmUWx/KfRzBLOdHhUm1SiNzOyxLC/Gl6WWr6wvJ6ZstuR0
         pUUWGLXorhpI1D0gkDNcbQ/Tc/I1XEi0bsD/UaJJiLFwSMJPgYR9DdfyVJrMRzeP4sgQ
         KFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/iwJYjpEKoA6plPdui6mmgpoHQToHr4LWUTKUs1qAxo=;
        b=Dt0Ww6x2l5N+xfY4up/fXyrlWAXDUDrQfuTCvGkG+UZ1kQE2Na+9GRC2xp+6MEyb9R
         Qe5klei54juF9f3eFRxyF9tfktE06ognmLGU60NOnMPDrGMt7F/rl9nzK87slN6McaF6
         EssTP51HIFFn3aXC+yt01vVD984cPF/MASsvUlBJF7NVqWDBOcPt97qtd8naYPriVDN3
         dGND/+PeSN8Dnx5O6F1m5l0F4uH5ByQRogeiacw8Jk/d6ssOrmL9gposy+qUclY5DDLc
         kMCwM07N/s++vYg/7nUmsE95sXsyoqUCUmDl0HSNX6PSVF566NXmeCCCpwYqhocHQrkR
         8VMA==
X-Gm-Message-State: AOAM532JV7YAz4h3jU/YSufm+1aR5mJ9QvRp4G5L/uGlT+0euymQpDIf
        fYTk/ZSej3fwKcB9alqlQZpNowelQugwBaC3
X-Google-Smtp-Source: ABdhPJwT07eQFk4SDRyyNk4ZY9aVfHopVLfRyMWY0kqe9jQpslTXCgBmqPvStRDLHk63okmQu+JBmw==
X-Received: by 2002:a05:6808:1486:b0:2f9:e821:51d9 with SMTP id e6-20020a056808148600b002f9e82151d9mr4827811oiw.253.1650727081197;
        Sat, 23 Apr 2022 08:18:01 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id r8-20020a05683001c800b006059d4bc39dsm533504ota.6.2022.04.23.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 08:18:00 -0700 (PDT)
Date:   Sat, 23 Apr 2022 08:20:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        avri.altman@wdc.com, alim.akhtar@samsung.com,
        linux-arm-msm@vger.kernel.org, quic_asutoshd@quicinc.com,
        quic_cang@quicinc.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        ahalaney@redhat.com
Subject: Re: [PATCH v2 5/5] scsi: ufs: qcom: Enable RPM_AUTOSUSPEND for
 runtime PM
Message-ID: <YmQZIeA3xBHfudmf@ripper>
References: <20220423140245.394092-1-manivannan.sadhasivam@linaro.org>
 <20220423140245.394092-6-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423140245.394092-6-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 23 Apr 07:02 PDT 2022, Manivannan Sadhasivam wrote:

> In order to allow the block devices to enter autosuspend mode during
> runtime, thereby allowing the ufshcd host driver to also runtime suspend,
> let's make use of the RPM_AUTOSUSPEND flag.
> 
> Without this flag, userspace needs to enable the autosuspend feature of
> the block devices through sysfs.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/scsi/ufs/ufs-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index f47a16b7cff5..34c5970db445 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -876,6 +876,7 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  	hba->caps |= UFSHCD_CAP_WB_EN;
>  	hba->caps |= UFSHCD_CAP_CRYPTO;
>  	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
> +	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>  
>  	if (host->hw_ver.major >= 0x2) {
>  		host->caps = UFS_QCOM_CAP_QUNIPRO |
> -- 
> 2.25.1
> 
