Return-Path: <linux-arm-msm+bounces-110485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDkwLDXfHGqBTgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 03:24:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A806189B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 03:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15148300370F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 01:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7EC1DDC07;
	Mon,  1 Jun 2026 01:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7ClhwIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzUnn8mt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A231A1A6829
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 01:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277039; cv=none; b=AZt8sa6zA/bQE3hF0wffJcQc4quI7z0qMLFaJSic/Hul76MTTbc/SLkRzYvQ15Z8qMfQ7IkRuej3NE+EIM/+pwTs0i4EEejcMUJ5lt5f90WE5qL/zhOMpKVdPccFTA4r8DtLN+W4sQLICtv6Lez2HUAMWKrGI5YJ3I3o8J4gdWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277039; c=relaxed/simple;
	bh=5yvpq9pi1njiTI+tT9DdBKCYnpSV6j72X0isl/ZWYcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjh1LMCnzxm4fABrW4cFq37zK6en5Kg7m99Cw5OOGGHaU77YOG58XaGj/bPHwP4HSAPXRqnl/4Xz2N169HQ3SWgwFkKW9uoux+6xVSFX9HzILxR815UK1pRxNYOa+zoeapx4rIGdVN5gt3qlpLQNNFlVaTKK3nqwBKJZ1DH2CG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7ClhwIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzUnn8mt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VKU4982502477
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 01:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQQ/N5JLV+fPflhn/nb0oSsHxPTvVt7khfwCnr2kKEE=; b=Y7ClhwILTxPJAO++
	x+fbkBA21A3z0KL5GTp7sKdpPwJvHOZk6O4/toVRLdgPbWdIcuzjrklxCtaa7kYk
	t39ZqMngz0bCf3j1EGS7iGD1jZCEivBQLvBeQmV1ELGcMh1Q2WHU3z147EsUhsIZ
	QpcHZXzLa1lY1zqy5+c1SHvkVSTAxjaqAsvN7BEHQFg4my15nsbNx2ucMaJEft/t
	ML7YkKJev8+LXyt3Et0jmR4vk46CvRELRLTAM4/tbGk9KEQTzm1jUJ4dh8YYgyBI
	0Z7HRKO+nXc7Gv/0zY8QD1IsLkyxacANy1hs/ZoqNioqQT7ORJE47FfGrqiV6GzH
	DRfgMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pnp37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 01:23:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97415004so1860805a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 18:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780277037; x=1780881837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQQ/N5JLV+fPflhn/nb0oSsHxPTvVt7khfwCnr2kKEE=;
        b=GzUnn8mt0dFyLMvREAWTDwOCNHUtednQhiTFSqCzSdzTKrswCXzYBKZ8OU+TY0xkq9
         Cpafx/ePqZF9OcUXPAzO3SOYCJy6Q8Uq+VtF9TXt0jDYNQ/kXkiNjWdk7FT97l2oiGnR
         fhBcrGXh9fXvU01AVVaLPjWjmC24tUrHoOZO1O3Nl2zK87zSH4YSSQwWMhgBi5KZVr/b
         VLLHpZ3Qfve/cSPc8awOY/fImpVNP8M/fP4XbnhOzLcZ2tRlSTilrKaJ9tkd50S6VKm5
         aZOlVx1+/txXC6q0UxWHuGnN92oWDtQFtdoe1L2PJdupSc2J5wlU0ZzaNhdUy9zd63rO
         PtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780277037; x=1780881837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQQ/N5JLV+fPflhn/nb0oSsHxPTvVt7khfwCnr2kKEE=;
        b=VwEDpahYx7rRVgT0sQMq2Huz1N1IeFXSHsxRiWAOz7IlABTzYkn/c2rmpq6JJH6C2Z
         qcN32gt+ALRertAT90NHkjRwQmCjgvcqV9MFL2/I0JOWgOexVlCaUkAACPyfJ7UHyTcM
         ogaJyScPPwB1KGlGd+YMEDCtQRWjyj7g5xIG4dWPfFiRzEBdIlYhBO1uuxgkFD7dX2Gw
         uEMCpzpwQ7QLnBACRIPecrfsLWdTNVl0X6Ccqjj2NsQAyrT2tZA8TeQDrnxUAGjz8DKi
         sLaAqlFx1P2dFK59PrrOKlewJMiUUj+OJkx5IiN7zCurm3u9hgzkZZvXa310z64qtsPD
         RWiw==
X-Forwarded-Encrypted: i=1; AFNElJ/09EjdkZOY8JRk9vu8hPecLQQVbRUUo1WICpfDhTAOpjKbPYmgTy14obyLRnPV/5qOFww76irLJVkJsHem@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1BzzjUkTsHgiN5SQXvlcmLyt8hNAsdSIqJFOXR/W/3PCXT51l
	G43OpuKJD24DGX6G+WbfBo8y6+7yr6az762wZg3S1r/7TWf2naJDHrUvIG1On2dxfynxDVglrN8
	CPodDSx5IMDG1r+qMFq50j9Ec8sTr0xeGuvaVPNyasUdm8W9Jt8CqjDuMQMbmMRa5+nNp
