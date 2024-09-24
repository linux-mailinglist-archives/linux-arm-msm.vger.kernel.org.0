Return-Path: <linux-arm-msm+bounces-32243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B265F9841AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E17281C2316B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 09:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E256B154BFC;
	Tue, 24 Sep 2024 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oo+F5Ano"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CBF15443D;
	Tue, 24 Sep 2024 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169061; cv=none; b=PvUnPyd5OXB5Jvpru4nwGoNYb9WoLnu+RWtwbnkci6o7YseXaNuD1EYXjVt6anK8TYYcJzcTKQsN/sG5bKWHdwB6Zsv53wXgY3q1Wb2+78mCaOuuNUtQFm8nccrzawfiAjxmW978Y0YCEO3K9daOOsQbwNXijLOGuqmgXGZw6Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169061; c=relaxed/simple;
	bh=cl6QxBEp6NbMB7XwMBpnznlpfAP8UEaKvAArML0poFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jdssKCO7Eao8Iry6LAA5C4iJltn36/uTjjG/5u3/oRg5TCA3Sf20vNkq3638vB72KtTrMSMFnh597pNXNybo3f82ghJ/pK7MIZ7a3O4L+7APJwJDhxFKluWrhx99HnZjF7gHmxoDZOjiQS5rogK3RnaqQBjv9/CWli3JiBAp5cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oo+F5Ano; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NMHrOZ007152;
	Tue, 24 Sep 2024 09:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tyqDmuNItDIyc9GfGP2csWSUJF3TT4bqvFgUh0BiWf0=; b=Oo+F5AnorJcNi5Dc
	fopQ+nDpFZBZIVHEhVz4LbwT41THcYEzKjjmJDnZHskcBbcRvYqRpt048i6M7AUc
	v0RxN6TeLiPnwvhmUh/wgIT5TDal1U0Wdpf3KxFUNenu3EV/iNfLIq2F4cJD9gvv
	FgAXEinZa8I+TJHYqF7volsY6/mLiTnDCPss8B7CsJHktQhQMjyWKUdpYeQ0YRzm
	5psuLA1WX+U0FfC463zH34xnpNLOZREnP0c8bgUKIYsTOkbKR8LLAqx5RhjQJiGW
	3iyRBnJNYbZuwwx7FhrAHblLNrSf9JjeHdw0Bv86tQK4zZPjOZvL+po6SzSCY6mq
	C05Ksg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5bqyb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 09:10:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O9AdTd032031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 09:10:39 GMT
Received: from [10.214.227.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 02:10:34 -0700
Message-ID: <e96234cd-2278-4c06-9da5-f3fee90b8a53@quicinc.com>
Date: Tue, 24 Sep 2024 14:40:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: kernel test robot <lkp@intel.com>, <robdclark@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>
CC: <oe-kbuild-all@lists.linux.dev>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240920155813.3434021-5-quic_bibekkum@quicinc.com>
 <202409230343.Q8KnYl2w-lkp@intel.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <202409230343.Q8KnYl2w-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E1hNcWbfFYGKPqIgc0dVdRU9C7oDlNJ_
X-Proofpoint-GUID: E1hNcWbfFYGKPqIgc0dVdRU9C7oDlNJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=937
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240063



On 9/23/2024 1:06 AM, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>     In file included from drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:14:
>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: In function 'qcom_smmu_set_actlr_dev':
>>> drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:266:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>       266 |         arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (u64)match->data);
>           |                                                           ^
>     drivers/iommu/arm/arm-smmu/arm-smmu.h:533:59: note: in definition of macro 'arm_smmu_cb_write'
>       533 |         arm_smmu_writel((s), ARM_SMMU_CB((s), (n)), (o), (v))
>           |


I'll fix this warning in next revision after other reviews are received.

regards,
Bibek

