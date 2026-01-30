Return-Path: <linux-arm-msm+bounces-91258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b7J9Klt9fGkyNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:43:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E832B9038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80560300B594
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9A9353EE2;
	Fri, 30 Jan 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVkpAs+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7s7u6mc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D42352FB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766231; cv=none; b=ZpcP3Vfq92rRYSubnDJ2Y3GPT5XX9mPL7Qtjo4CXHxm2NnNf5+Ob3JYFmT4UnnrbAK/NS+Kzq+L8pr74aNaw1ZlRo0oTsri6ZlE/zwksoVlRl5YZFBJL0wlQ43SM0pOc1vOA5ruyWwqe+44zB2MjObiID8yhSN/HrNSXKkCB9Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766231; c=relaxed/simple;
	bh=8nBohHh4B1JistrSLUe+ybhsXh3+QyKVS/BB/3QK+1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iu9ASW7w8up+jns1lMfgfyiBx5DwizxuibOEf6H4fSzck6TuXlRzQz4BK2LfNVKuTgQSEYFMNFVgIQK1b9k1tL2AhieZ8cfLwSN9O5vXt8jyqm+uG3unWut4wuXgCfiv6uiq5HCXiQQ+iScJUrnd4TrqOcihoqTt7sbdS+Lim6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVkpAs+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7s7u6mc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VZIT995901
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arNaou7UElK3kr0918LpPz/GUPVT1/KgI0TILUNW3OE=; b=oVkpAs+t0jSfRhlT
	n5AbivMEM7GFy3AQeh1owMxN7LAa13TkjHYD80Ruj72TVPHc5Q3WLzH0Ed6zTXOm
	Mr9xN51lkvtbnmRjgO3fvlJ6Lv06W7FQDKTC0G9wROOGEHPnHRHfk8IyfCB/zfxZ
	+gCAf5E4ly0r3ka+NWJYq3/BIQW/BrXhZ3OGm3yxPvzu9SJlEcYgaQinqLfI5Rpg
	RyvDEMn5bKrOlordtihxAIN2igQCe4FoKyHiaOON4p1f+Jn5V6BaHp5GF4XOAcLh
	iPds9OyBj21HarL2SIrmgX45NvnEwpAgepgmIwaruBFyoys5sW3adxdyOymJ6KKG
	0Kkwzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvjkyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:43:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946586903dso1546756d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769766228; x=1770371028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=arNaou7UElK3kr0918LpPz/GUPVT1/KgI0TILUNW3OE=;
        b=e7s7u6mckBzUXVWb69M/5Ecy5u0K6DEc7l/FsuSLDwTos4FVZggaE/4toW08qpeHa9
         F18ujmmLw0sU3WnivvrbYVhrl8/inrxohspzzMELXLTPdL7BXC6MS3qmz8Fq1vJ0Vb7S
         2OLpnfV/lEzCq6h54H983+G5w8C3eVOl4eJ7QBkYDBbHQv3WiQapyCHmzt55sMumeNnS
         nrHPR1f3dBGG+Se6q6M2fJO3YI27ephhHuK+2GMibcSCqJj0QCs1N62K8ptYYV3OfR5I
         NQV3qwv949K832ChjDtTIHnV/gz/iSxs+KIEOUXr5oB4wkGyZuWFQ9agfataiV5SMqFh
         sxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769766228; x=1770371028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arNaou7UElK3kr0918LpPz/GUPVT1/KgI0TILUNW3OE=;
        b=C349Wgoj1YS7PW8tZ/ktV5A5QkbxZanOSPiTy0H4UVuhmgFzj9iNG5Pv9ZGIcXf+hg
         npWnmDYwBf7CNHkxGxRl5y8gXJsery81PZIjwbXZJVuKTKlZ1fMjpYJVx41OeVA48bHh
         ITrYjlElqkwLd1/1DIhe/mlBkceB3M8bzWn2prpwufCinEHn1534/pKlvytABuLyNukr
         q4A9fh3dCprtwTDvtHlmDwVeND54zlbSUf0dwNl41z4eLR5cfNb1TpLW7YUsYdr7tljQ
         0Q00kATGhBgHYEfG0H7/tMmvb9ZwFaLuqT/XlFixRooWVcbY5PUVpJdyYzW6+H0YmKUt
         dqLw==
X-Forwarded-Encrypted: i=1; AJvYcCWtXooyc3DGf9ErFtZhuHAhciSE+hPirkLUSNYa8g1EdcxcQrzaCpW4CdPp2+vtgwRluSgMV69T0aCpFRi4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3NKmmiLyoB2uJOTzeGJTG5WsTO7boLhYh5rjFqgTibg6FrBY
	XsVBBjO4eshqJK6w7OX6YIdkceBEE9HhCDQDQKS0eUq11VedwmnKyad+KuCgEe18AX5n8khAkHk
	a7ZvXbpsgKrmmuCvJaXPGlKU0UywHQ77K4Wyp19sgMlfC9TAvhY2iW1V5p5wItxJgMTv4
