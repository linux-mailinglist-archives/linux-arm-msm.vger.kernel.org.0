Return-Path: <linux-arm-msm+bounces-77504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A49BE1356
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 03:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C50019A4158
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 01:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CED1F418F;
	Thu, 16 Oct 2025 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hd8BpW63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E333A8F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760579869; cv=none; b=B9LGk5rbDj92VC4vdzZEXw+tQ2gNbBoi3oBNIslHTh8FMITKTAj3c5D/xK6GYWhcDqIgLuh/ZyVVeJacofQ0Sv1w/aSNAmpxDgq//b55bev+ziAuSNge5480Ju1dH9TKA1Rb1Z2+Vg/rEKvUa8UAVxK7GQAikg/hCw60Bwt+B0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760579869; c=relaxed/simple;
	bh=IlqfZYOkclJozio66DYG7OYgRXYQlBuKL8VU6g3WR5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehNO8qgQKWCyAEaev2MwDEv+4yLlFodKIVyJcH2jxvDwy11kBnHu0I0OkkPwbQvYH3ITX9DgVTDNuak2dOmnXZXsD/26ywUMCMVB6hxzAftwRS1cMqQTWWUcYlgXaYu8taSdWTeoQ+BTNP3Al4lyy+jdWcvAhzV3XHVfFAqP2pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd8BpW63; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJ9Sxg016695
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 01:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFKFkzfdP4tXFi/0ymgZNK4f9HBW4SXK15XqkMQS4eg=; b=Hd8BpW63ejTcRndk
	ioLHaXxOS69bC50fLat0MRB4ixQS80B43f6oTy2U43UJD4G/Vu1+gKLNRe4qzteP
	zu9sp8LdFQlVH/2PddvqoIbLD12IphHiLeZsB81fXDSNNyS1sN+OGRwbz8k6gD8W
	gQP/VnOsmH3IUdvOLXT4AxDgFoFnERYJqWgf4B/vN9+fBgk8ikzCD4lCiSf5uK2A
	TG70lVtpBoBNjtSJJgY0l7JwRbO40/DvSKLyEA2faBv4bsx/NeKYavAP/US+jr2z
	UyA4mE98TZUXKD0Qp6j1TBCMFBK+si1WjVAAWTy+gvQ7plOWGwTt+tnQy8rw2tg0
	4lulvw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtbg7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 01:57:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6a2459e80dso159551a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 18:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760579865; x=1761184665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFKFkzfdP4tXFi/0ymgZNK4f9HBW4SXK15XqkMQS4eg=;
        b=QTwRVXhGCekXi2ymrLZNelqMdsZkJPX0mbEbQcT8QnhzY9zMQ/LSrmD8yccmD5bTXn
         jYHIx36f1dOpzqBSVkc0fYNElzQR0aicCdteluW0CltwPccC50OI4N1OZd2aRvYLhPS8
         zDCQaKI5XfDLRA9AHak/jeUJ3HkbYCzA/0jOM78C5KC5mC+nG1FJPz1nBTzZI9gRf2Sl
         reuBTtykpIwtohUNREfXIfsaT1iXqxXd5AIEPcjZHbyZfkCevd47VCtc3Da0yhh/+4Yv
         OZHsfO14hFFSFGpec7rVYco2dliNXcg9mU/0QYxaoEN9/Kydm+g8Wfm+rTpkMbbBS4Ud
         j53w==
X-Forwarded-Encrypted: i=1; AJvYcCUkQxWPztbYTwT3fqNRQLLlc3GYCeu4kE4pv7xcbDCI4Jf74eMeC739TWLg+Rz6ze1qx50gsoRtKZp+hyM5@vger.kernel.org
X-Gm-Message-State: AOJu0YySSBBQvk4vXqaXIcXgJUpYrnqkGl9MlDA46aoTVbmmM3AIkgRe
	9Cxg913TPrs4AwuAA6HO23ADF8fda02lBJ3TtRyqdUCbM3ug8pe9XsL8Tal62zCoP84Sp1H/YC4
	chTMPGnbVdXc6pFFQItIXCymwpOz1Par+rPdcbYvF5kU+EtoYYnKYaO8Ln9B5UWm6EYWk
