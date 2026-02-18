Return-Path: <linux-arm-msm+bounces-93245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id As+UJhtWlWnPOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 07:03:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84015331B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 07:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EA45301874D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 06:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BB4283FE2;
	Wed, 18 Feb 2026 06:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MWgGuvcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4577023BCF7;
	Wed, 18 Feb 2026 06:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771394584; cv=none; b=qmA/s+62G+rrN5sG6fIm8xoJXx2IlQkrMDn97to7QtFn1kr/0N2vOiq/u5eQgOx1v1h7CNjxVYSM26PFILvjM3Keb05GZzV2xONzG/zLvDK6Gzm5taTVG9UhKQ6h6EgBNBGSFZ71WlmHhy3O04f9I1ceG8Q7pfFaYXaJs/RrlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771394584; c=relaxed/simple;
	bh=FLSaUcnhRMmJTTZlYiOrItHk6oWRtHaApwMaRcBkuBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TNFSWnfKY535cPDAlrrJxDgeP/dEi5PaW7/OFjGl3bdiz5jU2x6lvNRMxeFbeigzNjw3lwib5WFMxYfXKvGmK1Hi6KwreLObYRqX+l7f1if+4TRPF6EzEcoyBGuMtpWC1J1LHgcFek01QVwp7LtBSPIGoWyErI8MjwFxFVC14fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MWgGuvcU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HIm7PT1942831;
	Wed, 18 Feb 2026 06:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbsdvc0Yn4MlU50LdtqjV/oqaKXhDr+OW6vyswGajKg=; b=MWgGuvcUaskA4DAT
	VKXlrHq7eOwxH+DZoXvWeNlqv4jSos7b/itfjjSTnhBEX/x/eTyRVJEK4lXjH9XD
	LUWFuF+YPzasxxlXunmyG27R/oLxmp+Hq0CRLIrW/L+BoWAaSJDG6gn4CihdBTk6
	zpzQwiqkD1fTYUC62VxvO9dul1si4FwJB3uW1u75oRJTiG2rxzg9DFkoVSuKWL7j
	3iwewIltvk6/b2bF1cN951k8cztrFxYm9JaJdMuKosbaYxowsGuCfFQJhKsEcKSE
	RU2IjB/pWDsAe3DVczEE1UTwWhIhqfY7Mz7ZUmtmKwL698jPNEC+wo4FiUqtV42p
	99Jqww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g32ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 06:02:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61I62u16026322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 06:02:56 GMT
Received: from [10.218.1.24] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Feb
 2026 22:02:53 -0800
Message-ID: <f4e1b449-9fb8-400c-ace9-bfb6b967bb13@quicinc.com>
Date: Wed, 18 Feb 2026 11:32:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <herbert@gondor.apana.org.au>, <thara.gopinath@gmail.com>,
        <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>,
        <quic_kuldsing@quicinc.com>
References: <20260210061437.2293654-1-quic_utiwari@quicinc.com>
 <e5fe09e4-758e-43ed-a134-55bcf3a198b7@oss.qualcomm.com>
Content-Language: en-US
From: Udit Tiwari <quic_utiwari@quicinc.com>
In-Reply-To: <e5fe09e4-758e-43ed-a134-55bcf3a198b7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA1MSBTYWx0ZWRfX+//3NqJFwtzF
 bPOdkJLKrNtrhw4vynIWIwu/ysCiLVwKqqKnn8aHR+RNhSc0wdQND0NpBX/LEGmS3+wcJh4r6O+
 QoKc2Y1H2LJaYNOxxfLTnzztjPlzF9OWRTTRqrUUxmhSTToYvWq3o6zaQQifRsoGlLLYsfQ1qpj
 y1rWx0lcYrNvCzys+lSz0EORL7/b47ukQfycZ+BjDFvJFUvjX0JeS643ETcmjQwC812j3D65spQ
 aj4mhmOD3pjHC88QRIblwGq2plO1F/7xSTEyUd++LlfNvajgoT15H/R31el/YgwiOvJNNWSg48g
 KbK1H5vhgJwMj7mCkDgVIoGm70rWhW2AprLCZkwnKR27zdR3+9b5Uyb59PtrnOK6bUVxN0p/Mn1
 3Qs+35Nx3x/1FH+tbbKxLsjGs/CbGR8gUJ526s1wd0KzIL9zjCbviC/g/bDEzNBFgEVwskU/dW8
 ZfMVBho3gxCl+uGk8sg==
X-Proofpoint-ORIG-GUID: MJ1uWJpYQxMozYEYp6bojrdxWoVyzJ5r
X-Proofpoint-GUID: MJ1uWJpYQxMozYEYp6bojrdxWoVyzJ5r
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69955611 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=g6ToMXbtmLYZwuAce0oA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93245-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:mid,quicinc.com:dkim,quicinc.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_utiwari@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF84015331B
X-Rspamd-Action: no action

Hi Konrad,

Thanks for pointing this out.

I agree with your points regarding the usage of the ACQUIRE guard in 
probe to simplify the error paths, as well as the redundancy of 
icc_enable in the resume path. I will address both in the next version.

While preparing the fix, I performed a self-review and noticed a 
potential issue. Since I am providing my own custom functions for 
runtime suspend/resume (to handle the ICC path), the standard clock 
helpers are no longer called automatically by the PM framework.

I believe I need to manually call pm_clk_resume(dev) and 
pm_clk_suspend(dev) inside my custom functions to ensure the clocks are 
actually gated and ungated.

Does this look correct to you? If you agree, I will include this fix in v7.

Best Regards,
Udit Tiwari

On 2/17/2026 4:12 PM, Konrad Dybcio wrote:
> On 2/10/26 7:14 AM, quic_utiwari@quicinc.com wrote:
>> From: Udit Tiwari <quic_utiwari@quicinc.com>
>>
>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
>> runtime power management (PM) and interconnect bandwidth control.
>> As a result, the hardware remains fully powered and clocks stay
>> enabled even when the device is idle. Additionally, static
>> interconnect bandwidth votes are held indefinitely, preventing the
>> system from reclaiming unused bandwidth.
>>
>> Address this by enabling runtime PM and dynamic interconnect
>> bandwidth scaling to allow the system to suspend the device when idle
>> and scale interconnect usage based on actual demand. Improve overall
>> system efficiency by reducing power usage and optimizing interconnect
>> resource allocation.
>>
> 
> [...]
> 
>> +	ret = pm_runtime_resume_and_get(dev);
>>   	if (ret)
>>   		return ret;
> 
> I expected this to use the new helper too, removing the need for gotos
> altogether (unless this path needs some other handling which doesn't
> immediately jump out to me)
> 
> [...]
> 
>> +static int __maybe_unused qce_runtime_resume(struct device *dev)
>> +{
>> +	struct qce_device *qce = dev_get_drvdata(dev);
>> +	int ret = 0;
>> +
>> +	ret = icc_enable(qce->mem_path);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
>> +	if (ret)
>> +		goto err_icc;
> 
> Just one of these is good - icc_enable() simply calls icc_set_bw() with
> the last known rate. Since we're not setting the rate any earlier,
> just keeping the set_bw() alone seems like the way to go
> 
> Konrad

