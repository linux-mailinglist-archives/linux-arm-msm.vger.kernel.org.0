Return-Path: <linux-arm-msm+bounces-58423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93275ABBB7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42BEB17B533
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DA3194098;
	Mon, 19 May 2025 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0kfU89D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEB1274646
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652016; cv=none; b=ET91By+D8EZ6rHAWXT0W66h1JHIgI9yuYwNNOTRBaPuUBH6uisrKPGHDStK0/rYOoeQ/tZ40eUV8qQT6Owq08Av5HEL1ArXgoZCnnrb64ln1d0OukxPMGFSs2SFLjuo74/nyBuU8GiI+9eLevw3xaEDDV5ZRtVgNECWVQiFO0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652016; c=relaxed/simple;
	bh=hhHKNb/E8IQ4a1HJma0UcH/dXAFbp1KwEvzCsLqEII4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LG0c/NM/T/ee0gghBDMQDuAOc06fo7wyVh5Idc/DSX8DGVFpUDWZc5BAzHNOcwEjwqpzloEixDqqB4v5DtYO1cqOkELmB1kDx6VQoXO5Tluu8zc+Ll+3vAdwDKwgz38Sc9j5ll2eOhmhWS8BQtlsHuIYuYdf8tnyA1coJOQGUfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0kfU89D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ZuIm020271
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+ZG7E/JOJn3gru/ymdvfkkcuGEZIz+WemC28vQ15Do=; b=H0kfU89Dgc91NYIj
	KM+/AZi0xRIPAUlSwDUQ1l6+kfMTHkXkr535vmRotWFjrSKfcirx0mqaTGcDZWLD
	ylwIzHwS80SHxKQOYqLH12zlJie6wTsZBdgTaRqq3l5/mT5uQyafOsmf5q9XE4E8
	uM8JCWa33VfJUXvU1vK5wxW+tYFeMrcoCDuuFkh6xo/7Ex4VL0nxnneyDiv8G6U6
	vr8aezUtBiYGhcuskFwXYhR27a4GZ9QBf3d6K8L/UINNUOEFd6HM0TAacSMd/u5f
	kVzfE1btF9DlK99RzzqT0FIvU50tnYme4xfKkbD5Aj9TpxRImOcY1LW80KfenYMe
	O0dfug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9v2hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:53:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742c03c0272so2245255b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652013; x=1748256813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+ZG7E/JOJn3gru/ymdvfkkcuGEZIz+WemC28vQ15Do=;
        b=lzY4oz5RU/up81ccdqYnV86HbUq1LKXQ85xgyA6tAnrrRXL7DnrITXZFD30Iky3eFi
         /Gx7JN32r6QbKKDvnlrnKbW/pOOaBh2e6a9tzHblG93tjBpDHQ7ZRJ4H2rZ4b86K6w9T
         MChlNdIc8TmGQl3tFRzsV8rt43wjIoBEjdK3iJZLMANG5gLe6UqUDvJdtlF3Z02OH/Je
         izdzGnlzSK4HwWj5hQGccXWJaVVPsIONCTgS83VdymuSFLw847Harhd44JT2DKJNqSGy
         +HZ3TeQIe//VEaJpD/nFMZoaob8nOOtx2/J7Hgucb8R8XOywa0Tuz+F8DCrTZlmmpKUZ
         GnqA==
X-Forwarded-Encrypted: i=1; AJvYcCUlOYEpL07WlCY3W1V1xmHsEwf/ffW+8yCnr2ksroLToMGxIuqEYO8bxHU9I5ZowuKwyZWt0/LKeDdJXTpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGJgQmhK3/fI1J9Nzx4/MWZd6jbuBWINx/JCupouLp/CFW8uIC
	+/ZiyaTsPiFEuFVyK6htBXYxHN9KZq4zqSle0niCyWYOHS93WkQiaKTZp3aSXkjmckTJPrdVpqe
	OId6FR4wocK2ocggLmDd4LyHgOjGsg37mCvSGtz3QDxyTsCbdKyTnHaU5jB2zVowoNZcI
