Return-Path: <linux-arm-msm+bounces-84277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BBCA230C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 03:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 184183002B1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 02:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6476714EC73;
	Thu,  4 Dec 2025 02:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPnhsTbZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYVOnDOs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5632F9DB0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816335; cv=none; b=pEDHlwrdUB/+hH1ZQi0mMrBbeU4TB6iW/zckx5lW+LBCeHsQDM1oEt5hkCc+OKaDCxr0jZ88H4KvztiSeeTNMKBWzIHPxxffdKfRfBKaUbbcRJ+9sEDJ/WrsZMv1Q4P/LhAvscsGFjmB1vWUD8DNx2ggD+TOiOmQwuZmJdVTHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816335; c=relaxed/simple;
	bh=HIVx64jSl++zSAL3wfQIndyBBOyq1M6NuIIm/yBlHQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbp5eLEgQgbUUNQlan7oeRhXEspFgJSApAJHaHEGKmcHy/ELwnrGvTR0ODr2BwE7sZkoRC4OejfRPf/pDnc27TN9DIgdQzLJORdA2j6nOmOVphxep7RcwrTkKkbbNaQorTXoS3M+YcjCSBjoaL/aWXR+rjAXPixOpD7L0sJQCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPnhsTbZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYVOnDOs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3H6sfo2844348
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVS7raly54q0rZvgh+jBl9xmb+xtSnb+plPkT836p9k=; b=hPnhsTbZ7fp8xKMh
	jdhilo8QCLKnWCHEALzpbteXVuG7A7GrxC9JZuU8kQN68l3eLQ0zFnabaVeiAutk
	5hQ9+Pll+ozdGOP903ZXY0HdCJEjUNRjHU6jt3PoKXqPIYXZNj/yLS5Msjmltuie
	2z/DBSTkE2THajN1GjZP+/dRz1SNab2iSLA7N6Ap/Y8Qspq54tAVHP93CRi5dV+r
	qWgf4EA4NQ21lzUU7lyHLbekmYzcCR7mOSjrcd96SvE1TdiAo9DqrGuM0psEmn2e
	p0fLT1jR30Bl7kQpczaL8uFE6M9FYhBdqAYreRPeMk+vKC5jNjqJATpb2L18FxoF
	MlS1zQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atsar1j2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:45:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b80de683efso703963b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816330; x=1765421130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVS7raly54q0rZvgh+jBl9xmb+xtSnb+plPkT836p9k=;
        b=NYVOnDOs2p4EpI9P9rBSIfBaMEJ+6SqWa+TmLqokGlISaDFm2sepV9Ig6N5i8yTTMZ
         MDt8LTiAISigMxKu9c/+CRBW/YOhCQ/SkVNQZHpoVp17SHEeZQZkzI9mPfHckwjBWL2G
         yxspVND1sEhKpkItL32fReSQkrto1UQAiXr8caK3mUxKNKSOQpBotBmJhaK+i6atzWQc
         cOnbEc7Wx3+VduP1GXUt51KHeOd6AHo1eckF1kl4BcK991/eNtz49sjAz4k8u0FTZUJC
         flClMan6z+4U6iL8LdFba6LBaDsMmDz2hNwaba2NB1yF9DEFyWvVgE1Z/4mUfMsKDF59
         WsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816330; x=1765421130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVS7raly54q0rZvgh+jBl9xmb+xtSnb+plPkT836p9k=;
        b=D41gOYUo+i5g0t6f7IkNik60EliOzCBp4EYQGVBI3jlQ0EinjFkWe7XqaK+o+hAD5T
         AWdNZZ50Zy6R8iErzx92ZT41nVGhTnqguuuA1ZL7uBWVu4YRKKkT1RpBmWGgaXyEaZ+G
         +GVjXU/0smmMytJ7WB2DyTR6LljjDIVyN34D9X00yEq/f5uwomKUSs2SiRppHzPckWMA
         2pPIYf8e/oc8z3WDnO/uJylvbewGFle/5cuBv4QjpRS/IqDTiMX7dvIAmtyqyu23j977
         pmgjut6jM2yUR6xYWyQASmk+Dr2kYUJ/tmze8LxeUlPX9cOdLRpWwNn1Hzf4ya7mQmmP
         JARA==
X-Forwarded-Encrypted: i=1; AJvYcCViR6BnYocAVKUkmzXkpxYiPHvJDMyMXA67ZRx03xXOOjDIxyIcNS7wc5o1OXsmuMx9P+tx3kW5Nm6FQ1RJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwTU1emaGd15jGwZMLzspuLjH40LRfKb8T6ew/PXhgOvts/1X1I
	rzpjpzbp4x7CD011BmK9sEFBcGrAF1okHPhpG4VbD7mCVaJs8NPt1utLtj5Smo64x5xbEhTNGMo
	gqag6PaQKNzn7F2MRUwPO1UeB9B0PAY4KtuRkpl2kYNrZ+vjZG6vp9pQRAgpGi4Rs6/hc
