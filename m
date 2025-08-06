Return-Path: <linux-arm-msm+bounces-67916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A219B1C678
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE6AA3A38A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A319A33985;
	Wed,  6 Aug 2025 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/xSjPjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5E021576E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754485009; cv=none; b=KsAouPdvK+gqrE5jR4RN71Jc0lP2vbJ3If1vipEjJc4cM8mtNLGPPzaOaZwUQ9x7bgCFZURlNZo2Svm5UKcOEwkW1Eq5IT2nXwB4rKfLqwcrBjJ9OhBhVy2OO+uwlmwgCIMMAeAVxSOmpt3duE7iObpvroNzVfDuzyiu7H0osW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754485009; c=relaxed/simple;
	bh=F3XHAgV/g9t9Pe4DihqURvItO9b3hVigjb6udFTYxTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9jsdBIiOKNZR3L8qvBZfJDjDdhOd8pE4xIk5pul8yT6NKQFx9Z5COZJUokXnuz0BHILdQ2rNJCsh/28z5NNit8Gf/hwSo999ZrEsgjhEFc7/22WhjXrtxmcAzY7Q/syTEmblbheYi8jdMV+9frXvYZScvQhAml4GdufAMAGXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/xSjPjv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766LN3j010353
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 12:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RegKPJzk3RnagfrkfnZuONX0t7ULdD8AHnZvaN8Nsuo=; b=Z/xSjPjvslBXRNWr
	UEpX/VOoqncvDHYoUTIcf2DyUIwIAWvmZXLNmJGnKZQpqw8WW+tKl7Qb5vlkut5W
	6unRVwBVXQbijrgLvf5uE6ctmNqjj4yQ6U20bdQx5Uppv94Xd6HfMOFnyt2ZFjXj
	nRPPNWsjq61r7Gy2Z/bc64BZpk8GsrBJ4XtCn4EbshvSyLHF95ZvGExbu64oviYX
	zkUEcPpspmXsU1oKTeC7fNfZ4300cASp4ibJVacrBdkuouTenJorZT/lVrDUZ9yj
	yhgjvELYml2UTYqGcnsQ2qdKEPh3JK9cDDZm4eIR6E3OKIFj61RcCdok3NrDioe0
	8N6AAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7tr4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 12:56:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7092ca7dae0so15449326d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 05:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754485006; x=1755089806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RegKPJzk3RnagfrkfnZuONX0t7ULdD8AHnZvaN8Nsuo=;
        b=lkrBZXX4Sa3gLqlBaFNhvNqfsAPbejWFCzGd7kS/XcRmurp2m2hyZCwZwWDhGUd30m
         2M0GyhPE2ugBZ1A0758omklFbq2VgkFOuK6va8PpxIqGVKgNbgIwpLInkEPr2Rg7ZVZ5
         DhUmk0uLzjnlZHDJavnUKdRVUAgEKyIJALuL0+us1La/gg7MFdTo13Oho/XqrVM9jmTM
         fPPYld9W4mvNCeQjgxNTgJgrvvprYSM4fvTEc4zahXoHiRk+jVeESiWFvfeF2XazP+lb
         E32nCKt4sSGX+Pg9683yTaG4X23yMgJrw6hqXKiXe7xHzGzKJqWahGmFfLktzMyleqdz
         VXUw==
X-Forwarded-Encrypted: i=1; AJvYcCXj17ygrXQF0icr9YocXoa60f7w2tc/UA7DW9yZoEutaV4RP9vcG9uc6c1uYIM0RjFi8rGyiKLLg2vPSVX+@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMVJDW8ox8n/rUL+HLKuGFwKu+KmDlQ+45zC3iV3INA2iZKgS
	ZcZ7TzEN7lQEr+vVP7V/TrC1PYNh3Tzon+cQOM3ki583A49EewjA2IFcq0u9JDd4hC7avJmUfUj
	YvHVWYJQVbkWKbaHUkZH38zAZkbgLA5fCLrF4+G5ZEFYdhX7FM2o6WucIfk6oTiAOOv6P
X-Gm-Gg: ASbGncv5Tj/Lq0HPcUYUz9s8iZYO3DNMvHIAWCWy/f1Z++TLCjnJOAEF/KWgibVjhEU
	f7Y/y4F+LLFOkHrusio18+pcmgQ4EHY8FIaHPbE0QgijNm79rQz2aQAnykNE6Eu18EZPBjzpDGx
	4dbTFDZZF4Z5l+dYVQ9J/XNwALACUhMaiORSc3NE3f/hX3udW+zFxvEkvjGzaBgGDXKkzcdEjzK
	9wAIThHpOMtAkIXVmZc7//wQIoiQ1LkKXxY25MyzxDUk/pbJm6kn0ZCpr5wpxFiQ2MmKySg2bmY
	yv7Wsfaia8r9KLoiji5WaYa1kbeZtHbc32XyvLb8+2u79IXgC1NvFDoN1c3T6Kqs9TOTuYgcl82
	W/pWl26TPW+nsyTsNWA==
X-Received: by 2002:a05:6214:b63:b0:707:4dcc:4f56 with SMTP id 6a1803df08f44-709796abd94mr18721976d6.8.1754485005877;
        Wed, 06 Aug 2025 05:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfR9Z4zfNZbubypCaNT4t6gxrEqBn7cwk8E5n1N8Nu8bR7i9WrLvmOe8gMbV59slrbJZLEPw==
X-Received: by 2002:a05:6214:b63:b0:707:4dcc:4f56 with SMTP id 6a1803df08f44-709796abd94mr18721716d6.8.1754485005351;
        Wed, 06 Aug 2025 05:56:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2d554sm10031187a12.27.2025.08.06.05.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:56:44 -0700 (PDT)
Message-ID: <c62c2744-0d07-4fe8-8d2a-febc5fa8720a@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 14:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
 <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=6893510f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=CykVZ_nljMR9ycAI1QEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _canHwPVFZXlUwRXyPY00yaNfcXtjCKL
X-Proofpoint-GUID: _canHwPVFZXlUwRXyPY00yaNfcXtjCKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9xdrpCYqOHvP
 1y01oGy9f2k3VkDmG7z3PawPTMP2qWIiB1y1DySz727ycM/lk/HM6Zxjfr11gybGN40H/XxL3kr
 O2rdYDHx8UKMAoYh6wJl26+H5UG50NrCQINuwtRylrzZF4WMjtYsqIsBfZ0MO/3jHh7cmOuzRjo
 8/3xOxlCk1yUMvztx5vsIv49pro2Ngdg2VFOgaNDc5Xzp43wwJx8NPm55S6yQJcEOxyv1YLqgIH
 BsJs4TJ03B6LtvykKMvIcKbtfrjTIU8D0ee17RYQb7Q7mr15+ywdAV0VZGpOWsmCYuuOcLiDX5s
 wYQ6rtt3Fnq/4FClob8GbGuq6/feKB72f45z6FJhSQKzHG7Q/+/DA83exkHpUaPp78DjZBOTF4I
 uVZkzRDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 1:14 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
>> Disable of AES core in Shared ICE is not supported during power
>> collapse for UFS Host Controller V5.0.
>>
>> Hence follow below steps to reset the ICE upon exiting power collapse
>> and align with Hw programming guide.
>>
>> a. Write 0x18 to UFS_MEM_ICE_CFG
>> b. Write 0x0 to UFS_MEM_ICE_CFG
>>
>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>> ---

[...]

> 
>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
>> +		ufshcd_readl(hba, UFS_MEM_ICE);
> 
> Why do you need readl()? Writes to device memory won't get reordered.

I'm not sure if we need a delay between them, otherwise they'll happen
within a couple cycles of each other which may not be enough since this
is a synchronous reset and the clock period is 20-50ns when running at
XO (19.2 / 38.4 MHz) rate

Konrad