X-Gm-Gg: ASbGncttaea21m6OEww8sQYw2GmvGt8MnNXGlrxVeCTUag9XdNQBpRr32TVd3bScEZ1
	g9m0zvEJI3dR0veDxNed29McvCfvI2BPvHCOY+D6XceH5Bc62o+1LO+9R4KYYF9VOW5VZE16022
	CiaXq70NYIY5zpi/Myz9/2pEnwkqiWz5+hclxtp6ORvLNey4z0OW2oOuJS98Wx0wBUlZymKHnMb
	gRwWghpR3z2PetEP8TRekw/tK6F+ZRqNmzKE1cK7TLM0XKzlwjePImfVug6kcBjgxeRAFV4mGfe
	1OC9AAMYvS6gjzwod+lOyo7rkR+2jU8Dylqm4A==
X-Received: by 2002:aa7:9307:0:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-742a978948dmr17785605b3a.2.1747652013136;
        Mon, 19 May 2025 03:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrCA3ts80vPVWBuJh01f2u87CCoVZB7Kcjv8ZQtCorGnLjmsfhC9Kytj6R6pn2YQJ8MxSw0w==
X-Received: by 2002:aa7:9307:0:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-742a978948dmr17785575b3a.2.1747652012726;
        Mon, 19 May 2025 03:53:32 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a2550sm5924978b3a.167.2025.05.19.03.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:53:32 -0700 (PDT)
Message-ID: <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:23:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2B-BqGcr4cB2qPi78aGxlJ5Vn-PkLN8E
X-Proofpoint-ORIG-GUID: 2B-BqGcr4cB2qPi78aGxlJ5Vn-PkLN8E
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b0dae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rIkCaffdF0HaKj1PvZkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfX7pZLjhizKH48
 8GIwfRfMSWOPohhqIMtAk7ESim8BNlMx4Odpf7sDg7mxFgiZVYcd+wxE9tER7xYGUxihBs2l2FV
 0akFCKD4usGxRfKYrh6DccmnQaS/mNvo7b9bXT67vFRAHMo5tCKUEgZqFrHvQmJawimgiA6MlOS
 +D5HSo1I7xcauchr2zokOwr7lhRVpBTt+1asvkZlelkMLKMGbExUSR3Y2Qd7XgvZnu1FOjY8jIF
 E5vjS22YCGRqCcvyx6Gw3XcpOxBnUW8wybFo9elcJvsobW8PrsAWgyvINnu90/uF1ZhbHASh9E7
 AFtNAEYhAi6AZtWPBD/f5XhOlC5j/XgA2TJO0i3TNmFwoz6D6cxm0gajZzjHC2ZiB+/IgPG6aBg
 iU1k0L5Er3to/ridIR+tv4xtVBLfhWQBMkqNtQU48MaX2PfjxIAwFMpjvFvjEARtpQbRBcOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190102



On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. Set the number
> What is 'properly'? Which issues?

inbuf.pageslen is getting updated to 1 in case buffer is allocated, which only
happens if (!fl->cctx->audio_init_mem).

Till now pageslen is always 0 irrespective of whether the memory is allocated
or not due to which audio PD is never able to use this memory.

I'll update this to the commit in the next spin.

>
>> of pages to one to ensure that the initially allocated memory is
>> correctly added to the Audio PD memory pool.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d4e38b5e5e6c..b629e24f00bc 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  		goto err;
>>  	}
>>  
>> +	inbuf.client_id = fl->client_id;
>> +	inbuf.namelen = init.namelen;
>> +	inbuf.pageslen = 0;
>>  	if (!fl->cctx->audio_init_mem) {
>>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>  						&buf);
>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>>  			fl->cctx->audio_init_mem = true;
>> +			inbuf.pageslen = 1;
>>  		}
>>  	}
>>  
>> -	inbuf.client_id = fl->client_id;
>> -	inbuf.namelen = init.namelen;
>> -	inbuf.pageslen = 0;
>>  	fl->pd = USER_PD;
>>  
>>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
>> -- 
>> 2.34.1
>>


