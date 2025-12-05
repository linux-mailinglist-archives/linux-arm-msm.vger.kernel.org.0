Return-Path: <linux-arm-msm+bounces-84490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65940CA7DDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A5AF300B2AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4A032937C;
	Fri,  5 Dec 2025 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYrBWUow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6zTz3bl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE306326D43
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943146; cv=none; b=b68ULfV34z2TW/wawL22SM3g6ywHG69aYb7T/xUB2/HjEHTUGaEHI9n8cnveEECCCKLqNBu4yBMsA3RD4M2CLbPepFspjLEVytBqDfaeUMeQYaACzcvznBLJQDpNCvFmheDIq/cG+2P/FhaP3MnssGwA7PJiwF9qhYEOoBThWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943146; c=relaxed/simple;
	bh=AT91pSVJuq3JhEAxKNtxBq2JBa85Ro5ug8H81fE1bFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oxeo9WwisKQTERbjMmmoWQGz4a+X51uAGGXrczssNmKDladdZwXrlKhkbK/dgy6kApGQhV0b3NwkmaMu9Q6Klun0r1aTFYi/dKNumj0ILlFw7pt4xBzbci/7L+fjjb62YqyXQr8R9+/JDR9KGsqXovyuJA3EIJReoi1qc0q+wsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYrBWUow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6zTz3bl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5DlPNm473756
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=; b=mYrBWUowCghcJ3GL
	Ky79nPpkT+wzspmjazyv9ts0CwRO5STry8At4o1B1R3qq3OnqaRlMsZMOKrmPxAO
	2YLSRonQlMnr4Lf4g8DkzZdbEe+uVrmxI+1nDj0jmIHeHPO9qNLd1IcEyOF6o8f/
	yJmFv4H39uHe5kqMOWq0ycFruwrtoOWtcul1Ia/E/vEAYwtbKBvzT6xY9SDY+f1t
	roRJvlSqgDQlfJiKUUtZC8UvXJYal1MV16G5ThBN+g9VK/88cSJKMnXoZwJovvph
	Ih3SXjHoX9TNzAvso/Q9YdFoZF8Ila9lH/IrFIRXOvlFxpYfpqkygXyQ82MrDPlJ
	rYs1XQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ka013d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:59:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so3627416b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764943142; x=1765547942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=;
        b=R6zTz3blA0NUYgy1iuNwdRIaDGZtXzj5iJc6CnmUnD1Z37o3hEDnK08FqIS29q6twZ
         ldzxULBLet5cp2x/9RIhKw96dMI/3qb8lI8E3pYDB85c3tQWvEwlu5eei4j1+VKNZLCV
         g18Cs/LTQTKuDncHaOPXBej4YEqMzGWwngWP43mZ3e4io15DhuKbY0t1Lt4ESOS/f/zQ
         OFfoxAKF+SRDQtUgWUMPx1WPZyM980aFZaZscdui1gRUQHYSd05EoFgoMuR9R7q9sHSF
         yTNzYDOzv4ry0gUNQu9FTaIAYo3YrGLMjw2Tmuq1UV1eGbZ14aQoYpLsueFzUP9mk5SE
         WygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764943142; x=1765547942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=;
        b=j3xbeWnS2t2T6Y+ulObDL+xRnSz0Uyy1bNlOpZZQu8X5v0OLRU4UPmuqcwgRq2fsLh
         OywBqPAevmhdsEF/PZqFAB0zWJJpsbATpfb0w23YK+tnKhaCMk0n8zLerSbN0Fu2ZbSe
         lwpAN7R8+Ii0Jh7FyAN9Dqsw7hwYCzMqhT0qqpYRGAf6nTiL+57II3imWiALsNKILvh/
         sKYefZJOMRQKHWQZHQ7HAM7I3a61TYMv2yYkb3nEVRl12z2KcQRgvNTF0nTbIIwhZtQY
         chGdwJ5zYok2o5JTjQ8mXT9SvRjNzTgObVRuyb7du04fVepfI/LD8ybncGxc7R8/CiXH
         JQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW1plS4WR7J4LjUrtMsRVDcHGGz1cWtT/Z1KgHKt+l7r8rEyCUdElvhEdLm1PRKaz6OOLNnYyt+pLeM+VS@vger.kernel.org
X-Gm-Message-State: AOJu0YwfUD8gmvlz0yHFHq23FIsNhFysKTF9eQtykzKGNDj+DMG/+NjA
	gMTfRDj+RMtGWasOFFWVoeOUsDDw7XBcIha8mEP2rzwG0nlTQhlALk7SNcDpLr1VEg1pL5F19RF
	+T1VLV0ZyU8+AOjI7mdYyauFYjxx2Lgkpyfcc3AoDnRbMMKG/+RShonBp0lRZFiFWvkEr
