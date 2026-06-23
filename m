Return-Path: <linux-arm-msm+bounces-114178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5fdSCyZqOmoM8gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:12:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1B6B6982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:12:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KfIlS2Fi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DgrgUsrG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114178-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114178-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 638C530459C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1876F3D3481;
	Tue, 23 Jun 2026 11:11:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3273D3CEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:11:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213099; cv=none; b=aqWKB5Slt0c9cFYm3rghISH+GNU7zfYQZt4nOx+qmtt7igJ139ET+g92C9e6rtASIrDBI+n5gaz5ZHoGe2SeoRQQzz1vxuEV33/COofsAslmrLX2x6a0b/ZMykVBrjxZEQgjojkMZHWeXJy2sBan48p9zbQqrouRqW2lNF8Dixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213099; c=relaxed/simple;
	bh=muGmIAE3ctBmNTCnYhUL+xgeooXP1KN6XjPvfxiE1yM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOSGCuMN/AIcJo9Y0fB3iWvDzNC2xdWXXJarnru77lMQVckvq8PacnMvz1kW4bUG38ecV++KclsQzvrQsSGei0oZQ3ZBkXmoZC9JUIE5Gdt9hbQaxA/62ZZHyVfiXwvKe5X4GW1qxSjQ6tYA7gMEw7ql+1BUcx7iQOoGSc2buTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfIlS2Fi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DgrgUsrG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsdn53664040
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzqALdblDXBZVqRJZi+H4syjn1xGwSVWvWykJOUOihM=; b=KfIlS2FiSRKwXgD2
	SQm4aPtXMMnxMnt/+PKgWncIAaygKsJulJ8+cwWMbp+dyEhAoqGF50l5k04SEBTB
	Pvi5su5MM4e55GTuM/MZC9ZrlEyrdIqlF4xK+zsxIHuETI8zsshyOTTfnVIEMzEk
	U527Hre3A7xhknGfXVEyF97XLYutT1xLnFnI9iiyzRGRO4g++ahwjWrkzCqsn+wl
	jGAWkNvT59N0s3U/6z2fXeKNggw/H7h3HXtjntHHlvnUop+V/Kvzzz8gORkmn4sk
	3Mj1+NpKPBZtQk6NYNEemlfJLhzJitGBZm1XiLgPthTsH/DQO2KUJzt7otoTZoV0
	ammrgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29gu90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:11:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a07295d67so7956531cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213094; x=1782817894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LzqALdblDXBZVqRJZi+H4syjn1xGwSVWvWykJOUOihM=;
        b=DgrgUsrGmddcfQM3KS/ybwBKPBoG/o3r/cC/9qfRBc5FbBbueZchDGWt0iET0Bw6yZ
         zd7G73jDlK856krFqME0HtfzH3pYsltfTpxuuJYXzow4lkorMHln7mgBaJp6e0+CEEKy
         cASxkhZlETFIIUu5W+TYZLRXvsYFBC9uWsWFNy/lEVdBYsimq8F9kTDKQxbIbriIrhaD
         K8/oL+gvgE8o0HPvuk4OF5LssS3qmCwtDSCIhLsvSMKbCH7seFdiJYASFwvkMm0dcSxQ
         JGwii/f4ILorJimBseONf16bpsaYr5gPQbkjKEntBN1mZKrfOeulnxLw0oDY5n8tDgxF
         u+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213094; x=1782817894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzqALdblDXBZVqRJZi+H4syjn1xGwSVWvWykJOUOihM=;
        b=oNQph4lffrRaXvEp8Vsm0dhmxVLBT9vxhafOxjBiXd7hnOfUugW82j4J84+PeL09Wc
         KEiGmPj+F/W5hzpy4qsvpWVLFu+ICEkWOjXwrq+pI0ljPkq8t4sgWHiKdmYAAiRw7Ee5
         dCrYULD2NjedZvdfArkCYr6bquTh3dlr2wS9N7xFNFDrwaZYcS30hLVvJ7BAasMXPpdH
         hENifQ5eb4ZQWSvA5CRc9Im5Y0etTywcgIWOzu63tEYd8iAa2mAahkhuvGum5qB7s1oW
         OCwHJnkR+rxt4eCKrfWac06UH1RyvSYOeEmS2/q2rSURFCjRt6EZok7ReBYz7EzCvrhU
         ymtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OO7ZWuNrbopIfDJ94jaZ98gU5OErTS2mOe4ArjAsPfJQ4P9bHHnDNJCqFkpzrg0Vjk8vQ6B3nROeZzY/v@vger.kernel.org
