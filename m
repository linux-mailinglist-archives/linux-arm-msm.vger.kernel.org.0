Return-Path: <linux-arm-msm+bounces-118297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fw4MHRz2UGpm9AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:39:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4573B550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:39:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jWoS3LeD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ScxXT3JJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118297-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118297-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C18030160E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5362638E5DA;
	Fri, 10 Jul 2026 13:36:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0E370AE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:36:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690606; cv=none; b=LASGXpSnU31ysLxq1j0Gw2fDaS1UFEe3kVaBjotyNxzfRgwCXT8+YxG9vgtdBUQcP16vPiqGuxHtBWVJWYvZiNGtQfUqv+Et3CcserPWNvgyTgC083NwlhD+oBeRJXU3lQTsPJL69TKMA/MoZuq9MYJKH5ZGg46aPsWaaocIShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690606; c=relaxed/simple;
	bh=560S0t5MFs+Puicfa0vOlBipg/JOUPnOJyV5iCkNDFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb9uYSvIRdWQ0uYu04IBvHewY0LXfcklJkBU+gqGpZMAiO1sbe99tjlOpXrFnXgbzJ0cdopFAD0DywiRFzzmlyTY20ClSfMtu4OYrbVGDwMHG8bR5DGYvHa/InatH7vXOfYNgiZTfuL9O5mK26woM6goz7coftBa+yxXxp6wBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWoS3LeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScxXT3JJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6XBV823157
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=; b=jWoS3LeDHGko/0yB
	DmyB3fAcuubSMrl3KAxjkWcFPsaTFsF8oaeMfaTJIPuH03huvsJQxynPHkNPI19s
	UzEKIgOqMVOYbXXuPpTAT313UPTFvO3Th5Rp3WP6v81mi6O/VZSvQmPIyJDhLY28
	tnxPLKOWNB7Joo/PELVvJlZ4vtfQb9U3rnXRckKikeiH6n6+hgLHtiNiWA0Ippsq
	O8+QCuuXV6oX4B7931VhLLezd1yVvAEcAWGavgjc0L0t3H8GTgRRpO1dgRgc0+58
	G98g1vuqZD0zQfntgQ1dwGQQNU78UO061DPFRm82TXZL+gquOs7sw6BqvZEZsznU
	qgVoJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjcvsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:36:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9667280edeso1416776a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783690603; x=1784295403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=;
        b=ScxXT3JJLt0gbOIAfZKlxdonChU/lMIY98y5CQyHpuctcSVOwFJ4ENbc0+P+RTWMAH
         NloqpwQRkKrV6MVBV8xgX0snJYGxS2vkBlZ0STdEGjx1sVvNiym/QXHRX1o/f9jTyLM2
         FEJUGCdLYgh583owb3JLuPB20/uDti7Cybrr+naeEtmWBr2OaPPN/9hHGiYqnRsedU+E
         BI4wZGyC5ZKQF+SXIY1BAWNEAUVUILPk0oUE72DYAzj2UJSBdfiLaNQ26FVqryBgNmoT
         YZVcgE8AE7Ac0tmdLvMG8KSVxZ4dAsWSTl9/yO5SEllv5hBW098Pbrm+oXJp4yrnW3T4
         5OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690603; x=1784295403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=;
        b=s7g0hHYo3nJFPTFFi+t49kq/EXA6CBeDk/jXy8bB+xl4Fl579XxO5MVlR14Va5qB60
         EcjnTE7BMkEki+JVE0CNZAzBw4rQLmHWoPObI8iSEczfr+glieLl3xlALTb7cPE8Pqfh
         PbbWzxCRvMVznK02yAK6H+m7qAHnm8yk/yrmQ2oIq0Zui9n5qmesfVGigg+yt0dklJ74
         tuaQm9msbqdwOkkaJKn4IYwlisarh5lGfeVIlISAJ3FTPv3/VO/CkSGNV/W7wyaFy5gx
         5j+iH7HyQT8Q+E6CBB+QNgFy//vKZICFASw0OtkBICGAUhrRYi+MhlJJr6EnPyJVl1nK
         CtBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/kn4dPgPvBa1QVzw9AB2+2g2kHfkBOB7xaGDZ4YArL/ikHvELRuTwWdLaGB+VRSNN5/Ms2PIwh87CDOCO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92+6NI3536NI8bBfBVos/FSV+ZUWfn90kJ/KMeoahZm1UqY3l
	IB/oZ8IK2Byd2fuJxS8Zec30UazBUlvbwsmVJMkBhm27Z1w01nxkwZsG+VN/kU7nTRso8/OAOl9
	9UhfCBeW9JsSh3Oqk/NQxqwKENecSoO/qUQHe6S24H9leuttD/VGj/vVaHlirfxhQ6mOF