X-Gm-Gg: ASbGncsjG4Z5ISixLtmzLvVFJBzSjCz0/Y8F2o1WKDyJ+XzVkkdkkOpJvFjxvwbLkVq
	3/HPay4wit5N6sODp9dLFO6NtYK9Dhx+9OJeTOMVh9zdMsxvlAkvKpd7awXhBNGvMnrNm2zZXCB
	7oTE5qEzrGTiL3qx+hFnMhHfKgXhc9DqkKnhSvRP4CbPYM2hl0qKZvqiqjZhFck+jA3z6Y4CKlc
	8GZoaTEKITFdEtqJvnu+Eb3msbLdbmD+FVnRz5zrqZNYgkTkl8Vmi7yxO+Bu2KiJ1ds82ICufTF
	FopA15/rr6JWb1MaJg9EhC/7CCURFwVikt5W1o3chgnHA2BwHrOPNMuiETt5bJe73hIJ/SZcgeH
	PNXoGVEq8PgX6fFwJ/VPqK/XnhkX6rRLrog==
X-Received: by 2002:a05:6a21:6d9b:b0:366:14ac:8c6a with SMTP id adf61e73a8af0-36614ac8db5mr264909637.64.1764943141622;
        Fri, 05 Dec 2025 05:59:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIN17bdoUP6uMMUJ7SDlvyxo7Bng7d1r0V3Z/Gg3ZRXNxJiMHZaodSHJ8uBr3BUf6qxSgK7g==
X-Received: by 2002:a05:6a21:6d9b:b0:366:14ac:8c6a with SMTP id adf61e73a8af0-36614ac8db5mr264873637.64.1764943141147;
        Fri, 05 Dec 2025 05:59:01 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a2745c43sm4855199a12.29.2025.12.05.05.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:59:00 -0800 (PST)
Message-ID: <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:28:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
 <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XVTmurjEuDx7jdei0k73JPtiaCCAJ2aQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OSBTYWx0ZWRfX0gbGPsYfVbhn
 4btry/3FzvUFADg6l3Hsv4cIr370iORdqhJkPD/wXdS9GXfwfqpiDCbCxInURD5P8DYYTK9oGet
 W6qPmyM6a2PDYjK0Ycv0GUTDYgqDIvXffvQS2trgEWHarRIHm0XTFy27MeFi2D4tm+puQevoMtA
 UiVJwF/X5a8WmsK9wkxomqr/vGsR6IEIr8kvrcHKM3C6hYBnVz+arz86hToZ+zrR88rqX7BlNXf
 7XjvYA4clVeKa9Jj5m9nkpZyrAjNuL5SLbxLc8Va7U+LicTidPqyQK4kDCVK84ffBU1QYNvLY1+
 IUR6qX5Esv8vtI+CUB6uBIX/WbiWn6MgoDT9W4ag6m2fjLm3Ue3EvG7y8bAoXGCV0ukyEo7L0GY
 FA/6R5nwd95J2UySZik9NZvrz3FCqg==
X-Authority-Analysis: v=2.4 cv=HOjO14tv c=1 sm=1 tr=0 ts=6932e526 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fzXiC-7nnnm7XjcqKBIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: XVTmurjEuDx7jdei0k73JPtiaCCAJ2aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050099

On 12/4/2025 9:04 PM, Krzysztof Kozlowski wrote:
> On 04/12/2025 14:21, Akhil P Oommen wrote:
>>  
>>    clocks:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    clock-names:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    reg:
>> @@ -388,6 +388,32 @@ allOf:
>>          - clocks
>>          - clock-names
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-612.0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GPU Core clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +
>> +        reg-names:
>> +          minItems: 1
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_mem
>> +            - const: cx_dbgc
> 
> The patch overall gets better, thanks, but I think I asked about this
> already - why you don't have the list strict? I don't see reason for
> making list flexible and I don't see the explanation in the commit msg.
> Either this should be fixed-size (so minItems: 3 and same for reg:) or
> you should document reasons WHY in the commit msg. Otherwise next time I
> will ask the same. :(

TBH, I was just following the convention I saw for the other entries
here. We can make it more strict. But I am curious, in which case are
num reg ranges flexible usually?

Just to confirm, we should add this here for adreno-612.0:

reg:
  minItems: 3
  maxItems: 3

reg-names:
  minItems: 3
  items:
    - const: kgsl_3d0_reg_memory
    - const: cx_mem
    - const: cx_dbgc

-Akhil>
> 
> Best regards,
> Krzysztof


