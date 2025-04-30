Return-Path: <linux-arm-msm+bounces-56220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55328AA4822
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB26D16FF3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C5621A458;
	Wed, 30 Apr 2025 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9OKSmWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E781D238142
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008320; cv=none; b=ST5Ji6Npejl5zuLHWjtCzPULbasxeyRKgUzE/QzdTWC9ZZo7RlYbbKqYDZSru0+nk6cIuCLVSxSYJ+bkjAbWJxTavVmPavdAHPvZOjJBuMr6q1hmlGl+eEHVt6IM6OMGZ+EYOwBJHl6WgYRrRVoEQ79aplKSkRcfAdUsoTh8SiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008320; c=relaxed/simple;
	bh=okgaiHoCfNZIj1mJBgATqTIMGHfVHIGnTJ5M+2oeyF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCDWGZE3kOevUc5TTCdxRgry+2GTZUYI3DMKQYQ1Mog0cP4mWFDU7aTOX+cVOIVHbcxhKCybRV9eLKgemjfhd+11/23yzfSAWR6Cep7Bwh/f3Qox7YC1OTDcCDfT2bQacCZTl9RqSwtIK1LbW3aVD67EtOLHoJJAEZYimHBeHjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9OKSmWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U91jpx016541
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8THpF6xzojubR0Ot/txkzNhNyCG9gBGkox8ywEikfM=; b=F9OKSmWvytaVM5P3
	Zygb5c4WZ+Jh4dct4CHC+ZEue5xJAP0uGwzENos7SMwxfjUKf4r/b5AecaPTFtc8
	/+jlbOEUzfUtkVxET0pgEJOffRF1gerj7S9vtNvoPrtu7SBBuq/jYejxJ3wjAVcZ
	EcMAin+PobUM+8UYHG7xkvpZdTNxi8VVPXPobqk/aP4ecVvTVD7B8eenVIOrMyXE
	J6eqRt52uPDVNC2sO6XDC8DCAjnoC4lbk2III5dG0FSJJhjAQHB1eRw56pFfM+A6
	DlxgNByguPhrZS/2JOWCfW8sUWjmPuPfU7nIL9nIATmjndqmtupD6DyF6QmpT4YB
	/pLgew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubhquh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:18:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766654b0c3so14583051cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 03:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008317; x=1746613117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8THpF6xzojubR0Ot/txkzNhNyCG9gBGkox8ywEikfM=;
        b=gFgVsW9vGd4nS5gdqCduq4opAmz8wGl8EPW/UziEbz+9y+FWqwb/WvmCS/xla+YRm8
         N6f38W3vNfAFOWVcyanDsHEW6fb6kwRKAr60rpBkdIwv/ne7HIHEz4gc14fXDwBBXSSs
         oor6NW9AqV4NK2bcjz3/Ol+il2Lix1j0P0nd/scy/I5PZRnqAwTP0fUJlp+HuOpin1ck
         t8YcqflFtEOvXGdb+VFAFhUPwO1c7jc5polnwxvVZMYBLHzdQ4Bz9okOTqWhx1G/WAij
         IF6OxQTr8OHpocAvEq1tCAR3ZffEVQ9Y7DRoeNsZwlquoVAHFXPISmLYR4e8W/RIMOeQ
         /YZw==
X-Gm-Message-State: AOJu0Yw450ZyYjy15jWtVyYWaeTtfSeYxszaOodPSSUvTvfPYargz3LM
	FVCzItXkf1rti6bp4WwNjHArSXlllzDDHKD4t3MjXsRQKyg9UpeZfKauGREBmp1LKwSebplVO8g
	KqQ9kphD9+kMQjKlPBV8Mdz132vOXKA1ep/xntAXzVr3JFB3robQYr2kwuIcA7wR5
X-Gm-Gg: ASbGncvxaA+CFlUkXuUm/To05mH+SgXVa/mvnyBFtJ7HysCm6NKOb73BN9BTSaWIAwo
	za458pvylRqlQK7QbEp0Ts67D1SqGqzr3K7kK2uTg3gK8kK9wCej79VkRvJsX2MH5T100eOjhyg
	0fNFH282FkNE9AIZxpc8c3uuS9OQ7WxxUrcLnN3Qbu8NCgWjrhT4YJMU0obJ1ZasfuWAdA6sxap
	gHlHxo02e9gE4U7twzUrf4ekHBGKwUkqeFjsiRAID5ODLKkEV4fABpK039heXN8kA2Ql60umkZ5
	9+rKnIjy0Itt9ngUkvILza29QhoXSMPGo5sTK+welcqeSM9ODzZItB5dYcim8A/gwaw=
X-Received: by 2002:a05:622a:550:b0:476:652f:4dbc with SMTP id d75a77b69052e-489e4d77485mr11338081cf.7.1746008316954;
        Wed, 30 Apr 2025 03:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO23cvXrGFB/iOngY/UOzNWgY0BSboZs1pXty1cvWHt/+wicp4JoHuzN5FLQhX8ailkyQqHA==
X-Received: by 2002:a05:622a:550:b0:476:652f:4dbc with SMTP id d75a77b69052e-489e4d77485mr11338021cf.7.1746008316689;
        Wed, 30 Apr 2025 03:18:36 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e595abfsm901834266b.86.2025.04.30.03.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:18:36 -0700 (PDT)
Message-ID: <d99deabd-878d-4600-93df-7b9c1cf75393@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:18:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250429-qcs8300-pcie-smmu-v2-1-445288af3ea7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-qcs8300-pcie-smmu-v2-1-445288af3ea7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FvaEiUknkTTSZwqaJhDIOuQc9TsyFNVR
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6811f8fd cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=PbmTXqVU7kiPfYgbbi8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3MiBTYWx0ZWRfX0gOx7gHe58lW lxEoO0xHh7nBX9IXqCFAYonJxUALlx2PLi9T21KX8Cyo/06P4dy1oHCoVnqodQF8W/CdWP3O84+ k3UpNRO8JpFKeVA0csT781/StqFZqLnaMDZkSduQLrJ6VOmUuRF3K4VaIXEUrev6ZG7jpQoZCND
 Ax5zxvSJcVh+fY55LshNMEIkiBb5gRHCu+2e7/c3fZkTqGAuzU7U6wZ251uUyhdxKjkOi7lzrbC 1lHl47jhzch5n+CKMS9uJzNc6JHxMWwi5KVpVXVzG3hSA4yVZisH8dbpuTDCEwKj5LeFn9e1EOc 8AJhDMY4V9PxNSjyw/7pwXb7KbT3l3zWifEDXw5DWyfGmwweX7XjxGlWKgeqtTer+Og7SnqF1Dd
 bjIIq/YityZKYbJqMeVAeLI8JISMDbBsf8iokGWaR2gYT9DeNNa9mFs7gNLYxaTnQQkLp9mG
X-Proofpoint-ORIG-GUID: FvaEiUknkTTSZwqaJhDIOuQc9TsyFNVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=791
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300072

On 4/29/25 12:09 PM, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
> Changes in v2:
> - Updated the global-interrupts and interrupts based on Konrad's suggestions

There was another discussion on a similar ambiguous numbering issue
on the related sa8775p, and now I'm beyond confused. Please ask
someone internally to confirm these numbers.

Konrad

