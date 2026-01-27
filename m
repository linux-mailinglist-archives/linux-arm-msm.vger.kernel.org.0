Return-Path: <linux-arm-msm+bounces-90697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCXSEt6TeGmxrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:30:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7792CFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01352301442D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E3E33F8D9;
	Tue, 27 Jan 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTLwNie5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZX5WtoPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5133F373
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509846; cv=none; b=e0xi/RBlOTIrOtug/loVV0IPPINp91X9+8ZN9KN2QjK+9g2PiOh6pw2r/Lt3Iqj+8LzOn+RTbX4gxJFkZTGvUtmq9DvJ0AfuKdYil5Dh71TpaIngw3jiawcJ9v2ctQQneAr1EpG1nKwjLUeLN/8l8fpeY08sp8F5swAyEUrWW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509846; c=relaxed/simple;
	bh=bCw5C2opoTnnSgm6sgEB3kbYxO2Va8uD0u/a6U9QAIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxvZFfHeNlzOrRFCu/L3GXSPkBMBlci+vlFDjBMALK3BrmFpBk6uaKMbHHNS7hbEh5WMg1Fl1o/S3/0tWYJEqAyU60v+Md6C0l1eqjSEnG4FVLgso6AFy5OmnPFyf0cHOwQhu3Ih7cII0bkuc5yyIMRbip4XHFUThhqN7uR4lCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTLwNie5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZX5WtoPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAMtOv184760
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZYKX34HbyGd3trz45+xdQmtQY+aPDvL9EcsqKfZ20s=; b=LTLwNie5R4NqQDe2
	D3C0VRXvK5iU8BwLWbYW8e4NTK+9jKG/6gqgcuimZEOAzcbVzlcabXRext/nK7MI
	+dX9NkbojnDUeo87cho2BUcoAR0+n5ubZjmhkr2wwL/40A1hfTODaESb2w7ksexk
	UFhZs3IE2BiBkCN/OkIv9JkU4WE+VSLReh4JR3X0QbiNEdxY7K05VC/Obw3tYFiN
	iPsFNTiiX9y65LA0nT3nYnOgd2L+UmVdFM+xv2OpMXr9DVF7SeXAUWj25/dC1OR2
	0YTwF/V/CGBVICOzbsfkE521NNwY1QCckE3PuN/ixZD4DSIZpXgSoLvdqmqme/oH
	VKNNuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9jpej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:30:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-501468a59d6so6543791cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509843; x=1770114643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZYKX34HbyGd3trz45+xdQmtQY+aPDvL9EcsqKfZ20s=;
        b=ZX5WtoPSekSqnEEaQhnqcwnLrdO+xIw8MrZG5ygTEsyzenxSKJlF37WFdkGpNe9FQP
         CSDaC68pqkNdgdjg6XU54hmZt0p73iZ2gA/Z5bzCzQqW5UhvIhfJmH/8XbSlxSAg234S
         5kKurJzNx9XUdmOzhfuFXPjxf4N4+EuLOz1aDN//0ha4bnOlyUDqyWmx9iO2Zc1lO7qf
         lC8tmBpBLyI7S3YVF6k8YPMnSgBTJehdMrdRFXp1hV/xCfjP9mCSium7hKaQR1/5il95
         teV1UsmPB8wb+cpI+XSM+ChpUgHWj9ZehmIZbY4L2/GaqX51wh0OZWM+Ne83hMriXJkG
         J+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509843; x=1770114643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZYKX34HbyGd3trz45+xdQmtQY+aPDvL9EcsqKfZ20s=;
        b=WxqXVpzwNqih9q9raSj9kmaaj9mPw/5p6alZ1Wf52hokvJFr/kgGNFh8/TvaMjA+vx
         eKH3lcJ+1dhIM/H+ypfdvk6Bi+EXqyCKbSIsQZ3vLMlozaMQvAMRiEF2TzcpWYda6T3F
         O1r0KqEqIAXeoZiuJjYvepQP2P4hqOnE5dJ16XyHgdTR1XihwLy7obmKUBwhA3B/lGlF
         ADIOTVa7LTLtTrh+KzM8plfjro8GEt45uco448MhbTC8J0hj9Bg6psJeOxrcMBuvwK7m
         vPrnZAG9v0oiqfv8JHxw5BkqrDdYHL21WHjy+xcs7rvlo/PNFmHGuXY3AuhBQ/kyzihI
         vE/A==
X-Forwarded-Encrypted: i=1; AJvYcCVjExjIXZjohogANm1MehLKsMRTDGUQ2kPNTXuYBiDBeARb7A+F8l5VyG5IqnDyCIoFb8sL8JS3QuC7qLlW@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4YFoNPodC8Sh4ycom7+3yNv3Z88Ew+SWWfxJLPjSUWg5ItAA
	R1ZJiElBKMniNZqekz4+N+/ktJoLjzYIulMVtH1gk+VEqX9a/wBMpxOVEx4ssNt6/+jlMr/NEVe
	a3Zui97KSRGGFY9sM1rUf/u12xlyZGJZ+qNfHTBJx3/Rurp0EWd6+jeOyzXxYBXQcD8QD
