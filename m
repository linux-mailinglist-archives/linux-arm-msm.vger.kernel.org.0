Return-Path: <linux-arm-msm+bounces-71864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA58B420A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00D6958047D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC86301032;
	Wed,  3 Sep 2025 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrPTe9PE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB74301013
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905061; cv=none; b=iDy+yGWsmle5h/wbiSOmErSKDnAKvfn79MbbJcfr+xl6xSr7LzH4uUXU26ksv9lKNaHuVUX4qjQIRusMp9MR5fzsopBF7A3v6HMdgGaSb+dQm4BYhGRsMmWnuc1US838jZ/jfqMHBdsqu0IVPpcs0QpaIIPeKm8EGSBkLLvRbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905061; c=relaxed/simple;
	bh=W4WCBxQvaUYibDVSr+aUaJpoOgC+JIgx9GXzLqZgHeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/aXTysSUeqXvs/iwOZVa4fmGTXDX+hQq028rmQs+LuijAUYOh64lx1KVbLjCoZcSLE4KK9iDEyLBmkkq8bcjL99SxBp+aBhqRiggOUsR6n9g5ChC0Q/HrWEP86rFg0Jn+x9utpjg8F0KbIzj2ohJaDMz0ZuVNFQmVlXT97wbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrPTe9PE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF5Ho002391
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 13:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aY1HJAFmHMKDRbWr8GRd/t9G74v0xkZNHeYMb6/rGks=; b=mrPTe9PEaGy6DzLS
	9fSmuqz9PMF9rTCLTiGZvaaDz7w8eC3xYRiw082XJV6Z8hgbqtm3iyLPYpj5jbAB
	+jBryTIJF0X6NXQxDyIqCwSVbjYfnlbS/HTO7iGskh4ExGNbESoeaa375AHCrwNR
	R+bPCxAlD1oF6BBpGGC0R7DwLK6/5r9+qeXMrkg4YqBsdXgijQehkyVEPLM3GeHr
	RAj8nke/okN1tZJxcyxjydYBwNlFvLkcURlgn/4aYpYDUgzPhi7wGbNwsuGhp8DC
	Aezt6w6kxgxe5Zl5JWeMdLbiSfJYHv6zKdFniEoSUdPdUflCXu+FsSPipJb0ignV
	CAu0NQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush33mu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 13:10:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b307e1bef2so17590491cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905057; x=1757509857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aY1HJAFmHMKDRbWr8GRd/t9G74v0xkZNHeYMb6/rGks=;
        b=L116uSPtDJpEF8ndX40AuVPmatFfs6MGPxP4C3R/GvqXgahKArHcN7AjL479wf+7N2
         UD0stMnCYttjBAFY83DMNDZH5PZj5cD9jvp4iQHBWd1cl0xYacX8fdKzhcI+NGLRZSyZ
         M9liGD5Cj2Mhbj4dP+l+d9MKnB7wHvYH3XWAancj/cboZcZMOtb3rvjf9Zqa16pPVixA
         Wks+wVavhK/o/AgMxswtExuZrasDY0t1pRVY5tjDDaVUVJ29Ltxx8LzbLH6frRjOzeyc
         G6tz2AX6vFg9gUr+Y3o7WOi/z2JEcecIBcLp3d/RdkmwBqLWkQRNpUoYpHg1IiFZQIeu
         OVfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkXqf4qHzbGlpZGx42cdvh+3DmZ4kUXsNJ1w4y2NppTLw3DMMM2Gq/wUe0/soYVrDbLMe88LvWdCRWmjPJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhtkh+OY3tyKkoeYa2H/h/kX9CPBGVAbzlToZDsSYtVnJ/XIe5
	NWAinPaljrraBdLUzQqKFztoAysNVWCG/TXvm5F8OHHXzlkkF1L8KRlTF6RQDoKLYQ445dupIky
	QfWc1Bf2SBm31vnK5UCSyVXa1fNO+3sScqvfVTc36PHjrmGL7PFhh/vai5PU9wJ6vRZ+X
