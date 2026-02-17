Return-Path: <linux-arm-msm+bounces-93211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNIFFQuvlGkPGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:10:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E880E14EF0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AED283014A28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990B836EA88;
	Tue, 17 Feb 2026 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rv97gS6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3g0IeA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51F533439A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771351807; cv=none; b=PqzSDRDi83IlsC8Kx58s1VMOb3bN+0LQJWVXkPxR0UCnCHM1Ajq/9GTQZoooMJH1d6eEazz5DJg2RhSdKQsbaGXM05EGBnaJYGiiQuPcDG0rFuFGfpDy+ykKXc2e6dP9tW7Xj4q9Z195Hw5EHHkv4FUwc1mZpFFYESnMZxeniNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771351807; c=relaxed/simple;
	bh=twduH7+XI/JCNr4DbEoc3oFf6uD4Fk68CE4dpH6GPwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZ2NfKLMKvPM5hdYf/cL9eRzHfXRu/SMy37glxdNZF5X2kMUM2T0NvvjjfxxBRWF297mXFZB+A5W56Shy0r9FhNATRMhkvuIBFHYIq2Y0rCL62fOtGh9jnsFOcpLS/2RpLHWCwgx6cW59j2X8X7UlHmh30gWbK/zDwIJ8YAMUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rv97gS6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3g0IeA6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HA8Hxa597148
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wk6kq7pf8sOUgb4FnoFQG0q0zp4jil34CrE6zW4xlH8=; b=Rv97gS6v3Wa8Xo/E
	S5DQsIuW6q4ozsMvpzh7WUmG20GECXnNIBujZhsSP8ObUWmutDdibJg12QZuwD8R
	LnyGZIdh1a6p+YF6d11IfcbzT7WFFLZ4PsNhENbxHBPrXp9ZyMOYooVcx1ZRgDdF
	o+9GpcHJlyZYalzyDsZww/4gB236v4USl5NaNIAGD1rFMnoSNKrdOiJYJXIDoDU0
	51tIzeMddkqmTB2dn9DBCKtWSkC7yfGjZeyfkPYXRuKpQh0fKNfyiAs5pIIvCmzY
	ar4PjK1pD7oLSQ6ezVD8/2Xg+nhj1NFqMExhlZOIYUprULSQgoj+/XSOeAGWIb7K
	k7/OBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca362wp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:10:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ab0b2e804cso55180815ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771351804; x=1771956604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk6kq7pf8sOUgb4FnoFQG0q0zp4jil34CrE6zW4xlH8=;
        b=b3g0IeA6vAHF6wX2t7Qh4DCbxMOBDu8cavNsoIzdp3Qk4q5++J8qg5OwOGIgWY4gNg
         +u8XHyyBqCJiO68e0HTSm/FD75DKR/CpB0bVUrfYCi5B9LTJC2Zy9ype9Ig5xzHpEhsa
         ke51wLql2Yn7YLOG7vGpPl6EUepSSjS2frQvmiaIFaz7coHl3D20mU3/hMyYtpgrZC4i
         acuova9S4IWJEfebSt79gBrBdy5YtlTiQjDGRrFFR1Qh2rWxaLZtPckfdiTP1odI2Eux
         CW0+dLmXJ4h88R4jo8i9h7IKPhee3vsG7NC+V91UEl2fb2u/LUmtrbIY+45DI0YSXekc
         +LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771351804; x=1771956604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk6kq7pf8sOUgb4FnoFQG0q0zp4jil34CrE6zW4xlH8=;
        b=sf4YLGLM477NAdUvbqPXJ2FKtMZydaz/w+M7ESGvW7KIc0Bm2IuMRTY1/4P3uKodM6
         MqLfSbO7uEuNaX/CnTsXQdPwjVvcrOK3Xf34E3sxKbIT+0NV+TtdlEtT8BnfHXcS+NhC
         RsPNkX4DzRJXhYIOf8yYfDs/N38J4xmUi8D0+oQeFl1bkWi6HGh67yLgLa5H1b3deZ7h
         VCjnUdyq4PkjdsFNEnxIw9bi1dDC3eFY9nPRpy9ZJiWNw/pKfpYWbadbSZk700/81jtn
         FdzYJW3OTrXN/nhucbfH6d0iYC/HTGjnDGPCoODBkk3rFd8KNwDMPYkXpTLVEBEfYgOA
         P8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Kc2yejqPL6CHU4bz0C06ee0EFP4AGwhl3jGIvsLCgRzBCfK8rjP9rQnfwRax9erodLcbPAoIPiq1QMny@vger.kernel.org
