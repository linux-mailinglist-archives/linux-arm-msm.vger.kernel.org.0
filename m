Return-Path: <linux-arm-msm+bounces-70767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB77B34D9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 777813AE27B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F107822C355;
	Mon, 25 Aug 2025 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuycXlRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84F28F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756156090; cv=none; b=E6JA9pxJx/7rsPPMzzTuJ/zbbz4bji1P04keTo71CM5mwNOs3kPCr8pfcguEyLK5UkDSJPn357ZYZMd48hcTdfcKC9BJU2dF9I6+7AuPI8OHlTIcUUvQ8JhDGUhJkdAYhi6e3o49fTLXrT3n6LaUG5TOqEm/ZlpgwFpwK98MUXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756156090; c=relaxed/simple;
	bh=RGG4+xmVX3sc6H/RDvgxrcD3AhssNLpseQ6gQKmWKT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBIohDSVG5WRUFKkHW8JYUMVrzYAWcLw1BHTLmzYDNMclmPojRGmbVj3KOVBWrecj2FgSESPyEfbFxqC0nmSPolt5GfpPKQvyBrXxBJNcuDLiKJZ6RSwc347KoNTo1vr3dH2ns1n6fBDFRbrKM9BqQDJuOYeMc9IYPQWFYhSEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuycXlRD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB237C4CEED;
	Mon, 25 Aug 2025 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756156089;
	bh=RGG4+xmVX3sc6H/RDvgxrcD3AhssNLpseQ6gQKmWKT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuycXlRDYTusN3quTMmQsN+s8Tq6InsxWvMQRPysXbpZcCJqbAkanwIfgzQ0QiktX
	 7QLsVIyfXQVd4kqPOMcgtzcilPzvBkVsiaqG55VkCazetbU+R7R8O+IktKDVlONkYB
	 HK9/lMn8Mj1ynYKkOs8V72lKQx8dYvgz/OeDY8gBe58bE7VisGloZ/llKgENbBX4fx
	 lwXDUA9JnpPbzrdiamWW5qykUb5dybuhEH2Fijh7k4WvnMRWzMJeWFj1u5cTEgTdmt
	 ymq4lxsilwErSOwQmXzWqM2D7rgmR9NUd/xrcmgRaRKYEJlxUh1eFNqwJxwv2/lI9G
	 d1NAQdxv9N+nA==
Date: Mon, 25 Aug 2025 16:08:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 02/12] drivers: accel : Move AIC specific image tables
 to mhi_controller.c file
Message-ID: <b57hqn6vnej6uab43cppt2fj4ugsg5ifornc7puajaxipetu2e@nigbpn2f7k7c>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-3-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-3-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:16PM +0530, Kishore Batta wrote:

"git log --oneline -- drivers/accel/qaic/sahara.c" says that subject
prefix should be "accel/qaic: "

> Move the AIC-specific image tables from the Sahara driver to the AIC
> specific controller file. This change prevents the Sahara driver from
> being tagged to a specific Qualcomm device, making it easier to add
> support for new devices with their own image tables.

I don't have any concerns with moving the firmware mapping out of the
sahara driver, but the implementation already supports two different
devices...so it's not "tagged to a specific device".

