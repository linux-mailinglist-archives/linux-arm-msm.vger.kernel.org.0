Return-Path: <linux-arm-msm+bounces-84697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E4CADCBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 18:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9C7B3018318
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 17:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2043258CDA;
	Mon,  8 Dec 2025 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rdy7g9GF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kq24V1Ym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAC922AE45
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765213276; cv=none; b=uJPZlzv6bqXkXdliWgAUiqamSI0F6bFXEkxyfhvNdJIZKXIODTw2K6TBlEqMSrNjfEsp5XkqBap8jIDy3SkkgTPMxrlWwgw2Dr9+woiYva+cAvMi6kTjUiOVfOsS1UzEzEBfshwzG/muH5DI6o7j2xE2N2m0y3HdVKLbUN5jjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765213276; c=relaxed/simple;
	bh=hSjEHJHJfe4hQKojmhGLqtPV+OqU9VLeIk3tEGl4Phw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTSVpGJljzWQCC54EoiJk3SzUHGqpJm+pndP3uK5fiL+PqmglfWxTTJLJ4TqeIO/Gt2LUULHF1dFAgON33qqVXXbDy1wFpGqYNFG+18JN2yXuC/Oorw5Tukcsqx0RER8rbbE5cl2lsT248x0pyP+0aDJPxd4Fuc2fQxFFnPY5ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rdy7g9GF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kq24V1Ym; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B89F8Hu3863015
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 17:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eCB9rKt0bxBUYqdLGfWOYnLi
	2W4YvD8volkGTkyVspI=; b=Rdy7g9GFXzpNGbHbxxsTk721cXtTLq89k8+3KP5i
	SpkpeLOX/BNdUdWTt6bAnONP3fB+7PD6X+1waR8ahRljnvOjWDTyEuPcp26lmXQ2
	GUgeBo2MiOTUnvydYzl6uo+EWxHOxjI0aLoDB+vquigbnRe4IXwtdZo4E5FAtXUQ
	XzJz9NrFsYECZF9bCRUcUTyyIwTupgDSZ5frYwUR1Ef+3bmUp6uHMgjWURoWLPjk
	pOuEoxk7WWc/K00hYNvM0agZQ4Jyq3djrCJnB0jCHH01XGpRuO1jxAhOTCpcTbOs
	PFy8iPVeORNeAU+3CTKAy42SQfL7Kv8D6OmJUjGyN5N/iw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuvg1cjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 17:01:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bf222e5b54dso2670799a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765213273; x=1765818073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eCB9rKt0bxBUYqdLGfWOYnLi2W4YvD8volkGTkyVspI=;
        b=Kq24V1YmBt6C5wczje6zRjATpYs3NZLi8ruyXgXi5ioO8PR1Qno0oIyLtdEGr41uZW
         5vZvOaSi1aWvRTv6VrYnxkFf3QW3fL9CpxTQqVEpoErDsry5gtJjoNE9qSakVmEv63g+
         puf+zq/2KlbmuKi9yR3UwwOxgVkFwP0x2M8jljeg2miLYZ6mT0eScowZb7vDAb5UMPXf
         Sbeh3Iv4tqqiuSDL/wx5IrNmHiSlyoi6jPBOZKbeAJGi0M4V5osDtLj0kOvcji9y8Pdx
         QT0L0poXLOIxB3cAVqmTKq5ppHHDjfqKvSwQLKUpYSYLXku0Xn3iHQp93zlgr/xflNpE
         jycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765213273; x=1765818073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCB9rKt0bxBUYqdLGfWOYnLi2W4YvD8volkGTkyVspI=;
        b=qVcHNmyZtLic+I40n8LXDC016CSnG2Ve6Ko8lIZ3L7E2ZZ9pNoXbVvvYhzAE7JjDcO
         3e1KbAi/z3ujXJobhOM0lN4ZNqfJ/6ZZ1681pMbhiiWvlE1S34337PZnqMp9qrU9x+n5
         EhaOoHj+4oUan/9uUxRZkBsoOb7pVfcrk354GXIQMIjT1qijqcpWAQi5CTVFod/tdRXq
         B/1jeIF/Cpd01V7fEvSyZrO6YzJnDxRihlsUbWlcDBtwJ8kGZcWwgXauN4YAb+o7IEXv
         jUogQ95m5NvLBylYdhnUTSgnA5kUNf88kM4wObC9PqspDd9t1C6pBZpxwNtJy6Ig7N0Q
         er9A==
