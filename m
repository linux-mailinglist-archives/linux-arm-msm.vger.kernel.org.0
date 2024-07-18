Return-Path: <linux-arm-msm+bounces-26516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954793465D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 04:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C959828312A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 02:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB4025762;
	Thu, 18 Jul 2024 02:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c2p4iut+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3795020B33;
	Thu, 18 Jul 2024 02:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721269470; cv=none; b=cYrNJr7+uDOsnayLeaoQU4bX0CgMnC5dIx4MXrQvB0U8ViTKefazpCPKumjrYI+FMCF6+xuib+VUqDevWhpezk3+My/DGouJWWp0liMKIQbkCG9SKKVj2Y/b/KoubuC/KJfr66Fygh1XsPo4jdFJeD4wHAbSsoIACnAi4gJ1CBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721269470; c=relaxed/simple;
	bh=lHS4zU9RNzvGGwaAQfyMzzzCTd2SiLmWhRRuHYwpAZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kDCPPt7uUTHY3k1t7JmNW/6k2Yn0XP3MMj+/iPtKH6jmH9PIz2rVzdsOi5JNbvjIT74iShEXuxIzuf0yz7WO/iOPfG/XAvOi14GXEJrstoAK6hmyCY9gYLmUOUis7a702F2n4Kx+C0vhB1OhxKzj2gplo8jlLG8hWMeCavC+TII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c2p4iut+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HGQGva006695;
	Thu, 18 Jul 2024 02:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzJgd9zfvvdrG2bbFqEDHpkkm0MYQWtDeLx1mGAsuOw=; b=c2p4iut+4ahyvtnA
	SfIXaMVIoiDjwQAMqcnXCczZd3yrCe2qNLINVPH/DD9ccJHDEWRJ/64fwzcrRtjx
	Serx+7zYGoFhpSoNCwNPDOyRM93ncvwon0a2BDGc+L/LrhNMQIvTj7F1CLe8dQL0
	OaSwPpnXwyVVQ0Snb8ffropDrAgyo8Y9tc7IJ1ztI1uBRkp3lp4AAQqWfipiZaTo
	9wr49sZ/sEa7hKm9W9GpOtXGv8GacNZ8KhYgdD6W2Z7c/vILMa3Qjwn7Ntc+Rt7m
	QDknbTr12wYJfFvUGX6gBnYBlVxFtqBKMvs9lsC6rOKBB2CZrmcK1dCsSIY0/R+q
	C9hAqw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfxc42a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 02:24:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I2OGwT028956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 02:24:16 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 19:24:12 -0700
Message-ID: <b32ffd89-fbb1-4796-9780-d3c334d69485@quicinc.com>
Date: Thu, 18 Jul 2024 10:24:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight-tpda: Optimize the function of reading
 element size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240711081750.21792-1-quic_taozha@quicinc.com>
 <20240711081750.21792-4-quic_taozha@quicinc.com>
 <5d285a7e-d762-4c8c-8128-bb3b543f6423@arm.com>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <5d285a7e-d762-4c8c-8128-bb3b543f6423@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r31Ob2gzt3mX4HXbXl_8MwOd-qpGjwXd
X-Proofpoint-GUID: r31Ob2gzt3mX4HXbXl_8MwOd-qpGjwXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_19,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180014


On 7/11/2024 9:25 PM, Suzuki K Poulose wrote:
> On 11/07/2024 09:17, Tao Zhang wrote:
>> Since the new funnel device supports multi-port output scenarios,
>> there may be more than one TPDM connected to one TPDA. In this
>> way, when reading the element size of the TPDM, TPDA driver needs
>> to find the expected TPDM corresponding to the filter source.
>> When TPDA finds a TPDM or a filter source from a input connection,
>> it will read the Devicetree to get the expected TPDM's element
>> size.
>>
>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c 
>> b/drivers/hwtracing/coresight/coresight-tpda.c
>> index bfca103f9f84..4936ba4a7625 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -110,6 +110,8 @@ static int tpda_get_element_size(struct 
>> tpda_drvdata *drvdata,
>>               csdev->pdata->in_conns[i]->dest_port != inport)
>>               continue;
>>   +        if (csdev->pdata->in_conns[i]->filter_src_dev)
>> +            in = csdev->pdata->in_conns[i]->filter_src_dev;
>
> Actually, this may not be complete, if the device was removed. Also add
> a comment here.
>
>         /*
>          * If this port has a hardcoded filter, use the source
>          * device directly.
>          */
>         if (csdev->pdata->in_conns[i]->filter_src_fwnode) {
>             in = csdev->pdata->in_conns[i]->filter_src_dev;
>             if (!in)
>                 continue;
>         }

I will update to the next version.


Best,

Tao

>
>
> Suzuki
>
>>           if (coresight_device_is_tpdm(in)) {
>>               if (drvdata->dsb_esize || drvdata->cmb_esize)
>>                   return -EEXIST;
>> @@ -124,7 +126,6 @@ static int tpda_get_element_size(struct 
>> tpda_drvdata *drvdata,
>>           }
>>       }
>>   -
>
>>       return rc;
>>   }
>

