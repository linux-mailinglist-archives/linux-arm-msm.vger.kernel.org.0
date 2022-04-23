Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0160750CB96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 17:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbiDWPSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 11:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiDWPRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 11:17:54 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6999C1D4A44
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:14:56 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id v12-20020a9d7d0c000000b006054b51c3d4so7584001otn.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=22eenijkFNhaFMADi9ElotDWSOkFn1tnTr48x0vYVAk=;
        b=GVdoeLER62JBuMZ1/XSDwKSXWJkTrASzMX5GiiwdNPfJpMt3lNuHKyAGznJg8Jj4YD
         Y0OgdPH+yHPluQvdKK3tdKlA4FhK00j6P8A+eVTuWE62F0BA+1BT9iPrsiEQhdeB0Lyv
         Mp55lWoI9zECwZV1oVFZ44zoPfl0NGOMvxjTvQzy57f8uBYv9cxvyEVwOAonr4A0dTy/
         FylA5e256esQ4NvjSDMgX+7TWx3tRd5+MhV6m1R/JrsoaVFNS4Zknfl56tfhL248WpNR
         ORX4eiJMnfEkp8WGVALV2vSEcA9fQNUvChHieI4oGExC8+50/kh7o16ztg8T6y4QK1w/
         OjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=22eenijkFNhaFMADi9ElotDWSOkFn1tnTr48x0vYVAk=;
        b=VftIIkI0r47iuDgBRlVgqtCdQKog9NEUHWnDXyaYkCu2HudjSTUxBR9k2xxX/fFPQh
         Z3ydGA8Atm71nz5HMpFcOetzer/dKKYOrC/Z8/RxBOfA5BBuyJh6AlqREAd4goIOlDCy
         KMcFM9qea5xjVd+RkZq8KaVqGoYMJime37BBISvFemO8G+UaWQpJbaaQjVeYPkWuN9G7
         CGPem6koP98+vLNwtBrwNbSU2c7ObB6XyUu7DgFeFkCV/HJEbk/gLIaFMrPEBgU906dz
         8XWAnxzbRGxNOwcLUO+tkFUH3GSIuYlsU02JkP93fIJyO7c4RDlT+CIjgc1Yr5PBCgIn
         aRIg==
X-Gm-Message-State: AOAM530JjqXBTeXspDXKgALa5ugyjajggYojt95PhMJQQor3MJWMJBW6
        4aWEH8ypt8E4Pu7BrE36BjOgZNsJIpAOfFTF
X-Google-Smtp-Source: ABdhPJyb/SfQ9fd+qfhl32OUbxio3UtCSvHIoOgBXrvsGqMSbnLd4vidbHe+NzwDUCm28o1ezpfXrQ==
X-Received: by 2002:a9d:3624:0:b0:5e9:5778:d0c6 with SMTP id w33-20020a9d3624000000b005e95778d0c6mr3657575otb.367.1650726895781;
        Sat, 23 Apr 2022 08:14:55 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 1-20020a05687011c100b000de98359b43sm1684551oav.1.2022.04.23.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 08:14:55 -0700 (PDT)
Date:   Sat, 23 Apr 2022 08:16:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        avri.altman@wdc.com, alim.akhtar@samsung.com,
        linux-arm-msm@vger.kernel.org, quic_asutoshd@quicinc.com,
        quic_cang@quicinc.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        ahalaney@redhat.com
Subject: Re: [PATCH v2 2/5] scsi: ufs: qcom: Simplify handling of
 devm_phy_get()
Message-ID: <YmQYZ8l+QOsz11ld@ripper>
References: <20220423140245.394092-1-manivannan.sadhasivam@linaro.org>
 <20220423140245.394092-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423140245.394092-3-manivannan.sadhasivam@linaro.org>
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

> There is no need to call devm_phy_get() if ACPI is used, so skip it.
> The "host->generic_phy" pointer should already be NULL due to the kzalloc,
> so no need to set it NULL again.
> 
> Also, don't print the error message in case of -EPROBE_DEFER and return
> the error code directly.
> 
> While at it, also remove the comment that has no relationship with
> devm_phy_get().
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index bee81b45299e..6ee33cc0ad09 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1022,28 +1022,12 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  		err = 0;
>  	}
>  
> -	/*
> -	 * voting/devoting device ref_clk source is time consuming hence
> -	 * skip devoting it during aggressive clock gating. This clock
> -	 * will still be gated off during runtime suspend.
> -	 */
> -	host->generic_phy = devm_phy_get(dev, "ufsphy");
> -
> -	if (host->generic_phy == ERR_PTR(-EPROBE_DEFER)) {
> -		/*
> -		 * UFS driver might be probed before the phy driver does.
> -		 * In that case we would like to return EPROBE_DEFER code.
> -		 */
> -		err = -EPROBE_DEFER;
> -		dev_warn(dev, "%s: required phy device. hasn't probed yet. err = %d\n",
> -			__func__, err);
> -		goto out_variant_clear;
> -	} else if (IS_ERR(host->generic_phy)) {
> -		if (has_acpi_companion(dev)) {
> -			host->generic_phy = NULL;
> -		} else {
> +	if (!has_acpi_companion(dev)) {
> +		host->generic_phy = devm_phy_get(dev, "ufsphy");
> +		if (IS_ERR(host->generic_phy)) {
>  			err = PTR_ERR(host->generic_phy);
> -			dev_err(dev, "%s: PHY get failed %d\n", __func__, err);
> +			if (err != -EPROBE_DEFER)
> +				dev_err_probe(dev, err, "Failed to get PHY\n");

I believe the idiomatic form is:
			err = dev_err_probe(dev, PTR_ERR(host->generic_phy), "Failed to get PHY\n");


But as with the previous patch, please remove the condition and you have
my:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  			goto out_variant_clear;
>  		}
>  	}
> -- 
> 2.25.1
> 