X-Gm-Message-State: AOJu0YysWQ8yL3HUzejZrjJprVEStvE5BE2N4erSul7M39nH9B8+WPh6
	SuiN+npHYW0Lj3MKcChM9wT2QqdPjQZXl+2gcTSn++vAySg6aQtJWNuFQD2rS01v6qonoW8FhXP
	CXwG/LiM18mvpdIxP1CCwIyWGfcLu8Je6KjiZXEJcH09eWNl51/LEhgYchIRgp8jIugen
X-Gm-Gg: AfdE7cn6BZT5zu34Lbx+Jd3kPHGBQM5obbW/UHZQ+a4igI2lv2tuS45xBzZy9coVZxD
	dsP45rivPilK1yKTIhG/oCiIPo7FrhygdsaapvYssTO11A2X6O675JRmYIHDWvIukoGcs3lt2Lp
	8bbwqfhTTAR1bzWMZzhApt3VeWAc21CE8GiO8UVS1Ekoihq7uXMqDQ0GSw1vj83PHZ0HSxft3Mj
	Z9JdntDuZ+Euub2cSyQJt9ovjVwwgDjDrdSCuUk+aCiQS24JaPUvYlBvW6B7l0SnyympO91eGTV
	CLIvv3t6D0uK+dxANap6W55cjZhe5DJl0zsohAKltUvtygDRElbAsgmlQRUc0fjXK9Fu9eVXnUj
	LYepADm4B+qixYBWhaPYSpmzVL9iq4aSIWoc=
X-Received: by 2002:a05:622a:1388:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51a4f449a1fmr47517511cf.1.1782213094019;
        Tue, 23 Jun 2026 04:11:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1388:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51a4f449a1fmr47517191cf.1.1782213093453;
        Tue, 23 Jun 2026 04:11:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be64ddasm4436982a12.28.2026.06.23.04.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:11:31 -0700 (PDT)
Message-ID: <22e0ab27-4b80-4a08-9d3f-919014e741bb@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:11:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-2-a3ee6837c18f@oss.qualcomm.com>
 <e203221b-5de5-4cc3-b65a-a3545986a954@oss.qualcomm.com>
 <298cf2f5-64eb-4430-b264-0d046df14dbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <298cf2f5-64eb-4430-b264-0d046df14dbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a69e7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Y4jFsmSDHp3uCgbhOVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: C_rmVAN-Oztlx4b5lyX71_BvrnMd0WC4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MSBTYWx0ZWRfX1H8y027cYOXd
 hixsGQy0BPSZLeQNRvOlX4itWcE+/ly4ykjbWevS0113BaANYe5VUE6B1hNPl2/pNuK9fPUFlYF
 giTXaeKycmOr7OUeiO4MLOdk5D2OBig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MSBTYWx0ZWRfXzt0vok2aSO12
 EKZK05VgNCZsMD6mpnh98vrRVmqlUA+XYA9/1aYZYrTr87M5y+ASZ5RStt1xAIgvOgAQObtjEVB
 5w1Phc7dDtrfZwCLisxchSj4e9SCzOshpzjIh8DkZ21WUOkFWImd7lT4a0tDvOBnTeLbkd4K7eT
 lWsmSJ7cPTB/5mWWhwo1lMhS3pRiqiXUYrdT0M7pa5424onXHlhyQ5kwo1KtX+YPsWHxDEa0LDF
 /VzZ2LCKcBtlUDUEOVyxVMzJIPXHfyYeAvtbczfKVNt6FxRz3vreZW+xk9QP/rpC8L2sjyDX1EV
 bigsp5Ctu9cVf4sU2WBTVhkd0sKG9uTrB5VhDxlwHTSMtPbfMsZRrZ6S7oDhBOXu0FATKhlyeii
 FxSB9fbVKv6PTdA+UMNkeI+Atq990Q==
