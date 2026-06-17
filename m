Return-Path: <linux-arm-msm+bounces-113524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MpaHA3BqMmq1zgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:35:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF99697FB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:35:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ftQQj5X/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iAF7d7VP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113524-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113524-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4694A305046A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC613C8713;
	Wed, 17 Jun 2026 09:30:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605EB3CB8EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:30:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688646; cv=none; b=BXj3xiOlq088TdAzEpWMq47FbaQEs55v1fI10k13dHHAQ/8UCcagKaltbJZXCB1zAc7foRc17SwwWvdW5UKxxSI3QM2+7983+TaTiyqQp6b75L7L7vCOx9VmCQM0CJzqDroZoJxoJ2RYdYl7/bOkK78AqtWu9U6v7XUp4RInip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688646; c=relaxed/simple;
	bh=h7NqFiL/vZAhxbDLER2nG3vWh/Se87PBLNeoY6zZN2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9Ue3/Br0GRttD8JSEeplq5NCwSJEPGJxEY3RWacDE0oqCAC+dPdQeDfJLuiajmyWp0WFvJfkllgIGn5SvKYR4lzJJgyUbrCYtitIH5/FzMloerlgu5hV97iKQOVx9fV5KwQcro1rGjG3YotQk30tKv7Zl2DFrlKQkO2H/EbOws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftQQj5X/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAF7d7VP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UfN31654405
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mbELSQCe+eLHzp84jgggoNFJ8/wasOftbLaK7oSIbpM=; b=ftQQj5X/9G9fSF45
	Yq/2s+3OHwxxSyMTC1LXYst8SBO7fq8lJdpwgdpVGK2MXeaJTahnMhHQpZwmO6nT
	qTC/RYWUxSFUiyCUgMLgaR9V1j11SZLi240Q9+bq765ifD1rCkPHh6Rp4Pbh0+hv
	4/E6Sw1OEG9zdsNs5rdZWy+NZG3Q3BrB1Q4XoWVlRCz7BvivY12XYVL6q+m0zHOl
	0VD4Inru3NRMX6h+8l3pUaWIuXWp1sUYZmT3lq5F8CMZwSgXW3THbB50DVP2tYK8
	xKDTdjYNSPvVTuYZWxDGcK/L3KuWx4n/lXK/dPSm/CzFZlKNJWL8/gGtIhtSAXSq
	vCti5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2cmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:30:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ccc2d4d2so118256085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781688644; x=1782293444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbELSQCe+eLHzp84jgggoNFJ8/wasOftbLaK7oSIbpM=;
        b=iAF7d7VPmvhjK0d6a1CbsFO73FkUp4x4UyCWcn79vfr3iihwS2V+yIGbK1mQkB+Kd8
         ONDEqXbnB3jfAFLA072PhQ4PDUoeFq+4NMaGsPbZx93tdJxgQmk8WM0epdv/Dsc6TotJ
         OCCQamtPIPXufCg+ur9CXqfLBTIxCBW4SvbZnSCrDaOEOR/iK1aFQNbOSGOCYJavD38Q
         dA4fcy2RVKG8FKqio0AgwYT8xKFA1ZiN5CV/G5S9w0qlcmD8IYpADKqVdB0lwGqZXQFd
         vMD8COzRBFUUsebms4OwXr0d1G9um+gXwYzxbhnehl+MsUKqLyBUSfLaA9E243P0Nis5
         Lumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688644; x=1782293444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbELSQCe+eLHzp84jgggoNFJ8/wasOftbLaK7oSIbpM=;
        b=jLAmQQcxkH+stzGhSPp+r8DFXIbVWLovZF+fKJRPjSlwc1bo6eWSclx5lkliMloBf3
         U4kFke2s9teHNdh2B6LOg2yi/wBzCClPp3WXxHaIfxWzo/5Roe+gwswmBiUEoGYyEbK/
         m3cJoPjzTFiutfdrAI7Z+pz1+qcY3Yv2eRFU/zuBdxheZdncZZ2nTilA8VuKl8PvKMXQ
         HX3gaUGsQoVdGiI04shNk5toyF87Kxb00KgTx8U9nLU5hqo2i0lJ8TOz5Mu9P/Mew+Xr
         nhJg1w5udwO2eCwgoV20CFcDjPDo/s6ntSBA5eE/XSy7d999GHzw+FH8hL+CQZDlj1lz
         +Wcw==
X-Forwarded-Encrypted: i=1; AFNElJ96hCqMOWmDskJr5Yu/DpdFUFcW9HfF1jt8cOwRBSp9l6KaMezhoUQOMjkhe+WP3MEKDkj3CeT6ZWVwMWN6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7XiQxpYwp6YLLCVHRo+icyChn22WYikTrZm4tA7ELTZicAam
	YXGER+noaPvfH9iVWoYxPO68wND/+Tb5Ma8ZefU3ZUUBNm6zrr7Tf8mfxU/vyKUOooRORoi95ya
	Ch4EVs+rp5sIG8kLOWmRRCc/aOZMqcFfh4DdxpWI63+Nkhs7FsJjPITYF/DHYXbdf/gcO
