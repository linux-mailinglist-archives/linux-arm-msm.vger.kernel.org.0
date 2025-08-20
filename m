Return-Path: <linux-arm-msm+bounces-69968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3A8B2DBE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49AC71C2026D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829892E7185;
	Wed, 20 Aug 2025 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLFv2aUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F13E2DA775
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691032; cv=none; b=OLNqn6dhfJHbb38UeOedhrRGQ6Hg0C1mO632rKkN5J1HhgW74UPVVG0SNLXKzpmPUl7iYwOEXE6NVhb/LHrZui+ckyGenrhp3t/GbPNTbJbsIARPp2cVyjR0thn2h+R3G5JDFvHnrw4g49//axFdeVODABNirquFsBeuT9b+dWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691032; c=relaxed/simple;
	bh=MdXvEGUlF+n8ryFQ99C80E+lYa90eWEkDy55qF35DEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0WbLc4YOH2dC6ImfoVP8FsNu2T7ooaRHe/DdYPNsihpgezShQQuLHuTkxXiDtv4jXbv5hIbnzAqvcYSnI0OgrHwhezzPZmjFcb2Y0mbE6H5ofog63xve3tA5knO74C8kfqd6+MLdMYC5Waxk6ReEARek6+SMo8/AhgKyKvXbu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLFv2aUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9mLF8028414
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WL/Xm08fnbolOt4DQL6QmgRm
	5doY4ltEHzlZh9Hc+Dg=; b=OLFv2aUrtQLfk2gVSlIpxbdoUaJ65vL4+HdsTLep
	jGkxuCUi4ioAorx6n0g52RTVBQzNK7O4NPPYqrQE647PNI4iaDRFjun8lpMEcBHH
	+wfvc/Mgp6MJj8voxmqYNnm7nHeEFu2EstP7/gRQgBJSof+6SS6fbpU5AfAWZrDY
	8o392B5dXJiZp38OIaGrIJEeG4co4F8EoAlzo7tdJRAO/RS5DCeCoZigIkl9LULd
	rI18nQY2Kv3ESk2CTDymfbLmMedwozQznMQhsjSEtYkheNaH/b4gmq/oggKGImKq
	f4fgjfX2e7Y00lPwb7c9flcvOGl1CFG6VdHGpLwRhzPY4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52asjkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:57:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so11878861a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755691028; x=1756295828;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WL/Xm08fnbolOt4DQL6QmgRm5doY4ltEHzlZh9Hc+Dg=;
        b=J6etoSxW+glFhCbDKjArotKZ44b5C5Cke6zZycx3qj1zf4qL9A1uaF5FHNtWjxb/PO
         GMIsWKLlGYqo/UPJ9l7BCfbjQCI7sEVBfIpsU4iYOj2tq2iC6mCEKtRkHHU/kImahQJR
         8hP5X787zQJYAJXNyyNpbz7zgQi1wWwJwReVrwLXDNqd80okfKsVGj6TW7wKjXT4EQ78
         +6f5lL0vV5k95P/BJENWhxZMcuDmn5ascODrLR2S3A+H0PwYUTKhz45y1LwzzQgJzhzg
         XT/n/UjIDTpOb1BHqZAAhJ4qaw+9s67iKuMIbTXrFotB/tnLZGBLiv1i1waW6xzuVqns
         4SEw==
X-Forwarded-Encrypted: i=1; AJvYcCXSPsUox1iuev6QWyoawoUo7gVremV4rG6irpn2Yelbnf+xC2yr76NSpioL9maILzienOerJYowGwfmFaFa@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhCzlhL45x8c/9ynaEj4xgmet3VOGO2f8HVMMfAKh+1DcRSLI
	tB7JcKIVtK3PWn3jhnau0zcBIWSiFR5+rS29WUbrNQT68BHkTedocwHOPzraU8maBv8xCwfOknu
	FUl2fpDNHC3tJol6DOZsmqbTljd+1TtHlJHEbNuOPweYEGqbRBwR7+RIbHSptjf3vNPkn
