Return-Path: <linux-arm-msm+bounces-21002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C28D3EBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 21:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BC261C2362C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 19:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6276015FA64;
	Wed, 29 May 2024 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vx7was3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEEE335C7;
	Wed, 29 May 2024 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717009543; cv=none; b=qTnlF4ROHg55Pw8KIWC1J4FKNqzUSxBjlAj2ZgOBFJEzYrRsM/vsGSpaxLm9arI32ySAertZ0HajxiZYUDslg7oCTQ0+XwaRkkbRSwSzKGmEvpP1fD+s9Jj17eZjqTTfz3DjtmJLqrY+RP3ZRcuipbiNYArSUg/iiEdJemd5Tlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717009543; c=relaxed/simple;
	bh=CGATLWRSqsNsyeIzZFHoaWASYLvWCTwMNm79CQLU8ro=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga6tDqT/OXZT5Qfdkp2p5dEamwAZg/4Uges6nvniwARKyWSxwaL4MrCc7cBxWQzgpBXMEuN1is7mHwa4ya6LUPgXu713R0qDE/6SLHelPdzaErElfRiC0RA9rVbVpjrRU/+6eYVa0gRq8ScfGRvKblIUQA7Cpe4xqYKFZv7IVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vx7was3c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TALrSG009025;
	Wed, 29 May 2024 19:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=22jOQiu1v/CFYTstdiv/tByh
	NkkVK0tVz3wsh/u57YI=; b=Vx7was3cPQPfgFoUGCwc1taqjOb02cecrnqp5JQy
	AR88t4oV9/+0laBWBBk4vkl3MDlIz4ckO1TXpbat22wl6DKxoEkYIcawE9vazmM0
	uqn7ykG+X6Vwkl/Q8tx7IZOGjaFDDkPWHgfZ5DMkjdcSTcaaL21Oky2zbDa4B0UP
	xvgjRJdHhFvo5A8eg+JWCiWyuusg96j+obW7PIeA6gqlU9zSPBaC6fdFZS7c14CC
	7eoaQGIcNcjFF2hVP2PZAuMUIY3NVT4URFfVKp3axFgvEnsY9pZWZQuv3DtNouX4
	5REhnO4M1mklhTDE93EUxzNWUz+tFnmmZTilwVZFwLu21g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0ga89s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 19:05:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TJ5KAN004856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 19:05:20 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 12:05:19 -0700
Date: Wed, 29 May 2024 12:05:18 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Chris Lew <quic_clew@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] soc: qcom: smem: Add
 qcom_smem_bust_hwspin_lock_by_host()
Message-ID: <Zld8bm1HP1H98+Ws@hu-bjorande-lv.qualcomm.com>
References: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
 <20240529-hwspinlock-bust-v3-3-c8b924ffa5a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240529-hwspinlock-bust-v3-3-c8b924ffa5a2@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xcnn4CpWbQAQz9b4jlwjWrPB46-nStHi
X-Proofpoint-ORIG-GUID: Xcnn4CpWbQAQz9b4jlwjWrPB46-nStHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_15,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290132

On Wed, May 29, 2024 at 11:09:57AM -0700, Chris Lew wrote:
> Add qcom_smem_bust_hwspin_lock_by_host to enable remoteproc to bust the
> hwspin_lock owned by smem. In the event the remoteproc crashes
> unexpectedly, the remoteproc driver can invoke this API to try and bust
> the hwspin_lock and release the lock if still held by the remoteproc
> device.
> 

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---
>  drivers/soc/qcom/smem.c       | 26 ++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 7191fa0c087f..50039e983eba 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -359,6 +359,32 @@ static struct qcom_smem *__smem;
>  /* Timeout (ms) for the trylock of remote spinlocks */
>  #define HWSPINLOCK_TIMEOUT	1000
>  
> +/* The qcom hwspinlock id is always plus one from the smem host id */
> +#define SMEM_HOST_ID_TO_HWSPINLOCK_ID(__x) ((__x) + 1)
> +
> +/**
> + * qcom_smem_bust_hwspin_lock_by_host() - bust the smem hwspinlock for a host
> + * @host:	remote processor id
> + *
> + * Busts the hwspin_lock for the given smem host id. This helper is intended
> + * for remoteproc drivers that manage remoteprocs with an equivalent smem
> + * driver instance in the remote firmware. Drivers can force a release of the
> + * smem hwspin_lock if the rproc unexpectedly goes into a bad state.
> + *
> + * Context: Process context.
> + *
> + * Returns: 0 on success, otherwise negative errno.
> + */
> +int qcom_smem_bust_hwspin_lock_by_host(unsigned int host)
> +{
> +	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
> +	if (host == SMEM_HOST_APPS || host >= SMEM_HOST_COUNT)
> +		return -EINVAL;
> +
> +	return hwspin_lock_bust(__smem->hwlock, SMEM_HOST_ID_TO_HWSPINLOCK_ID(host));
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_bust_hwspin_lock_by_host);
> +
>  /**
>   * qcom_smem_is_available() - Check if SMEM is available
>   *
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index a36a3b9d4929..03187bc95851 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -14,4 +14,6 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
>  
>  int qcom_smem_get_soc_id(u32 *id);
>  
> +int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
> +
>  #endif
> 
> -- 
> 2.25.1
> 

