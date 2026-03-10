Return-Path: <linux-arm-msm+bounces-96686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF9MMt4osGn/ggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:21:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7B251C9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ADF9344362B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EB92C0282;
	Tue, 10 Mar 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgsIsnZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FE676n9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73140DFD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150077; cv=none; b=VlGaFB4XbV9YSGfRv5KYm3mNjrkvB7KT64QwkNc0q5AX0Hxw6axBQi1u0jaWSl+d8EOWBEKLfs+jWUFUfyljkYiV/SaASjF9rAxUMuGk4VStH1+UT2Kynsqo791qd0mrEPWZk1omRRtw2TsmAiD/5vZ9ZZ8UVx7QAKPSvLhKzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150077; c=relaxed/simple;
	bh=2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZYuFS+UEtK35BW5LP0fI0x1bki+RTq4EB8iXVXilstLg276EOJswSOg3Jueulvt3Ci2of8LJhod/qGPM5BGoRtpaewjqvjLaQxhxuPN0vyqTu485NbLnv1xV53ryveD/MmZwcox9UmPxOpSMUjWy2gqMqohOMhai2pE1Xzg2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgsIsnZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FE676n9/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACafU61503512
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=; b=KgsIsnZ66wvp0i7h
	yMm/6WZCQ0gtSgzSPf0D/FHx+giZn3kulbmrM2QKK7AoXq3dD7qb8+G+LqLHJZEn
	WQi6moMDMvf/jdJjGeqOx6U9gfOSvYJKgrMDLNGwW4fHpqG8oueIjUzv/XxFk/kU
	o8ZvD5sl+7vwpC7S/ByfzCQteKZzoTqayZpjzRb6hnKbABI6wLWXPSbVNZ5xCOam
	2eVSpxsTKd1TLuLtn9Mofe1jgYsnYv8HwnTt/z1Rjb/ldqL4mM9PAwdGV3ugoxbM
	JQQzSkzOLJLxTTi5288IjMayl2AdL6GQ+mP+LSz+aT6ERKV5gQQhCXEQ4b6mI2YL
	VjBO1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hqqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:41:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so834803685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773150074; x=1773754874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=;
        b=FE676n9/TvsfUbQJD4ZMpgUgD/69i8TGLo5havLv+Mu4/qEWb+9gH4TBjLlWJcz8wP
         eFkYCTp28eWMhye2u8ePl4s/OU+4Pqs7rpaN7E/71e8PPi2lnP84Ciiy0lv6XCR701lq
         KDsExXirXF8tcNLxkdA6jregMiuTcai5cn/Wx7xwGyOAeiDbf6WpG30GR0fGlHGG8wbK
         rCcpr/ionZM7D3LrbUiJAa/rX568hUQSHmmUHbZZkBo/npJFqjjw4N0sy8UJj0Ar6+iC
         JRBRPa0bI/woMg+Tet0O7pVQq4fODGBRUlsBvMkPw0Qg1B7q3cPySaqx5CCOfIACVCLR
         gBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150074; x=1773754874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=;
        b=NVn6yODuoA0XIUD/dCrSkFhhK/Z2S+ARnOBkttCNeCxTuECfLY5CYzftpw/Kvcf+BB
         7OWZBsSqNRzeLdIMGhyvw3sGMy8b5KqZC0ewXa4okqEbwgeYiXe54FxJOjhI23nOkQC0
         FVKBomeyG2qq6oIZGkZEAEjGJdHKctXGsB9PUsq0rkDyZVhdHYuqdkT2wAo4GLgDBavS
         oEBJz+Rr1nvzmJjGuINbpGQVaxyd+qy7vgx2u2/UVJ3YuPdlh5AEVx5UQ0+xRqIwHffW
         239Ib5maAZ4tdWtIN98nMAfkKijI/bupwjU9fx8feGE0Wygylq4/7zWpu9K2zNN7m9nS
         36lg==
X-Forwarded-Encrypted: i=1; AJvYcCX7jGwIUkZ9rYihJAX6StfATLguEtR5ByNWP+w19R6qJidtPSGZ1L3qRKZGiR5Plt1erojwYk3SQzi9FXTl@vger.kernel.org
X-Gm-Message-State: AOJu0YyoV45QlpKZdDMgz8c2qBSiRb74y3EVl0ctsF3wEx/fjowz2SLr
	v8bfVvbpcprmdPCPE7ASYpzGNqZUYaQYXEI9YUKi+HZOBjFcjfp1VdGNcrLktG8fgsX/hZO6uWH
	hd1+I8Zdiawbn12Ap1wRIkHqMtGtC89RBwBqfzULoXJ6MWpSHwJLqmyWQyxdLDizCi1uo
