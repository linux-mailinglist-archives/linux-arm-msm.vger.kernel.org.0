Return-Path: <linux-arm-msm+bounces-67817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B50B1BDED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D4D18A8255
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 00:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D6A78F3A;
	Wed,  6 Aug 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjlQtiz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB7282FA
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754440366; cv=none; b=B6LjikBCZBHcK30hvJJE0LzIq+WOqWfZ7w5wnIzXhZNySfI1zBO3Fj5CVzTdTtMXMxvacB4KXY61vMbAB4Yiib0LuyrimnGx0kGJNq2hLR1nMK2ICl3TcEmuRq/QJZHjDCexXcV21jhZzg3Hg1xF3KYonV9axv48wIiNac0o6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754440366; c=relaxed/simple;
	bh=z/pkgbDTk4xjPzL4wm6uTA32U5+mI7SVR6rXpU8vsls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvCKBCVfIunSQq49IDSKfqJYijqF1E/BmNzSRbEgX9Odx9ykcK5DNPER8crC4AoQHEuntbyf5Fh99XrVIdRiQjlqEat4HhCnD5WFb3UrwCMWczyQMEbbRZOS0K9NpHo///NIdTgXXMh9QSdqQ5Uyz0KGaEQ+oqPHv5+ikyEQY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjlQtiz3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I7SSi003372
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 00:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCm1tUegqx7mcpc1Z5HobyZbVzfa+XlUJ4BJ6xj5K20=; b=gjlQtiz3V+w3xX4V
	6Qlfa6EC744X3TiAjzDrPMi7Y1X7eva4XAjQcp/4Nq3NXtGs6o7sLLLGs3I2hUbw
	o9wBHNAflOXDalxaM19AtYUnb8/fyu+7Ef6tgni2f9tt9UWmNqoctzoNjpRNnIbg
	tYEOokrh+dMS22M2+G/a8tv30UYEDhpnAc8eh4RcEDOANUDKYHBu8ET3Yy/ESrdS
	AjfQSZjB/TLD3v5QlcZkbhtVgi/8pq8Z7RiVSu/K88OqqVRP+d99Zi4+IkN2vloa
	Lx84ub7o4mKTGcYt5AQwwLWbmJFBHRAyngFCaTHOOdXqmfxziTpGjFBMbXG5bfut
	3oHI3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7ruhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 00:32:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ff7d61fb7so3141945ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 17:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754440361; x=1755045161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCm1tUegqx7mcpc1Z5HobyZbVzfa+XlUJ4BJ6xj5K20=;
        b=bWeah+8/LhaFplyfjumSKhtLj2vElaxkuE3rA2HSiJd2UAA+bG6ykBbA4x/sfhoEpJ
         MQleQGQHTpNB4AkoPsHngu1kO+3kF+yfWkADYNL2Muev10MOdqUVU2MnQXAi0Inufv7F
         QrRuX9vdikevX2ty1Od/054N4z6omz+m328FQ9C8ZTvZMaIPu0FlNcHt/aCZXjG4uOcD
         X/G60wUVSwbvB3BVTZWyLNVE7WrRahGVh5EvnFJFeCsZ1W9FnLteOt5DuDiDMx+MNhCv
         6WoCDQy1fCe6GMfw3sm6UAtTFQaEGvZlcYmZzKAFGq9SeiSaGFlbvK7AgLcoJf+FpWi5
         dDKw==
X-Forwarded-Encrypted: i=1; AJvYcCXOwOsEMLiy4ozXbvkWy0tzAZCygGi/QKg41Z0+34y18NdEXDBI8G7l4puwi7lHVegblqZ1BSEv2KpH1jjK@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXPNbgRoG3uobZIX/9D+aP+FIVnKxakRGNVvLQorYAXscOBxw
	J1mGCQ5ANzkklGbx2YWQ997LMPeTOy2c25x+ykkojtkbMywyiliwBt7oGaNMgiChCp3tWkTci+p
	dl29dmVEZLSjxrJHPemdLsHiPJ2PUfs+ICVNZGrH7sfmk4NkBkSlPl5nKSVCoVie90Sp6
X-Gm-Gg: ASbGncvquuSYaxuOOiHIQDHd/8bXfqdLwIppAyUBb+C714gmsZdB0NEQwa8JK0Krp1X
	ebWLp6Fpib/J+LMcBQ9LpbPoSHcKcD65t4AGXZ26f4ZauggGdpWKjfn2rBZFkKGgXNCNYt0CNiZ
	WUDSC3Lf8TQJ0CXMnKyH7WzE/lj6G6hdIKtWJUo2aFrMHkMoWc1ltzuvXTRZz2JrAqBjBmM8JEY
	/yJybnaJNzoFRnL2QSx7N335Ds5WZVwd12LzcI066WnkeuMbfOlR0ghzPjwYn0DaO/nbpVt6NWJ
	V9Asu+tXPWogItkzzPEeNhVQqoczaM2JHQEg/R0nCP9p/oYam4MZlkOToRWF98FbR/TEH/OIEui
	OAl91F9hrd3E/onclz5pBiGc7
X-Received: by 2002:a17:902:e550:b0:240:4d19:8774 with SMTP id d9443c01a7336-2429f98fc5amr10815565ad.24.1754440361516;
        Tue, 05 Aug 2025 17:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr1EmLymPDG9f6dSPFvoN/hEjN48sinKuRQr7dOOX0ZYPmD4JaThfNyEnAqIxOJ6qOmxz6bg==
