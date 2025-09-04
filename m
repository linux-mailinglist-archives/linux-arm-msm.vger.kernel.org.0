Return-Path: <linux-arm-msm+bounces-71958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FCB43003
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 04:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE043B8548
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 02:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83E221CC79;
	Thu,  4 Sep 2025 02:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq/qDeOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29DC21638D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 02:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954148; cv=none; b=la6lFvZQYY46g2UW1KD+IFeNk6+ESusD8rJWi1CABfjtFgiGUCYF7kpk8rFsc0UbKdEtKk/4UKVRdlYp6sKIUDz+v8oCHKbis/gv7MS6KOnemx2iOsjz5PnPQfRSNle4v8eY+mSvHkBvnsJjDRmC1FRZtu3NJLwxY4ysOI1ksxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954148; c=relaxed/simple;
	bh=svZaVELrPVpKpzX9SUjpuPRjMgUFepubeojy8bDHPck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJ7ShFnrvA/U0WEIvuWoUXzfgW03CDVXO/6X4YPQfjKPRJ3iaohPqwd9XUfW4oiopG3wq83whwqM+sjrhk2g+Ol2jwkGNB0UQ1G43DcdAsYsy5cMJhcWj2qp/LE6FZ/tJf4ltQZEDwG1iMc9Mc2jZbgnzOJChk1XONBoyp6YEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dq/qDeOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58404A7T005224
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 02:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKt0S7ecs0CtAy+/PB8DTyVHpUERySp0ZgXkiv6AF1k=; b=Dq/qDeOXkgKTS0FC
	qmIXOjDFHE1NV8mvTG3DxpBs20sDbb7ZFcJTIFbgwediO8jHxivwJ5dnGKIWngJn
	1vhgGoAahs8fO4l4KyQ66J29BHPXxMeCsTa7YWzrnYIMoxQAk6Xmm1nGAHw3JIWk
	e2UD1pKHD9hGHsYtu+DhBjg69t2oMtZjaqz0xgFYE/0yNKvcl8yJvP0xRAngt/GN
	VuigZDbo1xyWo5YkpMWTqJGpN1my4YDgdBBscQHgLyZ2CAvFiJOIdlSF5q4qkL3/
	6ufdUiYLnKCCYCaS+LBj+63RN6yQFd5zs7UIoHZLL6wo53A1qc53dCc1kNWE0gTx
	3HCmNQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjnuth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 02:49:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329e0a8337bso592838a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 19:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954143; x=1757558943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKt0S7ecs0CtAy+/PB8DTyVHpUERySp0ZgXkiv6AF1k=;
        b=Vl0tkz7gR2gBAcLbN3L6BZBZd2zNjaBHEI3pUR4pZJxpVo5uJ3at6NDJ7iwpzHkViw
         ec9OAH6KLSiAv1gt7LAVOe+LWSay69uNjNnnypqtcM4RAqLgKn7MfAt6rL04kJQWI6yr
         kwkED63A6j/jIbGYty5r9VvSA46IOsexroOlAbP+OL3VYZHMqp9wuDKVtuE3Q1RC8lpl
         pclLHQ21WsPteC91w3BgelolSJMWInQe9qdYEUgplsn60LvZ2IAj5cBsZL+Jrq4/tGk8
         XixFel80/HU+/USmkN1BBnVA2+0gB+rTKgrQkU5+5sGcmSTL3racGf7jdPZn9unByAko
         izWA==
X-Gm-Message-State: AOJu0Yx8rtBb9WO9QhPBkC6taQ2AkL6wK5J/VEgBgjT49CFrhkwc+nw9
	iGgFF/vhCnsbJznzruhz4TqXSsmjPSX9tf+ASEGjdwZmXtSZwGVdwQSK4WqalZqJbXJ+rSxatX8
	MkdRkepuNcngn7FHLVJis/j2Jt5fEnVh3G2xi3YN/fxaUDahEMmuUuRo7M5rMwi+b76CV
X-Gm-Gg: ASbGnctM74GppGenlCTHLdz6aW9oRewIfz1sEm27fs0TYJtZzuccrw/+3foHCDrXDF9
	DHVDAy13AwASG1bLSD5jmXWpz+FJ9yN83JG+h8dLECLSMLL99yXu407JHbZlmxcBSgGaquHh1ci
	w+ZGTtbWOKv7Xh9DOHp8nmTuQKsksDP0kJcGDg4jliGzgp+HrZPLxUZmBFFu1By8Jy4LJrhYHXv
	ou9tMBttxzkvtkpG24MgDEsbinhRmfqNuBIJ38tSGSRcUmh/9CRu/zWtc1Vvy6EGSBX82KlHn4U
	7zIBUTwFDMCcms8kBwNlad5cGcsUmWv48t/rvnMiFoyUqTjSZt/9PzeEk9mdf7H+yeN0EWIaRAt
	sXLlVDbzVvdFokKxzDFcTY8b89eyj
X-Received: by 2002:a17:90b:1d48:b0:328:bfc:ed81 with SMTP id 98e67ed59e1d1-328156f9a2emr23377033a91.36.1756954143505;
        Wed, 03 Sep 2025 19:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELJFGledcyj5orxusevvJh0NdR70AZnkQGjekJR1JcPW2asraw1wJ1eMDCJtOKT1CpY2VcfA==
X-Received: by 2002:a17:90b:1d48:b0:328:bfc:ed81 with SMTP id 98e67ed59e1d1-328156f9a2emr23377004a91.36.1756954143000;
        Wed, 03 Sep 2025 19:49:03 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b92a28a67sm298195a91.4.2025.09.03.19.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 19:49:02 -0700 (PDT)
Message-ID: <d7cd5d3e-3010-4b6e-bcf7-d0ce599f473f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 10:48:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: lemans: enable static TPDM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
 <a53c6bae-710e-4939-990f-5974346f6c75@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a53c6bae-710e-4939-990f-5974346f6c75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b8fe20 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vFb9WTq5DyKq8J-f9BEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: eS_1iQFgKbJwdyW6H8qg93OSokWqi69-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX89BZ+y0mNV13
 2fhlsEtOANrAaADo3DUFt9guvRNG171D5tt7gC7Qw9r24xv3pvWQ4nEB/qBedji0EGNCwHAO2kQ
 6If0Jsh64K5cjNMKHYexg3GGJD6bVeM+PGiRSSfZbxVXWNHB+P4HIk3lN3Ksz53m2vNwoEJVGsf
 Rm1AiIk8Ob8dZXR6QMOmgip8RhT0rRnQUBuCwaXEvJju2KWpxFsd/ktsazAJM5vqa6D/oeHExTq
 91PB/urGR/RAWsbwbAnRapDozA75cXCCbHx1pYNqIZHuIJ2L32ozD1wmZ6htHZ23BR+doZznnpd
 WRKYFtQckcLBagma5jUU3rkAd0zd9ri/F/HTKiWfkwwDjSSwh9bQKUaeQfuFkvY3usza8/+Rq5V
 ExOXyb2/
X-Proofpoint-ORIG-GUID: eS_1iQFgKbJwdyW6H8qg93OSokWqi69-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024



On 9/3/2025 11:59 PM, Konrad Dybcio wrote:
> On 8/22/25 12:30 PM, Jie Gan wrote:
>> Enable static TPDM device for lemans.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> perhaps renaming 'turing' to 'cdsp' would make things easier to
> comprehend
> 

We are following the legacy naming rule for the device.

Will consider the suggestion.

Thanks,
Jie

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


