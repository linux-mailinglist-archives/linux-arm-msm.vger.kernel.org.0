Return-Path: <linux-arm-msm+bounces-117878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yL5KGC1OT2r9dwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:30:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E363972DB65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:30:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MlmdEqWF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IXq7cx0h;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117878-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117878-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FFB03011A6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702883E3158;
	Thu,  9 Jul 2026 07:30:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F873C1F52
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:30:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582251; cv=none; b=pNPIOczkg03llESf2rkXsWzd/dCDCOn3jxS7iCYRLnLmm7kJYrDPXrhQBnEgK6x1y0XmHaVrQ6xj8IFk6qJgMUc5uzaKnwq5vV0w4uI16AOQa0KgB478B/md8FIi5z5lPDVPEhhVYAj55bv5shwyNzEWg+ruVZetxiM4Udc/0zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582251; c=relaxed/simple;
	bh=yPigDOPI2hIqQ/pjyZYrG8uHNbPYwc8vco1azOeA7/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+zp4UZTXDw+3OHnRMsa5cyuxqfnJuSYLZP0YRvck+nnvR1eNOgSj3QFUR6PlxhesnUiMltbifnDnXqNF4nx/kigVBm2wBAkvTLZR9fUW8B3h+7hyTTJiMIDlVYiBIs1bjkcPZhhAkyib5SHjuJ3r+Bw9tkh8w1j6Hvym6s1mns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlmdEqWF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXq7cx0h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66961Cs2933518
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBGu1KF1MsKF0eCaRLbzYIztwO0B9HN+Ez39kZicTP8=; b=MlmdEqWFtXi8UL+D
	aLZvSohVF6rMvlUTAfjoYgfAZgZkWoq3scqk3bzqDxEPX404KJYq2Yu4BKePlj1w
	jAENwYAMUSOcHQIFVioxr6mxVkbiEcfS2D9eVCBj3KQ8ADlMpUoHtdEkgFa3PZpj
	IsCef66Ulq7nqQXtMwbS5Rfr3zdgp42GTVjX49Z6/4T/hBBptihw5PqRsenwDL6r
	RlKXxlwe/HYrm/vZNx3po3UI0fn2R/5HyyEIe5oernY7qHR27/kSoPH/0NbEZSiG
	X0+xlm7tLF93wZ/flR87TB8KGhGzl3doX6aNnMPg0VIlrxcsjyuB1U5ulO/6XIiF
	RRQlag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jfbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:30:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so34836715ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582248; x=1784187048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBGu1KF1MsKF0eCaRLbzYIztwO0B9HN+Ez39kZicTP8=;
        b=IXq7cx0hGpe6ZvUFDk4Fl84dC/4E6/3bgHRyzh7g03FHx8xuRtmvlFoy1s6HGZcHVX
         6CAuKVko4cUXV0pNnf4nkXTu1uo5myF1hhCPYk6eq3pxk5W+BpSq4VqRzqQi3FiaYYrz
         YFKeXCNV3zhb8p0CnJdjGTm7cqt6uPAMjvDkfnclwSyb3BfkgDGO1v1XW2DESKpj8bTR
         ZYneMEq0lvJHGe+WoV/H18TQUmSjtib3vuYe6MIlEO3pGpoRqfFG/dHEJkG5BqgvH/TS
         ZgC1AFIYi0MN4jAJTLLY1Ua/WL7CSAgzb4CPpCB1r51ZRmuK9DGFy7GSeNpcGjDPSwK1
         AoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582248; x=1784187048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBGu1KF1MsKF0eCaRLbzYIztwO0B9HN+Ez39kZicTP8=;
        b=IedkdFAzIrBG8YxAsnjQ70hCH6ptmyXJ98/ar6TrWYIsgC8YkMC8zYwPbgjiH36AKJ
         3NuDN48WbEGGJGF+TgsZ7MmKdAxuQuAbTEzSJxbFadNZ6jDX8l5FbD+C6jiEAedVhTyx
         MEnOCGp5ZCD/RFLFRUpXrAuFG9pkqXTKJ1USl8JTUjRIHgIztKvOh3vNIri6uqtsxQ90
         GbrMJdR15Ha+DtWaH/d3idb1a6HeM6gedGMFzyHCDZIlNVpf8MUkaZgwsDExzw6CIus3
         QbFDeBTUCK3sVier3oUIIJ7VyrGMD1d0FXWPa+3UJiPzIPReCuuE+QIsI0qcP8sSqX1e
         yVlA==
X-Gm-Message-State: AOJu0Yw392q4HkXh1OG7Vz2EDGCgPmz2KGOT1g2aIskmBb+IwmZM3t3w
	R3mqppSUIt9JfeAI36wrXedBvpDUV/22SFWypRkJ5/Cus6Q+BKgrToexD8CS9cxKsenOwVXAKJR
	V8oOXbfNdD+wbfZRUbPT5qwi4Yc/3ov81NQsGTlOaLK5f6elqlBRnHo4efVPWLhLxCKFQ
