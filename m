Return-Path: <linux-arm-msm+bounces-29772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC47962899
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A6F282E35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CC2187FF1;
	Wed, 28 Aug 2024 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JM1M96AP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4DD18787A;
	Wed, 28 Aug 2024 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724851616; cv=none; b=ufCNmGR01ub7KKsPNY4HvrjRfbgkVwEjBz3Lj8txEgo2c4onuFm2HZAfZ354AanJxHnqKffUzXfs/U0+e2TuJ5uV3AHwQSHfoH903bYFjiHpiOIOOVkvK1z3tGL0sFK610RYs5aRBhL2KupIf937L00wwI+6bMjOzgcIdrNpm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724851616; c=relaxed/simple;
	bh=mKdxNze7LPA4BnzxUsya7Ql3UraKCjFaOUd1Eufz3O0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VVvHqCy5DXjlCu3BH0xNgGSvPBLwI1hpfrnPhOTY2CRuBpQEt+mLdfzLSfrt5WLKUG76SyDaLxG4tmBIfqbax5CfHmWwDdVzhaIDhuxr+88vmVM4NDqODVNbqcYT81gYbCMMCy1bZpGsGKCP/+27RdXCSNpuXtZ12HgiJTPZT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JM1M96AP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SBCCxt021403;
	Wed, 28 Aug 2024 13:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mFI5+1z5+OavddQsnH/J4iei7eW39BBAS7Gf4z7qdg=; b=JM1M96APN7/rlM7T
	m2ALUqJbQRNFcIBJimT2vEIrWOxthXpXRF3Kwm2Uu13ROg4JN3oh7xCTZ4tHOduf
	RV6tdJu+OoLIcWvsg8kUHOl1D2kF/Fhh3HHiouH4IxpGyTNojHVWFCgYJEPAHT+I
	53SjrUSXAWkioaCNq+UKWjxhcxlljDfdth5EYvPnk3kOwhRqdnVSukT+86IKru+K
	yb4OTp+962V6Yb5r2L41RVVLldnoJv2RvHm68NWoTrTAuget2br/77UY2pN5xI7x
	2cCj6VqL3sGc94es8imuaKweyt35gH7skIFNKrPnUmAyQ4eWGtTdMONGGNnXH1HY
	TvqDwA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv09uyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 13:26:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SDQBYK015130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 13:26:11 GMT
Received: from [10.217.217.229] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 06:26:08 -0700
Message-ID: <7849b980-a804-4375-b2c7-0643aad581d7@quicinc.com>
Date: Wed, 28 Aug 2024 18:56:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: qcom: update MODE_MAX cfg_bw value
To: Bart Van Assche <bvanassche@acm.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
References: <20240828120502.1439-1-quic_mapa@quicinc.com>
 <2cfcaf59-fc6d-4f89-a24f-6bc028956c78@acm.org>
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <2cfcaf59-fc6d-4f89-a24f-6bc028956c78@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OjOcD7kntJMbGObxCjlm7f2QqLdnHh78
X-Proofpoint-ORIG-GUID: OjOcD7kntJMbGObxCjlm7f2QqLdnHh78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_05,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=741 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280096



On 8/28/2024 5:45 PM, Bart Van Assche wrote:
> On 8/28/24 8:05 AM, Manish Pandey wrote:
>> update cfg_bw value for MODE_MAX for Qualcomm SoC.
> 
> A patch description should not only explain what has been changed but
> also why.
> 
> Thanks,
> 
> Bart.

I will update in next patch update [V2].

Regards
manish

