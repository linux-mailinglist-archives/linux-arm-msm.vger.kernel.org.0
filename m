Return-Path: <linux-arm-msm+bounces-91803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGkaJbw9g2kPkQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:38:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2BDE5E45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 671553013A42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 12:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04312396D38;
	Wed,  4 Feb 2026 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyAfHi4l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GteXBl1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF73D2C21EC
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208622; cv=none; b=C3pkmBnU4kGH1EkCWHnjbu52I4lHhyF6GFEutmXqXWbH3L3pdgrZ9xQqtb1QbZOnNWCn4SBBEi37r1GryPVmKbO7648qI28z+nw5bgKeDlCrWckdd3S2rLKLxND0fndhsq2mvzOGNe8PpfX9XFaltPpwReM4pIte5ibqIowB6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208622; c=relaxed/simple;
	bh=LdXn/ryfUxJn/hgBuHb2D5P5T9VDAAJqgeMs+x9jEvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehbPWWuGXzqb97vOX1WDis02WIaCA8GgvEW+XrNZ5l1n59q0N5Fgcj1rQSH+1zpTvx1sKexuydCR4PcbpqkXYAKey34w2VURwrO1j/6YbX3I4TFewPz0ylqOJi1XEujZ8g9aNOCwgHtqRh2AbGOQmMwL2GP3/OOUtjWwtXXmJxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyAfHi4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GteXBl1t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIpm7096719
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmH2kIaFd/5FB5Li3TKThg1PLznVXCqpdEh7SV1yDN4=; b=fyAfHi4lXEQht5nb
	OWsmdXBmmM9+cOI8bHvPQvkt92XmLclC4Qo+ao1iBv/9wapPp/YRoDM29upLsmmz
	cz3UcIpEDf6pRrfaXgnX9BYl8oPF5tLIaOyNbqH3kXlfnFOLuRrPuqd5bXvCW8f0
	NHE/ZPdauz4jEHrtJNk4OGaU/sj/isFTnPT8TPTs4+l0FF9FOWhVEE2fnMc5Vmae
	HyLrD45BAxuywv6Xulj6+YM4ZhOHmSpfFI/JMOx4qh1RWPHeSiSZUd/7VzzCuyE2
	mDvfgzTeTH75gRu8ilu5ZXlJxRiye+gxVHxS26GykPFtVVsJ1TWXmhMJRl/ctJYB
	uynu1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44kbga2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 12:37:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so202703485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770208621; x=1770813421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmH2kIaFd/5FB5Li3TKThg1PLznVXCqpdEh7SV1yDN4=;
        b=GteXBl1t9ljMZMFiQTIoGtEed21J/eF/2nCIB6ZuSt8aBa+pYIpp5k5ns7qUNBvkcS
         MkdlTXcW2+3Q5lXTIfUi1UTKeQDM4HZzBldsy0DVXiCu4UjwV1ooACbvZoMS0kJQef7I
         vbV2p39ydeujXBikuMxIDLPfDUfzRgT6oMSEvvwCcy5hZMVgbRWjEqLJZNAjIOh7NzAa
         L8IACPuysPMI4oZpcI74B51BDeSDfmUZfapiz2yQOjgsncIFBQ6YBIjBIIBXOhrBxaPP
         pq2O1ph6RRXmi43cksQgnbCkrPg133bLW6cO/Qz94tVkG7r3PC3ZEEcoIM4kCBdX8sl5
         5GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208621; x=1770813421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmH2kIaFd/5FB5Li3TKThg1PLznVXCqpdEh7SV1yDN4=;
        b=DCYc0JdDQiUTmGyc7nVZq1zvmT+Z/fJejrhR0248I7aKT2jhlD702P8DSfH7aVo/+a
         9M89YuMo/4mmIbDzKIVox9Tn145FgDslJKHi/RfR3mSzKl+dTNvdugS7NbA1XoTh4Ev0
         glUpSQgqckdaPxEkqkcP6iOIr2EZre4rCRJ2h7jqYZS/9pxjsts7ndWGz/Vs45NJrjtP
         Rl0sGx9T0xBDZoZlhvPIrx/6rR2vt569TpBc/Lvdb5YXuzDPCxFo0LRGPldOomSA9HAJ
         m57uD+xXfGctOd0LtHi5WrVeuJONEQUvkrqwFzmbQgw5bypG2ptz2zn+Ir83LYBVhG8C
         X3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWXZ449ziGE4KwjTQqE1+j3y2ufEG1PQX5V8wStKremHt29pvD+m5YMWGwCoL3i5n15brUg6PL5gKHQy34y@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6s7pWy/EfRtWfrDsHktbtsUW0OFYbf24cIwmNFc+8JcUs6GB
	QBEw3QqCVEK45ODayJxCiwKcCmGL6Jr8eLOluoWgYQe7CKamm0PlNhPD/SDv2akV7ObocW41/vQ
	nhaycmlxEaZeqKsp/BWKuUb/yVJj9w1gBmrsLE8ti+ugb501x1jAJNvkxm73zPQiFc9ks
