Return-Path: <linux-arm-msm+bounces-61264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C242EAD9597
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AA697A573D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2C8231A4D;
	Fri, 13 Jun 2025 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSrPdwDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FF231832
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843202; cv=none; b=JGZmLUvt24da1sLky4IKtLTC0loGvxE5PJ0o+L54sXYWX2xbI6T7CmegomKUi9Rxc6uy6BMwf7+gBP+C73fKJHEmIfIGrHRuEZXyVJ+7w7kvzxygVLMIg6Vrpg0b1pvACX6cfaKbOcEfTZyzCYot9fdn8u4dB7lv49l+iRkUUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843202; c=relaxed/simple;
	bh=iiB66+oX+U+GFZBgfUZSwNWdiYU/TMn5GGDQJGHDrVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyFq0D7gbDknfQyhuYwOZpFDZVN0uoHDep5woPQb2TDuBAuu8ckiSriTu2PWesC1eHFym6GP9BmfZXBI7AfRHDufmmUkTPaYIlhMGCYwNarjBKrnSQJ49j08aySZvwOv+6oUfKWPvFNqJIW99hywNUEV9dsJ+Qxc9VxWJk4C+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSrPdwDy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DIqppr006390
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=; b=bSrPdwDyVHDVY1cE
	FDtMc/JMZFLYRhZ6Ok535aWwgysIfTSbOug82ixcVXoINnwqCpHnxgxth9CGTkt6
	1irMAbqWu328Fqi67WFjPzuMDQ5ze21UntANglhyM8TeBdAqRJ+M2ZUdxs7RxbbL
	iJJ1m5cWBuV9fC5OBzkuAsa+dkUbglhBcF9fRHz6CFOK6JWSfQDOt1dMdvuqFz0O
	CRvZ+Z5KoNVmTjF7lk/K0FYvzIkpdH/aUI8iJNjxTVgKTV4AlLNhmqZT2tqcW1y1
	59EOksy005Df3zdjpMZeX+Bzba1rLEH+rb/iweSD62YV+X6px09i96UZgAWe8ym3
	BYigNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdwwu9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:33:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so42882785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843193; x=1750447993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=;
        b=MsB7xKLo5X86VXa9iF4eVgexmiDysDVeT8UtGSj0f1pT05x+U5GfRvXya9YX0Dsx/T
         /W/9AWvoClan6Qz9exEZPSo49KA4hvxw6X4nETC/9FWolKPyWPvxWODER6RfaOdWk3Oo
         PHRFdZrs4RHjG4HSPdbT+g0GWle6sg5/9l+VAl4UjRjdKZt5G6losutbW1lcPDGSwYb9
         X/w+VwO570Kr8+SinGxwUh7GWYKBRPBIhRdjgjMKWxPb3rCCas6NPQD+5tiKai30fbj/
         r8OcAxlehemM+gXooodcvlfcj98jUZi8O3ms/tkz4mX4P3peOHv3fk0YbTFyIAIqcvIg
         4MhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfvkL23xifOhiGBzU7Mzvdp48gzCeCWRYThADi7VOKIK2nY5RgizUJ9RYgtZbqT2sEPRN1G6YjUjqDnwLW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/yk25Yl7q3uQH+NLxv8pqekQGO2g46MnzmaP5Cj4MhMwaPRL0
	0O9Z3kMYkuCzHHAtUivuhgvm4XcxvBlTC58sGuNMGHedZrJuIZAN/AO6K3wQDZQxpAW5p9bWmxk
	y/FicULvtU7T9KvX9khWtAAjHjkl0Ee+SurQY1zCkVnRt55jhZeOjhaWOQzSTzzF6FHaMyjl2dB
	9D
X-Gm-Gg: ASbGnctv9Jw4nzBTnQegxY3Ls0HvZwa3tzol9dvcbaTAWhf67o5UtHYrJx5EE9Kq3ps
	bE2+IRh0Q88dwUciTmL8ZONJu8KT/k96lWhUT7l1YldO5qzLhG5sUD/TD1rwN7OLxTV5BaYHpcy
	5sPd1HTYj1km7aDyxIaO1eAXhgRRVIJ9+dJboBNyd1yXTCBiLotnyofxLhFZkQXCAuBUbX96koC
	PVGLidUzmS/G1wt7aUuGd9yMPL4X868SpDCH5WUDNBPo2pqhT9yjHSo72XJnMkj1npl6QANkzXv
	h7C5i/NAQGEZ+r82BbQYwXedy6S7Ubpr6gdqRO7ZZCxKAMgYdYe8bBvdU0S2+5Y0K0d5FFWclql
	yBac=
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fb477fe024mr3165206d6.9.1749843193254;
        Fri, 13 Jun 2025 12:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH01QDZOiXpTt+NsBhAxASqjmghXoKA9xtVp0rzR0/hmDEEoJUb0ozfkNkgF193N2L9KBI4Iw==
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fb477fe024mr3165116d6.9.1749843192890;
        Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48a8477sm1589010a12.6.2025.06.13.12.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Message-ID: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:33:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNSBTYWx0ZWRfX8RT9j4mbKU/b
 DtX3QuQCEdltDa73xjqM04gEC4RzMC7oandwBlCWo1PiYQD1gMBrH3aBv9W0woqdozWCWfX+BTl
 7WkkPExhMNrZ3egpMl55rjXSbvdAP5BiwS5fjs/qd/4BwA6klJCcsYCPpUKCXzUuDJAIErTJgji
 j3QGOGa5MIs0mercrkUuUcojvowCcY1DefHTU3ltdc7RXxD4i7jRp+CgKdEkCS8Ue0AALXl3oJj
 xEa8NDjJOEi2an454gzAbvA4A+CU/AnhP8ZDibq//DCzslVASpkspU+puhO1F5Uvsv0tEWTSGqE
 gpibo3R9QFLMcomSrMGqpoJ4tEvyvl28vLKpmlt26Z/O0fwxHaNhqDY30pisE5qLmoy/OS9R3Vf
 tYZ8l9zhuhhFVCYGxcQdGskqAzPMlQ0vhVaRe42GRujiv4mcRvGPTBI+iRvAmSSMBmvWqZJu
X-Proofpoint-ORIG-GUID: VHpmmcQP4MVWNPjvDjlLUQMWHUOV80QL
X-Proofpoint-GUID: VHpmmcQP4MVWNPjvDjlLUQMWHUOV80QL
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684c7cfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=BU9CULlEoaguDH3JKbIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=886 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130135

On 6/13/25 4:57 PM, Alexey Klimov wrote:
> On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
>> We want to WARN_ON() if info is NULL.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bind")
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> 
> Apart from tag problem it is usually a good idea to add relevant people in
> c/c. Especially when you fix the reported bug.

with Alexey's concerns addressed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

