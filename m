Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C73E7A2D10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Sep 2023 03:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbjIPBdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 21:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbjIPBc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 21:32:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76007F9
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 18:32:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2883C433C7;
        Sat, 16 Sep 2023 01:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694827973;
        bh=skBkA9Lvg0glYPEe303wtjJnabG49jEl7UT0uUAwJmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aYe7lspdcXGvjcECSclCL3guKatsDA3e+HbcFXTWlKRwC4t7+WkNr9v+QfYGEXcwz
         pl8/fehJAghLS2FAErkJJ7aNDlrETq3M1YpvMeg4acj6dbQn7fYU9XwVs/n3uLy5lR
         7Ic1sSpg5o9TAYbj+GEkp3pZrcfNUhxJnVp7StfDQxmyHSYP4Hqv4cubj6vkMKTIRx
         t9s6TdvYuJcFtFg3yNaF+OaZ4jtQG3IzGHVkORPlH30Eu1xwZbL0ZvqF7llbueJFhq
         ZsK97G7QGgKO8381cdyDi/FvfFj7ClP4av6u68I8ywuV7vghkkQYlQNyWEGM4GQyOY
         nonMgpj7+RhTw==
Date:   Fri, 15 Sep 2023 18:37:08 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: Document shared memory item IDs and
 corresponding structs
Message-ID: <uk2rm42o7ndvg6rlhcw5zsmqp2c4a3ssqvbyhdigx6a7e3j2se@amf4mkeor34e>
References: <20230915175907.17134-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915175907.17134-1-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 15, 2023 at 11:59:07AM -0600, Jeffrey Hugo wrote:
> Shared memory items are assigned a globally unique ID and almost always
> have a defined structure which is stored in the shared memory.  Document
> assigned IDs and corresponding structures.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
> 
> Konrad, before I get too far into this, I was hoping for some early
> feedback since this documentation is a request that you made.
> 
> Please let me know if this is aligned with what you were wanting.
> 
>  include/linux/soc/qcom/smem.h | 176 ++++++++++++++++++++++++++++++++++
>  1 file changed, 176 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index 223db6a9c733..2f8d1f3126a4 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -4,6 +4,182 @@
>  
>  #define QCOM_SMEM_HOST_ANY -1
>  
> +/* fixed items - these have a static position in shared memory */
> +#define SMEM_PROC_COMM				0

Other parts of this interface are prefixed with qcom_.

> +#define SMEM_HEAP_INFO				1
> +#define SMEM_ALLOCATION_TABLE			2
> +#define SMEM_VERSION_INFO			3
> +#define SMEM_HW_RESET_DETECT			4
[..]
> +
> +/* Legacy communication protocol between "Apps" and "Modem" processors */
> +struct smem_proc_comm {

This is already defined in smem.c, with the same name, but slightly
different definition.

I always envisioned that we would treat this as an smem-internal
implementation detail and expose a function to invoke a proc command, if
someone cared...

Does including it here in the client api definition make sense? Is the
first entry in the smem_heap_entry list pointing to this data, even
though it's part of the header?

> +        __le32 command;
> +        __le32 status;
> +        __le32 data1;
> +        __le32 data2;
> +};
> +
> +/* Metadata structure for shared memory heap allocations */
> +struct smem_heap_info {

This, and the next entry shouldn't be accessed outside the heap
implementation itself...

> +        __le32 initialized;
> +        __le32 free_offset;
> +        __le32 heap_remaining;
> +        __le32 reserved;
> +};
> +
> +/* SMEM_ALLOCATION_TABLE is an array of these structures.  512 elements in the array. */
> +struct smem_heap_entry {
> +        __le32 allocated;
> +        __le32 offset;
> +        __le32 size;
> +        __le32 reserved; /* bits 1:0 reserved, bits 31:2 aux smem base addr */
> +};
> +
> +struct smem_version_info {
> +	__le32 version[32];
> +};
> +
> +struct smem_spinlock_array {
> +	volatile __le32 lock[8];
> +};
> +
> +#define FLASH_PART_MAGIC1       0x55EE73AA
> +#define FLASH_PART_MAGIC2       0xE35EBDDB
> +#define FLASH_PTABLE_V3         3
> +#define FLASH_PTABLE_V4         4
> +#define FLASH_PTABLE_MAX_PARTS_V3 16
> +#define FLASH_PTABLE_MAX_PARTS_V4 32
> +#define FLASH_PTABLE_ENTRY_NAME_SIZE 16
> +
> +struct flash_partition_entry {
> +        char name[FLASH_PTABLE_ENTRY_NAME_SIZE];
> +        __le32 offset;     /* Offset in blocks from beginning of device */
> +        __le32 length;     /* Length of the partition in blocks */
> +        u8 attr;           /* Flags for this partition */
> +};
> +
> +struct flash_partition_table {
> +        __le32 magic1;
> +        __le32 magic2;
> +        __le32 version;
> +        __le32 numparts;
> +        struct flash_partition_entry part_entry[FLASH_PTABLE_MAX_PARTS_V4];
> +};

This information already exist in qcomsmempart.c, but with slightly
different names.

> +
> +/* SMEM_CHANNEL_ALLOC_TBL is an array of these.  Used for SMD. */
> +struct smd_alloc_elm {

This is called qcom_smd_alloc_entry, in qcom_smd.c...

Regards,
Bjorn

> +        char name[20];
> +        __le32 cid;
> +        __le32 type;
> +        __le32 ref_count;
> +};
> +
>  int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
>  void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
>  
> -- 
> 2.40.1
> 