X-Forwarded-Encrypted: i=1; AJvYcCXcUVDcisfmE8Q/ZLG19ECLjrFTgB9vH91EnO9pRid/h32/639QNTpATEjKS1Dzw/gPE5GVT9/2wTz21pSC@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxAuI+nRJdkWgv142KHnC1l/5Syx9XiWyBVuRRL2wI7TIalRv
	gms9soeazBzZvJxyxhz0LN5hUOSrIkONeXEPtsqVjDP50BdBEbkesbSgexTVrk03U3oTtXpfC4p
	eFRVwnkNec2tVGtP3RmPXmEKVqR7GW47XoIfRo3qzKlK4TZh8lROu73JrWRs9N0uyNIrY
X-Gm-Gg: ASbGncuLpxs2rikAyRVyydNVHKDOWpIhZ116itqT2Dq8QuuXdPK0sq5grEdhK38PpNI
	qDhRlPtqrArSRbbZm068wl4NFFsm03E2mCMFiDvRMojQfwKkgp9G1CtXyb1K6jKLe8C/goWDc9U
	Se1RoHA10JP6M2FTzTOJFVMiA2QgBAjZgzIKy/63ukYEOt7QtaIVmWNt6Qxv5AD1YDCBIEkMQ63
	qeCK9cpNShY3Ab6eRR+04d377HCa4NcDxcA2PLkp2Bj5o2b40A4+As1h6Sg/UEzcoEtqJThTiYe
	sXdMgkW4c/pbaU3eGL81n/SEMUAD0n+/Vq6NhW7hwR68bruLxKFPWUXudQWT/vHDXMUrHjqpsNM
	GPu07fiXu/lq1KL86U0qiGvDsqIPf+zeGkWDG
X-Received: by 2002:a05:6a00:1a11:b0:7e8:3fcb:9b0a with SMTP id d2e1a72fcca58-7f03e564eb1mr45267b3a.32.1765213272855;
        Mon, 08 Dec 2025 09:01:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaN+ITFTQf8tUPCh292VMVrUPI9Ljqza0yZj3DgFvhHwa0IGUMFw4hL1FdwQnXigomUpUApg==
X-Received: by 2002:a05:6a00:1a11:b0:7e8:3fcb:9b0a with SMTP id d2e1a72fcca58-7f03e564eb1mr45217b3a.32.1765213272019;
        Mon, 08 Dec 2025 09:01:12 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ecf89sm13785614b3a.12.2025.12.08.09.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 09:01:11 -0800 (PST)
Date: Mon, 8 Dec 2025 22:31:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251208170104.psvk4xxo7b4bg2eo@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
 <4376b7cf-7088-412b-8596-bdec5bdc273d@oss.qualcomm.com>
 <20251204122806.s7lnqffgcrd7usem@hu-mojha-hyd.qualcomm.com>
 <e78feaff-0b48-42b6-a824-0f102a6ac9cc@oss.qualcomm.com>
 <sysdgcspvxhytyudknnyj4hu6lc47we5ijkrsssi6askysqyo2@bdzl5cvzc4be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sysdgcspvxhytyudknnyj4hu6lc47we5ijkrsssi6askysqyo2@bdzl5cvzc4be>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE0NCBTYWx0ZWRfX2FTx4+3r4dGB
 5utSbabprFhWbl4o+mFzBLHxBgVNi63zoLSWjDDgn2/WxhBxGrQ2EWabfh2jRFjjqtKKC3C7lsy
 234i8WLrc+2NuLhkeuJfdeecndFEMhrAx1pn58URUZ6RAvcCNBk9RGEnkIIxPfGdx5rVlHfbaHD
 54uRi8xw8JDZ17EERKHUwSfnzTeJDs8vhNojL/XlGO8lXmrTsI/jMWFoXkrb65/zWP8sbodPPWg
 yZlyHQxFnKvsYkAFbN+YKU67OiJGcKMZrJvteP3deWA0FPnA1xrxTzO+nDaNCudf9BpgVEqOxXZ
 YOeJbTFmgeOsyOuxbQ51xf0Zkw7tzOi4LhLBBihp/Qwh1HnXLdXvIjuT6tDNPKbMx1q/3kNa9IV
 qniEVy4c2kt+qaVHia+s6NPhsz49yg==
