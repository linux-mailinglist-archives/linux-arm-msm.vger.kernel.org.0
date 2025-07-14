Return-Path: <linux-arm-msm+bounces-64892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B010B04C7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 01:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40821189CAD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 23:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B394277CA3;
	Mon, 14 Jul 2025 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZv3y7C7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4B2528F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752536451; cv=none; b=m9/aIub4UFFt6L1k78v1JJ8ihhO0uTT3OuOIGG6a2AI6JygVpl6sqagHoPNkfjeURaRnBBQ0GTQiMtt4jBaHo6TfzmVK3+56H80Ye1YY0gwbhCWnInuRrGp6m+W76CS5qzJ6bvrwAIBq4CvqpTKV4E+1NjNB8P2zQ6/YD62D2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752536451; c=relaxed/simple;
	bh=f0Dnyo9xoPNSPclRBPVIGihMLC9tyDlqpv7KrDQI2Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AC1M1S+3fFWJTT/mQlnAhzk2Nubn9P963DOW1zkdkGEn5rqeZqkY5VAFjxqMYL8ujoJEgVGAuHRiA0I8nPf9TJ91vJnawEj8PfPkCsJjmESpy8loApp/QnntYZKH+WrGXAvUy7x5IffFw2LgqbDMtZXliUHGOenBunLDJXbfhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZv3y7C7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGS9n0023283
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXi+Vfo70q22tr3GBwXIimObUqUqXmPUkoh91UkH8FU=; b=HZv3y7C7URS8ZUn+
	Q1l4TUF1kw5kagXw4WUZfSNvS7sEH6cH4tMAmlGHSxeK3AQvLkLxaOvVQLvhxsQQ
	11SOhCFMg8n5LLQgMv0hXA4PwOdZfxiLcmSyV61eLT5xcUVz4T40Ct12OW8jClhO
	E/43i6bMC0e8sDtwPYlx/AaMGHACnkPV15N65NdIRsgFvJD/8bpeCmJBheRIseiO
	FNEJHjiUDRZxt/s/CoH2bv9Et/s2nKRt7zWL0N3D/cMfJbpT1ONitwigWwB7cvoG
	gemzBK00GFqnmAnkhnPAq0NI8dWAwHtjVdz6vvlfIfNLa+WN9+m6xzsVfC8XIP8u
	PMVdMQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dp8x1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:40:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabbaa1937so16845726d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 16:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752536447; x=1753141247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXi+Vfo70q22tr3GBwXIimObUqUqXmPUkoh91UkH8FU=;
        b=dO4N/lZ0ypEQ0XRpjc3RcCqJFRgFVfq0Y4Z50Z9To5TZonZX4nfFC5RsNfAuGehyn5
         HE1/3Awvrt4ja7FOKYEwuLUdDwUSuMh1/eLG8sg+Xsu4FFTxsvGcgP4m1ZbdmOaK5z5N
         Pi40uk+gJF30gU3arB8MCbO3n1fKWRP5kCy9NHz6EnSNfTslhSBFnjT6zmKY2OtIUugo
         Jeo0KUXqAojog+Pz6Bp+SWhizC17TEig0/Qj4gtA3WJsOkT3U4VUw/Bxmh/AfbS62F7p
         HA90SnOa7aJW7B1Kh9bZ8vdqq3DM+s/9+NfNbgdAEDlqvvB+xVQeYvzuurS+b/ry9P31
         JyCw==
X-Forwarded-Encrypted: i=1; AJvYcCXJsJKpMd4ytCE6GKwp/fbXXiZvqZICh6yG79Eaa4VwcTMooQaf3JEtp3wlIyNfDB7q9ZZY81sSShatTSB/@vger.kernel.org
X-Gm-Message-State: AOJu0YyW39bUX8Cbjq61Cdn4ubNnWW5saQOXaqvA3+bk+lwbPymBDZvr
	r+GeF0c9qJ43VtqQ8clrr7xRrRQ38ERgg9C0AK1vZuJMl7k2RpxbkuzskJpnJklCcqTe5y+tXCz
	SC5Y00LSRRyrGTZRvzJTYZeZyyqXCYkrsGgYAYqUNnQovVS3QOB4vrJobRlJWT4D1pgR8Vmk2mv
	8w