X-Received: by 2002:a17:902:e550:b0:240:4d19:8774 with SMTP id d9443c01a7336-2429f98fc5amr10815335ad.24.1754440361082;
        Tue, 05 Aug 2025 17:32:41 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21be9sm144969375ad.72.2025.08.05.17.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:32:40 -0700 (PDT)
Message-ID: <ae3a482b-2b8c-4390-a950-f9612303003d@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 08:32:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] coresight: tmc: add etr_buf_list to store
 allocated etr_buf
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <quic_jiegan@quicinc.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-4-jie.gan@oss.qualcomm.com>
 <CAJ9a7VijwFKiaZzKsSKPynWapA3ik9d7JLeE+yVNFB0T62iH-Q@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VijwFKiaZzKsSKPynWapA3ik9d7JLeE+yVNFB0T62iH-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=6892a2aa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=U2YxrCIlBwdvewSZISMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: HXJ_42GCQ1RQwoFVPJYIaIS9Yv9J9tMJ
X-Proofpoint-GUID: HXJ_42GCQ1RQwoFVPJYIaIS9Yv9J9tMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwMiBTYWx0ZWRfXx9bKw2iWEbJR
 pOjEpjqtYBkrMuEhDXa5qBVPcUTIA8cLwuQmsNpB+d4ssUtCKpRvzDG2s58n+1SXtMcCFIlLanf
 QHTrqBi7VE+3qEXteQ0uzmutKTfCHQQFCRRktzC25hq9cJr7tZLAF70LnoT44sEDgBuPQ9TGAjb
 yBNjDb2qFqwiTgbZj3EjbV4zR2bpJ2njsX5tHU2ffnOAORX/3wjN0dxA5JQyiNVvbbpFHxeLwZi
 qGVUCEY2XrzYXrns+smXNn/CRJaTzqihtdDScPbhid3pnGJuAGfplNa9kRQ5Uag42AiqJNwR/Mn
 TNgTUhMbfsiTmLl97pyd3+3jZu7HJjUr2Nu+Id8QhNlmdZ3udbOyimyn/91SmNIBYviPkYBSo9R
 ADUJA+0w5uwUgYN2xaKC7DvGDBEk4BAfF4t46qCI3Xh6N+dXONxSsQjANQyWjPZf+0OcM6vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508060002



On 8/5/2025 6:15 PM, Mike Leach wrote:
> Hi
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add a list to store allocated etr_buf.
>>
>> The byte-cntr functionality requires two etr_buf to receive trace data.
>> The active etr_buf collects the trace data from source device, while the
>> byte-cntr reading function accesses the deactivated etr_buf after is
>> has been filled and synced, transferring data to the userspace.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
>>   drivers/hwtracing/coresight/coresight-tmc.h   | 19 +++++++++++++++++++
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index be964656be93..4d249af93097 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  idr_init(&drvdata->idr);
>>                  mutex_init(&drvdata->idr_mutex);
>>                  dev_list = &etr_devs;
>> +               INIT_LIST_HEAD(&drvdata->etr_buf_list);
>>                  break;
>>          case TMC_CONFIG_TYPE_ETF:
>>                  desc.groups = coresight_etf_groups;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 6541a27a018e..52ee5f8efe8c 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,21 @@ struct tmc_resrv_buf {
>>          s64             len;
>>   };
>>
>> +/**
>> + * @sysfs_buf: Allocated sysfs_buf.
>> + * @is_free:   Indicates whether the buffer is free to choose.
>> + * @reading:   Indicates whether the buffer is reading.
>> + * @pos:       Position of the buffer.
>> + * @node:      Node in etr_buf_list.
>> + */
>> +struct etr_buf_node {
>> +       struct etr_buf          *sysfs_buf;
>> +       bool                    is_free;
>> +       bool                    reading;
>> +       loff_t                  pos;
>> +       struct list_head        node;
>> +};
>> +
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @pclk:      APB clock if present, otherwise NULL
>> @@ -242,6 +257,8 @@ struct tmc_resrv_buf {
>>    *             (after crash) by default.
>>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>>    *              Used by ETR/ETF.
>> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>> + * @reading_node: Available buffer for byte-cntr reading.
>>    */
>>   struct tmc_drvdata {
>>          struct clk              *pclk;
>> @@ -271,6 +288,8 @@ struct tmc_drvdata {
>>          struct etr_buf          *perf_buf;
>>          struct tmc_resrv_buf    resrv_buf;
>>          struct tmc_resrv_buf    crash_mdata;
>> +       struct list_head        etr_buf_list;
>> +       struct etr_buf_node     *reading_node;
> 
> Potential simplification:-
> do you need both reading_node here and reading in the etr_buf_node?
> reading_node handles the logic for which buffer is being read, while
> is_free handles the empty/full logic - reading seems unneeded?

Yes, you are right. I checked the usage of reading. It can be replaced 
by reading_node in switch function.

I will simplify this patch in next version.

Thanks,
Jie

> 
>>   };
>>
>>   struct etr_buf_operations {
>> --
>> 2.34.1
>>
> 
> regards
> 
> Mike
> 