X-Gm-Gg: AZuq6aL9vwPKuxeN2FYkPza0zEEKuy9vxwlWTfN4rPBeem3gILYmhsBVYB6QaMu6+n7
	puNjXqaFr+6cWnBuCmxG2gFlYvOvH5pAD2G4Q9+ssMy1VJd28e+AMxQ4+2pSIno2Fc2t+Etv8YZ
	JgkuP4QanvOm8IOnbp9yNl2zAInwcu+tw+dlo/Ad8wpIAPa7m+k6qidjlLNUv+pC3z18KxWr8MM
	QuJWnthIAIQGIjJUU9/CS/in3D0eUtw2ruwNq7ZuZr49MWW2r77Lf5FzER7dZud0uCPJT8nwAoC
	O/iZygb/EJpzjrQnzaxDzasY4FLizh9LN99vdLQwGcwt32eiYZMpzb5lzxg5uLdTN6pyOqNerD9
	Hbpobv53GpSJUKlY3UottDHJ1TMLjck5qdBZRcjwvFOM511VGj/g9qMgeyTWaGfeXNac=
X-Received: by 2002:ac8:5988:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-5032f9f14c7mr9458351cf.6.1769509843461;
        Tue, 27 Jan 2026 02:30:43 -0800 (PST)
X-Received: by 2002:ac8:5988:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-5032f9f14c7mr9458111cf.6.1769509843081;
        Tue, 27 Jan 2026 02:30:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3ea422sm6007927a12.10.2026.01.27.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:30:42 -0800 (PST)
Message-ID: <80e774c9-c4b7-4129-aed4-17830377bd61@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/7] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
 <f34abcca-6b09-4f6c-96f3-e2295a82284e@oss.qualcomm.com>
 <bcc3547c-b7d5-41a3-b291-4669c11d7f1c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bcc3547c-b7d5-41a3-b291-4669c11d7f1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=697893d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vvjh0lqrh_H4iIbA9MMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SbWLyKhS97o08IQ8RtxXhs8lSvgEjnCa
X-Proofpoint-ORIG-GUID: SbWLyKhS97o08IQ8RtxXhs8lSvgEjnCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NSBTYWx0ZWRfXzDU9CfbMxx3J
 2JNOZPcRMzWn1Hz6biP8IuzmBKMFzbnAcN0TwIMYFR3yV9SNo+cp48oJ4lU2BmMYIpqwGqT/FxM
 Ba/b4z23Sv2PyavUgc1B4HqKgYp7LF+V5y2zvGrgtFsVvwwF2cvE0P+HvUG6c1TMQOQeDc6ECTE
 2DsyC5WPrdveT7Je0jqYvBPqT2Y0MF3O46DAaKHEETZcvl6rGwp4hrk9DCNVrj9kUKKcuNc3zMl
 zgwd/LC0G+9v9VujsxVhmDHLizJqIU+hlM4q8JeZiNHNEqRwQVXJ/7gUacJBQQnWJcvZflrIFQA
 bRRcMMMwf95NhHehhwfuc8zJg1fxn89oA51K1LXitdF9p3Duj8j8uh2dwTwytvuWqqiJ1CjsbV8
 4vVaoQKlgQ3kCxcMtjpnuoj9iNmkgAYCgDylwC0YWARXY55pJJ2QG+O8HP4+z4yOesIf3NdMD1c
 wdE3+5v3Mo0tD0+FnRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90697-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CD7792CFB
X-Rspamd-Action: no action

On 1/27/26 3:23 AM, Songwei Chai wrote:
> 
> 
> On 1/13/2026 7:09 PM, Konrad Dybcio wrote:
>> On 1/9/26 3:11 AM, Songwei Chai wrote:
>>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>>> configured in each step and the trigger will be created once the
>>> requirements are met. Add priority functionality here to sort the
>>> signals into different priorities. The signal which is wanted could
>>> be configured in each step's priority node, the larger number means
>>> the higher priority and the signal with higher priority will be sensed
>>> more preferentially.
>>>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---

[...]

>>> +    if (tgu_attr->step_index < drvdata->max_step) {
>>> +        ret = (tgu_attr->reg_num < drvdata->max_reg) ?
>>> +            attr->mode : 0;
>>> +    }
>>> +    return ret;
>>
>> This is very convoluted
>>
>> How about:
>>
>> if (tgu_attr->step_index >= drvdata->max_step)
>>     return 0;
>>
>> if (tgu_attr->reg_num >= drvdata->max_reg)
>>     return 0;
>>
>> return attr->mode;
>>
>> ?
>>
>> [...]
>>
> I agree that the expanded form is clearer step-by-step, but I intentionally kept the current version as it keeps the bounds checks localized and avoids multiple early returns in this simple case.

Multiple early returns are not an anti-pattern to avoid

Konrad