X-Gm-Gg: AfdE7clRxnRpTs3vZQRuCf3OCor3zbOWw6tN6lX3WbajH36rtqhTMZDQztySKO7NNFT
	BjpCQkapE5P+NgUnka2xIzhBFnM055L2YBsApqfs/R8D2ck2KNS1a+30u8ngJbaCVzbzzcqAoDR
	hPVqPwBTbfSdZDA65TvNA7n84Qp6d4IvrO7XWSUGxHbq9I5qfaWwrSh8ULa9Z9YkJ0cqwi30ugs
	ESD/6VOOMDNIhCIA6TcUb7JdytWbzCjKDaLV7etdRB1ruCCnAqdPC7Sjd3bhMbUe/hGKBf9DgBS
	+PCRofasjMMldqG4mptWlVQNDgDdyKdwo6D1sr076z34zSYwSuFPx0CLBWhw+QsGMk8ziyRbd2O
	cdOzAFTV8ptFPHuIIPdR0MDb9G1ezTHIeesqLCQ==
X-Received: by 2002:a17:902:f709:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2ccea374c16mr58574075ad.14.1783582247963;
        Thu, 09 Jul 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2ccea374c16mr58573645ad.14.1783582247468;
        Thu, 09 Jul 2026 00:30:47 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8e9csm39463965ad.24.2026.07.09.00.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:30:46 -0700 (PDT)
Message-ID: <0c1b1970-07fc-4612-afa8-f242c2808517@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:00:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
 <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
 <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
 <5d46c46b-1f58-487c-a883-bfb8ea356035@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <5d46c46b-1f58-487c-a883-bfb8ea356035@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfXw6WEbZq1ptdo
 EjGdmzjoE7em2sYktllHbGM+iRpHnY1SHEemZFO9ngn/dAn8QN8hPgrWuhJznCIvl1ZnKuhCpNm
 ZWVBvaSFp13wyijIoTcAzaEmYmLFVBw=
X-Proofpoint-GUID: BK2_SJ7oScC3EhHV6MtrX8ue9M-Y5KpP
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f4e28 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QKulUWdV5NHAk1IIq1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: BK2_SJ7oScC3EhHV6MtrX8ue9M-Y5KpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfXymWzIHAT3TK5
 0dafdsa0li+VcJ58ALKXo7jwhyYDyUfIkPRyeOAbF+tLeixFl/Oq82z9YtC7UsJBTpWuZEMbUUN
 ZTh4EUd7F7VLFdA9yYuJN4KEc0J08dkwgiMwwGLyS2/GUUa7Aam64UrV49/zNoVXS6APg79WwJ5
 HjRrJVrjtx3PsycApYhf1tQbTXqGBdPpREgpXH8R20HHevGpi8BHcg+Ei2HnBHuXElB4IQZ1b5h
 FEEV1UDH4bt4pxQ681Gz5X3vUNZoLJYzUMe1oaSlFssHP9JLq8vK3AmiQY2uCxzbJiAQLqMAEI6
 vTWP8fjwKb+bf28td2NDuwNu+rHA4oMx03pxpnjxFcYgM2TjnJhGkuezxVgulldPuJ2hBWrmf5y
 Ua+LTX5bvci2yW9/8gZbprwwCHGT/qav97X2aNIgHfDq/JqCM39jc3H4EcD1+rUh7AhCybdQFAP
 Se05RWtya6pu3jYtuZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117878-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E363972DB65



On 7/8/2026 5:42 PM, Konrad Dybcio wrote:
> On 7/8/26 1:27 PM, Ravi Hothi wrote:
>>
>>
>> On 7/7/2026 2:11 PM, Konrad Dybcio wrote:
>>> On 7/1/26 7:43 PM, Ravi Hothi wrote:
>>>> Enable the sound card on the Eliza CQS EVK platform, including the
>>>> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>>>>
>>>> Enable the required LPASS WSA macro, VA macro and SoundWire controller
>>>> along with the necessary pinctrl configurations for DMIC and WSA
>>>> SoundWire interfaces.
>>>>
>>>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +&pm7550_gpios {
>>>> +    dmic-eldo-en-hog {
>>>> +        gpio-hog;
>>>> +        gpios = <7 GPIO_ACTIVE_HIGH>;
>>>> +        output-high;
>>>> +        line-name = "dmic-eldo-en";
>>>> +    };
>>>
>>> Why add a hog if you defined the regulator already?
>>>
>>> Konrad
>>>
>>
>> The gpio-hog is the mechanism that actually drives PM7550 GPIO8 high at boot to enable the ELDO hardware. This GPIO enable is required to enable the ELDO regulator which is powering the MIC BIAS supply.
>> The regulator-fixed driver with empty fixed_voltage_ops has no .enable()/.disable() callbacks — it cannot toggle the GPIO. The dmic_eldo regulator node is needed to correctly describe the supply chain to the VA macro driver (vdd-micb-supply) and for power tracking, but it cannot control the GPIO itself. Both are needed for different purposes.
> 
> Well, why do you think the binding would accept the GPIO if it
> couldn't be controlled? Of course it can power it on/off, check
> regulator core code
> 
> Konrad

Thanks for pointing it out. Will fix it in the next version.

Thanks,
Ravi Hothi

