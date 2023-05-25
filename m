Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D62711A78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 01:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbjEYXNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 19:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbjEYXNR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 19:13:17 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278F910F
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 16:13:13 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af7081c9ebso1193031fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685056391; x=1687648391;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=peywgRsEweJrcss//NWXsO8aU97w0pmYonvmiT2oGtw=;
        b=RQ3BAeSVTcE3DQWaEVwVIupI0e0dk2Cv5p3FrDVcrdrM1NipgKi+t+3FjKph8gfz+8
         VEBUq/rG8bqTiKWJQ79/LEKhSFapX31wgDTAK3m6dWhmKnc0ZtOFYS6EZe0yIAovPjOx
         EhAjGB2BxE0Bw+J69Lp04GYmYEtDAkO3jsqr37gipgK5INnD/z3BZVM0K9PvDaxmtf+F
         9Kth/U4Jdw6pSobadaZ71lnLaHuTUigxC/fuwYB5YJbn4N08MzKI2YxPmOk1K9L+ugvP
         jJmSMqfEUJr4gEeef//EEtRlJhie9q/oaoghmXvAYztIIx+coowXamqknGoCqmxdFGvt
         4WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685056391; x=1687648391;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peywgRsEweJrcss//NWXsO8aU97w0pmYonvmiT2oGtw=;
        b=K/pAXkuBWK3zmvXPa5Isjj3661E3sN0E1xAusnhUFqDeDNZxnrV846qXbiMsjbAgsa
         pZGPo7A9q5Z2vwjPjteiDdmISZBq4LZH8o2DV5j8N8YAniLR8XyWmdpwMRt3kDI4Qdgj
         1B1B+umHg6K3K5FzkyjfPurqY8BlJsCJDUApRdyejpDnWhVF4Z0t4Aq/weCD5ZtxNJtF
         yy1HV0Z5nu0bBm5JRhVWNe6emnK8JSr92TEmfnvpjAyLOQVgtdLq0dFIkFA8Xv5wt9iw
         PbsKUUMqGUXV9d2mCLsP6PP+R7yBsK/cNWZL+C52erhnQnT/+CeG1gDR4oaIpyHRuKQ1
         /vpg==
X-Gm-Message-State: AC+VfDyM3UvZSXt11pwCd+xRO2XcWqmul9j3IzutZ1fliWJ6RTwd22IN
        Jp9fpAOHZnD5gMyeWQexj7Ie5A==
X-Google-Smtp-Source: ACHHUZ4cRMs+1HeP/z0RO+yiFJwD64q8H438xO67ZVNuXholyAMXH40W5smMWHFvAvVqf/l6b8kb1A==
X-Received: by 2002:a2e:9aca:0:b0:29b:80b4:7bf7 with SMTP id p10-20020a2e9aca000000b0029b80b47bf7mr28614ljj.41.1685056391155;
        Thu, 25 May 2023 16:13:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e7a11000000b002ad9a1bfa8esm437777ljc.1.2023.05.25.16.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 16:13:10 -0700 (PDT)
