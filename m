Return-Path: <linux-arm-msm+bounces-81851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E9FC5D0CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C02635790C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0645886329;
	Fri, 14 Nov 2025 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LS4UAqRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcCFEDgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4A8634F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122564; cv=none; b=CW2xGCEGnpV729lg588siKuYUlN1IuBmyQJVcv5i/n41PdIA/Bw2UtXmYA7lMI5zVZnNCdXokC06TJ1T6wkjxrQZM7vMFk+td3xqh3mqvL8X+gO9mBWHSGt8HQaq5VCJS3xox85sygigrPy9GFiOtmAHtGnqCu37XMpqNpqvebM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122564; c=relaxed/simple;
	bh=OpJEwvPXbAmmwYgFeEMtyKJzHmUVavsF5zW7Co102Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oH/oDMMS6Jiw4VGGob8AuMtFZlZv7Rp7x5Bz4/7OTrG3cQMmtB9TQZp1bnucCj6x/6tHDfxfh2fvDnlWwSygTfyE/D7po3qBTx6vH2j6N5aC5qshQKhCKETkxa7FO01gsTCIaaIaP5ET7wzxHrBlUUgIOTN20ZnGkwFddTZoeWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LS4UAqRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcCFEDgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8SEwH1616711
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pCmbcg3LAPGi8FbIray+zmr3
	/BYuaNe5Q0F/I9OQc7Y=; b=LS4UAqRJ5fo26W+P6JfZfI2cYmthiPIjZBrr4/HQ
	tHWdTzu22AnALOPyXwPX4CvpiT7rwS/uSwyJAbxnnRxCJKJ8sJU0ZIoMcRNfFbz8
	FBwjl7T74HcpQndaHzn0AEtvmuetJvtpJOFL8t9q0kOX279D1stg3lOAcJPSl0wG
	2dlv2b72/U8SCe/s09ZWYk64KYK8I+eGf/lbIb+GfIUQx6tCBPigw7cM+cnatZnW
	8IqMcfwJnWSWI4+670hsdL5c0ABG96HD5WVpYL3x4R6tVEb8UlUoAGQamTndsZfq
	irlYqIoKuoABRGXbcb+CqcrjOH2GyDDmLkmfH4LB7X9g0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h231v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:16:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso81561181cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763122561; x=1763727361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCmbcg3LAPGi8FbIray+zmr3/BYuaNe5Q0F/I9OQc7Y=;
        b=HcCFEDgW7WCByJ1slldJlhXdB1yYVqiZ+Mm6hK62b2uU+FLR01AEJRiocnATQVk3Tt
         fHcRted9jF3JHvwP3OHi2s57h0SoQT2GATTdv0RVmajZzYy24OiYPK/KQPxESZwV8BHe
         byLjRBJuXPTIm2LZNHzlxN0qVZrgbEATZw9Zu3v3TZc9AXFX9QduJd/Ldt73MyYb2Owg
         aLQRxi62DnPj0n9znIPrI9tfoAkcX1pKqbtR1aqepkxAFDf4t914Xz3/08cTKyhrk0eL
         M1ijYD89t3c1gWqgy3L1HTdnnud3VdnfWs75eNn1xhEvwBmMJf3JVI9cZluGjGpWH+Pf
         r0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122561; x=1763727361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCmbcg3LAPGi8FbIray+zmr3/BYuaNe5Q0F/I9OQc7Y=;
        b=X7gs4k1BzupMW2+rDLSakpv5AowUq3KclDu9+wOJVi8uJKdpjXsFZ0sir84evecI6c
         bfp69OcanNi8Htmd7ukn/72eT9yB6GG3ys7hTYz03xnFVmUW9vqFiR7iaG+Me0gksvLw
         xzBeV9Z9M6RMbRyR2RHlgonQaO6fJq+Lgc76Tcw/TjaFONOmMb5W9jdRpfyzngXOyjXR
         6qpRAI0QPlsudtE40C9fphBw3L28ljQpyT9lX1wjik97SfV4RzkCkyDYeZBK0pgniN6p
         glrkAKnd2/xARPqP8hQGh6onGmMTcTePLXlbgWRUrXBFJu5qeCrT8fMPY1U0y6jGYSkn
         iEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5nnj0iHMQWjWVSF5pgHDMWaCsPGQf2+v4EHgwmRcENx+nisotaDlI2OkFDYB3pKxsgmIlgpDRNvuiGn3b@vger.kernel.org
