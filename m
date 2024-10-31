Return-Path: <linux-arm-msm+bounces-36620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B82519B84BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9391F256FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEE51CCB27;
	Thu, 31 Oct 2024 20:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAeAbSXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0671CCB4F
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730408162; cv=none; b=SpOnUwjTYdV6ASEd8zGRd3oM9bToF0LfYklCqY4nfrf1TBmCJU1+JIy2U3jCr89IatPq0x9dmDaqugPO8wJOEw7VVWsn9XzmLwY355mARipFySRGw3smf2DrqJUqoLfnN94uetUEr1YV9pfEfZvmZKDsjb905cq7nTazxB5QXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730408162; c=relaxed/simple;
	bh=lUSUj5gpJWH3n+nu+zbQk0I/denqmKWaKjMGJHBTETQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hur8SVxP3/O6Ix32rTca1k3xxUREaD8/OBVALRTRV97o6C4ooeJizLLsP9Vif6aMaMK/QdmX6bLAaJpA9Grt2XuLtMfXUg2kr3xS6xAfyV2MaNVNlqHxT4V4FkzuZAb1R8v939WcvjI1E0RJWfdJUc2o5Hoqy0xJfCV6TvDLtvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAeAbSXa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VCmJRn004039
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/GsUlv6jLw8dS2ijmCbA4pqN85zB0IfE2xsC+GERb8=; b=UAeAbSXaq0jCy6fP
	uniAzadaIqa+xq3xwFwk5c9EzLAgHLFpBgIg2WddDNvUNN3cbsyAzSa1eD/BuFHF
	jmMPR+q2Y65kzBhYWHPS+3REjMVnuZvMuKOvwMgO/99w/vJ3yCM0WIUk4HKAdoN7
	Eu0cxXLtU/pwCzHHhqhU4SXklTmU3pM3ACG+ON/KiVuAvhKNmcywbBxfHGJK5Cbd
	8vNtvUWkgLiNHsxyOiSg6nwTbjQf23DO5/IlvED5/OYTWc7mI3JWsoqim8shQsWi
	jD0I2nSCi28lw6yuPStmk+OemJtSrQ9T8JORQqPZspY/YpVX2GTfT5jJX5Oew7G/
	t/OSAA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kns3mrya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:55:55 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-27806f329b8so70919fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730408155; x=1731012955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/GsUlv6jLw8dS2ijmCbA4pqN85zB0IfE2xsC+GERb8=;
        b=PiRDWe4kMn6qIYnIkSh2pRW3EwO2PSENpQE07UI4fvkiUTOCuQiji6nyYXCCj5GA82
         DKo2N8pg+5igGgPSjohv8EuA9YpL2/lgcWThm19XauEH5IZg4ZwO4gUt1zl7OGWG+RKm
         PfVh7e9CfBCgutp7LIjHzhdtXUib9kS6Ef5AyTT3HV1mLXqua9xffmrOrm3wsOFm2qWz
         CFCUAQjj11KUUcA713b3UNVTYufsvrcRpmJ2iAfT/SeIvlZT2ZknSzX+0JGePYmNL2Vf
         8N/b91iO/2v1mDX1GbXtBPXqFQwqhP1pXDPAh6/OwhJi59WwgB3+cAxiTOuO3+1J7P4L
         /9MQ==
X-Gm-Message-State: AOJu0YzERI7oN28d+zg7mLrna/NxGuFjMmJGLYaIxlsOyB/jRu2gWhB0
	FV3AwuzSFwR/vyBr68+2MgSQy6Agxb6cZrA8x1DfEUtCUXi7OsxYBUkgzWgp8Ssd0mGkXRq7cQq
	wAPwBDitHP775vSVdT9cQsofDyyKerWTRlWz+lQQvm48ye9Wps0NHEnjjLjzpJBba
X-Received: by 2002:a05:6870:8321:b0:288:4747:6904 with SMTP id 586e51a60fabf-29051d35ad1mr5245845fac.10.1730408154736;
        Thu, 31 Oct 2024 13:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcabfjV3Q8jzqGajE+yo9p1xEPEdBIKwPgoG5DN9WtHI+OBzL6cWTytYzHNOkjOm8Pdwmg8Q==
X-Received: by 2002:a05:6870:8321:b0:288:4747:6904 with SMTP id 586e51a60fabf-29051d35ad1mr5245837fac.10.1730408154506;
        Thu, 31 Oct 2024 13:55:54 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56681a03sm102118466b.197.2024.10.31.13.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:55:53 -0700 (PDT)
Message-ID: <0fa67f4e-8aab-477b-9e40-065fa815696f@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:55:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: Adds SPMI support
To: Tingguo Cheng <quic_tingguoc@quicinc.com>, quic_fenglinw@quicinc.com,
        quic_tingweiz@quicinc.com, kernel@quicinc.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-1-f0778572ee41@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-1-f0778572ee41@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F08B3_sR9NnVAtm13OxEY6ZSxcfGwpOf
X-Proofpoint-ORIG-GUID: F08B3_sR9NnVAtm13OxEY6ZSxcfGwpOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=837 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310158

On 28.10.2024 9:03 AM, Tingguo Cheng wrote:
> Add the SPMI bus Arbiter node for the PMIC on QCS615 platforms.
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

