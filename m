Return-Path: <linux-arm-msm+bounces-63684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB2AF90AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 12:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9BF1882B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2CC2F272C;
	Fri,  4 Jul 2025 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFDiprCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D592F2703
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624888; cv=none; b=D0AwRZ+95KlAtJ1T8ZGFsrEwsXHAKajCgMTzqEd4cY3+EhrFgCxk1NNNdT0cn1WGAKT6BgilBh1QzkUCvZRM/MiwqzAQU2y8uAqd6qLJY3yiS0oNu0ylplaqNDFmTL2KDhhqlAKe5EKuRHpqctt6XuepqmqiIGDbjSz4PUuXiBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624888; c=relaxed/simple;
	bh=G/e37K30BtcmlRmYfZxP0u0F075QyuQgrrhDDUK57+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFvyd52vLu/Tv+b7f9dsYibyccBAVJm3e1R0HUByYCg4jLjy61bmsbFPjtp6Gh2w4Dj04/6sZHlGrOZ1mqPoarz04I24Oqok9s8SIMMlFDHZsDcsrioiMkqPmIIXgfKBfH4M7igmY+1CUACfufedm/IYwtVhsJt7NfvyaT8YKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFDiprCT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647wgPe000442
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 10:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcYhwg2H/XHGiaSGX5T/gqglxK5liyG/eBHo3NygJnQ=; b=jFDiprCTR4SolVmp
	XLAWECotUU907b9ehU9ztjT74CAmaigOUirsmPSc5Mr/rzEKDqiBJm9p1gGQBiOI
	/HoRnb/xjYDEmY3oJ/yT/fWjP3bsD65r7g3OQqcLaWRUYPz/0PNGYjKs/ciuX2vR
	gqaG6PMJdksxUk/yFFILycPuin3eu95MmVJcla7Yr6sT4thXJlub/peoLwNwAsJt
	jOHXSvRbHNq/dWZVpgvJdTNkWavM0UV6HcSQBmS/pwSab16F8V7y4EDrfREk9SVW
	YpdrmSTUULLyt7zcb3DOXQyUFTttL+HU+ArpJEHSxRYjAOzF+qzPQGU9WcCNS8RH
	K7wf8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmkd8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 10:28:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a804126ed6so2427171cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 03:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624885; x=1752229685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcYhwg2H/XHGiaSGX5T/gqglxK5liyG/eBHo3NygJnQ=;
        b=KtJqOAaAjJBargfgOKYw/m97aLI0/R50L2KhTrKyIAiPBNG7c/OIDYggJIDxHBC2s9
         iw+X7q9Wgevp3YcrLtuzXZfrhzTvefxT4RizPLvXN5+9t9NN46aLq08UlG46x7NR6fa4
         LYerLlGifd/Ou97AIZ8hj9dpS0OIjgPFIo6zKumQpY18/0koX4WBKZA+6V4JVGev95Bz
         h5d/qGJaV7IPEahEiEs9litIFCQ3aaKNZ+8TjkcYzqgtJ+7jsPZhY2fLQuLadtUygTMN
         2bnFlpzZyR+x43ycBp9nGuPl/W9v3zrYLz8YnrY8xE3s28T4QM71dm4p7Jeo6/8N8eZ/
         +1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXXRc8LuLONJBI6SAkGG1i7Yh2w3YkYfbZux8de6Tn6nCOWGwZq6eVhnENh6WMn1LRE4WydRn+x7U3X1s/d@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyQNoD723axQDSnZTuvuZ8xkO/Veddx35oaevHUJhp16xno38
	CvgSAsgxSG4Ivj60fV7JHoEw4JrNaGMkXss46yslPwbs2XIyUTk9qp2FoUl4SMelrYPEfRVvBsI
	gz92zSnflZdeg+iEi41QBma36ReITS5ewTk194mdn4rgDqDKzrblsTe5CX/aAil16AfG9
