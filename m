Return-Path: <linux-arm-msm+bounces-57510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A9FAB2030
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 01:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EB73BB871
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 23:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666A7263F44;
	Fri,  9 May 2025 23:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwG5VKun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2A221507C;
	Fri,  9 May 2025 23:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746832922; cv=none; b=qIVIP/kGbK7NYbNOX6yCJnGbRw1FO4cWUbwFvohoQNUakoyQdM890ziz7ma7Usu7Hx/Hm7O2vzwk4BDuZuT1vr9eqVle2qqe/fgopaKBi5HFcuQzuuFAPcE0x8QImbFf68cqVeUfOCjkHdVSikt5eN1rZQW9YM6UiC+LBNd+omk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746832922; c=relaxed/simple;
	bh=G3JgEdh9oBmC1aTQFHkLf2oWr0qJ3xdkDLPoUL6ZoMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rz/yFZx2aSFfGzJm6PfUBti1D90F909VaZ3MPcfpPrWcy6XGbl6qizzt3hs6qEe0xR51enbO+fIn87GbwzzFjV5pysw/CpgsTv/JQN/Mu6siIxL3BbfoRJMgKl7J7pXHjmZjbZ5sST5g9aQQeNJfkBT7zOUvwDOduKrShguRs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwG5VKun; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BE1C4CEE4;
	Fri,  9 May 2025 23:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746832921;
	bh=G3JgEdh9oBmC1aTQFHkLf2oWr0qJ3xdkDLPoUL6ZoMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwG5VKunnOa7XvNGX126Cp3hZAJ191JAbx45IL3FAQDlOOtOLG3KR2uTmhOn57YuL
	 UvqmZuSIJ5ac+X6LQYzhrohIYG9ULeD+l56xIkGKiM35Q5hDUnHrJ0mK9fC5gag0AQ
	 mduRvTo5DR80MZGx8dw7PZCyHm7N6+7Dq11aoG4LAGEJHEKGlYN4aNtfTiuDGxH96c
	 B3O8JEBIto+zxqD1Jbd9YQszspbBqThYItHR1V1slNJveya99iO/WDrxVPYz6xdf51
	 mbzECKGZTlR3JOJhaH2oqry2ToP1+jO5BT8XX8WIs1cfOcpKYKZAmMRN5Y1qV6bMRH
	 Yn+rvWqEqbreg==
Date: Fri, 9 May 2025 16:21:58 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org, konradybcio@kernel.org, 
	dietmar.eggemann@arm.com, juri.lelli@redhat.com, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [RFC][PATCH 03/14] kmemdump: introduce qcom-md backend driver
Message-ID: <xem7ug7xemmtx3jfr3tsq4quhfqtd3twcrszn6kfjpwwmjbbk4@rkmeeqny4nsg>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-4-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-4-eugen.hristev@linaro.org>

On Tue, Apr 22, 2025 at 02:31:45PM +0300, Eugen Hristev wrote:
> Qualcomm Minidump is a backend driver for kmemdump.
> Regions are being registered into the shared memory on Qualcomm platforms
> and into the table of contents.
> Further, the firmware can read the table of contents and dump the memory
> accordingly.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Co-developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/debug/Kconfig   |  13 ++
>  drivers/debug/Makefile  |   1 +
>  drivers/debug/qcom_md.c | 467 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 481 insertions(+)
>  create mode 100644 drivers/debug/qcom_md.c
> 
> diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
> index 22348608d187..72a906487e02 100644
> --- a/drivers/debug/Kconfig
> +++ b/drivers/debug/Kconfig
> @@ -13,4 +13,17 @@ config DRIVER_KMEMDUMP
>  
>  	  Note that modules using this feature must be rebuilt if option
>  	  changes.
> +
> +config QCOM_MD_KMEMDUMP_BACKEND

s/md/minidump/ throughout the patch.

> +	tristate "Qualcomm Minidump kmemdump backend driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on DRIVER_KMEMDUMP
> +	help
> +	  Say y here to enable the Qualcomm Minidump kmemdump backend
> +	  driver.
> +	  With this backend, the registered regions are being linked
> +	  into the minidump table of contents. Further on, the firmware
> +	  will be able to read the table of contents and extract the
> +	  memory regions on case-by-case basis.
> +
>  endmenu
> diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
> index cc14dea250e3..d8a9db29cd15 100644
> --- a/drivers/debug/Makefile
> +++ b/drivers/debug/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_DRIVER_KMEMDUMP) += kmemdump.o
> +obj-$(CONFIG_QCOM_MD_KMEMDUMP_BACKEND) += qcom_md.o
> diff --git a/drivers/debug/qcom_md.c b/drivers/debug/qcom_md.c
> new file mode 100644
> index 000000000000..1aff28e18230
> --- /dev/null
> +++ b/drivers/debug/qcom_md.c
> @@ -0,0 +1,467 @@
> +// SPDX-License-Identifier: GPL-2.0-only

