Return-Path: <linux-arm-msm+bounces-49597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61EA473AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86EB61681E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374291D61AC;
	Thu, 27 Feb 2025 03:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKrgYt4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52ED1581E5
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740627591; cv=none; b=qEpgpRZHP/xEMO/Bb2X5EuVfKcq9FwBmrpsLU1T/kiy/M6ltq4ZBk64bjBfk0cJDTQ5HogQS+GUy3aCn2yvLnnrDnx4WNNLfRpkXkAcC1VHc8joI8R2Ei3zE4lfjdG0Q1wyV2mvXsUa3/8g3Ka+RA/GaFKFQq23CAbvRcFDTMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740627591; c=relaxed/simple;
	bh=8NZQRl+nsIrBQgX3n3RDpAkQuhuYznIhsac/14r1q9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKlf2vepVlO8o/qQUT+VfSzkKHCmd+0V4O1rZYjSWP50pxndNNBpG9Mc+73fdADl6o46znCn4VSvAaQq0iKleL2gJrUuIykMqDKN0IECUX2tJY2JEGJutoewsfWp8nBMDksDhdPzvJOcMbaGYA2uawkgQvJWSfMfvVyJ/PeYaWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKrgYt4R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGHSLE022634
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 03:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiPDf3NLW+yGvrT10OYje340P3sXo9W1cFDbMr7u/kk=; b=IKrgYt4RXPdwtHLo
	019UhXiNsIh7Ywm6PsYSD9KV4DMzC91oytVuorNMysWTLuyBMcCsnEALSi6u7lqm
	LKc9nC3xN0XwfsFPk9WTzyIYcgysRXKBr1ygEqAZbZHcKze+shwkcXhCT50iVfaJ
	kdi8XG6IxDMstE7d80Rjws4vl3fzBr+AzWBV9tICiFgkeX8DRdMu0cxCDXPy/MJX
	DUTLcg2xLIdGZhoulxr8BOkFJYkyncNoC875tOb5jG4idpK4xdHbkE5Z6h/6L3t5
	yLcBlT/KpTVcT8h5F3NfPx0Luw3GV1tvmX8W+MbDcyJbj08IvTfkpToU3L8OLD68
	eIItpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4526bj1hyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 03:39:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so1211319a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 19:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740627588; x=1741232388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiPDf3NLW+yGvrT10OYje340P3sXo9W1cFDbMr7u/kk=;
        b=tPYhW6tztpbfJEbVomfPUJY8WkQop1kscmWxQ9GjlwQavfpQYMB04CxiSG5gchwB0L
         EH9qVjDVUzmEGjoY/mZkgd18w2KmKdYyFKmr02L5s/diCjo+/GJkjSqGTbqS1sVnoAKp
         cjh3yBYN9QFhJu2A+dGS5kY6y4S8qq6PhCeL4mdcAOTr4mbSSyin0v/WFYlwdKJ/BVog
         9IYSn13jy5jGJTWZ/gIOSa/Lr79A7ZUfMEfGWowi4sW+Grby68xptTukwgy0Aon/BBdU
         ynn5Bd8NSE0aYBNZF5oU9/kurAlhAqhEcNpxIvZlg4ikODHh45ipQ3meOzEGfqyBth/Y
         bHiA==
X-Forwarded-Encrypted: i=1; AJvYcCV/RaQATYzlTiLbe6nyEPNqIoV9LaFnNxVmUUageyRKBah7BDy2NZ2aIBy7iY6ZwHaFe65Ydr2DCwFt7tsN@vger.kernel.org
X-Gm-Message-State: AOJu0YySMAb6ptw3pN1w1iwXomyhSo8iOPmmQFqq+orh/9tkbDl6pQgK
	g9/UNT7MvU93nvKcZ1XDvuNM0HDopRHQ+ju0Bp1KckAxwh4HPbPcjfgsWSawejCin2IJF7i5Zup
	rJ7Ix+FIX8UAGiW15xfRh6j0GmoQPRBNkH6MpTu0+EnSnJRmoJSBCsHDUOeRSD6UQ
X-Gm-Gg: ASbGncv7PfG+75zQ/WSOL3jRt63zxjkKzeRtlALtfMYM+c9RKcBNmtwB/wHj6j09RBo
	MVkFYNreMHwXcmhYq/56MCFhu3XE/u+WX7Iu1hgi085+tcSrwtfCd3SaNoDjgpRgUUFge8lAt1D
	zf1GNJQXuN7xtTu71xLes14MrYeB1RHws0AjT4d8bIHTkgNczYKG8S8PolUcJAEn6luDbc5jYcj
	B7MlF1DUGkx6hunaEP+MRAwzugaelKHYKuf6/30LY4W74wqYn2NxQfkhVhN3EB19rpbmCIb1Tb6
	I1+aEo1BbhaoVMYunvuIroj3mn7gNXlpdRKONKeE/0R4
X-Received: by 2002:a17:90b:540c:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2fe68d064a4mr16813408a91.33.1740627587927;
        Wed, 26 Feb 2025 19:39:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+W4t33FA3KMwH1ikkC71nGMT26WMp7/JlR/4/dLA43Wj2y4kkKdxpe47SOg4q/G/BiHuvwg==
X-Received: by 2002:a17:90b:540c:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2fe68d064a4mr16813385a91.33.1740627587569;
        Wed, 26 Feb 2025 19:39:47 -0800 (PST)
Received: from [10.92.199.34] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350531a43sm4162105ad.238.2025.02.26.19.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 19:39:46 -0800 (PST)
Message-ID: <dd16f56b-f066-44b7-b5ff-baf608e0f87e@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:09:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 09/10] dt-bindings: PCI: qcom,pcie-sc7280: Add 'global'
 interrupt
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-9-e08633a7bdf8@oss.qualcomm.com>
 <20250226-enlightened-chachalaca-of-artistry-2de5ea@krzk-bin>
 <t34rurxh5cb7hwzvt6ps3fgw4kh4ddwcieukskxxz5mo3pegst@jkapxm6izq7p>
 <e83bc594-5500-4f76-b3d1-96f669515c24@kernel.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <e83bc594-5500-4f76-b3d1-96f669515c24@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZLHMzYI9qte0w0AMLNjNfkJsZ8q6JrLF
X-Proofpoint-GUID: ZLHMzYI9qte0w0AMLNjNfkJsZ8q6JrLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=704 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270026



On 2/27/2025 3:03 AM, Krzysztof Kozlowski wrote:
> On 26/02/2025 17:29, Bjorn Andersson wrote:
>>>> @@ -54,7 +54,7 @@ properties:
>>>>   
>>>>     interrupts:
>>>>       minItems: 8
>>>> -    maxItems: 8
>>>> +    maxItems: 9
>>>>   
>>>>     interrupt-names:
>>>>       items:
>>>> @@ -66,6 +66,7 @@ properties:
>>>>         - const: msi5
>>>>         - const: msi6
>>>>         - const: msi7
>>>> +      - const: global
>>>
>>> Either context is missing or these are not synced with interrupts.
>>>
>>
>> I think the patch context ("properties") is confusing here, but it looks
>> to me that these are in sync: interrupts is defined to have 8 items, and
>> interrupt-names is a list of msi0 through msi7.
> 
> interrupt-names has minItems 9 in this case, so they are not synced.
> That's my concern
> 
Ok I will update the minItems to 9 as suggested.

- Krishna Chaitanya.
> 
> Best regards,
> Krzysztof