X-Gm-Message-State: AOJu0YzRolkpMjtowic5IChuLxB2/kWStAp0JNE1kZzeRO+op/AuBnhj
	ayKA2Pmn1R1tvcBQxUsah28pj+BZycg+zCDr3iZyS//yYumuiyCAPyztak/rBaGV+scnR/4OuQs
	vCUdVqNfCYhMVozVzzSM20iMukLaHQuTSL+TpYIM/v8izLw9SfR19AL1unoyW4gkMDvPV
X-Gm-Gg: AZuq6aI/jtlhCH+aet5Rg6wr9TTTGhOAfydye8pZqITUgcf7T77ms9ssRBm4HfX6lf1
	jq+57yxXVd4y+U6FyA5Wio6m7jVlx9rPOa8batZNnj0KVBkbhYtIUVcMTsC4gYKE21yeDYnPWFl
	uWKYlflOlSqJxLYrtGTg+slSqf7Pod2EKS5eAMaySruXuzTtpVwNp0H2wa0ChIL6oeUY0ZUlGno
	EGSzmkLdlKL4cxUqL7gjWLM1ZflfuOt8/Upy4vWUPPBYb4BnZuYVkfc1BmscfenUirk1AeTdt3y
	GQWTKHwXFdnbesswnMVkgBmdDvqbHuntEUWdZ2G0TeSV2eXSbOO5vuQaOuAP9xKcTO6CTuACRix
	QNLCHo+0+MHchiFnD58xPx+ZAiqK2LfC6BJNIHjDc/goimkh8tVhONmsQ
X-Received: by 2002:a05:6a20:6a10:b0:38d:efca:1be3 with SMTP id adf61e73a8af0-3946c8bfed4mr12901144637.37.1771351804121;
        Tue, 17 Feb 2026 10:10:04 -0800 (PST)
X-Received: by 2002:a05:6a20:6a10:b0:38d:efca:1be3 with SMTP id adf61e73a8af0-3946c8bfed4mr12901116637.37.1771351803400;
        Tue, 17 Feb 2026 10:10:03 -0800 (PST)