I think you should inherit some copyrights from
drivers/remoteproc/qcom_common.c here...

> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/socinfo.h>

What do you need socinfo.h for? What about of*.h?

> +#include <linux/kmemdump.h>
> +
> +/*
> + * In some of the Old Qualcomm devices, boot firmware statically allocates 300
> + * as total number of supported region (including all co-processors) in
> + * minidump table out of which linux was using 201. In future, this limitation
> + * from boot firmware might get removed by allocating the region dynamically.
> + * So, keep it compatible with older devices, we can keep the current limit for
> + * Linux to 201.
> + */
> +#define MAX_NUM_ENTRIES	  201

MAX_NUM_REGIONS

> +
> +#define MAX_NUM_OF_SS           10

Drop the "OF" and expand "subsystem".

> +#define MAX_REGION_NAME_LENGTH  16
> +#define SBL_MINIDUMP_SMEM_ID	602
> +#define MINIDUMP_REGION_VALID	   ('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
> +#define MINIDUMP_SS_ENCR_DONE	   ('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
> +#define MINIDUMP_SS_ENABLED	   ('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
> +
> +#define MINIDUMP_SS_ENCR_NOTREQ	   (0 << 24 | 0 << 16 | 'N' << 8 | 'R' << 0)
> +
> +#define MINIDUMP_APSS_DESC	   0

MINIDUMP_SUBSYSTEM_APSS

> +
> +/**
> + * struct minidump - Minidump driver data information
> + * @apss_data: APSS driver data
> + * @md_lock: Lock to protect access to APSS minidump table
> + */
> +struct minidump {

The ordering of structures and functions in this file is haphazard.
You're mixing structures that relates to memory layout with driver
context and related functions are intermixed with unrelated functions.

Effectively the flow through this driver is:
 register
 find_region
 unregister
 register,
 valid_region,
 register
 unregister, 
 init,
 register,
 unregister,
 probe,

Or I guess "flow" is the wrong word here...

> +	struct device		*dev;
> +	struct minidump_ss_data	*apss_data;
> +	struct mutex		md_lock;
> +};
> +
> +/**
> + * struct minidump_region - Minidump region
> + * @name		: Name of the region to be dumped
> + * @seq_num:		: Use to differentiate regions with same name.
> + * @valid		: This entry to be dumped (if set to 1)
> + * @address		: Physical address of region to be dumped
> + * @size		: Size of the region
> + */
> +struct minidump_region {
> +	char	name[MAX_REGION_NAME_LENGTH];
> +	__le32	seq_num;
> +	__le32	valid;
> +	__le64	address;
> +	__le64	size;
> +};
> +
> +/**
> + * struct minidump_subsystem - Subsystem's SMEM Table of content
> + * @status : Subsystem toc init status
> + * @enabled : if set to 1, this region would be copied during coredump
> + * @encryption_status: Encryption status for this subsystem
> + * @encryption_required : Decides to encrypt the subsystem regions or not
> + * @region_count : Number of regions added in this subsystem toc
> + * @regions_baseptr : regions base pointer of the subsystem
> + */
> +struct minidump_subsystem {
> +	__le32	status;
> +	__le32	enabled;
> +	__le32	encryption_status;
> +	__le32	encryption_required;
> +	__le32	region_count;
> +	__le64	regions_baseptr;
> +};
> +
> +/**
> + * struct minidump_global_toc - Global Table of Content
> + * @status : Global Minidump init status
> + * @md_revision : Minidump revision
> + * @enabled : Minidump enable status
> + * @subsystems : Array of subsystems toc
> + */
> +struct minidump_global_toc {
> +	__le32				status;
> +	__le32				md_revision;

Why is this member prefixed with md_ when the others aren't?

> +	__le32				enabled;
> +	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
> +};
> +
> +/**
> + * struct minidump_ss_data - Minidump subsystem private data
> + * @md_ss_toc: Application Subsystem TOC pointer
> + * @md_regions: Application Subsystem region base pointer
> + */
> +struct minidump_ss_data {
> +	struct minidump_subsystem *md_ss_toc;
> +	struct minidump_region	  *md_regions;

Please clean these member names up.

> +};
> +
> +#define MINIDUMP_MAX_NAME_LENGTH	12