X-Gm-Gg: ASbGnct7rG5l2LcdYVcqlTOy4bHXb4Sc2Y379r8UkA+IcZYsmTPOBkkWbEMppxg1VVT
	Q/ejSVJFazvPuZdWA+LKM+xiNt68aBN1DVA6Dz9bIN5ohqh65r4qelS77gxb7f1CF4jq84yETfq
	fYr5Zp3/gsgqtTYUYQ45kVFWjDU6tz7QgZMvHRe98dc4EOwJGQvWKQqmGWxPt6mqwtw8/13z2Ds
	Z6eMZI0TOuU3QwreAI0oqklkrBPjQP9ORdUqZFUZNrieXIwrMGKahowrA+tSwo0YJjxuGoJvP07
	6gxcdCMIgzSv9zb3PzWA13ejkzk2oOhewz17kCOvWJdLvri5YNGvLMhQ8WYhGMryeudxNP/gKI6
	AwVBmWg==
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr82923885a.9.1751624885118;
        Fri, 04 Jul 2025 03:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEepMErcR3kSl7PpdDimjsfv0t/HHqo53Oh9ZaV5I2CnMfyJ6V0u/KZvLGfTyKT6SaxB8KzvA==
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr82922585a.9.1751624884534;
        Fri, 04 Jul 2025 03:28:04 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6676a2sm1134235a12.5.2025.07.04.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:28:03 -0700 (PDT)
Message-ID: <8b7e8174-38e7-45f0-ab34-c8b0517a9f59@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 12:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867acb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DVKtXGnjxsSMy4abO9MA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kx-5UC7WLyqesSIL67EivJtILwpaRd8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA3OSBTYWx0ZWRfX4vFnudBRwy77
 aLGq51fIUsNEektlJNP94/N7mRtOrDWgJ3ZFjmPPpiwvzWO9nXQ9Z26/JFoCVlOTZ6zM1gSb3sI
 3MWm9w/NSt5CjgyvHUVLat9sG9ONSHDCHBCjGc2WptMMGb6eS8Rajjs0gSemTF8dustKdkVAZvO
 Op4OMx5KlTG5wEABxmzWSjRMDkF+dPP5n7Gx7S3pTPYQ/Vrrg9Ar/ozEX4Aov2NhHlOOTkgFSWn
 Ly9h4IwGHc5Io09Lop+j2vqSJvyOyCWUogm6eu60aGI42eLUSQTyKnFh1+Em6b3wBoLSOVHbUm1
 yckKgn6dfBj+HEKxtSLbpimX2U09Nd7LvRQcw+4Ljh75Cum4/k0qlW/1tVBmDCbs2gBws18gXrX
 bOJsbXGW3wyRBkY/zJXK1hSWnmdNilTimZdFiyhjZcMzOG8x9JkjgGdQdemEay1eWPlZOyx3
X-Proofpoint-GUID: kx-5UC7WLyqesSIL67EivJtILwpaRd8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040079



On 04-Jul-25 10:23, Bryan O'Donoghue wrote:
> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
>>> I still give my RB for the series.
>>>
>>> To me the only question is should it be applied to sm8550 or to new SoCs
>>> from now on, sa8775p, x1e and derivatives.
>> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
>> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
>> once we do that, we will realize that it also changes the ABI for all
>> SoCs that support either Venus or Iris.
> 
> I think a dts change is a non-starter as its an ABI break.
> 
> So if ABI break is out and reworking future dts to allow for a new device is out, then some API change is needed to allow the driver to stop the kernel automatically setting up the IOMMUs, create the new device as a platform device not dependent on DT change and have the probe() of the relevant drivers setup their own IOMMU extents based on - probably indexes we have in the driver configuration parameters.

FWIW not even counting the address space limitations, no video hw
binding today is ""complete"" (with all related SIDs bound, secure
or nonsecure)

Konrad

