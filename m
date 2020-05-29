Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FA61E72A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388924AbgE2Cgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388570AbgE2Cgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:36:49 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2132C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:36:49 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh7so412719plb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6wUVhHlxgksY6NJNMGFlVR88Gw3yg8Gh5oX5vxHCq/o=;
        b=XezHI9U1V3/kE8r1/BTdlMQ3lIWATcd457KHf8T7tcomxKn70Wsi7aQmxidjZAxuj3
         v2x+zeKWOLTGWqNCxyXFNFpNs3lDLZ7peDGmfjTbHyVj0wMEm5zQ1N1RDewU6WUG50O3
         4FRP1/Momc7NSsr2NzvNXa5lxG/YYbGzO5fq91M2PuudBMOAvicw63dpa3ayhNBseDW3
         a0Hc8o3x4PMCQSVy+TmdbkvnzkMIVQJ0XSm7FCQUUTZJp1BE8XVfO4m8PmPB1vqTv+My
         aH5C2YSoqz6IKzVvDL+2ydh6AkForoqHNfqOcb4NjHe6BgRiCO6r3JaiqG+5a32gGUmA
         IMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6wUVhHlxgksY6NJNMGFlVR88Gw3yg8Gh5oX5vxHCq/o=;
        b=RsbUgDLAHrrto9IAlu0G5ee4TLR/GmlWFO1tEGMRL2CieeyIK1MTbSc3ThfxZvVHYL
         hg5uslHob/Xh1bgfdfHGghZfLR3mbDqNtrIZWJcRHMhL0Kr69CHh5I3+lwA+YRPRg4jZ
         DTYZ9OCWZCvuJMGHOEQZDS7Dh02kHolWsOfO/jlX6xyt26osmC89+ejDjLPyA2C3a8Km
         5UUVsLZ5EWK+RAHY9yWIT5KA9UXTOzhMcaQeuEc4Aooma7ssJ4v7D3mIu3RtlcJc8ur7
         snuwM73kYv/SgFUpnq34fZyD7ivJLOKhRpDNWJKfT2WRuwXeloRAYEHS5+CQSzeFkEa4
         gTkw==
X-Gm-Message-State: AOAM531bF847Zdj2FZu0sKFzpbFvMmSjMF3lzpGYsqnvLXu7APw3jnH9
        ooYqtQMGRJan44CFn3HxcLmZTQ==
X-Google-Smtp-Source: ABdhPJxQdyfaSnW1JHDysbtf0cOjQXhWVMT1RPtJr+Oi+3B8Ll3sXO5WeC22blQd7OzDjqJOnvrTgQ==
X-Received: by 2002:a17:90a:b78e:: with SMTP id m14mr6718901pjr.114.1590719809329;
        Thu, 28 May 2020 19:36:49 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r25sm6134535pfg.145.2020.05.28.19.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:36:48 -0700 (PDT)
Date:   Thu, 28 May 2020 19:35:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 1/4] soc: qcom: socinfo: add support for newer socinfo
 data
Message-ID: <20200529023543.GQ279327@builder.lan>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 May 09:48 PDT 2020, Dmitry Baryshkov wrote:

> Add support for newer Qualcomm SoC info structures (up to version 0.15).
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 55 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index ebb49aee179b..0e6adf1161c0 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -24,6 +24,7 @@
>  #define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
>  
>  #define SMEM_SOCINFO_BUILD_ID_LENGTH           32
> +#define SMEM_SOCINFO_CHIP_ID_LENGTH            32
>  
>  /*
>   * SMEM item id, used to acquire handles to respective
> @@ -121,6 +122,16 @@ struct socinfo {
>  	__le32 chip_family;
>  	__le32 raw_device_family;
>  	__le32 raw_device_num;
> +	/* Version 13 */
> +	__le32 nproduct_id;
> +	char chip_id[SMEM_SOCINFO_CHIP_ID_LENGTH];
> +	/* Version 14 */
> +	__le32 num_clusters;
> +	__le32 ncluster_array_offset;
> +	__le32 num_defective_parts;
> +	__le32 ndefective_parts_array_offset;
> +	/* Version 15 */
> +	__le32 nmodem_supported;
>  };
>  
>  #ifdef CONFIG_DEBUG_FS
> @@ -135,6 +146,12 @@ struct socinfo_params {
>  	u32 raw_ver;
>  	u32 hw_plat;
>  	u32 fmt;
> +	u32 nproduct_id;
> +	u32 num_clusters;
> +	u32 ncluster_array_offset;
> +	u32 num_defective_parts;
> +	u32 ndefective_parts_array_offset;
> +	u32 nmodem_supported;
>  };
>  
>  struct smem_image_version {
> @@ -268,9 +285,19 @@ static int qcom_show_pmic_die_revision(struct seq_file *seq, void *p)
>  	return 0;
>  }
>  
> +static int qcom_show_chip_id(struct seq_file *seq, void *p)
> +{
> +	struct socinfo *socinfo = seq->private;
> +
> +	seq_printf(seq, "%s\n", socinfo->chip_id);
> +
> +	return 0;
> +}
> +
>  QCOM_OPEN(build_id, qcom_show_build_id);
>  QCOM_OPEN(pmic_model, qcom_show_pmic_model);
>  QCOM_OPEN(pmic_die_rev, qcom_show_pmic_die_revision);
> +QCOM_OPEN(chip_id, qcom_show_chip_id);
>  
>  #define DEFINE_IMAGE_OPS(type)					\
>  static int show_image_##type(struct seq_file *seq, void *p)		  \
> @@ -309,6 +336,34 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 15):
> +		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
> +
> +		debugfs_create_u32("nmodem_supported", 0400, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.nmodem_supported);
> +		/* Fall through */
> +	case SOCINFO_VERSION(0, 14):
> +		qcom_socinfo->info.num_clusters = __le32_to_cpu(info->num_clusters);
> +		qcom_socinfo->info.ncluster_array_offset = __le32_to_cpu(info->ncluster_array_offset);
> +		qcom_socinfo->info.num_defective_parts = __le32_to_cpu(info->num_defective_parts);
> +		qcom_socinfo->info.ndefective_parts_array_offset = __le32_to_cpu(info->ndefective_parts_array_offset);
> +
> +		debugfs_create_u32("num_clusters", 0400, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.num_clusters);
> +		debugfs_create_u32("ncluster_array_offset", 0400, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.ncluster_array_offset);
> +		debugfs_create_u32("num_defective_parts", 0400, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.num_defective_parts);
> +		debugfs_create_u32("ndefective_parts_array_offset", 0400, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.ndefective_parts_array_offset);
> +		/* Fall through */
> +	case SOCINFO_VERSION(0, 13):
> +		qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
> +
> +		debugfs_create_u32("nproduct_id", 0400, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.nproduct_id);
> +		DEBUGFS_ADD(info, chip_id);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 12):
>  		qcom_socinfo->info.chip_family =
>  			__le32_to_cpu(info->chip_family);
> -- 
> 2.26.2
> 