Also, while at it, please start your commit message with a problem
statement and finish it with the technical description of the change
you're doing.

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 43 +++++++++++++++++++++++++++++
>  drivers/accel/qaic/sahara.c         | 43 ++---------------------------
>  drivers/accel/qaic/sahara.h         |  7 +++++
>  3 files changed, 52 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 13a14c6c6168..5cc7994f4809 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -790,6 +790,49 @@ static struct mhi_controller_config mhi_cntrl_configs[] = {
>  	},
>  };
>  
> +const char * const aic100_image_table[] = {
> +	[1]  = "qcom/aic100/fw1.bin",
> +	[2]  = "qcom/aic100/fw2.bin",
> +	[4]  = "qcom/aic100/fw4.bin",
> +	[5]  = "qcom/aic100/fw5.bin",
> +	[6]  = "qcom/aic100/fw6.bin",
> +	[8]  = "qcom/aic100/fw8.bin",
> +	[9]  = "qcom/aic100/fw9.bin",
> +	[10] = "qcom/aic100/fw10.bin",
> +};
> +
> +const size_t aic100_image_table_size = ARRAY_SIZE(aic100_image_table);
> +
> +const char * const aic200_image_table[] = {
> +	[5]  = "qcom/aic200/uefi.elf",
> +	[12] = "qcom/aic200/aic200-nsp.bin",
> +	[23] = "qcom/aic200/aop.mbn",
> +	[32] = "qcom/aic200/tz.mbn",
> +	[33] = "qcom/aic200/hypvm.mbn",
> +	[39] = "qcom/aic200/aic200_abl.elf",
> +	[40] = "qcom/aic200/apdp.mbn",
> +	[41] = "qcom/aic200/devcfg.mbn",
> +	[42] = "qcom/aic200/sec.elf",
> +	[43] = "qcom/aic200/aic200-hlos.elf",
> +	[49] = "qcom/aic200/shrm.elf",
> +	[50] = "qcom/aic200/cpucp.elf",
> +	[51] = "qcom/aic200/aop_devcfg.mbn",
> +	[57] = "qcom/aic200/cpucp_dtbs.elf",
> +	[62] = "qcom/aic200/uefi_dtbs.elf",
> +	[63] = "qcom/aic200/xbl_ac_config.mbn",
> +	[64] = "qcom/aic200/tz_ac_config.mbn",
> +	[65] = "qcom/aic200/hyp_ac_config.mbn",
> +	[66] = "qcom/aic200/pdp.elf",
> +	[67] = "qcom/aic200/pdp_cdb.elf",
> +	[68] = "qcom/aic200/sdi.mbn",
> +	[69] = "qcom/aic200/dcd.mbn",
> +	[73] = "qcom/aic200/gearvm.mbn",
> +	[74] = "qcom/aic200/sti.bin",
> +	[75] = "qcom/aic200/pvs.bin",
> +};
> +
> +const size_t aic200_image_table_size = ARRAY_SIZE(aic200_image_table);
> +
>  static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
>  {
>  	u32 tmp;
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 3ebcc1f7ff58..cf8f8b585223 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -177,45 +177,6 @@ struct sahara_context {
>  	bool				is_mem_dump_mode;
>  };
>  
> -static const char * const aic100_image_table[] = {
> -	[1]  = "qcom/aic100/fw1.bin",
> -	[2]  = "qcom/aic100/fw2.bin",
> -	[4]  = "qcom/aic100/fw4.bin",
> -	[5]  = "qcom/aic100/fw5.bin",
> -	[6]  = "qcom/aic100/fw6.bin",
> -	[8]  = "qcom/aic100/fw8.bin",
> -	[9]  = "qcom/aic100/fw9.bin",
> -	[10] = "qcom/aic100/fw10.bin",
> -};
> -
> -static const char * const aic200_image_table[] = {
> -	[5]  = "qcom/aic200/uefi.elf",
> -	[12] = "qcom/aic200/aic200-nsp.bin",
> -	[23] = "qcom/aic200/aop.mbn",
> -	[32] = "qcom/aic200/tz.mbn",
> -	[33] = "qcom/aic200/hypvm.mbn",
> -	[39] = "qcom/aic200/aic200_abl.elf",
> -	[40] = "qcom/aic200/apdp.mbn",
> -	[41] = "qcom/aic200/devcfg.mbn",
> -	[42] = "qcom/aic200/sec.elf",
> -	[43] = "qcom/aic200/aic200-hlos.elf",
> -	[49] = "qcom/aic200/shrm.elf",
> -	[50] = "qcom/aic200/cpucp.elf",
> -	[51] = "qcom/aic200/aop_devcfg.mbn",
> -	[57] = "qcom/aic200/cpucp_dtbs.elf",
> -	[62] = "qcom/aic200/uefi_dtbs.elf",
> -	[63] = "qcom/aic200/xbl_ac_config.mbn",
> -	[64] = "qcom/aic200/tz_ac_config.mbn",
> -	[65] = "qcom/aic200/hyp_ac_config.mbn",
> -	[66] = "qcom/aic200/pdp.elf",
> -	[67] = "qcom/aic200/pdp_cdb.elf",
> -	[68] = "qcom/aic200/sdi.mbn",
> -	[69] = "qcom/aic200/dcd.mbn",
> -	[73] = "qcom/aic200/gearvm.mbn",
> -	[74] = "qcom/aic200/sti.bin",
> -	[75] = "qcom/aic200/pvs.bin",
> -};
> -
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  {
>  	int ret;
> @@ -779,10 +740,10 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  
>  	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
>  		context->image_table = aic200_image_table;
> -		context->table_size = ARRAY_SIZE(aic200_image_table);
> +		context->table_size = aic200_image_table_size;
>  	} else {
>  		context->image_table = aic100_image_table;
> -		context->table_size = ARRAY_SIZE(aic100_image_table);
> +		context->table_size = aic100_image_table_size;
>  	}
>  
>  	context->active_image_id = SAHARA_IMAGE_ID_NONE;
> diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
> index 640208acc0d1..d7fd447ca85b 100644
> --- a/drivers/accel/qaic/sahara.h
> +++ b/drivers/accel/qaic/sahara.h
> @@ -7,4 +7,11 @@
>  
>  int sahara_register(void);
>  void sahara_unregister(void);
> +
> +extern const char * const aic200_image_table[];
> +extern const size_t aic200_image_table_size;
> +
> +extern const char * const aic100_image_table[];
> +extern const size_t aic100_image_table_size;

Making sahara.c reference these arrays through extern declarations is
pretty ugly, and in patch 4 you're forgetting to add the "static"
keyword to the image_tables...

How about introducing patch 3 first, with special handling for AIC[12]00
and then squash this with what is now patch 4 to make the move in one
go?


Still need a statement in one of these commit messages to why you don't
just add qdu_image_table[] to sahara.c...

Regards,
Bjorn

> +
>  #endif /* __SAHARA_H__ */
> -- 
> 2.34.1
> 

