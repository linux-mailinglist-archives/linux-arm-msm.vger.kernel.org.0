Return-Path: <linux-arm-msm+bounces-114529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hNOBM2YgPWqZxQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:34:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C79B76C59CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="YHI/YKAv";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bgVHF3t4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114529-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114529-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D053304252D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719E93E16A5;
	Thu, 25 Jun 2026 12:23:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF623E1221
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:23:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390191; cv=none; b=bSOOObT4RMtuvt3X/cG+j076lNqrWLIiqkqsiU0PhO7x00jghjwF7U5X5ewTOk7JVCBu0k2vRDbABHP5Qb9fMQWGow4vTXMN9UvA9d8I1vT+ixLMAvOdYCz52LhiPsr7Qq8NvHKIc0L9AV7zIDPstGE0/TDr3EXEUbCeIXKR8WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390191; c=relaxed/simple;
	bh=+vdm6HagNa19O/q4aTSBaU7F2pnXiENgmOZxVvccHF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faxSpzU75rzLo8qO7Lb3NFSZ/vR0UsILMvROIaLLd8rBrcsTTs4aHTvU3oHVxgMbIwZ4DMqf4x4xsyVMWyvQYiCf1JUPgLr9R4SnK3kVtQfIh5/Q38dyJzofggcsk10ekBk0MTqLs1Czc9+00h65sxhJvBD3d5FES/63qyhKCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHI/YKAv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgVHF3t4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9ju7K1470672
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUF5oZ4bJk9n1lNWggR+VAUllTdDgrVBFBqrq4XJb04=; b=YHI/YKAvtKrzAxrf
	roArWL82AbjPqtaoCRfukEff4t5HnDFy2rQxTN3vDe1rVfAHDCeYfFjIEo/H+Tzf
	7FJy9ICV+YoxVCSseh5q+1tscEHe6O+tLBzIkeFHrfusbh0nd2vGjDZZh9gtltBl
	WbB+KdP1y6QStfHGHdnZHBdB17jrhbjFPvIH3/DXsFfJbwl2DmK8QghvKKnlo5a+
	EeKBl+p8wyHfDeqbjaH55/vVJR8LZgQYA2bKBdKCPb1rk/SZTXbi34N2TrvM1CvB
	IgVKBAUs3zTUgCr4glSGqzYBIjJAhaEe+0oX7zMa9GsB0u5sup09PkfFPxdi3HIE
	nAO8qA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7k8h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:23:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176891d0a9so3109041cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782390188; x=1782994988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUF5oZ4bJk9n1lNWggR+VAUllTdDgrVBFBqrq4XJb04=;
        b=bgVHF3t4OJVzGKJyBriUYkdyUjhmj7h9AFikzL53mNGjhvBzhJz9FaK0ddRrYfKIqm
         o3e/uuYcU9OS+ABGUrtYSOAFrta/tYvk2yZZvd/8KOs3cPp/BImdG6oGmq77PAECVkky
         bsQcYZNUz83LB/gUb8SojwJCbFcLiVdXjKrZpxBj9sYAzfaPnNfs2+pDZytTlaaDNl0Z
         7qpYfbe3OrLCj6UNc26f63TFuFopSHhPj9nsmweGzK87BaIXEA3OKpS5ZL6eznVE+Hsv
         fsIjM6p4eTf1NbpDNfTsB7xd5pl+4saRC4SVpRYLaD6+fFmPZuBEznxLpenCDk7yext5
         ALWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782390188; x=1782994988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUF5oZ4bJk9n1lNWggR+VAUllTdDgrVBFBqrq4XJb04=;
        b=Buly8GO3jUqDo/1/aRoGByg2dNmT/9tIi4vqfRxT0ueIA7uGxkRTgE6wFWPgeuY7s3
         FxUDmHs2wN72DmYhp5CyEeumZpLefJK2nmJ5MiAyC3OLyNUNyYURbhmm2UHEjNF8in7B
         snXwAuaODR/4g/1ZBmhSgN+FAwcZUuzXej6GTgQlpiN9XQTOkP/5BJkfdwlD/WKaxWed
         MIg6ebtvHXsH1H7MBmNDfur5F+TOS8yuC0oVgabScdfIMneks23RUzOGeaW5TNvXi6cf
         npW1NVGH0UUzcp1pEv72+MKFSaAr6GBi2tTRHVaOEWPxS27/aDE31Khl0K2thLjNKTO3
         XcWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XK3lYawZLpbfei84vGr2kyYT6sLvVynVqmMRCZ2pY/xC39Kow0pCVh2gGAyqcBnY1lII2jK2ejAFLPzAW@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZ+Q30mMGzXWgniwMRYm2qhbFRR3slJzuC2AzO6FBvnNFvdh0
	ZsQRoIh7NlB098srCMjWynJaZ72v7JlT2yeTYA/wGPUR6gK/qusbNJ++7dxTqWwsquW0p86aFy6
	5kGcgg/b1btHJgu7m2omCgsoKovTNva5tNQJ8H0KcUIXdIdpvCBNE2lMH069HkOG7iaPW