X-Gm-Gg: ASbGnctCMiYG2+L6zX7qRMkNZeJaLw8qyJKH2UUzPxjGh247MwVgSsYkeha+x7a66v0
	ib9UBJMRvqVoEpmGrquiFnzbmuYtplKkQlQb/qj3ZFaHmINYQZ7+DSesgaxRgAJFMpuwsllEAJU
	Stn2YhHIZICNwVpn7L/BJoKYkzNshcjYAL1+Te6YrJ3m5l23M/kIuysU3x8j87/pUf1rrTS7oM3
	JsKLqWfoz/ngQ3ORAAHkmSOyxeiJRkmXdYnIJ3B+jt7Lv99h4uZx8f84QLoS2kNXfE0V3FaG9gK
	W/GSDSsYuE/rF62T71MDwMNDF/MvoKrbYvE2wnzees8n7ukA3fX5bHfp7t3AtAvw7iw59KdVNcz
	hrQ+U2NU72KbrUs/hf6qqoA==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr144315191cf.1.1756905057274;
        Wed, 03 Sep 2025 06:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlbX86OkDHQrtRozUIs6RfA1kZEBTsuPTQJYPGvCUDsHeOmLvCYNbgn6D4FeDhxE4MBDNULg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr144314681cf.1.1756905056546;
        Wed, 03 Sep 2025 06:10:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0474be5e99sm30772166b.94.2025.09.03.06.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:10:56 -0700 (PDT)
Message-ID: <99820dc6-942a-4aca-911e-cc68834e41f0@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
 <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
 <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
 <05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com>
 <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX1V/Q14340kNm
 8m9IVI3CnldK6nfpw0cLY++NT7//E5thXw67REgTAzS5uGIt/3roAggWaC5rmTrvuPriBufDWoe
 HQeR7gL+uMGyJePALSbGg1XzWqcRaAvHafvZPw9hy6gS13rfqqxWOV1sqYj4OZm0DlG/5Fmg11X
 KquE3v46CTFZoXzB15c4h9Dxgd7nT7PwutW9ttLZUFsZjOMiIgyolCmQx8jYcHudGCIhzAREYB/
 EbPQS1dQ0vsLr1f5kruPLjq+iJ/wIIfUKuDQHk6p2irPwJuEmu/LXLiB9TdRHHeBCR5WG2+TR/5
 hD6u6sbEl9rSZRdP6KPRIuFRUsjqLlQI7do6Efn2gmsADf+f6DyVmdbWRiYLuNPr4Ij1XdDSAX4
 ypB3PLFw
X-Proofpoint-ORIG-GUID: SfMZOtelgIVot2a23-SvbgiApHXh8t5q
X-Proofpoint-GUID: SfMZOtelgIVot2a23-SvbgiApHXh8t5q
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b83e63 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=PnLdOiXTK5e15ukaaVEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 8/28/25 3:57 PM, Krzysztof Kozlowski wrote:
> On 28/08/2025 15:49, Vikash Garodia wrote:
>>>>
>>>> Whether removing will not break any ABI as initial binding enables the IRIS
>>>> related code to use video-firmware, now we are removing it.
>>>> I believe, removing binding always break ABI ? or is it depend on driver
>>>> code not using it ?
>>>
>>> There is no single user of this, out of tree (I briefly checked) and
>>> in-tree, so there is no ABI impact. I am changing the documentation of
>>> the ABI, but there is no actual ABI break because impact is 0.
>>>
>>
>> My understanding here is that the interface "video-firmware" is already defined
>> in the binding. There could be possible out-of-tree users of it, might not be
> 
> There are no such.

I believe the confusion here comes from the requirement that was set out
for the iris driver to support existing (venus-supported) platforms without
binding alterations

Bindings for SM8550 Iris (as in, the hardware block) only came out with the
iris driver, so there was no legacy to support in this case

Konrad

