Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7B01767E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 00:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgCBXMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 18:12:41 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34676 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgCBXMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 18:12:41 -0500
Received: by mail-pf1-f195.google.com with SMTP id y21so466035pfp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2020 15:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cZHkLPyQi4lEOu+PeEyqnnKuw6NNgD2Yqbp/RubP2bc=;
        b=ofnLSi+jS3OXUcK8vE0gMbM1QBDxh7b5jS1IxWi3HkGpKKOEcm3WJd9aEk0Us7IUKO
         8nmFWDJfiuwlFyqsXCcVKRAwIBQaYQl/evwVVX80Y3CPQhjcxITZ1o5Jk7P5xhZf2YmV
         JUbFU5wRnrXfDlxWlBhwcEx9xdQfFjkkoY8zYrA9cLB/YTtxDa+Ix3UgLS37laXFK+lF
         YO5R32/SpDIyenCGvur0FFCxabBbXTYfaf1ITOLkeTmU1Kzvh/HtnQ2WmKgFvoaxK9pj
         quRJ7rwJz3FmBNE/PilR6rrZsmbZ6ywl2wXJqkGSS2Gt0C8UBc0UKbqYmILkeUOjgzI9
         blIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cZHkLPyQi4lEOu+PeEyqnnKuw6NNgD2Yqbp/RubP2bc=;
        b=UCMB8JHJrMx+YSdRTOt38+qTfVBTK/uhPzcMW2xsHfIpXkur3Tat7HCXrlJEp1Z6sb
         B7ZmsldBSDAkjbQi4jgPJaXlaso3hFt+oLyajl503zqarubyQgosjSinD0Bh+Uh/UVSB
         ZBoFrpOAgUtVYtiP6Ye28cVMbiwWaTxA4Bwz2O4GnbCB1mUzflIFyrc78bqzc5m6OVaJ
         ip9F0ao5buiw8YLwhfb+G08pK3VGQMtRCb5BEeEsynK/JBR9jNn5EDS9X9mG9weLFNy6
         BtqKOaoQeowSPXgWT43s8C38h1uKy0BMZokC2zUUAqnVIx9sxdUxn9IJHK7MfHH3xA7a
         /r7Q==
X-Gm-Message-State: ANhLgQ1G3VUQHm2/UFKyJV3/WusLP3Qxg+0FADLrhb1Hj8jJJZHwMIV4
        9fPUvmd2UQuMA7DMeYxDB7TrBQ==
X-Google-Smtp-Source: ADFU+vsbt7xW95b/HirVpnFvyPznPrDnd/h85vDaRcM55B9JmCtuRXICrRpYIjC1wXlERTK8an7NHg==
X-Received: by 2002:a63:f403:: with SMTP id g3mr1256700pgi.62.1583190759696;
        Mon, 02 Mar 2020 15:12:39 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id x65sm9095993pfd.34.2020.03.02.15.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 15:12:39 -0800 (PST)
Date:   Mon, 2 Mar 2020 15:12:36 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
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
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 4/8] remoteproc: Add elf helpers to access elf64 and
 elf32 fields
Message-ID: <20200302231236.GD262924@yoga>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-5-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-5-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:

> elf32 and elf64 mainly differ by their types. In order to avoid
> copy/pasting the whole loader code, generate static inline functions
> which will access values according to the elf class. It allows to
> keep a common loader basis.
> In order to accommodate both elf types sizes, the maximum size for a
> elf header member is chosen using the maximum value of the field for
> both elf class.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
