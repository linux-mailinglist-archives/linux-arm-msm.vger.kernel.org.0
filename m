Return-Path: <linux-arm-msm+bounces-63421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBEAF5C41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6487B1896E8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6873E2D3724;
	Wed,  2 Jul 2025 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VqnWTv+b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92DA30E854;
	Wed,  2 Jul 2025 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468846; cv=none; b=B+iOMrrdXQbHU+wFsTZ4/5E/wAY8hUq/1rwKDZ05zfNOyx37PS8hjvmokaK4AqdBz7Pdcp1oW0rX6M8KyQffZika9ic+TyFJtTjaoKTXih3aHZTvcVH0soXautwcz+PjTYNz5Pdz4ccZOgX69ghGJfABvTrFiUSgk8n4xBbjA/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468846; c=relaxed/simple;
	bh=O3E9T0uQpIC5T5vhtzuhqv77hqZKnlLyN1ssBednfSI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=o79i2/TEQH8MjPf+O4P3xubHzlI3TBRCcSUARLKHRtNOO+DlHs8MvW3RGVOf1rv9wa4XoOfoaMbE+WuU1cCLZr+f48vjhLnKXstwHsFUZ5A6pL/7QWFlOquJH5rMifM+bvHmTixEtf3Zi1T4yvumP2m6rwIbSCjfziaQ0QPsIjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VqnWTv+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EvuiN032762;
	Wed, 2 Jul 2025 15:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtyspUw8a4/yRrH4ykcrFo3fVrKo/gutBGuVYi4R9+k=; b=VqnWTv+buRaoUINB
	GPKfANRaUgrog5JqVfoXkx8E50Di6j0ACjFap49uQ+DBtSo2K+eXQezezYP0WMxe
	I3bvW+cVKYUb8sHtnFTESo2EFlOqOABCZaM8d9F9TG+McrHCdYHfTcrRaMvw2uUN
	cCOE3N+X7p98odVYmk5VWrFxkS8L+xbA9yKfowD5TD4lZIJhX6PZiomZdjcqSmSC
	Rhyn7UD5h2sdO9owvw4LhJt8mRwSbBhuIr+vfOhwePeJ7MLgFOMAsmD5kpGrLplk
	6l6XAb2xm/aU/uY6ur0/j7gFi3UI4xcCAp1+wJvTvYgQqdbggn9s06nNoGwBBPbW
	L+tC4g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmcyx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:07:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562F7Iur032753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 15:07:18 GMT
Received: from [10.232.155.112] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Jul
 2025 08:07:16 -0700
Message-ID: <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>
Date: Wed, 2 Jul 2025 16:06:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Youssef Samir <quic_yabdulra@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <manivannan.sadhasivam@linaro.org>, <jeff.hugo@oss.qualcomm.com>,
        <quic_carlv@quicinc.com>, <quic_thanson@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
 <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
Content-Language: en-US
In-Reply-To: <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68654b27 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=OptpXa49IPl6w_Hr0P8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xRzBhJRY90T1JCLd7pLpTFfPaGWdPdyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNCBTYWx0ZWRfXyc55dslpDuzv
 0BACcclWDhMT6zYtpD/oOXeW4OP96m12exRHj0zyMotMXkyK3ic4yzbbiPEKpRjwXRmmzeBKW0T
 8CpH5+6lyg75UapfErnmTu+x+eWAnHaSlQ4NGzZxBRlbshubOa0zW8f4C9K+MUjnwIhzpVRt/fd
 fkDwnEdklD8Lohhd4asAokaDwVuWLfEQTR0LSrwhKa28p5yjSTx+ePXX7cFnJTsd/bSwSWRhBCC
 o/OHO3WjPkQzl0pLhBs80BljE4oaayqmLipcT7Z2xX+JOesJZSLMB88LHykBc7ijnQumxu84Ggr
 mcakvHSHPAOCXCc4cnQIiB+MZVGwe5Mpu5MIV6gL1/j7hX+WNAI2vYd8cMQxm4Ii2fjkqvojjnI
 KcXsaL/GfeYyND1gZw+kgQFUmVC7Zy5jIrniLePrR4+GT9mWA7/LXWuZpEpRMnZhD+OiJ7ZQ
X-Proofpoint-GUID: xRzBhJRY90T1JCLd7pLpTFfPaGWdPdyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020124



On 6/17/2025 11:24 AM, Manivannan Sadhasivam wrote:
> On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
>> When a remote device sends a completion event to the host, it contains a
>> pointer to the consumed TRE. The host uses this pointer to process all of
>> the TREs between it and the host's local copy of the ring's read pointer.
>> This works when processing completion for chained transactions, but can
>> lead to nasty results if the device sends an event for a single-element
>> transaction with a read pointer that is multiple elements ahead of the
>> host's read pointer.
>>
> 
> How can this happen? I cannot relate this with the scenario mentioned below.
> 
>> For instance, if the host accesses an event ring while the device is
>> updating it, the pointer inside of the event might still point to an old
>> TRE.
> 
> I cannot interpret this, sorry. The host is supposed to access the ring elements
> till the RP. Even if the device updates the RP while host is processing the TREs,
> it should not cause any issues for the host which only sees the used ring
> elements.
> 
> Maybe I'm missing something?

Hi Mani,

This is related to the behavior that 'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'
aimed to fix from the endpoint. The scenario I observed with a device using drivers/bus/mhi/ep/
involved the device sending an MSI to host for an event that hasn't had its data
completely updated. the event could be pointing to a TRE that is not local_rp + 1.
As you mentioned, the host will process all the TREs until the event's rp,
which allows it to access data that were freed or hasn't been written to yet.

An example of this is qrtr_mhi, where qcom_mhi_qrtr_ul_callback() gets
called to consume skbs that were already freed, which led to refcount
and null pointer dereference issues that caused the host to crash.

This happened because the MSI would reach the host and get processed
before the device was done updating the event ring element. Even though
the aforementioned behavior should not occur with 6f18d174b73d, this patch
aims to harden the host implementation by assuming that the host will not
receive an event with an rp that is n elements ahead of its local rp, unless
it is a chained transaction, otherwise, it is treated as an error.

Thanks,
Youssef

> 
> - Mani
> 

