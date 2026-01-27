Return-Path: <linux-arm-msm+bounces-90645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIMdDVI/eGkzpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 05:30:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B368FDB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 05:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 446EB301AA6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5B22D23A4;
	Tue, 27 Jan 2026 04:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hZ7AEPLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2403621FF2A;
	Tue, 27 Jan 2026 04:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769488207; cv=none; b=hCZ+Pb5SEPRynIyz7EagjrNKCIH24jsdtIfnnxwASKK3OcIT0gZbN0c3p52aY4M9wcPlsW+ybqJmPSwyvuE8FpaxQTEnP77VBk0ww2yV2Yv4wUnNl47DvdfzuY2k4d13+z8g0OUTjyoKt+eXNnn8y43dDoBWvvqNxaflFAzD2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769488207; c=relaxed/simple;
	bh=RwvJ+AmeO1+YMd3CdoStX1NGv/XKM84w42mFOWBKjAo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=S/uJYdziy1kk3fMwVM7PGfYonEziPClbe7bULxTRVMRikbxKLn9j6CXuz4cEfVvDAPlfUC2yvVTe46vGPCNXL15VBTzDk3vETrw8NSXo8wFPmkBld3X/aS3Om/I504ibv8OpkzYk63X2jEdvkwLbH9GzBeTRTKlwXTiJxUukNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hZ7AEPLZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U1SQ786410;
	Tue, 27 Jan 2026 04:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFE7dQda9qtkFg+LkmDx1nO7I4NND0Z+XY76y8FL9C0=; b=hZ7AEPLZqcb/0ho/
	RehAjbiRAT3lGjsYHrNXWpfVJBQijuZczaMz6izNA7gq7MMCBZo3cXJY7OdnOoN6
	o0TTBGIbaG8sKk51TSNcH+Dhv6sVrbNLY/LTrpPm0a2qjeYdm9r8DTlwp9lNz6SW
	KS5xaSXtOT8iAI2hqgevHbhAvOyLjrshUKajY9Xlpel7uW4aKAOVlO+Kt/UJsSuJ
	6g0B3UoyeaGJ4bGCchMeLYkHUipnEvVXlw5aYdyzCM0VND8xy3Q3teKYZswA7CiZ
	Dn75QADMWf9qRZqenrby+5YwPO7HD0lEiPZH5bws9VtekGiBxceZtP/z2rHA9vzZ
	m+m/Xw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93gyjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 04:30:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60R4TxvH020689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 04:29:59 GMT
Received: from [10.216.11.168] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 20:29:56 -0800
Message-ID: <c1749b86-0016-4314-9497-04e952683060@quicinc.com>
Date: Tue, 27 Jan 2026 09:57:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
From: Udit Tiwari <quic_utiwari@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <herbert@gondor.apana.org.au>, <thara.gopinath@gmail.com>,
        <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>
References: <20251120062443.2016084-1-quic_utiwari@quicinc.com>
 <a2c6cbdb-a114-423f-a315-6e5e9ab84e5a@oss.qualcomm.com>
 <ec9e420a-932d-4265-8cac-dee003933898@quicinc.com>
Content-Language: en-US
In-Reply-To: <ec9e420a-932d-4265-8cac-dee003933898@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAzNCBTYWx0ZWRfX7h/PAFpGXsi3
 qTdXxEPRx0aEhKQk2ZiJxF6uyzk63vfXF85ClE0wImzkE1B5DVBAIKCw0Wrmnj/zxY9/G5i9h0y
 ABFY2A4ZhO95s+2IE3z27pH1PqmGgOFMoNfo/slX7ndXPPcX7mvtCnky/ZTGA1mbRtB6Ywrsqly
 HE3214iUoavpFOP5W2MXpFxyYg69PF1CvoMmR2QdQeaL8pjBrrPK6yLynX3o6psRVnQ5P5w/XHi
 Aijj2HM+taKX/1CcDphXTwg0lMtrxsg34kHOHuU+5CekAIjs0zaYGpwOiljIr3h+Up2RpijklGX
 fFRY+Cle6jMBSL50MuOUwcDq2RPnm/USbwTazi1wrrhqnWHQRCFkaUse0dRKHy25VNImWc/q54z
 sPEnO4eO79vJbelN2nUWkkRcmoHuCebFNIhtdZcrXpMX10zSb3To2kgGGJ5mYwULOpmBw6mfKwK
 BW8aOg6pTrngRE3UXng==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=69783f48 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=xR5F5m13uLKCeNYm5akA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8ldWihV828y3rA0ZZesMeUEzID2GlsL4
X-Proofpoint-GUID: 8ldWihV828y3rA0ZZesMeUEzID2GlsL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net];
	TAGGED_FROM(0.00)[bounces-90645-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[quicinc.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_utiwari@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88B368FDB4
X-Rspamd-Action: no action

Hi Konrad,

Gentle ping on this.

Do you have any further thoughts on my previous reply regarding the PM 
runtime optimization? I am happy to spin a v6 if you view it as a 
blocker; otherwise, I would appreciate it if this could be considered 
for merging as-is.

Best regards,
Udit

On 1/6/2026 10:41 AM, Udit Tiwari wrote:
> 
> 
> On 12/5/2025 4:59 PM, Konrad Dybcio wrote:
>> On 11/20/25 7:24 AM, quic_utiwari@quicinc.com wrote:
>>> From: Udit Tiwari <quic_utiwari@quicinc.com>
>>>
>>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
>>> runtime power management (PM) and interconnect bandwidth control.
>>> As a result, the hardware remains fully powered and clocks stay
>>> enabled even when the device is idle. Additionally, static
>>> interconnect bandwidth votes are held indefinitely, preventing the
>>> system from reclaiming unused bandwidth.
>>
>> [...]
>>
>>> @@ -90,13 +93,17 @@ static int qce_handle_queue(struct qce_device *qce,
>>>       struct crypto_async_request *async_req, *backlog;
>>>       int ret = 0, err;
>>> +    ret = pm_runtime_resume_and_get(qce->dev);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>
>> This is quite new, but maybe we could use
>>
>> ACQUIRE(pm_runtime_active_try, pm)(qce->dev);
>> ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm)
>> if (ret)
>>     return ret;
>>
>> and drop the goto-s
>>
>> Konrad
> 
> Thanks for the review and suggestion konrad.
> 
> The optimization you proposed is more of an incremental refinement 
> rather than a functional fix, and I’d prefer to keep this patch focused 
> so it’s easier to review and backport. Would it be acceptable to merge 
> this as-is and handle that optimization in a small follow-up patch?
> 
> If you consider it a hard requirement for this series, I can rework it, 
> but my preference is to land the functional PM support first and then 
> iterate.
> 
> Best regards,
> Udit