X-Gm-Gg: ASbGncvBhP9NxmOPrRmxnoAapOqFq03MPiweAHXgCiuAJfxq+FvQnVeeCt+wlZjhZB4
	L2oRVU6vfiGay71Msn7/9xjH5XHzLeZ9sq7ngdFi7lOcUywgKFYSjUxGG10lTTQzmpUjD7qb/TJ
	3yxDs54Us4Xq+UEWfrsDAyWw8Jh3i5mPLPP5SRynFPhNVTt4UMfb6h26CZeHhJ7NTiDy1LiEt/1
	vNuqqF3HpiM8V6lczM5UiOEpafkLy+lU8AQ/JkjEGWbK4Waj9GiprzAkuW83ouWxkI9qiChdjUJ
	zdtCboP4njRHMEfb38cEPicnD97tsFd8FHNFyH7pze2teLiIll675OIMVSGCwmnrRW3plEyLOdH
	ziP8/itkX/4CMis6NGiWmdIm6fZUO82+zi4FEiEEWCv/E+qyanfKngaFI+hQwhz8QOK3TwA==
X-Received: by 2002:a17:903:24f:b0:279:373b:407f with SMTP id d9443c01a7336-290918cbe15mr26360865ad.5.1760579864407;
        Wed, 15 Oct 2025 18:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnvLDZlV6wBkfvT/qOi99EG5lDHNY9fLIFApqLJJBI0OqJ12Q8JQrRLN+J+RuPFy68M+KAyg==
X-Received: by 2002:a17:903:24f:b0:279:373b:407f with SMTP id d9443c01a7336-290918cbe15mr26360465ad.5.1760579863918;
        Wed, 15 Oct 2025 18:57:43 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aa32c4sm10285605ad.79.2025.10.15.18.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 18:57:43 -0700 (PDT)
Message-ID: <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 09:56:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: U5Ih--SSWt1ImBTSWBEjXNDZU6sM6A7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX21/nnkjwg8V0
 3IbfMYXipXGOqeSN/jhi9g8rOTQO0J2un7hZk4M+NupUm9j7ovmScqrwjnAka+WUMesOrRDtBHr
 dGxftedcEFxhKmBZpVjr7jQq8ZsV0moIOBXinPiIq7i2VbzDVuaScftxKWf5jidbrSsfVHmKxe3
 GTB5GZCYZWklO24+/ami5LWiml0xc0/DDwA85zfcQGzIryjqca6XVF1TI0bVrDZfStSSnKorO2/
 QbFn+36j29WyqHEcC8OPnopkpEf/bmGVHVEN/CoYz7t2N3n9U6JBb7ONRDOHsOrXZjaudrc+rah
 dEYYINtxJNPBbodaqbSFujR36b1n4GManiFPzDM/kTGX65WSxeLcrqEnMccfRh8rUFaTJM5jp1C
 MwT+CVuPmELfhX0AgTke1XxyV4pZEg==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f0511a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QmC_9Nfu3_VqyKKViBAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: U5Ih--SSWt1ImBTSWBEjXNDZU6sM6A7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:

> On 10/15/25 05:56, Hangxiang Ma wrote:
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>> aggregated into 'qcom,qcm2290-cci' node.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml 
>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index 9bc99d736343..0140c423f6f4 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -25,6 +25,7 @@ properties:
>>         - items:
>>             - enum:
>> +              - qcom,kaanapali-cci
>>                 - qcom,qcm2290-cci
>>                 - qcom,sa8775p-cci
>>                 - qcom,sc7280-cci
>> @@ -128,6 +129,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,kaanapali-cci
>>                 - qcom,qcm2290-cci
>>       then:
>>         properties:
>> @@ -136,7 +138,9 @@ allOf:
>>             maxItems: 2
>>           clock-names:
>>             items:
>> -            - const: ahb
>> +            - enum:
>> +                - ahb
>> +                - cam_top_ahb
> 
> Why is not to give the clock "ahb" name like on QCM2290?
> 
> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
> and name "ahb" is good for both, I believe.
> 
>>               - const: cci
>>     - if:
>>
> 

On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC 
clock domain doesn't manage the AHB clock but CAMCC does. I think it's 
better to create a new and more complete clock name to denote the 
differences between them.

---
Hangxiang

