Return-Path: <linux-arm-msm+bounces-77338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71825BDD8A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA5EA5442D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4280E3176EA;
	Wed, 15 Oct 2025 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8m8aH+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3F3318129;
	Wed, 15 Oct 2025 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760518381; cv=none; b=ZcQ2fWLjR+popg1cvfdv88L3a1SRnFh+1jNHU3wR2SAYcEtp5A+ok/7HI3h1IxtsNSRcm8Vd/s2tW+uvF2rs54WNfiyyApOM/yet7pDL/iM2H3oexQZ1jrYuScXIQBXGjKruN5v0jXczxDgOBDlsWycPoGkM7VQtLrFyHaAlcGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760518381; c=relaxed/simple;
	bh=XLA6Eu6f5/4ky5iCsrSJWYhY0tHcaH12XuVDt1D4qac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWAkF+Qp3dudZHmVjKcK3SZCHePV41aX2aoSFqSco088B9YYbn99iB0YVTS08m5HumVY4/Izn+WM1fu6XAmDiatb/tvE6WCC3a0i8dn+8eMfdYqp3jpIdahhplHm7JaU6hMqfcwV5DOzaXdm0t2MT6WycfSXGnkO5nqC7fLH2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8m8aH+l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFADC4CEF8;
	Wed, 15 Oct 2025 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760518379;
	bh=XLA6Eu6f5/4ky5iCsrSJWYhY0tHcaH12XuVDt1D4qac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U8m8aH+lynoRJDZ5RaTLH63nRZAa/Xm/MmkRqq2hj4VRCAJhxi4qkYB7yZd668WsB
	 tZI+VH/fqaPUbdN+FB12YOuIUxg1Wftr87clQnKq7tPA0q5PLr4qqGErbebTFrJ9Bq
	 Ya5fdu4a81DYKB9LPEeq34sDdiaXYyp8GJLrz78jtDkZZwj/R7cJfS/Q/eMqko9FY/
	 LYtyGP5t9GDKSdGgZ88hDrYDJF2LYQmUMUiUOh4zDWcvpt7zP0eQjez0Iccsna1Odk
	 m4qn3MmcVWK5Pnzd2NqEf1HG/W9UK366gUMsKGRt+YHRlcZw50r+mYWC3d1HHlWvyD
	 3Q6L+/pgUpKgA==
Message-ID: <75433294-4c47-4f4f-9de2-ee29af01f021@kernel.org>
Date: Wed, 15 Oct 2025 09:52:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/15/25 5:57 AM, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 based on SoC-specific compatible
> string from the root node within the physical address; otherwise, default to
> legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 59 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 975be54a2491..1a5d620b23f2 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -33,7 +33,6 @@
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
>  #define FASTRPC_MAX_CRCLIST	64
> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> @@ -105,6 +104,15 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Extract smmu pa from consolidated iova */
> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> +/*
> + * Prepare the consolidated iova to send to dsp by prepending the sid
> + * to smmu pa at the appropriate position
> + */
> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
> +       (phys += sid << sid_pos)
> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -257,6 +265,10 @@ struct fastrpc_session_ctx {
>  	bool valid;
>  };
>  
> +struct fastrpc_soc_data {
> +	u32 sid_pos;
> +};
> +
>  struct fastrpc_channel_ctx {
>  	int domain_id;
>  	int sesscount;
> @@ -278,6 +290,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	const struct fastrpc_soc_data *soc_data;
>  };
>  
>  struct fastrpc_device {
> @@ -387,7 +400,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->dma_addr));
> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>  	kfree(buf);
>  }
>  
> @@ -437,8 +450,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
> -
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr, fl->cctx->soc_data->sid_pos);

deleted an empty line for no reason.

>  	return 0;
>  }
>  
> @@ -682,7 +694,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> +			      IPA_TO_DMA_ADDR(buffer->dma_addr, buffer->fl->cctx->soc_data->sid_pos),
> +			      buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -731,7 +744,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->dma_addr), size);
> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
> +				 buf->fl->cctx->soc_data->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -786,7 +800,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
>  		map->dma_addr = sg_dma_address(map->table->sgl);
> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
> +				 map->dma_addr, fl->cctx->soc_data->sid_pos);
>  	}
>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)
> @@ -2283,6 +2298,19 @@ static int fastrpc_get_domain_id(const char *domain)
>  	return -EINVAL;
>  }
>  
> +static const struct fastrpc_soc_data kaanapali_soc_data = {
> +	.sid_pos = 56,
> +};
> +
> +static const struct fastrpc_soc_data default_soc_data = {
> +	.sid_pos = 32,
> +};
> +
> +static const struct of_device_id qcom_soc_match_table[] = {
> +	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
> +	{ },
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2291,6 +2319,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	struct device_node *root;
> +	const struct of_device_id *match;
> +	const struct fastrpc_soc_data *soc_data = NULL;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return -ENODEV;
> +
> +	match = of_match_node(qcom_soc_match_table, root);
> +	of_node_put(root);
> +	if (!match || !match->data) {
> +		 soc_data = &default_soc_data;
> +		 dev_dbg(rdev, "no compatible SoC found at root node\n");
> +	} else {
> +		 soc_data = match->data;
> +	}
>  

I think you will be better off moving this to below helper function,
this will simplify the code to:

soc_data = of_machine_get_match_data(qcom_soc_match_table);
if (!soc_data)
	soc_data = &default_soc_data;

------------------------>cut<-----------------
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Date:   Sat Oct 4 15:09:46 2025 +0100

    of: base: add of_machine_get_match_data helper function

    There are atleast 3 instances of this code in drivers, add a helper
    function of_machine_get_match_data to avoid code duplication and better
    error handling.

    Signed-off-by: Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com>

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7043acd971a0..ac4b965f06b6 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,32 @@ bool of_machine_compatible_match(const char *const
*compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);

+/**
+ * of_machine_get_match_data - Test root of device tree against a
compatible array
+ * and return data associated with match.
+ * @compats: NULL terminated array of compatible strings to look for in
root node's compatible property.
+ *
+ * Returns match data if the root node has any of the given compatible
values in its or NULL if
+ * compatible property nodes not match with compats.
+ */
+const void *of_machine_get_match_data(const char *const *compats)
+{
+       const struct of_device_id *match = NULL;
+       struct device_node *root;
+
+       root = of_find_node_by_path("/");
+       if (root) {
+               match = of_match_node(compats, root);
+               of_node_put(root);
+       }
+
+       if (!match)
+               return NULL;
+
+       return match->data;
+}
+EXPORT_SYMBOL(of_machine_get_match_data);
+
 static bool __of_device_is_status(const struct device_node *device,
                                  const char * const*strings)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..4d6792abf5f7 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -407,6 +407,7 @@ extern int of_alias_get_id(const struct device_node
*np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);

 bool of_machine_compatible_match(const char *const *compats);
+void *of_machine_get_match_data(const char *const *compats);

 /**
  * of_machine_is_compatible - Test root of device tree for a given
compatible value

------------------------>cut<-----------------

>  	err = of_property_read_string(rdev->of_node, "label", &domain);
>  	if (err) {
> @@ -2343,6 +2387,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
> +	data->soc_data = soc_data;
>  
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:


