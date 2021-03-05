Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538A032E655
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 11:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCEK2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 05:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhCEK15 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 05:27:57 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE82CC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 02:27:56 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v15so1496631wrx.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 02:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5+hSVXn8OdsmYs+09+Ki3tAAGmQxr3aimu+yu1IZzog=;
        b=nq0CPl8WkxhRL+s3j1tsQCm2IUp84gSynRl1cuXrEBxEceST5WUXbyroMGHh3iHTiK
         BPjnLAS1cAYORKO+2EHmk0gJ0Pr9l0Cy7ph8Tb6U5rKdoJhhpfIgJ7GIEL1l+MxoUUV+
         fnY7xTWUlVY/rx0kSCNme0b8qitL8rH53V0I/usU99xafLwgcSZo9RUQH6nvrNiX+Ij/
         EMJGNWe/WLbzlZv0CoTj2Rtcc8h18GdsogJkYcJEl+y4pxc200pxxefB6gVtX4amrDn5
         /n+loylU4GZlDhwyZp4IPvUlpnNOBmDTteby1MUrB//ChMje4QW48cNBgLuHSvIJltYE
         eBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5+hSVXn8OdsmYs+09+Ki3tAAGmQxr3aimu+yu1IZzog=;
        b=aZbZKZnYOveCfrTUEUkMwQIIrL3pU/ewwBU/7sPpMaeRYfwb4rRpx3PrD1gyCgdxIi
         ZS/tYiS8omU2DBdxWFl2rS3YfYlHl72YMrnXKZXHqLUZdTC69uHQl5oUCFQBkgUFkCrg
         p9bhqOakC0iSn0tTwjkXeofhyfM0Pdpllo3Gb3nmzOaTobgSu+4nrl0CPaLJoAZJgtbb
         DIQDtVPeXtkZjblVNxlhDlYSlotiSRTxUR9VawmZdX4h+QF4rAxXqFwVlu/R4kE7i4Mp
         6Uu119WK0njB1d5Mexe9By1GpJatRm//hVz6bBWm2lIx7UmoVuYwGjuDjjTwl4F95Amd
         ENKg==
X-Gm-Message-State: AOAM532S4EMlLfEEqB+bO6zhWEaPdtAkdTGrghlULu71dv3YpBOipPZP
        OUL1lPJDXGTqHKukjS+PKWbuciU+bqqayg==
X-Google-Smtp-Source: ABdhPJwpNClB22cY56RvIY7cKySG3TkjKyVfZwgsD+zENzMOkLlKGJGCS3v+hS1Vnb5IvgkhhWHReQ==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr8773309wrm.260.1614940075591;
        Fri, 05 Mar 2021 02:27:55 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id s23sm3652107wmc.29.2021.03.05.02.27.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:27:55 -0800 (PST)
Subject: Re: [PATCH 2/3] nvmem: core: Allow nvmem_cell_read_u16/32/64 to read
 smaller cells
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Niklas Cassel <niklas.cassel@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210227002603.3260599-1-dianders@chromium.org>
 <20210226162521.2.I7c9190630cf9131b42d521aa1c5b97135012a734@changeid>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6537aec4-7f6e-ede9-12ea-e84bab738d7b@linaro.org>
Date:   Fri, 5 Mar 2021 10:27:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210226162521.2.I7c9190630cf9131b42d521aa1c5b97135012a734@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27/02/2021 00:26, Douglas Anderson wrote:
> The current way that cell "length" is specified for nvmem cells is a
> little fuzzy. For instance, let's look at the gpu speed bin currently
> in sc7180.dtsi:
> 
>    gpu_speed_bin: gpu_speed_bin@1d2 {
>      reg = <0x1d2 0x2>;
>      bits = <5 8>;
>    };
> 
> This is an 8-bit value (as specified by the "bits" field). However,
> it has a "length" of 2 (bytes), presumably because the value spans
> across two bytes.
> 
> When querying this value right now, it's hard for a client to know if
> they should be calling nvmem_cell_read_u16() or nvmem_cell_read_u8().
> Today they must call nvmem_cell_read_u16() because the "length" of the
> cell was 2 (bytes). However, if a later SoC ever came around and
> didn't span across 2 bytes it would be unclear.  If a later Soc
> specified, for instance:
> 
>    gpu_speed_bin: gpu_speed_bin@100 {
>      reg = <0x100 0x1>;
>      bits = <0 8>;
>    };
> 
> ...then the caller would need to change to try calling
> nvmem_cell_read_u8() because the u16 version would fail.
> 

