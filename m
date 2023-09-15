Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89EB47A2558
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 20:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjIOSJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 14:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236357AbjIOSJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 14:09:32 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B883E1BF2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 11:09:26 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a65f9147ccso309765266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694801365; x=1695406165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3lJbmINvkT47tROxDsH2dYDRY8yv0omZvaPcrFOjLDo=;
        b=NhCpR+4HB/Wcg1ORzQH2vbrpy9pHparg8m7nqlzjOv8xF7D+v8ZEhKT1CwDyzzvoOc
         LM/scvs0ETINB2Os4xe5hBpSY5nXGxWeFpnHtKOnSDe7B4kyL6UvcoTKwtzqgiTPMaXr
         Qp014qvfefPylXMmTeNCthhODLhks5ptcpRBFZdIbea9ox8CDf8txz+ZXd9mDgkt3JV9
         hv4331ZlB9juhS2u4Rn0QCluTAfDLAAvvXYwCKtXiCE4UnlrdQ4pw2eUrjyj8aJ8Udrd
         r+aZzc6t0BfA4ANCiTqaUhmyffLnhUGLzWkdi8BMW5A1EOUFkSCnCZru4rWReNYegQhM
         l0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694801365; x=1695406165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lJbmINvkT47tROxDsH2dYDRY8yv0omZvaPcrFOjLDo=;
        b=ENGOaRTGSwXUZd/4Qu8oEX5Bwy8Ie52ggVik5vH7P6bDnKq2pk4GP191NLjxOTOVWw
         VSpYTJGlVOKoVIUKQSbz8ie2ZOo0LPGP39eZIcv9Spo/rBe1Dsm/feYJBO7edFQveVdn
         WEGFghs8vmWZj0am5VDPp7vMDTCWylUc75e3ifFoXdH2ttvP4teTmy7Frenc6TThuTXl
         5AQkYVKZjy/7BHsQRDFp7L76fCjMsFBOvYG/ly2rQuCFc1KzapgjOzbdkgrBR/hf3SNN
         fqIzVf7+LGN7TtyCgOnb7E0E5fDpeWUeKB1eSeKkGUHsuSLnvzRNDxRxDBvf9nIoKzsO
         5gpw==
X-Gm-Message-State: AOJu0YxI8k63RTbTtGNpntHcZBLuU+dsgFERPPqxPnoPDlDVIU806Lzo
        tbOAdZEbaynH3yleehyorMUCaQ==
X-Google-Smtp-Source: AGHT+IGR+An1hVCaHWT2JjEYgCQVmusddVJ96fu2aguOwg0x+Ax99Rr3p95DUVUz5bxhVoR4ixPu8A==
X-Received: by 2002:a17:907:b0c:b0:9ad:7f13:4db8 with SMTP id h12-20020a1709070b0c00b009ad7f134db8mr2031898ejl.36.1694801365082;
        Fri, 15 Sep 2023 11:09:25 -0700 (PDT)
Received: from [192.168.37.154] (178235177024.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.24])
        by smtp.gmail.com with ESMTPSA id sy5-20020a1709076f0500b009adc7433419sm1684546ejc.18.2023.09.15.11.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 11:09:24 -0700 (PDT)
Message-ID: <66676866-d0d7-44c1-9170-aff687ac452c@linaro.org>
Date:   Fri, 15 Sep 2023 20:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: Document shared memory item IDs and
 corresponding structs
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, andersson@kernel.org
Cc:     linux-arm-msm@vger.kernel.org
References: <20230915175907.17134-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230915175907.17134-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.09.2023 19:59, Jeffrey Hugo wrote:
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
This is super nice, I'll just leave you with a few nitty
code-style pointers.

> +/* fixed items - these have a static position in shared memory */
Meaningless but eye-pleasing - comments should start with an
uppercase letter

> +#define SMEM_PROC_COMM				0
In many places like this where we essentially have a firmware
interface, it is customary to go like this:

#define FWNAME_CALL_SOMETHING_FOO	(magicval1)
struct fwname_something_foo {
	[...]
};

#define FWNAME_CALL_SOMETHING_BAR	(magicval2)
struct fwname_something_bar {
	[...]
};

This makes matching the call/function/whatev name with what
it expects/returns easier for a typical human

[...]

> +/* Legacy communication protocol between "Apps" and "Modem" processors */
The comments explaining what this does are a great addition, I
think in the spirit of that previous suggestion, they could go
like this:

/* blah blah blah yes yes yes */
#define FWNAME_CALL_SOMETHING_FOO	(magicval1)
struct fwname_something_foo {
	[...]
};

/* blah blah something something */
#define FWNAME_CALL_SOMETHING_BAR	(magicval2)
struct fwname_something_bar {
	[...]
};


[...]

> +/* SMEM_ALLOCATION_TABLE is an array of these structures.  512 elements in the array. */
> +struct smem_heap_entry {
> +        __le32 allocated;
> +        __le32 offset;
> +        __le32 size;
> +        __le32 reserved; /* bits 1:0 reserved, bits 31:2 aux smem base addr */
If we have an integer split into bitfields or similar, something
like this would make it both readable and usable in code:

struct smem_heap_entry {
        __le32 allocated;
        __le32 offset;
        __le32 size;
        __le32 reserved;
#define SMEM_HEAP_ENTRY_BASE_ADDR GENMASK(31, 2)
#define SMEM_HEAP_ENTRY_RESERVED GENMASK(1, 0)
};

[...]

> +#define FLASH_PART_MAGIC1       0x55EE73AA
> +#define FLASH_PART_MAGIC2       0xE35EBDDB
> +#define FLASH_PTABLE_V3         3
> +#define FLASH_PTABLE_V4         4
> +#define FLASH_PTABLE_MAX_PARTS_V3 16
> +#define FLASH_PTABLE_MAX_PARTS_V4 32
> +#define FLASH_PTABLE_ENTRY_NAME_SIZE 16
Similarly having such magic values under the corresponding struct
member would make things more obvious

> +
> +struct flash_partition_entry {
> +        char name[FLASH_PTABLE_ENTRY_NAME_SIZE];
> +        __le32 offset;     /* Offset in blocks from beginning of device */
> +        __le32 length;     /* Length of the partition in blocks */
> +        u8 attr;           /* Flags for this partition */
Comments like this are welcome too, particularly where things
are "very not obvious", like here where length is in blocks
and not bytes.

But if we had something like "u32 flags" followed by a bunch
of defines, that's self-explanatory.

Konrad