Received: from [192.168.0.172] ([49.205.251.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e79efc83asm4004434a12.5.2026.02.17.10.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 10:10:03 -0800 (PST)
Message-ID: <ff6c4a6e-9478-46fe-b17c-5b4221f04b52@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 23:39:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
 <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
 <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
 <logrdwafmqpfjoxyk7aqs3ahb2qhgqrtcxjkvtclxopkxqvrbh@q5zq46wxyrsq>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <logrdwafmqpfjoxyk7aqs3ahb2qhgqrtcxjkvtclxopkxqvrbh@q5zq46wxyrsq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE0OCBTYWx0ZWRfX4/Vl5gnalsFn
 Ng5NjeCpr25c3AyRX29jHwqe+nbfTtuj3sKIMzCR8/+KU0OwEbQEF1s81CALTCUZxR0Qe9cljUr
 +X9oezx1bO//8wmCJ80QhDwzj7pY46NJboISrNPYW+YDT9s4ewbw02bAg0BsOC3VRH7oDuvISiw
 LJCxe6iCVgVEwYqLWyyQ71SkRsQg7iE0qyUBNVzQ5o1rY56b05UprkbKxQ/qNKG0WWAzmB25fCD
 1b7wKHgLf2T5DgUra9rm0/jHwPapGTl7JnILpKPZ1KMveK5Nq79CrMJ+Km3a2nbYpXsRGgNzGbV
 qHPNvPJBEz7v/fo1itI0TRvs3ESLSTl1rrGg9V051GTl0iqS44n/bB19Tj4oHkpWMSfDrET3bol
 37B0qrDbKNe3rBzJE/sHTUnJDxRob1q08aH0Y7ulybZhw67EexeBth/OVHyPtTh1rRC3K1oyxeE
 +70bg+R3kWk/h6ISH0A==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=6994aefc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ExRUKzOVRX24zF/T6h5B5A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=CVEAFZvZQY1BmYoe21sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ysLebb11MZ5hP_03499thDWknVk5WOv_
X-Proofpoint-ORIG-GUID: ysLebb11MZ5hP_03499thDWknVk5WOv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93211-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E880E14EF0A
X-Rspamd-Action: no action


On 2/17/2026 9:45 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 09:04:52PM +0530, Vikash Garodia wrote:
>>
>> On 2/17/2026 8:06 PM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
>>>>
>>>> On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
>>>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>>>> compared to previous generation, iris3x, it has,
>>>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>>>      (bse and vpp).
>>>>>> - additional power domain for apv codec.
>>>>>> - power domains for individual pipes (VPPx).
>>>>>> - different clocks and reset lines.
>>>>>>
>>>>>> iommu-map include all the different stream-ids which can be possibly
>>>>>> generated by vpu4 hardware.
>>>>>
>>>>> It's not how it can be defined.
>>>>
>>>> Do you mean to elaborate the different entries within iommu-map or to
>>>> elaborate the different stream ids and how they are grouped into different
>>>> functions ?
>>>
>>> The comment was sent three weeks ago.
>>
>> yeah, if you could still recollect, you can comment.
> 
> I think it was more about 'stream IDs for pixel, secure, no-pixel,
> firmware, buffers, non-buffers and direct insight into the VPU memory'
> (pure example, as you can guess).
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>>>>>>     1 file changed, 234 insertions(+)
>>>>>>
>>>>>> +
>>>>>> +  iommu-map: true
>>>>>
>>>>> This is totally underspecifified.
>>>>
>>>> oneof would be a better approach describing the possible stream-ids.
>>>
>>> oneOf of what? It is items with the definition of each item.
>>
>> something like below,
>>
>> properties:
>>    iommu-map:
>>      description: |
>>        List of IOMMU stream IDs corresponding to hardware function IDs.
>>        The number of entries depends on the SoC variant.
> 
> Do we again have a story of variable number of entries for the single
> Kaanapali platform?

its for firmware stream-ID, which can be managed by kernel or Gunyah. 
Handling for it now would ensure we do not have to change the binding 
later when there is a need.

> 
>>      type: array
>>      oneOf:
>>        - minItems: 8
>>          maxItems: 8
>>          items:
>>            type: integer
>>            description: IOMMU stream IDs
>>
>>        - minItems: 9
>>          maxItems: 9
>>          items:
>>            type: integer
>>            description: IOMMU stream IDs
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +  memory-region:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>
>>>>>> +
>>>>>> +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
>>>>>> +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
>>>>>> +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
>>>>>> +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
>>>>>> +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
>>>>>> +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
>>>>>> +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
>>>>>> +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
>>>>>> +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
>>>>>
>>>>> #define the functions in the ABI, provide them in the bindings.
>>>>
>>>> Ack. will introduce a new header at [1] and define these functions
>>>>
>>>> [1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media
>>>>
>>>> Regards,
>>>> Vikash
>>>>
>>>>>
>>>>>> +
>>>>>
>>>>
>>>
>>
> 


