Return-Path: <linux-arm-msm+bounces-78308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B893BFB48C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C40B6400725
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5348231985B;
	Wed, 22 Oct 2025 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gql0+vac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727B0287504
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127417; cv=none; b=DN0pjtauZh7T+iVwtO87ogLQZQHFrWgYHxviA8DVDH5s7PMwQSUt/Fam85eGbaH+j2YXYsy97nwgLOXXVRP+cwQKn/T2h+Ggju/CMTU4UZZDOxFjjwfPuSLWUbPy8+OGKKxuQQ2Ds/OTV3WJ5DLLUF3n445DMq1eN//MxYtI4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127417; c=relaxed/simple;
	bh=yjRSAyYrfPFuajWPybOEyPy3ib6Kji15eGFM49Hh6io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lS11mapghsneMY/+04YeyBwUalATBgpYrrCJUWMC5woB7c11yqGP8bIe2vtJPNYaryElwjWg3RStizRSg/o5QOaRN/Q9uprHj9tsOtl/AKHgmhgLO8VdJhAOPNGhuegA6QEqBvydZUrIe9wnwalAIz4TIuDDXU56UERatPYzNuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gql0+vac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M37QIW004647
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dOa1P9AZuIF0dByGZ+vgwV0Rt54JvCrAQVgW7l2OkA=; b=Gql0+vacgoV73WZW
	tEAx+KFov49SSBJ6PWzYrAKuHTwkr+asyQeKyqQx+gUsze5Mz1fQ5Aphd70RGHmh
	IsjKiyyr5NKnOf36w5juzl/ujoFQjRXumLm/YslCl5KiKFZBLj3PPk6OK2xZVVdf
	D1Dh6ugXpvToSvxDci3EOC6HpSwQm1kt51dDVdTVj4vjYmjbHSB9rYfA3nan2imT
	IYqNB4qzIfSq0ik3viwd8YyjGbArkzCJuSHZXUQx0WVy4XQF9eORCT61CL0g9yaL
	Lz/UTlF4LfYhzuAPJ9+1uT/ThAKGjIGKYzz0CvqPUq8Gy2Nx3LdZOndrRgITXL1E
	yTlqQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfm5pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:03:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28c58e009d1so151056805ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 03:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127414; x=1761732214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dOa1P9AZuIF0dByGZ+vgwV0Rt54JvCrAQVgW7l2OkA=;
        b=suYqtGF0dxyjl83S5VPpfLy7S9L9++yVbV+o4scDZ+yokrb8R79EYVWJdXmfcwMzsv
         XeWwQ/m0JthF0YylskW1hEGZhfER7RuFggI+Cvwxw5DfpUl28eVRdcfwWUe8q8IE2VIu
         KjoDLEuXV1KXMtsFNuzySypiXEazXN5RoFtZzPpM9JSyrUOnIMq0Zc9nwIDzfEObZeBE
         kbks3nCnLd5XzjqiGXS8Nmki/R4OiBrPZbLAcQ6oEtpwAcIlVDJzGtWTSvfUCsm7aWgG
         Khmd/UqKo5gdm/6JYlBv5mWRiSf8u6mxQEqsGCzGTz9k74zV35Armb3lhlmKcvyYvfxN
         9sQg==
X-Gm-Message-State: AOJu0YxBg+LdEiGGtiKogFN41AOKTAhzb/46fryAC+0WqXunhS1VkEKk
	Wn+x1oLs7/qCV4cAXCcFjP8hf7iBfQffUmgvtv9+7d8OURV6CF4e+QINubQV63MrySZ290PTudH
	hh6MR7bwBb6dYFEJosNDLNBdTByw1QfmaioJncQs8VFwgl6iIhjwcZLcrFZ1OpEHhpXUS
X-Gm-Gg: ASbGncv44SsDcw/EJxKkbeDdnYe8hMibj5hRF4FiBJoPG/wJJ39ttQ1hftwdYd+9Ok/
	trD3LMc2VlGmgFkJ587r4lgJQm1oXnD/VJRJwRS4pjOu99Tj7NuAyv9pTXmkrpHPJw9KA+UjVMn
	gqFQy44SPlBt7LowGxIvS4bg+cqK3XaXmugfMsmuJ01LdAsWChS0QkK/oHtmKCG45jtvsl8fqNv
	lgBk/ZnyzshuxJ6CSdrm7W3P+PEGJLy4rUywBjhO/18yntWcdOpLUrOeKJTxV6ob0wrebnuFpFb
	aassAY8uSW+fyzSFNY8SA5MoFizjNnW28FdfXeOqtqJ8A87hln8D/BdBtEi9RUSIFtu/F4zOW9l
	Oh3QO9ewSVdz57+xLNTOg3Nb/7Q==