X-Gm-Gg: AZuq6aLcSKQAnttWU3ZxK2YKEJJ6Fw2mkXCDOuP8zlfZvp4KWk1u4S2YJI0r5rG21QL
	NzzQxDUhcIbloC1hRlQwunQ6k3APAPlhtZmyXzYU9oait937YOmKhP0ZA1BSr8LlSp8dg11K3Vz
	1+Y6ZBPT3ZFr6uB4VYyVZiu1zggotDIyrZ245J9/9Gzdn7Wuqy2VEEfD1mOR1MXzHGDiDFOAxqV
	C2vxUbHXjW3sQYvx21u5UHUeM0Qime1MjlQDJje+5KjMLtfCBl7R/nwSYTqyfIl6tkCX67tRhzL
	pHBAAt+CQwCfF59qtmceimoEK9ZBj68XfG6dv4mLCPXfDIF7Zm14RCe/rclmEPzIvclazsrre8Y
	L8oevBEuP1h1T/VMTIHMsBgDzmxRm/R/4UvnkAIl2iwsgu2EwpWj5HfET+gzAHgrPYNs=
X-Received: by 2002:a05:6214:8086:b0:894:de0a:4cf1 with SMTP id 6a1803df08f44-894ea18f0b8mr21353686d6.8.1769766227880;
        Fri, 30 Jan 2026 01:43:47 -0800 (PST)
X-Received: by 2002:a05:6214:8086:b0:894:de0a:4cf1 with SMTP id 6a1803df08f44-894ea18f0b8mr21353466d6.8.1769766227455;
        Fri, 30 Jan 2026 01:43:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b42563dbsm4094058a12.3.2026.01.30.01.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:43:46 -0800 (PST)
Message-ID: <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das
 <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697c7d54 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AKt-FI4Am6_hGqfKY9QA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 3IcWgp8AJOYqMlWz-vagZ9mLvWTypN53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NSBTYWx0ZWRfX/etDKTaQCnka
 mUTRtpuTwOQNOX2qtP+PMmeDGBah1+VDhvtsPOHSwzdv7lIVFX1rmyaINpqkv2GNcYf+jVSR5+R
 7Cb2BEW5efEb4FXrZzKPwFcUhK5KhPS40VegavBlMiGAxy0uq7BjOsDwSCj4pj4wKxtSVCkRFIg
 Adp95p1gyffdjJwlPhrfXplzjMwp3jFexQDTtyDxyjibcMIvucVWUCcPIRrJVyCLa5GgwAu++SU
 Mw70LqW5jz8gYAtLFlXHe1uqj0081JAdnApXmruSPYiEAP37cGQn5dxiJsuVSb6dKK8IQ3dhN+5
 iQwEJ3t3dKK+YHFyBkDN61rvbmAywfGMCZvUqisQYZEcYEh0WASdg8UkQGii6mFTe5PYIa9+Qav
 PFWIztKIbxWSf29YDQCDcOJrC21CSJst9hRumlMcympTN4nsiOoPxmhHrfTGzKdPcjrifA8g+Yt
 FY7N2ZRkSgs1vdbliTw==
X-Proofpoint-ORIG-GUID: 3IcWgp8AJOYqMlWz-vagZ9mLvWTypN53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91258-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E832B9038
X-Rspamd-Action: no action

On 1/28/26 3:10 PM, Abel Vesa wrote:
> On 26-01-28 11:34:49, Konrad Dybcio wrote:
>> On 1/27/26 4:03 PM, Abel Vesa wrote:
>>> Add the TCSR clock controller that provides the refclks on Eliza
>>> platform for PCIe, USB and UFS subsystems.
>>>
>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
>>> @@ -0,0 +1,144 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
>>> +
>>> +#include "clk-branch.h"
>>> +#include "clk-regmap.h"
>>> +#include "common.h"
>>> +
>>> +enum {
>>> +	DT_BI_TCXO_PAD,
>>> +};
>>> +
>>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
>>> +	.halt_reg = 0x0,
>>
>> These regs certainly aren't at +0x0 to what we normally expect to
>> be the start of the TCSR node
> 
> They are if we add the TCSR node with reg range starting at 0x1fbf000.

"if we take the wrong base, the wrong offset is right" ;)

The docs for Eliza don't have the nice separation like on e.g. Hamoa,
but 0x01fc0000 is what we generally agreed upon to be "tcsr".

The registers that first appear in that region are the same as on Hamoa,
and so is the address, so let's continue that tradition

Konrad

