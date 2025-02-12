Return-Path: <linux-arm-msm+bounces-47676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90123A31B80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09DE218872EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890251CAAC;
	Wed, 12 Feb 2025 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFwpuzgv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24DF1CA9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 01:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739324985; cv=none; b=l4ztk201kp38ztWuHJ53tNwxVlqklvHA8P+NLUHxanfDuK3PbWoQ1ObjHZzQsYUhrOZsRIv3ixgPSoTIWsrXVGQFwvPlPju74tCnzx4pywcTTFap8F0V15P/7VJgmJ9HwObT6m7ZbLYWs4DGJlDXdYMNVuDNTWRXYV80ND3UAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739324985; c=relaxed/simple;
	bh=jKdBskxCNyO7PTxTjdXd5yL5yFqdvDrkjdAV/6I7Coc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQ9nbjeL6ceuLMvHZSEnpt722wP2ryejb7aD3dpmjDlJ2eWoVLeRTTbFEpt1+pU9YFUHfkmfuktVIqOtOAlSaGGYVvvvSWrkHcuvaBR58XggPVs8X9ZAJahYwtt9vIcPhnR1elt3DW/6noRd1/zou2jUcmUOKlqbA7d3ZeV3Aeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFwpuzgv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BM8wpF025783
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 01:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ernzMNDLjj8b3bFJtNA9v1qW4sjL/McdGQY0gLbAJs=; b=aFwpuzgv+gAHoSsY
	YmaGQgYy3TkhlwWgkPDFu4vmR/vzG9L/Uwfb20pvv3Lje1oSc4uFaOLXqWe0mADf
	ATIPNk0hWyS/FhgYdYQFmCsNcEIQQMzCm5IdyHqUbqv37wpRZyDjMRsRgjTOZQN0
	EvDna+3pOkVv1n2lgre6ZPCirB18DmFZn/gYDPtx7nCzr3cjEHHMGYUJUV4blzPX
	Anvn+8qfYQwAu8l4RwoPuB29SdGENzbdoSb9HgMxxzU8PF3L1T/GnGOP26srJ/Ng
	uXP96vFSLAClIlBWMaWmJSE/VpAuiCi3m0DFfA2YSAXBoMVtQQ3SYXdthhrlRjQZ
	63IqJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5a4r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 01:49:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa480350a5so7258592a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 17:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739324981; x=1739929781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ernzMNDLjj8b3bFJtNA9v1qW4sjL/McdGQY0gLbAJs=;
        b=LO+9AoOJi3yU+9W77wGdr8xCHoNCsPY+SHKYp2jawb2lmmlzBNMVtvBU31szZ/WCFU
         BR/EcxtFcW4EHppyI2wrS1ui9tnIV68zSE5I5EwdShdxUajRUV4Ru97UbVRM0nDlPqEq
         Hp9VqEnD2lJ+RCCLDpiRFcH7ErXBz+ODsr31I5NCthr190pFL3fLgX24m1qpzqXrhq2h
         JrDL6AJ51JbYWmJOCRjcBGTO+2G+ku3vFGZQ705AlXDC/DoG3g3090HCN75kkQ3iPyFY
         s1Xw/Unwq3r7Lc52oLSos2bS6mzj3ZVHGue/QtnegfyKLxujG3NIy3/jzb97mb1mt6PQ
         Bkkg==
X-Forwarded-Encrypted: i=1; AJvYcCUHGj/aoF6cFQlLVy+OOEvoUbUo1kie1Ngi9I+dbzIc0NsNCoGlDHkmrENomEZQu63NClunrOMpom0zgsV1@vger.kernel.org
X-Gm-Message-State: AOJu0YycKVMFFuPH678cNrm7ECJf56svRnFiBHOHD3ZIrOwBt8FD/U8e
	/rYv7fb83Cwj21F/eP8rqgxTMAjtHrcwM9+63rYk2ZJga610nlhqwB0RMJGFC5cmsjw+O+G3mum
	YtfAGHgqPmfHlO0BZ89MOOWDlGDKDs2IBUgHzK1r5ceWZR4A5HVmkQMZlBfhBj1Zc
X-Gm-Gg: ASbGncv0aTv/2neT4F/NIOnMBxH1muDq86P8OxOPx9yGan3xvTxkPwn85VdOgONvlUR
	Amta6kmytYWQSh5SP3i70OpNGN3trt9yDxwMCUeFhZEMJnQyMaReP+eqlL8tGVyRmmUIfIRh1s+
	sjF664xnL8aDAexcD2PHxsGm6GwzqRp/25jSU78bCwZDwDMew+ODp4Umu9xNnvsE6MQXxkyBO7C
	ENzeYuaui9+1BCUkpKii8ZEmTqhWj8aEoGZRdUVAsQhB0NVSjTVA/hbv8mmnaMH8bfLIMCaKO0h
	D+pQLIWRr/4lv/sdG9KieJghxYsm/LQCTcDPpK0VctyK3qYUeEd5bD4jMoK4jHmp
X-Received: by 2002:a05:6a00:804:b0:730:a40f:e6e6 with SMTP id d2e1a72fcca58-7322c433cb2mr2618072b3a.21.1739324981167;
        Tue, 11 Feb 2025 17:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE160hzgm0HU6EAVquv0vcTFwKk5qvMJvB1r2RCx7aFz3/skmu+cRH97oEl4xHY2B63zlm/8g==
X-Received: by 2002:a05:6a00:804:b0:730:a40f:e6e6 with SMTP id d2e1a72fcca58-7322c433cb2mr2618017b3a.21.1739324980772;
        Tue, 11 Feb 2025 17:49:40 -0800 (PST)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7321b34c003sm2125039b3a.52.2025.02.11.17.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 17:49:40 -0800 (PST)
Message-ID: <c2e90647-1e07-4124-a001-1f71f39a362f@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 09:49:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, srinivas.kandagatla@linaro.org,
        bartosz.golaszewski@linaro.org, john@phrozen.org
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-3-453ea18d3271@quicinc.com>
 <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>
 <d0b608ef-bb22-43d5-b9fc-6739964e1bd5@lunn.ch>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d0b608ef-bb22-43d5-b9fc-6739964e1bd5@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Bsgwaxp957TymRm36WuPCVfLXwAFXJC
X-Proofpoint-GUID: -Bsgwaxp957TymRm36WuPCVfLXwAFXJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=622 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120013



On 2/11/2025 9:04 PM, Andrew Lunn wrote:
>>> +#ifndef __PPE_H__
>>> +#define __PPE_H__
>>> +
>>> +#include <linux/compiler.h>
>>> +#include <linux/interconnect.h>
>>> +
>>> +struct device;
>> #include <linux/device.h> ?
>>
>>> +struct regmap;
>> Same with previous one, include it's header file?
>>
> 
> If the structure is opaque at this level, it is fine to not include
> the header. There is nothing in the header actually needed. By not
> including it, the build it faster. A large part of the kernel build
> time is spent processing headers, so less headers are better.
> 
>       Andrew

Thanks for explanation, that's make sense.

Jie

