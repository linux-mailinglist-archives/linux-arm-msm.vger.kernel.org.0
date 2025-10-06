Return-Path: <linux-arm-msm+bounces-76056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA7BBDF5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 14:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B1C3BE96D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 12:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E29C27A12B;
	Mon,  6 Oct 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5+5RvO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FE27A103
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759752398; cv=none; b=OuwPjwzGxbAcUkEm4NQcIHFQfRvC5Z1aHeMq/t3SCKCvbBEDDkzO7MFAQMMJgzjdgjtDJIuSDbBa1mBz5qkhlbzeCt3HRKZKQGg/KqivBUQjSxEVbV5lW73r2FovAB8GB4xQ4j4siD809W9Y1x8eX89XJdy4+yip62hnoDkEXAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759752398; c=relaxed/simple;
	bh=HLxEdvzR/XmxUl/mla4qo4fEhWeRdHcVAsmMcuzaVAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bP2tQuieuZZYRwmJSj0CDz3k6IefFU5DTG74rXJGusByF+HRc24NiOtwJUm3EaBkI1HJw50irke2Yhw5bdqS3mezZFJklMdWSACvGg2eiWU8OAUzEVPv7yAM4V+8bx6BrS2O3uyKsOrFE+gShFeb+EVzFUg92/me0DbCyOQCcTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5+5RvO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5962nxt2004468
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 12:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLxEdvzR/XmxUl/mla4qo4fEhWeRdHcVAsmMcuzaVAE=; b=J5+5RvO9h6kgmyJq
	3s4aN+jSgg7ZlgIi39SDGq/U8iWM99LpVnT6S6sRBhLTewpejXsIAnSyOMqk9Qf1
	NilNGFPs/FRLZNUHq+pCPse4wR8eEQqJtYyYEcdZ7lB4/s/ZCokSXUHWZsjZIM7w
	q1YBM4taYNT5aAn6YS248KlL+n9gAfNl64iQ8s5Js+e1ssgzBWRplkIBK+0/luNn
	PMAliVQzD349+IOaXSlCt27FCUYfinhylaMjZVQcWlgpawTrGAa8BcBMo2OlF+wI
	6UrF7eUgGVj76U6Vm8VlrdQ00B/VZVW+wUP4GMjOhX+D2JQb3J5W36L056uZ4SLW
	USF6Dw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ju5xbryr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 12:06:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dd3c89ad67so3741451cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 05:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752395; x=1760357195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLxEdvzR/XmxUl/mla4qo4fEhWeRdHcVAsmMcuzaVAE=;
        b=JYpx6qMlNR5nWNEblCo9rWPj1B6MozCmiBv+sTp79gaCE/9BqaM0WrdTcMPvnF5q8y
         WvRERHmd0p664dOVxxd3kgGhFIY0f29mWVUeCFqj/ApD6sX+Bk6SsKlxpuFxn4m+HnDX
         LeGD5hGhrD8s9cyczb9fQ8HsHvlztBS3NdVyv7MA4WcM/lzPbKRCO5JOCY9/R8h0+SL9
         iya90rG44Fz3Eq9BNOQQ+82bC65We6/jQA4Doh038ZaNPM/yGPIiLpsYlt1zbFw+oTHG
         Q/UnglqGAj5xx0MdThUoh2zpEMv6vtfsC+OIvik7h2Wp5/4ruuwd19UpJ79vJIqWht0U
         krNA==
X-Forwarded-Encrypted: i=1; AJvYcCU578X3eoAzoFdsMUlZBEkvTQzpqZcLa7izvQFmu2lWeIIWDRTpJQD/P41RhWGLHWEY1Kx8e1KqCfYC+YEF@vger.kernel.org
X-Gm-Message-State: AOJu0YwxR9qrNfSdZ/GOsFf+7e100Q8bUc4u+zStWqHLrLXxP2NrHfel
	nyOPBeIiBoyfmnmDShg0p9EICqrExdwFZHqR0z/gMUtIaRcrgFalPoA5NAZ0t/13+M9DRKl+0t3
	rJaZxcLMFra7DTmdI4pEen53l9Ez6yseQeRKNeHttTMPQe32Rg5xs2w0w0PAOZRxXVdSF
