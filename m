Return-Path: <linux-arm-msm+bounces-85056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F2CB60CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2762B300161B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C581F584C;
	Thu, 11 Dec 2025 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpZ2A0Im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIkRyudi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D32DA765
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765460289; cv=none; b=CN4dwxcO4WwM+jF0DG11R3zspnd+p5r8b0jFohsRRKT+uX564zlCuB351s5L5kvdQR8BLQjFMmjci1TU0Ibh7vpHOfOR4AFMlCzG+KBEBLqKcA/Zk/P+y3YaI3i+6prYB7z4iIs0PjpW4zhtxZLacmh8lnGgSAm8jzrJL4M2vT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765460289; c=relaxed/simple;
	bh=35ixyszUS07eBNKrdFuWw5OLtMjp9oN1jX4TCYQvWFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duAchwsZMSJsi4OghwLa/Ur2MPkhbC2ka6/gQMgaTQwJUGxnMGJ/GWhoDUqunLgASVwDgFnQOlatdno0wy+gaQU54JXuVRQ1/wm8u239c/Ct2A7yiQBbrTpj8Odc7a5ruuCJtzLaW66739lrKX34JcttXmbyF3s6RVxKc9b7zaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpZ2A0Im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIkRyudi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBCI9KK1157964
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btLod8KCgkBXOYqTjWmzuMKs
	QAf2aBCvMBzErO4K4TE=; b=LpZ2A0Im30d/BwRmSbP6H5Jptei5ci3P4+4h0kFX
	kDgFjAPbFdBNc2Zh+N2rVLOFibTo7YJpaLzh44nLlFUdiBwTvrLRn0JFMQPmZyzc
	4eNO0vOJJfyqV/RItGDYt932buh9WhGXeE5s8u7YEbSarzBM1IMlEFJd4e0k+5Jo
	47ppOGbQ51EOAtNSQEYuxzKnLJLQ5dlxq4sJqehwnHJC/OkO6w+qLjSrhyKL9HnR
	blMBGZ0o9X9bruZHhlJ1z05upd3S5/jdDRJR5lGsZL1aersQI7iREEnGys8Ipofz
	QI+mgvuND7cewc3RDL4w6jGx04UWQ82tpRjL8REz0o+qsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aym5823tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:38:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1b7686f0fso2147871cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765460286; x=1766065086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=btLod8KCgkBXOYqTjWmzuMKsQAf2aBCvMBzErO4K4TE=;
        b=dIkRyudiC+99oveRtJ6/wDsNCsjH4MM1Y32JE3lwOWBUbuO2w7kG0p6Kjmju2OUTEw
         UrH045oH68Xgu/OkxKSi8k9VQFVf0xQvHWkSHiBNF8HJKGnozhmzKOcm6msU3hYkmpe7
         cgk7uMlCDAdT27YWnh8HJad163lJxN1vXBGz9UPOEDqtX7IDaF+HTTxvDsSrDXs/zNgJ
         E2aRTatQgC/ZOwwETMfpyArBs+aADnJfEDy7w3f/f2zqXwwL3eSMbuqBGpuL+rPXLm8C
         jdLlzBY55Ld5+cO5hQizDa/y1JUHBv9MQLOSjFXekYsm6llfXUYdeS6hGi+1m3G0NJ7p
         PUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765460286; x=1766065086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btLod8KCgkBXOYqTjWmzuMKsQAf2aBCvMBzErO4K4TE=;
        b=MC3uZodEMMi2na7RsZooLhWJyrd1RaK08Fkye5T+dsYM/LqBlaARS8vk3bISybh0+D
         5vRUNUOwZwbYWppBr7kpdO9Dlp6r7WmEL95qAsz40FL7wGetCyXt1Zz6puEvqFZbm5ZT
         fQGwwOi2eNcAxRMdZQaL6WdYAFGW+g6Rsdw8BuKrJ/2kMJZVHhYpDR90Siz6H/FmQItq
         pQeZ8tZD3hOYLq0cHsOucrJRuwA1RAWoUnSMaHA+c0Y12wm3Aj4jiBzcogYpC2TXh9Oq
         uG5BuU7bCxXOrf8DGZ0HfjwpLLjZlZwSv3kDTvEU2OXnBhH5G0psFlnNw4Sd5vlkFTc7
         Sv3g==