X-Gm-Gg: Acq92OHNnbm6O/5b6vRaZnU1yQe2mEUfk4OqtQKvCy75qp4hyIUK58NU3Ey4lxhjVNW
	HLh/cDHJ6o+hLIsFOBl9UgG3X/YuW2l0M46RpLSK3T+FQFGLmvP0Uurem33kwhQj2AREPFULr4y
	ZnQpX9RrLDpCDVK8mNwmLjSqVJrOXF+VFPnpAuXN1s7pzWoXO1pTyiz9y1svD5FfrR2bpc6ij+D
	N/HInMtW8WgDN6v+GDc4yFNo7wcJRVXIm3W4UUfvC/Zrzim+XHWAUj4XEk0dIrc5XbdgFu5XWgj
	XBR0P5qZ9EgyRo9pF9iWmqtzHYZOVnEOJLB4p9Ve8q8R9rQlkqrHLbcsr+1xaNpbB/RAQikorvd
	0i80EVRyMuRvW/1mEX9quo7K78Pqiu4svIpmBzurgqVWb8lLqAY8gewmuuFtUns0A1QzxzmwMWk
	fQeqfd8d7/Nh+u8esEL1epbgqG
X-Received: by 2002:a17:90b:2d88:b0:369:73a:326a with SMTP id 98e67ed59e1d1-36c501e69ccmr7803019a91.13.1780277036601;
        Sun, 31 May 2026 18:23:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d88:b0:369:73a:326a with SMTP id 98e67ed59e1d1-36c501e69ccmr7802986a91.13.1780277036195;
        Sun, 31 May 2026 18:23:56 -0700 (PDT)
Received: from [10.133.33.48] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc660da67sm8964023a91.6.2026.05.31.18.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 18:23:55 -0700 (PDT)
Message-ID: <e00a4089-021b-4c26-8a6e-ba1faf86218f@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:23:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
 <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
 <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>
 <20260530-wise-discreet-woodpecker-3c7d0c@quoll>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260530-wise-discreet-woodpecker-3c7d0c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X9IzHmXzZZHiyVvPN8RKZ39cAwL0jpFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxMSBTYWx0ZWRfXxL3Uww0jAykZ
 xwknktZ4R5dJvxaJSNdbd3KB0QQC7Ucz2ReSnAstIZOJGnV7XQxDZQIzgfVOYy+UaH8oOBjoWV6
 vJ5lPziv2l5j1B8+KDq+yOU8mR/NFjcVvNQw/XF/j6mQzuMAKk3WDLs6LOa+SgX+AlpI9ZOyXPK
 r2Lj/FT1EkkDUni4o8oLNtklDAVGiYtkBADzSUQDaPA7faWQmlpn4OLqsGRsVQ5LQJDjfBZ2bBi
 xI5sS2RZ1K8XIPkeu/FZCZlFgsGnemzBXljZ/dwzMFWRGR8tCtY5R7QFhMt61+WJOcb5oBSgCWK
 0ZJmY4R8UreLYAhzus8MdHLW0d2xRVHgvWtMkU7MQxpo3d84dKo6rb4s36mdmYbnpuIeBmHH59o
 f+2WhZD+ydtyWwhyxo39kKKYWD97uqwuwhU9f5E7PLvcrGR8iRXmTQ0Be6PgLOb45Pu0Vu02q8K
 80TLBV9cG6m/4LFRC7A==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1cdf2d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=BeV8J-Av9qvwb3kx9y8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: X9IzHmXzZZHiyVvPN8RKZ39cAwL0jpFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010011
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110485-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3A806189B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/30/2026 7:20 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 01:08:54PM +0300, Dmitry Baryshkov wrote:
>> On Mon, May 25, 2026 at 05:37:23PM +0800, Yijie Yang wrote:
>>>
>>>
>>> On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
>>>> On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
>>>>> Document compatible string for the FastRPC interface on the Qualcomm Maili
>>>>> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
>>>>> fallback to Kaanapali.
>>>>
>>>> Can I assume that it has the same bus width as Kaanapali?
>>>
>>> Yes, the DMA width for CDSP and ADSP is the same. If you were referring to
>>> something other than the DMA width, please let me know.
>>
>> Thanks for the confirmation.
>>
>>>
>>>>
>>>>>
>>>>> Assisted-by: Claude:claude-opus-4-6
>>>>
>>>> Claude assisting to write a one-liner patch? It's becoming ridiculous.
>>>
>>> This patch was generated alongside a set of Maili-related patches and was
>>> not created specifically on its own.
>>
>> Okay...
> 
> If a human cannot write and validate this one, I see as putting effort
> on maintainers.
> 
> Dropping from patchwork.

I will write and validate this myself and then remove this tag.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie


