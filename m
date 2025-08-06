Return-Path: <linux-arm-msm+bounces-67850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D08B1C06F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 08:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1534D180AB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 06:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6A0207DF7;
	Wed,  6 Aug 2025 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3uz2cyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E61EFF9B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754461814; cv=none; b=Ylyutjrr16juDKCHxxS6HUReNdaHVX5LzfejLSBhRqhI0Z30wP9FV//N5q8dOBetSZMAtCBJcxgNNwmWwp9csFoCC77wTimJly3eMeV6Ppox4oxU2DP/B7tYehnLOwJzeV1Ykl7YQpB/oVbcTcfPrjwH2y4GI823LJ1idKnKB60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754461814; c=relaxed/simple;
	bh=CgooJ/jB093nYS3wRfCZw5jiPQzBfc+yd3WzwPS1Eso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9opfaISC5vn4F+5tOA8Uu3FxSK70Wf8sfpyPrMloDCcX7u8VhanMsdKF2mPPs2jMRdygB2N7pZzNn9fzX8KlAS55Tjx72FNONoqeh049yyAC+0NtYzRxh2AUg30EvLauj+HOIP7hcc2oG8rayQwhQcdJmV2av5VMPvzr9EJfns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3uz2cyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FlLe020382
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 06:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJtqmRjoumc2ISMrT27MKjQkUzD5+VvQigPSswUASss=; b=O3uz2cyXuhDQmSYI
	K2B18aK3qg+AYb5RUumOXeQX8TlyEMv4wrP5kqlkmPqdxPu4ZV6yh2ra+opLHoP/
	PzstktAU/jK0CevuBWUc3ota6WEgTD0n3vHoXfnsilhbNee//np2ZBxwQftiRNWF
	EI4aPbyNknCq/ytOGbZFrgY345vD80R9yeDPG5FRdGOWRPYVqcgpGMgEnhtvD8lj
	UA3MsrFpLicOEdGixkbSYKhMLtRbwoTSFKvtOxEMkQUUcckJHXpP7Vu0X3bFaJDK
	rVolGXECH+LC1uQM70gS/GcVlSfEmACGwah6E4GuLT+cPhSMEu+pT6OsgXBxlRR/
	Hi3zwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw19q8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 06:30:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31eb41391f3so5855330a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 23:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754461810; x=1755066610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJtqmRjoumc2ISMrT27MKjQkUzD5+VvQigPSswUASss=;
        b=wzvBheFV0T5jQ4STd08NZxEy6V43keFxb/QjfBoraqWE3wWLyuvA2NjNSmpA+1bTSA
         LeKuc+OupVIsM6HWo7TRiPuesOGRM6+8mg61ZdmrstlqsMuXkyQpRUOtLjJZPIQ3TOtw
         tx5Ud1sqq9dSoDdJ74QMaRBgUHcGR8sAxtntGj9sXymWRq7iYgQAiYPq+hBtHzNS129Q
         kSKZXOcowpfonymCFtsT1tYQd5kgJTgl52eQMnMtl65/Qg/Fj7IkulmQ9/st0qcjW3DE
         H/D9YiVSYEHUuAje4OJIlrvBMcb2LdnSK6bF0+eb2mUO202IX0hdLAKWKZutuxHA2KG+
         wZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIJxRn7ojT+K7z0dmKhQxH/OtUVUMubbf6MpX1P/cVJ25I5NsWpA580nkyy03iyWiVnMV1+cLza/WnSZat@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1jyl2+OSBi4hJebbMlgZR8bGO7Vps9KtObTPpPx0xE8GuAee
	tV3m/bpJVElXjznPo0DuO1wrTXxTP6nx3I/2gHEvUdJ38+P1U82WtCalbxno/lmLTtCp1iavSGS
	o0JJ3oaU8tFiQ/PynYL0EolX2FftDI8s/POTnGle4G743WB2uO5wFMUp/mMVxKKChM8Kf
X-Gm-Gg: ASbGnctG1HTF3yLzwTM6+G/7/72HbhYvU8E8o+UCEsDOw4RYal65XaTOo9uh0Q1emSa
	ZqwYaH+gK9QtFMCSlP6cI1DWHfqnnBy9YJ4V4GQGx1jhmorKaUIJCEGkMMFR5dh8aOtfFs+LcTt
	O9rdrOn9ebqAiWkRw3LOeUhMYzCxhXVQsF+QRqadDH1piwASlDdfLGmsnEQk+pxN+KQAcYju0J/
	9wLeHgNL+U3PnLUABLuXRtzW1MNTadhAialDHxTbjs/W1LuP//j59mOaOfRwzO0G7nq+dO2Mabw
	YJTHE9bZBkQFsz7xxJ8Vjn+1cGb22kYfqRZ1b3Gx8/45w0qvjI877gYRo79ohbexqxz/RqSvmHL
	5xiAk8KXg/emCuICZVRWBjYs+
