Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FCB333A25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 11:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhCJKha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 05:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbhCJKhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 05:37:20 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3DFC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 02:37:19 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so10381978wmj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 02:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B8Z9rvCBiY15UvdVVjvfLubumMo7++dKg9/r1aZGGMs=;
        b=TacreJcO5kLw9VASNDp9dAziTJFlTXQVCpzcfYxuKfKM5/HidMWaBVMRxdJUS5s/FB
         Pho1KMUHpVrgH1xOdiqJa+YCFFbyJu52dop4LNZRenFOkrOkfp5IbpJ3fBCtK8/ifBH9
         Go+HSF4/Z+JhtpSVu0zZNJXV2TdpTHJatChX2crs8tM/F+kzY5eUBFwqSkIi4QwPygIt
         npFDnLzgdm1Kng/XkCQwk9/F3kPCeUzrMX73rKSatY1lKHpgk8yvimh5kKgky4kRh39a
         QIhd2dv6S7Wyvy2SzvVgSZc4G4nU2JrP4CYRxiGuRvQ6xmx6EFe218tGkFgniqKCpQVx
         9hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B8Z9rvCBiY15UvdVVjvfLubumMo7++dKg9/r1aZGGMs=;
        b=CCuUyxIgTzXR6B1rCOx/2B6+M/sDRBmK8cYZpv/dzvmsfxImPRPPfjlFmEGnY0fa0q
         Khkut6SOyXxcs6i3g+HGs/T3eop3lVoucgycXggPRY9T6sqcNo0yvC+eTZLLYpgRkkFD
         kTSSDTfXp2lib8Kiw/XNJ/X7ij89W+BrZ/yaC4p7Fe+e4bgBuXogsAQk2d5YKv3UZuPp
         mTb3119bsu3qe1BtNWFwhE9ekmHsRg/+3RaSFHo5WLKJVe/dRYdXZeFE6suBD4RP+/3k
         1TctdWDJtF1P1acFhJz1K+qravGDclczUN4D3uXr9JOE1AS6sttT91pcVV1b8KCZ8Ns/
         a0ig==
X-Gm-Message-State: AOAM531CYxVyflT5jAQjhKE4RZ8UoDyaNOtcn968Mft9RhU+r1imys6u
        ZnmRr9mXf2nnqzCIoXibUTqcmA==
X-Google-Smtp-Source: ABdhPJxw0SILOBY28/u/sAJusya8TGRrZcAl0HQy/kAhaurmYidjJwbws0SLAe0/SLw4usRAsAAMPg==
X-Received: by 2002:a1c:9a47:: with SMTP id c68mr2636620wme.63.1615372638400;
        Wed, 10 Mar 2021 02:37:18 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id h20sm8367429wmm.19.2021.03.10.02.37.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 02:37:17 -0800 (PST)
Subject: Re: [PATCH 1/3] nvmem: core: Add functions to make number reading
 easy
To:     Douglas Anderson <dianders@chromium.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20210305162546.1.I323dad4343256b48af2be160b84b1e87985cc9be@changeid>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8e274cc7-0c9e-b983-7dd9-c501c159e95a@linaro.org>
Date:   Wed, 10 Mar 2021 10:37:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210305162546.1.I323dad4343256b48af2be160b84b1e87985cc9be@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 06/03/2021 00:26, Douglas Anderson wrote:
> Sometimes the clients of nvmem just want to get a number out of
> nvmem. They don't want to think about exactly how many bytes the nvmem
> cell took up. They just want the number. Let's make it easy.
> 
> In general this concept is useful because nvmem space is precious and
> usually the fewest bits are allocated that will hold a given value on
> a given system. However, even though small numbers might be fine on
> one system that doesn't mean that logically the number couldn't be
> bigger. Imagine nvmem containing a max frequency for a component. On
> one system perhaps that fits in 16 bits. On another system it might
> fit in 32 bits. The code reading this number doesn't care--it just
> wants the number.
> 
> We'll provide two functions: nvmem_cell_read_variable_le_u32() and
> nvmem_cell_read_variable_le_u64().
> 
> Comparing these to the existing functions like nvmem_cell_read_u32():
> * These new functions have no problems if the value was stored in
>    nvmem in fewer bytes. It's OK to use these function as long as the
>    value stored will fit in 32-bits (or 64-bits).
> * These functions avoid problems that the earlier APIs had with bit
>    offsets. For instance, you can't use nvmem_cell_read_u32() to read a
>    value has nbits=32 and bit_offset=4 because the nvmem cell must be
>    at least 5 bytes big to hold this value. The new API accounts for
>    this and works fine.
> * These functions make it very explicit that they assume that the
>    number was stored in little endian format. The old functions made
>    this assumption whenever bit_offset was non-zero (see
>    nvmem_shift_read_buffer_in_place()) but didn't whenever the
>    bit_offset was zero.
> 
> NOTE: it's assumed that we don't need an 8-bit or 16-bit version of
> this function. The 32-bit version of the function can be used to read
> 8-bit or 16-bit data.
> 
> At the moment, I'm only adding the "unsigned" versions of these
> functions, but if it ends up being useful someone could add a "signed"
> version that did 2's complement sign extension.
> 
> At the moment, I'm only adding the "little endian" versions of these
> functions. Adding the "big endian" version would require adding "big
> endian" support to nvmem_shift_read_buffer_in_place().
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This is a logical follow-up to:
>    https://lore.kernel.org/r/20210227002603.3260599-1-dianders@chromium.org/
> ...but since it doesn't really share any of the same patches I'm not
> marking it as a v2.
> 
>   drivers/nvmem/core.c           | 95 ++++++++++++++++++++++++++++++++++
>   include/linux/nvmem-consumer.h |  4 ++
>   2 files changed, 99 insertions(+)
> 

