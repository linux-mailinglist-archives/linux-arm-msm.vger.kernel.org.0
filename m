Return-Path: <linux-arm-msm+bounces-64602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 904CFB01D82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CC8EA43B52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C6D2D3EDF;
	Fri, 11 Jul 2025 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oj/bsEP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5F8299AA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240627; cv=none; b=eLTNchFQ2f+TXGaMSuXyMJhGUxM0d5aGRtXNaaoLgbhnhXeaqn+WYcMyhJl892I38ee8iEr1j/8ncFDCHvgc+NUhHSMZJtOce4u+Ddy8Tp+RWvBXpRv0p0vgwSgcCHmsdtR8OshC6usIKP/t0ffhaJeBiUXCuJO+dNqyZmQ2R/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240627; c=relaxed/simple;
	bh=RBviiJM8e7A0n90vapmlXNzmXiF33YX206n+gYRNKHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gp6a6MhuIAsHSMn7PnhpFKwl8UUI8zFySgJr/Un0dRkvRnYBoDQEQM+NYBkieauWoCV6NQYYvmwdVG0Yt3BsrC7Q4vDGvpGTHR6RJl71LekBggooXIrz2OC6pKpDTEznUQIFl3AOypbzOwQMPvkNJ6vCAJhbmEXZFRhbePW7yio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oj/bsEP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAi0gg012032
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugGPY7HB1MN48isl0Ga4J9P6wFQAlkyxD2Wpj5v5zAo=; b=oj/bsEP2bmM6cLM2
	49Wab/6780Rf9Me254aXp+8YNArnkVf5O4ZBPSjJkrTP3sBEbS3QSdW76PPnF+9y
	nL3/KxFeOe8y9jB3+RI5DIfCUqe9f1W1ZPD7GbMBWHKvAH7cXLGT6j5t+nEa04hm
	e05KjBxQ79waKmTjXzY/hkoRHd+ZX3q9Z0495PuOMNot46Vq19+n3AAKto1zS4Gd
	EXCsFQme2jp2/fEspARG8V16SISI4pSwBrvbAuE2G5CrjSiFZVpEGIl6t+lv/SJ0
	s3VAmU79VwK0IsPoNhXbEpHpmKVub3GmapFNE1lH3fOTtkXPXQ+4aZRJQ5/k7pqZ
	YzJsFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e0p4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:30:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e0003c5851so9265185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 06:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240622; x=1752845422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugGPY7HB1MN48isl0Ga4J9P6wFQAlkyxD2Wpj5v5zAo=;
        b=HO0EYe2hokW0p+72Xd1cRYiLmmhq7PErW1+h8LhJ+Y4SvJYLnsazIIBAQgZuJaZe/2
         f7RB4R22M1jYZbMPMtJIjJbWwwKginnHZUAcwPpsTnKx/SwF1a/qLk5vMhfg2i9tCkFQ
         m66BrpDNIvpC2hgLhNuyLmA7VaMm19BbNBfTn1pVu3bhkzONhOSB+ydjzR4IIGDaynvC
         jwrtZlJJZq4h6Jp10zYFHMp4pNTn9j07ky3RcU+CcuXoPb58kJofg/Z9zbMjRbBCnG5J
         4PdXlNZuoz+vCAiXFgt18MOf1jugxsZBzYvdyJlDvm6Z1sUrH6CW8nC+OYPHIOaSGzVC
         0O7A==
X-Gm-Message-State: AOJu0YxHZmA7EEpLAqi4hUCtrh2tH5lvz41fUg2yQwBjFQMk4HrnOFeb
	1PjlW1mB09ICJ4dspyPt9K6YVvQX5EZ+rJ5TcUxuNzMAgaEtGLb9tfFVMsgbZdcsXL6GocsWnVN
	bLmlyKI+XaPDhPnvktT16hwTcjvoROT8vSz3zzwwdT+/8fhGHX3IraygcFawxKV8XGOEi
