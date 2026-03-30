Return-Path: <linux-arm-msm+bounces-100653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EK0CwH+yWk34AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:37:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C619E355516
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E352300363A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9ED33CE92;
	Mon, 30 Mar 2026 04:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3AIVOda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRbc0f1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384B346E58
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845436; cv=none; b=mxIykOUP8gVNygFm0RGdtw+BtbDRFM1667O7ERn5k2RKcu8n0wOGBkDnpEjPaVgplCCsZICkD4zmlGWzZNIM7yThwoldyLUkUwl970Zq/ooB/JCfpm6Ub+umNmofgGNxG/TdDf6VsLLYj/Fo64W6ZS6CLiftdXo8ugnoHdDh6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845436; c=relaxed/simple;
	bh=90yErfVO6uSG78hgvOjh/eyWULbsrl9lJHh5q629Vkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpG/P7h3C82oQ2p0Y5X5Sc5kkpc/lUy0kWQRP00CVNI2CGVw0VXmD8ZFP0IW31lCghEXOr4XHOjrGsW3+98ierNGkLjlGizt2bVL0ep7ttyb7zrF6TxLSY1b4zlFRaYpbt4LPqQjtaRm9CK2z7q1OFdpJorZ8sXgIz2t3XLEQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3AIVOda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRbc0f1g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4JwVv3933557
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=; b=l3AIVOdaeuqvAbrn
	jmOETSQtw3pc7zEzrUjosRdYNE54eGeczZ/dLO48795/ALofesO/z2bIdBQ3Inio
	FVJ/CYnmrqaH25gIOo4n+KoT3jAYFMeTWhUvstHJDi7O/nH6myjN0faCfGfBebvP
	aEjODpG1eWOIwok/s/YmH/Ve3HNM9HoloEtxxyC+2feikcxjG3xBbUWWZOko/a+X
	PTRiQyLlzIyIh9FDYFZ9gUAxM/cpjTA2kBizrvPuiuODBQ9V9lQG85onPjUcAZyF
	kjGf2Q4UpWXBKvlL1qFNZI17I5Qoy8424cS5c+fbXWgPO+XIYZwX5WfJdFO+TpjB
	viei0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdcqx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:37:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso521222a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 21:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845433; x=1775450233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=;
        b=XRbc0f1gm56r9x6JGOIn7ICXIvoAd33IJpzC0+BaZB+2dsrhARiZANOWFI6KRwAu7K
         Nw9UhUxO+OPVVbA/8Ptik0rFHdP3J69X2LLc7gDUOAMw+agLAzfQzJ4ic3epNSf0UG4g
         wtPwokarc6zHKdmBEY/NhE/U8x58Bd++IvprPFWy0jRBFrcdB81+r8UZENPCBawBMp5r
         ZyloxNySq+iTQgfg58ghIBxW/U6t96B0I24WNioHAYiybFhU8sT38FmUBwTV6lMgjMNN
         kLDTjZq6JeeKN8Oa2IRAxgtLZzgMQu6rkMJE+kWHx87T2c5+QvkBLY371lkD94Em9Qn6
         1MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845433; x=1775450233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=;
        b=Kk3uOYG1AveRYEd5Z/pe8w0HbE8+uKWzBUaHlSBU+0eggl6ugr+TtrNAib+VJb2Aem
         zlLoA/5Coq9yFK3gBdZM/lA0AAyWHPd9od0HWxOyG+C5LM4pNtGh7ILPDyyUOPehka2x
         mOrCDIfEqSwueBYAVyFtjaqvf03u5gaCk9OC6yv5C/pnl3S2ypwP+daKWAxxgpn2hlS0
         6yHE2zWQdJcwpb6SX5CbZ/WlA9HJtD8yMVn1QdMOjJzsricx66ZeoPsTzgiAL7xuZnPi
         WIBQdjdhjzQ6bUO00J2f9FpC7jEJo91gjMEZHAmH23MrdxqRgdsJfg8ha0oB6osDLZ3n
         s3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX8JqHcclNA6oCac5qNuVuTcqJ2lJWcRf4mTsrZDzuW0T9zAB9aGoCXLibKn33FwB+Gf1FPHw+p8WOMFEaW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1MYoRyBmsxajUmp6s0ZhhmgjXclVfY8bSpCvQssyV6OSMayIo
	eRhnG3bNLLewCbi70f7FhWHWCIHdcdQOmjov2WWg7nrsWHAYPrZdkzT0kkyhmdXsaLEmh1fOz0g
	eqRvlskSCHOVBp9m8V7GIhLwmvv2ZJ8KPNSbZqgO7ad8INv4+voepqmySjYGS5cWDmxzv
