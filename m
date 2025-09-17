Return-Path: <linux-arm-msm+bounces-73905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2AB7DA32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131DE1894720
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 11:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAFA2EAB89;
	Wed, 17 Sep 2025 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2+PVpD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970902DAFA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107674; cv=none; b=kNdYtJES2msaJngl2Ttd6PpieR7G8ejpzH5RH78yOAaNhnb+RK77nknOmPKBK52j32HPvzmeG2FHyQqnhsC1exQxaYM7KAam5VA/W7BLJGQG9OL2yeV4T8L7TQMF0zVYj1T9lC+adCHEnn7OvmkBsWktPpKePWebkhJQV0NdDVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107674; c=relaxed/simple;
	bh=gr9F60Me7a60bNWj3SiJcwOQULQ8APfwa1823sZVpIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuMgZPJ3mloB3p00eQE2sjgzNLVcHpf6FNnBh/Vyq7HUHT2bmX6U6XIlzjXZFnkzilb/98ZEeE5oy2kBimB8bzjxQdO7F4fprf3IdMcyWAHhoqgqqbq3jekz+LlkQJ8AhQlJ/V1TT91SlXQNva/Zk332GC5L749wIOYROo9uLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2+PVpD+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XwOC030761
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 11:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SjIVIub8Wket+d8VfqHLW16P1fmhDt81FIBdsCC9eCk=; b=m2+PVpD+JX68xdNA
	e6xGaMzZ2V9W8QeokHqxPURe4dJtCFtGFHq+OxOmaPE4rRv1UxUwfKFmYx/A7XiQ
	cvcPvOILvHD/y1NpaWwONYtYw1bEObfadFOhPRLB0iq4eyFVmx4PYk7ONHW1uHXP
	iIdjyKxmkhqBYTpMoZNFFQwhkaAEW8SnyRrL0x/jxWEKvUl46MBd9LskkdSZbuj8
	5ro/SMmh9Rcrr+GQGChDUbLYQVvsM+U1ImXl1yrubRtPlJNHQOak0cZW3nENXU49
	xISItLnkeQzXKnixLD9usp5TqPO22lsZBIk6swlTbQjefYxhivU/nHBHI1k0zlMA
	AIL1Eg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxj3kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 11:14:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b79d4154c9so13872571cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 04:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758107671; x=1758712471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjIVIub8Wket+d8VfqHLW16P1fmhDt81FIBdsCC9eCk=;
        b=M7FFLvukTeiTUXu/CKfnqVGN+bNeFIp6vBeHbzvCphuvTl9L7bzR1RpagEJAGKEL2z
         doKEqmLX0yXdsPign4Nx/+EkvHZet9oxdJhYoKYnk9iaL4kpWBt2ZBIaHs0oA4I4Cpl4
         AYsav6Q0M4DiWCxi1HBgC0CcOFQaeKLcMkw555ZR62FOr2y9zmGjJFuRLs7FR02j2FiR
         5eo4CcvwzogxCbiTTLRgLou8DScAy55MuXr3++Yj0R2jnmAf2xRRHr/WPK1B5gtTcZkz
         YpOtwLztXbmcCgHRZlUm555MEB3ujZBurL7iF80YZjrM8N6/p1tQ8pcB+IWpQgIJc9vb
         tC5w==
X-Forwarded-Encrypted: i=1; AJvYcCWqWU/O5StAS6EUkpUDr5B/YmmqIkopBP7vqc7+MxQf/RiuC5+CFUFmRdESGiQDP0sMfVwYL7tNHXnVT5Fz@vger.kernel.org
X-Gm-Message-State: AOJu0YwzYsWYX/diufQRHa64g8+1fVfdljfAKjj83u7vAjK5dZoB6sG/
	r09aDiZLqRdjUPP598Yngtue5lDmt9w1Ex0O63enqgxxJqg+RylZrs6Q1OC3t+FKk0CCcysi+wK
	YI05e+LjZbDKHbRsh8RVQxwUNQit5LJaJ1FkN63RnukY8fDsgocpPxI1ry9Pu3gLbHRU2