X-Received: by 2002:a17:903:2309:b0:275:3ff9:ab88 with SMTP id d9443c01a7336-290cbd33968mr294500945ad.49.1761127413461;
        Wed, 22 Oct 2025 03:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnVieDpnBFjzey+iYDuF0Lk6TnYwYoa2HXV7UFtRM0HOMfHfzNVYrtlA9jF8kW4sr48Jin5g==
X-Received: by 2002:a17:903:2309:b0:275:3ff9:ab88 with SMTP id d9443c01a7336-290cbd33968mr294500395ad.49.1761127412716;
        Wed, 22 Oct 2025 03:03:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29247218eafsm133379585ad.101.2025.10.22.03.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:03:31 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:33:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v5 00/13] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251022100325.i3s3r2gv2wuebem4@hu-mojha-hyd.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: m4xvhIxCzpABlg5cArDqSYMscufjqKra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX8c3xXCpstj3x
 izdbAF29zxkggWyUHdLoAoL4poLnYGtYX1Y5yRc5WVowp6BI4ICNLiW2faIPrjKWHIQsJft+rJW
 IRx/5GKsjJ/BjE4BKsE903nmI1fdFU8oRn3yU+7NTW+pZWWKSfDzV3+HM/GaD9+H/ziCGj7kguD
 JDrAMM8qYTEQi5kyJljfKrFDHj4VMQC6ncJMaAH1088NoUrgC6yo36eSFs3cXF46jp2siGnSDam
 +UoSolprDPtd/h/w7+ySmdVfr5j1aGsHdMo/h8j43e5zeU8kBRFouHPJrvrack8QyJorgafsS7U
 v1NpxMhBN6mRMAQpT5HMMYelGNZpDAjsCp1Nxdc87FutSOn6T7vDhQCPoP2nbhPCThbHuGIibg3
 JMJjNms4wDHHvrgHqs3rqyV5uZ9oNA==
X-Proofpoint-GUID: m4xvhIxCzpABlg5cArDqSYMscufjqKra
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8abf6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=x1MSAgqNs_Uq-AGLxd0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

Hi Bjorn, Konrad,

Its been a while since I have sent the series on the subjected topic in
the mailing list and has gone few revision addressing most of the review
comments (Thanks to all the reviewers which has helped me to improve the
series) and these patches will also help Glymur in its remoteproc bring up.

Let me know your comments which I can take care along with already
present before I send next revision.

-Mukesh