If the consumer driver is expecting the sizes to span around byte to 
many bytes, then, Why not just call nvmem_cell_read() which should also 
return you how many bytes it has read!


> Let's solve this by allowing clients to read a "larger" value. We'll
> just fill it in with 0. 

That is misleading the consumer! If the consumer is expecting a u16 or 
u32, cell size should be of that size!!

--srini

If a client truly wants to know exactly how
> big the cell was they can fall back to calling nvmem_cell_read()
> directly.
> 
> NOTE: current implementation assumes that cells are little endian when
> up-casting the size, but that's already pretty implicit in the way
> nvmem works now anyway. See nvmem_shift_read_buffer_in_place(). Let's
> document this but not do any auto-conversions just in case there was
> an instance where someone was using this API to read big endian data
> on a big endian machine and it happened to be working because there
> was no bit offset.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I will freely admit that I always end up thinking in circles and
> getting dizzy when I think too much about endian considerations. If
> anyone has better intuition than I do and see that I've goofed this up
> then please yell.
> 
>   drivers/nvmem/core.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index a5ab1e0c74cf..8602390bb124 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1534,12 +1534,14 @@ static int nvmem_cell_read_common(struct device *dev, const char *cell_id,
>   		nvmem_cell_put(cell);
>   		return PTR_ERR(buf);
>   	}
> -	if (len != count) {
> +	if (len > count) {
>   		kfree(buf);
>   		nvmem_cell_put(cell);
>   		return -EINVAL;
> +	} else if (len != count) {
> +		memset(val + len, 0, count - len);
>   	}
> -	memcpy(val, buf, count);
> +	memcpy(val, buf, len);
>   	kfree(buf);
>   	nvmem_cell_put(cell);
>   
> @@ -1564,6 +1566,11 @@ EXPORT_SYMBOL_GPL(nvmem_cell_read_u8);
>   /**
>    * nvmem_cell_read_u16() - Read a cell value as a u16
>    *
> + * This function can be used to read any cell value 16-bits or less.  If
> + * this function needs to upcast (or if the cell was stored in nvmem with
> + * a bit offset) it will assume that the cell is little endian.  Clients
> + * should generally call le16_to_cpu() on the returned value.
> + *
>    * @dev: Device that requests the nvmem cell.
>    * @cell_id: Name of nvmem cell to read.
>    * @val: pointer to output value.
> @@ -1579,6 +1586,11 @@ EXPORT_SYMBOL_GPL(nvmem_cell_read_u16);
>   /**
>    * nvmem_cell_read_u32() - Read a cell value as a u32
>    *
> + * This function can be used to read any cell value 32-bits or less.  If
> + * this function needs to upcast (or if the cell was stored in nvmem with
> + * a bit offset) it will assume that the cell is little endian.  Clients
> + * should generally call le32_to_cpu() on the returned value.
> + *
>    * @dev: Device that requests the nvmem cell.
>    * @cell_id: Name of nvmem cell to read.
>    * @val: pointer to output value.
> @@ -1594,6 +1606,11 @@ EXPORT_SYMBOL_GPL(nvmem_cell_read_u32);
>   /**
>    * nvmem_cell_read_u64() - Read a cell value as a u64
>    *
> + * This function can be used to read any cell value 64-bits or less.  If
> + * this function needs to upcast (or if the cell was stored in nvmem with
> + * a bit offset) it will assume that the cell is little endian.  Clients
> + * should generally call le64_to_cpu() on the returned value.
> + *
>    * @dev: Device that requests the nvmem cell.
>    * @cell_id: Name of nvmem cell to read.
>    * @val: pointer to output value.
> 
