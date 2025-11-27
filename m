Return-Path: <linux-arm-msm+bounces-83573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87066C8DD28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C3D3ABD94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BFF329C6E;
	Thu, 27 Nov 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVGqWZCf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APZwDp5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E876B32ABC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240238; cv=none; b=kdAz8DllkM73nNeLzNcNvUfhtpK2onIIeeq+IhYCLF8vCZbv45sEIGlAbAP6zvX5JDpf4re5w/FM85JE4nev3tYsFuet2hTUYBd3EtFD6qUZ55Ho664JCsoEas/IrCLDBDYjtmur6CTGrzpubz407s0av1OOCUMuWChuKZEKc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240238; c=relaxed/simple;
	bh=xFLy5qe4yQ1PTBlKEffYi0M1RhCzj1BiytfiqnYQdC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s370dI0rvxNSjSi4CYtPoapDk+/LMhnbSsTfR4EtZrbdAwlJl/Zv5QIb4Ske+fSorZbq62AmcksmKnJJ63XjJui3eHzXFpXvJdB2bAxrAlba29TtZzm3IKqLAuBVbT4i8gg+T+n410zV1F8nR/Go78i+g8kG/z0PJFkHUs2wS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVGqWZCf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APZwDp5J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9bMGM785511
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFLy5qe4yQ1PTBlKEffYi0M1RhCzj1BiytfiqnYQdC4=; b=dVGqWZCf4nr0FWl8
	6iE+EVUpTYlg7GADtMFsrxvLkFwCIJ2fZNvH+X6YyKfXdVajBX9qsBfxJQRpfYE2
	KGjyloSLPh4v4tU/k4hspEUR1mm1ecKQmsGl2pK0Qqaq9sOO410O8thTw6o6Wcz9
	+GgkLmHO3GneS+U5cqe88KzWvwvUqzHOQm+BEr0WIp0fFRqDMND86B4S+G3qYsu5
	pRYL+2LrRAnshOYhszCA5ChuDvI9HlVudW5w7PUW6fzrsMkKu4sx3xru7K8vY5D1
	a0UqTHG8TB7tdhp04jVDKy06xEsWvsmSA/cNo0Cqu55mYwgEhTJ9z6VXpTE5avvm
	WXJJwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61r6xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:43:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b29f90f9fdso19353885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764240234; x=1764845034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFLy5qe4yQ1PTBlKEffYi0M1RhCzj1BiytfiqnYQdC4=;
        b=APZwDp5J5olqPsW2Et0/wQZqYHlUSWYYfgUcW+201lKfMHWtqriVfmrgWMicipH5gW
         4oxjLu3OkgMHbBABes0YkGtJo2h+R1QeU3OtwrKr1xafQtIE5zgizvh6k9RbG7xxHad3
         ZnZ72te+yfPf/SgwdhDWpeoqXEB8w1qxv7O18q0BsUkB57cGUEjphKCXqT6neVIq2CzT
         K+S5D6MuEx+egMn5MUwfexp1EGul2TeKU2kKRbEGsuReKYKXZmrDyKIg1m0f9ioxU7sR
         V6Yd3w8wH26GcA7vf3ipTRfCV8+u4ssgCidNnLFkZGB34tCHKdNPSt0GN1oPBqRbxtkw
         Dc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764240234; x=1764845034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFLy5qe4yQ1PTBlKEffYi0M1RhCzj1BiytfiqnYQdC4=;
        b=Sk9LQ/M6UB84Ijm2EwvTGQs3WHsDQMbbqgIXF2lWxi4aNGdJr6bx1hzgjQkDfDVFHy
         x+dOKmvtaHAYA+L3pJB6pLWlcWwPjequZCgcHWFy8d7IxKq3rWjLTb6+hoO3jF2EZSTW
         MQM/QdxZbH8KV5PLO3nR+YONIbEuKxIrCyGHsr7YIeRN5vS3DD3Jumq0eu+nGGCR9VHI
         /3UC6FtgBYxN8gqYBt5ktGdHDU/gcG2as0SYy0Nsvu7A/Emeijq/BJPSLqZ0mTXImhKE
         xgYZb1a4U3ZMUNrpmm2ZxKn83yiVR2dOGgZIESnCGF/4ukk2hA9g3UQNBbbDG0YJOCMH
         Fr0w==
