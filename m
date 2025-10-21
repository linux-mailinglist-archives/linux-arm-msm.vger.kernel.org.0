Return-Path: <linux-arm-msm+bounces-78131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F322BF58D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BBBC4604EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5542E88B0;
	Tue, 21 Oct 2025 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2B81IgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC712E6CAD
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039584; cv=none; b=sq0bBej3nmtPUaQs4m2r+zCrItVQIKkJiSoI3rl0AOOzA/PvZ9CZUNtbiCl28I0DrlC33uj2l4/G0VY/pgN0JdeNnSMsOqSwiGfKOIvt84cLkavrMNOgFov7nmFBSLHcDahCK/4bnCzf1b7/w4sEWEnQJHcs4k45a6kfXUFwYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039584; c=relaxed/simple;
	bh=qUlnpjeYW48Wr0PjJs/bMwTmBoj9q3r+LLsVNiIOhFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mqml7gm/fv06yBsxvatj9jr6lOqFdJlqBo//81T6bdrL6iq/LDb66OptvnA3IJJkr+uf6WT6yBRCZiVShaYI57QnUY3FBo7vg7psRMEc4ibseu8IooFOdZ3BgXXAQUJ1bB+1LcUWrF0GDWMtQlzS3/UrQPTWsmJOm+2b2/Btwdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2B81IgZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8QZkJ025245
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DmNpI2PFyL7gAvTOOzSM1Wwvj+YScqMSXFzuum/gIZ8=; b=g2B81IgZh/Q4ypvS
	tu0gOiAtoB2AhpK7Z7/IYepjp2SHab5abSYxPcf+gDA+477l7APzSElt3ahXFz2X
	TS6T15ddTuSpc0tXoK4wHyo+uMtQVZ+w8ml1YvuwhrLWGqrZskq1JF90j9j8uFxM
	drOw0PxfGC9D3HPHeEcmRWjHtikGQkIRExboPQ5u1FQiaDtq+mDDhgHUzYO63wD2
	LVwpSLJfPo8GgfHqPN7dmFadBbDmFZEgH7urOpx1fw8WRLXsiH+vm2XXSV0b7ycw
	RpnCPHzXu23LCm5tnpoNvoOHK5nYj+3WPZJAL+y0bpo4Vr5yqU25hilynxVg7vDg
	wDB8Pw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w808b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:39:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c28cecb4cso14154216d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761039580; x=1761644380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmNpI2PFyL7gAvTOOzSM1Wwvj+YScqMSXFzuum/gIZ8=;
        b=sPHhkGBgWPs5IVsjeIXeq0lfTR+c99JEgoNWjOenD9ORQm0ZK2Z/U01U2R+NC0+DTt
         mpCg/lbojUqwDQWTwXcOcWFxbjB+QcF+n+54MSLHoGn0ouM+L+NsjKB3hq20PTbJZK7k
         aUaddh/gM5Z5NkcURDcpzowYcHw8ovNFG1UAI4Q9Kw0N1Iic0Ybbbd9EYtTRwRCLnDs+
         F20CWTS70HywWyT3gmTJu3sBPkwHBKkjrbbi8iYzG2trq79UOoh5Vx7J+Yu0oicN4/rk
         23fEe3Lo96q7oL1wZ+SmbPGe8eP0TZRvdBxx6uR+r+TMvlm3aWB7BQmvo8QND5XHCyXe
         cBWg==
X-Gm-Message-State: AOJu0YxAV305EA/Dl/9efNWBB01hxFsQVY7w4GZuRn0Xj9tavY6Ilj4E
	JJsJQBmjJKvvjePxMeJMKDMI5bjG4/DP6JPYw7DWrd5aEUy7XTP22JtWubCG+wrmiCBdE0x+jt9
	rXLuT+ocE0LO2XAPf3HXw6Gc7s/Jzr+ifDbWIIf3TlC4HgtQg2jgWn78Zb6NYuXssrPPPiJc4AB
	jj
X-Gm-Gg: ASbGncuxgY+u1Sj1tkHkPGFNAF1KH0Rcgw5ZBfW7MGJUfKJDRJYfbhmOc5bcPpyIMoC
	/kI2yOxWzbCp+ue0aqMpQ69MkegepQS4nOVJSNLKMDqpmBtTD0x8yD7Ojdwrm6nr+6Okjt2jwA5
	+PbnO6zgsyEMZ23tLhxp5aSecT3gUE27PwZW3g+iSyr60dyAkPsKWPTATQ6HkvcC1gaVEazmQPS
	IUDa5hcN3EH63PqtqrNIIske+hBkQxWyMEQ6nWY4SCVlMeGgSEVURB9PCLhT0/LS8WzfrNQ/FWU
	a555MI7wVjV7Pxi1hsYXRQ8paYJgs7Hs3iQCURFrH/t8taFtHtw4IlG0RdDU50f0hqKezXSwp2v
	vZsIs1g5GeJ48uv79tBHuvIG7VfnD/DHPLX6CapTDgyNyQHbLcFF/JU8B
