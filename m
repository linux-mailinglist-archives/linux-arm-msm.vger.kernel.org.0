Return-Path: <linux-arm-msm+bounces-58945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3686CABFA23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 17:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18193A23497
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9478E1D95B3;
	Wed, 21 May 2025 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7IMEbTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1A1FDE14
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842095; cv=none; b=Lvvhhj4tWiHfTXHxbSX8nf/n3pPRsQdW8yimIm8UaEBqeTQfOkVoZJIMWbVsgIa+Y10SOcgiVsN2ZYpgsWlXjBqc872fTBkgw2zVH5Lf8fjXGH0dDQqvnfav8ca2A9RthYpYygN/QREMSRWEdZAk2K4rVCsFWxmTvKNT3ykCAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842095; c=relaxed/simple;
	bh=0Hm0voyeDVNLto4h3bUVaIJA2qzEuKKWBY8Rt1tYC7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzLwZxa8Tj2126XndIF7Uidt4CKkEpWBEWZ128atcwc5uMfXjxUqLqGYuK+Jk3pJMKv68YEbhL7HyczYkmXw1q/YIVV08IaDDbUC63KBYwY0PXwYBqJdv2zNMRnqyGUq+610cUbqB+xCqY9MZXSZh96iF/PosEk1hOXGEnVEpEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7IMEbTG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XxNo032698
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 15:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11xIrqs7y33esKOfbwtRMscbBQ+xSYJyjFlpp1MuMfc=; b=B7IMEbTGShkwi76/
	Ixsqiho8zgp9Eae1mE6FPZiZayqVcz9zQ9p9WgC2WgMqZd2drKbPeGs5swIsjhFP
	kvh9G8MbVBxKyNAvisHQ2XeS5rtedgq+iLDdau/SWbV/y32cyzNgJzi3HbwTR2Q/
	65pwKZMuV+ArOrAQat12+JNHl9B8fnW3MpR4VFXMOvN6K+WdrDIxkl7sAWRbm0P/
	W5CjVMHnW9GrVRQDaB2KIZM0NpbUwdpt3feL+Sn1x8b8NwotyDqJkqTvJ88YfYrB
	/8IUAuS8RAbZkB2W2ABwNj3DTb7ePwaD+ua6Vxhqz10GwkjfRaBbMJc5oS+vnMef
	+mo2PQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21yt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 15:41:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766afee192so194620731cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842091; x=1748446891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11xIrqs7y33esKOfbwtRMscbBQ+xSYJyjFlpp1MuMfc=;
        b=oi+l8GarCBw19j2RWdscjgP2tDyCi737DwPUonKsnBhfVtguY0SmmzxItGVksQd/4R
         O34r+TrOliWmryuePh0cjL5d9LZCvsBWvv3bZb6FxfVIgi5nuXgTQNKO+8m0iFc7ow8Q
         fp3S7ic7VI74B23M68rVqCSHLE6GxLAdq+JeIL7mHLoILsStGW4qPE71TTZNBLW2lGFk
         RAEUlnxWZEgd+yWonp1QjVxg/ycW89c1vrfclmb3x0wsZ6lM0UaTdnvLVjDLhD37w0zb
         HchSyVlvOxxvHoJ6j1+n77IEHc9z6nw0o23LCPL5hNAGhozk8XxyHfx9nFdZxnHjEIHg
         ogZw==
X-Forwarded-Encrypted: i=1; AJvYcCXGgIemennrkAmtBw+GdRKpAMSZeuCBljcGBSmk6Sn3EiDG/Mfz6U1QSdX/vTE3a99YcI4cXVw2NHCkd5K1@vger.kernel.org
X-Gm-Message-State: AOJu0YxYkARlbvwZmkxoBGMoRxagF1Bad+Eusbq74MpPpN6TMJ5P0L4F
	0k64nnoYv1FcAnOC+8uSAnUFpCnTdpuFJf0JZUO7xRrVZbZCN6mH9e1sUGl/Pyj6+o6dryxKfqR
	npeIykJGVQycQeK6dR5vSwfq9dscmkoBUT516RIBmmwH39JRHZxXlb8ZityRwr8WWI7WU
X-Gm-Gg: ASbGncvXDcg4r3cWAl2G7LYDSGSXJKwAPTG+ayeiIQp7M4AzqYifSlgSQUlKgZl/Bst
	tQGNSfW1/Jq4zUqedZ7vpv1TmnGxTVH11GkvgOK8hYIZHNaGG1I6yTDDdyaG0/g83cPtLeLmEKh
	5QwwA02cnRByLTHC9cQp3AFU/s2uiA8d53xLCM3veJKYOuufTKv7inpzH8y3UHsXMpWO3z3/O27
	g2u6XDktw7NNu432sgFdrrJ/UVdiJ2xH8ETPMqaJSsZGvGhC21Q8yPvl5SncHui9pDgIOO0NTQY
	bkN6sfTNWzmDKaewOaBGhW/REoAKjK3/vSXA1fvYB2wCV0mcic8mYvR45ZKoMbSJ0gmhzROGbet
	hIMIcDxPYO8ekOFv7hOASGE7xKS7Bor+ZAuKu8UhscdA7GX9rSy+ivU/JIkf+87CL
X-Received: by 2002:a05:622a:5c96:b0:477:64b0:6a21 with SMTP id d75a77b69052e-494b07d98e2mr375789561cf.23.1747842091612;
        Wed, 21 May 2025 08:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzymVPyAEezG0iALlrdblH7qdHofBk2xTG0MRCZc7og2yUqLNV3+TUUJqDglHgQSrVGu3AZg==
X-Received: by 2002:a05:622a:5c96:b0:477:64b0:6a21 with SMTP id d75a77b69052e-494b07d98e2mr375789091cf.23.1747842091152;
        Wed, 21 May 2025 08:41:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:69ba:b852:d3f4:8957:5a1e? (2001-14bb-c7-69ba-b852-d3f4-8957-5a1e.rev.dnainternet.fi. [2001:14bb:c7:69ba:b852:d3f4:8957:5a1e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55208f7b362sm389589e87.236.2025.05.21.08.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:41:30 -0700 (PDT)
Message-ID: <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
Date: Wed, 21 May 2025 18:41:27 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@quicinc.com
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
 <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
 <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
 <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
 <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE1MyBTYWx0ZWRfX2WAgicXTKWo6
 w6Vj/tvf0etud2snjs67jvrrDWjnYFGSjpI3Zp8Suxo+3/PWQc9JcW7ysxZowvfLQzdIy7eYzss
 iIb0oD00l7FY/VAO2rWlJT3Uh5AT7VvoMR8vlMVakN5NeA48+NMfJkgn03Hvu8gHC3V+S2ivALC
 zpnFzAYEwIuNt8ncydNxHGYe+8VPh7REXzYhx1c0VA+WH7CKmBT/GlBxxso30E/dOes/9LCODF2
 AS+pz1j225G9j5KmH8wxC7bnvEwcQ8ORaW2Hgsja9muGm+En0SKqoaY7FIWJvjs3rPcSRfK8sFQ
 c3y/KjQ7DLhDRVLTgKGWkcKAKxg6dFyvUxLmqz+uiP6svQd6NCVD94ibxx97ZW6bzNxPKXHa+I1
 pt9cF8L4m8aFAaob3Td9kmsuClRecHetQKfqFqyA0/kSJGlAXSalf9BEtzz5/YRgWrDksZV7
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682df42c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Kn0oP55XQ_SHoSlfIoAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wk3a3ONyOygV7ZpEZc-9Wa8FvFLU2qWP
X-Proofpoint-GUID: wk3a3ONyOygV7ZpEZc-9Wa8FvFLU2qWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210153

On 21/05/2025 18:36, Sarthak Garg wrote:
> 
> 
> On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
>> On 21/05/2025 17:35, Sarthak Garg wrote:
>>>
>>>
>>> On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
>>>> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
>>>>>
>>>>>
>>>>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg 
>>>>>> <quic_sartgarg@quicinc.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>>>>>>> This enables runtime PM for eMMC/SD card.
>>>>>>>>
>>>>>>>> Could you please mention, which platforms were tested with this 
>>>>>>>> patch?
>>>>>>>> Note, upstream kernel supports a lot of platforms, including 
>>>>>>>> MSM8974, I
>>>>>>>> think the oldest one, which uses SDHCI.
>>>>>>>>
>>>>>>>
>>>>>>> This was tested with qdu1000 platform.
>>>>>>
>>>>>> Are you sure that it won't break other platforms?
>>>>>>
>>>>>
>>>>> Thanks for your valuable comment.
>>>>> I am not sure about the older platforms so to avoid issues on older
>>>>> platforms we can enable this for all SDCC version 5.0 targets ?
>>>>
>>>> No, there are still a lot of platforms. Either explain why this is
>>>> required for all v5 platforms (and won't break those) or find some 
>>>> other
>>>> way, e.g. limit the change to QDU1000, explaining why it is _not_
>>>> applicable to other platforms.
>>>>
>>>
>>> Thanks for your comment.
>>
>> No need to.
>>  >> I agree with your concern but for me also its not possible to test on
>>> all the platforms.
>>
>> Sure.
>> >> Lets say if I want to enable this caps for QDU1000 for which it has
>>> been tested and on any other upcoming target after testing, then how 
>>> can I proceed to enable?
>>
>> Let's start from the beginning: why do you want to enable it on QDU1000?
>>
> 
> QDU1000 is one latest available target where we have enabled this and 
> tested. This has been enabled to save power.

Isn't it a powered device? How much power is the save? Is it worth it?

-- 
With best wishes
Dmitry