X-Gm-Gg: Acq92OGQ+SH/PWlCJW2YJhg9Uy4YcD2FVoMuCgGu16Dxd19rLUZXqVeWhM1mKiD9C+q
	7qUOoYI1ITDwtMG28tjkOCnTelyubVfAK3l51xP7XkWuTAVO9/8VhMe9AJd0hBepjvc2Sny2n3P
	yhuW/0vdetVYgQF5wO+YL1fjtuFYTJ14CssDp5Pf9yaMZjxZ8zDJclmnjekMYm9MOoAbrBG2ijU
	d8bBkOdCcUVn1NkuBTyJcRHuZTbv/AlQnKKQ1OUMMmeDcyZQADfKbi1+CddiPutot6x1LQQ6H5S
	dmybupNoK/ec2nuhxfsAGwjiBox8nDecUZev7F2TXneVc/LZRZKjiwJCUALvmfU7vpjPRxIfWEq
	8fmloKivZE/Js7megDDUuBAP6FXX2cH1ANFU=
X-Received: by 2002:a05:620a:438b:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91d8acdc8f3mr299014785a.4.1781688643509;
        Wed, 17 Jun 2026 02:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91d8acdc8f3mr299012085a.4.1781688643022;
        Wed, 17 Jun 2026 02:30:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22136sm788125566b.15.2026.06.17.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:30:42 -0700 (PDT)
Message-ID: <29806448-0588-4590-8540-a689ccf1e7b0@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:30:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
 <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ggHGXX_jQNAMjTk7tHaYU2satubKvx9r
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a326944 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IsPFB7xf8fGKp3IZfZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ggHGXX_jQNAMjTk7tHaYU2satubKvx9r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX3mKqnyohR3Nm
 Xh2bjyguATFw91bu93BXgxIa+rtHkXOjUVRn42sAJXOeV13M6vEWi3ovzqFZygqzqneg78zsrdC
 nk2jzvX+RXBWT/PD5vJcpcE1D4k3MZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX1SFwgIDiofvl
 2Pa2pa27i3FodaohhZTwpR7h8pnZK0LbxC6zZqBaMxyda/fwFMrdcSALgB/VsSjxwiiJJX5jloJ
 ltyptPx3pDQEnWlAW2Vu7DNj5O/IHxvNqPcCEjhHWZhGW5WQHtqGEr3IEfH0SkOE+3Z+E+cE6wP
 QNClCvTDp6K9V6lCNf4XfxELZ9VAulLrix7S4xjGLig9PuEPqXMBL3HzgAgnM74FMM0LUoI513c
 m3Ymp2TKlf5DI1Py+AUGIxQVYayu/7TdWKBKNJjFX8Bc5a8fvk7mcrm05iC/PaZscxX3XWfpN54
 nrj8yFXSRzWqoj1KsxCwUjmeKZHpAXiaFG/466vX9xP8PnUInS8AEETc/3q/tKHW8SXhJDVok2a
 Zc/zUchlLkLL5Czw5mtfus8K0g7luqs0NOTGeNFcBNrGvAHkE1UhyE9bah9sCPZbBtvO28ibuIb
 RbLGHj/XXkIEbU++HHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113524-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AF99697FB2

On 6/17/26 4:31 AM, Fenglin Wu wrote:
>>> +        ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    for (; i < len; i++) {
>>> +        ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>> So if i'm reading this right, the first loop will always write
>> 4*(len//4) bytes and the second one will be entered at most once,
>> to write len rem 4 bytes.. should this be an if instead?
> 
> I should put a comment for clarification. Here’s some background: FIFO data writing supports both 4-byte bulk writes using registers [HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes using the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is more efficient, especially for waveform which has several Kb data, and it helps to reduce software latency when loading effects and reduce the delay in triggering vibration. It also helps prevent the FIFO from running dry during data refill in FIFO-empty interrupts. Typically, we use 4-byte writes for the initial 4-byte aligned data, and 1-byte writes for any trailing remainder.
> 
> So it still needs a 'for' loop here since the remainder could be more than 1 byte.

Right, I mentioned len rem 4 but failed to notice it's a
single-byte write.. anyway, a comment here would be good

> 
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Configure the hardware FIFO memory boundary.
>>> + * FIFO occupies addresses [0, fifo_len).
>>> + */
>>> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
>>> +{
>>> +    u32 fifo_len, fifo_units;
>>> +
>>> +    /* Config all memory space for FIFO usage for now */
>> What's the not-"for now" endgame for this?
> 
> The hardware supports more modes than the two currently supported in the driver. One of these, called 'PAT_MEM' mode, also shares memory space with FIFO mode. However, 'PAT_MEM' requires memory to be pre-reserved and waveform data to be pre-loaded. The entire 8K bytes of memory can be divided into partitions, and it is configurable, with FIFO mode always using the first partition [0, fifo_len], where 'fifo_len' is set via the 'MMAP_FIFO_REG' register. 'PAT_MEM' mode plays waveform using data preloaded in a memory bank defined by the registers 'PATX_MEM_START_ADDR_REG' and 'PATTERN_SPMI_PATX_LEN_REG' (they are not defined in the driver). Since PAT_MEM is mainly intended for hardware-triggered vibrations, such as a signal from a dedicated GPIO triggering a short vibration with a preloaded waveform, and although it also supports software triggers, I haven't found a suitable way to support it well into the driver under input FF framework yet. So, I am currently allocating the
> entire 8K FIFO memory for FIFO mode only. We can adjust this later if we find a better way to incorporate 'PAT_MEM' mode into the driver.

Sounds like a plan.

For the other mode, would that GPIO trigger need any OS intervention?
Could you speak a bit more about how that works?

Konrad

