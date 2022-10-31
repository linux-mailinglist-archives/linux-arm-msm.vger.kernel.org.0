Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0073613F44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 21:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiJaUxH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 16:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJaUxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 16:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D171E13CC8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667249530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qWJyfhmQ6o9T03H9pL5B2g/JZubAjjutk2ZOVbBRNCw=;
        b=KLY8lwFIG3jnP5gTjLzJ+n0umy0825FQ9FWQJiU1l808DSefn4+aRyR17e9IjViPO1zQVq
        hCCbNUU/qzbwVTH1gYVhlJ201LX/W/nP3ZxW6zs2agUZ1wns3gora3u2ugt6zD7gLcDBJP
        6TVBMFoGBymEne2lh5PqqziCzwB1mg0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-w84UZCROMDeTT4Tk0hjdyQ-1; Mon, 31 Oct 2022 16:52:06 -0400
X-MC-Unique: w84UZCROMDeTT4Tk0hjdyQ-1
Received: by mail-ot1-f71.google.com with SMTP id cc14-20020a05683061ce00b00665c203bb8fso6973835otb.23
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 13:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWJyfhmQ6o9T03H9pL5B2g/JZubAjjutk2ZOVbBRNCw=;
        b=3wYN9Eslfm1FYteTxJ455PrS0IppztJsjQQOvcJPnse7GDr5BoBYzPvo73ylByV32U
         wX/0O+Kv08Bt9wYguUIJ08JDiduES6XydyAvOOnEZKL2bXxPvIuH1YTGpVOld0jAix4M
         6xJx2iI4jJfuloh50JeHd/Q45kLVwZyqE4jvDH3l7RXiZnFWokD8gBPl264R8t+G4til
         xTDD76an+CBsN86tOqXCCgwQ1YOOeixHryYJU3j91u3CJD1DdN+7lGLePSsUfoc7tU/n
         G8h+/+SdXBXZOx5j81f12FMWGh+sPd3PGVKpkrYlkYis2y0G/gD21T6TgLTSBHpcR3O8
         jJOw==
X-Gm-Message-State: ACrzQf0e/gTTBf45rMrt4Fse544TmSIW6SPRU8Von3YiKi6z3UTmmIsG
        4RKJm3TN8cLjkoQEBHMuo7mFCG8jGL8CUxNgZkdq13bTgh5vrcZ3cpIcM1pCjmeylrRu6KFcJF8
        pG5sNlbjES/g7XO1IgNC0lX3NWA==
X-Received: by 2002:a4a:9645:0:b0:476:a4e2:8cbc with SMTP id r5-20020a4a9645000000b00476a4e28cbcmr6332022ooi.74.1667249526157;
        Mon, 31 Oct 2022 13:52:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ywIcmmfWbra9uzy87gn8Co1UQ9UKror/SwnO/b46Kb0nMbJMNL+ohvKc3NHWq0v7gIWh+yg==
X-Received: by 2002:a4a:9645:0:b0:476:a4e2:8cbc with SMTP id r5-20020a4a9645000000b00476a4e28cbcmr6332015ooi.74.1667249525910;
        Mon, 31 Oct 2022 13:52:05 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id f16-20020a9d5f10000000b006679a03a753sm3169250oti.11.2022.10.31.13.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:52:05 -0700 (PDT)
Date:   Mon, 31 Oct 2022 15:52:03 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 14/15] scsi: ufs: ufs-qcom: Add support for finding HS
 gear on new UFS versions
Message-ID: <20221031205203.gxpghwdoyz4a5c4w@halaney-x13s>
References: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
 <20221031180217.32512-15-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031180217.32512-15-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 31, 2022 at 11:32:16PM +0530, Manivannan Sadhasivam wrote:
> Starting from UFS controller v4, Qcom supports dual gear mode (i.e., the
> controller/PHY can be configured to run in two gear speeds). But that
> requires an agreement between the UFS controller and the UFS device.
> This commit finds the max gear supported by both controller and device
> then decides which one to use.
> 
> UFS controller's max gear can be read from the REG_UFS_PARAM0 register and
> UFS device's max gear can be read from the "max-device-gear" devicetree
> property.
> 
> The UFS PHY also needs to be configured with the decided gear using the
> phy_set_mode_ext() API.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/ufs/host/ufs-qcom.c | 31 ++++++++++++++++++++++++++++---
>  drivers/ufs/host/ufs-qcom.h |  4 ++++
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index c93d2d38b43e..ca60a5b0292b 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -281,6 +281,9 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>  static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba, u32 hs_gear)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct device *dev = hba->dev;
> +	u32 max_device_gear, max_hcd_gear, reg;
> +	int ret;
>  
>  	if (host->hw_ver.major == 0x1) {
>  		/*
> @@ -292,8 +295,29 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba, u32 hs_gear)
>  		 */
>  		if (hs_gear > UFS_HS_G2)
>  			return UFS_HS_G2;
> +	} else if (host->hw_ver.major > 0x3) {
> +		/*
> +		 * Starting from UFS controller v4, Qcom supports dual gear mode (i.e., the

Bikeshedding, but I think with this wording checking:

    host->hw_ver.major >= 0x4

is a little more readable, or at least for me when I read the comment I
had to jump back up to the else if statement.

Even without that change though

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> +		 * controller/PHY can be configured to run in two gear speeds). But that
> +		 * requires an agreement between the UFS controller and the device. Below
> +		 * code tries to find the max gear of both and decides which gear to use.
> +		 *
> +		 * First get the max gear supported by the UFS device if available.
> +		 * If the property is not defined in devicetree, then use the default gear.
> +		 */
> +		ret = of_property_read_u32(dev->of_node, "max-device-gear", &max_device_gear);
> +		if (ret)
> +			goto err_out;
> +
> +		/* Next get the max gear supported by the UFS controller */
> +		reg = ufshcd_readl(hba, REG_UFS_PARAM0);
> +		max_hcd_gear = UFS_QCOM_MAX_GEAR(reg);
> +
> +		/* Now return the minimum of both gears */
> +		return min(max_device_gear, max_hcd_gear);
>  	}
>  
> +err_out:
>  	/* Default is HS-G3 */
>  	return UFS_HS_G3;
>  }
> @@ -303,7 +327,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	struct phy *phy = host->generic_phy;
>  	int ret;
> -	bool is_rate_B = UFS_QCOM_LIMIT_HS_RATE == PA_HS_MODE_B;
> +	u32 hs_gear;
>  
>  	/* Reset UFS Host Controller and PHY */
>  	ret = ufs_qcom_host_reset(hba);
> @@ -311,8 +335,9 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		dev_warn(hba->dev, "%s: host reset returned %d\n",
>  				  __func__, ret);
>  
> -	if (is_rate_B)
> -		phy_set_mode(phy, PHY_MODE_UFS_HS_B);
> +	/* UFS_HS_G2 is used here since that's the least gear supported by legacy Qcom platforms */
> +	hs_gear = ufs_qcom_get_hs_gear(hba, UFS_HS_G2);
> +	phy_set_mode_ext(phy, PHY_MODE_UFS_HS_B, hs_gear);
>  
>  	/* phy initialization - calibrate the phy */
>  	ret = phy_init(phy);
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 7fe928b82753..751ded3e3531 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -94,6 +94,10 @@ enum {
>  #define TMRLUT_HW_CGC_EN	BIT(6)
>  #define OCSC_HW_CGC_EN		BIT(7)
>  
> +/* bit definitions for REG_UFS_PARAM0 */
> +#define MAX_HS_GEAR_MASK	GENMASK(6, 4)
> +#define UFS_QCOM_MAX_GEAR(x)	FIELD_GET(MAX_HS_GEAR_MASK, (x))
> +
>  /* bit definition for UFS_UFS_TEST_BUS_CTRL_n */
>  #define TEST_BUS_SUB_SEL_MASK	GENMASK(4, 0)  /* All XXX_SEL fields are 5 bits wide */
>  
> -- 
> 2.25.1
> 

