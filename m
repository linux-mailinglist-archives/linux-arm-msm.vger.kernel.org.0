Return-Path: <linux-arm-msm+bounces-114174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gFPiOk5oOmpS8QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:04:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 589376B6842
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:04:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oukTcqS3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JmDwV08v;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F223830A70D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0673D3326;
	Tue, 23 Jun 2026 10:58:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE843D1CA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212308; cv=none; b=r0J/43b0VRofW4/AAUXalvwQRUgstUt+IXI1U75Q5PGsLhcrD+aVPwtkR3x16nsujrrNTNUVjla3xfwvfdr6Mu05RPxvCZ7CZWeKI8P0IKGZW3wGb++Px7pNo1C2CSFnj/h44Es2awWV1X8mLv5VwjNc3iDOrp1cdejlURbN0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212308; c=relaxed/simple;
	bh=viENJvrkHODS0xqnYXPoYb6vMAkwgQp3oDG+31aWJyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mps0un6LvVD8siWTRgYUiKnFFjIJS+KP4KkHUaIy3/kTSxkexwbYQpaUpVCVsYb36cUERwvi8ml+u+4UFAEEuRGLXMGKRhibn1+tuS4X4raA7kR+KxL4XhZAwOT9k/bGhXFGthXhvKl5b9TqHWXujhxSJAAXBVy/nwzFlgNf+eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oukTcqS3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmDwV08v; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsYLC1066928
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IGsPs/4dWIdsXyUV1XnpGzT9FbpWpNRlWQRo3MGxaM=; b=oukTcqS3QM7MUCNl
	sMgGs+ysoUnwi1ZgPOb5kvR2rV57D7G0NPLNLu47JmNXmbGu2Pv52HRxrAzIUBth
	YHQ9MGNVOvWe4S1RKNnYItzQVAFVHqr0PflngTPmaLrcExEHzyTAW55XsMaGb27h
	1loseMjgiSzSi6gvj/uUR/Y2tpwrqj76NFJHAB5c3o4HyMtLaDMRXQV6Kj6CA2bs
	7jZY570LhVMkUDanB5oe+FNwroR1TbMgkQu3uC8ZTQWqi6UqgKlA1d7R5dFP83YD
	+WJGiB2pP07KETbpqM7VC+DmhK0Dq5H21ylKgi3+G8bowXmP+1nn8hB5LFATRrzd
	zUMBgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28r6xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7645ac9b1so28435785ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212305; x=1782817105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IGsPs/4dWIdsXyUV1XnpGzT9FbpWpNRlWQRo3MGxaM=;
        b=JmDwV08vr8qzMSPgAtL6xg25wZmLi9si/+J730XdwTwncHW39c3IL+uMXwjNDc842O
         j5/0VDW+ONbbVkBAXvxBVdnefAqpnfJZRo9SqDnlLKx3nIl8MibswyKyFnVQI0P8z0fA
         aXM6tJ0UQDven8ti2c0X/CoxiMjBIGa5Z+8dbN5De1S/eAoWkgJLzXNovic8JKx8/n4B
         /Zz00GLzaf4oPUs1eP8EgwomU5GlWr3exkgqEXK1PxSL7KwaT7EtdpR6icNKkxH9n7Ir
         bnf2fyh4qGu++M6+ilA4L6/yh4gFOUB8BSX7WI2OGnArU25RaPb+eqfurZxxTe8UtmDw
         qQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212305; x=1782817105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IGsPs/4dWIdsXyUV1XnpGzT9FbpWpNRlWQRo3MGxaM=;
        b=UsEYDA+P9rQlCWgyMH8v2jsF8SJe44iBMoibV4BZGowVr+6S/10Rad4f+XQ1jEc5mQ
         F5df59zs/Cnx3DasDYJTsUClaqPDLOSnT8GnnmzdA3L0e4D044HKrMaoi0RWM6Ltwylk
         ZuoS3fXGvkNXC3jqdBTzJFU84fARr/c/iDUsSEAOIWGN0xCU8C+/b7Ewo3a0hz4gZ3vD
         dS38NoLQBE5x3DFEoVPigIJYGvCXiGzIxkDifUooR+6U4RSHqs2/Q1OR21mpsRwxFdIc
         D+H6AieFcs2FSLXEmbK1hONebKlCKB3W9g4cHzkPh0HS47zPE5JDqQe10Qe4FQUxSz0L
         kIRw==
X-Forwarded-Encrypted: i=1; AHgh+RpA/2qdjGptHgj8HYMWYlTz205YE7FOMejpId0vC0j1BPQRU9rl9mRIrbEoKOf3ekd1yvlJFoSISt/JAYX1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ekANqtM33UdIQosaHgULci4+tXByWkgKd4Z01s+CgyziPpkK
	IeO7djYzYtpnNK/gmIr8Wp4eR5ZC8/Iy2AaEdwbb293qYKD+Z+o2DLQU5lUpVlNm+JkqUf8OlXR
	PCq7QdXCRU7WHQCgC5r3Rn8zoNImRsCy6cJ418QkRLX6GY+fA0toGdhXNIcQKWpnhhHpI