X-Received: by 2002:ac8:5a04:0:b0:4e8:9f31:dec with SMTP id d75a77b69052e-4ea117b10dbmr21342661cf.13.1761039580523;
        Tue, 21 Oct 2025 02:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6rNwhsDdnBGCRZf83g90l4+BAxf1E5QIzKJUMVkc4BEhDy4Fy39CzzVNB7EJBurhJpiJYeA==
X-Received: by 2002:ac8:5a04:0:b0:4e8:9f31:dec with SMTP id d75a77b69052e-4ea117b10dbmr21342511cf.13.1761039579999;
        Tue, 21 Oct 2025 02:39:39 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526490sm1027264566b.65.2025.10.21.02.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:39:39 -0700 (PDT)
Message-ID: <15617371-0b20-4326-8e08-2c20b3d3c767@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:39:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: smp2p: Add support for smp2p v2
To: Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>
 <bb25208e-a6a6-4a81-9dd5-5c5eb1cf16b4@oss.qualcomm.com>
 <ff382661-4d05-4f9a-8b9e-55fa9932a22a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ff382661-4d05-4f9a-8b9e-55fa9932a22a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX4lDCEhVIyWpT
 Y1rABwA1e07m6RV5uNco+mHXXeOYqG7sBSRiBv/RKbNNBoEZd1HoRhZektXCQ6Td6ed2kwOKURu
 kwRWUiDgtVf2iWEzizdQkmZ08onz1+YC7sU1X32Ht8RIr6zTLMTi6DHarteJXemX9YOtOZSRodm
 Zxu2yA83v5XELghZ3QsqKxmVWVToHCbJEAkvfVuiKokkUIv53/iBeYA3mIaL8C2pn78Ip9Uw9VV
 +sx+XLHnPB3g0lDenkB1MDC47wD/5o8uqH3z0UXprMbddOGI9lt6ReazFtJAVm/ZmMQl6SzBNaa
 IvTTOH0uMDn7ScldzHyWta0A4C/TV/6Bv+X64ILgeiBGLzd0v715cvJhMqwJYC9AHnYE/QJ4vqY
 RHO6zvlqGrEQkM+X/cne1ecJ8ng5sw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f754dd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kMNSRdB3-21TAvZhXxQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: U3P2DEaLv-QsJPm5yadH8wrcH39ygoFa
X-Proofpoint-ORIG-GUID: U3P2DEaLv-QsJPm5yadH8wrcH39ygoFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/21/25 10:23 AM, Deepak Kumar Singh wrote:
> 
> 
> On 9/24/2025 8:27 PM, Konrad Dybcio wrote:
>> On 9/24/25 6:18 AM, Jingyi Wang wrote:
>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>
>>> Some remoteproc need smp2p v2 support, mirror the version written by the
>>> remote if the remote supports v2. This is needed if the remote does not
>>> have backwards compatibility with v1. And reset entry last value on SSR for
>>> smp2p v2.
>>>
>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
>>> +{
>>> +    unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>> +    unsigned int pid = smp2p->remote_pid;
>>> +    struct smp2p_smem_item *in;
>>> +    size_t size;
>>> +
>>> +    in = qcom_smem_get(pid, smem_id, &size);
>>> +    if (IS_ERR(in))
>>> +        return 0;
>>> +
>>> +    return in->version;
>>
>> are in and out versions supposed to be out of sync in case of
>> error?
>>
> I think that should be ok. If we return error smp2p connection will be completely broken. With default version 1 partial features can be supported even if remote is using version 2. Some features like smp2p connection after subsystem restart may be affected by this.>> +}

Perhaps a different question is in order.. do we ever expect smem_get to
fail under normal conditions?

[...]

>>>       /*
>>>        * Make sure the rest of the header is written before we validate the
>>>        * item by writing a valid version number.
>>>        */
>>>       wmb();
>>> -    out->version = 1;
>>> +    out->version = (in_version) ? in_version : 1;
>>
>> = in_version ?: 1
>>
>> Konrad
>>
> We want to assign in_version when value is 1/2 and 1 if value is 0 i.e. error case.

That's what this syntax does, with less characters

Konrad

