Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA202EEA24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 01:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbhAHAIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 19:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729335AbhAHAIK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 19:08:10 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEE0C0612F5
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 16:07:30 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id x13so9457868oic.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 16:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/+e7mJ1mrcrNXilPv4TPaogW9Nw3A2mzcQj+9eVwG/Q=;
        b=bbYGAE/b+oEutRi1w4PJfRLGhGMm1Iii6kPJliriSbZCFYn0zdpqoObnarD1SdQdKg
         MKvZlSc6cKj24gykJuPXUvd3vMZ5omYddXS0qpymc1nohnVKm0k53HNJzA5vPXMKDRqA
         p8S9m1OPgXGbD1vahZEY1tmZfWBfuoyObRkknk4CygwqDmBIVP51l5GwyM2eTmCJjfbv
         rUH4hY9m+tWe9H+bLg5og3CGGepX6kxKvjHGGzcGjZxb65XtOz7tmqBdc6LxWtpjkieW
         NVk5LmfAmTSjAHXwEk6Lmv5HBIvRP+Emf97ELyI3ToqUxW0zTY8i0aWxq1WxDVqtGEaZ
         XJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/+e7mJ1mrcrNXilPv4TPaogW9Nw3A2mzcQj+9eVwG/Q=;
        b=MlYUR972fsIlQn4tUkSG6WccRdb/Sru8hM+2eQ4pF+9n3Y/2PWHjufF86tgrRxYc0t
         tAAmMgsod4n9GfFyniAm0YW0HEnBvh3pMei+NfYM9fd3ZDJugxwHNjnftGfmUXm57PHm
         NZh5QdyAM/3laP3PUBzELcyDmFrNvAw8GxwNq+cY76dUf3SVp8/IyjM1PV7qZ5w2rTkP
         3MzRLKEwoCUL+B4OKaBhvbxNnkCFaiBSbdUljvKxKOPW8nq46jGf4UinGzEyjPElR89F
         hfYXb1wnEN018W9CUtqFgbX7pWghi+CRapIBz0Mu1P2iyY4bYDvAoONhSQgBUhtlEXBN
         SAaA==
X-Gm-Message-State: AOAM533pk3rFSlklkPLGOTmXF0goOBBHJrHiN73nJrRyK97nO2Xv6MyO
        WizYA7GPjOP0UOEmhpcKlxuMoA==
X-Google-Smtp-Source: ABdhPJzElVHYfLpQXn0s3vAI3qEWrpr99Z32Ydud32Yg8jcEaa4sXjihYljuzVevqbyQ8VO9Rd/6WA==
X-Received: by 2002:aca:4dc3:: with SMTP id a186mr681591oib.107.1610064449329;
        Thu, 07 Jan 2021 16:07:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u3sm1424640otk.31.2021.01.07.16.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 16:07:28 -0800 (PST)
Date:   Thu, 7 Jan 2021 18:07:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Handle split bins correctly
Message-ID: <X/eiP/81jupdptf7@builder.lan>
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
 <1609968211-7579-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609968211-7579-3-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Jan 15:23 CST 2021, Siddharth Gupta wrote:

> It may be that the offset of the first program header lies inside the mdt's
> filesize, in this case the loader would incorrectly assume that the bins
> were not split. The loading would then continue on to fail for split bins.
> This change updates the logic used by the mdt loader to understand whether
> the firmware images are split or not. It figures this out by checking if
> each program header's segment lies within the file or not.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/soc/qcom/mdt_loader.c | 60 +++++++++++++++++++++++++++----------------
>  1 file changed, 38 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 813216d..c9bbd8c 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -31,6 +31,26 @@ static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
>  	return true;
>  }
>  
> +static bool qcom_mdt_bins_are_split(const struct firmware *fw)
> +{
> +	const struct elf32_phdr *phdrs;
> +	const struct elf32_hdr *ehdr;
> +	uint64_t seg_start, seg_end;
> +	int i;
> +
> +	ehdr = (struct elf32_hdr *)fw->data;
> +	phdrs = (struct elf32_phdr *)(ehdr + 1);
> +
> +	for (i = 0; i < ehdr->e_phnum; i++) {
> +		seg_start = phdrs[i].p_offset;
> +		seg_end = phdrs[i].p_offset + phdrs[i].p_filesz;
> +		if (seg_start > fw->size || seg_end > fw->size)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * qcom_mdt_get_size() - acquire size of the memory region needed to load mdt
>   * @fw:		firmware object for the mdt file
> @@ -118,7 +138,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>  		return ERR_PTR(-ENOMEM);
>  
>  	/* Is the header and hash already packed */
> -	if (ehdr_size + hash_size == fw->size)
> +	if (qcom_mdt_bins_are_split(fw))
>  		hash_offset = phdrs[0].p_filesz;
>  	else
>  		hash_offset = phdrs[hash_index].p_offset;
> @@ -150,6 +170,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	void *metadata;
>  	char *fw_name;
>  	bool relocate = false;
> +	bool is_split;
>  	void *ptr;
>  	int ret = 0;
>  	int i;
> @@ -157,6 +178,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	if (!fw || !mem_region || !mem_phys || !mem_size)
>  		return -EINVAL;
>  
> +	is_split = qcom_mdt_bins_are_split(fw);
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
>  
> @@ -238,28 +260,22 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  
>  		ptr = mem_region + offset;
>  
> -		if (phdr->p_filesz && phdr->p_offset < fw->size) {
> -			/* Firmware is large enough to be non-split */
> -			if (phdr->p_offset + phdr->p_filesz > fw->size) {
> -				dev_err(dev,
> -					"failed to load segment %d from truncated file %s\n",
> -					i, firmware);
> -				ret = -EINVAL;
> -				break;
> +		if (phdr->p_filesz) {
> +			if (!is_split) {

In an effort to reduce the diff size and avoid adding another level of
indentation, how about making the conditionals:

		if (is_split && phdr->p_filesz) {
			memcpy();
		} else if (phdr->p_filesz) {
			...
		}

Apart from that I think this patch looks good!

Regards,
Bjorn

> +				/* Firmware is large enough to be non-split */
> +				memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
> +			} else {
> +				/* Firmware not large enough, load split-out segments */
> +				snprintf(fw_name + fw_name_len - 3, 4, "b%02d", i);
> +				ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
> +								ptr, phdr->p_filesz);
> +				if (ret) {
> +					dev_err(dev, "failed to load %s\n", fw_name);
> +					break;
> +				}
> +
> +				release_firmware(seg_fw);
>  			}
> -
> -			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
> -		} else if (phdr->p_filesz) {
> -			/* Firmware not large enough, load split-out segments */
> -			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
> -			ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
> -							ptr, phdr->p_filesz);
> -			if (ret) {
> -				dev_err(dev, "failed to load %s\n", fw_name);
> -				break;
> -			}
> -
> -			release_firmware(seg_fw);
>  		}
>  
>  		if (phdr->p_memsz > phdr->p_filesz)
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
