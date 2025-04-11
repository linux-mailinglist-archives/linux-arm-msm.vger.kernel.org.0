Return-Path: <linux-arm-msm+bounces-54061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C2A86625
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 21:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD3B174155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD6B258CFD;
	Fri, 11 Apr 2025 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/UZX7Tw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6262586FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399166; cv=none; b=I94Imc7na4teqGxad/zAAqfx2jC7Fd81gb/grHMNMju7VTXQj+5MRXtuuU00tz+3t7aasFgsfG8rGHyOl7pLdj0cDdbSei4Rb+ww7dPkX355eD71Z7CV5yn9cZiy8lQIuNtYcvcBQg46hi4w1apa7AjTmPJ7iz6C20FuCRIIBXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399166; c=relaxed/simple;
	bh=NtXfkW5LPJcP7ivcL/JAlSww8WGxXJURYpmVZioWMlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZvRh9MzFbTxE5kIjMVhE6dVCl3gcJggTqNGxDWK/qqj+8eWP0mpmx0xjbJOMHyaBIT5dTuSPIsi6R6BUqRbc7mNth8DuI23lqY+WZYAMzjpMNm9Elz7ihaY+gDPBvX/fpH9BSeaTYeaPYLemhFEaP4xqecCfqAM8Cj6BQ4T72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/UZX7Tw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFOLSN030613
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjcP4msDHbFpszbnHyS9j3fffcSimLZXswhsHCqmmys=; b=a/UZX7Tw8+0rIQ5M
	ubU3pJgBF/mJ6wKp50aAmL9H9AKs+PYC6rVW0MKTjZoiJ99JL9EKOlnG1VRaKCEy
	8ZK5dOQIRSlxJfrrF/FVVvuhn0YXMebdW5/K/4Tpv+8Ns1gomqltp1Mg4QyK2TTd
	Bi+slqQDPE8gZkZaumk5Djaay7JctlIeUyFzeZ017a1agdiHs1+P9oYhEws2NmYg
	n2PiAKIlRm6QqNt0padQhAWvzJEiQCQx6vcLFBQrnmoK+8sXVirEbYLoYYR0EzYJ
	L+hIhnY9wchclFeDyrlaHSkpMd53+EWDzyrkUN9E0LGtz9b5AqFv1Z+Y8Wd/hApR
	1PbNdg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftu82f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:19:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso3963176d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744399162; x=1745003962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjcP4msDHbFpszbnHyS9j3fffcSimLZXswhsHCqmmys=;
        b=vpDPH9bUPLR+c1wa33i2EgrOmlH1AwQ2DQ/bBsrOm3/ruxgAwNEZgq4rXPU9igA7jy
         rubx9QgZfs5/Tr4ZkfZWawNtIBl6kAsHEDK4+bLE6bomXZ2sabw6/SlWg4SZt/QFbMZ1
         b2J37IUBRQ0QSf8Xq2KT2VwXZJrJPavnskDIzWpgBrYk2BNqoUBw9jxEsVV+yi4izttD
         YcU8R5IEBC7x+iSO9EG4OjeBHgWALYqIBhGBOE5ZhMRFYK9Hq7HwA7LsB2fJOFif2DFV
         U7Sk1AlHPphZjkhVAH6cFUNFDpvlJXzZtf7jZkkzmlnCNXXgGa+dzSeYceyMQ6ed/COs
         PmVw==
X-Gm-Message-State: AOJu0YydG0unOsuKASmvQqg4vYADcU1N2W/Gj/+tCkQWYa/xpQE2QQvW
	m/y4e+2l/dLoovWGGHkwqkrAPCPj6WtlhltLkGCY+SGhN+n22nLIPLz6I1ct7oWRFXt4vWXJl0c
	xYlqTN8emQWWv695UMxPB1/3xSOPGpB3L1/WcX57P/AputMd0XnE+8Yllq9PDrFve
X-Gm-Gg: ASbGncsWf/TdQIZdVxh/Opgtbb8uYLCWFxTkLIw4ILKdW/JYKzwqxT3ERDMWVaQuE4m
	JkcHBo6bMDotFuOSuuQVsdCHL6FDyN2tnXVwXF2EUIP6CtugUVyBZsj8l+I/ijIAuoU9t0GeIET
	qFBrjYtiyPXt2Ly1xrV1WIRWwfrhIF8J389UIQtqICl0HpxAzuuw/Hjr87dU/mAKZJrK9acESdc
	rP4lq4/WuOzuObMjbE/w6mUOr904mbGccoMsu+36VejEMc6wPH8sK7VYgdF8zdj17jpEXx99n0K
	/nC7PRH8Sskgb0sEN7DxTGEJIhCFMMA5nUe0taGMKFtmmmRDNiLkzymI/Saa217enQ==
X-Received: by 2002:ad4:574d:0:b0:6f0:e2d4:226e with SMTP id 6a1803df08f44-6f283be6e9dmr14444036d6.8.1744399161994;
        Fri, 11 Apr 2025 12:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETkoAXTsep93PgvOG304UZMXCQv8pp/w7MUhWegqcp6fDQ9R+OshKwpZdKPx0wQYgOCpAU7A==
X-Received: by 2002:ad4:574d:0:b0:6f0:e2d4:226e with SMTP id 6a1803df08f44-6f283be6e9dmr14443876d6.8.1744399161605;
        Fri, 11 Apr 2025 12:19:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce711fsm479053466b.169.2025.04.11.12.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:19:21 -0700 (PDT)
Message-ID: <824bf224-2a7e-4d3a-b160-8cdfb22e9224@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290
 compatible
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f96b3b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=stLmoef1on31CLXXj-sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NkGOchzG_cWcdAtsrh8kferdcSpXmVVq
X-Proofpoint-ORIG-GUID: NkGOchzG_cWcdAtsrh8kferdcSpXmVVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110122

On 4/3/25 12:22 PM, Loic Poulain wrote:
> The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
> It requires only two clocks.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcm2290-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: camss_top_ahb
> +            - const: cci

Since you've proven that only these two clocks are necessary and we're
adding new bindings anyway, let's call the first one 'ahb' (cci doesn't
really know it's inside the camss block), sorry I didn't think about
this earlier

Konrad

