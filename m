Return-Path: <linux-arm-msm+bounces-71372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE6B3DCB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 10:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA7E8189D63B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4422FB619;
	Mon,  1 Sep 2025 08:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jy05AZlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19382FAC1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715927; cv=none; b=HUYvL5PPz3HlwFGp8hB08Zquv12dfUAc5RMx+/8+2wFxUgm8p7VeNDx1Wob5yQp5zoSmoWNNdLXpwBf6LOFK7DnTlqhbpfEe+XwWe2O0+r2KGayoCH91PbySJF9fXRHTfvdivPadTVhr5AkPWAHh0t+9x5UG29nunt8q15lnxpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715927; c=relaxed/simple;
	bh=ZO87uo9IYsZLjjt/l7L32ClnCZ4s/EkhmsCq9kk/UMQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RI//Ct6++1B+e6+x6lsApqwaTBsPOU11lNXSrmmJhxdBPKOAft/hDd327uiu9zIr1JVs4Vix7bpRV5G+Qh5i0WftxaNK7Qbn5fPWCoTQJ+M7R0/SMprENF8QX2xHA6FRu9JbgxnxifxlVzYxsFFPOvq2tYFMgXHyFBfIQ/WsmPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jy05AZlF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5818F4tE010735
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 08:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1J076/LQgI+3eWtUeFftMALqG6G2irnWWLjDqPX+63E=; b=jy05AZlF4U+KbBD4
	TfBvoLftuB4zowARI2w17Xd4334aLgFV0N9EiseTD7BVYVyt1s2s98olfk/rRQ61
	E8BHwT8h/dV70f0+LnMtzZWxg6J0NoiJzfF8H65Cd0UJUgTU9ifXOx/Ur731Sece
	+H39Ax6zrPz/8EE8+xbiW7RA6aWd4iWbixllIWW91gw/G1f7fNREVAH/7ea+IOlq
	Lzma4heZYFjyDENVOOJ5CqDN0AXAd076JioKunxRpsRwLnw9nAwM8gwNeBlIHnJ0
	zA8NbzZlhvhdKiX7peQ7J8+7PD+QmQD8ATQMLkcxMMhmIRqJ4qYIUyvhBxi4Z02u
	F0Dwwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48usp7uxm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 08:38:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7724903b0edso1328751b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 01:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715923; x=1757320723;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J076/LQgI+3eWtUeFftMALqG6G2irnWWLjDqPX+63E=;
        b=jDoCQy91aWZCXo/HEy847MATh2EyQeai1JO96bd7wq+HMZjPqjU/tUOhU6PnfMJlgB
         LgT6VrzT+1THq0NhEeNDEWE9MIE87hcPEIJuSLh9McMuL3wdlpWCGgEWLOYIeC+xAuje
         hb2aN231wqD7l0vxvczj1AzPYVS+50gLfToFU/uU+BYaP9C+PF5vOcF4Vl0zOfmWzOU3
         OHIg9vyzILVvtcPQ05eSrJP2op/QyY4/M3PdJWFQXWhV0rrxEiRbXXxyOugW8WWPuv1L
         Ds1gbwC5q4mvs/Ryu4pfs2c6YJvl12rbeSc5lqoQGXD47dJUZALUxIhy8FTwg/4Pi4ZT
         IGTg==
X-Forwarded-Encrypted: i=1; AJvYcCXvTEjGTEQwVXQT+ir4OjY1FKOMz2j4DZU/7aPUUvxu7NrS7rVZrbJIpmJGV8ij/liPIRjmwg12Y6VhNNLj@vger.kernel.org
X-Gm-Message-State: AOJu0YwJbtkcxrapcTFP3abKTo634EY67uAB3tebB8qW+racZlhgRPd8
	effeuK+F6Hr6rLnEI6bOWE0lpAr8RYp/fXiSO+YlpvB7a3lp0qUZHYtJJB3TiCc2buYAvmmybxM
	qvkob0Qwhy4GeLtD530qFQqp8X7/ooO5czOsPhWscNThkBJ4gQGGpVzJE4te+rinqmRGC
X-Gm-Gg: ASbGncsEt77LuVh68MpLavlVEY2x5l6AD4iGqB7nJfHYTYkZYiDVTN3jwkZDGaEZYhH
	T4SyVTSlgUnBcG6ICBcGrRn3B9VWTzhR4+CHJI5lEUk6kFSKtHGBvlM5pQ0syFbaoNyxjBpHl53
	J3/MlO2nBUUgVy7oFBYIRLjbl73+tYSWdZyov8mN+QFFUCp/lwjskWBn5rV2w/d6PhiIeC+cw9I
	deYRFlrA9V4K+HpMjv5gZa+UjqVk3XNJQ3NxDWdmHzjyhk731Nd283NPDLxw+mQFxd2mGWD79WG
	d8/khiCosCPDGCJbGD54AKQPWgJJhUfdLTlY44RGLxs21PpXDEHcpWfipJtYu9jiT3Akwu/86bM
	T4V0iZeWlV6uo4dlZFWPnFxLqq6d33Yq8Uw==
