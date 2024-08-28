Return-Path: <linux-arm-msm+bounces-29861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB379632C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 417181F2135C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A45E1AE056;
	Wed, 28 Aug 2024 20:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="btVpYGoz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955E15A85A;
	Wed, 28 Aug 2024 20:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877782; cv=none; b=r30CXwXtxB6JIEg81K7oAQximoZavDDqfFcwCWU3Z4GT5KUjRyNdny/QcV+WpxCi2wv6UyXdHV/czIuRDRXqH7J3GvjHc3sTgM7X1k3hnRelPyDzYRp2Nc696Szhhwj0kEszX89A6LJv6q2x0ZPTxhnizLeVMkaTOCkS0ZtxP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877782; c=relaxed/simple;
	bh=S/gwffQ5fr1MCbdz36el3aL2SNc6+KEDUByigIc3dy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AVdKjXbZEa63+cX6dLFcxYaLJMe87yxljPaGbaqAtNCuOSEnOLpa9Xzy2OQSj0Smmt0hxUX1Ex/HgscyONe9EjAFUEMiIApFTi7x3EC4TKAjarMb9dHKsXVW6XiW7WZKSTqSebA35kpgSguUjoMV5fdVoQScu2xbe43UjgzezUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=btVpYGoz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMGAv010874;
	Wed, 28 Aug 2024 20:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfwqQ4/7C4ed3wSuOBejicUF5rO1/VRa86if+TODajA=; b=btVpYGoze6kTkja7
	mKaUFvQ4qHMOf27I90vMMdeFNjer+0jQ2dN2y4ROzCkN47h+Vh80lXDXxicqvSUp
	AqjYkxn3e9dtdCtYRJlTOn3ZXajRtUkfmKUNcZBupWQR1aJsktODBWLyeKP0uUyI
	3Plb0mz13kZ8G929DBwMSxpD2pYqgSruSbQ0yGkwEX0wWigEJG0fllV8KuL8D6Zz
	U3SJeRTAsp+Lhj/wFZqyNt9EpWD7scYJsVlh2IXpAgHRYWdl+emQtcAL5JYDiy9x
	M/kywGZDJm1E3Dp+7ug32VI0n+kW77Ju05tGu3rFb1Zp7d5Tg+OSOdICUu3YRHAg
	ppI2oA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0k31n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:42:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKgo0J020503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:42:50 GMT
Received: from [10.71.111.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 13:42:49 -0700
Message-ID: <46e4e48b-ee28-4c02-aeef-11dbe979cb45@quicinc.com>
Date: Wed, 28 Aug 2024 13:42:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/msm: Use
 devm_platform_ioremap_resource_byname()
To: Jinjie Ruan <ruanjinjie@huawei.com>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20240828084849.2527115-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240828084849.2527115-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZR6GrN6-uATnYnzsdc0I6OJRlWmHk_IX
X-Proofpoint-ORIG-GUID: ZR6GrN6-uATnYnzsdc0I6OJRlWmHk_IX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280150



On 8/28/2024 1:48 AM, Jinjie Ruan wrote:
> platform_get_resource_byname() and devm_ioremap_resource() can be
> replaced by devm_platform_ioremap_resource_byname(), which can
> simplify the code logic a bit, No functional change here.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/msm/msm_io_utils.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