X-Gm-Message-State: AOJu0YyM2lZPhA8xYkKoEyTnuA8nh0mEX8qMtnZh6xxzcdhB/PG8O0Qn
	WDNyFz/2QalgqMvZJXYLXyMCQC4ZftcjQtH1h+E5e57NMfK0Pi/z/JbqB5QjA2sDFpEd9gZScL+
	Kvx7Fn83TMMmTm92b3XJDxh1oAVQKfXgJrtt+CyYrpuc8D/0zZ+FGIVz+wdK1jV/A0USG
X-Gm-Gg: ASbGncv08iU/N/tjYidCF6/u2GJlZvAoDiHvTE1SIlre43Kh72pTWHmkNGXP7cqyQVM
	5DHbIrdnDuuYTnaM+luESpIHi4kW14ntXt6nWcQKqkbie03k6zmY9s2BVJ3eIilvEXR3Mn+5eG4
	n1xuLR/8Avd11l7C938JGDqNuHZS0ydsFZ1cYgtp9ylvAnAsgl79Si1lGmKui7SGr0e4/cdVZnr
	9+A/XwEdFM6vRQnl+mT/gwnhxFYn8mL2ZgOS1DOrFPzNrsRCPs8ZHifj77qXGZlvlVHgTDPZjPR
	X75w2ZC2shR5H9h8uAba6oN/ORMuI7PYCQyeG6KVG4snb0M8ssKeJOxPy7F8HZesXQS9+ZKL7vV
	+pf7pfwEJyDS1nOn92MA8HYwJ3JolmRk2BweJqoUHcK6kIOwA+uJGBhYTz65T+NgapXA=
X-Received: by 2002:a05:622a:5c6:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee5883a523mr245990371cf.2.1764240234062;
        Thu, 27 Nov 2025 02:43:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAOBv6a4l07YqKcdeibRnYAIOdHT5/pAgI/gn4xMd5q8VvFNZKwml5c8mGskRvKTeQ9o6jPw==
X-Received: by 2002:a05:622a:5c6:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee5883a523mr245990231cf.2.1764240233639;
        Thu, 27 Nov 2025 02:43:53 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751051313sm1194722a12.28.2025.11.27.02.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:43:53 -0800 (PST)
Message-ID: <2099b101-5159-4739-baa2-03f2adfdcb0e@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 11:43:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: qcom: llcc-qcom: Add support for Glymur
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
 <20251125-glymur_llcc_enablement-v2-3-75a10be51d74@oss.qualcomm.com>
 <80c26f33-aaee-44f2-ab7f-767467423396@oss.qualcomm.com>
 <19ebab89-e0f2-425a-a95d-01637f324170@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <19ebab89-e0f2-425a-a95d-01637f324170@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lG1pIGuZU3nF4ktt6HupyphEWblvfQZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3OCBTYWx0ZWRfX17SCkBkFpJtj
 yzSbaX7KPelXo4jlz9Xg+kEtEnmjyL2LrAMesnbS5kWCAed4ZW7PB6PAh9swpo+fIgXnap6FCk9
 O57hNVta0WSz2RQqYFf3F2ffodJOIYpsDbgqlbkqhNXlBsasz3lztuL5ifT+P+hWD7IgjPWVPJ0
 kI5+jMwWIRTRyn9GgsAZv87VweTIR4Uxp6UFd2GqAARPYmIMfjrkkI7Ysq5F+ivUgKoAlfg1F+3
 IBuzj4rSaNoZXEtVgorXRVFqr1qwPvsrtZ/eZEFiSN1uPID+UHmjUgHJR/7VFid5l5F4mcAzoa9
 z5aiR71FacKOz+M4IdHmAhRGA+4aL393Xe6yIKu960ZdBN9tJ7KGJAVy48iCbZlYYzuobvs7CHq
 Lh8WNVbWYdzx4cOgWQoVCBga1UUbLA==
X-Proofpoint-ORIG-GUID: lG1pIGuZU3nF4ktt6HupyphEWblvfQZU
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69282b6a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sGm28_-GvG3fCMEtpFcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270078

On 11/27/25 11:37 AM, Pankaj Patil wrote:
> On 11/27/2025 3:52 PM, Konrad Dybcio wrote:
>> On 11/25/25 10:16 AM, Pankaj Patil wrote:
>>> Add system cache table(SCT) and configs for Glymur SoC
>>> Updated the list of usecase id's to enable additional clients for Glymur
>>>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>> What happened to my tag? :(
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> The commit was updated since I squashed the patch for enabling additional
> usecase id's.
> That makes the tag obsolete?

I would say it's closer to "fix a typo vs last revision" than to
"rewrite meaningful logic"

Konrad