X-Gm-Message-State: AOJu0YyvgP2Vre6yCfNqHXfzdO6DSClwteNlJ+n4YcxkrNT5qaihJLG9
	Z9byUYo6TtfJI9wRZu9hMFKU357AwVKC8QyS9C3F3dPQP0gq/MLNxO/5vadg5lNuMzy8PlfQwEG
	Lu2CRGWp0LsdIj3gyW5zMNh5tK3eZsdn/w1PvuBr0ymDrFwgogjZJ2Rx58YM7fnDbYnYv
X-Gm-Gg: ASbGnctxhPb/DA5/qz0DwUVkfub9sR9qCp7Dvpcqwy7HbLXxH022TI59OgNLwFJm04S
	Ymvng2VnaD009YKUVz8I7WOt6W1S63RR6H27ZpIpf+hrpYd4SdlZHWOdRVxV/bImtvvcHuDXnfz
	/VhQbriN+cp7ANvJUnwqhjSRpVByntv8ZYvfT8qnbUBVYiY1J1jMpBLPP1GVlgIzhOEw9FSmYYx
	c8xIL2CF4oKBPdu6B30ojL+pATXrGx505XoPMY+Yn/zwKRWNDtz3W70fMYKzgt9Ll12MpaHyZ+G
	hlEECVD1vrVKwfkJzKm1+J8E94wKWhZ27CJeK75LCXd+KJAGhFFcaXkuXXlaAjhvuno0sEgltGP
	IJyq5vgjLYY/qTLdcVapEkq8EWXwZP6+LGfZqTI7HVtoJUZd8iDe0U2XNIYcBgiVU0v0JxphLuX
	Lgs9+i0C2z7B0c
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ede6fa96a4mr81879031cf.4.1763122560976;
        Fri, 14 Nov 2025 04:16:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQd4aG1xDfsAJw7sJ7+Tewd/JzAQtliNZJqV7KBIy+CuymL/YuPm4aJvSN5Pyi0H9ikNZH7g==
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ede6fa96a4mr81878471cf.4.1763122560349;
        Fri, 14 Nov 2025 04:16:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040025dsm1032684e87.53.2025.11.14.04.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:15:59 -0800 (PST)
Date: Fri, 14 Nov 2025 14:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <cjuzht6hfzmog7xkwbydisl67iuttdo2jy5hndnruzeu3hp22g@dergmterq2an>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Is_XekkJg-5ZEo5hnFeT86c_2P-sxnaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NyBTYWx0ZWRfXxZSRPpjrD/ye
 XuX4tM0zqjYAMbPzG1HYauT7x6QY/lKgBj2+pTnK7ORuqDxsP1iWZp9vojbbZc4T3PhPdRk41hl
 BI0aA9j51+wuVNmt/jlbnDLv/EYBUv9+6wp0xok9LJe1mtigDmGmhEgHvQFpl2rWQL3dfA/qxWC
 B5CQ4mt+0lS4Xv6QLpATJH2Rlc8O4hNCDzPWokHmBDVFPwq8nYNrPN8jgcjNWsUxB2uheBEIEqG
 Nj18TP7j63/CNSJsC8aMN1tlHKSHKyDLSYWPKbcEdJMlj1rGc6ksMHWTzhCz1MLKid7HxVmDNST
 1l+TNNsxNLJkhp1C3wN0F4Pm41DzElp26ItW2YrZgtH6TAGUx7ldXlAJD5SpB2C0tkGNzbrjHyi
 glBAN7o8AAkeSQ1PbxNt5u3pjG3REw==