X-Gm-Gg: ASbGncsGCzs3z1zAfprQm15Il6Hekg3gKWspcQ1jMiNEAc0wTv53wlu1eDgshCqBGw3
	TnhRmDoSg4rFe8dHUONiejym1CMGW3Aw6VzYKlXGv5zrTVD72FeW/P0MZN3W4iGqsPMSfrRN3KS
	A5EzC61RY3H55Y90YtyDDy0D/D85g6O1Tqqis/3Db/3MOVH99+ebrSOE3BGBTQ1k593Wd6okSJv
	az2dXR9mnPOPk24T9HdDn4pdHIoBVjB7U/fuqGshjIEBAdqiIudGjbDpW9l1alGRXcD0vxH80Dl
	EdBci4zIJiGkyzvGSwPfEGV4U2De+9GhSaJUlz99jTEsWIbO3PBYG41zVbCLASM06pBbePKuyeP
	cwmCimqYZmxtxCA3rYUZ2JKcr0rQiDhPqwUrhetEuk5lEn4blB2gOLN5aGJNk925MviV+0vmkvH
	4=
X-Received: by 2002:a05:6a00:1803:b0:7b1:79be:1273 with SMTP id d2e1a72fcca58-7e00fbcedaamr5490252b3a.26.1764816330149;
        Wed, 03 Dec 2025 18:45:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE37bJ6SuNkL1ibi+kVSbfhO34dJIPCl5xiwPxofyWOKXbjDtL4lt70R3l5q+n/T6TY9GpAbw==
X-Received: by 2002:a05:6a00:1803:b0:7b1:79be:1273 with SMTP id d2e1a72fcca58-7e00fbcedaamr5490231b3a.26.1764816329603;
        Wed, 03 Dec 2025 18:45:29 -0800 (PST)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a006547fsm370091b3a.21.2025.12.03.18.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:45:28 -0800 (PST)
Message-ID: <156d7def-364d-4fbf-b63f-99e1de657f93@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:45:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-1-1db9e621441a@oss.qualcomm.com>
 <29a61f75-df0b-41da-9c8d-3e2ced0a9ce7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <29a61f75-df0b-41da-9c8d-3e2ced0a9ce7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: noTJXGM385pkMSfD6xXnLqO1iPSE7lkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMCBTYWx0ZWRfXwTlx8djnzTuG
 9xk1FyPPEhLUntKwJcRbchFUQAlsgzIHWQDiKi5yWl9rXN1ALVQsAcag8G0yVNz9RaE5INSPjh+
 UeeU90NUBhmdZIqV+b+Rd+qcMN2nuunS2ujCQOfX86ewzcRt3q1xdHKjEngrS7rlgOn5plHK38w
 n8GPoldkVJDpjvf7yZACvkEZPpk98Qi05lFdeGqaXwvS1jNIGRDsSFhy70YWoX0atpV6vhN6cl+
 WOdBjD/Gm2XYrukLytXrYg3ukIUgKjtCyuygL6VuX/IQ0GD8E7lMz863AmTWY5wZMi1qUkTQN5W
 qjwkNwW1EPcB2TRfxM3wJkAvDD3f7UyUVrEBiNUdAzsPwd4FzmtRhT7tksm1YYy0AQh+RCxZ++F
 MB+wvAu2YtC9rahnTZMWomPFZ0yGxw==
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6930f5ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fsjGGd5fPUumY84vGlEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: noTJXGM385pkMSfD6xXnLqO1iPSE7lkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040020



On 12/4/2025 12:18 AM, Suzuki K Poulose wrote:
> On 08/09/2025 03:01, Jie Gan wrote:
>> Remove ctcu_get_active_port from CTCU module and add it to the core
>> framework.
>>
>> The port number is crucial for the CTCU device to identify which ETR
>> it serves. With the port number we can correctly get required parameters
>> of the CTCU device in TMC module.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 
>> +-----------------
>>   drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
>>   3 files changed, 27 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 1accd7cbd54b..042c4fa39e55 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -580,6 +580,30 @@ struct coresight_device 
>> *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>> +/**
>> + * coresight_get_in_port_dest: get the in-port number of the dest device
>> + * that is connected to the src device.
>> + *
>> + * @src: csdev of the source device.
>> + * @dest: csdev of the destination device.
>> + *
>> + * Return: port number upon success or -EINVAL for fail.
>> + */
>> +int coresight_get_in_port_dest(struct coresight_device *src,
> 
> Please could we make this more explicit :
> 
>      /*
>       * Find the input port number at @csdev where a @remote
>       * device is connected to.
>       */
>      coresight_get_in_port(struct coresight_device *csdev,
>                    struct coresight_device *remote)
>      {
> 
>      }

Hi Suzuki

That's make sense for me, will update in next version.

Thanks,
Jie

> Suzuki
> 
> 


