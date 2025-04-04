Return-Path: <linux-arm-msm+bounces-53268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF10A7C674
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 00:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF07189AC74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 22:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD75720ADEF;
	Fri,  4 Apr 2025 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiXb1W5N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F30B1A4F2D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 22:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807408; cv=none; b=nNZaSdP3X4Ec3gZT0PwWYQDsigcPyLvLYNLLuDmNXUEBF7KeJa+zWd9vW1c4cY8mpjfdjtvhJLpYLOAfY244+lsGmIEZ4UK7FTZaGcj1iXSoY6eV3qykOg1srvySi2USJ63pN/3LbvNwOSiuRj+BG9eGZ2pv1H5P08B/Tom2LMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807408; c=relaxed/simple;
	bh=vPXYIfrG6q9HsAVXkIxNlNbByo7zBEe8iBfEas3+oS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EA4ezn1DU8ZpaFwFC6f9C2tPWxQ6VHuetnuWbKqntwEo5PNK7bR4y7NzRooBIM9PigdNSbN1lhjpRbMv+x4VKIA2q5G+P+gJ84KDO/0DezN8J0C2vw8ehlXTmFNbWbZgf15P2vXZf67i9z198IR2Hi5J6+UpjZOpw5xssWUovnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiXb1W5N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEaRJ032359
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 22:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZPli3NzDEAv4TZgDVbK7Lj3pli6NOmyPsLXJkWkw+E=; b=MiXb1W5NKrJWZt/Q
	ASg/N7NUVuofhM2lPO46USrEHbmbMSMcz28t+Dy8jVdpxBel9XesrRWxhG4/AuMR
	BturNc5tpeH4W231Tg4lvkWX4Uss6pwglspsscZ9o/vmIMVDDhPWOD9kzHp45mp3
	Cg/gDX+eFWyP4k0afccLX69fGxujEGZ8uxqQSrqcoJVEY2HZ2Fu05mRyMJEftkgv
	VZAvPmnukA+7v5T2XcFWKB4/BevMvJnxSCl7bAv8EfitO0n0f1MH5tRIR83atgOB
	wYZBM5Dj4dGrisJIkpSnG/M9AczluSrGea+2h/rMTsT0Fcv3Ym11sNNNymEX83ht
	GPBQhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8u2ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 22:56:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so64289185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 15:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807404; x=1744412204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZPli3NzDEAv4TZgDVbK7Lj3pli6NOmyPsLXJkWkw+E=;
        b=KPhvyBScfq2CjJs9gExOynm396abgVuRjzaywqY+14h6SDErpErihi5NHAfTARiF5z
         Hsouj+qRjQ6tz2/FC+figw9K0cjh9WMPayfiLvE6yjChVzp+vcUJ3U6jtIjh9UIqlF/b
         DCEllNbmcb0N2Ya7of2KZTHc8Q/0n2ntRIeW+6FmP8e2FNQGXLO45KiEe3DYfkdaWC0s
         uvitBp41iuVlkDJj/ouqrttSoYZ1mc1m8OM4RpvSJ4YSDg20LlFtLIYPA/FuTR+i2riE
         Td7jVNIp7E1/eEWYdrio7k5en2buEw3CMqXWNTU8W5f7PvoziEuSJa6wO6sHNEMy5OZX
         ty3g==
X-Gm-Message-State: AOJu0YxWz6nK7M9AeBwLyb7cOffbQYUEgxEz4qgo2cjMxNTESvS0WHAP
	f23w9Ut6kzQlJSPH3DqE33dpYol/nXOe4SPJ/T9YyyD6p72JZfpjVMyU35hQxlMyapeMSIbwUl6
	Hkt2atLbLPlSsfYAd3UIoTBwqGehdBbEV1Ngj2Zm2Q/ZuBFO2qm1WxdJdj3E6Exdl
X-Gm-Gg: ASbGncumK7YR4Lovn6zNEXRtPb5qOE6NKLK7zwd8yoiVWdAeuMvobnItsXFcUsMLh8i
	tGbMKA8sGBlw+nZh2iUHg1fscZ93zDMkndLnI68ugvwA98cWNdee2aPsBYBRvis6apEu6t1A70Z
	YPNktc0BGp0etK5xi8hHSC12oBDLr+xn847SO4QwpNimPWDMty+QZa8RVJkC3cDQjidvDHyu6y1
	a07iaXmkXc90i/mtVV032Gny1lxrd8xEDakbO6VYLZ4Tqa5/0O5RJOZFLc9PM7xYO56DJhRTOzr
	4qwCcA5BkI6h5HLQjesULhslKUDIxnnZBGw5p0gCpv1G8LTSLA+5SS8blYMPAxIb8Psbhg==
X-Received: by 2002:a05:620a:c46:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7c774d27d7fmr276112385a.6.1743807404646;
        Fri, 04 Apr 2025 15:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXKXpJs5IzNH67kxafG55W+zbN89YwyrK3gKP53Cv1F64bJTVeha/BdK6RnsTvdMHYnhaAYw==
X-Received: by 2002:a05:620a:c46:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7c774d27d7fmr276110985a.6.1743807404305;
        Fri, 04 Apr 2025 15:56:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084e3dsm2885893a12.55.2025.04.04.15.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:56:43 -0700 (PDT)
Message-ID: <fe00c1b0-01ee-45a7-964a-c0a75e9e8e68@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: firmware: qcom_scm: Fix kernel-doc warning
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_satyap@quicinc.com, kernel@oss.qualcomm.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tQCyB-TEjkgrZW5GyyZMERh7-TLeCJLW
X-Authority-Analysis: v=2.4 cv=IeOHWXqa c=1 sm=1 tr=0 ts=67f063ae cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=M7GtDsIe8x9ARHnTdgoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tQCyB-TEjkgrZW5GyyZMERh7-TLeCJLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=966 spamscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040158

On 4/3/25 10:38 PM, Unnathi Chalicheemala wrote:
> Add description for members of qcom_scm_desc struct to avoid:
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'svc' not described in 'qcom_scm_desc'
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'cmd' not described in 'qcom_scm_desc'
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'owner' not described in 'qcom_scm_desc'
> 
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