X-Gm-Gg: ASbGncvSOGy5QG9CZRU/9rvVlzUOx4xm5efZmWbyOwDxS7VnrR+jCiBPWCMucTjAXOS
	H2p9nLATokcvLvhquWxNpW51mqjSGLZyvknf3NSZMiwpcszP8DRPFxVmDyF92QBy6yJZlQK635l
	ipeI16bGW7dquCK+bOg+rgXsU0aQ/F2uH1JsG4R3QdJQdA2g7MC3l05b8O57U18P53ZjgaMq9/j
	Oaf3G34wXVoKz5evZlztLp+TW97iHl0WFgpflhDaa69wdBAD7PALNh5Ji4luLUJATTXxrkDCfpr
	EhzhWW7QS9cRM6ML15O5xry7IxdYTDTurYUIls8pdZBknXPUIymRSV/ypmVVRAojGDQ=
X-Received: by 2002:a05:6a20:7287:b0:240:1b13:4585 with SMTP id adf61e73a8af0-2431b734646mr4107642637.7.1755691027589;
        Wed, 20 Aug 2025 04:57:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUOzfBbkSUg+oD4UvHrn8spNnQv4XrWKnytbK57ZJHF5NmQFkbxyfMFEw0SZzBsOMq88jM+Q==
X-Received: by 2002:a05:6a20:7287:b0:240:1b13:4585 with SMTP id adf61e73a8af0-2431b734646mr4107599637.7.1755691027024;
        Wed, 20 Aug 2025 04:57:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3047sm2106760a12.17.2025.08.20.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:57:06 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:26:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKWLZwYVPJBABhRI@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2Iiz0+i43uQD
 LuHTdrP8gU+sxjmMxSZOKP7EzN797ioHKn0m4GwjZO+MpNl/DTbcUdeGDAkvNytLwbww05GjuLs
 apRspNo3dCuRRR2aS4K7X/Hw2+1em/W9oOlkpqFGBXxEQ7F11cDEQ1f3M3JzfKIESiBhdighbTf
 kLYgugTZ94lGToTD5xvCC/mHkA3ty50tO4M3F6vfeUWkcS2/6oI5L5voiYWDJg2TE+xTbME5Q1S
 Shbtul/RWOXlRxyt+6LLB5TPsQx/5ZBi5Z13r2LlJtGyO4yffWcG6sHl3cNV1KP0F9VA3hcN+9K
 /HR2OGFNkXMEZePWZ3nF5UgEPue2BHxlDfmegCvNmJ1j9GGH3AAANOkF9pNpJS+B23rbYwxyUEO
 6zw1FY5Ne0hPQzoWZwYGzWIOwpEuJw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a5b815 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ei57np4bDWK_HlyllzEA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aua28fKgyC6ysZPrYSO8gXqM0w2wPq7-
