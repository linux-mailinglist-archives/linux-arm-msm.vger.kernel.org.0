Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBEB62D971
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 12:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbiKQLeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 06:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239258AbiKQLeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 06:34:06 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3A35133E
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:34:04 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id p12so1357897plq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDkIugz1/mRNVETST6IbQaDgBOb8+GBszmb2VS3UN2s=;
        b=uw1uKLKp4/MuS9ulsVTuQB6gNAAMwFkV0SDMB2uxUNtfkqKmJDnb3wS+NbJXNsQ3rt
         /hqM+wGXxku3YrBXawf/qmPZHhcpvvodMK/szk0jElP/8losaFkI2A/tBNPnHEGfXjzB
         D0OvTS4grLlzwuZZr3GuM2mKFQ1wha78nHjZ3umEw92/EK/y/CTdVjm37Ok7RelVE6vq
         UaJnmnvSO/RmZT/Gjw+sSgizFBQs7cbfpUA42uI1TScqYEj9AgcsGZLuMmI/Gy//JXyp
         btTmo4gv4i1lxHUwLKhPvs7gSNgJDifjPJs7TpLlLLWW7c+s3sKr23wpKyU+RSb5my1T
         rlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDkIugz1/mRNVETST6IbQaDgBOb8+GBszmb2VS3UN2s=;
        b=X7xuOptaMOo/4rYku3Yzo/pO6tKqPMXMmaDiwY3q+WlO1oaGGLXUYq6+OHsuoh6NP1
         YKUTzJeAND5zleGpYp/cnjgAx/eZVE0rrBYx686LnafyxpT4mDvaVrauz8Sxp+4ZrtOM
         GXVEKrgfQ0Cx9tpWgEYuwA+F2WHKIZv+GZqOHTJ5FbFT4UxolJWajckkzqZLPuyaWgun
         d1VGID6bYreFd3XOEAYUp1jcV/jCxee0nt+r/H52YhYD+WkwVIKOfssI5F8KotDQkEx0
         NDgr3g/chR0F109MJgtFqzWGAOlGCaAbReH9TeT4EX1hEl/4eA4cFeNYmOySkI4jvyan
         5+gw==
X-Gm-Message-State: ANoB5pmnRfmwqHphhvglThpY/ym1QXcOls1nShGOVJ6rl795azP77CvF
        Zkult0kMlzzW4i9m51CwBr6b
X-Google-Smtp-Source: AA0mqf6AmSKCk80SLfZx3vcFbb0uXwFGb1BSMV8/Q8KtIf65DRNYaiu453V6v/md5Ww30NBrc05rLg==
X-Received: by 2002:a17:902:7e47:b0:186:944a:2560 with SMTP id a7-20020a1709027e4700b00186944a2560mr2380013pln.84.1668684844024;
        Thu, 17 Nov 2022 03:34:04 -0800 (PST)
Received: from thinkpad ([117.193.208.31])
        by smtp.gmail.com with ESMTPSA id h129-20020a625387000000b00571bdf45888sm881780pfb.154.2022.11.17.03.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:34:03 -0800 (PST)
Date:   Thu, 17 Nov 2022 17:03:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Brian Masney <bmasney@redhat.com>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/2] scsi: ufs: ufs-qcom: add basic interconnect support
Message-ID: <20221117113357.GB93179@thinkpad>
References: <20221117104957.254648-1-bmasney@redhat.com>
 <20221117104957.254648-2-bmasney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117104957.254648-2-bmasney@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 17, 2022 at 05:49:56AM -0500, Brian Masney wrote:
> The firmware on the Qualcomm platforms expects the interconnect votes to
> be present. Let's add very basic support where the maximum throughput is
> requested to match what's done in a few other drivers.
> 
> This will not break boot on systems where the interconnects and
> interconnect-names properties are not specified in device tree for UFS
> since the interconnect framework will silently return.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8ad1415e10b6..55bf8dd88985 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -7,6 +7,7 @@
>  #include <linux/time.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/interconnect.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -936,6 +937,22 @@ static const struct reset_control_ops ufs_qcom_reset_ops = {
>  	.deassert = ufs_qcom_reset_deassert,
>  };
>  
> +static int ufs_qcom_icc_init(struct device *dev, char *pathname)
> +{
> +	struct icc_path *path;
> +	int ret;
> +
> +	path = devm_of_icc_get(dev, pathname);
> +	if (IS_ERR(path))
> +		return dev_err_probe(dev, PTR_ERR(path), "failed to acquire interconnect path\n");
> +
> +	ret = icc_set_bw(path, 0, UINT_MAX);

Please use icc macros for setting the bandwidth. Like, GBps_to_icc(),
MBps_to_icc() etc...

Also, during the init stage you can set a minimum bandwidth that will allow the
controller to get probed successfully. Then, you should update the bandwidth
based on the gear in pwr_change_notify() callback.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to set bandwidth request\n");
> +
> +	return 0;
> +}
> +
>  /**
>   * ufs_qcom_init - bind phy with controller
>   * @hba: host controller instance
> @@ -991,6 +1008,14 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  			err = dev_err_probe(dev, PTR_ERR(host->generic_phy), "Failed to get PHY\n");
>  			goto out_variant_clear;
>  		}
> +
> +		err = ufs_qcom_icc_init(dev, "ufs-ddr");
> +		if (err)
> +			goto out_variant_clear;
> +
> +		err = ufs_qcom_icc_init(dev, "cpu-ufs");
> +		if (err)
> +			goto out_variant_clear;

It'd be nice to have a single function that initializes both paths.

Thanks,
Mani

>  	}
>  
>  	host->device_reset = devm_gpiod_get_optional(dev, "reset",
> -- 
> 2.38.1
> 

-- 
மணிவண்ணன் சதாசிவம்
