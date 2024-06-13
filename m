Return-Path: <linux-arm-msm+bounces-22659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CECC907F4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FBBE1F2359E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FB9140E50;
	Thu, 13 Jun 2024 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kuxk/GM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23EF811FE;
	Thu, 13 Jun 2024 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718320715; cv=none; b=BKHcmtqgUVhkV3rVoLxBC0trmRrGFdcPvooUG1nrCPQDiE8FVrWlO+hql0q+cwsG7cejKH2HqOklHZnBZs3AdiReLF/dQ63c1K0NvThsR6ajQdYxdkaSXUQqU1s1tauTddYuGfINsLNdg3ORdjNe/gSqkHUG5Y7B1woKsxhE6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718320715; c=relaxed/simple;
	bh=0GmEVnbOy5Dqw6LO3CACFa9e3uDVnQKfVGU+o9gv16I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y1fW55rGqaHmcks3YZABtWxHr8hOqP9SGbsz0ZMZA4zxmjkx2PCf4QyJWTJDe0beiYhNUqCeN76Q+I+NIsyWAcKDRu0b6efoDBGiVJeccrTnROk/uPYm9LoOpn5shdJeZgJLBhWsqdtgPKwvSCZuG2uXIjUhQSh1NHfSVidf0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kuxk/GM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJH4FI000770;
	Thu, 13 Jun 2024 23:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaVJbksqBdaeWCbd2M/+/BZR1EwNQVHurs2U3sClB2s=; b=Kuxk/GM+w/VSdFVr
	zqtlwTB1yWaDNN3j0lqX/VM9YR8HQfoJDyQJ+P6l4jKSAy0qJYlrOhswaHTZu9ba
	n7mfDUrSxDl+QZ8Mx0bLeG+gIQzFr/dFD7/Wy4VDpQZp2PqOGeIbT/X3RgXlGjZu
	lMM+rubSHayGz7Qoq22dz8ec8pWUoy7OlbOxVLblllM+Fdl3Updfrgv/PZBipZaR
	nt7r/qwvIAvKxf95NNPAC/6EuCTtUJeTYEXgQirvbcY7xcPDPvVvg9HKwdYBG4EC
	u0j++nw78jvWzz4s3S4rU9yeCRry9kBAssSTB3uGkjo+ePl5pZo/d0cFXpyGuR7B
	kAAQ7A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q38h0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:18:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DNIQj1000452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:18:26 GMT
Received: from [10.48.243.167] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 16:18:26 -0700
Message-ID: <f26d6000-0431-42ef-9e1c-bbf4e5010feb@quicinc.com>
Date: Thu, 13 Jun 2024 16:18:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: qcom: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Can Guo <quic_cang@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20240612-md-drivers-ufs-host-v1-1-df35924685b8@quicinc.com>
 <132dedc1-ee11-44d8-b684-0ffbf994d164@acm.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <132dedc1-ee11-44d8-b684-0ffbf994d164@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FTzuXVI8-5TGMW7C4_8y2A93QqnTW4iU
X-Proofpoint-GUID: FTzuXVI8-5TGMW7C4_8y2A93QqnTW4iU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130166

On 6/13/2024 9:19 AM, Bart Van Assche wrote:
> On 6/12/24 9:46 PM, Jeff Johnson wrote:
>> +MODULE_DESCRIPTION("QCOM specific hooks to UFS controller platform driver");
>>   MODULE_LICENSE("GPL v2");
> 
> That sounds weird to me. I think we are better of with no module
> description than with the above description.
> 
> How about the following description?
> 
> "Qualcomm UFS host controller driver".

Sounds good to me. Will spin a v2.


