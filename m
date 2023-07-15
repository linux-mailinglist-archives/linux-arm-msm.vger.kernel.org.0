Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B7A754C08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jul 2023 22:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjGOUff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jul 2023 16:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjGOUff (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jul 2023 16:35:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29517F1;
        Sat, 15 Jul 2023 13:35:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C8B760B9B;
        Sat, 15 Jul 2023 20:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E3CC433C7;
        Sat, 15 Jul 2023 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689453332;
        bh=CThur9fflLWSNuutMKCAGij2CNvs1eBHO0tFgZfsJ68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o8Nosp5ddDASq9/ily7Fk7nIytXBqdIqGc9KI1D6iXEd8Wrl6EV71Y7ehFoEkWgnB
         mRk1HqzyyyPXRYKYXXIuCpeSoZkNVIPtcFnxwQpEY3sZBHxFTBHbUGawZyM92wMows
         i9sP72bsNp466NJJxt0X2BLWm54EkSOJgZOAyIJ2skJgnnZ2EXxy035f0hf/xoTqyq
         AbW/zXYT/H/rw4ejxgZCnWsCEpLCthYDRmas4GkYf5OQkvXyuEnxR78KWKCISJdvbV
         5fuBXznFgdkkUtqIT5bSllPGKiXbP7LhhcQlEW+I/HfUQzXTwPxQV+7srGyWS65zqN
         nK1kUrBE4XuCw==
Date:   Sat, 15 Jul 2023 13:39:00 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_mss: support loading MBN file
 on msm8974
Message-ID: <o7wou4ob4vo2rzyhvzxl35cj52frok6jt3qjhdhwszvtsipewz@776l7jgunfqa>
References: <20230508153524.2371795-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508153524.2371795-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 08, 2023 at 06:35:24PM +0300, Dmitry Baryshkov wrote:
> On MSM8974 and APQ8074 the MSS requires loading raw MBA image instead of
> the ELF file. Skip the ELF headers if mba.mbn was specified as the
> firmware image.
> 
> Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Rather than complicating the driver further, can't we just extract that
first segment? Or specify the first split segment file?

Regards,
Bjorn

> ---
> 
> Changes since v1:
> - Replace fixed offset 0x1000 with the value obtained from ELF headers
> - Implement ELF validity checks
> 
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 47 +++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ab053084f7a2..b4ff900f0304 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/devcoredump.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/firmware.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
> @@ -29,6 +30,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/slab.h>
>  
> +#include "remoteproc_elf_helpers.h"
>  #include "remoteproc_internal.h"
>  #include "qcom_common.h"
>  #include "qcom_pil_info.h"
> @@ -459,6 +461,35 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc, void *mba_region)
>  	release_firmware(dp_fw);
>  }
>  
> +/* Get the offset of the segment 0 for mba.mbn */
> +static int q6v5_mba_get_offset(struct rproc *rproc, const struct firmware *fw)
> +{
> +	const struct elf32_hdr *ehdr;
> +	const void *phdr;
> +	char class;
> +	u64 phoffset, poffset;
> +	u16 phentsize;
> +	int ret;
> +
> +	ret = rproc_elf_sanity_check(rproc, fw);
> +	if (ret < 0)
> +		return ret;
> +
> +	ehdr = (const struct elf32_hdr *)fw->data;
> +	class = ehdr->e_ident[EI_CLASS];
> +	phoffset = elf_hdr_get_e_phoff(class, ehdr);
> +	phentsize = elf_hdr_get_e_phentsize(class, ehdr);
> +	if (phoffset + phentsize > fw->size)
> +		return -EINVAL;
> +
> +	phdr = fw->data + elf_hdr_get_e_phoff(class, ehdr);
> +	poffset = elf_phdr_get_p_offset(class, phdr);
> +	if (poffset > fw->size)
> +		return -EINVAL;
> +
> +	return poffset;
> +}
> +
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> @@ -477,7 +508,21 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  		return -EBUSY;
>  	}
>  
> -	memcpy(mba_region, fw->data, fw->size);
> +	if (qproc->version == MSS_MSM8974 &&
> +	    !memcmp(fw->data, ELFMAG, SELFMAG)) {
> +		int poffset;
> +
> +		poffset = q6v5_mba_get_offset(rproc, fw);
> +		if (poffset < 0) {
> +			memunmap(mba_region);
> +			return poffset;
> +		}
> +
> +		memcpy(mba_region, fw->data + poffset, fw->size - poffset);
> +	} else {
> +		memcpy(mba_region, fw->data, fw->size);
> +	}
> +
>  	q6v5_debug_policy_load(qproc, mba_region);
>  	memunmap(mba_region);
>  
> -- 
> 2.39.2
> 
