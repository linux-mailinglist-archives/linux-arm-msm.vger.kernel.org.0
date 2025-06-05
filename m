Return-Path: <linux-arm-msm+bounces-60358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16FACF513
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 19:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5F9188C708
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F07276052;
	Thu,  5 Jun 2025 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdGdIcTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827494315A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 17:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143637; cv=none; b=qohV4wJawgSvQFKJ9nT+Y7POmCmlEVvGvVD1m/ps4r5bXc3K+BnVVkNaQzYGgvkucSc/2diP52wfthc9m+SS8j6snVOTQt8Qxf7RwD3j44uaUHDULuslAaIMk0hgUbY381lT/+s9ouhqZh2YfYF0MMrZjcImco+hWCxJbHIi0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143637; c=relaxed/simple;
	bh=G1uMwlSRuCegDgrVIhbc8dLP3y0ky6QBmu4NxfkUt5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6WDy/f1mq9NNa/puAC/qIjCQaY56a9R7xMQR8wZtHELiq47Nm0riBT9Ms8cKs8Wmam+2GaYCzdNfQIf5WYwGFZt61Bps56QBMMxrB8jLW/vvgIPE427B0MXQgwcadR8M9Ok8gGYyLbwF5/6NAyThBM29JTtbVKkzGAd/GRXdJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdGdIcTf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H4x9R032282
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 17:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiSKdaHMeCVD8oaJKkvTJRlJ3qNDdfdL1Sy3uWHXIrQ=; b=RdGdIcTfvYm7C6K9
	N9ep8x4kyX35n9cuG2Id7gMOYNhIi16ubJmJXMnFijmleiafbpHctsk8w9uRtrP7
	rm9QYFbOfEhcsqCZNKNUutPpCGt5wtnGHJ3LIt5qlyGHmoZz4Ymx2atBZF5r//zS
	nPW8T4iezTgUVonXGu41YJEIyZBqCZR2ds6fuqpsVdNVOFMCtw5fTsuk/kc/zkMh
	MfyZPWGhX12odEM86qbtuypV5ZZLjCEQrBgvswBYL1YA8aJUhO2gPgo0if94gxXf
	VPxEn8eUQxNS+0pbWNY5bHxQMrnWBu1jZg5hG8Vx2phq/W3sNCSm7qJsuszh4KI1
	lAHAkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv10nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 17:13:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso218813485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 10:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143633; x=1749748433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiSKdaHMeCVD8oaJKkvTJRlJ3qNDdfdL1Sy3uWHXIrQ=;
        b=rZLO5j5IS6s86rwKs/8kHfM0/dwaexAqpMLVJqsmkL0M4x4xAPgLPbfUknGrWRj/eu
         /w1lN62usbQodj4f+ifV1juSWrRrkO6n7f0BY8kFNlAriII1RcucI8AvrO/Zs78A9+F2
         tEjBYT9yywN7yv7KHpzqNijCtUv014NiPzqkzr0M+xryY/3ZRC1h+NP1+U/Ouzin4Buk
         NAN01TIMt6rQKFFSlA/RQoi7VJDjHvf5odSg+gUDz2WOe5XkgFyj67ftG0xis1IzSWml
         Q/Q5bs38Aww523N5bFKA4SUW07qd9IZ5sSHh8f3pnBF65dEcqlQCLpfNi6t7yzmMtMza
         B1YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHrSk6I5tx2HWiwc2v+7L62iZeT++e1WYYb2veaK34M8Ktv3uyp2M+xJf3NbNxE+dNODI4ozgVwSvTk1VD@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYm3lniQptRcGn2KrvgquiXc6g39QnKWBgIGCoLpy0Znj6JhU
	KTZ8eT6XoBie9R+K+eRY9YHlpES0s/8HbmLE6/llQYfaerAb3amvLZ197sKvawGOOrso8K5+fyE
	rgj3VLtxhT9bnRvDJJoFgvNjkUtz3mI/sFYr+Vcn4iylVYiI/23KOrrCJEaebv1l4iJGC
X-Gm-Gg: ASbGncuVETr3/4ZHcONcGWicJ0tKlQNJZoy8lfOWFCKVl9Ov2d1HVVx/XSzXyMFEsug
	Lkirufe+qNtXneqfNYZx2I3ttIPYEmX86+zkxmmz1kg5LD+Qaga0VgiFkoDSwNJdyIHHam5MPjA
	O9TW3yrsKhe5m/ywMfhnGZhH+g3W9aeDz6HKq/fy/ah1LitKEI+MEl3hQehabBvYoJBo3Z+c1bU
	JrzGuGchcQT+ECSMjz/oxz2w3T4PW9zNAvXvC/EDNaiX73Kh8MdO7NRiB+7TJkoBAv4PFFIpL7i
	DyRhrDwjayYkWZ9y97t3IRRcQFCgHuuKMdjqOCRjj1M6
