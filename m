Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D2B3F616A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 17:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238120AbhHXPSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 11:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhHXPSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 11:18:54 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB34BC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 08:18:09 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DC1A11F88D;
        Tue, 24 Aug 2021 17:18:05 +0200 (CEST)
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
To:     Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>
References: <20210824094109.7272-1-shawnguo@kernel.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
Date:   Tue, 24 Aug 2021 17:18:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824094109.7272-1-shawnguo@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 8/24/21 11:41 AM, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> It's been observed on Sony Xperia M4 Aqua phone, that wcnss firmware has
> the type of the second segment holding hashes just be PT_LOAD.  So drop
> the check on phdrs[1].p_type to get it go on that phone.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
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


Konrad (on the CC-list) originally came up with a similar patch to make 
his Sony phone boot (Xperia XZ, MSM8996).  We however concluded that 
this solution is wrong, for the simple fact that the code below expects 
a PT_NULL header with data in the right place.  Skipping this check most 
likely means that the code below will read out of bounds since the mdt 
file isn't large enough; this data is supposed to be read from an 
external file as indicated by the meaning of PT_LOAD.  We built a 
solution for this, and fortunately CAF independently submitted a similar 
solution to the lists a while ago which is more thorough:

https://lore.kernel.org/linux-arm-msm/1609968211-7579-1-git-send-email-sidgup@codeaurora.org/

It's been a while since I last compared mdt files with and without 
PT_LOAD, but this is the conclusion I remember coming to:

The code that packs the hash from program header 1 tightly after the ELF 
header in program header 0 doesn't actually need to run, since our mdt 
binaries already contain the signature in that place; the bytes aren't 
used for anything else.  Simply sending the contents of the entire file 
as-is (similar to our downstream kernels) worked just fine (of course 
files beyond the size of the mdt file still have to be appended from 
.bXX files, and I'm not sure why this isn't checking for PT_LOAD 
program-header type there).

- Marijn
