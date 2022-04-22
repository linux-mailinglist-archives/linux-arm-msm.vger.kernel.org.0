Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC8350BBD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 17:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbiDVPnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 11:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449490AbiDVPnM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 11:43:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99A5556218
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650642017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4QhChbQB9YDaMeenbkdMZZmXadlUdt0Dsk5a56hLZNI=;
        b=Ha1Gf7WFIZ3eDm+mcZMGEijd2zpqanqfk8P1If/XQPApTVgS3loPEu5oOPjAkgpO8XEaK4
        7/1zgdrFYnjcNfZvRKVbpXFdhflI24WrnSHwMYynVdIPHMU9VBoOgND+TTFWy6m31O/8pN
        Yj2Ba7AT675uM79tMrTkdKsFnZOCv8k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-LZuxdkU2PbuaSgDbp6tpHQ-1; Fri, 22 Apr 2022 11:40:14 -0400
X-MC-Unique: LZuxdkU2PbuaSgDbp6tpHQ-1
Received: by mail-qk1-f199.google.com with SMTP id q5-20020a05620a0d8500b004738c1b48beso5639499qkl.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 08:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4QhChbQB9YDaMeenbkdMZZmXadlUdt0Dsk5a56hLZNI=;
        b=jaTgP9QAr3Ejh/NuhKnuohsvI1DROpRk1hjCsNLKdYGPIuUCymum5DiTqdxR/cSnA6
         0IVrfCdmWHcgVJiKqhA7hMJrf+0U4L/XfdSo03zru0RZ5LDeGrMnTMY4zhpggsqSzPEC
         2lo66FCjFdEbpiOJ4RxflAWafKnq/qmF5nHak67lhC3ZzVLo/lr3A5qM7F5NO/HPOFNR
         rh5xusWZ9mADJW4rolgQ+p9T+3LVWat0RO6yfgDk76ivzLsaJvgJDI30nVrn69X1WSl0
         n7JwdKo4vnGkC8Gx1iyXKQ2WLuq86+309sOa2KqSIgkU9ZZhAokj9whWQUCAyHQPhblu
         B+QQ==
X-Gm-Message-State: AOAM531nIH8RhTZPW4jW5vy7DJCS8q9F1oRGSmaMA2LT2uvgJuQxK1f6
        jIgmJ11n3f+aI7XCHt8tRrKJ1tIKdYFvEhsDMjl2aG7h60mYnlSy8Dvkv43eDxvbULxPhnfbrKy
        PLV9Cwxz+Hptma4+/XttADquAVA==
X-Received: by 2002:a05:6214:262c:b0:446:3464:57cd with SMTP id gv12-20020a056214262c00b00446346457cdmr4194746qvb.89.1650642014111;
        Fri, 22 Apr 2022 08:40:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU/zrP23x+VGLwwKjYVd8GBF1zIofL+6BYuCYCGu72U6zgNGIJUYYLxnyojnu2QA1/y2aBZw==
X-Received: by 2002:a05:6214:262c:b0:446:3464:57cd with SMTP id gv12-20020a056214262c00b00446346457cdmr4194730qvb.89.1650642013880;
        Fri, 22 Apr 2022 08:40:13 -0700 (PDT)
Received: from halaneylaptop (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm1113111qkc.19.2022.04.22.08.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 08:40:13 -0700 (PDT)
Date:   Fri, 22 Apr 2022 10:40:10 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] scsi: ufs: qcom: Fix acquiring the optional reset
 control line
Message-ID: <20220422154010.2cxk4qy5eikxujb2@halaneylaptop>
References: <20220422132140.313390-1-manivannan.sadhasivam@linaro.org>
 <20220422132140.313390-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422132140.313390-2-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 22, 2022 at 06:51:36PM +0530, Manivannan Sadhasivam wrote:
> On Qcom UFS platforms, the reset control line seems to be optional
> (for SoCs like MSM8996 and probably for others too). The current logic
> tries to mimic the `devm_reset_control_get_optional()` API but it also
> continues the probe if there is an error with the declared reset line in
> DT/ACPI.
> 
> In an ideal case, if the reset line is not declared in DT/ACPI, the probe
> should continue. But if there is problem in acquiring the declared reset
> line (like EPROBE_DEFER) it should fail and return the appropriate error
> code.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 0d2e950d0865..5db0fd922062 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1002,13 +1002,13 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  	host->hba = hba;
>  	ufshcd_set_variant(hba, host);
>  
> -	/* Setup the reset control of HCI */
> -	host->core_reset = devm_reset_control_get(hba->dev, "rst");
> +	/* Setup the optional reset control of HCI */
> +	host->core_reset = devm_reset_control_get_optional(hba->dev, "rst");
>  	if (IS_ERR(host->core_reset)) {
>  		err = PTR_ERR(host->core_reset);
> -		dev_warn(dev, "Failed to get reset control %d\n", err);
> -		host->core_reset = NULL;
> -		err = 0;
> +		if (err != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get reset control %d\n", err);

Could we use dev_err_probe() here?

Otherwise, looks good to me.

> +		goto out_variant_clear;
>  	}
>  
>  	/* Fire up the reset controller. Failure here is non-fatal. */
> -- 
> 2.25.1
> 