Message-ID: <27f12349-1ee5-503b-3e38-e757db4331bc@linaro.org>
Date:   Fri, 26 May 2023 01:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/5] soc: qcom: socinfo: move SMEM item struct and
 defines to a header
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, ilia.lin@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     ansuelsmth@gmail.com
References: <20230525210214.78235-1-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230525210214.78235-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25.05.2023 23:02, Robert Marko wrote:
> Move SMEM item struct and related defines to a header in order to be able
> to reuse them in the SMEM driver instead of duplicating them.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/socinfo.c       | 67 +-----------------------------
>  include/linux/soc/qcom/socinfo.h | 70 ++++++++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 66 deletions(-)
>  create mode 100644 include/linux/soc/qcom/socinfo.h
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index c2e4a57dd666..ee6bbf76d941 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -11,6 +11,7 @@
>  #include <linux/random.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/socinfo.h>
>  #include <linux/string.h>
>  #include <linux/stringify.h>
>  #include <linux/sys_soc.h>
> @@ -32,15 +33,6 @@
>  #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
>  #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
>  
> -#define SMEM_SOCINFO_BUILD_ID_LENGTH           32
> -#define SMEM_SOCINFO_CHIP_ID_LENGTH            32
> -
> -/*
> - * SMEM item id, used to acquire handles to respective
> - * SMEM region.
> - */
> -#define SMEM_HW_SW_BUILD_ID            137
> -
>  #ifdef CONFIG_DEBUG_FS
>  #define SMEM_IMAGE_VERSION_BLOCKS_COUNT        32
>  #define SMEM_IMAGE_VERSION_SIZE                4096
> @@ -126,64 +118,7 @@ static const char *const pmic_models[] = {
>  	[58] = "PM8450",
>  	[65] = "PM8010",
>  };
> -#endif /* CONFIG_DEBUG_FS */
> -
> -/* Socinfo SMEM item structure */
> -struct socinfo {
> -	__le32 fmt;
> -	__le32 id;
> -	__le32 ver;
> -	char build_id[SMEM_SOCINFO_BUILD_ID_LENGTH];
> -	/* Version 2 */
> -	__le32 raw_id;
> -	__le32 raw_ver;
> -	/* Version 3 */
> -	__le32 hw_plat;
> -	/* Version 4 */
> -	__le32 plat_ver;
> -	/* Version 5 */
> -	__le32 accessory_chip;
> -	/* Version 6 */
> -	__le32 hw_plat_subtype;
> -	/* Version 7 */
> -	__le32 pmic_model;
> -	__le32 pmic_die_rev;
> -	/* Version 8 */
> -	__le32 pmic_model_1;
> -	__le32 pmic_die_rev_1;
> -	__le32 pmic_model_2;
> -	__le32 pmic_die_rev_2;
> -	/* Version 9 */
> -	__le32 foundry_id;
> -	/* Version 10 */
> -	__le32 serial_num;
> -	/* Version 11 */
> -	__le32 num_pmics;
> -	__le32 pmic_array_offset;
> -	/* Version 12 */
> -	__le32 chip_family;
> -	__le32 raw_device_family;
> -	__le32 raw_device_num;
> -	/* Version 13 */
> -	__le32 nproduct_id;
> -	char chip_id[SMEM_SOCINFO_CHIP_ID_LENGTH];
> -	/* Version 14 */
> -	__le32 num_clusters;
> -	__le32 ncluster_array_offset;
> -	__le32 num_defective_parts;
> -	__le32 ndefective_parts_array_offset;
> -	/* Version 15 */
> -	__le32 nmodem_supported;
> -	/* Version 16 */
> -	__le32  feature_code;
> -	__le32  pcode;
> -	__le32  npartnamemap_offset;
> -	__le32  nnum_partname_mapping;
> -	/* Version 17 */
> -	__le32 oem_variant;
> -};
>  
> -#ifdef CONFIG_DEBUG_FS
>  struct socinfo_params {
>  	u32 raw_device_family;
>  	u32 hw_plat_subtype;
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> new file mode 100644
> index 000000000000..d1cbc49a2a2d
> --- /dev/null
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __QCOM_SOCINFO_H__
> +#define __QCOM_SOCINFO_H__
> +
> +/*
> + * SMEM item id, used to acquire handles to respective
> + * SMEM region.
> + */
> +#define SMEM_HW_SW_BUILD_ID		137
> +
> +#define SMEM_SOCINFO_BUILD_ID_LENGTH	32
> +#define SMEM_SOCINFO_CHIP_ID_LENGTH	32
> +
> +/* Socinfo SMEM item structure */
> +struct socinfo {
> +	__le32 fmt;
> +	__le32 id;
> +	__le32 ver;
> +	char build_id[SMEM_SOCINFO_BUILD_ID_LENGTH];
> +	/* Version 2 */
> +	__le32 raw_id;
> +	__le32 raw_ver;
> +	/* Version 3 */
> +	__le32 hw_plat;
> +	/* Version 4 */
> +	__le32 plat_ver;
> +	/* Version 5 */
> +	__le32 accessory_chip;
> +	/* Version 6 */
> +	__le32 hw_plat_subtype;
> +	/* Version 7 */
> +	__le32 pmic_model;
> +	__le32 pmic_die_rev;
> +	/* Version 8 */
> +	__le32 pmic_model_1;
> +	__le32 pmic_die_rev_1;
> +	__le32 pmic_model_2;
> +	__le32 pmic_die_rev_2;
> +	/* Version 9 */
> +	__le32 foundry_id;
> +	/* Version 10 */
> +	__le32 serial_num;
> +	/* Version 11 */
> +	__le32 num_pmics;
> +	__le32 pmic_array_offset;
> +	/* Version 12 */
> +	__le32 chip_family;
> +	__le32 raw_device_family;
> +	__le32 raw_device_num;
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
> +	/* Version 16 */
> +	__le32  feature_code;
> +	__le32  pcode;
> +	__le32  npartnamemap_offset;
> +	__le32  nnum_partname_mapping;
> +	/* Version 17 */
> +	__le32 oem_variant;
> +};
> +
> +#endif