X-Proofpoint-GUID: Is_XekkJg-5ZEo5hnFeT86c_2P-sxnaP
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69171d81 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fBhghDEW5YtqNLni8jIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140097

On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
> Update all references of buf->phys and map->phys to buf->dma_addr and
> map->dma_addr to accurately represent that these fields store DMA
> addresses, not physical addresses. This change improves code clarity
> and aligns with kernel conventions for dma_addr_t usage.

Why do you mention dma_addr_t here?

> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..d6a7960fe716 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -106,7 +106,7 @@
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
>  struct fastrpc_phy_page {
> -	u64 addr;		/* physical address */
> +	u64 addr;		/* physical or dma address */

What is the difference here? Aren't all of them DMA addresses?

>  	u64 size;		/* size of contiguous region */
>  };
>  
> @@ -171,7 +171,7 @@ struct fastrpc_msg {
>  	u64 ctx;		/* invoke caller context */
>  	u32 handle;	/* handle to invoke */
>  	u32 sc;		/* scalars structure describing the data */
> -	u64 addr;		/* physical address */
> +	u64 addr;		/* physical or dma address */
>  	u64 size;		/* size of contiguous region */
>  };
>  
> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>  	struct dma_buf *dmabuf;
>  	struct device *dev;
>  	void *virt;
> -	u64 phys;
> +	u64 dma_addr;
>  	u64 size;
>  	/* Lock for dma buf attachments */
>  	struct mutex lock;
> @@ -217,7 +217,7 @@ struct fastrpc_map {
>  	struct dma_buf *buf;
>  	struct sg_table *table;
>  	struct dma_buf_attachment *attach;
> -	u64 phys;
> +	u64 dma_addr;
>  	u64 size;
>  	void *va;
>  	u64 len;
> @@ -320,11 +320,12 @@ static void fastrpc_free_map(struct kref *ref)
>  
>  			perm.vmid = QCOM_SCM_VMID_HLOS;
>  			perm.perm = QCOM_SCM_PERM_RWX;
> -			err = qcom_scm_assign_mem(map->phys, map->len,
> +			err = qcom_scm_assign_mem(map->dma_addr, map->len,
>  				&src_perms, &perm, 1);
>  			if (err) {
> -				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> -						map->phys, map->len, err);
> +				dev_err(map->fl->sctx->dev,
> +					"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
> +					map->dma_addr, map->len, err);
>  				return;
>  			}
>  		}
> @@ -389,7 +390,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->phys));
> +			  FASTRPC_PHYS(buf->dma_addr));
>  	kfree(buf);
>  }
>  
> @@ -408,12 +409,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  
>  	buf->fl = fl;
>  	buf->virt = NULL;
> -	buf->phys = 0;
> +	buf->dma_addr = 0;
>  	buf->size = size;
>  	buf->dev = dev;
>  	buf->raddr = 0;
>  
> -	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
> +	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->dma_addr,
>  				       GFP_KERNEL);
>  	if (!buf->virt) {
>  		mutex_destroy(&buf->lock);
> @@ -439,7 +440,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->phys += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>  
>  	return 0;
>  }
> @@ -684,7 +685,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -733,7 +734,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->phys), size);
> +				 FASTRPC_PHYS(buf->dma_addr), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -785,10 +786,10 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  	map->table = table;
>  
>  	if (attr & FASTRPC_ATTR_SECUREMAP) {
> -		map->phys = sg_phys(map->table->sgl);
> +		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
> -		map->phys = sg_dma_address(map->table->sgl);
> -		map->phys += ((u64)fl->sctx->sid << 32);
> +		map->dma_addr = sg_dma_address(map->table->sgl);
> +		map->dma_addr += ((u64)fl->sctx->sid << 32);
>  	}
>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)
> @@ -815,10 +816,11 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
>  		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
>  		map->attr = attr;
> -		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms, dst_perms, 2);
> +		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, dst_perms, 2);
>  		if (err) {
> -			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
> -					map->phys, map->len, err);
> +			dev_err(sess->dev,
> +				"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
> +				map->dma_addr, map->len, err);
>  			goto map_err;
>  		}
>  	}
> @@ -1009,7 +1011,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  			struct vm_area_struct *vma = NULL;
>  
>  			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
> -			pages[i].addr = ctx->maps[i]->phys;
> +			pages[i].addr = ctx->maps[i]->dma_addr;
>  
>  			mmap_read_lock(current->mm);
>  			vma = find_vma(current->mm, ctx->args[i].ptr);
> @@ -1036,7 +1038,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  				goto bail;
>  
>  			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
> -			pages[i].addr = ctx->buf->phys -
> +			pages[i].addr = ctx->buf->dma_addr -
>  					ctx->olaps[oix].offset +
>  					(pkt_size - rlen);
>  			pages[i].addr = pages[i].addr &	PAGE_MASK;
> @@ -1068,7 +1070,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  		list[i].num = ctx->args[i].length ? 1 : 0;
>  		list[i].pgidx = i;
>  		if (ctx->maps[i]) {
> -			pages[i].addr = ctx->maps[i]->phys;
> +			pages[i].addr = ctx->maps[i]->dma_addr;
>  			pages[i].size = ctx->maps[i]->size;
>  		}
>  		rpra[i].dma.fd = ctx->args[i].fd;
> @@ -1150,7 +1152,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  	msg->ctx = ctx->ctxid | fl->pd;
>  	msg->handle = handle;
>  	msg->sc = ctx->sc;
> -	msg->addr = ctx->buf ? ctx->buf->phys : 0;
> +	msg->addr = ctx->buf ? ctx->buf->dma_addr : 0;
>  	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
>  	fastrpc_context_get(ctx);
>  
> @@ -1306,13 +1308,14 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		if (fl->cctx->vmcount) {
>  			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
> +			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>  							(u64)fl->cctx->remote_heap->size,
>  							&src_perms,
>  							fl->cctx->vmperms, fl->cctx->vmcount);
>  			if (err) {
> -				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
> -					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> +				dev_err(fl->sctx->dev,
> +					"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
> +					fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>  				goto err_map;
>  			}
>  			scm_done = true;
> @@ -1332,7 +1335,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->phys;
> +	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>  	pages[0].size = fl->cctx->remote_heap->size;
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
> @@ -1361,12 +1364,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>  		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
> +		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>  						(u64)fl->cctx->remote_heap->size,
>  						&src_perms, &dst_perms, 1);
>  		if (err)
> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> -				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> +			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
> +				fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>  	}
>  err_map:
>  	fastrpc_buf_free(fl->cctx->remote_heap);
> @@ -1455,7 +1458,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	args[2].length = inbuf.filelen;
>  	args[2].fd = init.filefd;
>  
> -	pages[0].addr = imem->phys;
> +	pages[0].addr = imem->dma_addr;
>  	pages[0].size = imem->size;
>  
>  	args[3].ptr = (u64)(uintptr_t) pages;
> @@ -1913,7 +1916,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> -	pages.addr = buf->phys;
> +	pages.addr = buf->dma_addr;
>  	pages.size = buf->size;
>  
>  	args[1].ptr = (u64) (uintptr_t) &pages;
> @@ -1941,11 +1944,12 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
>  		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
>  			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
>  		if (err) {
> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> -					buf->phys, buf->size, err);
> +			dev_err(fl->sctx->dev,
> +				"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d",
> +				buf->dma_addr, buf->size, err);
>  			goto err_assign;
>  		}
>  	}
> @@ -2059,7 +2063,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> -	pages.addr = map->phys;
> +	pages.addr = map->dma_addr;
>  	pages.size = map->len;
>  
>  	args[1].ptr = (u64) (uintptr_t) &pages;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

