Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920F42EEA5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 01:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbhAHAW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 19:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729638AbhAHAW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 19:22:27 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F256FC0612F6
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 16:21:22 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 9so9498910oiq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 16:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jh1NDgjNWRjA8Aq13pnXKbiZVjDJiJx85Umgevs5PU8=;
        b=d1V+5OfpVMa6VjIwSL+c3ajAIHJgDuVGtVjNFITMZ2Xg3kTlzRaUcnIOe8wIcC6dGn
         VrRzsl+SH8sTTPjAT/pzlCpJ7HZ1uO5ttZRxD/9xqAvh151mqDpxV2/mnrPxBgt38lCu
         2v2J4pnbWCXYEyUsKZLy8EAISzeXY+Tk3XsnnowfP3YCa4MMBwwLpdLPrlBLiDGn1vzi
         SJG3qtNnL2m99r+e+DS/NVD5CAnUPe//mrO7cc0U9sTJPICcdQ32Q5JgNwSZIj2jKdFF
         cjbV9Y14gKj/66nyfJoUVP6556sT8trSlDVJnQ6IfnyawQrYcf72UXNBjGrmQIXvqRlE
         0lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jh1NDgjNWRjA8Aq13pnXKbiZVjDJiJx85Umgevs5PU8=;
        b=WQhFSkSuA2C/c8oON/4gmaGZ9DAxPKfuDiMjRqBfUPQ4/6FY7xYGyZ6fieDjigs49F
         LmsgSI2RwvEkJc/n2VE8C+d5/1stIroWIcMmVjHlWRMvFuoUU+I9LuJvEEavjiKm+wQc
         ilwQ0mhLi/gwtEbxgiH/FZ15Tu7ryW/9ogdv3ihPTSz2kfu5EHt15XWwdXN+oLpX/eJS
         vy/3wejdri/lOtrf6oQbNFq14meLBgKVCx45XOFnjmGfNasmxD5rjFDXhgbW1hRAlyVI
         2cp7E+vOJRDXLY27j6bKULw2wUYOoTQlnpauK98aEeMcuHCjMxBVVfUG95xFjmtbcDHs
         XShw==
X-Gm-Message-State: AOAM532x8NzzFE+pAb29d5HKzuj6K7raKQt4k861tnCdJ0vc0qExvNuB
        pyy+AU+3vavVw2mjajbsW9lohMqjHW7TmA==
X-Google-Smtp-Source: ABdhPJxsgt0CDcHNxBQpHrl+MTl1CCja/p2uRaji3iF5aJ4YtKMaIRd4Eu0hqeG4qXijEwNS/A7F8w==
X-Received: by 2002:aca:3dd7:: with SMTP id k206mr759727oia.134.1610065282324;
        Thu, 07 Jan 2021 16:21:22 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g12sm1440706otg.10.2021.01.07.16.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 16:21:21 -0800 (PST)
Date:   Thu, 7 Jan 2021 18:21:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Read hash from firmware blob
Message-ID: <X/elgO+66ibjeL+3@builder.lan>
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
 <1609968211-7579-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609968211-7579-4-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Jan 15:23 CST 2021, Siddharth Gupta wrote:

> Since the split elf blobs will always contain the hash segment, we rely on

I think it will sounds better if we add "should" in "we should rely on..."

> the blob file to get the hash rather than assume that it will be present in
> the mdt file. This change uses the hash index to read the appropriate elf
> blob to get the hash segment.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c  |  4 ++--
>  drivers/soc/qcom/mdt_loader.c       | 38 +++++++++++++++++++++++++++----------
>  include/linux/soc/qcom/mdt_loader.h |  3 ++-
>  3 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 66106ba..74c0229 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -4,7 +4,7 @@
>   *
>   * Copyright (C) 2016 Linaro Ltd.
>   * Copyright (C) 2014 Sony Mobile Communications AB
> - * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2013, 2020 The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/clk.h>
> @@ -828,7 +828,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  	void *ptr;
>  	int ret;
>  
> -	metadata = qcom_mdt_read_metadata(fw, &size);
> +	metadata = qcom_mdt_read_metadata(qproc->dev, fw, qproc->hexagon_mdt_image, &size);
>  	if (IS_ERR(metadata))
>  		return PTR_ERR(metadata);
>  
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index c9bbd8c..6876c0b 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -103,15 +103,18 @@ EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
>   *
>   * Return: pointer to data, or ERR_PTR()
>   */
> -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
> +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
> +			     size_t *data_len)
>  {
>  	const struct elf32_phdr *phdrs;
>  	const struct elf32_hdr *ehdr;
> -	size_t hash_offset;
> +	const struct firmware *seg_fw;
>  	size_t hash_index;
>  	size_t hash_size;
>  	size_t ehdr_size;
> +	char *fw_name;
>  	void *data;
> +	int ret;
>  
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
> @@ -137,14 +140,29 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>  	if (!data)
>  		return ERR_PTR(-ENOMEM);
>  
> -	/* Is the header and hash already packed */
> -	if (qcom_mdt_bins_are_split(fw))
> -		hash_offset = phdrs[0].p_filesz;
> -	else
> -		hash_offset = phdrs[hash_index].p_offset;
> -
> +	/* copy elf header */
>  	memcpy(data, fw->data, ehdr_size);
> -	memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
> +

This seems to duplicates parts of the loop in __qcom_mdt_load(), how
about breaking this out to a separate

static int mdt_load_segment(struct device *dev, const struct firmware *fw,
			    int idx, void *buf, size_t len, bool is_split)

Which either just memcpy from @fw or does the filename and loading
dance, based on @is_split?

Regards,
Bjorn

> +	if (qcom_mdt_bins_are_split(fw)) {
> +		fw_name = kstrdup(firmware, GFP_KERNEL);
> +		if (!fw_name) {
> +			kfree(data);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +		snprintf(fw_name + strlen(fw_name) - 3, 4, "b%02d", hash_index);
> +
> +		ret = request_firmware_into_buf(&seg_fw, fw_name, dev, data + ehdr_size, hash_size);
> +		kfree(fw_name);
> +
> +		if (ret) {
> +			kfree(data);
> +			return ERR_PTR(ret);
> +		}
> +
> +		release_firmware(seg_fw);
> +	} else {
> +		memcpy(data + ehdr_size, fw->data + phdrs[hash_index].p_offset, hash_size);
> +	}
>  
>  	*data_len = ehdr_size + hash_size;
>  
> @@ -191,7 +209,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		return -ENOMEM;
>  
>  	if (pas_init) {
> -		metadata = qcom_mdt_read_metadata(fw, &metadata_len);
> +		metadata = qcom_mdt_read_metadata(dev, fw, firmware, &metadata_len);
>  		if (IS_ERR(metadata)) {
>  			ret = PTR_ERR(metadata);
>  			goto out;
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index e600bae..04ba5e8 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -21,6 +21,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  			  const char *fw_name, int pas_id, void *mem_region,
>  			  phys_addr_t mem_phys, size_t mem_size,
>  			  phys_addr_t *reloc_base);
> -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
> +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
> +			     size_t *data_len);
>  
>  #endif
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
