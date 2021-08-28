Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07903FA49C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 11:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhH1JBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 05:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbhH1JBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 05:01:32 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625C6C061756;
        Sat, 28 Aug 2021 02:00:42 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0CEDB1F986;
        Sat, 28 Aug 2021 11:00:39 +0200 (CEST)
Subject: Re: [PATCH v2] soc: qcom: mdt_loader: Drop PT_LOAD check on hash
 segment
To:     Shawn Guo <shawn.guo@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210828070202.7033-1-shawn.guo@linaro.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <2944d5e9-1efb-ac13-a1b2-293ae11c430f@somainline.org>
Date:   Sat, 28 Aug 2021 11:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210828070202.7033-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 8/28/21 9:02 AM, Shawn Guo wrote:
> PT_LOAD type denotes that the segment should be loaded into the final
> firmware memory region.  Hash segment is not one such, because it's only
> needed for PAS init and shouldn't be in the final firmware memory region.
> That's why mdt_phdr_valid() explicitly reject non PT_LOAD segment and
> hash segment.  This actually makes the hash segment type check in
> qcom_mdt_read_metadata() unnecessary and redundant.  For a hash segment,
> it won't be loaded into firmware memory region anyway, due to the
> QCOM_MDT_TYPE_HASH check in mdt_phdr_valid(), even if it has a PT_LOAD
> type for some reason (misusing or abusing?).
> 
> Some firmware files on Sony phones are such examples, e.g WCNSS firmware
> of Sony Xperia M4 Aqua phone.  The type of hash segment is just PT_LOAD.
> Drop the unnecessary hash segment type check in qcom_mdt_read_metadata()
> to fix firmware loading failure on these phones, while hash segment is
> still kept away from the final firmware memory region.
> 
> Fixes: 498b98e93900 ("soc: qcom: mdt_loader: Support loading non-split images")
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>


Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Thanks for sitting through that long discussion and coming to the 
conclusion that your patch was correct all along!

> ---
> Changes for v2:
> - Update commit log based on the great disscussion with Marijn and Bjorn.
> 
>   drivers/soc/qcom/mdt_loader.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index eba7f76f9d61..6034cd8992b0 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -98,7 +98,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>   	if (ehdr->e_phnum < 2)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
> +	if (phdrs[0].p_type == PT_LOAD)
>   		return ERR_PTR(-EINVAL);
>   
>   	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
> 
