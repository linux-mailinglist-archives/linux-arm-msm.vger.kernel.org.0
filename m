Return-Path: <linux-arm-msm+bounces-36915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5A9BB2F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0712B256EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE021B372C;
	Mon,  4 Nov 2024 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/R34y8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075581D1753
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718396; cv=none; b=De76NSIQc2acUGPjO742gyaSeXXyYpuOkqNpuuWz/QhG8iqQ/J92Sy0YYdwFCJBvnV+5Tir63ooz/9EztXiFPDPaXp6zyZN4QK1znGjrxxNJYNkj+Sc7bMX4JsaEBox/l12thpcXosOfa2bH9/FsIGXeKV5DcFx5VZ8fpq7quA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718396; c=relaxed/simple;
	bh=YAbHgU11pEKKzz440oMM1ZrwzPP+qMjnbTNc8Wm74yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Fpt+tTuM3eY88wkS7gxmkQljHPYBgPoNqK/OS97VtRF9pFX6PZn7e4iYQuPbdk3RqCohPy5n26VHRolRm1yjMj/q94UxVrF7jvSH+vjSd8T/rv8D9iOG2ddSOL5FwR+zH9KOLgiyzW21pwrxedcOYDpfkF175e9/c3gtaGjtnEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/R34y8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NPPBX016857
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 11:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoYGNGv68a0vBcqXh4vhD62xBKv9Pt0hZafHCm2iQmM=; b=J/R34y8W65z+PoS8
	8bRgrYPjq4aK28YHWppjlpCILra8Z3f2+bNUUaDFvx6yIwZtvDosN3UMMuuykrP8
	e1KzlchXqYQncryi6Qchy8PxTFw7QLceF8gcMKblnBFkL/O7y/h+I5jymIjud+aL
	cqu0zX5GsKs4oS7nR4WVwy5h3SdI+oMKghn9vlIsNV1yFmed5mIQ1qcv9z9vomUc
	RrG8wzTi3qg2eke3wF5wEOuA61WYPTHuJpQ7JqAQxK71Lx/juVi+fHmfZN9O+OxK
	CwzvDQaoL7mT7SPV6Zi3iqkSd9n9VTKEMJ972BCpJs4J2w5T0OfSAoJ80Ib9IQNs
	mhYQYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11uxjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 11:06:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbe993f230so14971876d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718393; x=1731323193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoYGNGv68a0vBcqXh4vhD62xBKv9Pt0hZafHCm2iQmM=;
        b=LgT3ATlIESBKj0MurWORf7/tzmi1RDpDTKR1DpSssDWbUDFnS8rG+JX999VQ3zTWiP
         ewwf/cOnXCo2ktg0arJKo/E5T8gUwWeZTr1s3WiZmCJ7GCyTbzM/Hd9lNqNr8KTj6/WF
         cb6uOetMTqqkcHud/oqYD20aY6xYd9DqL1i5QdQ9Dy0d+RKq4fxmXB8qX3UaR67Hpr3X
         77I8q1aghpWZVEhgrwJ3niDktKfgvJDI8o8VSEzo//mHOW6L8yjPeRhKPYaULIfe4Njl
         jd8wAUkah1evCWZvKluiOr+zSCQIyPOH2G9lq/+7EN95MZGQw/Ru794X6hhAiUE7eyLE
         UkqA==
X-Forwarded-Encrypted: i=1; AJvYcCUdREoHQOEQ7mFul5PQmcapzrWzpeuGrfww3hZPXYpws2r9JZYCjRclnieH3bF6lHZzwjzxkOgjqIdeWG59@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhjUdX0P0isYJJ4WGoGk+qUxtag/S/LJlm2aB4yA83f02ZDo/
	aD8MXjYAJoqpBUJEB+zHIl31HQf9AXd2qOEKwT8pdrw4TBKVcYhVMJ3Mi58FfLwBioR3svF9Rnc
	cg+sH2c4JF4KHihditJ0nuMMigeQrycIESB60mQRLO9JL02CHSa2ObWTQMw416dEQ
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id 6a1803df08f44-6d185885e9fmr229611336d6.10.1730718393019;
        Mon, 04 Nov 2024 03:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfkcgKh8sGAPkatz2bYCIHC8CTdYMhUrsG7fYzyuiqa7pGOgucfrhsZiuYCGZ4ulbzCrS3hw==
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id 6a1803df08f44-6d185885e9fmr229611156d6.10.1730718392659;
        Mon, 04 Nov 2024 03:06:32 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c4f2dsm538456866b.52.2024.11.04.03.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:06:32 -0800 (PST)
Message-ID: <c72d0566-20ed-4046-9150-04bb98dfe41f@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 12:06:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: ipq5424: Add
 LLCC/system-cache-controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241104073840.3686674-1-quic_varada@quicinc.com>
 <20241104073840.3686674-4-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241104073840.3686674-4-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _JIIazoRElf6AkcmGhEhRwaRIh0z1VXE
X-Proofpoint-ORIG-GUID: _JIIazoRElf6AkcmGhEhRwaRIh0z1VXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=660
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040098

On 4.11.2024 8:38 AM, Varadarajan Narayanan wrote:
> Add a DT node for Last level cache (aka. system cache) controller
> which provides control over the last level cache present on
> IPQ5424 SoCs.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

