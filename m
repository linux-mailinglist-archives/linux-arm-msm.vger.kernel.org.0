Return-Path: <linux-arm-msm+bounces-75472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF9BA8188
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822993C03ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D90D2512FF;
	Mon, 29 Sep 2025 06:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBz9Lq7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B624EAB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759126872; cv=none; b=NLtWkuIQRwlKf1bERxWnZ6Fz59iKM/g28JItw+iC5huz8LfOeiu4IK1gKdj5VvQrn5fW263CTv8NAO1iUuIETSgTSjcnUQrm7t5vW4GmeqOJFnQVjeEdyolNlE28w0dlh/otxsDapVua4DJh4c8UAX1RixaMyUgUXHacd8OpJAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759126872; c=relaxed/simple;
	bh=q2Ex45lu0UO1PvLVxP8lWfrNJZYuJYUaYkJPz++bp7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct7eH3cUeFJsIRRHCASZYEvt0mOgrlBC9wgeFTt0apJW+q5ebdP9chGxZ2TuTYa470lNC6lt7sbUtcvh+sT9yTEnB7SbgpxUrG654NvFTbY3j5dkKBep6yiqbtscEi/+x6+KLv/DMs4yGd0zaP5ZsUmymAgiXnkp/fVGIwOCKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBz9Lq7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNj3x1009877
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5RCAnxQPgz+f42q/uUJ/xybCFPufzjjYf6jemuzLns=; b=iBz9Lq7KZUAWV5e2
	M2gRNFr9+vsxwYogYHviBud2IpabKlqDVZIp38xfQ9RDWLmS6ghYCO2RbJOtrroT
	UrT6chIkaQSSw8VmH/E5qavZtSEHXfUtuPjOdUqerdCSMJWaOzcHJA0lORQyrh7s
	WXnvoCj7puHQ//FiCls57Et4m2cehQ8TpTXyqf44sW3Wx6AcFQqOzVx6C0Bqhj4y
	rZe1iUjb1pKlxN3B91CM5Zpp/rUjzjz/KHE5gFM4Ybss48ei139M2ZsWj+ttlAZY
	nn50H+OCzMEZBD27ssozrEVZrTm9YlXWXB67itOyQHBHWGatMpDBJ0MmRewKTkfE
	0I9+1A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqv4sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:21:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f610f7325so3547969b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759126863; x=1759731663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5RCAnxQPgz+f42q/uUJ/xybCFPufzjjYf6jemuzLns=;
        b=bUZs9Jx4ZxVNUYF87cvJ6XO94eF1F9YqQ9Wg8G9QUlaGBd7z7g+EAIpqU6iRNiWFRv
         RpfDtW+fvgzfTPgUoiyob51+KU9kNhcSz0t34ng3KDdG+VTrQaDkANXEApNcdlx8V5V7
         SaouVNDOmqnJa+WDoTNhJYH/Ysn0BDdYX8Uth2zECJD8S37pkx2E3QbeGSW2M4e95dRs
         tLZb+viZ1d1Xt6XlawhiM+kVZhgQ3hiiD7Cz6Tol7PHFN67frZQwO85BQs477vaNVp9D
         GxMXy6gfEYjQZjgQHmxFX5FUclIepbtH9Hnb49H82LsILwEaO9VJ/8/wxub5Y8iYfYEb
         PXNw==
X-Forwarded-Encrypted: i=1; AJvYcCVKJmlAs5TbwMtKtOa+FLbHv16SgcG5iMMCLXj/ww8Gct+Eguf+g+RtzaNn5jIbjq9uOMtyOeqS7xTNOPiv@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNR4uyUoiWkF8ygO4bcn49VrvmI8Bh57rNm0xNjH3TYv0NMSI
	kWlHyRrZ/eNaxqlcZl8UmEfgFbWiHTU3K08oZBeDqdyb0UIwPIcXlawQcP5Zo244cQ2/B5lpw29
	lGcWtrPM2vKauPn4uyihX8jqzlX6MTg8dWo9gm9EkkZB5LF2A2cQsjj2u8PtF+CCcdhdE
