Return-Path: <linux-arm-msm+bounces-81742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B6C5AF5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 02:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 150A53B2BAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 01:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A27D257828;
	Fri, 14 Nov 2025 01:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPwgoBfT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnphRCU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA923875D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 01:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763085296; cv=none; b=XstiBmPzIC19J7b8TRjji3WLgzAILFrB6rRVCNOYxms7Ze57cSmB0YJIDeCUgOpqlxZXB5Iycg5G1GS6ZiDxWeSsl0sN4GZmY2KX34KXfYpOOhXJiNaMhZZ9p35ALDcx/hvhH+NY0l1RgPxGDFpGi38obQz07yedRhuYKqGHR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763085296; c=relaxed/simple;
	bh=AgVhfmf27LfL3x2IxU4sukacebbBOTnVwrfmynuRy+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXvoMFm3TTEKAJ/CUB5BJsB7zR04335VS01KEund+JaT+191FC2mWi28TGukQaBlfRfuCaGvD5VMx6icK/Qzaz8OzQk/4AC+AqWCxJMr7frQMrsBF/2RACt9Y113vKxW/RZLogYycQH7R0HNgl47qNtS9m9A8ci4gYjWy2cciyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPwgoBfT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnphRCU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMarBr1484923
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 01:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWD8TIFdOldLEF27oBBWiMI748LNxu5l8xvR4gJbz+4=; b=dPwgoBfTgWUDSa9e
	JaQhkAEGqMTrRSUJIwl5erbTeFXGGqsGI0utuziA/8jVRk4zgxxFkob7JTZIL0nK
	9Hc1n7G5PXu/lGuthUpxEk/YQnyQMb0xGTK9BWl2xcmt0visMShBaryhjAsTmdvV
	jaNt7TlWwTrBF0Dkp3prc980dgXnS6q6KIcZJFo2fuY13OyV7wrSGKqagEFG8b/r
	ozk5yJ9SWcxfLh9oaJPbk1EkLpGNmTWsnhdiPxy2XgTxGOAhoJGXbrtNQLnlHo5D
	wdOD4yTJrWjFyzVdCu5UgjdDY1XFxhnEmeDyhkJVlBRIr+KI2Ssye6ayB4S0mdcd
	Ql+S3g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cgekq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 01:54:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so1000881b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 17:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763085293; x=1763690093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mWD8TIFdOldLEF27oBBWiMI748LNxu5l8xvR4gJbz+4=;
        b=JnphRCU2Ryp+s0vNNm30rFmYEBkh/++ld9fX7xyaRYKLUX0DMBHBiTTjdR6hfuUqfM
         kciDa8EqRttEPNUPqsGY6xHKbjiiGPwFOv8TrkT0PQ8+BARxoGxpOwAvWGSf2khmCJAL
         vwbAshtabq4N/vUhHLtMyeTEI74jGS2v1ILdFWzO7V7mdhqI3grzZIgWqTnJGYU032p8
         Amn3YeVOA5Kysj6M/XwirltA9g/qbZrP4YwIBpiF7CYMo/8z1h+8N3WroqD+2i59h5vD
         uxebyTWkcroo/BL3KH+/HEi/7PNgo5sBsug0bp4fqBX0LbtTeOGeFqvwKyiTDWItYsSY
         9GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763085293; x=1763690093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWD8TIFdOldLEF27oBBWiMI748LNxu5l8xvR4gJbz+4=;
        b=RjFHLHki41T2HSoUe/vjfVPNliP0wzP89GSAwgsdCdBWzJ9ZQvh5suF/2TJ8e+nhRY
         P4THZ8Z2JaFkPUhajleWO7TAw5E5OxABeQPsC/0VGAWyKcmZ8NN8lox19MUzU1H2PzOK
         ZgESI36zN00wCvOiq9BxqAXQ1hsccQtpKZ6g723Wqf9p3AurwJJ8xpJYtBUen+AMoJo7
         uL+g14SZOAV6hQ3q8fhsE1vqzAoTGGttNC18uBsMI6Cb3WNUBMaHW0vikiA+k7pHhVEd
         iCyZdPjxFQ0Dm2axLLJohh718vTuquN38WemoOLEYoSyy0iJjEOLi9TVz+WBv3zQW15f
         6hbA==
X-Forwarded-Encrypted: i=1; AJvYcCXfS1BACuto7tldltYNQLUdaq1MEzHhMbw+KGJ12xuMazBcSu3oRbchw7skQwr6YQLptebR88Wh86wnvZMU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnet0pjiSXu3KiwXwe2APxyS9KJcVjBMYYNTfyQme6OqqZRopL
	U+4iLkJI4hYjbQbROHTyCogkn57LwT58/RN5N7kmm5Ls6PXQLm9g+XFwHvsqsIsRnbYuFicB0ua
	OgVNRH8WYaE5yqOxSx+1vfmxgneja+YVUyWNItSS1Bu1XGybll4zA7SJgj0rjW0QYSt5QzPNfKG
	s=
