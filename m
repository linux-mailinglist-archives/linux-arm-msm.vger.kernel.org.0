Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FD842CE14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhJMWcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbhJMWcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:32:20 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4374AC061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:16 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id y67so1479586iof.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oF0iPtyjsTTR1yTh/BwWvIZP+4z74H6xesWC3R7KH/k=;
        b=AfecqWo4/beRevzvEHj9nZWPwJls8LXaTLtaK4qGis1Z67xe4kytYc4cPOmhO4sNTh
         5aSa79htr/tzP9eCNnp7X/wma7nf08RyhzzCffj/SRFhEvYg+ozPb5hyD12JAeiVpZM7
         jAUF93kvgAZlt0FkmJD3NQa7TmrQwNkIA/kG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oF0iPtyjsTTR1yTh/BwWvIZP+4z74H6xesWC3R7KH/k=;
        b=hIQmj9XT5zz5pyiRTC1TQnZqu+HJ7a7BhYCoJZX9jOC+bUxk2DxEV7m4Dtw3N9Ch2O
         ZRLJR/0ryHQcO6GHhF7Lx6S6dFBDYkg3hXntZePwjzTBsCbAg4YoM5+TAJGPN8h2HliE
         MevlqUOtCCX7TKMOs01a64S66EcVbWVw+QFso3p+A56Nd9qksRHKBImbF72WIWuXiwnC
         4Al7Tf13LTj9LWOMbztiF8+Xw8Y0EMDwOzNhe50/9BibIRVTP6tZ6BkJ3sxPZ+tZ1AKZ
         3ULaxypxJ7vxnHI8HobfKs3g+o82JliRnM+VrqzlrCEfb3O7eP9ttZGoS2UZdm8dteaQ
         3O8A==
X-Gm-Message-State: AOAM533EOFCi8x8JLyFVvSCgjbB0M8+WzMQjCWchqbSqUFDWXK8vIRLv
        MPSrXY729UqXk6srOKPdeu81Rw==
X-Google-Smtp-Source: ABdhPJyzgin8AlIMOxRiFSLjROwUBORf+h+MMulKL9D4Y5DO+0vgeo20Kp30Sc1Jexo4ZUMORHPsUw==
X-Received: by 2002:a05:6638:39c:: with SMTP id y28mr1485441jap.47.1634164215426;
        Wed, 13 Oct 2021 15:30:15 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id y11sm387191ior.4.2021.10.13.15.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:30:14 -0700 (PDT)
Subject: Re: [PATCH 10/17] net: ipa: Add support for IPA v2.x commands and
 table init
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-11-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <b4e13fa5-7ac0-6ce5-28d6-e9946fe039f2@ieee.org>
Date:   Wed, 13 Oct 2021 17:30:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-11-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/19/21 10:08 PM, Sireesh Kodali wrote:
> IPA v2.x commands are different from later IPA revisions mostly because
> of the fact that IPA v2.x is 32 bit. There are also other minor
> differences some of the command structs.
> 
> The tables again are only different because of the fact that IPA v2.x is
> 32 bit.

There's no "RFC" on this patch, but I assume it's just invisible.

There are some things in here where some conventions used elsewhere
in the driver aren't as well followed.  One example is the use of
symbol names with IPA version encoded in them; such cases usually
have a macro that takes a version as argument.

And I don't especially like using a macro on the left hand side
of an assignment expression.

I'm skimming now, but overall this looks OK.

					-Alex

> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>   drivers/net/ipa/ipa.h       |   2 +-
>   drivers/net/ipa/ipa_cmd.c   | 138 ++++++++++++++++++++++++++----------
>   drivers/net/ipa/ipa_table.c |  29 ++++++--
>   drivers/net/ipa/ipa_table.h |   2 +-
>   4 files changed, 125 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
> index 80a83ac45729..63b2b368b588 100644
> --- a/drivers/net/ipa/ipa.h
> +++ b/drivers/net/ipa/ipa.h
> @@ -81,7 +81,7 @@ struct ipa {
>   	struct ipa_power *power;
>   
>   	dma_addr_t table_addr;
> -	__le64 *table_virt;
> +	void *table_virt;
>   
>   	struct ipa_interrupt *interrupt;
>   	bool uc_powered;
> diff --git a/drivers/net/ipa/ipa_cmd.c b/drivers/net/ipa/ipa_cmd.c
> index 7a104540dc26..58dae4b3bf87 100644
> --- a/drivers/net/ipa/ipa_cmd.c
> +++ b/drivers/net/ipa/ipa_cmd.c
> @@ -25,8 +25,8 @@
>    * An immediate command is generally used to request the IPA do something
>    * other than data transfer to another endpoint.
>    *
> - * Immediate commands are represented by GSI transactions just like other
> - * transfer requests, represented by a single GSI TRE.  Each immediate
> + * Immediate commands on IPA v3 are represented by GSI transactions just like
> + * other transfer requests, represented by a single GSI TRE.  Each immediate
>    * command has a well-defined format, having a payload of a known length.
>    * This allows the transfer element's length field to be used to hold an
>    * immediate command's opcode.  The payload for a command resides in DRAM
> @@ -45,10 +45,16 @@ enum pipeline_clear_options {
>   
>   /* IPA_CMD_IP_V{4,6}_{FILTER,ROUTING}_INIT */
>   
> -struct ipa_cmd_hw_ip_fltrt_init {
> -	__le64 hash_rules_addr;
> -	__le64 flags;
> -	__le64 nhash_rules_addr;
> +union ipa_cmd_hw_ip_fltrt_init {
> +	struct {
> +		__le32 nhash_rules_addr;
> +		__le32 flags;
> +	} v2;
> +	struct {
> +		__le64 hash_rules_addr;
> +		__le64 flags;
> +		__le64 nhash_rules_addr;
> +	} v3;
>   };
>   
>   /* Field masks for ipa_cmd_hw_ip_fltrt_init structure fields */
> @@ -56,13 +62,23 @@ struct ipa_cmd_hw_ip_fltrt_init {
>   #define IP_FLTRT_FLAGS_HASH_ADDR_FMASK			GENMASK_ULL(27, 12)
>   #define IP_FLTRT_FLAGS_NHASH_SIZE_FMASK			GENMASK_ULL(39, 28)
>   #define IP_FLTRT_FLAGS_NHASH_ADDR_FMASK			GENMASK_ULL(55, 40)
> +#define IP_V2_IPV4_FLTRT_FLAGS_SIZE_FMASK		GENMASK_ULL(11, 0)
> +#define IP_V2_IPV4_FLTRT_FLAGS_ADDR_FMASK		GENMASK_ULL(27, 12)
> +#define IP_V2_IPV6_FLTRT_FLAGS_SIZE_FMASK		GENMASK_ULL(15, 0)
> +#define IP_V2_IPV6_FLTRT_FLAGS_ADDR_FMASK		GENMASK_ULL(31, 16)
>   
>   /* IPA_CMD_HDR_INIT_LOCAL */
>   
> -struct ipa_cmd_hw_hdr_init_local {
> -	__le64 hdr_table_addr;
> -	__le32 flags;
> -	__le32 reserved;
> +union ipa_cmd_hw_hdr_init_local {
> +	struct {
> +		__le32 hdr_table_addr;
> +		__le32 flags;
> +	} v2;
> +	struct {
> +		__le64 hdr_table_addr;
> +		__le32 flags;
> +		__le32 reserved;
> +	} v3;
>   };
>   
>   /* Field masks for ipa_cmd_hw_hdr_init_local structure fields */
> @@ -109,14 +125,37 @@ struct ipa_cmd_ip_packet_init {
>   #define DMA_SHARED_MEM_OPCODE_SKIP_CLEAR_FMASK		GENMASK(8, 8)
>   #define DMA_SHARED_MEM_OPCODE_CLEAR_OPTION_FMASK	GENMASK(10, 9)
>   
> -struct ipa_cmd_hw_dma_mem_mem {
> -	__le16 clear_after_read; /* 0 or DMA_SHARED_MEM_CLEAR_AFTER_READ */
> -	__le16 size;
> -	__le16 local_addr;
> -	__le16 flags;
> -	__le64 system_addr;
> +union ipa_cmd_hw_dma_mem_mem {
> +	struct {
> +		__le16 reserved;
> +		__le16 size;
> +		__le32 system_addr;
> +		__le16 local_addr;
> +		__le16 flags; /* the least significant 14 bits are reserved */
> +		__le32 padding;
> +	} v2;
> +	struct {
> +		__le16 clear_after_read; /* 0 or DMA_SHARED_MEM_CLEAR_AFTER_READ */
> +		__le16 size;
> +		__le16 local_addr;
> +		__le16 flags;
> +		__le64 system_addr;
> +	} v3;
>   };
>   
> +#define CMD_FIELD(_version, _payload, _field)				\
> +	*(((_version) > IPA_VERSION_2_6L) ?		    		\
> +	  &(_payload->v3._field) :			    		\
> +	  &(_payload->v2._field))
> +
> +#define SET_DMA_FIELD(_ver, _payload, _field, _value)			\
> +	do {								\
> +		if ((_ver) >= IPA_VERSION_3_0)				\
> +			(_payload)->v3._field = cpu_to_le64(_value);	\
> +		else							\
> +			(_payload)->v2._field = cpu_to_le32(_value);	\
> +	} while (0)
> +
>   /* Flag allowing atomic clear of target region after reading data (v4.0+)*/
>   #define DMA_SHARED_MEM_CLEAR_AFTER_READ			GENMASK(15, 15)
>   
> @@ -132,15 +171,16 @@ struct ipa_cmd_ip_packet_tag_status {
>   	__le64 tag;
>   };
>   
> -#define IP_PACKET_TAG_STATUS_TAG_FMASK			GENMASK_ULL(63, 16)
> +#define IPA_V2_IP_PACKET_TAG_STATUS_TAG_FMASK		GENMASK_ULL(63, 32)
> +#define IPA_V3_IP_PACKET_TAG_STATUS_TAG_FMASK		GENMASK_ULL(63, 16)
>   
>   /* Immediate command payload */
>   union ipa_cmd_payload {
> -	struct ipa_cmd_hw_ip_fltrt_init table_init;
> -	struct ipa_cmd_hw_hdr_init_local hdr_init_local;
> +	union ipa_cmd_hw_ip_fltrt_init table_init;
> +	union ipa_cmd_hw_hdr_init_local hdr_init_local;
>   	struct ipa_cmd_register_write register_write;
>   	struct ipa_cmd_ip_packet_init ip_packet_init;
> -	struct ipa_cmd_hw_dma_mem_mem dma_shared_mem;
> +	union ipa_cmd_hw_dma_mem_mem dma_shared_mem;
>   	struct ipa_cmd_ip_packet_tag_status ip_packet_tag_status;
>   };
>   
> @@ -154,6 +194,7 @@ static void ipa_cmd_validate_build(void)
>   	 * of entries.
>   	 */
>   #define TABLE_SIZE	(TABLE_COUNT_MAX * sizeof(__le64))
> +// TODO
>   #define TABLE_COUNT_MAX	max_t(u32, IPA_ROUTE_COUNT_MAX, IPA_FILTER_COUNT_MAX)
>   	BUILD_BUG_ON(TABLE_SIZE > field_max(IP_FLTRT_FLAGS_HASH_SIZE_FMASK));
>   	BUILD_BUG_ON(TABLE_SIZE > field_max(IP_FLTRT_FLAGS_NHASH_SIZE_FMASK));
> @@ -405,15 +446,26 @@ void ipa_cmd_table_init_add(struct ipa_trans *trans,
>   {
>   	struct ipa *ipa = container_of(trans->dma_subsys, struct ipa, dma_subsys);
>   	enum dma_data_direction direction = DMA_TO_DEVICE;
> -	struct ipa_cmd_hw_ip_fltrt_init *payload;
> +	union ipa_cmd_hw_ip_fltrt_init *payload;
> +	enum ipa_version version = ipa->version;
>   	union ipa_cmd_payload *cmd_payload;
>   	dma_addr_t payload_addr;
>   	u64 val;
>   
>   	/* Record the non-hash table offset and size */
>   	offset += ipa->mem_offset;
> -	val = u64_encode_bits(offset, IP_FLTRT_FLAGS_NHASH_ADDR_FMASK);
> -	val |= u64_encode_bits(size, IP_FLTRT_FLAGS_NHASH_SIZE_FMASK);
> +
> +	if (version >= IPA_VERSION_3_0) {
> +		val = u64_encode_bits(offset, IP_FLTRT_FLAGS_NHASH_ADDR_FMASK);
> +		val |= u64_encode_bits(size, IP_FLTRT_FLAGS_NHASH_SIZE_FMASK);
> +	} else if (opcode == IPA_CMD_IP_V4_FILTER_INIT ||
> +		   opcode == IPA_CMD_IP_V4_ROUTING_INIT) {
> +		val = u64_encode_bits(offset, IP_V2_IPV4_FLTRT_FLAGS_ADDR_FMASK);
> +		val |= u64_encode_bits(size, IP_V2_IPV4_FLTRT_FLAGS_SIZE_FMASK);
> +	} else { /* IPA <= v2.6L IPv6 */
> +		val = u64_encode_bits(offset, IP_V2_IPV6_FLTRT_FLAGS_ADDR_FMASK);
> +		val |= u64_encode_bits(size, IP_V2_IPV6_FLTRT_FLAGS_SIZE_FMASK);
> +	}
>   
>   	/* The hash table offset and address are zero if its size is 0 */
>   	if (hash_size) {
> @@ -429,10 +481,10 @@ void ipa_cmd_table_init_add(struct ipa_trans *trans,
>   	payload = &cmd_payload->table_init;
>   
>   	/* Fill in all offsets and sizes and the non-hash table address */
> -	if (hash_size)
> -		payload->hash_rules_addr = cpu_to_le64(hash_addr);
> -	payload->flags = cpu_to_le64(val);
> -	payload->nhash_rules_addr = cpu_to_le64(addr);
> +	if (hash_size && version >= IPA_VERSION_3_0)
> +		payload->v3.hash_rules_addr = cpu_to_le64(hash_addr);
> +	SET_DMA_FIELD(version, payload, flags, val);
> +	SET_DMA_FIELD(version, payload, nhash_rules_addr, addr);
>   
>   	ipa_trans_cmd_add(trans, payload, sizeof(*payload), payload_addr,
>   			  direction, opcode);
> @@ -445,7 +497,7 @@ void ipa_cmd_hdr_init_local_add(struct ipa_trans *trans, u32 offset, u16 size,
>   	struct ipa *ipa = container_of(trans->dma_subsys, struct ipa, dma_subsys);
>   	enum ipa_cmd_opcode opcode = IPA_CMD_HDR_INIT_LOCAL;
>   	enum dma_data_direction direction = DMA_TO_DEVICE;
> -	struct ipa_cmd_hw_hdr_init_local *payload;
> +	union ipa_cmd_hw_hdr_init_local *payload;
>   	union ipa_cmd_payload *cmd_payload;
>   	dma_addr_t payload_addr;
>   	u32 flags;
> @@ -460,10 +512,10 @@ void ipa_cmd_hdr_init_local_add(struct ipa_trans *trans, u32 offset, u16 size,
>   	cmd_payload = ipa_cmd_payload_alloc(ipa, &payload_addr);
>   	payload = &cmd_payload->hdr_init_local;
>   
> -	payload->hdr_table_addr = cpu_to_le64(addr);
> +	SET_DMA_FIELD(ipa->version, payload, hdr_table_addr, addr);
>   	flags = u32_encode_bits(size, HDR_INIT_LOCAL_FLAGS_TABLE_SIZE_FMASK);
>   	flags |= u32_encode_bits(offset, HDR_INIT_LOCAL_FLAGS_HDR_ADDR_FMASK);
> -	payload->flags = cpu_to_le32(flags);
> +	CMD_FIELD(ipa->version, payload, flags) = cpu_to_le32(flags);
>   
>   	ipa_trans_cmd_add(trans, payload, sizeof(*payload), payload_addr,
>   			  direction, opcode);
> @@ -509,8 +561,11 @@ void ipa_cmd_register_write_add(struct ipa_trans *trans, u32 offset, u32 value,
>   
>   	} else {
>   		flags = 0;	/* SKIP_CLEAR flag is always 0 */
> -		options = u16_encode_bits(clear_option,
> -					  REGISTER_WRITE_CLEAR_OPTIONS_FMASK);
> +		if (ipa->version > IPA_VERSION_2_6L)
> +			options = u16_encode_bits(clear_option,
> +					REGISTER_WRITE_CLEAR_OPTIONS_FMASK);
> +		else
> +			options = 0;
>   	}
>   
>   	cmd_payload = ipa_cmd_payload_alloc(ipa, &payload_addr);
> @@ -552,7 +607,8 @@ void ipa_cmd_dma_shared_mem_add(struct ipa_trans *trans, u32 offset, u16 size,
>   {
>   	struct ipa *ipa = container_of(trans->dma_subsys, struct ipa, dma_subsys);
>   	enum ipa_cmd_opcode opcode = IPA_CMD_DMA_SHARED_MEM;
> -	struct ipa_cmd_hw_dma_mem_mem *payload;
> +	enum ipa_version version = ipa->version;
> +	union ipa_cmd_hw_dma_mem_mem *payload;
>   	union ipa_cmd_payload *cmd_payload;
>   	enum dma_data_direction direction;
>   	dma_addr_t payload_addr;
> @@ -571,8 +627,8 @@ void ipa_cmd_dma_shared_mem_add(struct ipa_trans *trans, u32 offset, u16 size,
>   	/* payload->clear_after_read was reserved prior to IPA v4.0.  It's
>   	 * never needed for current code, so it's 0 regardless of version.
>   	 */
> -	payload->size = cpu_to_le16(size);
> -	payload->local_addr = cpu_to_le16(offset);
> +	CMD_FIELD(version, payload, size) = cpu_to_le16(size);
> +	CMD_FIELD(version, payload, local_addr) = cpu_to_le16(offset);
>   	/* payload->flags:
>   	 *   direction:		0 = write to IPA, 1 read from IPA
>   	 * Starting at v4.0 these are reserved; either way, all zero:
> @@ -582,8 +638,8 @@ void ipa_cmd_dma_shared_mem_add(struct ipa_trans *trans, u32 offset, u16 size,
>   	 * since both values are 0 we won't bother OR'ing them in.
>   	 */
>   	flags = toward_ipa ? 0 : DMA_SHARED_MEM_FLAGS_DIRECTION_FMASK;
> -	payload->flags = cpu_to_le16(flags);
> -	payload->system_addr = cpu_to_le64(addr);
> +	CMD_FIELD(version, payload, flags) = cpu_to_le16(flags);
> +	SET_DMA_FIELD(version, payload, system_addr, addr);
>   
>   	direction = toward_ipa ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
>   
> @@ -599,11 +655,17 @@ static void ipa_cmd_ip_tag_status_add(struct ipa_trans *trans)
>   	struct ipa_cmd_ip_packet_tag_status *payload;
>   	union ipa_cmd_payload *cmd_payload;
>   	dma_addr_t payload_addr;
> +	u64 tag_mask;
> +
> +	if (trans->dma_subsys->version <= IPA_VERSION_2_6L)
> +		tag_mask = IPA_V2_IP_PACKET_TAG_STATUS_TAG_FMASK;
> +	else
> +		tag_mask = IPA_V3_IP_PACKET_TAG_STATUS_TAG_FMASK;
>   
>   	cmd_payload = ipa_cmd_payload_alloc(ipa, &payload_addr);
>   	payload = &cmd_payload->ip_packet_tag_status;
>   
> -	payload->tag = le64_encode_bits(0, IP_PACKET_TAG_STATUS_TAG_FMASK);
> +	payload->tag = le64_encode_bits(0, tag_mask);
>   
>   	ipa_trans_cmd_add(trans, payload, sizeof(*payload), payload_addr,
>   			  direction, opcode);
> diff --git a/drivers/net/ipa/ipa_table.c b/drivers/net/ipa/ipa_table.c
> index d197959cc032..459fb4830244 100644
> --- a/drivers/net/ipa/ipa_table.c
> +++ b/drivers/net/ipa/ipa_table.c
> @@ -8,6 +8,7 @@
>   #include <linux/kernel.h>
>   #include <linux/bits.h>
>   #include <linux/bitops.h>
> +#include <linux/module.h>
>   #include <linux/bitfield.h>
>   #include <linux/io.h>
>   #include <linux/build_bug.h>
> @@ -561,6 +562,19 @@ void ipa_table_config(struct ipa *ipa)
>   	ipa_route_config(ipa, true);
>   }
>   
> +static inline void *ipa_table_write(enum ipa_version version,
> +				   void *virt, u64 value)
> +{
> +	if (IPA_IS_64BIT(version)) {
> +		__le64 *ptr = virt;
> +		*ptr = cpu_to_le64(value);
> +	} else {
> +		__le32 *ptr = virt;
> +		*ptr = cpu_to_le32(value);
> +	}
> +	return virt + IPA_TABLE_ENTRY_SIZE(version);
> +}
> +
>   /*
>    * Initialize a coherent DMA allocation containing initialized filter and
>    * route table data.  This is used when initializing or resetting the IPA
> @@ -602,10 +616,11 @@ void ipa_table_config(struct ipa *ipa)
>   int ipa_table_init(struct ipa *ipa)
>   {
>   	u32 count = max_t(u32, IPA_FILTER_COUNT_MAX, IPA_ROUTE_COUNT_MAX);
> +	enum ipa_version version = ipa->version;
>   	struct device *dev = &ipa->pdev->dev;
> +	u64 filter_map = ipa->filter_map << 1;
>   	dma_addr_t addr;
> -	__le64 le_addr;
> -	__le64 *virt;
> +	void *virt;
>   	size_t size;
>   
>   	ipa_table_validate_build();
> @@ -626,19 +641,21 @@ int ipa_table_init(struct ipa *ipa)
>   	ipa->table_addr = addr;
>   
>   	/* First slot is the zero rule */
> -	*virt++ = 0;
> +	virt = ipa_table_write(version, virt, 0);
>   
>   	/* Next is the filter table bitmap.  The "soft" bitmap value
>   	 * must be converted to the hardware representation by shifting
>   	 * it left one position.  (Bit 0 repesents global filtering,
>   	 * which is possible but not used.)
>   	 */
> -	*virt++ = cpu_to_le64((u64)ipa->filter_map << 1);
> +	if (version <= IPA_VERSION_2_6L)
> +		filter_map |= 1;
> +
> +	virt = ipa_table_write(version, virt, filter_map);
>   
>   	/* All the rest contain the DMA address of the zero rule */
> -	le_addr = cpu_to_le64(addr);
>   	while (count--)
> -		*virt++ = le_addr;
> +		virt = ipa_table_write(version, virt, addr);
>   
>   	return 0;
>   }
> diff --git a/drivers/net/ipa/ipa_table.h b/drivers/net/ipa/ipa_table.h
> index 78a168ce6558..6e12fc49e45b 100644
> --- a/drivers/net/ipa/ipa_table.h
> +++ b/drivers/net/ipa/ipa_table.h
> @@ -43,7 +43,7 @@ bool ipa_filter_map_valid(struct ipa *ipa, u32 filter_mask);
>    */
>   static inline bool ipa_table_hash_support(struct ipa *ipa)
>   {
> -	return ipa->version != IPA_VERSION_4_2;
> +	return ipa->version != IPA_VERSION_4_2 && ipa->version > IPA_VERSION_2_6L;
>   }
>   
>   /**
> 

