Return-Path: <linux-arm-msm+bounces-89254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6495CD27EFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93112304654B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3375D20B7ED;
	Thu, 15 Jan 2026 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgX+w7Ya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC751494C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503730; cv=none; b=CDRB4vlvLjFc4OyLWvIJ/nS7Ywjgs85fAksGxJ0JUydazj7Ogf/Vw69q2IaiUsA23T5CE0jzuk3+7VmSw4arTKu4Id9WuS+5SUypi4HXWyXcegsYaxv6L+GsSZmvckVXmvI0oj+7PKcgFlCB6CVhkZCpqzLd/zR/e4VGQhw/D64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503730; c=relaxed/simple;
	bh=cEYuY2nwSmF3nngV50RNePn1W3opmsLWtx/aK+S8ZpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oU4SYbj3B0EKzpP1GHEo53clWY6UF/uHvFrfSCc2RMqG72OgmjEEYp+7rNvd0vyDwifNa4+aPY0ptKyNGyGMmK8l0mBmZr3/IRit7hJtMRD/R0hxhlQnlBA3tdeE4F3QEzRyxitIEtM7l+dLgDneVpIK8vdXDOkQvFEnCH8aRUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgX+w7Ya; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5014b7de222so11133771cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503728; x=1769108528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vk2UXOqM9Kcx+mMxkNCtAlr2gfKKKvNS6oqXFgbFlQw=;
        b=FgX+w7Yas1L6B7bjKRuONWfShGe33kV4JmzZAyvuFhCQf8cAnPnYArpoUss3wNKPRq
         uzMt8bM6M4O8NwBtmGPLEl7BH61XioKu/sWMlA3UseC9ptyqhVIvVVd/Q9Sy3sXwg02M
         JYBRQvNkRZf47nzUb9x/CeHUKZHSKfLTcorZc4rZu8/iwFs2sfG0dYSSlhDwBQdpT81o
         Y4QILLyGuZgd4y2O2OmVVQnKxoq5PNCYVQaTaqRa7Ff5yAJ9v+mr2WDV+zvBCd+S3r2k
         HJVve+NNrEZ4aVGX/diC+wFU0TkAyje4sIQ0ICjSJ8bDGsw4Uc5tvhe9pk1dTQVolYSE
         O9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503728; x=1769108528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vk2UXOqM9Kcx+mMxkNCtAlr2gfKKKvNS6oqXFgbFlQw=;
        b=CCI5buMTtTKyZtqbNcjfirvPJk/bIacw+WkX9WlhrMV3S+XBLkm3y2CLr3KHk58G9R
         L7YZRHv4PF7vqWaQbcpd4FZXxBjWdt1cjfnfmrm4lbm9yXOqpcVjRMgVSwIKQ91O80J8
         0Z0jvOtpWhelVBOJtJV9iZpq3kiw2uarn0hV+RmbtBQa8J0NPJneTujRHu4McepdqLvX
         4QKiY6R+/CThQLIwi0ReP0qd3HmBmaQ3xJjeynybodduPiRRtdxddRW0UD+0mZ5KWUCl
         ao4tidjAmc+KH6YjDRuyUvdNDqCLk4iSzufIQ+vETDIvshY4DSkN8m8Rs5jYKbg+XyMQ
         R1/w==
X-Forwarded-Encrypted: i=1; AJvYcCUX2nipcvrV2FlPknC74zL3nHEYh44cKTEgHjTMR78UValslbQMBP2YSi0Irp621kmq3Xi/qWvX4pu5ejOH@vger.kernel.org
X-Gm-Message-State: AOJu0YysvhAz3OqF8i+8udK/s2PJdADQPA4NDEIDHbOfLZh+3yAxyhB9
	y2uHWHsbPcaDUCf3Tk2KbZ3bGvolAjAQUZwHmifl/GKWMNBQUOJHCTLu
X-Gm-Gg: AY/fxX5j8Fv/LIMNagQIQweHCcLJA+003ZW1ZT31yg2FaMD9thrzDwYICzFcLTZivtS
	hoEUqyDIibipvitKxYTjpOejMu3y+iS//ta3H/TKDHGjTlEKGkkwzLiYd2WKIH3UDmFoC27+tmM
	S5hEOx6AIqAa+jNjJfI+9AWAOSPhFG0ho4/3OiUBBdCCiR7Up7Ijhi7JMDlI4c/mERTIhrMBQfP
	Q7nNe2EtSMwGFDJtqh63HwXbLroEw7k+rjibvhm0iWbHxqc16pZAia+xk15ounGdfP9/DnZNFP9
	G6TARxrO2DRyEqALI8LLwQIFuuNLtoPVcwGj/+rPgzjEslGaGFtNyqWVbfM3bhP6UcL9+Ahhbn8
	G343lpdUTCsoHteY66bkGLAkF88F0FHP8tkvPowp7x5Jwf5SXLAb6Zrc5TpJ32x2nqBf5+RQiKZ
	Vo48jFEHa4GnZVhjeOAA0qnSzD