X-Proofpoint-ORIG-GUID: pqrtNP7f3FqEY8xciny3zmUrAp87GnaG
X-Authority-Analysis: v=2.4 cv=cqSWUl4i c=1 sm=1 tr=0 ts=69370459 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nmjsJmyt1rCFr6M104wA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: pqrtNP7f3FqEY8xciny3zmUrAp87GnaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080144

On Fri, Dec 05, 2025 at 04:17:56PM -0600, Bjorn Andersson wrote:
> On Fri, Dec 05, 2025 at 02:15:00PM +0100, Konrad Dybcio wrote:
> > On 12/4/25 1:28 PM, Mukesh Ojha wrote:
> > > On Wed, Dec 03, 2025 at 01:36:32PM +0100, Konrad Dybcio wrote:
> > >> On 11/24/25 4:25 PM, Mukesh Ojha wrote:
> > >>> On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
> > >>>> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > >>>>> Qualcomm remote processor may rely on Static and Dynamic resources for
> > >>>>> it to be functional. Static resources are fixed like for example,
> > >>>>> memory-mapped addresses required by the subsystem and dynamic
> > >>>>> resources, such as shared memory in DDR etc., are determined at
> > >>>>> runtime during the boot process.
> > >>>>>
> > >>>>> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > >>>>> hypervisor, all the resources whether it is static or dynamic, is
> > >>>>> managed by the hypervisor. Dynamic resources if it is present for a
> > >>>>> remote processor will always be coming from secure world via SMC call
> > >>>>> while static resources may be present in remote processor firmware
> > >>>>> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > >>>>> with dynamic resources.
> > 
> > [...]
> > 
> > > Just to avoid iteration, are you suggesting that we can keep this
> > > guesswork as part of __qcom_scm_pas_get_rsc_table() and start with
> > > something smaller than SZ_16K?
> > > 
> > > I kind of agree with the first part, but SZ_16K was the recommended size
> > > from the firmware for Lemans to start with, in order to pass the SMC
> > > successfully on the first try. However, the same size was failing for
> > > Glymur, and it required a second attempt with the correct size.
> > 
> > It depends on the payload, which you're probably much more familiar with.
> > If 95% of them will be closer to e.g. 1K in size, it perhaps makes sense
> > to use up the additional few dozen cycles on our amazingly fast CPUs and
> > retry as necessary, instead of blindly reserving a whole bunch of memory.
> > 
> 
> Those "few dozen cycles", is tasked with sending messages to RPMh for
> voting and unvoting the buses, then tzmem will hopefully hit the
> genpool, twice, and then radix updates, and then more genpool updated
> and more radix tree work. And then of course there's the one context
> switch to secure world.
> 
> If we don't have space in the genpool, we're going to grow
> dma_alloc_coherent, extend the genpool, call secure world to register
> the new tzmem. And then for all those cases where the allocation wasn't
> enough, the retry (with updated size) will not fit in the
> PAGE_ALIGN(size) genpool that was created, so we'll do this twice.
> 
> Fortunately the tzmem growing should only happen on first remoteproc
> boot, but I think it's a bit optimistic to say "a few dozen"...
> 
> 
> The drawback with making it 16KB is that we're not going to test that
> error path very often. But the more idiomatic form of first calling with
> a size of 0, then allocate and pass the proper size, seems a bit
> wasteful to me as well - in particular if we do it anew each subsystem
> boot.
> 
> PS. 16KB is 0.03% of the ADSP carveout (or 3% of the ADSP DeviceTree
> carveout...).

What you suggest ? 0x36c8 bytes was the size for CDSP resource table on Lemans.

-- 
-Mukesh Ojha