X-Gm-Gg: ASbGncv792N43S6OUsng438esCZPiL8LtYc0W7rM2n0lYbs37stHK9cT2uLevDZ4vlg
	qgT2Q5ty+yqX/ovygX1hA84/oHYaLOBHaZqOvTd45fwthTzERB81arYlBybcCrzS/68Twmyow3/
	uaDNczoAZzieFCJ+vmFGvDFIftULR83rTt0JCiycpx68wXn2GL/rC9VQCY9Yiom0RShg1ja75KC
	MGjp152BhnMXZMZRodpo9B2oSemNnCieqNEcr8JDTrgCsdF5LCRBye6+85emino91TK/YQJQXSL
	i/gQyo68d2suBpBBVNz1qflreb+ozg4wuiQUp41HsiIyWXEOdMie2UaRFYHMyCBpimVkEhOnlbi
	zJdWaz750zmOhNe5TssSDHw==
X-Received: by 2002:a05:622a:342:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4ba671e5e91mr10613521cf.1.1758107670629;
        Wed, 17 Sep 2025 04:14:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZWiiFXjANyc5iNlBf2sAU8oL2kw0kwLhnJKg6xlVKg4vTUbDuuDVuoJ15JMc/ewmK01gkw==
X-Received: by 2002:a05:622a:342:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4ba671e5e91mr10613251cf.1.1758107670045;
        Wed, 17 Sep 2025 04:14:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b136ee12326sm485898366b.51.2025.09.17.04.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 04:14:29 -0700 (PDT)
Message-ID: <fa258ad4-1efa-4fe8-9636-d70c5ea9c8e1@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 13:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] power: supply: qcom_battmgr: handle charging state
 change notifications
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250917-qcom_battmgr_update-v5-0-270ade9ffe13@oss.qualcomm.com>
 <20250917-qcom_battmgr_update-v5-9-270ade9ffe13@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250917-qcom_battmgr_update-v5-9-270ade9ffe13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX4R9X+2r7k3aG
 SczhcQQ/tsK49T4HLm1MlCKMvcTXS5+dEp6WOcMWZYlkQR+ihe4y+p6kv3E9WTHBM09hs/h48yO
 djyhJbqbwze5zUOGrpwgH0LQp9l2KaiqSmI2Ibrf19kf7pAzDr6E2HNkOwIVXCbE31cv3YpjWbV
 rgqLtGVHcD2qaSIkdnCJ2ijKJhZLqTphETE50YEx03MNKZ55vAwbVJKHP/3YEe34fI2lPBxT0If
 I0+86wPlnblifA+tQQhmMtMYuqYsfAQfATUBCoTfBcN1az7I/x0KEiQ8mAhhtP5o9qO22DUVDM4
 /mw9f3XWFP09y+81A3ReF4tiXHZTr9ZzGDHCIznbvVHD2OrdpG0eFBBkFzuxf4LwOvRXzKXniLH
 D+Qrrusv
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68ca9817 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8
 a=DHQ_eFf6vkL4qwDZSiYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: rxIfPZ7rqbc8EvMKP0rzkcLMgn7vxHiP
X-Proofpoint-GUID: rxIfPZ7rqbc8EvMKP0rzkcLMgn7vxHiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 12:15 PM, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> The X1E80100 battery management firmware sends a notification with
> code 0x83 when the battery charging state changes, such as switching
> between fast charge, taper charge, end of charge, or any other error
> charging states. The same notification code is used with bit[16] set
> if charging stops due to reaching the charge control end threshold.
> Additionally, a 2-bit value is added in bit[18:17] with the same code
> and used to indicate the charging source capability: a value of 2
> represents a strong charger, 1 is a weak charger, and 0 is no charging
> source. The 3-MSB [18:16] in the notification code is not much useful
> for now, hence just ignore them and trigger a power supply change event
> whenever 0x83 notification code is received. This helps to eliminate the
> unknown notification error messages.

Thank you for explaining the technical background.

Please hit enter somewhere in your commit message, this is a very
long paragraph, making it difficult to read.


I believe this maps to:

0 -> POWER_SUPPLY_CHARGE_TYPE_NONE
1 -> POWER_SUPPLY_CHARGE_TYPE_TRICKLE
2 -> POWER_SUPPLY_CHARGE_TYPE_FAST (or _STANDARD, I see battmgr code
reports them both as 2)

However, we already set it to none/trickle/standard(taper) based on
the usual notifications, so I'm not sure if these are more common or
arrive outside the normal state changes - if so, perhaps we can take
them into account as well?

I think it also warrants a:

Reported-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Konrad