Why is this 12 here, 16 above, and 8 in kmemdump.c?

> +/**
> + * struct qcom_minidump_region - Minidump region information
> + *
> + * @name:	Minidump region name
> + * @virt_addr:  Virtual address of the entry.
> + * @phys_addr:	Physical address of the entry to dump.
> + * @size:	Number of bytes to dump from @address location,
> + *		and it should be 4 byte aligned.
> + */
> +struct qcom_minidump_region {
> +	char		name[MINIDUMP_MAX_NAME_LENGTH];
> +	void		*virt_addr;
> +	phys_addr_t	phys_addr;
> +	size_t		size;
> +	unsigned int	id;
> +};
> +
> +static LIST_HEAD(apss_md_rlist);

Took me a while to understand that this is the "application subsystem
minidump regions list". Perhaps this could be named
"minidump_regions_list" or something like that? 

> +
> +/**
> + * struct md_region_list - Minidump region list struct
> + *
> + * @md_region:	associated minidump region
> + * @list:  list head entry
> + */
> +struct md_region_list {
> +	struct qcom_minidump_region md_region;
> +	struct list_head list;
> +};
> +
> +static struct minidump *md;
> +
> +/**
> + * qcom_md_add_region() - Register region in APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: None
> + */
> +static void qcom_md_add_region(const struct qcom_minidump_region *region)
> +{
> +	struct minidump_subsystem *mdss_toc = md->apss_data->md_ss_toc;
> +	struct minidump_region *mdr;
> +	unsigned int region_cnt;
> +
> +	region_cnt = le32_to_cpu(mdss_toc->region_count);
> +	mdr = &md->apss_data->md_regions[region_cnt];
> +	strscpy(mdr->name, region->name, sizeof(mdr->name));
> +	mdr->address = cpu_to_le64(region->phys_addr);
> +	mdr->size = cpu_to_le64(region->size);
> +	mdr->valid = cpu_to_le32(MINIDUMP_REGION_VALID);
> +	region_cnt++;
> +	mdss_toc->region_count = cpu_to_le32(region_cnt);
> +}
> +
> +/**
> + * qcom_md_get_region_index() - Lookup minidump region by name
> + * @mdss_data: minidump subsystem data
> + * @region: minidump region.
> + *
> + * Return: On success, it returns the region index, on failure, returns
> + *	negative error value
> + */
> +static int qcom_md_get_region_index(struct minidump_ss_data *mdss_data,
> +				    const struct qcom_minidump_region *region)
> +{
> +	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
> +	struct minidump_region *mdr;
> +	unsigned int i;
> +	unsigned int count;
> +
> +	count = le32_to_cpu(mdss_toc->region_count);
> +	for (i = 0; i < count; i++) {
> +		mdr = &mdss_data->md_regions[i];
> +		if (!strcmp(mdr->name, region->name))
> +			return i;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +/**
> + * qcom_md_region_unregister() - Unregister region from APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +static int qcom_md_region_unregister(const struct qcom_minidump_region *region)

Could you please make this API pass the backend pointer, so that backend
drivers doesn't all need to rely on a global pointer to their context.

> +{
> +	struct minidump_ss_data *mdss_data = md->apss_data;
> +	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
> +	struct minidump_region *mdr;
> +	unsigned int region_cnt;
> +	unsigned int idx;
> +	int ret;
> +
> +	ret = qcom_md_get_region_index(mdss_data, region);
> +	if (ret < 0) {
> +		dev_err(md->dev, "%s region is not present\n", region->name);
> +		return ret;
> +	}
> +
> +	idx = ret;
> +	mdr = &mdss_data->md_regions[0];
> +	region_cnt = le32_to_cpu(mdss_toc->region_count);
> +	/*
> +	 * Left shift all the regions exist after this removed region
> +	 * index by 1 to fill the gap and zero out the last region
> +	 * present at the end.
> +	 */
> +	memmove(&mdr[idx], &mdr[idx + 1], (region_cnt - idx - 1) * sizeof(*mdr));
> +	memset(&mdr[region_cnt - 1], 0, sizeof(*mdr));
> +	region_cnt--;
> +	mdss_toc->region_count = cpu_to_le32(region_cnt);
> +
> +	return 0;
> +}
> +
> +/**
> + * qcom_md_region_register() - Register region in APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +static int qcom_md_region_register(const struct qcom_minidump_region *region)
> +{
> +	struct minidump_ss_data *mdss_data = md->apss_data;
> +	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
> +	unsigned int num_region;
> +	int ret;
> +
> +	ret = qcom_md_get_region_index(mdss_data, region);
> +	if (ret >= 0) {
> +		dev_info(md->dev, "%s region is already registered\n", region->name);

struct minidump_region->seq_num tells us that you can have multiple
entries with the same name; so why are you prohibiting this here?

If I understand the code two stack frames up correctly, you have a
cyclic id already - can't you use that as the index?

> +		return -EEXIST;
> +	}
> +
> +	/* Check if there is a room for a new entry */
> +	num_region = le32_to_cpu(mdss_toc->region_count);
> +	if (num_region >= MAX_NUM_ENTRIES) {
> +		dev_err(md->dev, "maximum region limit %u reached\n", num_region);
> +		return -ENOSPC;
> +	}
> +
> +	qcom_md_add_region(region);

Wouldn't it be better to inline qcom_md_add_region() here, to avoid
checking region_count in one place and then "blindly" appending items to
the array in another place.

> +
> +	return 0;
> +}
> +
> +/**
> + * qcom_minidump_valid_region() - Checks if region is valid
> + * @region: minidump region.
> + *
> + * Return: true if region is valid, false otherwise.
> + */
> +static bool qcom_minidump_valid_region(const struct qcom_minidump_region *region)
> +{
> +	return region &&
> +		strnlen(region->name, MINIDUMP_MAX_NAME_LENGTH) < MINIDUMP_MAX_NAME_LENGTH &&
> +			region->virt_addr &&

This indentation makes it look like region->virt_addr is an argument to
the function call on the line above.

> +			region->size &&
> +			IS_ALIGNED(region->size, 4);
> +}
> +
> +/**
> + * qcom_minidump_region_register() - Register region in APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +static int qcom_minidump_region_register(const struct qcom_minidump_region *region)
> +{
> +	int ret;
> +
> +	if (!qcom_minidump_valid_region(region))

How could that be, you created "region" from scratch in the calling
stack frame?

> +		return -EINVAL;
> +
> +	mutex_lock(&md->md_lock);
> +	ret = qcom_md_region_register(region);
> +
> +	mutex_unlock(&md->md_lock);
> +	return ret;
> +}
> +
> +/**
> + * qcom_minidump_region_unregister() - Unregister region from APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +static int qcom_minidump_region_unregister(const struct qcom_minidump_region *region)
> +{
> +	int ret;
> +
> +	if (!qcom_minidump_valid_region(region))
> +		return -EINVAL;
> +
> +	mutex_lock(&md->md_lock);
> +	ret = qcom_md_region_unregister(region);
> +
> +	mutex_unlock(&md->md_lock);
> +	return ret;
> +}
> +
> +/**
> + * qcom_apss_md_table_init() - Initialize the minidump table
> + * @mdss_toc: minidump subsystem table of contents
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +static int qcom_apss_md_table_init(struct minidump_subsystem *mdss_toc)
> +{
> +	struct minidump_ss_data *mdss_data;
> +
> +	mdss_data = devm_kzalloc(md->dev, sizeof(*mdss_data), GFP_KERNEL);

Why is minidump_ss_data a separate object from struct minidump?

> +	if (!mdss_data)
> +		return -ENOMEM;
> +
> +	mdss_data->md_ss_toc = mdss_toc;
> +	mdss_data->md_regions = devm_kcalloc(md->dev, MAX_NUM_ENTRIES,
> +					     sizeof(*mdss_data->md_regions),
> +					     GFP_KERNEL);
> +	if (!mdss_data->md_regions)
> +		return -ENOMEM;
> +
> +	mdss_toc = mdss_data->md_ss_toc;
> +	mdss_toc->regions_baseptr = cpu_to_le64(virt_to_phys(mdss_data->md_regions));
> +	mdss_toc->enabled = cpu_to_le32(MINIDUMP_SS_ENABLED);
> +	mdss_toc->status = cpu_to_le32(1);
> +	mdss_toc->region_count = cpu_to_le32(0);
> +
> +	/* Tell bootloader not to encrypt the regions of this subsystem */
> +	mdss_toc->encryption_status = cpu_to_le32(MINIDUMP_SS_ENCR_DONE);
> +	mdss_toc->encryption_required = cpu_to_le32(MINIDUMP_SS_ENCR_NOTREQ);
> +
> +	md->apss_data = mdss_data;
> +
> +	return 0;
> +}
> +
> +/**
> + * register_md_region() - Register a new minidump region
> + * @id: unique id to identify the region
> + * @name: name of the region
> + * @vaddr: virtual memory address of the region start
> + * @size: size of the region
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +static int register_md_region(unsigned int id, char *name, void *vaddr,
> +			      size_t size)
> +{
> +	struct qcom_minidump_region *md_region;
> +	int ret;
> +
> +	struct md_region_list *mdr_list =
> +		kzalloc(sizeof(*mdr_list), GFP_KERNEL);

Weird line wrapping. Use up to 100 characters if you need to... Here
you'll hit 81 though...

> +	if (!mdr_list)
> +		return -ENOMEM;
> +	md_region = &mdr_list->md_region;
> +
> +	scnprintf(md_region->name, sizeof(md_region->name), "K%d%.8s", id, name);
> +	md_region->virt_addr = vaddr;
> +	md_region->phys_addr = virt_to_phys(vaddr);
> +	md_region->size = ALIGN(size, 4);
> +	md_region->id = id;
> +
> +	ret = qcom_minidump_region_register(md_region);
> +	if (ret < 0) {
> +		pr_err("failed to register region in minidump %d %s: err: %d\n",
> +		       id, name, ret);

You already printed when you get back here with an error.

And you're leaking the mdr_list allocation.

> +		return ret;
> +	}
> +
> +	list_add(&mdr_list->list, &apss_md_rlist);
> +	return 0;
> +}
> +
> +/**
> + * unregister_md_region() - Unregister a previously registered minidump region
> + * @id: unique id to identify the region
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +static int unregister_md_region(unsigned int id)
> +{
> +	int ret = -ENOENT;
> +	struct md_region_list *mdr_list;
> +	struct md_region_list *tmp;
> +
> +	list_for_each_entry_safe(mdr_list, tmp, &apss_md_rlist, list) {
> +		struct qcom_minidump_region *region;
> +
> +		region = &mdr_list->md_region;
> +		if (region->id == id) {
> +			ret = qcom_minidump_region_unregister(region);

What does it mean that "ret" is non-zero here? Does it make sense to
return a value from this function? Who's going to do what with that
information?

> +			list_del(&mdr_list->list);
> +			return ret;
> +		}
> +	}
> +
> +	pr_err("failed to unregister region from minidump %d\n", ret);

You can be more specific here...
> +
> +	return ret;

That would be -ENOENT...

> +}
> +
> +static struct kmemdump_backend qcom_md_backend = {
> +	.name = "qcom_md",
> +	.register_region = register_md_region,
> +	.unregister_region = unregister_md_region,
> +};
> +
> +static int qcom_md_probe(struct platform_device *pdev)
> +{
> +	struct minidump_global_toc *mdgtoc;
> +	size_t size;
> +	int ret;
> +
> +	md = devm_kzalloc(&pdev->dev, sizeof(*md), GFP_KERNEL);

Don't devres allocate resources and store the result in a global
pointer. Also, you forgot to check if it failed.

> +
> +	md->dev = &pdev->dev;
> +
> +	mdgtoc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &size);
> +	if (IS_ERR(mdgtoc)) {
> +		ret = PTR_ERR(mdgtoc);
> +		dev_err(md->dev, "Couldn't find minidump smem item %d\n", ret);

return?

> +	}
> +
> +	if (size < sizeof(*mdgtoc) || !mdgtoc->status) {
> +		dev_err(md->dev, "minidump table is not initialized %d\n", ret);
> +		return -ENAVAIL;
> +	}
> +
> +	mutex_init(&md->md_lock);
> +
> +	ret = qcom_apss_md_table_init(&mdgtoc->subsystems[MINIDUMP_APSS_DESC]);
> +	if (ret) {
> +		dev_err(md->dev, "apss minidump initialization failed %d\n", ret);

The only way qcom_apss_md_table_init() can fails is malloc(), in which
case you already got a more specific error message. So you can drop this
one.

> +		return ret;

When you return here "md" is a dangling pointer.

Regards,
Bjorn

> +	}
> +
> +	return kmemdump_register_backend(&qcom_md_backend);
> +}
> +
> +static void qcom_md_remove(struct platform_device *pdev)
> +{
> +	kmemdump_unregister_backend(&qcom_md_backend);
> +}
> +
> +static struct platform_driver qcom_md_driver = {
> +	.probe = qcom_md_probe,
> +	.remove = qcom_md_remove,
> +	.driver  = {
> +		.name = "qcom-md",
> +	},
> +};
> +
> +module_platform_driver(qcom_md_driver);
> +
> +MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
> +MODULE_AUTHOR("Mukesh Ojha <quic_mojha@quicinc.com>");
> +MODULE_DESCRIPTION("Qualcomm kmemdump minidump backend driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

