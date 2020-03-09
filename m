Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E97E717E970
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 20:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgCIT5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 15:57:02 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36971 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgCIT45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 15:56:57 -0400
Received: by mail-pl1-f196.google.com with SMTP id f16so2281874plj.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 12:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+SZtf0M28Nv1QFHflR2s3hX23poufSUdY44oODK2BAY=;
        b=UBurujxd1n8tmu1N5xcKWOKFdorVALZ/c8MK0DTzPfMHbrhfVl4E4YT2CXj9hbBurs
         FVH34y5aIp7VS1UdCMP98Ok/V9bItureBV+jO+cgQ1JWcL/3AaXp/CFrfbIVkNFMRbxJ
         0jGpxW12IoGYsaGH9bhcuad7QMZlJ1HzaThVqXdLeLSgJhyX9Wth5doveQr++PnwQXOG
         5zwqUWf5gpUCgBnP/2QGeAnuKYkCrw4Cpr+0b3GQBK4kDyG4S8tXJt9Bvc8pJRXBDa0j
         IaG9f0vQ2LDYiKUKJ9dxv3uBtDuLsmz8ba5nkESeuu4rknvxX6RfJTnFW3ALIXW2sQB1
         +2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+SZtf0M28Nv1QFHflR2s3hX23poufSUdY44oODK2BAY=;
        b=qqo6KNHxRsxjfs+Ca8614UIZX/K7QaDlw0+p0xOHn2YmwCjNSzJVUJmIdEgmWS1l09
         pVsGGYX8F1d5h5XX8cGqAFnwt+MWQ3dHJWpixaLka2dVdukYTWbdcgsv0bHl/nYJ6pk9
         OXJESkN/+uCLlDQQGqCMOu3bN2wqIQZi+6VhNYHtOJqrp/kfSc1GSsKw5LBXcXEKOKaZ
         jxZZj1Q7Utf/gAwblgXOo41GS7z8p1/b3zPLN4xYElrZsJqnXLwRRs/6wR+0ZAAXBPKo
         ixYUra++CWmodGtt6q4Nz+7RAEoucaHCjDc1ZZ9pUeGS7F83wClhER/c81bDKeyIM+4L
         yw4g==
X-Gm-Message-State: ANhLgQ3IzNkTLAXzGWL9fXo5h7OvAm2df3eXbyUKnIgNW+S26aRF9Gu8
        jQ/564PMGnaqGmCWDJYDlJSVOQ==
X-Google-Smtp-Source: ADFU+vvR9cBt7tA3gwJF7m+Q3TQX3HEJMkR3tbnhc3eRv3NjmUZ9OXX8E469moyjW1ToKHn9huhxHw==
X-Received: by 2002:a17:902:8b88:: with SMTP id ay8mr16941773plb.202.1583783815957;
        Mon, 09 Mar 2020 12:56:55 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm36208373pgd.37.2020.03.09.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 12:56:55 -0700 (PDT)
Date:   Mon, 9 Mar 2020 13:56:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Subject: Re: [PATCH v5 4/8] remoteproc: Add elf helpers to access elf64 and
 elf32 fields
