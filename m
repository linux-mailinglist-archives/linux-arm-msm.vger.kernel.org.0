Return-Path: <linux-arm-msm+bounces-81895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 299E5C5E71E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 18:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 16BE03C3375
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68582329E68;
	Fri, 14 Nov 2025 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnGaZuMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC39236435;
	Fri, 14 Nov 2025 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135246; cv=none; b=t66zSsJpXwJAPEk8v14YPBRvAtZCamF3CIXSTvEKHLj5PJMDmF0mdRiH48NPQCmSYUymKuAs0eZnYIeLIokRn29D6miG1Jf6EpS0i7xQNiSTgRoOOEzBg/qFWl3mDnAgXS9WfEbzYNDWxHlUZmUA0x6Xy3rOKybrKkzD9GDpjDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135246; c=relaxed/simple;
	bh=mSrps6kcUyjP6xL+n9Pn5QzmtYa8CEWHnNnezuhW5qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpRaw7Rb3JbshBxvZgUXLV4gch3MNbZEvM7VD8deSed+8O8VolyceFyvleeu3G9c/E6LSd4tl08/yzFbeKV3nE6TyC08AvUzzzVvu+bKTV7iRKZIOaUOWZ1gKqfxIjuwblDjQKn22NdA/88DXLM2Z0IdhL97NVMKSXLNsaWf1lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnGaZuMb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4EEC19425;
	Fri, 14 Nov 2025 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135245;
	bh=mSrps6kcUyjP6xL+n9Pn5QzmtYa8CEWHnNnezuhW5qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnGaZuMbaz84hdPUSNTlwoCwUgLNtmmN8SLbFpRUmTtmsInEvYkq8mUHBe5wkVmWQ
	 ZnX4wLtyn+/pSHIvanFedENizggr+usjseA9Wl3w9OLD/Ue5DzTF8fY7T2Vf9Q9vJm
	 VaZoqEoF8zBs+3yr0OA3XY29/GbRg/cmJAUgddXHUi+cglgnz7cnBwjxPRTkl5cU3U
	 X6pUbWiQwT5Zthyu6++BZ0PiuIM/mvTqcWegx1f2XC7bXALLZTH4UGUVAtRtoFTJxt
	 Y5o92F8L+3eDa3FJMHsK1ZBhOX3Zg6Une6CfO8xgI2Gt0D3BtmFeWXwxs0mSIZOBEi
	 UI7BURzQ12V4Q==
Date: Fri, 14 Nov 2025 09:51:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com, 
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 02:11:41PM +0530, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 via OF matching on the fastrpc
> node; otherwise, default to legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 

In patch 2 I said I think it would be a good idea to separate the two
perspectives (Linux/SMMU vs remote addresses).

Looking ta this patch I'm completely convinced that it's the right thing
to do!

> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 46 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d6a7960fe716..bcf3c7f8d3e9 100644
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

This is a horrible macro. It looks just like a function taking values,
it's named to sound like it takes a sid and pa and return an iova, but
it has side effects.

And what's up with the ordering? Take argument 1 and 3, and put the
result in argument 2?!

> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical or dma address */
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
> @@ -390,7 +403,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->dma_addr));
> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>  	kfree(buf);
>  }
>  
> @@ -440,7 +453,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr,
> +				 fl->cctx->soc_data->sid_pos);

There's no way _you_ can look at this statement and feel that it's going
to add the first argument shifted by the third argument, to the second
argument.

Please write that is easy to read, follow and possible to maintain!

Regards,
Bjorn

>  
>  	return 0;
>  }
> @@ -685,7 +699,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
> +			      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -734,7 +749,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->dma_addr), size);
> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
> +				 buf->fl->cctx->soc_data->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -789,7 +805,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
>  		map->dma_addr = sg_dma_address(map->table->sgl);
> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
> +				 map->dma_addr, fl->cctx->soc_data->sid_pos);
>  	}
>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)
> @@ -2289,6 +2306,14 @@ static int fastrpc_get_domain_id(const char *domain)
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
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2297,6 +2322,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	const struct fastrpc_soc_data *soc_data = NULL;
> +
> +	soc_data = device_get_match_data(rdev);
> +	if (!soc_data)
> +		soc_data = &default_soc_data;
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
>  	if (err) {
> @@ -2349,6 +2379,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
> +	data->soc_data = soc_data;
>  
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
> @@ -2486,7 +2517,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  }
>  
>  static const struct of_device_id fastrpc_rpmsg_of_match[] = {
> -	{ .compatible = "qcom,fastrpc" },
> +	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
> +	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
> -- 
> 2.34.1
> 
> 