X-Gm-Gg: AfdE7cniIEQRv4cSWR2jSV0uEksLu88S/0bM+KxLIZASl0QuSUR25adk4IlZD0F7zAF
	NRb1B7KDxwYrruV/vgMPZ8pBObs87VW24tbXQByx8P/7BsfcW31ci+SCg79rBVvrw/BmqAA6hhv
	/WKSSddECW0OplKDLG6i6YIKTh7jh7qtwtqmSprL8jcTmgHR/TymEIprkbKnbnU+zGaSlHUx0Fd
	2STW0VUh1Iv1pJvAkfdbBIotTsGV37gGwUXGJu6pfkrtDMAwh1zLBsvi6yoDLRuX7ovwc0qlTZ8
	ux8T+964GXxjuwpjc4ien54cyN/zBh2nE8NGNE40kB+Q+sqSTzaWv1J/Zt90pE5zsFJPhCfHy6T
	bd2FbPb1fBdJwTjIIYFl6Qe37AnX+e227CFpTceiobh1XkA==
X-Received: by 2002:a05:622a:1355:b0:519:9efb:56f6 with SMTP id d75a77b69052e-51a727f437emr17335721cf.7.1782390187477;
        Thu, 25 Jun 2026 05:23:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1355:b0:519:9efb:56f6 with SMTP id d75a77b69052e-51a727f437emr17335321cf.7.1782390187024;
        Thu, 25 Jun 2026 05:23:07 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbc2c6a9sm169899366b.28.2026.06.25.05.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:23:06 -0700 (PDT)
Message-ID: <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
 <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
 <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX8aDdFy3jcosu
 7HAllyLG/B/hC8V1gywHL0+V576XVXxYOMU7LFZ+kzlDF7zx/sXXFJ+ORSJYNBYHAXhcTUvVV13
 7qGZQfT0hVoGx6hufo/tkydyii7+cfE=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3d1dac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=XGsMiajvR5-pPuaPleUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 97F2n19K0MF1KnHF3h6t7Ubp3YL1yuzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX1OPoHlH/sYxh
 mYIzSdcKqS85JVaGRzCy8P6Zc/5dhvM+4Zu89mD6Q93lYFDpTIgmgI9Ek90kz7tA/2g/h9/Ss4C
 7GvaHXXOG1gYJmV6GUJ445b1yocjjLMaBhqkk3NCSR8mAn/Nb52Y2vWWsDbZhLIO30KE9Mihtao
 U1ufa0z+tfzm+mM2uOsFmR/oKbyPBfwr3ISHICHGwO6lssDWq1HqCVNOY3ktkf3eb8xQdakj8l0
 S1wuRTkYuopeZn9HQ+DivXZfg/Qo3XsduGs+sXflrdlRu5z+XxHQ9lLofkCJMNhlHaYcEJ/vXjH
 RqWawGjpVIQZZLK00G1xAUGoMr54fu/tTjYypMNiTKChMp4qmqjINUob60AATjrVHTV6mZbuVcZ
 jbAkprKS48XZF8jAh9VZPi1icViXuxvJm/ULoTkn/PDpEwHimQ1sUkX4aE/s3QlBdXD9hxThF7P
 r8fQntVPYb97VEuMElQ==
X-Proofpoint-GUID: 97F2n19K0MF1KnHF3h6t7Ubp3YL1yuzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114529-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C79B76C59CA



On 18-Jun-26 06:37, Aaron Kling wrote:
> On Wed, Jun 17, 2026 at 5:41 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
>>> permit scaling the Last Level Cache Controller (LLCC) and DDR frequency
>>> by aggregating bandwidth requests of all CPU core with reference to the
>>> current OPP they are configured in by the hardware.
>>>
>>> The effect is proper caches & DDR frequency scaling when CPU cores
>>> change frequency.
>>>
>>> The OPP tables were built using the downstream memlat ddr & llcc tables
>>> for each cluster types with the actual cpufreq LUT tables from running a
>>> CQ8725S device.
>>>
>>> Also add the interconnect entry for each cpu, with 2 different paths:
>>> - CPU to Last Level Cache Controller (LLCC)
>>> - Last Level Cache Controller (LLCC) to DDR
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidths
>>> ---
>>
>> [...]
>>
>>> +     cpu6_opp_table: opp-table-cpu6 {
>>> +             compatible = "operating-points-v2";
>>> +             opp-shared;
>>> +
>>> +             opp-1017600000 {
>>> +                     opp-hz = /bits/ 64 <1017600000>;
>>> +                     opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;
>>
>> I think this should be * 4 in both cases since the interconnect driver
>> ignores the channel count for a node in peak voting. We may have a bug
>> in all other DTs here.
> 
> If this is confirmed, I can update this patch. I based the
> calculations on my sm8550 copy of this change, which in turn was based
> on the sm8650 change. If this is wrong, that means one piece is
> scaling 4x too quickly? Making it a power consumption issue, not a
> performance issue.
> 
>> BTW, are there no lower OPPs for the fast cores?
> 
> Not on cq8725s at least. These lists came from an AYN Odin 3 with that
> soc. I don't have any sm8750 proper devices to see if that's any
> different.

Mobile SM8750:

root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu6/cpufreq/scaling_available_frequencies
1017600 1209600 1401600 1689600 1958400 2246400 2438400 2649600 2841600 3072000 3283200 3513600 3840000 4089600

root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu0/cpufreq/scaling_available_frequencies
384000 556800 748800 960000 1152000 1363200 1555200 1785600 1996800 2227200 2400000 2745600 2918400 3072000 3321600 3532800

root@qcom-armv8a:~# grep ^ /sys/bus/soc/devices/soc0/*
/sys/bus/soc/devices/soc0/family:Snapdragon
/sys/bus/soc/devices/soc0/machine:SM8750
/sys/bus/soc/devices/soc0/revision:2.0
/sys/bus/soc/devices/soc0/serial_number:<snip>
/sys/bus/soc/devices/soc0/soc_id:618

Konrad