X-Gm-Gg: AZuq6aKfeHtbPiPAFFQlGoc3zH4djUpZ8PB1CLXhTMiAtCdGjPeWvkWpGD5L50tWwt6
	Xt+oyGlvNfa+YQRYzZ/olJuTEuwBatbhxHtnJeUT/0ZyERmP4VyVAYhk8OSQnYngaLcbqY1QoU/
	EGNLlpbfftJgZXcexl+ij8vchk8rot0KCIYOEC73fjd7LBy71l0RcIUUUu6efKOWKqkzLyD+P/p
	POSPIfUOJG9sJLI5tC5eBgJwR2WGck6POvNI9CvYb8TJ4c/8ZgPDnzdyBUXCgX1bjNAC+2s/Ws6
	Khb2LHLqxQlNLQIEZeRref7yfsEBubTIuYUfC6WTccpcd+pRTk6iyTfKVEk9Dz5m6muWwq5iGFX
	yWyt54irGxFlqqMWrqSP9XwjGxe/9LZMVRHr9uIxeQojzuS5RjiRDR8yt41PWlxc50yo=
X-Received: by 2002:a05:620a:3943:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8ca2f822612mr286642985a.2.1770208621038;
        Wed, 04 Feb 2026 04:37:01 -0800 (PST)
X-Received: by 2002:a05:620a:3943:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8ca2f822612mr286639385a.2.1770208620588;
        Wed, 04 Feb 2026 04:37:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea004380fsm116359866b.55.2026.02.04.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:36:59 -0800 (PST)
Message-ID: <2abe345c-ba9c-492c-8684-0d7f4e6b8c0e@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 13:36:57 +0100
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
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
 <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
 <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vDejQrJ-cR1wZLWThd_oRs92xIIm7FHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5NSBTYWx0ZWRfX8Zii13J6VEyS
 qph9PdJagyArCfN/ZvS5bZqsDLcGF7dx98hoHoZ7OO6eQ7mwBnxjaOkDo7lesOMF3IYqHd8exmx
 8SpFMKNdRawqDfQoBLVn7CIXEgDFXL/TFXwda2ydO9r8RS4y+9xWbn7ILUPjmVYYLyv2hyrSguC
 O0WTHpIaIXbM1WLTum0j4YUXzGPsI1aflhLIaf1FATDx+Plf51HscbqRGmcEH0M/bmbIqP0DmlI
 QxdU+bmSLOOMIDyUQOU98zL0h2iCPzg71yvKfpRoEd6u3O9hrer/sEf736VF57Id73c2KGVcy8K
 538oa/lYFRoPIdp45fleVzRNVQYTu1y/iFgwvHqhufT6sR+KbeQeHxssP1d3INWnCNjTFOCAe2F
 jnRVMAmKP0yrKCEQf9rIdEAdPUMVVAWjQaWoyJ9RKVAsxvb4Lr2ymVo1J0dTOHupxiHbS67avm6
 zZfAzkAR9lI27cNZHRA==
X-Proofpoint-GUID: vDejQrJ-cR1wZLWThd_oRs92xIIm7FHK
X-Authority-Analysis: v=2.4 cv=HN7O14tv c=1 sm=1 tr=0 ts=69833d6e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Bqp_KdbJKO3R4PKeuYUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040095
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
	TAGGED_FROM(0.00)[bounces-91803-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 4B2BDE5E45
X-Rspamd-Action: no action

On 2/2/26 9:53 PM, Abel Vesa wrote:
> On 26-01-30 22:40:32, Abel Vesa wrote:
>> On 26-01-30 10:43:44, Konrad Dybcio wrote:
>>> On 1/28/26 3:10 PM, Abel Vesa wrote:
>>>> On 26-01-28 11:34:49, Konrad Dybcio wrote:
>>>>> On 1/27/26 4:03 PM, Abel Vesa wrote:
>>>>>> Add the TCSR clock controller that provides the refclks on Eliza
>>>>>> platform for PCIe, USB and UFS subsystems.
>>>>>>
>>>>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
>>>>>> @@ -0,0 +1,144 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/clk-provider.h>
>>>>>> +#include <linux/mod_devicetable.h>
>>>>>> +#include <linux/module.h>
>>>>>> +#include <linux/of.h>
>>>>>> +#include <linux/platform_device.h>
>>>>>> +#include <linux/regmap.h>
>>>>>> +
>>>>>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
>>>>>> +
>>>>>> +#include "clk-branch.h"
>>>>>> +#include "clk-regmap.h"
>>>>>> +#include "common.h"
>>>>>> +
>>>>>> +enum {
>>>>>> +	DT_BI_TCXO_PAD,
>>>>>> +};
>>>>>> +
>>>>>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
>>>>>> +	.halt_reg = 0x0,
>>>>>
>>>>> These regs certainly aren't at +0x0 to what we normally expect to
>>>>> be the start of the TCSR node
>>>>
>>>> They are if we add the TCSR node with reg range starting at 0x1fbf000.
>>>
>>> "if we take the wrong base, the wrong offset is right" ;)
>>>
>>> The docs for Eliza don't have the nice separation like on e.g. Hamoa,
>>> but 0x01fc0000 is what we generally agreed upon to be "tcsr".
>>>
>>> The registers that first appear in that region are the same as on Hamoa,
>>> and so is the address, so let's continue that tradition
> 
> Actually, the 0x1fbf000 is the right base address.

Actually, I think it's 0x1fb_2000 ;)

> TCSR mutex starts at 0x1f40000, and everything between 0x1fb2000 and 0xfbf000
> doesn't really look like they belong in a clock controller.

Correct, and that's because TCSR is not a clock controller.

Konrad