X-Gm-Gg: ATEYQzxiGh4MNS6Vfo8cZksfxQiOCdT+GJ9HvkDMkXTRqL1QUYBIJlfuKLAxU3/a9P6
	Av736OVsrAj+7IsV+7RCz03fneSjba8g5v3uQqjZZIh++g6WEz3InPhko/qh0xmbQaLs7SsHm3q
	NucXFktQMLnJ8uK8ivH2gjx+lqt40BhGUqRkUkUYgmxVkpCufiBSxYg1uBbVeew2f1tQYUH/B5o
	O6VACvqHrhTII+x70wy/5f87AGFMPWmR29rVF1BTNiqsf/6t9Nw6q+3V9js2cEYHoINhxEFK+qq
	7/y8p+V620PAZba5HTuIKxcVV5luzWF+aYwcZ3h3lSB9jzibw5VfXGC/u6HYoPc7OtY8q/oPA1L
	cbBedtdXJlpkiQvK40vJ4poX5yrYgWvZbqfS4po9JoyXHvec=
X-Received: by 2002:a17:903:22d2:b0:2ae:fc60:2650 with SMTP id d9443c01a7336-2b0cdcef360mr115992485ad.39.1774845433477;
        Sun, 29 Mar 2026 21:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2ae:fc60:2650 with SMTP id d9443c01a7336-2b0cdcef360mr115992265ad.39.1774845433016;
        Sun, 29 Mar 2026 21:37:13 -0700 (PDT)
Received: from [10.64.23.4] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm78132115ad.19.2026.03.29.21.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:37:12 -0700 (PDT)
Message-ID: <ad81de07-c65f-4571-a309-a58e8ca57acb@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:36:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
 <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
In-Reply-To: <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fx7iZCHj7EUBm1rWZeclvRjk4RrL9OEM
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c9fdfa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lJRIEu0nk555g-v5qOYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Fx7iZCHj7EUBm1rWZeclvRjk4RrL9OEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfX859gavMwpjxt
 8BhQHZS8ro8Z5KL6coHLiBTkDn1o1ngJ4BoAQXXcRb9PTA1U5MNVNIpA8nSkLwosv1iCWxlCozF
 ZWUYQ846LDb4MgzEytxewdylad/wjJ5p1hMyx1r/0FYxB+TSuUmyOm6YlJCxnJ8ujXqUik36NLT
 GpS576//JKWmloYH+SREuzBt4wgyNrFMReYha2eIOGj5UXKALlKV4cOOC6EmpXfWeaq6OAOAw4I
 b9OR3Iky3mM00TR7yUl/3eBLA2n0KfRC1CMAnN+msJqQjvvekUkvJgJArFByKhh+8NUrhYLpvin
 /7chqYw1u64/hrJDIvBB1cwtZjieFNqZ7YBzlJEOPZSQsHe3GIqWa5TUoV4rFkqEjlBA6+QU9Gh
 FPJOaebPnBtUq306GBBp0kk+eIsP45laX3xBh4rkDDWJOMqQgQz5YzDCLJU+O31nzIm2EwA51zN
 sRdxxO4H+5oVE1W0Gbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100653-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[canfeng.zhuang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C619E355516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


在 2026/3/29 19:08, Dmitry Baryshkov 写道:
> On Fri, Mar 27, 2026 at 04:31:01PM +0800, Canfeng Zhuang wrote:
>> The monaco-evk mezzanine connector supports a robot expansion board that
>> requires UART6, which is currently disabled. This prevents the expansion
>> board from exchanging data and control commands.
>>
>> Enable UART6 and assign the serial2 alias to provide stable device
>> enumeration for the expansion board.
>>
>> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> index 565418b86b2a..0b26861eac02 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> @@ -21,6 +21,7 @@ aliases {
>>  		ethernet0 = &ethernet0;
>>  		i2c1 = &i2c1;
>>  		serial0 = &uart7;
>> +		serial2 = &uart6;
> 
> What happened to serial1?
> 
>>  	};
>>  
>>  	chosen {
> 

serial1 is used for Bluetooth.

Bluetooth support has not been merged yet because it depends on the ongoing 
M.2 solution. Once the M.2 solution is finalized and merged, the 
Bluetooth-related DTS will be updated accordingly.

The relevant M.2 work is tracked here:
https://lore.kernel.org/all/20260317-pci-m2-e-v6-9-9c898f108d3d@oss.qualcomm.com/

The initial Bluetooth DTS work can be found here:
https://lore.kernel.org/all/20251113130519.2647081-1-wei.deng@oss.qualcomm.com/

Canfeng