X-Gm-Gg: ATEYQzw72aLIbjOUISlBJH+9yAUwhFViWrwEYckSVHyNiQKOfly6Um4RzqKNc8MCeu0
	HSjMQ6cAIwtCVFAK5SPZx9MZmqYRtVIEktLTliZ1UwURpQATCWYfxEjNEf3PKzUwII6T8pFslru
	3TmMqioujC73w4cCNmYCCcyVNCG3gJRS9p5il1z3iI1H4G6aEZAWsflbA8zYg4CUHm8PU2W3v7A
	T8O2exaZiZ9rwj9N5dXE1RVVNK/ToD6yHejqtE3n51Ls0gJo5STJ1ZFdZyBDIirk54JOJJK7x0C
	Ya9yCsNk92YUjT4QS9OLQAhLPc8VNyOqvPV9QPbhsVloNASGCILcEeA4Vu/+9upvoHX7YGXpOS0
	13KnE5ShEAocWhAwoCnqLSRecNJ5vWx2JQhNA/GFQpl8etfvJly7de6M4Zm8AU9W/D1kHWZHCkL
	Cpw+U=
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1494496185a.5.1773150074476;
        Tue, 10 Mar 2026 06:41:14 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1494492485a.5.1773150074051;
        Tue, 10 Mar 2026 06:41:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94351894bfsm468701766b.1.2026.03.10.06.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:41:13 -0700 (PDT)
Message-ID: <e878d01a-036f-444a-82ab-b823d7aa7525@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:41:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
 <fabedbb450f409aa0aa415151de0263b@mainlining.org>
 <2255b753-4d40-4e49-a89c-22ee939c51d1@oss.qualcomm.com>
 <6665244d82ee8776826a7f6a4e64af99@mainlining.org>
 <a9658d1f-556e-4a58-828c-1d97e227dfd0@oss.qualcomm.com>
 <70ad0b19dbeee89c04c17a0618a9cecc@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70ad0b19dbeee89c04c17a0618a9cecc@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOSBTYWx0ZWRfX6lk8wABvHYNz
 EnMKvxjv4K6BzLNrWwq/JAFa+TVAAQBGrgu6aAoFh8Kak4wkEs80NI9HlcWFfw3HFoMa1zvPNLH
 OTNhGeN06QrMYfJkaPHfCoxz+czGtHkeg4FL2xbj3PiT0//dLXQC51Wu5nT9NgmkKazw+/Zd3Eo
 tBQsVfFaYlAHeUpNY8SPuS2/LO3nlzAmNxfSh9gFuy4dFEpq7Z7YuH25eg3FnA2rtoCjSDGm+hJ
 VC8kxNhrlQ+SW17CUtQz9PQ+cTdc7W1HESta/ZjljlNe7M05p/CI/yWRaRQSgX0Jz8OsaAunKKW
 1w3iqECU59+lW6eSc9NqLY0V9foP/z7Hqqboxbwd/k1XbcBZxlplYcY1uq5iIczXbyx4YZJMOlc
 2AozTQhqTXJ4wOD3nAh3Im3b/Mq7adHnBt2TzK1VdVBZHhQ8MplNkR+kiUCFtqeC8nEnB1ctbS9
 tGPItJrQrp+bLoA23KA==
X-Proofpoint-ORIG-GUID: CqjCq1gQSqY-bgFcLJrjwko41pR9eAeZ
X-Proofpoint-GUID: CqjCq1gQSqY-bgFcLJrjwko41pR9eAeZ
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b01f7b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=fr_QDkp6JkS4JuZzObsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100119
X-Rspamd-Queue-Id: 69C7B251C9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96686-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 2:26 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-10 14:21, Konrad Dybcio wrote:
>> On 3/10/26 2:11 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2026-03-10 14:04, Konrad Dybcio wrote:
>>>> On 3/10/26 1:57 PM, barnabas.czeman@mainlining.org wrote:
>>>>> On 2026-03-09 13:55, Konrad Dybcio wrote:
>>>>>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>>>>>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>>>>>>> it can be commonized for avoid unnecessary code duplications.
>>>>>>>
>>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>> ---
>>>>>>
>>>>>> Could you please try adding the following to your gitconfig:
>>>>>>
>>>>>> [diff]
>>>>>>         renameLimit = 999999
>>>>>>         algorithm = histogram # or 'copies'
>>>>>>         renames = copies
>>>>>>
>>>>>> and see if this generates a shorter diff?
>>>>>>
>>>>>> Konrad
>>>>> One more question should i rename msm8917-xiaomi-riva-common to msm8917-wingtech-common,
>>>>> they are wingtech devices. Which naming is preferred?
>>>>
>>>> I think xiaomi-riva is easier for people to associate with a phone
>>>> they may have in their drawer than wingtech-s88503
>>> What about renaming just the common part to msm8917-wingtech-common?
>>
>> I think it adds more confusion without much benefit. Probably none
>> of these devices have been released without a Mi logo on the back.
> Yes but riva codename is related to Redmi 5A and naming as msm8917-xiaomi-common
> could cause confusion later when i would send Redmi Note 5A (ugglite) what is
> none wingtech device and have much more difference.

Well, you never mentioned that!

perhaps msm8917-xiaomi-wingtech.dtsi then?

Konrad