X-Proofpoint-ORIG-GUID: C_rmVAN-Oztlx4b5lyX71_BvrnMd0WC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114178-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DF1B6B6982

On 6/23/26 12:58 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> 
> On 6/22/2026 4:31 PM, Konrad Dybcio wrote:
>> On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>> based power monitoring and limiting capabilities for various power
>>> domains including System, SoC, CPU clusters, GPU, and various other
>>> subsystems.
>>>
>>> The driver integrates with the Linux powercap framework, exposing SPEL
>>> capabilities through powercap sysfs interfaces.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---

[...]

>>> +/* Domain configuration */
>>> +static const struct spel_domain_info domain_info[SPEL_DOMAIN_MAX] = {
>>> +    [SPEL_DOMAIN_SYS]    = { "sys", 0x40 },
>>> +    [SPEL_DOMAIN_SOC]    = { "soc", 0x00 },
>>> +    [SPEL_DOMAIN_CL0]    = { "cl0", 0x5c },
>>> +    [SPEL_DOMAIN_CL1]    = { "cl1", 0x60 },
>>> +    [SPEL_DOMAIN_CL2]    = { "cl2", 0x64 },
>>> +    [SPEL_DOMAIN_IGPU]    = { "igpu", 0x08 },
>>> +    [SPEL_DOMAIN_DGPU]    = { "dgpu", 0x44 },
>>> +    [SPEL_DOMAIN_NSP]    = { "nsp", 0x0c },
>>> +    [SPEL_DOMAIN_MMCX]    = { "mmcx", 0x10 },
>>> +    [SPEL_DOMAIN_INFRA]    = { "infra", 0x18 },
>>> +    [SPEL_DOMAIN_DRAM]    = { "dram", 0x1c },
>>> +    [SPEL_DOMAIN_MDM]    = { "mdm", 0x48 },
>>> +    [SPEL_DOMAIN_WLAN]    = { "wlan", 0x4c },
>>> +    [SPEL_DOMAIN_USB1]    = { "usb1", 0x50 },
>>> +    [SPEL_DOMAIN_USB2]    = { "usb2", 0x54 },
>>> +    [SPEL_DOMAIN_USB3]    = { "usb3", 0x58 },
>>> +};
>>
>> I would expect that the names are going to stay common, but the offsets
> 
> Names also can be different here. For example, hawi, It has only subset of these domain and it doesn't have dgpu, it has only "gpu". cpu domain
> names also different there.

Presumably we can unify the names (i.e. use SPEL_DOMAIN_IGPU on both
hawi and glymur)

> 
>> will be different. This array should probably be called
>> glymur_domain_info[]. We may have another LUT just for names of indices
> 
> ACK for glymur_domain_info.
>> (i.e. [SPEL_DOMAIN_xxx] = "xxx")

This approach would still save us quite some bytes for the names that are
the same

i.e.

foobar_names_lut[] = {
	[SPEL_DOMAIN_xxx] = "xxx",
	[SPEL_DOMAIN_yyy] = "yyy",
	[SPEL_DOMAIN_zzz] = "zzz"
};

glymur_domain_offsets[] = {
	[SPEL_DOMAIN_xxx] = 0x20,
	[SPEL_DOMAIN_yyy] = 0x24,
	[SPEL_DOMAIN_zzz] = 0x28
};

Konrad