X-Gm-Gg: ASbGncuNj/kJi3mdba5oWDb0gbJ3H+K5B0RYApDvfkAg3+JcBg1AtoxyjVa8FRgbZC1
	qzvuNlJq6X7drx5fBZgaANMwZnd9RR753GK09vIN5hj0r8CLHzui7HxrIqPnALXXU7UGJBlM6sb
	ctwPKeiIeZvEHCXXtOypfv8qgCMUy53rO20DcPZNRVNe0CzE4FAfObtsHHOpGu1vynPBMYYgjxB
	InSDuLzCcKyQLrDS3TJBuZWs5SBRLbJZKDFO28EsVK5Gg6Im4GhxP3vTdaZpw71KScyAaAo4+CC
	txx2pwaOsdgCCK/d/ONXE4vZiAxgHPPtjZEhXkCldbQPXNUp38sVXHojNGLbr7SRCGb1ENqssXS
	CtlbitCCEOMaGfkeqGd1u
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793274285a.2.1752536446973;
        Mon, 14 Jul 2025 16:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEND06f7E/xldG2SwiZSQTbgDcvn/Jbw/7eu/cnbVCi9unjwVVB7Y5X5mBj0MZNrcNpy8/YbQ==
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793272685a.2.1752536446427;
        Mon, 14 Jul 2025 16:40:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e829d061sm909166966b.142.2025.07.14.16.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 16:40:45 -0700 (PDT)
Message-ID: <5567e441-055d-443a-b117-ec16b53dc059@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 01:40:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: rob.clark@oss.qualcomm.com, Doug Anderson <dianders@chromium.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
 <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
 <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
 <CACSVV01PkDKWSRq4eQCJGFePKmSKmFdkNFt2PSC4w+r1U9nZuw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01PkDKWSRq4eQCJGFePKmSKmFdkNFt2PSC4w+r1U9nZuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2OSBTYWx0ZWRfX+ZpNxCL34Qs8
 m4GjbUjMapdTBYG+Ck4zz+GUKhT+WauMDJTwqauZyI8UWLueQbL7uc12+qSKoxp4//BCtp+7qjw
 fQLm2io8vPzf4PJxroM7WhfyU+gXDHokr1lELp9y1V+qX+OVOGlvhz5I6lpjVbOqQstaof+a+aS
 abkVDQimi/ronAAiXdwiPUU+0/3RtY72jI46/259qE8BRzc1gBtdXDGkO9pKia94lllMWuATGg+
 Bhkqo2ORdgoAheoHALiKjvRjIbqtm9GqPAr9Vsnxu3dChI+HfVMnx0qaYQF9Q5yEAAdfCBdZTTv
 cd5Bjwo4peGpQZZ7Fbk7A7YUX9dSKAP78NYgpqB1bhBUPZ6jalo5sEG7mLRXHX35gFkYYDtPLn2
 QNbyhD7XUCHbIlXP4cqG5aFSGr2HRlS+DR/yrHxsdxBQN/IRSuCysY9tUIkje1tt/BYBSt8U
X-Proofpoint-GUID: 34W8EIwm-78GzrOCvM_R8TZ2o4qHCNLt
X-Proofpoint-ORIG-GUID: 34W8EIwm-78GzrOCvM_R8TZ2o4qHCNLt
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68759580 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=dRXE1jWJAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=Jp5PGaZ2n-Q8juSPBdEA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=I84_JwFgYcz8Gf5-qaVM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140169

On 7/14/25 10:08 PM, Rob Clark wrote:
> On Mon, Jul 14, 2025 at 12:56 PM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Mon, Jun 30, 2025 at 9:15 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>
>>> On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 30-Jun-25 15:46, Rob Clark wrote:
>>>>> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 29-Jun-25 15:58, Rob Clark wrote:
>>>>>>> These runners are no more.  So remove the jobs.
>>>>>>>
>>>>>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> Do we have anyone using cheza at all anymore then?
>>>>>
>>>>> Probably not
>>>>
>>>> Adding +Doug +Akhil +Jessica, if we don't have any users, we may
>>>> get rid of it upstream, as it never made it to the outside-outside
>>>> world..
>>>>
>>>> Konrad
>>>
>>> I am not aware of anyone using Cheza boards within Qcom. So it is fine
>>> with me if you plan to remove the DT bits.
>>
>> As far as I'm aware, anyone at Google who had a cheza gave it to Rob
>> to put in his lab. If Rob says nobody is using it then I'm 99.9%
>> certain that nobody at Google is using it anymore. There were a very
>> small number of external developers who were given a cheza prototype
>> but I can't quite imagine any of them still using it.
> 
> If it helps, this is what the batteries looked like when we pulled the
> cheza's out of the CI farm:
> 
> https://photos.app.goo.gl/Eh8EJhqBhKUuYfiH8
> 
> ;-)

Spicy!

Thanks for confirming folks

Konrad