X-Received: by 2002:a05:622a:110e:b0:4f3:5652:6743 with SMTP id d75a77b69052e-502a17565b9mr8274571cf.39.1768503727274;
        Thu, 15 Jan 2026 11:02:07 -0800 (PST)
Received: from ?IPV6:2001:871:22a:693f::1ad1? ([2001:871:22a:693f::1ad1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ed3155sm2097251cf.19.2026.01.15.11.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 11:02:06 -0800 (PST)
Message-ID: <5cab0953-c2a3-4baa-af91-e9519afef092@gmail.com>
Date: Thu, 15 Jan 2026 20:02:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom: iommu: nullpointer dereference on boot on
 apq8064
To: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <569d7de2-cfcd-4d28-8bbf-14a0179f665e@gmail.com>
 <20260105180213.GG125261@ziepe.ca>
 <9a86120e-c0be-4ed5-a3de-cc7f164da154@arm.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <9a86120e-c0be-4ed5-a3de-cc7f164da154@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Robin,

On 1/6/26 7:50 PM, Robin Murphy wrote:
> On 2026-01-05 6:02 pm, Jason Gunthorpe wrote:
>> Though this looks really weird:
>>
>>          struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
>>          int sid;
>>
>>          if (list_empty(&(*iommu)->ctx_list)) {
>>                  master = kzalloc(sizeof(*master), GFP_ATOMIC);
>>
>> So maybe master is NULL and !list_empty()?
> 
> AFAICS that could happen if of_xlate has run once, and then for whatever
> reason dev->iommu is torn down and the whole process started from
> scratch a second time - although I'm struggling to see any obvious cause
> for that in the absence of any other visible errors or async probe
> races (and assuming that the IOMMUs on this platform ever actually
> worked at all, of course...)
> 
> However it certainly stands out as a bit wrong that of_xlate is touching
> the IOMMU instance itself - that should never have been expected to work
> well. Does the diff below help?
> 
> Thanks,
> Robin.
> 
> ----->8-----
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 819add75a665..e57780fc3287 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -360,14 +360,11 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
>  /* Must be called under msm_iommu_lock */
>  static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
>  {
> +    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>      struct msm_iommu_dev *iommu, *ret = NULL;
> -    struct msm_iommu_ctx_dev *master;
>  
>      list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
> -        master = list_first_entry(&iommu->ctx_list,
> -                      struct msm_iommu_ctx_dev,
> -                      list);
> -        if (master->of_node == dev->of_node) {
> +        if (iommu->dev->fwnode == fwspec->iommu_fwnode) {
>              ret = iommu;
>              break;
>          }
> @@ -378,6 +375,7 @@ static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
>  
>  static struct iommu_device *msm_iommu_probe_device(struct device *dev)
>  {
> +    struct msm_iommu_ctx_dev *master;
>      struct msm_iommu_dev *iommu;
>      unsigned long flags;
>  
> @@ -388,6 +386,8 @@ static struct iommu_device *msm_iommu_probe_device(struct device *dev)
>      if (!iommu)
>          return ERR_PTR(-ENODEV);
>  
> +    master = dev_iommu_priv_get(dev);
> +    list_add(&master->list, &iommu->ctx_list);
>      return &iommu->iommu;
>  }
>  
> @@ -604,14 +604,13 @@ static int insert_iommu_master(struct device *dev,
>      struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
>      int sid;
>  
> -    if (list_empty(&(*iommu)->ctx_list)) {
> +    if (!master) {
>          master = kzalloc(sizeof(*master), GFP_ATOMIC);
>          if (!master) {
>              dev_err(dev, "Failed to allocate iommu_master\n");
>              return -ENOMEM;
>          }
>          master->of_node = dev->of_node;
> -        list_add(&master->list, &(*iommu)->ctx_list);
>          dev_iommu_priv_set(dev, master);
>      }
>  

Sorry for taking so long until I got to trying it out.
The patch fixes the crash!

Cheers,
Christian