X-Gm-Gg: ASbGnctPcd3Lfu0bcOJFoIK4JyGiPYn0kFVFcSSqwlYtqrFuh1OWOm+1Ju0nDiGbOt0
	9JzEkSyI0vNNnfrJHFAUge33BTpEH2StVlvVoiF6/NSz7isYj9Nn3y6nhnY4roPwCu4ypNgA0Rm
	OA/l5k1rIhoj5vVNRBHnV4JkNJXpkgv/iAFBRZE+oyYUcvImgUJRQKJ1Yv9CtZt7FGdIRDZ6oJQ
	fUReCQAb/VXGi81VLuK80lb2VDsmIojRXPo0axNnebJ6oAaZ2Wo1lPD/ERpuJsMn4Ta5y5YSAMV
	ok7b5CMjRa3jlz0ltS8yXvr/E+Gg7UBFN1ASQLoYnTYZdgHKnwikxTFh2VThkRi/137DqEUJIAm
	wF68LPtE/gzXkWAreqNn2
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr163374685a.4.1752240621641;
        Fri, 11 Jul 2025 06:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsp1g8FjvQHBY+1zEIqsJCVWoSQT8u3SuCm/JjGfMzQL7BPTgiKOwfjtpcw4oJxyfJ1QjdOg==
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr163370785a.4.1752240620875;
        Fri, 11 Jul 2025 06:30:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8291bbesm292303766b.126.2025.07.11.06.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 06:30:20 -0700 (PDT)
Message-ID: <493987e4-2b1a-42b1-af5e-85cd9f2a5d7c@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 15:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve APPSBL build
 details
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
 <3cd5864e-e6cf-404f-94b5-b85866086d76@oss.qualcomm.com>
 <e5bb0197-70e4-4b4e-922f-baaaa2e514c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e5bb0197-70e4-4b4e-922f-baaaa2e514c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CN3O8x-xcTAWEDbyQVXfR7l9MKCs8def
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=687111ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=AoRLLdadn5v-kRkyVHkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: CN3O8x-xcTAWEDbyQVXfR7l9MKCs8def
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5NiBTYWx0ZWRfX0mxe/qkUoafn
 dDiglP7vicgaK1nvdBvqD1YWuWlq0FdNGg98DLjBhwhS56qQQ8JYOfRXKXIki5OpQ48yX/09zup
 0rOapAva/dzkfxfriQCZ8/n1rAouuf6GVd/jPbNttKOZj5mGJ5sYDxJ4S0FzEddZMXnwDgTkVL9
 ctVjWrIvVVMaFB1c3BMa8436zn844jI40di6Jl7g8WmZg+QUNtHYqLUB8zIJT7ju4E/cocjSo51
 20KpdeFgaRmJOwo/QmZvqgAY8Pcs5bhaQvO6rc1Ni//dlaPbciaLmvt+l/ek1dBxyMc/ZD9rUy6
 GYpsm2tY3z2HF2Iu4ZNu6RibU+HeudUo1GKAzFZ2GVz7cIQF6wN2gRR2ZLQdAq39c9+1PDYInXu
 ZIJMGKWnT67iRr0DrhHQDOgzOauOwDADBnEDX55vJmzgL/eEw7P9wo+yei0l8b0mnQhcE7id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=554 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110096

On 7/11/25 3:24 PM, Kathiravan Thirumoorthy wrote:
> 
> On 7/11/2025 5:41 PM, Konrad Dybcio wrote:
>> On 7/11/25 1:03 PM, Kathiravan Thirumoorthy wrote:
>>> Add support to retrieve APPS (Application Processor Subsystem) Bootloader
>>> image details from SMEM.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> Can we expand the driver with all the known IDs at once instead?
> 
> With respect to the IPQ SoCs only APPSBL image detail is missing, which this change address it

Next week someone else will come around and say the same thing
for e.g. automotive platforms

> 
> I can expand the list, but unfortunately don't have ways to validate them. I can check internally with folks to test it or even send an RTF. Till then, can this patch go independently?

There is nothing to validate here really, the bootloader either
populates the data or not

For now, this one alone is good to go, but please look into the
broader scope

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