X-Forwarded-Encrypted: i=1; AJvYcCX8KJXiRLRu1wIUFChsKJugZez42PKex1Ku95vb/jphYHhdNuXpRD2Ms/hVNl5r1CTVQYKtn54p+ZIu29Wm@vger.kernel.org
X-Gm-Message-State: AOJu0YyLbS13ooqP+FYLM91CiHHEFEyhC+LDbI+7yGF8Q2DJwzk7IK+w
	HSogMQuSfdFG7gtNQG3Qzz13rLyQX2HB0JjwU5WBDdnz8vNbeOrifMjH6TF52fzIRoUHY0BSuZD
	N2slETcRLcW7LgjxUUhTq706q3ikd8/SHQVi1BYLsA+USsMDL9XaXcrGWkNekYDiUXzPT
X-Gm-Gg: AY/fxX5U/IS4B50KqaigmuuiPA39zlY2xqaWaKIvrBEfDfyBRCl5MQCnnrav0RLcuy4
	tW4rpFVOGOvIxvt2ip0/xLM7cyBmZ7qExP65xbime+gXeSTibOIra3gijyZZYrNl37tmHzK8bkg
	vbYeybTwibfJA8TtUsTQohrfkngo2txouDnrYfHAJLENRV46DmS8egW1yHkRu8c9EOE4tp25mda
	IcdH3/fe+e2flcgCAlkWd4wjbjYqAH7t+xWolFmcWviNuhNHgNhfAOZfQBbQic9CgrUjrQWw0mu
	qaYAmxjLQ8uU57O0cu1TiKQdJbIuytEo+QYQYgbvvTaAcwTJzFtralSSa0o/PVHXMcR82TAuNPc
	8uGGQm/xnk71dSvhHUio3fWf5uy6Y3iw4tHgEuWRIrkEgmq7VQLD6G5INzbFPCI7YMTDxaumTkn
	HE4KbHe70lwze2nmD6H/7hFTg=
X-Received: by 2002:a05:622a:1b0e:b0:4ed:b06b:d67d with SMTP id d75a77b69052e-4f1b1b1043bmr71990141cf.45.1765460286346;
        Thu, 11 Dec 2025 05:38:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGLMRbYCtIrZPo/kO5PieMuTFgJ9ZqVY/bcxiT2+sHAFaHudjyECVU1VHo5NCBj34tieLBKg==
X-Received: by 2002:a05:622a:1b0e:b0:4ed:b06b:d67d with SMTP id d75a77b69052e-4f1b1b1043bmr71989591cf.45.1765460285835;
        Thu, 11 Dec 2025 05:38:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f379dfsm870083e87.9.2025.12.11.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:38:05 -0800 (PST)
Date: Thu, 11 Dec 2025 15:38:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v6 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <iweswdjn6owhotezqdrdk5q7c4npazw5mb4zgurpfc3kb4d27b@fdywmzmvbn6d>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-4-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211100933.1285093-4-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-GUID: VW_cpfMvzBHdpSx8nLpbrw8SGiBRyg_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNiBTYWx0ZWRfX07oOx3DVtN84
 kAYTQDrE9Cy9lucf9FE+SQv8ehseoIpyZsoiZeh63CxOi18YgTvItujAC+zaOPv08FpvLxGrIuz
 B24V5gU1fw1K0CHqoEM+4T3kQOP7QVgzxKrGpJ8XUAxzs6t32BXJaBuyyz2uHsMsPPYmyTvkrc8
 qnCGFIn9jdjlU9lW2c9rX/H6pG4NCjJ3bCj5YOqFKASZCXI09wDAmwbGa572pScoPuIZZeBd28W
 1o1qkZx+bbh3GHXkXqLoQ7x78Hqgs1gY0ZerAjkXBpVCQ23xcXwW19QS8ql4ZukgW8rn0qFg56u
 xv8DTiZlqiaq9Nz7prVmtCUMVe6nyg8jnX6CFcJRlAL53VP/hTXI9fku3MZutwKZMDm/h/ZtiF4
 uoxwM+JzhRit/rodrWZK/cyvewxTiw==