This patch as it is LGTM.

If you plan to take this via other trees, here is

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index a5ab1e0c74cf..635e3131eb5f 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1606,6 +1606,101 @@ int nvmem_cell_read_u64(struct device *dev, const char *cell_id, u64 *val)
>   }
>   EXPORT_SYMBOL_GPL(nvmem_cell_read_u64);
>   
> +static void *nvmem_cell_read_variable_common(struct device *dev,
> +					     const char *cell_id,
> +					     size_t max_len, size_t *len)
> +{
> +	struct nvmem_cell *cell;
> +	int nbits;
> +	void *buf;
> +
> +	cell = nvmem_cell_get(dev, cell_id);
> +	if (IS_ERR(cell))
> +		return cell;
> +
> +	nbits = cell->nbits;
> +	buf = nvmem_cell_read(cell, len);
> +	nvmem_cell_put(cell);
> +	if (IS_ERR(buf))
> +		return buf;
> +
> +	/*
> +	 * If nbits is set then nvmem_cell_read() can significantly exaggerate
> +	 * the length of the real data. Throw away the extra junk.
> +	 */
> +	if (nbits)
> +		*len = DIV_ROUND_UP(nbits, 8);
> +
> +	if (*len > max_len) {
> +		kfree(buf);
> +		return ERR_PTR(-ERANGE);
> +	}
> +
> +	return buf;
> +}
> +
> +/**
> + * nvmem_cell_read_variable_le_u32() - Read up to 32-bits of data as a little endian number.
> + *
> + * @dev: Device that requests the nvmem cell.
> + * @cell_id: Name of nvmem cell to read.
> + * @val: pointer to output value.
> + *
> + * Return: 0 on success or negative errno.
> + */
> +int nvmem_cell_read_variable_le_u32(struct device *dev, const char *cell_id,
> +				    u32 *val)
> +{
> +	size_t len;
> +	u8 *buf;
> +	int i;
> +
> +	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	/* Copy w/ implicit endian conversion */
> +	*val = 0;
> +	for (i = 0; i < len; i++)
> +		*val |= buf[i] << (8 * i);
> +
> +	kfree(buf);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(nvmem_cell_read_variable_le_u32);
> +
> +/**
> + * nvmem_cell_read_variable_le_u64() - Read up to 64-bits of data as a little endian number.
> + *
> + * @dev: Device that requests the nvmem cell.
> + * @cell_id: Name of nvmem cell to read.
> + * @val: pointer to output value.
> + *
> + * Return: 0 on success or negative errno.
> + */
> +int nvmem_cell_read_variable_le_u64(struct device *dev, const char *cell_id,
> +				    u64 *val)
> +{
> +	size_t len;
> +	u8 *buf;
> +	int i;
> +
> +	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	/* Copy w/ implicit endian conversion */
> +	*val = 0;
> +	for (i = 0; i < len; i++)
> +		*val |= buf[i] << (8 * i);
> +
> +	kfree(buf);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(nvmem_cell_read_variable_le_u64);
> +
>   /**
>    * nvmem_device_cell_read() - Read a given nvmem device and cell
>    *
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 052293f4cbdb..923dada24eb4 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -65,6 +65,10 @@ int nvmem_cell_read_u8(struct device *dev, const char *cell_id, u8 *val);
>   int nvmem_cell_read_u16(struct device *dev, const char *cell_id, u16 *val);
>   int nvmem_cell_read_u32(struct device *dev, const char *cell_id, u32 *val);
>   int nvmem_cell_read_u64(struct device *dev, const char *cell_id, u64 *val);
> +int nvmem_cell_read_variable_le_u32(struct device *dev, const char *cell_id,
> +				    u32 *val);
> +int nvmem_cell_read_variable_le_u64(struct device *dev, const char *cell_id,
> +				    u64 *val);
>   
>   /* direct nvmem device read/write interface */
>   struct nvmem_device *nvmem_device_get(struct device *dev, const char *name);
> 
