Return-Path: <linux-arm-msm+bounces-41826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FE9EFB60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5DD28BC00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B941B18784A;
	Thu, 12 Dec 2024 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dbbnbrog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3A1632CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029224; cv=none; b=qlsFMJAFWqDmNPITwuIn7ObgGhe+jj7XZqIdneeAo5ExHrz3EmE+TVAmScpJ9RdshePFi2ZR4nJfLxdhw+n3X1l0lqEQgXM+3nQf/yGECbJTeZ+6y3fXWQm9N1WHqTszug9tV8QFfQ9Saorz2IyQUd2gdLgPfRfF0oadES5QmSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029224; c=relaxed/simple;
	bh=SOYf3SfjKiZ95SWaRy9LWaJhoXXb98txie33gEZoVzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tz3XGKJSCTj+SO6zTTVL+Pakd1GXut2XjMEkkpzf4504mrEYPtlY2Adj1w1lzv0r/xQ/XVTaWTb1bgAt8oELU4BjkhREQFsMGJ0b5ae/ZycFiTfzylWgM8SzqXIFks8CcNztEnMuUNv9zRHqPxG7KovM6A23jrSi1xy6abuP98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dbbnbrog; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGtSeM002538
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmOQqrjMzqeBGq34PKXHlYCtCJdL+dzG6VReuDNyzL8=; b=DbbnbrogjPRbR5Y/
	U0XsqR6SXEAfFTeGJBKsNC0CHLjyf7O+GFWG5GTuaMhV5gfJ3pTkVTEXQma2IdAt
	swe2QCKr9EtD1PnfW20FtPQidKQBtQmSRRKbIwG6IN2/dYJXARDhGc1Z1QaIl0rd
	uWQHghK1GXp2dyJXg07P77v2XCb8jjThsxc1b7hSqaCF+QtXquS7JKHcdGVa4W84
	AT2KHNVk65qyuiXwdyvQHoLfF1THBtzwOtzlJRKoVFnwHGgv3F4ty5FLSW2MwhhS
	65aUJslk/pYPdUiveFlwzcwBooMDwjjA4BlSt+jTQsZUlWH4y7wa+WQ0N20+4fSK
	bMWvvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg66fc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:46:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-466a20c8e57so2009261cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029215; x=1734634015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmOQqrjMzqeBGq34PKXHlYCtCJdL+dzG6VReuDNyzL8=;
        b=R4BNESmnsTILsZhtdNcErCICErdUuGTLQ/DVP8+gpPbOZdSCUrLTOhUnfSUVN6UFNu
         EThNi1CEylXKzBDjh87zZoKCE+ELVGQadB3jTSv5GroNG3hMGpIum0yShWB89rsxwsL2
         8FvS6rqy3+X0l35/kr/oTQG72nf6LR7WoED5MdZrtDRHzYqUA2yqX1NvNkoDX9w5lAaD
         QdtFJOWV79p1nPI+Gtkd97TSJs2MuT3yKmic9dtk/4mrKYa6mc22pwzHXUKvKruwgI7n
         HSoK9Kya9UAcHqJAAaARtOERJ7HkpN+dT9Co6Ek47pmEPRBB7CR3JiJpe5+i+ETRfgtB
         eHow==
X-Gm-Message-State: AOJu0YxcJEJPvozv+Sd5xsxryNX7KTLxm3lY8Nsvqf64EkRERGfQaWaZ
	1adPmISgCHAm6JPeGXurnpe0PI2RZqlue6tKuu+VmOmNW/QB8UQE4Iab7G8Sw0aemTOf6QoEyxE
	Mt3VaRvzjtGbyfYNx+e8S3oachJvrySPGua5t5Va2Q3nL6sah2PJcroPfoGaRykvw7cSQkSVV
X-Gm-Gg: ASbGncuIFlGNby7Q/KAgnBQ7PcfzsjApzkocT2N2i2kSf2GsYtiz3Z+rPcuALXeBNQI
	ePNHY4WGTOULJlk/cgxX3khE7+VA9w16+HoPYprpkFZCwSPUNbmdEXTFnnUyKQrmmhLNrEntMVq
	3wXdGzXaMZrrdbHy6rN7Bto4bclkXytw7/wfrXMTnacJTZYWIoPl6PmvBescURD/OeJUZ3XC5tL
	en28Yo+NAsUY3MAMd18kiVUULQaBswkOoI6UdmSA5lF68qu22eh/a/0q5jwtX1KMi2KD0XEeZcz
	H4AzO6OPzhtxKHQ/D0WLCAxYjFx6WzphE9VFVQ==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id d75a77b69052e-467a14cf99fmr7724311cf.2.1734029213582;
        Thu, 12 Dec 2024 10:46:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdpfmTx2mHf6sXsAQz5sQIHlNuntc35VI2+MYkILXa1EgItZeGr7YDJrQd/P66nUPjXjjjCA==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id d75a77b69052e-467a14cf99fmr7723591cf.2.1734029211712;
        Thu, 12 Dec 2024 10:46:51 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb7722acsm7157269a12.3.2024.12.12.10.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:46:50 -0800 (PST)
Message-ID: <8b2519dd-3338-4770-9f9e-d99de5648fcd@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:46:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] arm64: dts: qcom: sm8350: Fix ADSP memory base
 and length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-1-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-1-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SI0rrdD1A3VM6Ne0COFvqNEW5vwMDkIe
X-Proofpoint-ORIG-GUID: SI0rrdD1A3VM6Ne0COFvqNEW5vwMDkIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=869 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in ADSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0300_0000 with length of 0x10000.  0x1730_0000,
> value used so far, was copied from downstream DTS, is in the middle of
> unused space and downstream DTS describes the PIL loader, which is a bit
> different interface.
> 
> Assume existing value (thus downstream DTS) is not really describing the
> intended ADSP PAS region.
> 
> Correct the base address and length, which also moves the node to
> different place to keep things sorted by unit address.  The diff looks
> big, but only the unit address and "reg" property were changed.  This
> should have no functional impact on Linux users, because PAS loader does
> not use this address space at all.
> 
> Fixes: 177fcf0aeda2 ("arm64: dts: qcom: sm8350: Add remoteprocs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