X-Gm-Gg: ASbGncsKsvQ4dBItIUZTlijoWaxRobuN12bPFp/LRuYJzHBDSU6bilt9NEwNnevYYoD
	DwxboecbY91EYiB+Ek6g+WfMWgaWx9D/8RQPWdgOWYE7as1yYK2pleZmqpGy7QIs+rA+AElY3OQ
	AXn5jhc6/5VeRuORl2Y19RkUBXhFpDUL6n4UaBk/oOTy/eJm7DPGzzCFCsqdwBBg5YwAMVe8cQM
	S3bbIPse5DT4xpY+GvQ7O7UzAvSpcZkcSKHRFB5f1+t5RultSdMA7KSFeg1IG7eA3fC+tOzEtWx
	B2Mta7f+kQXNy0gNTDifN+LY+uz9nUlvCsy0DO8SAAV2WP9VQIlAdSuMOIW2VfhpUuhEpY/ZvvD
	DuIDdsEK1ERmCvYKiittz35Fc20U7DW71wPI=
X-Received: by 2002:a05:6a00:23cc:b0:774:615b:c8ad with SMTP id d2e1a72fcca58-780fce0a094mr16191373b3a.9.1759126863006;
        Sun, 28 Sep 2025 23:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyXhVu5YJr/Bl08pETVz+ZdPLkfd/FjtkIFppmpYj1TwDX2jO0Olrp/Qot5cdvw17ItUB60g==
X-Received: by 2002:a05:6a00:23cc:b0:774:615b:c8ad with SMTP id d2e1a72fcca58-780fce0a094mr16191351b3a.9.1759126862600;
        Sun, 28 Sep 2025 23:21:02 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-782634d2a7bsm3892488b3a.29.2025.09.28.23.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:21:02 -0700 (PDT)
Message-ID: <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:20:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 01zTw584K3kNU9nD2-HxEMYkef5yf7vK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX8+maARI+NplC
 46Xivq7T2ekLoauKpQz9ZZl5QP6BrGKz6FdcbR2SGJDNFEivNi2opLd3e7vrSuE9UJ3K5aG2jQm
 Trq4oMRVWXoBMUJ2YPURBaWsm6sbJ9p1Jf4L+NS2CeKt5/jcxC+ZZ/vn5yLKH1P0esknj7t3ppe
 XGwLj9Pop3ozU9qPBgIl5j2ENlwn4odf6Ygrk7kILTv32Dz2UHljBNDRXsk28MGHbf7IBZuUwJ8
 GCxTR1KwY4cKxQ4XEraPOlEnoM+E3+eKogbvmLHBzLSGyC6fKcE6Fyby4r4xxEictE2vVXSLA2F
 GDe71RpGviNmb/7/XGfvFOIQPt5Wa5US19mJHu+008IrywtBRRJoZwBlY8j0dJAJ75zEx+/iJ4h
 BtHJ4GOjP2byius0ElbrNPO0IGojzA==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68da254f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yr-pD6fi0WPqCAYln34A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 01zTw584K3kNU9nD2-HxEMYkef5yf7vK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017



On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>
>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>> interrupt.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index be9e2a0bc060..031fdf36a66c 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -35,6 +35,9 @@ properties:
>>        - items:
>>            - const: qcom,sm8750-cdsp-pas
>>            - const: qcom,sm8650-cdsp-pas
>> +      - items:
>> +          - const: qcom,kaanapali-cdsp-pas
>> +          - const: qcom,sm8550-cdsp-pas
> 
> 
> This time maybe without HTML:
> 
> This looks wrong. This is not compatible with SM8550.

Could you point out what is the difference from your perspecetive?
it is the same as SM8550 except for there is one more interrupt,
which is also described in this patch.

Thanks,
Jingyi


