Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D77A15406B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 09:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgBFIh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 03:37:58 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:37330 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgBFIh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 03:37:58 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 9858127E03A0;
        Thu,  6 Feb 2020 09:37:55 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id cyO7F9rmyerp; Thu,  6 Feb 2020 09:37:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E0AE227E0C42;
        Thu,  6 Feb 2020 09:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E0AE227E0C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1580978273;
        bh=l2mAeXngR/5BNCZbuh9+mPg0UQnp76NPA6/k85Bg4q4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=hudIdxVU5ITKekTYQmrcTD7EeH2P0b/tzXYJeoLiPypP26D4jg1oXgMo5cwav/7JN
         dzUnIgFBuhCRUpjbMFBaFiznGuj+M+ULIb4sEb5+ihOmHDHUCS0knmgdtKN0e4pRL3
         OdyqpFTzdLKFXuedrIItVJziXz6l6f3eXc/cUJCM=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id J5-WDM_nHfGe; Thu,  6 Feb 2020 09:37:53 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id BE6CB27E03A0;
        Thu,  6 Feb 2020 09:37:53 +0100 (CET)
Date:   Thu, 6 Feb 2020 09:37:53 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Message-ID: <1065812225.2604892.1580978273748.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200205224936.GB25901@xps15>
References: <20200129163013.GA16538@xps15> <20200204174412.16814-1-cleger@kalray.eu> <20200204174412.16814-3-cleger@kalray.eu> <20200205224936.GB25901@xps15>
Subject: Re: [PATCH v3 2/2] remoteproc: Add elf64 support in elf loader
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC75 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Add elf64 support in elf loader
Thread-Index: V6XODUe4azDGASdnez4hZiYZ5aNL9A==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

----- On 5 Feb, 2020, at 23:49, Mathieu Poirier mathieu.poirier@linaro.org =
wrote:

> On Tue, Feb 04, 2020 at 06:44:12PM +0100, Clement Leger wrote:
>> elf32 and elf64 mainly differ by their types. In order to avoid
>> copy/pasting the whole loader code, generate static inline functions
>> which will access values according to the elf class. It allows to keep a
>> common loader basis.
>> In order to accommodate both elf types sizes, the maximum size for a
>> elf header member is chosen using the maximum value of both elf class.
>>=20
>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> Tested-by: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
>> ---
>>  Documentation/remoteproc.txt               |   2 +-
>>  drivers/remoteproc/remoteproc_elf_loader.c | 147 ++++++++++++++++++----=
-------
>>  drivers/remoteproc/remoteproc_elf_loader.h |  69 ++++++++++++++
>>  drivers/remoteproc/remoteproc_internal.h   |   2 +-
>>  drivers/remoteproc/st_remoteproc.c         |   2 +-
>>  include/linux/remoteproc.h                 |   4 +-
>>  6 files changed, 167 insertions(+), 59 deletions(-)
>>  create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h
>>=20
>> diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.txt
>> index 03c3d2e568b0..2be1147256e0 100644
>> --- a/Documentation/remoteproc.txt
>> +++ b/Documentation/remoteproc.txt
>> @@ -230,7 +230,7 @@ in the used rings.
>>  Binary Firmware Structure
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> =20
>> -At this point remoteproc only supports ELF32 firmware binaries. However=
,
>> +At this point remoteproc supports ELF32 and ELF64 firmware binaries. Ho=
wever,
>>  it is quite expected that other platforms/devices which we'd want to
>>  support with this framework will be based on different binary formats.
>> =20
>> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
>> b/drivers/remoteproc/remoteproc_elf_loader.c
>> index 606aae166eba..21fd2b2fe5ae 100644
>> --- a/drivers/remoteproc/remoteproc_elf_loader.c
>> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/elf.h>
>> =20
>>  #include "remoteproc_internal.h"
>> +#include "remoteproc_elf_loader.h"
>> =20
>>  /**
>>   * rproc_elf_sanity_check() - Sanity Check ELF firmware image
>> @@ -35,8 +36,16 @@ int rproc_elf_sanity_check(struct rproc *rproc, const=
 struct
>> firmware *fw)
>>  {
>>  =09const char *name =3D rproc->firmware;
>>  =09struct device *dev =3D &rproc->dev;
>> +=09/*
>> +=09 * Elf files are beginning with the same structure. Thus, to simplif=
y
>> +=09 * header parsing, we can use the elf32_hdr one for both elf64 and
>> +=09 * elf32.
>> +=09 */
>>  =09struct elf32_hdr *ehdr;
>> +=09u32 elf_shdr_size;
>> +=09u64 phoff, shoff;
>>  =09char class;
>> +=09u16 phnum;
>> =20
>>  =09if (!fw) {
>>  =09=09dev_err(dev, "failed to load %s\n", name);
>> @@ -50,13 +59,22 @@ int rproc_elf_sanity_check(struct rproc *rproc, cons=
t struct
>> firmware *fw)
>> =20
>>  =09ehdr =3D (struct elf32_hdr *)fw->data;
>> =20
>> -=09/* We only support ELF32 at this point */
>> +=09if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
>> +=09=09dev_err(dev, "Image is corrupted (bad magic)\n");
>> +=09=09return -EINVAL;
>> +=09}
>> +
>>  =09class =3D ehdr->e_ident[EI_CLASS];
>> -=09if (class !=3D ELFCLASS32) {
>> +=09if (class !=3D ELFCLASS32 && class !=3D ELFCLASS64) {
>>  =09=09dev_err(dev, "Unsupported class: %d\n", class);
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> +=09if (class =3D=3D ELFCLASS64 && fw->size < sizeof(struct elf64_hdr)) =
{
>> +=09=09dev_err(dev, "elf64 header is too small\n");
>> +=09=09return -EINVAL;
>> +=09}
>> +
>>  =09/* We assume the firmware has the same endianness as the host */
>>  # ifdef __LITTLE_ENDIAN
>>  =09if (ehdr->e_ident[EI_DATA] !=3D ELFDATA2LSB) {
>> @@ -67,26 +85,29 @@ int rproc_elf_sanity_check(struct rproc *rproc, cons=
t struct
>> firmware *fw)
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> -=09if (fw->size < ehdr->e_shoff + sizeof(struct elf32_shdr)) {
>> -=09=09dev_err(dev, "Image is too small\n");
>> -=09=09return -EINVAL;
>> -=09}
>> +=09phoff =3D elf_hdr_e_phoff(class, fw->data);
>> +=09shoff =3D elf_hdr_e_shoff(class, fw->data);
>> +=09phnum =3D  elf_hdr_e_phnum(class, fw->data);
>> +=09elf_shdr_size =3D elf_size_of_shdr(class);
>> =20
>> -=09if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
>> -=09=09dev_err(dev, "Image is corrupted (bad magic)\n");
>> +=09if (fw->size < shoff + elf_shdr_size) {
>> +=09=09dev_err(dev, "Image is too small\n");
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> -=09if (ehdr->e_phnum =3D=3D 0) {
>> +=09if (phnum =3D=3D 0) {
>>  =09=09dev_err(dev, "No loadable segments\n");
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> -=09if (ehdr->e_phoff > fw->size) {
>> +=09if (phoff > fw->size) {
>>  =09=09dev_err(dev, "Firmware size is too small\n");
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> +=09dev_dbg(dev, "Firmware is an elf%d file\n",
>> +=09=09class =3D=3D ELFCLASS32 ? 32 : 64);
>> +
>>  =09return 0;
>>  }
>>  EXPORT_SYMBOL(rproc_elf_sanity_check);
>> @@ -102,11 +123,9 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
>>   * Note that the boot address is not a configurable property of all rem=
ote
>>   * processors. Some will always boot at a specific hard-coded address.
>>   */
>> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw)
>> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw)
>>  {
>> -=09struct elf32_hdr *ehdr  =3D (struct elf32_hdr *)fw->data;
>> -
>> -=09return ehdr->e_entry;
>> +=09return elf_hdr_e_entry(fw_elf_get_class(fw), fw->data);
>>  }
>>  EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>> =20
>> @@ -137,37 +156,41 @@ EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware =
*fw)
>>  {
>>  =09struct device *dev =3D &rproc->dev;
>> -=09struct elf32_hdr *ehdr;
>> -=09struct elf32_phdr *phdr;
>> +=09const void *ehdr, *phdr;
>>  =09int i, ret =3D 0;
>> +=09u16 phnum;
>>  =09const u8 *elf_data =3D fw->data;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> +=09u32 elf_phdr_size =3D elf_size_of_phdr(class);
>> =20
>> -=09ehdr =3D (struct elf32_hdr *)elf_data;
>> -=09phdr =3D (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
>> +=09ehdr =3D elf_data;
>> +=09phnum =3D elf_hdr_e_phnum(class, ehdr);
>> +=09phdr =3D elf_data + elf_hdr_e_phoff(class, ehdr);
>> =20
>>  =09/* go through the available ELF segments */
>> -=09for (i =3D 0; i < ehdr->e_phnum; i++, phdr++) {
>> -=09=09u32 da =3D phdr->p_paddr;
>> -=09=09u32 memsz =3D phdr->p_memsz;
>> -=09=09u32 filesz =3D phdr->p_filesz;
>> -=09=09u32 offset =3D phdr->p_offset;
>> +=09for (i =3D 0; i < phnum; i++, phdr +=3D elf_phdr_size) {
>> +=09=09u64 da =3D elf_phdr_p_paddr(class, phdr);
>> +=09=09u64 memsz =3D elf_phdr_p_memsz(class, phdr);
>> +=09=09u64 filesz =3D elf_phdr_p_filesz(class, phdr);
>> +=09=09u64 offset =3D elf_phdr_p_offset(class, phdr);
>> +=09=09u32 type =3D elf_phdr_p_type(class, phdr);
>>  =09=09void *ptr;
>> =20
>> -=09=09if (phdr->p_type !=3D PT_LOAD)
>> +=09=09if (type !=3D PT_LOAD)
>>  =09=09=09continue;
>> =20
>> -=09=09dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
>> -=09=09=09phdr->p_type, da, memsz, filesz);
>> +=09=09dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\=
n",
>> +=09=09=09type, da, memsz, filesz);
>> =20
>>  =09=09if (filesz > memsz) {
>> -=09=09=09dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
>> +=09=09=09dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
>>  =09=09=09=09filesz, memsz);
>>  =09=09=09ret =3D -EINVAL;
>>  =09=09=09break;
>>  =09=09}
>> =20
>>  =09=09if (offset + filesz > fw->size) {
>> -=09=09=09dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
>> +=09=09=09dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
>>  =09=09=09=09offset + filesz, fw->size);
>>  =09=09=09ret =3D -EINVAL;
>>  =09=09=09break;
>> @@ -176,14 +199,15 @@ int rproc_elf_load_segments(struct rproc *rproc, c=
onst
>> struct firmware *fw)
>>  =09=09/* grab the kernel address for this device address */
>>  =09=09ptr =3D rproc_da_to_va(rproc, da, memsz);
>>  =09=09if (!ptr) {
>> -=09=09=09dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
>> +=09=09=09dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
>> +=09=09=09=09memsz);
>>  =09=09=09ret =3D -EINVAL;
>>  =09=09=09break;
>>  =09=09}
>> =20
>>  =09=09/* put the segment where the remote processor expects it */
>> -=09=09if (phdr->p_filesz)
>> -=09=09=09memcpy(ptr, elf_data + phdr->p_offset, filesz);
>> +=09=09if (filesz)
>> +=09=09=09memcpy(ptr, elf_data + offset, filesz);
>> =20
>>  =09=09/*
>>  =09=09 * Zero out remaining memory for this segment.
>> @@ -200,24 +224,35 @@ int rproc_elf_load_segments(struct rproc *rproc, c=
onst
>> struct firmware *fw)
>>  }
>>  EXPORT_SYMBOL(rproc_elf_load_segments);
>> =20
>> -static struct elf32_shdr *
>> -find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
>> +static const void *
>> +find_table(struct device *dev, const struct firmware *fw)
>>  {
>> -=09struct elf32_shdr *shdr;
>> +=09const void *shdr, *name_table_shdr;
>>  =09int i;
>>  =09const char *name_table;
>>  =09struct resource_table *table =3D NULL;
>> -=09const u8 *elf_data =3D (void *)ehdr;
>> +=09const u8 *elf_data =3D (void *)fw->data;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> +=09size_t fw_size =3D fw->size;
>> +=09const void *ehdr =3D elf_data;
>> +=09u16 shnum =3D elf_hdr_e_shnum(class, ehdr);
>> +=09u32 elf_shdr_size =3D elf_size_of_shdr(class);
>> +=09u16 shstrndx =3D elf_hdr_e_shstrndx(class, ehdr);
>> =20
>>  =09/* look for the resource table and handle it */
>> -=09shdr =3D (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
>> -=09name_table =3D elf_data + shdr[ehdr->e_shstrndx].sh_offset;
>> -
>> -=09for (i =3D 0; i < ehdr->e_shnum; i++, shdr++) {
>> -=09=09u32 size =3D shdr->sh_size;
>> -=09=09u32 offset =3D shdr->sh_offset;
>> -
>> -=09=09if (strcmp(name_table + shdr->sh_name, ".resource_table"))
>> +=09/* First, get the section header according to the elf class */
>> +=09shdr =3D elf_data + elf_hdr_e_shoff(class, ehdr);
>> +=09/* Compute name table section header entry in shdr array */
>> +=09name_table_shdr =3D shdr + (shstrndx * elf_shdr_size);
>> +=09/* Finally, compute the name table section address in elf */
>> +=09name_table =3D elf_data + elf_shdr_sh_offset(class, name_table_shdr)=
;
>> +
>> +=09for (i =3D 0; i < shnum; i++, shdr +=3D elf_shdr_size) {
>> +=09=09u64 size =3D elf_shdr_sh_size(class, shdr);
>> +=09=09u64 offset =3D elf_shdr_sh_offset(class, shdr);
>> +=09=09u32 name =3D elf_shdr_sh_name(class, shdr);
>> +
>> +=09=09if (strcmp(name_table + name, ".resource_table"))
>>  =09=09=09continue;
>> =20
>>  =09=09table =3D (struct resource_table *)(elf_data + offset);
>> @@ -270,21 +305,21 @@ find_table(struct device *dev, struct elf32_hdr *e=
hdr,
>> size_t fw_size)
>>   */
>>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware=
 *fw)
>>  {
>> -=09struct elf32_hdr *ehdr;
>> -=09struct elf32_shdr *shdr;
>> +=09const void *shdr;
>>  =09struct device *dev =3D &rproc->dev;
>>  =09struct resource_table *table =3D NULL;
>>  =09const u8 *elf_data =3D fw->data;
>>  =09size_t tablesz;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> +=09u64 sh_offset;
>> =20
>> -=09ehdr =3D (struct elf32_hdr *)elf_data;
>> -
>> -=09shdr =3D find_table(dev, ehdr, fw->size);
>> +=09shdr =3D find_table(dev, fw);
>>  =09if (!shdr)
>>  =09=09return -EINVAL;
>> =20
>> -=09table =3D (struct resource_table *)(elf_data + shdr->sh_offset);
>> -=09tablesz =3D shdr->sh_size;
>> +=09sh_offset =3D elf_shdr_sh_offset(class, shdr);
>> +=09table =3D (struct resource_table *)(elf_data + sh_offset);
>> +=09tablesz =3D elf_shdr_sh_size(class, shdr);
>> =20
>>  =09/*
>>  =09 * Create a copy of the resource table. When a virtio device starts
>> @@ -317,13 +352,17 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
>>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rp=
roc,
>>  =09=09=09=09=09=09       const struct firmware *fw)
>>  {
>> -=09struct elf32_hdr *ehdr =3D (struct elf32_hdr *)fw->data;
>> -=09struct elf32_shdr *shdr;
>> +=09const void *shdr;
>> +=09u64 sh_addr, sh_size;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> =20
>> -=09shdr =3D find_table(&rproc->dev, ehdr, fw->size);
>> +=09shdr =3D find_table(&rproc->dev, fw);
>>  =09if (!shdr)
>>  =09=09return NULL;
>> =20
>> -=09return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
>> +=09sh_addr =3D elf_shdr_sh_addr(class, shdr);
>> +=09sh_size =3D elf_shdr_sh_size(class, shdr);
>> +
>> +=09return rproc_da_to_va(rproc, sh_addr, sh_size);
>>  }
>>  EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
>> diff --git a/drivers/remoteproc/remoteproc_elf_loader.h
>> b/drivers/remoteproc/remoteproc_elf_loader.h
>> new file mode 100644
>> index 000000000000..fac3565734f9
>> --- /dev/null
>> +++ b/drivers/remoteproc/remoteproc_elf_loader.h
>> @@ -0,0 +1,69 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Remote processor elf loader defines
>> + *
>> + * Copyright (C) 2019 Kalray, Inc.
>> + */
>> +
>> +#ifndef REMOTEPROC_ELF_LOADER_H
>> +#define REMOTEPROC_ELF_LOADER_H
>> +
>> +#include <linux/elf.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * fw_elf_get_class - Get elf class
>> + * @fw: the ELF firmware image
>> + *
>> + * Note that we use and elf32_hdr to access the class since the start o=
f the
>> + * struct is the same for both elf class
>> + *
>> + * Return: elf class of the firmware
>> + */
>> +static inline u8 fw_elf_get_class(const struct firmware *fw)
>> +{
>> +=09struct elf32_hdr *ehdr =3D (struct elf32_hdr *)fw->data;
>> +
>> +=09return ehdr->e_ident[EI_CLASS];
>> +}
>> +
>> +#define ELF_GET_FIELD(__s, __field, __type) \
>> +static inline __type elf_##__s##_##__field(u8 class, const void *arg) \
>> +{ \
>> +=09if (class =3D=3D ELFCLASS32) \
>> +=09=09return (__type) ((const struct elf32_##__s *) arg)->__field; \
>> +=09else \
>> +=09=09return (__type) ((const struct elf64_##__s *) arg)->__field; \
>> +}
>> +
>> +ELF_GET_FIELD(hdr, e_entry, u64)
>> +ELF_GET_FIELD(hdr, e_phnum, u16)
>> +ELF_GET_FIELD(hdr, e_shnum, u16)
>> +ELF_GET_FIELD(hdr, e_phoff, u64)
>> +ELF_GET_FIELD(hdr, e_shoff, u64)
>> +ELF_GET_FIELD(hdr, e_shstrndx, u16)
>> +
>> +ELF_GET_FIELD(phdr, p_paddr, u64)
>> +ELF_GET_FIELD(phdr, p_filesz, u64)
>> +ELF_GET_FIELD(phdr, p_memsz, u64)
>> +ELF_GET_FIELD(phdr, p_type, u32)
>> +ELF_GET_FIELD(phdr, p_offset, u64)
>> +
>> +ELF_GET_FIELD(shdr, sh_size, u64)
>> +ELF_GET_FIELD(shdr, sh_offset, u64)
>> +ELF_GET_FIELD(shdr, sh_name, u32)
>> +ELF_GET_FIELD(shdr, sh_addr, u64)
>> +
>> +#define ELF_STRUCT_SIZE(__s) \
>> +static inline unsigned long elf_size_of_##__s(u8 class) \
>> +{ \
>> +=09if (class =3D=3D ELFCLASS32)\
>> +=09=09return sizeof(struct elf32_##__s); \
>> +=09else \
>> +=09=09return sizeof(struct elf64_##__s); \
>> +}
>> +
>> +ELF_STRUCT_SIZE(shdr)
>> +ELF_STRUCT_SIZE(phdr)
>> +
>> +#endif /* REMOTEPROC_ELF_LOADER_H */
>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>> b/drivers/remoteproc/remoteproc_internal.h
>> index 004867061721..eeb26434220e 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -55,7 +55,7 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr);
>>  int rproc_trigger_recovery(struct rproc *rproc);
>> =20
>>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *=
fw);
>> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw);
>> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw);
>>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware =
*fw);
>>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware=
 *fw);
>>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rp=
roc,
>> diff --git a/drivers/remoteproc/st_remoteproc.c
>> b/drivers/remoteproc/st_remoteproc.c
>> index ee13d23b43a9..a3268d95a50e 100644
>> --- a/drivers/remoteproc/st_remoteproc.c
>> +++ b/drivers/remoteproc/st_remoteproc.c
>> @@ -190,7 +190,7 @@ static int st_rproc_start(struct rproc *rproc)
>>  =09=09}
>>  =09}
>> =20
>> -=09dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
>> +=09dev_info(&rproc->dev, "Started from 0x%llx\n", rproc->bootaddr);
>> =20
>>  =09return 0;
>> =20
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index f84bd5fe0211..82cebca9344c 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -382,7 +382,7 @@ struct rproc_ops {
>>  =09=09=09=09struct rproc *rproc, const struct firmware *fw);
>>  =09int (*load)(struct rproc *rproc, const struct firmware *fw);
>>  =09int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>> -=09u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw)=
;
>> +=09u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw)=
;
>>  };
>> =20
>>  /**
>> @@ -498,7 +498,7 @@ struct rproc {
>>  =09int num_traces;
>>  =09struct list_head carveouts;
>>  =09struct list_head mappings;
>> -=09u32 bootaddr;
>> +=09u64 bootaddr;
>=20
> That will cause problems for rproc_coredump()[1] and fixing it properly
> likely means that a 32 or 64 elf should be generated based on the type of=
 image
> that was loaded.  This is also true if ->p_vaddr and ->p_paddr (also in t=
he same
> function) are to be handled properly.
>=20
> I'm interested in your opinion on this.

Indeed, you are right !

I'm "afraid" I will have to fix that !
Most sane thing to do is to dump an elf with the input elf class.
I will make a V4 with a patch for that.

Thanks,

Cl=C3=A9ment

>=20
> Thanks,
> Mathieu
>=20
> [1].
> https://elixir.bootlin.com/linux/latest/source/drivers/remoteproc/remotep=
roc_core.c#L1600
>=20
>>  =09struct list_head rvdevs;
>>  =09struct list_head subdevs;
>>  =09struct idr notifyids;
>> --
>> 2.15.0.276.g89ea799