X-Received: by 2002:a05:620a:800c:b0:7c5:431f:f5e6 with SMTP id af79cd13be357-7d229887bf5mr53232685a.33.1749143633408;
        Thu, 05 Jun 2025 10:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA+PZVxU0KcpFWRWk2T4rCgPUtQLXzoDQwsIZvyrADwGhZQ0pSI//nevDF45+TMmeSQHR2lg==
X-Received: by 2002:a05:620a:800c:b0:7c5:431f:f5e6 with SMTP id af79cd13be357-7d229887bf5mr53228885a.33.1749143633020;
        Thu, 05 Jun 2025 10:13:53 -0700 (PDT)
Received: from [192.168.23.80] ([87.224.39.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f982a5e5sm31482925e9.18.2025.06.05.10.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:13:52 -0700 (PDT)
Message-ID: <73d9fa9e-823f-41ef-bdf3-76cef3591e1f@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 18:13:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@foundries.io>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <nr2je5ssn22npl2dqu5aj2xcwinnjmhvl3tvuz5smr4dd2rxaj@dfkk6aktkafy>
 <0a17dc61-a8eb-443c-9f4a-4f7851e07c5a@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <0a17dc61-a8eb-443c-9f4a-4f7851e07c5a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841d052 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=UMobGI8h2IAScYPZOeRE3Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=v7yF-7gVPNHQD8MQQjQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: iJroIPHllhkkKMG2dgDOlF7CVBjc0eTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1MiBTYWx0ZWRfX1aiSEh6U/3SK
 V0Ey+woaXFyt0DJZ3U8tpu9c/8ldrQiAXhG50XCs1Ag2VT0kx6TW9Kyzh/apvSOXwKnLKxRENz5
 b1w8utU9rNtsNx+JWZKEIvXs1yMG/KQWC/mFCMkkH28ez2Ras612SxcilrWDN6icaZmN1C8LgK1
 SYN35EgfJ7D+J9TPxilAh9oRipt7lmSNFSxFWJ6Q1PJ1Ty+hfkLqjj2TT5yyo5HTYDmmMoYwWFI
 65LLFwMBSPvCI2i6iKRPJcOD8QGanyi/JwrL2ennCr5lxALELwrfEDE7FIxUoWC1PylPDQgg7ay
 vHaWNu5CtMLWb2IAVHjpKR6xQJTPXEN2Fqp5i5AMYqNu2u4hfmvN3zMmdWjykNS2Nw/gplhT//J
 hgcXO8mPgVowxjKtn8m8hVxyixBg0wR/znlQf4JfOmNdz4BzjfqfGWga/anOd1kLUACc/YFn
X-Proofpoint-GUID: iJroIPHllhkkKMG2dgDOlF7CVBjc0eTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=552 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050152

On 05/06/2025 18:12, Krzysztof Kozlowski wrote:
> On 05/06/2025 18:02, Dmitry Baryshkov wrote:
>> On Thu, Jun 05, 2025 at 01:40:03PM +0100, Bryan O'Donoghue wrote:
>>> On 05/06/2025 13:33, Krzysztof Kozlowski wrote:
>>>> On 05/06/2025 14:30, Dmitry Baryshkov wrote:
>>>>> On Thu, 5 Jun 2025 at 13:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>
>>>>>> On 02/06/2025 08:16, Dmitry Baryshkov wrote:
>>>>>>> On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
>>>>>>>>
>>>>>>>> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
>>>>>>>>> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
>>>>>>>>>> QCS615 uses the same video core as SC7180, so reuse the same resource
>>>>>>>>>> data of SC7180 for QCS615 to enable video functionality.
>>>>>>>>>>
>>>>>>>>>> There are no resources for the video-decoder and video-encoder nodes
>>>>>>>>>> in the device tree, so remove these two nodes from the device tree. In
>>>>>>>>>> addition, to ensure that the video codec functions properly, use [3]
>>>>>>>>>> to add encoder and decoder node entries in the venus driver.
>>>>>>>>>>
>>>>>>>>>> Validated this series on QCS615 and SC7180.
>>>>>>>>>>
>>>>>>>>>> Note:
>>>>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>>>>> DT patches, still depend on [1].
>>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>>>>>>>>> on QCS615 over(?)clocked.
>>>>>>>> Agree, so we need to make sure that the driver patch is not picked after the
>>>>>>>> DT patch.
>>>>>>>
>>>>>>> Worse: we need to make sure that the driver patch is present in the
>>>>>>> branch which picks up DT patches. Otherwise building & testing that
>>>>>>
>>>>>>
>>>>>> Well, that's a NAK then (although depends what you mean by DT).
>>>>>
>>>>> I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
>>>>
>>>> Sorry, but no, DTS cannot depend on drivers. You CANNOT merge them into
>>>> one branch.
>>
>> Surely it can... Like any other cross-subsystem dependency.
> 
> Sure it cannot, because this breaks the basic rule of not mixing drivers
> into DTS. Arm soc maintainers are not merging drivers back to DTS and
> the DTS must not go via drivers tree. These are basic assumptions around
> DTS, see subsystem profile for more explanations.

Ack, so v6.N+1, which is also fine.

-- 
With best wishes
Dmitry