X-Received: by 2002:a05:6a00:1789:b0:772:2e00:831f with SMTP id d2e1a72fcca58-7723e1f1deemr10329857b3a.4.1756715923369;
        Mon, 01 Sep 2025 01:38:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsvQVbqKRANvlU7zeqIf181vFzHz2jPH5oH4pRglmEHl2qc84zDD29EMGRW7zDIDTyLCRwSA==
X-Received: by 2002:a05:6a00:1789:b0:772:2e00:831f with SMTP id d2e1a72fcca58-7723e1f1deemr10329810b3a.4.1756715922864;
        Mon, 01 Sep 2025 01:38:42 -0700 (PDT)
Received: from [10.133.33.247] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb72sm9925996b3a.61.2025.09.01.01.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:38:42 -0700 (PDT)
Message-ID: <15147896-1378-4a3d-85ba-4258046f9e31@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 16:38:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
 <20250831-itnoc-v4-3-f0fb0ef822a5@oss.qualcomm.com>
 <b608b4b2-f850-4b49-be65-b2f4e3784dd5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b608b4b2-f850-4b49-be65-b2f4e3784dd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX045IrbpbPgAK
 pCNob+yDlo7+JLFrfn2trxSR6U4yhQN5uW4zOuX5koW50bMOnn4bNBlluQosKPnhAVEpVVidhhc
 uDsZpQNrbVm7GU7nSI7B60zo0WJUIod7D/Icf4toU0uPzZBUuqKAo798bFv6TFOEkAjY0jUMfmy
 9smOVW/BeO2SeeGQFnlokitRCuYz58vd8qz32IpvA9D5VVy/sI23pldWveCMYJ1t2oaZZK5qRkC
 dOGGNXQe/CHvQ3ddA4K7uqhMFveaTNn6ytkiO+KQ5cbGxtf9mYbgkdTjIBfJ+bVM11+sKgDrn8+
 5F18bGmk89jwQsiDDdb6BpCMBbPoeTmNA6LckKj0oY7xQAjSWIEiv0MYmJwm2kgbApLPwqM9KMa
 gY4JYx09
X-Authority-Analysis: v=2.4 cv=e6wGSbp/ c=1 sm=1 tr=0 ts=68b55b94 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=ZZ2O94ThGh-PlZ2E-5gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: GFAg0Mn74hIsK3nUAiHOTv2Jic1ERNKi
X-Proofpoint-ORIG-GUID: GFAg0Mn74hIsK3nUAiHOTv2Jic1ERNKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300034

Dear all,

Apologies — I mistakenly included an unintended attachment in my previous reply regarding the patch submission.

Please disregard the attachment; it is not relevant to the discussion.

Thank you for your understanding.

Best regards,
Yuanfang Zhang

On 9/1/2025 4:30 PM, yuanfang zhang wrote:
> On 9/1/2025 2:58 PM, Yuanfang Zhang wrote:
>> This patch adds runtime power management support for platform-based
>> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
>> resume callbacks to manage the APB clock (`pclk`) during device runtime
>> transitions.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index 5be882300d79bc0173aa6a19d7da1d48c4aaca9c..2c5370497076536bfa868f0d80db775ef242968b 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -301,6 +301,28 @@ static void itnoc_remove(struct platform_device *pdev)
>>  	pm_runtime_disable(&pdev->dev);
>>  }
>>  
>> +#ifdef CONFIG_PM
>> +static int itnoc_runtime_suspend(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(drvdata->pclk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int itnoc_runtime_resume(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	return clk_prepare_enable(drvdata->pclk);
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops itnoc_dev_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
>> +};
>> +
>>  static const struct of_device_id itnoc_of_match[] = {
>>  	{ .compatible = "qcom,coresight-itnoc" },
>>  	{}
>> @@ -314,6 +336,7 @@ static struct platform_driver itnoc_driver = {
>>  		.name = "coresight-itnoc",
>>  		.of_match_table = itnoc_of_match,
>>  		.suppress_bind_attrs = true,
>> +		.pm = &itnoc_dev_pm_ops,
>>  	},
>>  };
>>  
>>
> 
> missed Reviewed-by: Leo Yan <leo.yan@arm.com> tag.
> 
> thanks,
> yuanfang.