X-Authority-Analysis: v=2.4 cv=FYU6BZ+6 c=1 sm=1 tr=0 ts=693ac93f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7AOTrF8chGgiLGUaiC0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: VW_cpfMvzBHdpSx8nLpbrw8SGiBRyg_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110106

On Thu, Dec 11, 2025 at 03:39:32PM +0530, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 via OF matching on the fastrpc
> node; otherwise, default to legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 61 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 53 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index eb9501fe79bc..af92876f1cc1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/bits.h>
>  
>  #define ADSP_DOMAIN_ID (0)
>  #define MDSP_DOMAIN_ID (1)
> @@ -33,7 +34,6 @@
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
>  #define FASTRPC_MAX_CRCLIST	64
> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> @@ -105,6 +105,23 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Extract SMMU PA from consolidated IOVA */
> +static inline dma_addr_t fastrpc_ipa_to_dma_addr(dma_addr_t iova, u32 sid_pos)
> +{
> +	if (!sid_pos)
> +		return 0;
> +	return iova & GENMASK_ULL(sid_pos - 1, 0);
> +}
> +
> +/*
> + * Prepare the consolidated iova to send to DSP by prepending the SID
> + * to smmu PA at the appropriate position
> + */
> +static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
> +{
> +	return sid << sid_pos;
> +}
> +
>  struct fastrpc_phy_page {
>  	dma_addr_t addr;	/* dma address */
>  	u64 size;		/* size of contiguous region */
> @@ -257,6 +274,10 @@ struct fastrpc_session_ctx {
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
> @@ -278,6 +299,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	const struct fastrpc_soc_data *soc_data;
>  };
>  
>  struct fastrpc_device {
> @@ -390,7 +412,8 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->dma_addr));
> +			  fastrpc_ipa_to_dma_addr(buf->dma_addr,
> +						  buf->fl->cctx->soc_data->sid_pos));

fastrpc_ipa_to_dma_addr(fl->ccxtx, buf->dma_addr)

>  	kfree(buf);
>  }
>  
> @@ -440,7 +463,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += fastrpc_compute_sid_offset(fl->sctx->sid,
> +							    fl->cctx->soc_data->sid_pos);

fastrpc_sid_offset(fl->cctx, fl->sctx)

>  
>  	return 0;
>  }
> @@ -685,7 +709,9 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> +			      fastrpc_ipa_to_dma_addr(buffer->dma_addr,
> +						      buffer->fl->cctx->soc_data->sid_pos),
> +			      buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -734,7 +760,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->dma_addr), size);
> +				 fastrpc_ipa_to_dma_addr(buf->dma_addr,
> +							 buf->fl->cctx->soc_data->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -747,6 +774,12 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>  	.release = fastrpc_release,
>  };
>  
> +static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t sg_dma_addr)
> +{
> +	return sg_dma_addr + fastrpc_compute_sid_offset(fl->sctx->sid,
> +							fl->cctx->soc_data->sid_pos);
> +}
> +
>  static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  			      u64 len, u32 attr, struct fastrpc_map **ppmap)
>  {
> @@ -788,8 +821,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  	if (attr & FASTRPC_ATTR_SECUREMAP) {
>  		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
> -		map->dma_addr = sg_dma_address(map->table->sgl);
> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> +		map->dma_addr = fastrpc_compute_dma_addr(fl, sg_dma_address(map->table->sgl));
>  	}

Now you can drop curve brackets around.

>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)

-- 
With best wishes
Dmitry

