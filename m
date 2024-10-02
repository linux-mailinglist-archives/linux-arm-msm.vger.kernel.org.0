Return-Path: <linux-arm-msm+bounces-32945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F072098DA53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 16:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C744B258EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 14:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AD61D2B31;
	Wed,  2 Oct 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F4q7H5ev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66F1D014A;
	Wed,  2 Oct 2024 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878511; cv=none; b=dxYnRD0mjSmylUlQ81r3Zf6x4b1XHPEvq9ziyn+m0GZSw+hZiM5+kpzGxDRxV9SsC0vZB1hL1UeXor7twO/zOeAW5yWxAASHR10LcD+NKjhMmlCgY32WY3EU81dndaz0rT2gOeYnWW4CEsxlm5cqg2gb4lfghnL2Q7glBNvpsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878511; c=relaxed/simple;
	bh=Nevs63pSFBHRDMWDk7ZxAgkMqhxf85c7ROZMLhOjDQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JWOjWKj8NXXcehX8kwh+9jFKyAZX3bI2guMa1eN4uC7EUIKJmI/I+dN4CHPWCG/JAg3UL4y7Xef74b4ozX7u9NDPRdN/aQ06eHxDE31a6ARVOgjJD9GMV4kIDVFZK5K/BT3RyWAOclgPC6RBTubXw5iDzqOAlqpm1S64OYb5EB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F4q7H5ev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491M3N2r017398;
	Wed, 2 Oct 2024 14:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRat43/tpyMvId/Zkf6GjyjSEsPyfwM0Y8UCza1RHmo=; b=F4q7H5ev/aSiVNyI
	rNwzWSn/MBj9cITBwp6/ELJ6gnuVqU2PIlcV82xzz6/IErsowTwDiOe6EWim9xS2
	ekLMZjd7WcogJ4EbIoicbfIDg2bVcd4ibq5XjBk1mtGReIg1lKgz8BuXWAfbM+FB
	xcG21dnjap3jD6OhgsU0aKXKmHkHtTw46Cgnv/kgRxb1v0Fe9rATweTDNmGURaTF
	h/Mr971v5UFqsK87I+jqqIKMals4g95eWzhh1DIPu5rVqfUl4wfs8UjaVKw64Q2D
	yydOxHbMZU0SETiZjv8HQCCMUOmCdF944BB3gUaBubcbuvOhO7QvBqgmupZtoRrx
	Q+YaIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa12ur1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Oct 2024 14:15:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 492EF08H031492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Oct 2024 14:15:00 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Oct 2024
 07:15:00 -0700
Message-ID: <0927fae7-3250-f01a-33dd-3b0caccb82c8@quicinc.com>
Date: Wed, 2 Oct 2024 08:14:59 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1] bus: mhi: host: Fix typos in the comments
Content-Language: en-US
To: Yan Zhen <yanzhen@vivo.com>, <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <opensource.kernel@vivo.com>
References: <20240929090334.524543-1-yanzhen@vivo.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240929090334.524543-1-yanzhen@vivo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: laOwJ6lR7yjF3G48Bx8AvTgK9YpRZVUr
X-Proofpoint-GUID: laOwJ6lR7yjF3G48Bx8AvTgK9YpRZVUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=689
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410020104

On 9/29/2024 3:03 AM, Yan Zhen wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Fix typos:
> 'Normaly' ==> 'Normally',
> 'gurantee' ==> 'guarantee',
> 'guranteed' ==> 'guaranteed'.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

