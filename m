Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9690250CBA1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 17:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbiDWPUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 11:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbiDWPU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 11:20:29 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAED126ACC
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:17:29 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-e5ca5c580fso11681641fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fnmRor+G2D1A88qeFWDKTCLrgCDC7LbHt+ZKriC7uCo=;
        b=a1fxvvRjIDKaHXhBr17w0wxlEbod/j9QA4dgu1KbF/8Nn2u62x31b333t8DaNptQtw
         V2gSfpYX6KXhu59IIfM+r5co53tnnHhoKiSYPOGiw5c+jC0st8VgdD07PPEZecUayuXS
         K5FLJDRFyHykQnSqPi/L5OHWR1qmG2tCSzvpC6Li0gpvrIeeCZM6flCbiLNxqDvLg6Ez
         Io2BP/Kyn9o0HhVyk2EklOWHYmlr6dSgrWTP3/L7hzsur+bFP7pa2mnwuW745Ofjbd/T
         DNOMkGrUY5WH+ISgD5gweSFUhrg9ZjLl5nJmHIVy7Z5bCiAeF5ojUnWFCjU2GdaOgO12
         IUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fnmRor+G2D1A88qeFWDKTCLrgCDC7LbHt+ZKriC7uCo=;
        b=5tuQXdLv8PdViDZSXVs+olq/SJvFwcVsc5rv0jYyr/z6xf3TRB3QtA2YH0jLjiS3fL
         QaoHdw64smjhJ8frZwI+UPA1+ll0Nkmi6bE+vbz/KntW9ipyaNSeHjqtMO0PvSwY7nv0
         DWzO3wID1TalV6PuUZ0NSoAvxqf3RmUeIaky474dzJA6u3+PmogO1OB6eZjhBFS9LxCP
         i0ho1slGUP7IwcmGa+LjxDMwxwNepvmTJ289lXDinfP7qHRjtpjJYKFQjm3K8JTk7d4F
         pHYyYSYszqBP352IBh9cy5CPJaOGJV4MS+7Mbd+K3V5xdgPCbAMnCZvGBlYOYKSdgBr8
         M5lw==
X-Gm-Message-State: AOAM5322mEeySCTM+mbyL6tESRMDXgv8MGp5IrVmCUZqw8dntKSeTgVK
        Qs3yzK8FpG8m+J48K8Gc5KN8TQ==
X-Google-Smtp-Source: ABdhPJzOiAqE7eBrOIamrsFw9WngHSNTBTW8Wp+57wHT8rMC8h+5sENwPb7Q8XD5byZ9zsNGwUdNig==
X-Received: by 2002:a05:6870:568b:b0:e6:77a4:a9ec with SMTP id p11-20020a056870568b00b000e677a4a9ecmr5466994oao.229.1650727049027;
        Sat, 23 Apr 2022 08:17:29 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id je19-20020a0568707c1300b000e2d756e76bsm1640915oab.58.2022.04.23.08.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 08:17:28 -0700 (PDT)
Date:   Sat, 23 Apr 2022 08:19:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        avri.altman@wdc.com, alim.akhtar@samsung.com,
        linux-arm-msm@vger.kernel.org, quic_asutoshd@quicinc.com,
        quic_cang@quicinc.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        ahalaney@redhat.com
Subject: Re: [PATCH v2 4/5] scsi: ufs: core: Remove redundant wmb() in
 ufshcd_send_command()
Message-ID: <YmQZAQ9lz0jTzhUp@ripper>
References: <20220423140245.394092-1-manivannan.sadhasivam@linaro.org>
 <20220423140245.394092-5-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423140245.394092-5-manivannan.sadhasivam@linaro.org>
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

> The wmb() inside ufshcd_send_command() is added to make sure that the
> doorbell is committed immediately. This leads to couple of expectations:
> 
> 1. The doorbell write should complete before the function return.
> 2. The doorbell write should not cross the function boundary.
> 
> 2nd expectation is fullfilled by the Linux memory model as there is a
> guarantee that the critical section won't cross the unlock (release)
> operation.
> 
> 1st expectation is not really needed here as there is no following read/
> write that depends on the doorbell to be complete implicitly. Even if the
> doorbell write is in a CPUs Write Buffer (WB), wmb() won't flush it. And
> there is no real need of a WB flush here as well.
> 
> So let's get rid of the wmb() that seems redundant.
> 
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/scsi/ufs/ufshcd.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 9349557b8a01..ec514a6c5393 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -2116,9 +2116,6 @@ void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag)
>  	__set_bit(task_tag, &hba->outstanding_reqs);
>  	ufshcd_writel(hba, 1 << task_tag, REG_UTP_TRANSFER_REQ_DOOR_BELL);
>  	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
> -
> -	/* Make sure that doorbell is committed immediately */
> -	wmb();
>  }
>  
>  /**
> -- 
> 2.25.1
> 