X-Gm-Gg: ASbGncsKVErQnzCVcExzq/I9BsmVrlvypCZMDUfUa0x7WH2ttdPp48F5TNg/KWQBRtw
	VjdjYhr8hb+FZgI6kzmn91yLU7F5NolC2RxInwISNtlgc7ZpDmVLE2LmYmPFKqbV5s3Dv6V8kT9
	C4IRguAV9v0Z1ofFVXKZXRjlUA+rJnpopj22mNE5GEXRUldmO3xf/rw1GR4+u7iW8kZJRd8B/zW
	d/i8ms7o9l+IfDDAuaJU1K6uj/Ws5GAeIhSo4kI5UbYrDydUeyWkJGGGBXj3B1mNCxjbSGTQh1y
	dsJLtbD0wfy1op2wD1iL1QoxtR6+kZ2v0PcWj6vAUcT3ZfeecpzBLfjz0mWyjDniXkFxN5A8/fb
	ombB2R6FUV1n/NSQwIuI9268Ejb/8qCd9gONoXqxUhzPvx+/hc+UzmdGgRCYY1gPvaPeACcR2J0
	o8RnNXLzA=
X-Received: by 2002:a05:6a20:a110:b0:358:dc7d:a2d4 with SMTP id adf61e73a8af0-35ba028d45fmr2063934637.20.1763085292845;
        Thu, 13 Nov 2025 17:54:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN0QOGen7XrcffVBF6IF/BbIHbMKCBKkzyUzn4Y/t7A4LnKCKyySfTvBnx+2OG9TIh8C1lvQ==
X-Received: by 2002:a05:6a20:a110:b0:358:dc7d:a2d4 with SMTP id adf61e73a8af0-35ba028d45fmr2063905637.20.1763085292316;
        Thu, 13 Nov 2025 17:54:52 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37731d21dsm3251803a12.34.2025.11.13.17.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 17:54:51 -0800 (PST)
Message-ID: <afba8148-b5a6-4f8e-a461-58cc62f37a7a@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 12:54:46 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcom: initialize result before use in release worker
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com>
 <aRLcO7dveqChPNb0@sumit-X1>
 <2ec200e4-cf28-4881-837b-4455da047619@oss.qualcomm.com>
 <aRQ7osB9rElutHuv@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aRQ7osB9rElutHuv@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tV1pF0t5Wdv3Bwpt5Op-THzzp0nX9cV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAxMiBTYWx0ZWRfX1A/caAghiWA6
 V6I5xQ4HzCkuqs4qzuQxo7barnrvCQjxIfWmm5AuIsCMIN3DOStBVxyxdHzc8cVs61U7XpMwZlY
 XfysKgNf6j9VS34BCDHr+gXnTeexy1oQ5ury1gyxSJ7dtUTdLVi3WDXTP8FwgHYZ6jQkUAjvGwP
 eCWdxwdbGvCRhnEOL+qgZqKy5IRhHrpow8v8nw5P+xbds7yuxovmRsUMDAUaUYbVCXCcy5tKGft
 gylx5664Yat9PLGthHLa5OI1AekvBdV6h6UMWN28vqsztwXyJO6rUpXvGWz9jt6EtJ0Frko8+tl
 y/whHhTKouaBx+V8+gZhhfFie84Lwh8JY863pCNC+AATzWtBXWH0qaDM//RBNqL6T8v+l7NO7db
 QohIyRfMEK+2kRkvKtXf7KsEHMrfWA==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=69168bee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=5vM8NuAPPqwf9HD3eAwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: tV1pF0t5Wdv3Bwpt5Op-THzzp0nX9cV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140012

Hi Sumit,

On 11/12/2025 6:47 PM, Sumit Garg wrote:
> On Wed, Nov 12, 2025 at 06:42:04AM +1100, Amirreza Zarrabi wrote:
>> Hi Sumit,
>>
>> On 11/11/2025 5:48 PM, Sumit Garg wrote:
>>> On Mon, Nov 10, 2025 at 01:28:32PM -0800, Amirreza Zarrabi wrote:
>>>
>>> For the subject prefix lets try to follow the directory structure:
>>>
>>> tee: qcomtee: ...
>>>
>>
>> I believe we previously agreed on using tee: qcom: based on the reviewer’s
>> comments. Currently, there’s no commit message with qcomtee:.
>>
>> https://lore.kernel.org/op-tee/4rbfpubsaxgv2buksonfigbdkw6geas6l7pycxuukdymqfohga@ohd4hqzvra3w/
>>
> 
> Yeah I agree I haven't been too picky about it earlier but lets follow a
> common practice which other TEEs also uses based on directory structure like:
> 
> - tee: optee:
> - tee: amdtee:
> - tee: tstee:
> - tee: qcomtee:
> 
> -Sumit

Sure. I'll update.

Regards,
Amir