X-Gm-Gg: ASbGncsb99S9w4cMF6J+9KlZSkaVxzAF/8r4ABX61TjKsWYFA+eTyF6tJhCw4UKsHBi
	FzvgnDYeb+p7X0MqowLnQ7epKcvWRWwpFNSYOHxnRaGeefyBnc2VmxTJ0r896yY21Yk2ZHX6rHD
	L2zgf0/Y+KbLEuOS1gPnHvHSvUZlNy8i4UgDsfneLoH4g0/pikdAgnFcGmke7j4vt0L5CHKaNVd
	JsnpQ0BNRUeYhrTw5C52+bbQgyt5wNYBN3Cf7mVI/LQcRhiXZ5SNydG1zvtFoc1JYTYT/lRXyff
	rsXSekkfP8j+buQiJsLj1tXrieuUn0+Cr8T+n4+lNPrJj39kDLyOJiYqBBJOreb4WoCAeoyqzha
	HqwfgGnSky160ccMnYjFQC5ssi08=
X-Received: by 2002:ac8:7f41:0:b0:4d7:6c8a:4792 with SMTP id d75a77b69052e-4e57695639emr101645481cf.0.1759752394846;
        Mon, 06 Oct 2025 05:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL5Iaw44FNavlmz+iujGEn4Rtr8EjnBdm2ElAhoWxAuwKxOPHJ8yJ2UwPQnRwz4KKHIwtvMQ==
X-Received: by 2002:ac8:7f41:0:b0:4d7:6c8a:4792 with SMTP id d75a77b69052e-4e57695639emr101645031cf.0.1759752394248;
        Mon, 06 Oct 2025 05:06:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b6927sm10231021a12.14.2025.10.06.05.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:06:33 -0700 (PDT)
Message-ID: <2ce295a2-586c-4fb7-ad10-3c7734e1f590@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/9] Add PWM support for IPQ chipsets
To: George Moussalem <george.moussalem@outlook.com>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-pwm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Baruch Siach <baruch.siach@siklu.com>,
        Baruch Siach <baruch@tkos.co.il>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Devi Priya <quic_devipriy@quicinc.com>
References: <20251001-ipq-pwm-v16-0-300f237e0e68@outlook.com>
 <175936202881.2426650.1624694657690403545.robh@kernel.org>
 <DS7PR19MB8883CF5D3DA8ED32B6A919449DE4A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883CF5D3DA8ED32B6A919449DE4A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FooIPmrq c=1 sm=1 tr=0 ts=68e3b0cb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=2C6YHBdLAAAA:8
 a=v4cj00jlyj8MMA1A80cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=yxGMNg53M24zlVSZdvMH:22
X-Proofpoint-ORIG-GUID: 4jBw2R3IbmzXx7MK6s2xvfAgT1p3EIuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX9NR1FvKktIAh
 Y+7aEr9XZY/Mre/nkYA++CDR3pCKPygQ8jgpHUEKZoAPAdDnuAhkdN+X83d7aAn819ZMbn/2Y2J
 9NgUFjoeNDhr9msoXW/h0G7TIYMxyRGhlWlTdfDBTXR4H1Y6O07PFOUh9jCCNxZ0gL5y7hCM6Tw
 A0FiD9JSPmdJioFGaqD6DBupy6vFBcoHHddnK2huNO/tLPY/1S16JW43q7jY5fNZYoz0ML7iDRm
 LAREyhDH/15GVLXLrmLkiuay2ccywn8/xtIny5T8iUyAuBdQqeMvQzJzhyeYNsnfLyMadLi3bhq
 xx+StJfP1CVSIuWCOVArTL7l+OA4odgQkhbN1a/Mu+aOZZML9WU/Qsht0eaBnYwYwFcdcaKpv2u
 hCS96/E9W1V5gf0NVgTusSvSUeApQQ==
X-Proofpoint-GUID: 4jBw2R3IbmzXx7MK6s2xvfAgT1p3EIuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040022

On 10/3/25 9:06 AM, George Moussalem wrote:
> yeah, my bad. c/p error as I moved it out from the TCSR node.
> Ran dt_binding_check on the yaml, did dtbs_check on ipq5018 so missed it
> for ipq6018. Will be fixed in next version. Waiting for feedback on the
> driver (Uwe's?) and on the dt bindings (Krzysztof's?) for adding
> additional compatibles. Will then send out the next version..

Please see Greg's note on top-posting:

https://lore.kernel.org/all/20170823231800.GE5193@kroah.com/

Konrad