X-Gm-Gg: AfdE7cl+wu54JO/Pg3zfO5hJgrzX5zJXLpSoat2LVZBAAcrQExAA2SyRmy6KMRVxFjW
	RhSuzXtlXXWw5nBVje+fWcVe5NMfK4rFaMt4Y7ZmAX4PH7bA2lc76Ah4y78vQSUtqXKt2e+Od97
	KeCZHI/zyPO+3s2orkMlBk4F2x9EJUzTofC/LLNd+BcsePmNWlwZUSnpLLE21CLUjIa4+FZg+1n
	TBX0MK/LMp0J0KgTiE+DqwQaqVE7ySf7Au9MoSkaBEQE9no4XjCdmDFvipSLvmLJOoU9EiI+C9x
	ZH+gY/5Tt58Y9jgTGVmGfJfeW2BjLOIBQ5l/OXenwRwjWIGzmflSSxLwk1yX97J6ko51Dg7LUdJ
	Dc5IP1Ny3r6cQDMkNj0O0jVSVeKgBWMRUnd6DNn6HKJrl
X-Received: by 2002:a05:6a20:3d20:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3c0bd0f9dbemr14518545637.39.1783690602884;
        Fri, 10 Jul 2026 06:36:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d20:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3c0bd0f9dbemr14518495637.39.1783690602425;
        Fri, 10 Jul 2026 06:36:42 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm74501495c88.14.2026.07.10.06.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:36:41 -0700 (PDT)
Message-ID: <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 19:06:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfX4uW6jIXJfc6y
 xD3u4Z4dgdJjXNh3KymLptYeOZcQc2/pEK90xvQT58kRMHInlrtvcreEKeBxbV3QIrQJyQLSDd4
 hTV5zAdZ1b+SG5n4HDgksXoura7gO+1S25CjRNskk2xGWOqmZEG1XEe4iUxmkHGbsZZJ2JO/s3G
 +SdxuO9sbCcv5I0dM2mwOdB4m/U37Vg0y0ZQYAMsGNgeQrvi5qZ8BwEIGQ41+XckL2aiGp6p8p2
 8rsfgNJLwFbTO6lT4tN5Fp+nINJm82i/o11Ko/sZi8vMbuB6dylpEifXZwkCLFehFhpDQsaYCly
 Z/FxHS1p/Wof1XAqkCyjnr9Yj05/UHFJnpxMFxA03+qYO/RUlDHMNEnI+CgK8NFKRCD1Y+CbU47
 +oAfIm18QSt0utV3ew3iNikmRg1gIaqVqoVRg43EEVrc6Lo/HEmnY/GGgUZ06DKF3HbT6nkIVaR
 cS2h3QlwWikzBlVHirw==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50f56b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=5i2VpEqXucwHfqzRn4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: NoNQhDE9jqOaFy78slrjDPwtwhJqaN_9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfXwB7KKMBSe/cs
 lIUsoEookEFORh1K1aXqQplzne4DrIB1ihuZF9bOjYpNi0ZEAYyIFO3KJ0hqWstyTRnbG9lgh8P
 xybrV1kuD9A5JjjihMcsJwbNnxiGljQ=
X-Proofpoint-ORIG-GUID: NoNQhDE9jqOaFy78slrjDPwtwhJqaN_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118297-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05C4573B550


On 7/10/2026 4:05 PM, Bryan O'Donoghue wrote:
> On 09/07/2026 13:35, Vikash Garodia wrote:
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Daniel, who reported the crash issue, have also raised a patch to 
>> workaround
>> the issue. While the patch partially handles the limitation, it is 
>> inefficient
>> in a way that it keep iris hardwares away from using the 600MB address 
>> space
>> for all the different streams.
>>
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
>> In the past, this limitation was tried with iommu-map approach, with iris
>> driver dynamically creating the devices. The approach was later concluded
>> as an hack to avoid having sub nodes. It was discussed in detail in the
>> discussionhttps://lore.kernel.org/all/c7b956a9-d3e8-4e18- 
>> b780-5d08f5cd2ca1@kernel.org/
>>
>> It was agreed by maintainers to proceed with sub node approach to address
>> the VPU hardware limitation.
> 
> What's the addressable range with sub-nodes ?
> 
> The original problem you were trying to solve was the total addressable 
> size - this other problem here segmenting the linear allocation space is 
> adjacent but not the same thing.
> 
> Without digging through all of the patches here - my question is does 
> the original sub-node addressable space problem get resolved in your 
> proposal here ?

The proposal solves both the problem we have so far - total addressable 
size as well as which segment (or range) in that is _not_ addressable.

Regards,
Vikash

> 
> ---
> bod


