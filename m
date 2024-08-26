Return-Path: <linux-arm-msm+bounces-29466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DAD95ECCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 11:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C8A01F21448
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 09:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BB713E033;
	Mon, 26 Aug 2024 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dOLcHLDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B594513E8AE;
	Mon, 26 Aug 2024 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663469; cv=none; b=TxPiaP374DL9nH5IkSvai+re9yGK9yefojt+byfjzKJRsDpvjpImqKfAshusAbc4lQJh4OeRya/T+YQyiKUanWgXUYfDUPriu0bHeyMCyxirD0TN+xl6uBUWPjl6Pyeo1Eb8VV9zhyu/fvVbivFKS12BLWwrOMcMAcDpLsAzAcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663469; c=relaxed/simple;
	bh=osgeusSx4GMJxp/t7wx6EBDl80pQpkt0CyJex63a4G4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WSdV/h4PHRVanmwRKGKWD5FYFnz1wE0xCiiEL10Xb40SFoEhjaMIzjgcGuvxhVFXqYbczaKhERIQ0384PWB0FUGDn2xwOIVdn5Gb1yWOlUFuxGyd+FunTqKk+D1dmYfTnVx5gr2QIHNPPCll2oJjmmCx6KZxAUohdxSI0Eg+HYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dOLcHLDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q8MMgI005670;
	Mon, 26 Aug 2024 09:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LS/3cGDb7+1BUz2GYeaQp6bq4z88l4LIdIGsRFQNIug=; b=dOLcHLDXPqcwfkkU
	X+zYdZrNn0lpK1JHw8WG0JQr2o6zTlzTa3Sn5IT0f/Ent3xJ+94LEBdRVc2/ejqJ
	LMEHjTUA3C01zwaPEyvPv6K0IyGKrTj55ZpWy4DrxIrtRevhL9Hn2gA7d2vR6aHe
	UzH3GL9LJS3igpAtfOcv8IeaUTqS+hzoNBeTn/w3n1XgRQ8Zty1FE121AkjRst3t
	EQ7DoAU4/1CqV22OfBcCd8HzjYJPy/K82ZRI/8zShztnbudX19Ql4AudJiSgn7zw
	RCv898VcZXx8w5RUUoMhfOpyQ+rtF5UzgyZnR53fqj6Ryc4TrhFq/t84LlLjCapv
	qsIpgw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4179anu4p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 09:10:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q9Ai6S008720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 09:10:44 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 Aug
 2024 02:10:39 -0700
Message-ID: <bac11c82-9794-47bc-92cc-2442578053d2@quicinc.com>
Date: Mon, 26 Aug 2024 14:40:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/6] iommu/arm-smmu: add support for PRR bit setup
To: kernel test robot <lkp@intel.com>, <robdclark@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <konrad.dybcio@linaro.org>
CC: <oe-kbuild-all@lists.linux.dev>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240816174259.2056829-7-quic_bibekkum@quicinc.com>
 <202408230612.1DU9cuSx-lkp@intel.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <202408230612.1DU9cuSx-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zv5rMMGkxV0KEbz3D6rgKwEoLB9UnE_E
X-Proofpoint-ORIG-GUID: zv5rMMGkxV0KEbz3D6rgKwEoLB9UnE_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_06,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxlogscore=825 clxscore=1011 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408260072



On 8/23/2024 4:07 AM, kernel test robot wrote:
>>> drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:266:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>       266 |                                         (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_LADDR);
>           |                                         ^
>     arch/arm/include/asm/io.h:282:75: note: in definition of macro 'writel_relaxed'
>       282 | #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
>           |                                                                           ^
>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:269:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>       269 |                                         (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_UADDR);
>           |                                         ^
>     arch/arm/include/asm/io.h:282:75: note: in definition of macro 'writel_relaxed'
>       282 | #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)

This is fixed already in v13, but got missed in v14.
I'll take care of this in the next version.

regards,
Bibek