X-Gm-Gg: AfdE7cmW00X4at//fUQdeR550yp57HNjlF22g+U3ufWisC3SRU09eURXZI12i5rZj5l
	G1VqGZoHJuE4ged4uf1kAdsiRZwbGokMKdKbuaJjkz6Izr4aRTrVDYVeTtNdjCy2SJTFv3KpxgW
	ol8QH0JqksSfGbjkk7mgwthSB/0vtgmKvFD8kqsomybK7gNxGjhJpZHuQiiQybjZt8cOHn3l6Ym
	WUVfWgIKizh+Jgx60pUrq4J9DkzlFQ0A6dsRbW1YSYElurTwpJ2vzV0elr0GHKVB+ljE5kBrMh9
	fFgLuUQHGjv4H4TcEGq/8v5WLarIgEm3sG2US/dVKsyWsg5Oh+b8lF641kCXpPVCeDxLH52DCxF
	Bbks+/S0kN4CdqYioUrhuerVfipR+vmqMtg4dnvJHznDT1g==
X-Received: by 2002:a17:902:e88b:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c7c76e9d8fmr27581475ad.25.1782212304733;
        Tue, 23 Jun 2026 03:58:24 -0700 (PDT)
X-Received: by 2002:a17:902:e88b:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c7c76e9d8fmr27581125ad.25.1782212304113;
        Tue, 23 Jun 2026 03:58:24 -0700 (PDT)
Received: from [10.92.209.135] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfea46sm101312915ad.69.2026.06.23.03.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:58:23 -0700 (PDT)
Message-ID: <298cf2f5-64eb-4430-b264-0d046df14dbf@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:28:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <e203221b-5de5-4cc3-b65a-a3545986a954@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX5Unde3VXkLsM
 WCHdNSRfy4pUVlU53VD/pWT2ghOiXfZldIR9XnW4n7cVOJYQfVjZAZNdMvKKiwHmG5JzJXEfsRR
 GDlNrLCCvJjAHlQhfWIl3HuWPsjtmtA=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a66d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eNTHAPU1Su61nugwMeEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 4vXJGFi3ruIGdSs2eg8lPp9DVo6BjXgK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX8Ok+oA3Mx7Eo
 NIn8yUUxTzQfMj/Mfta90t+Y2ErQp0zm+CCbai75KoU666JPD1eH9fBocDyM9MOJaFi7nqabZ6g
 bXvhz17hxsY/WlU5OOxRlL321Jv+Bzt8rnsNSBBjZ1d+Dt2PoFvwDxDEApESsvXHVt8Q1Q9p0Ph
 7n2QreECp8CJYf9BKkAEU0Pb5jnJZMot/FdUnjBGx30xrYsyTv3mosMVfJhIS7T+dIgaKE+QzPy
 pCzKJpBHVkquBPXq0DBsBqNCZjpNR8sHcGVR1+H4dmSWIf3/hHNrQE6RuVY78ipHOdJroLpC+Kd
 4YdIt0IuJqmLrtghVmyNWhMEvzgmPBr2Nsn+FcJAfP2lwG1w7KO89JIyv6S2U1aLXZyKJz39f/i
 KDLzym2Mvc8I3ZtZgVgw+hsBIrab4CTt+9C4/nrHyby8R/iVC8O2JcDNOjUtAQNxs4a8C7on640
 UosRKqpUNLnVjHUbbjQ==
X-Proofpoint-ORIG-GUID: 4vXJGFi3ruIGdSs2eg8lPp9DVo6BjXgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114174-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 589376B6842

Hi Konrad,


On 6/22/2026 4:31 PM, Konrad Dybcio wrote:
> On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +#include <linux/bitfield.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/powercap.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
> 
> Please ensure all the includes are necessary

I already checked it and removed unused headers

> 
>> +
>> +/* SPEL register bitmasks */
>> +#define ENERGY_STATUS_MASK		GENMASK(31, 0)
>> +
>> +#define POWER_LIMIT_MASK		GENMASK(14, 0)
>> +#define POWER_LIMIT_ENABLE		BIT(31)
>> +
>> +#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
>> +#define TIME_WINDOW_MASK_H		GENMASK(22, 16)
> 
> Is BIT(15) not part of this?
> 
> [...]
> 
>> +/* Domain configuration */
>> +static const struct spel_domain_info domain_info[SPEL_DOMAIN_MAX] = {
>> +	[SPEL_DOMAIN_SYS]	= { "sys", 0x40 },
>> +	[SPEL_DOMAIN_SOC]	= { "soc", 0x00 },
>> +	[SPEL_DOMAIN_CL0]	= { "cl0", 0x5c },
>> +	[SPEL_DOMAIN_CL1]	= { "cl1", 0x60 },
>> +	[SPEL_DOMAIN_CL2]	= { "cl2", 0x64 },
>> +	[SPEL_DOMAIN_IGPU]	= { "igpu", 0x08 },
>> +	[SPEL_DOMAIN_DGPU]	= { "dgpu", 0x44 },
>> +	[SPEL_DOMAIN_NSP]	= { "nsp", 0x0c },
>> +	[SPEL_DOMAIN_MMCX]	= { "mmcx", 0x10 },
>> +	[SPEL_DOMAIN_INFRA]	= { "infra", 0x18 },
>> +	[SPEL_DOMAIN_DRAM]	= { "dram", 0x1c },
>> +	[SPEL_DOMAIN_MDM]	= { "mdm", 0x48 },
>> +	[SPEL_DOMAIN_WLAN]	= { "wlan", 0x4c },
>> +	[SPEL_DOMAIN_USB1]	= { "usb1", 0x50 },
>> +	[SPEL_DOMAIN_USB2]	= { "usb2", 0x54 },
>> +	[SPEL_DOMAIN_USB3]	= { "usb3", 0x58 },
>> +};
> 
> I would expect that the names are going to stay common, but the offsets