X-Received: by 2002:a17:90b:5706:b0:31f:6d95:8f76 with SMTP id 98e67ed59e1d1-32166cca3e0mr1947024a91.29.1754461810401;
        Tue, 05 Aug 2025 23:30:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQzfZEJLHL6MCbJYYh45x632/2CHYTmprEp0TtYcsp2qKJGyhNfr/FhP3PJd1HyC3SEDMGfw==
X-Received: by 2002:a17:90b:5706:b0:31f:6d95:8f76 with SMTP id 98e67ed59e1d1-32166cca3e0mr1946971a91.29.1754461809894;
        Tue, 05 Aug 2025 23:30:09 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d86f7sm12649913a12.24.2025.08.05.23.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 23:30:09 -0700 (PDT)
Message-ID: <70bf0c0c-4a78-4caa-ab86-76a2c99c113a@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 14:30:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] coresight: tmc: Introduce tmc_read_ops to wrap
 read operations
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-6-jie.gan@oss.qualcomm.com>
 <CAJ9a7VgYTUsBn8=qtfwmkoS6Lib-8LgESLBDxXrRVqLnScLKZA@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VgYTUsBn8=qtfwmkoS6Lib-8LgESLBDxXrRVqLnScLKZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9helVUaPiMRt
 /c8/fMoh5A5/fJfaJTBm0hC+BkrqR3/PaPX+mr/VfHKBBNswz2mwWMMeUow+6MIotNQZT+lH+4z
 R0iLSx1+RTaAJlowVsoL5xmqmzcKYOU7e8gjXkatZ/6Dli7ldoG2hQVe82qs9r1oVP6tQvZc6Kq
 g/g1bI5jRafMjIYUhehiaU7bLgn/5dEfJIMwp6kTyDAikZ6KcDuaaxF7tHZmfhP4Sr2uB2VmYFY
 QxPRpkHqZwTucgzdCjkKP0qXwwVZpiHnCMuR9b4tWFtiT4mZTrZCB7fa0AIZY2Sv5cT+qJrV6WF
 KMoCYcLnSz8P8mKKkx6vfpXlFZGcJTFCZqMgAWHVA+FzjOvZn09tv+LpWA2TdikPukZxGORiyvF
 rFZEjrk+
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6892f673 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=eQTT6voJP-nWTqyz9zoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Aj6Mc6el1WOqXC9_9S1kx3okI0-CyhQx
X-Proofpoint-GUID: Aj6Mc6el1WOqXC9_9S1kx3okI0-CyhQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/5/2025 6:55 PM, Mike Leach wrote:
> Hi
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Introduce tmc_read_ops as a wrapper, wrap read operations, for reading
>> trace data from the TMC buffer.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-core.c  | 50 +++++++++----------
>>   drivers/hwtracing/coresight/coresight-tmc.h   | 17 +++++++
>>   2 files changed, 40 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 4d249af93097..f668047c5df4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>>   {
>>          int ret = 0;
>>
>> -       switch (drvdata->config_type) {
>> -       case TMC_CONFIG_TYPE_ETB:
>> -       case TMC_CONFIG_TYPE_ETF:
>> -               ret = tmc_read_prepare_etb(drvdata);
>> -               break;
>> -       case TMC_CONFIG_TYPE_ETR:
>> -               ret = tmc_read_prepare_etr(drvdata);
>> -               break;
>> -       default:
>> +       if (drvdata->read_ops)
>> +               ret = drvdata->read_ops->read_prepare(drvdata);
>> +       else
>>                  ret = -EINVAL;
>> -       }
>>
>>          if (!ret)
>>                  dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
>> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
>>   {
>>          int ret = 0;
>>
>> -       switch (drvdata->config_type) {
>> -       case TMC_CONFIG_TYPE_ETB:
>> -       case TMC_CONFIG_TYPE_ETF:
>> -               ret = tmc_read_unprepare_etb(drvdata);
>> -               break;
>> -       case TMC_CONFIG_TYPE_ETR:
>> -               ret = tmc_read_unprepare_etr(drvdata);
>> -               break;
>> -       default:
>> +       if (drvdata->read_ops)
>> +               ret = drvdata->read_ops->read_unprepare(drvdata);
>> +       else
>>                  ret = -EINVAL;
>> -       }
>>
>>          if (!ret)
>>                  dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
>> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
>>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
>>                                     char **bufpp)
>>   {
>> -       switch (drvdata->config_type) {
>> -       case TMC_CONFIG_TYPE_ETB:
>> -       case TMC_CONFIG_TYPE_ETF:
>> -               return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -       case TMC_CONFIG_TYPE_ETR:
>> -               return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -       }
>> +       if (drvdata->read_ops)
>> +               return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
>>
>>          return -EINVAL;
>>   }
>> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
>>                          "Valid crash tracedata found\n");
>>   }
>>
>> +static const struct tmc_read_ops tmc_etb_read_ops = {
>> +       .read_prepare   = tmc_read_prepare_etb,
>> +       .read_unprepare = tmc_read_unprepare_etb,
>> +       .get_trace_data = tmc_etb_get_sysfs_trace,
>> +};
>> +
>> +static const struct tmc_read_ops tmc_etr_read_ops = {
>> +       .read_prepare   = tmc_read_prepare_etr,
>> +       .read_unprepare = tmc_read_unprepare_etr,
>> +       .get_trace_data = tmc_etr_get_sysfs_trace,
>> +};
>> +
>>   static int __tmc_probe(struct device *dev, struct resource *res)
>>   {
>>          int ret = 0;
>> @@ -818,6 +811,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>>                  desc.ops = &tmc_etb_cs_ops;
>>                  dev_list = &etb_devs;
>> +               drvdata->read_ops = &tmc_etb_read_ops;
>>                  break;
>>          case TMC_CONFIG_TYPE_ETR:
>>                  desc.groups = coresight_etr_groups;
>> @@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  mutex_init(&drvdata->idr_mutex);
>>                  dev_list = &etr_devs;
>>                  INIT_LIST_HEAD(&drvdata->etr_buf_list);
>> +               drvdata->read_ops = &tmc_etr_read_ops;
>>                  break;
>>          case TMC_CONFIG_TYPE_ETF:
>>                  desc.groups = coresight_etf_groups;
>> @@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>>                  desc.ops = &tmc_etf_cs_ops;
>>                  dev_list = &etf_devs;
>> +               drvdata->read_ops = &tmc_etb_read_ops;
>>                  break;
>>          default:
>>                  pr_err("%s: Unsupported TMC config\n", desc.name);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 3cb8ba9f88f5..2ad8e288c94b 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -223,6 +223,8 @@ struct etr_buf_node {
>>          struct list_head        node;
>>   };
>>
>> +struct tmc_read_ops;
>> +
> 
> declare the entire structure here rather than later.

There is an issue of declare the entire structure here because the 
function pointer needs use the struct tmc_drvdata which is not defined 
at this point and it will cause a compile error.

Thanks,
Jie

> 
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @pclk:      APB clock if present, otherwise NULL
>> @@ -259,6 +261,7 @@ struct etr_buf_node {
>>    *              Used by ETR/ETF.
>>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    * @reading_node: Available buffer for byte-cntr reading.
>> + * @tmc_read_ops: Read operations for TMC device.
>>    */
>>   struct tmc_drvdata {
>>          struct clk              *pclk;
>> @@ -290,6 +293,20 @@ struct tmc_drvdata {
>>          struct tmc_resrv_buf    crash_mdata;
>>          struct list_head        etr_buf_list;
>>          struct etr_buf_node     *reading_node;
>> +       const struct tmc_read_ops       *read_ops;
> 
> probably should be named sysfs_read_ops to be consistent with the
> perf/sysfs differentiation within the rest of the structure
> 
>> +};
>> +
>> +/**
>> + * struct tmc_read_ops - read operations for TMC and its helper devices
>> + * @read_prepare:      prepare operation.
>> + * @read_unprepare:    unprepare operation.
>> + * @get_trace_data:    read operation.
>> + */
>> +struct tmc_read_ops {
>> +       int (*read_prepare)(struct tmc_drvdata *drvdata);
>> +       int (*read_unprepare)(struct tmc_drvdata *drvdata);
>> +       ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
>> +                                 size_t len, char **bufpp);
>>   };
>>
>>   struct etr_buf_operations {
>> --
>> 2.34.1
>>
> 
> with the above changes:-
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 