Message-ID: <20200309195653.GD1399@xps15>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-5-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-5-cleger@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 02, 2020 at 10:38:58AM +0100, Clement Leger wrote:
> elf32 and elf64 mainly differ by their types. In order to avoid
> copy/pasting the whole loader code, generate static inline functions
> which will access values according to the elf class. It allows to
> keep a common loader basis.
> In order to accommodate both elf types sizes, the maximum size for a
> elf header member is chosen using the maximum value of the field for
> both elf class.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_elf_helpers.h | 96 +++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
> new file mode 100644
> index 000000000000..4b6be7b6bf4d
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_elf_helpers.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Remote processor elf helpers defines
> + *
> + * Copyright (C) 2020 Kalray, Inc.
> + */
> +
> +#ifndef REMOTEPROC_ELF_LOADER_H
> +#define REMOTEPROC_ELF_LOADER_H
> +
> +#include <linux/elf.h>
> +#include <linux/types.h>
> +
> +/**
> + * fw_elf_get_class - Get elf class
> + * @fw: the ELF firmware image
> + *
> + * Note that we use and elf32_hdr to access the class since the start of the
> + * struct is the same for both elf class
> + *
> + * Return: elf class of the firmware
> + */
> +static inline u8 fw_elf_get_class(const struct firmware *fw)
> +{
> +	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
> +
> +	return ehdr->e_ident[EI_CLASS];
> +}
> +
> +static inline void elf_hdr_init_ident(struct elf32_hdr *hdr, u8 class)
> +{
> +	memcpy(hdr->e_ident, ELFMAG, SELFMAG);
> +	hdr->e_ident[EI_CLASS] = class;
> +	hdr->e_ident[EI_DATA] = ELFDATA2LSB;
> +	hdr->e_ident[EI_VERSION] = EV_CURRENT;
> +	hdr->e_ident[EI_OSABI] = ELFOSABI_NONE;
> +}
> +
> +/* Generate getter and setter for a specific elf struct/field */
> +#define ELF_GEN_FIELD_GET_SET(__s, __field, __type) \
> +static inline __type elf_##__s##_get_##__field(u8 class, const void *arg) \
> +{ \
> +	if (class == ELFCLASS32) \
> +		return (__type) ((const struct elf32_##__s *) arg)->__field; \
> +	else \
> +		return (__type) ((const struct elf64_##__s *) arg)->__field; \
> +} \
> +static inline void elf_##__s##_set_##__field(u8 class, void *arg, \
> +					     __type value) \
> +{ \
> +	if (class == ELFCLASS32) \
> +		((struct elf32_##__s *) arg)->__field = (__type) value; \
> +	else \
> +		((struct elf64_##__s *) arg)->__field = (__type) value; \
> +}
> +
> +ELF_GEN_FIELD_GET_SET(hdr, e_entry, u64)
> +ELF_GEN_FIELD_GET_SET(hdr, e_phnum, u16)
> +ELF_GEN_FIELD_GET_SET(hdr, e_shnum, u16)
> +ELF_GEN_FIELD_GET_SET(hdr, e_phoff, u64)
> +ELF_GEN_FIELD_GET_SET(hdr, e_shoff, u64)
> +ELF_GEN_FIELD_GET_SET(hdr, e_shstrndx, u16)
> +ELF_GEN_FIELD_GET_SET(hdr, e_machine, u16)
> +ELF_GEN_FIELD_GET_SET(hdr, e_type, u16)
> +ELF_GEN_FIELD_GET_SET(hdr, e_version, u32)
> +ELF_GEN_FIELD_GET_SET(hdr, e_ehsize, u32)
> +ELF_GEN_FIELD_GET_SET(hdr, e_phentsize, u16)
> +
> +ELF_GEN_FIELD_GET_SET(phdr, p_paddr, u64)
> +ELF_GEN_FIELD_GET_SET(phdr, p_vaddr, u64)
> +ELF_GEN_FIELD_GET_SET(phdr, p_filesz, u64)
> +ELF_GEN_FIELD_GET_SET(phdr, p_memsz, u64)
> +ELF_GEN_FIELD_GET_SET(phdr, p_type, u32)
> +ELF_GEN_FIELD_GET_SET(phdr, p_offset, u64)
> +ELF_GEN_FIELD_GET_SET(phdr, p_flags, u32)
> +ELF_GEN_FIELD_GET_SET(phdr, p_align, u64)
> +
> +ELF_GEN_FIELD_GET_SET(shdr, sh_size, u64)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_offset, u64)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_name, u32)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_addr, u64)
> +
> +#define ELF_STRUCT_SIZE(__s) \
> +static inline unsigned long elf_size_of_##__s(u8 class) \
> +{ \
> +	if (class == ELFCLASS32)\
> +		return sizeof(struct elf32_##__s); \
> +	else \
> +		return sizeof(struct elf64_##__s); \
> +}
> +
> +ELF_STRUCT_SIZE(shdr)
> +ELF_STRUCT_SIZE(phdr)
> +ELF_STRUCT_SIZE(hdr)
> +
> +#endif /* REMOTEPROC_ELF_LOADER_H */
> -- 
> 2.15.0.276.g89ea799
> 