X-Proofpoint-GUID: aua28fKgyC6ysZPrYSO8gXqM0w2wPq7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 10:46:31AM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 10:24:46PM +0530, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via the device tree.
> > 
> > Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.c  |   9 +-
> >  drivers/media/platform/qcom/iris/iris_core.h  |   6 +
> >  .../media/platform/qcom/iris/iris_firmware.c  | 156 ++++++++++++++++--
> >  .../media/platform/qcom/iris/iris_firmware.h  |   2 +
> >  4 files changed, 155 insertions(+), 18 deletions(-)
> > 
> > [...]
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index f1b5cd56db32..e3f2fe5c9d7a 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -3,10 +3,18 @@
> >   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >   */
> >  
> > +#include <linux/device.h>
> >  #include <linux/firmware.h>
> > -#include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/kernel.h>
> > +#include <linux/iommu.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of_device.h>
> > +#include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/sizes.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> >  
> >  #include "iris_core.h"
> > @@ -17,15 +25,14 @@
> >  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >  {
> >  	u32 pas_id = core->iris_platform_data->pas_id;
> > +	struct qcom_scm_pas_ctx *ctx;
> >  	const struct firmware *firmware = NULL;
> >  	struct device *dev = core->dev;
> > -	struct reserved_mem *rmem;
> > -	struct device_node *node;
> > -	phys_addr_t mem_phys;
> > -	size_t res_size;
> > -	ssize_t fw_size;
> > -	void *mem_virt;
> > -	int ret;
> > +	struct reserved_mem *rmem = NULL;
> > +	struct device_node *node = NULL;
> > +	ssize_t fw_size = 0;
> > +	void *mem_virt = NULL;
> > +	int ret = 0;
> >  
> >  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> >  		return -EINVAL;
> > @@ -39,36 +46,64 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >  	if (!rmem)
> >  		return -EINVAL;
> >  
> > -	mem_phys = rmem->base;
> > -	res_size = rmem->size;
> > +	if (core->has_iommu)
> > +		dev = core->fw.dev;
> >  
> > +	ctx = qcom_scm_pas_ctx_init(dev, pas_id, rmem->base, rmem->size, false);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	ctx->has_iommu = core->has_iommu;
> >  	ret = request_firmware(&firmware, fw_name, dev);
> >  	if (ret)
> >  		return ret;
> >  
> >  	fw_size = qcom_mdt_get_size(firmware);
> > -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> > +	if (fw_size < 0 || rmem->size < (size_t)fw_size) {
> >  		ret = -EINVAL;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > +	mem_virt = memremap(rmem->base, rmem->size, MEMREMAP_WC);
> >  	if (!mem_virt) {
> >  		ret = -ENOMEM;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> > +	ret = qcom_mdt_pas_load(ctx, firmware, fw_name, mem_virt, NULL);
> >  	if (ret)
> >  		goto err_mem_unmap;
> >  
> > -	ret = qcom_scm_pas_auth_and_reset(pas_id);
> > +	if (core->has_iommu) {
> > +		ret = iommu_map(core->fw.iommu_domain, 0, rmem->base, rmem->size,
> > +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> 
> What is the use case for IOMMU_PRIV here? You don't have this flag for
> the qcom_q6v5_pas change.

This is there for historic regions, I may not have complete information about why
is it required but the reference is taken from venus support for chrome.

 
> > +		if (ret)
> > +			goto err_mem_unmap;
> > +
> > +		/*
> > +		 * Firmware has no support for resource table for now, so, lets
> > +		 * pass NULL and zero for input resource table and input resource
> > +		 * table respectively.
> > +		 */
> > +		ret = qcom_mdt_pas_map_devmem_rscs(ctx, core->fw.iommu_domain, NULL, 0);
> > +		if (ret)
> > +			goto err_unmap_carveout;
> > +	}
> > +
> > +	ret = qcom_scm_pas_prepare_and_auth_reset(ctx);
> >  	if (ret)
> > -		goto err_mem_unmap;
> > +		goto err_unmap_devmem_rscs;
> > +
> > +	core->fw.ctx = ctx;
> >  
> >  	return ret;
> >  
> > +err_unmap_devmem_rscs:
> > +	if (core->has_iommu)
> > +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> > +err_unmap_carveout:
> > +	if (core->has_iommu)
> > +		iommu_unmap(core->fw.iommu_domain, 0, rmem->size);
> >  err_mem_unmap:
> >  	memunmap(mem_virt);
> >  err_release_fw:
> > @@ -109,10 +144,97 @@ int iris_fw_load(struct iris_core *core)
> >  
> >  int iris_fw_unload(struct iris_core *core)
> >  {
> > -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > +	struct qcom_scm_pas_ctx *ctx;
> > +	int ret;
> > +
> > +	ctx = core->fw.ctx;
> > +	ret = qcom_scm_pas_shutdown(ctx->peripheral);
> > +	if (core->has_iommu) {
> > +		iommu_unmap(core->fw.iommu_domain, 0, ctx->mem_size);
> > +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> > +	}
> > +
> > +	return ret;
> >  }
> >  
> >  int iris_set_hw_state(struct iris_core *core, bool resume)
> >  {
> >  	return qcom_scm_set_remote_state(resume, 0);
> >  }
> > +
> > +int iris_fw_init(struct iris_core *core)
> > +{
> > +	struct platform_device_info info;
> > +	struct iommu_domain *iommu_dom;
> > +	struct platform_device *pdev;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > +	if (!np)
> > +		return 0;
> 
> You need a dt-bindings change for this as well. This is documented only
> for Venus.

You are right, wanted to send device tree and binding support separately.
But if required, will add with the series in the next version.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