On Mon, Oct 13, 2025 at 03:33:04PM +0530, Mukesh Ojha wrote:
> A few months ago, we discussed the challenges at Linaro Connect 2025 [1] 
> related to Secure PAS remoteproc enablement when Linux is running at EL2.
> 
> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.
> 
> Qualcomm is working to enable remote processors on the SA8775p SoC with
> a Linux host running at EL2. In doing so, it has encountered several
> challenges related to how the remoteproc framework is handled when Linux
> runs at EL1.
> 
> One of the main challenges arises from differences in how IOMMU
> translation is currently managed on SoCs running the Qualcomm EL2
> hypervisor (QHEE), where IOMMU translation for any device is entirely
> owned by the hypervisor. Additionally, the firmware for remote
> processors does not contain a resource table, which would typically
> include the necessary IOMMU configuration settings.
> 
> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> authenticate and reset remote processors via a single SMC call,
> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> TZ for authentication. Once authentication is complete, the call returns
> to QHEE, which sets up the IOMMU translation scheme for the remote
> processors and subsequently brings them out of reset. The design of the
> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> is not permitted to configure IOMMU translation for remote processors,
> and only a single-stage translation is configured.
> 
> To make the remote processor bring-up (PAS) sequence
> hypervisor-independent, the auth_and_reset SMC call is now handled
> entirely by TZ. However, the issue of IOMMU configuration remains
> unresolved, for example a scenario, when KVM host at EL2 has no
> knowledge of the remote processors’ IOMMU settings.  This is being
> addressed by overlaying the IOMMU properties when the SoC runs a Linux
> host at EL2. SMC call is being provided from the TrustZone firmware to
> retrieve the resource table for a given subsystem.
> 
> There are also remote processors such as those for video, camera, and
> graphics that do not use the remoteproc framework to manage their
> lifecycle. Instead, they rely on the Qualcomm PAS service to
> authenticate their firmware. These processors also need to be brought
> out of reset when Linux is running at EL2. The client drivers for these
> processors use the MDT loader function to load and authenticate
> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> to retrieve the resource table, create a shared memory bridge
> (shmbridge), and map the resources before bringing the processors out of
> reset.
> 
> It is based on next-20251010 and tested on SA8775p which is now called
> Lemans IOT platform and does not addresses DMA problem discussed at
> [1] which is future scope of the series.
> 
> Note that there is a regression on booting KVM on Qualcomm SoCs after
> commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE").
> A fix has been purposed here
> https://lore.kernel.org/lkml/20251010174707.1684200-1-mukesh.ojha@oss.qualcomm.com/
> 
> Changes in v5: https://lore.kernel.org/lkml/20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com/
>  - Replaced minitems with maxitems.
>  - Addressed comments made by Bryan, Mani and Konrad.
>  - Fixed some of highlighted issues in v4.
>  - Added a new patch which removes qcom_mdt_pas_init() from exported
>    symbol list.
>  - Slight change in  v4's 5/12, so that it does use qcom_mdt_pas_load()
>    directly while it should use in the commit where it gets introduced.
>    Hence, reordered the patches a bit like v4 5/12 comes early before
>    4/12.
> 
> Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
>  - Fixed kernel robot warning/errors.
>  - Reworded some of the commit log, code comment as per suggestion from Bryan.
>  - Added support of gpdsp0 and gpdsp1 and disabled iris node.
>  - Add R-b tag to some of the reviewed patches.
>  - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.
> 
> Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
>  - Dropped video subsystem enablement for now, could add it in future
>    or on a separate series.
>  - Addressed most of the suggestion from Stephen and Bryan like some
>    remoteproc code checking resource table presence or right error
>    code propagation above the layer.
>  - Added leman-el2 overlay file.
>  - Added missed iommus binding which was missed last series.
>  - Separated qcom_mdt_pas_load() patch and its usage.
>  - Patch numbering got changed compared to last version
> 
> Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
>  - A lot has changed from the V1 and a fresh look would be preferred.
>  - Removed approach where device tree contain devmem resources in
>    remoteproc node.
>  - SHMbridge need to created for both carveout and metadata memory
>    shared to TZ in a new way.
>  - Now, resource table would be given by SMC call which need to mapped
>    along with carveout before triggering _auth_and_reset_.
>  - IOMMU properties need to be added to firmware devices tree node when Linux
>    control IOMMU.
> 
> ---
> Mukesh Ojha (13):
>       dt-bindings: remoteproc: qcom,pas: Add iommus property
>       firmware: qcom_scm: Rename peripheral as pas_id
>       firmware: qcom_scm: Introduce PAS context initialization helper function
>       remoteproc: pas: Replace metadata context with PAS context structure
>       soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
>       soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
>       firmware: qcom_scm: Add a prep version of auth_and_reset function
>       firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>       firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
>       firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
>       remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
>       remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
>       arm64: dts: qcom: Add EL2 overlay for Lemans
> 
>  .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   8 +
>  arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 +++
>  drivers/firmware/qcom/qcom_scm.c                   | 394 ++++++++++++++++++---
>  drivers/firmware/qcom/qcom_scm.h                   |   1 +
>  drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++++--
>  drivers/soc/qcom/mdt_loader.c                      |  42 ++-
>  include/linux/firmware/qcom/qcom_scm.h             |  35 +-
>  include/linux/soc/qcom/mdt_loader.h                |  22 +-
>  9 files changed, 598 insertions(+), 113 deletions(-)
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251013-kvm_rprocv5-d24c1407a7c9
> 
> Best regards,
> -- 
> -Mukesh Ojha
> 

-- 
-Mukesh Ojha