Names also can be different here. For example, hawi, It has only subset 
of these domain and it doesn't have dgpu, it has only "gpu". cpu domain
names also different there.

> will be different. This array should probably be called
> glymur_domain_info[]. We may have another LUT just for names of indices

ACK for glymur_domain_info.
> (i.e. [SPEL_DOMAIN_xxx] = "xxx")
> 
>> +
>> +/**
>> + * struct spel_constraint_info - Power limit constraint information
>> + * @limit_offset:	Register offset for power limit value
>> + * @time_window_offset:	Register offset for time window
>> + * @supported_mask:	Bit mask in capability register
>> + * @domain_id:		Domain this constraint applies to
>> + * @pl_id:		Power limit ID (PL1, PL2, etc.)
>> + */
>> +struct spel_constraint_info {
>> +	u32 limit_offset;
>> +	u32 time_window_offset;
>> +	u32 supported_mask;
>> +	enum spel_domain_type domain_id;
>> +	int pl_id;
>> +};
>> +
>> +/* Constraint configuration */
>> +static const struct spel_constraint_info constraints[] = {
>> +	/* SYS domain constraints */
>> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
>> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
>> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
>> +	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
>> +	/* SoC domain constraints */
>> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
>> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
>> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
>> +	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
>> +};
> 
> Is this specific to Glymur, or SPEL-wide?

So far, current targets share common spec and offsets for constraints.

> 
> [...]
> 
>> +/**
>> + * struct spel_system -	SPEL system
> 
> odd tab after '-'

ACK

> 
> [...]
> 
>> +	case PL_LIMIT:
>> +		new_val = spel_unit_xlate(sd, POWER_UNIT, value, 1);
>> +		if (new_val > FIELD_MAX(POWER_LIMIT_MASK))
>> +			return -EINVAL;
>> +		reg_val = (reg_val & ~POWER_LIMIT_MASK) | FIELD_PREP(POWER_LIMIT_MASK, new_val);
> 
> FIELD_MODIFY()

ACK

> 
>> +
>> +		/*
>> +		 * Enable/Disable PL based on the value:
>> +		 * - If value is 0, disable the PL (clear enable bit)
>> +		 * - If value is non-zero, enable the PL (set enable bit)
>> +		 */
>> +		if (new_val == 0)
>> +			reg_val &= ~POWER_LIMIT_ENABLE;
>> +		else
>> +			reg_val |= POWER_LIMIT_ENABLE;
> 
> Likewise

ACK

> 
> 
>> +
>> +		writel(reg_val, reg_addr);
>> +		return 0;
>> +
>> +	case PL_TIME_WINDOW:
>> +		/*
>> +		 * Encode time window: upper 7 bits to [22:16], lower 15 bits to [14:0]
>> +		 */
>> +		new_val = spel_unit_xlate(sd, TIME_UNIT, value, 1);
>> +		if (new_val > TIME_WINDOW_MAX)
>> +			return -EINVAL;
>> +		/* Read-modify-write to preserve other bits */
>> +		reg_val = (reg_val & ~(TIME_WINDOW_MASK_H | TIME_WINDOW_MASK_L)) |
>> +			  FIELD_PREP(TIME_WINDOW_MASK_H, new_val >> 15) |
>> +			  FIELD_PREP(TIME_WINDOW_MASK_L, new_val);
> 
> Also here

ACK

> 
> [...]
> 
>> +static void spel_detect_powerlimit(struct spel_domain *sd)
>> +{
>> +	struct spel_system *sp = sd->sp;
>> +	u32 capabilities;
>> +	int i, j;
>> +
>> +	capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
>> +
>> +	/*
>> +	 * Detect power limits from hardware capabilities.
>> +	 * Start from index 1 (POWER_LIMIT2) since PL1 is always enabled in spel_init_domains().
>> +	 */
>> +	for (i = 1; i < ARRAY_SIZE(pl_names); i++) {
> 
> int i = POWER_LIMIT2
> 
> (yeah, nowadays you can finally declare the iterator inside the loop
> in the kernel)

ACK for declaring the iterator inside loop, but assigning to 
POWER_LIMIT2 is removed in this revision based on V1 comment.

Thanks,
Manaf

> 
> Konrad


