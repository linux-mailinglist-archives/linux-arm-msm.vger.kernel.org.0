Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F574C71B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 17:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbiB1Q2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 11:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbiB1Q2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 11:28:38 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55C23D49E
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 08:27:58 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id v5so10368889ilm.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O3hrNUKZz0hZoa4qpWFUDxgojPvciePxPgJTSPJjG7I=;
        b=rk27GmbVW+kAIcVRONavP6YIq3iqxBCvngR2of4BWE8MuQqo8+c0oZx/fEIgb08Gj6
         cQ43X4lPGjxRQZK190Hz72smeCWawrzH5NS+8H5hoLye5O/3VApm2FUcaU/LQaO44Qq1
         NlosUyU6QKs2n97x2/zNWNiekAYCzHTDmU48ENNM87aue5AYHIFdm06MOqMjXeTirhk+
         2KCZwrLIACsg6S1NZ+Y69WyOtTDewMrjQTf21cCtNLXwdSnHQqif66lYdMHWL1cdUHNu
         SLRY5ST1ZzPdZCtfHr/xEbZ48RLW5HeSzrDW/dNTTx10/iwgvdDPpjpT5iH+OIzyQ8Z4
         FsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O3hrNUKZz0hZoa4qpWFUDxgojPvciePxPgJTSPJjG7I=;
        b=PXXIrvIWPHcNDgJ+jzw4wr8R1fj4Y5hTO5wgbtRCjb0Xb52qVonBVRMKvHuAdg18F4
         Uy7IOvt0qwyOYd9mjQq9UZoFoE8t5+QF985z0X65pXUnNZ9SKLz3Lq954M16n48oN5Hx
         Z5+1tSvBkIuUUcYfRS3/Z7TvWA1dft3pqXZIX4SintTcxVPcdcDsL0EE2IKtHEoUR1OK
         9BCgfIVj2JrZR3Kn7JTXpHYI3XKbFuCY0ejwHcyOcH/vTvZVadw+UjkODTNblsbGoHqW
         VbkVBZYGoQuqOGzo4aH1zB7o8G8TtokCAvhiUq9e3rUoPX0YuLdBgMh4A0+MDTvAHxOW
         HpVg==
X-Gm-Message-State: AOAM531WrMAWXv6mJLaxMOfe4ruVmONAM6JehtPOA2mvQCaw8FJZ8U0s
        1xgIaoE5JK/ualpSNMZhRzGnkQ==
X-Google-Smtp-Source: ABdhPJzFMcmMsIa91T+NxytQ+isZ1l4GDgClNSWaDJBO65yZAH+Oiby4uMQJBW1cvKd++usHMH9sww==
X-Received: by 2002:a92:c56f:0:b0:2c1:a956:6b29 with SMTP id b15-20020a92c56f000000b002c1a9566b29mr20106089ilj.64.1646065678220;
        Mon, 28 Feb 2022 08:27:58 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id o12-20020a92d38c000000b002c25f9905fasm6355270ilo.57.2022.02.28.08.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 08:27:57 -0800 (PST)
Message-ID: <b3e34b0d-924e-2512-82be-e48a3daacfd7@linaro.org>
Date:   Mon, 28 Feb 2022 10:27:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 14/27] bus: mhi: ep: Add support for ring management
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
 <20220228124344.77359-15-manivannan.sadhasivam@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220228124344.77359-15-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/28/22 6:43 AM, Manivannan Sadhasivam wrote:
> Add support for managing the MHI ring. The MHI ring is a circular queue
> of data structures used to pass the information between host and the
> endpoint.
> 
> MHI support 3 types of rings:
> 
> 1. Transfer ring
> 2. Event ring
> 3. Command ring
> 
> All rings reside inside the host memory and the MHI EP device maps it to
> the device memory using blocks like PCIe iATU. The mapping is handled in
> the MHI EP controller driver itself.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/bus/mhi/ep/Makefile   |   2 +-
>   drivers/bus/mhi/ep/internal.h |  18 ++++
>   drivers/bus/mhi/ep/ring.c     | 197 ++++++++++++++++++++++++++++++++++
>   3 files changed, 216 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/bus/mhi/ep/ring.c
> 
> diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
> index a1555ae287ad..7ba0e04801eb 100644
> --- a/drivers/bus/mhi/ep/Makefile
> +++ b/drivers/bus/mhi/ep/Makefile
> @@ -1,2 +1,2 @@
>   obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
> -mhi_ep-y := main.o mmio.o
> +mhi_ep-y := main.o mmio.o ring.o
> diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
> index 139e939fcf57..b3b8770f2f4e 100644
> --- a/drivers/bus/mhi/ep/internal.h
> +++ b/drivers/bus/mhi/ep/internal.h
> @@ -114,6 +114,11 @@ union mhi_ep_ring_ctx {
>   	struct mhi_generic_ctx generic;
>   };
>   
> +struct mhi_ep_ring_item {
> +	struct list_head node;
> +	struct mhi_ep_ring *ring;
> +};
> +
>   struct mhi_ep_ring {
>   	struct mhi_ep_cntrl *mhi_cntrl;
>   	union mhi_ep_ring_ctx *ring_ctx;
> @@ -126,6 +131,9 @@ struct mhi_ep_ring {
>   	u32 db_offset_h;
>   	u32 db_offset_l;
>   	u32 ch_id;
> +	u32 er_index;
> +	u32 irq_vector;
> +	bool started;
>   };
>   
>   struct mhi_ep_cmd {
> @@ -151,6 +159,16 @@ struct mhi_ep_chan {
>   	bool skip_td;
>   };
>   
> +/* MHI Ring related functions */
> +void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id);
> +void mhi_ep_ring_reset(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring);
> +int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
> +		      union mhi_ep_ring_ctx *ctx);
> +size_t mhi_ep_ring_addr2offset(struct mhi_ep_ring *ring, u64 ptr);
> +int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *element);
> +void mhi_ep_ring_inc_index(struct mhi_ep_ring *ring);
> +int mhi_ep_update_wr_offset(struct mhi_ep_ring *ring);
> +
>   /* MMIO related functions */
>   u32 mhi_ep_mmio_read(struct mhi_ep_cntrl *mhi_cntrl, u32 offset);
>   void mhi_ep_mmio_write(struct mhi_ep_cntrl *mhi_cntrl, u32 offset, u32 val);
> diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
> new file mode 100644
> index 000000000000..1029eed2cc28
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/ring.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/mhi_ep.h>
> +#include "internal.h"
> +
> +size_t mhi_ep_ring_addr2offset(struct mhi_ep_ring *ring, u64 ptr)
> +{
> +	return (ptr - ring->rbase) / sizeof(struct mhi_ring_element);
> +}
> +
> +static u32 mhi_ep_ring_num_elems(struct mhi_ep_ring *ring)
> +{
> +	return le64_to_cpu(ring->ring_ctx->generic.rlen) / sizeof(struct mhi_ring_element);
> +}
> +
> +void mhi_ep_ring_inc_index(struct mhi_ep_ring *ring)
> +{
> +	ring->rd_offset = (ring->rd_offset + 1) % ring->ring_size;
> +}
> +
> +static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
> +{
> +	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	size_t start, copy_size;
> +	int ret;
> +
> +	/* Don't proceed in the case of event ring. This happens during mhi_ep_ring_start(). */
> +	if (ring->type == RING_TYPE_ER)
> +		return 0;
> +
> +	/* No need to cache the ring if write pointer is unmodified */
> +	if (ring->wr_offset == end)
> +		return 0;
> +
> +	start = ring->wr_offset;
> +	if (start < end) {
> +		copy_size = (end - start) * sizeof(struct mhi_ring_element);
> +		ret = mhi_cntrl->read_from_host(mhi_cntrl, ring->rbase +
> +						(start * sizeof(struct mhi_ring_element)),
> +						&ring->ring_cache[start], copy_size);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		copy_size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
> +		ret = mhi_cntrl->read_from_host(mhi_cntrl, ring->rbase +
> +						(start * sizeof(struct mhi_ring_element)),
> +						&ring->ring_cache[start], copy_size);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (end) {
> +			ret = mhi_cntrl->read_from_host(mhi_cntrl, ring->rbase,
> +							&ring->ring_cache[0],
> +							end * sizeof(struct mhi_ring_element));
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end, copy_size);
> +
> +	return 0;
> +}
> +
> +static int mhi_ep_cache_ring(struct mhi_ep_ring *ring, u64 wr_ptr)
> +{
> +	size_t wr_offset;
> +	int ret;
> +
> +	wr_offset = mhi_ep_ring_addr2offset(ring, wr_ptr);
> +
> +	/* Cache the host ring till write offset */
> +	ret = __mhi_ep_cache_ring(ring, wr_offset);
> +	if (ret)
> +		return ret;
> +
> +	ring->wr_offset = wr_offset;
> +
> +	return 0;
> +}
> +
> +int mhi_ep_update_wr_offset(struct mhi_ep_ring *ring)
> +{
> +	u64 wr_ptr;
> +
> +	wr_ptr = mhi_ep_mmio_get_db(ring);
> +
> +	return mhi_ep_cache_ring(ring, wr_ptr);
> +}
> +
> +/* TODO: Support for adding multiple ring elements to the ring */
> +int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *el)
> +{
> +	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	size_t old_offset = 0;
> +	u32 num_free_elem;
> +	int ret;
> +
> +	ret = mhi_ep_update_wr_offset(ring);
> +	if (ret) {
> +		dev_err(dev, "Error updating write pointer\n");
> +		return ret;
> +	}
> +
> +	if (ring->rd_offset < ring->wr_offset)
> +		num_free_elem = (ring->wr_offset - ring->rd_offset) - 1;
> +	else
> +		num_free_elem = ((ring->ring_size - ring->rd_offset) + ring->wr_offset) - 1;
> +
> +	/* Check if there is space in ring for adding at least an element */
> +	if (!num_free_elem) {
> +		dev_err(dev, "No space left in the ring\n");
> +		return -ENOSPC;
> +	}
> +
> +	old_offset = ring->rd_offset;
> +	mhi_ep_ring_inc_index(ring);
> +
> +	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
> +
> +	/* Update rp in ring context */
> +	ring->ring_ctx->generic.rp = cpu_to_le64((ring->rd_offset * sizeof(*el)) + ring->rbase);
> +
> +	ret = mhi_cntrl->write_to_host(mhi_cntrl, el, ring->rbase + (old_offset * sizeof(*el)),
> +				       sizeof(*el));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
> +{
> +	ring->type = type;
> +	if (ring->type == RING_TYPE_CMD) {
> +		ring->db_offset_h = EP_CRDB_HIGHER;
> +		ring->db_offset_l = EP_CRDB_LOWER;
> +	} else if (ring->type == RING_TYPE_CH) {
> +		ring->db_offset_h = CHDB_HIGHER_n(id);
> +		ring->db_offset_l = CHDB_LOWER_n(id);
> +		ring->ch_id = id;
> +	} else {
> +		ring->db_offset_h = ERDB_HIGHER_n(id);
> +		ring->db_offset_l = ERDB_LOWER_n(id);
> +	}
> +}
> +
> +int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
> +			union mhi_ep_ring_ctx *ctx)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	int ret;
> +
> +	ring->mhi_cntrl = mhi_cntrl;
> +	ring->ring_ctx = ctx;
> +	ring->ring_size = mhi_ep_ring_num_elems(ring);
> +	ring->rbase = le64_to_cpu(ring->ring_ctx->generic.rbase);
> +
> +	if (ring->type == RING_TYPE_CH)
> +		ring->er_index = le32_to_cpu(ring->ring_ctx->ch.erindex);
> +
> +	if (ring->type == RING_TYPE_ER)
> +		ring->irq_vector = le32_to_cpu(ring->ring_ctx->ev.msivec);
> +
> +	/* During ring init, both rp and wp are equal */
> +	ring->rd_offset = mhi_ep_ring_addr2offset(ring, le64_to_cpu(ring->ring_ctx->generic.rp));
> +	ring->wr_offset = mhi_ep_ring_addr2offset(ring, le64_to_cpu(ring->ring_ctx->generic.rp));
> +
> +	/* Allocate ring cache memory for holding the copy of host ring */
> +	ring->ring_cache = kcalloc(ring->ring_size, sizeof(struct mhi_ring_element), GFP_KERNEL);
> +	if (!ring->ring_cache)
> +		return -ENOMEM;
> +
> +	ret = mhi_ep_cache_ring(ring, le64_to_cpu(ring->ring_ctx->generic.wp));
> +	if (ret) {
> +		dev_err(dev, "Failed to cache ring\n");
> +		kfree(ring->ring_cache);
> +		return ret;
> +	}
> +
> +	ring->started = true;
> +
> +	return 0;
> +}
> +
> +void mhi_ep_ring_reset(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring)
> +{
> +	ring->started = false;
> +	kfree(ring->ring_cache);
> +	ring->ring_cache = NULL;
> +}

