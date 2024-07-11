Return-Path: <linux-arm-msm+bounces-25924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7168892E205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6A501F2194A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC58C13C90E;
	Thu, 11 Jul 2024 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jfQtpgvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9AF84DFF;
	Thu, 11 Jul 2024 08:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686177; cv=none; b=EOT2nTwOerDW9+VesQJnuRqtineCZecF8nO36a7/xhvXAF4O0lDXWPNGj5VS7zwH3RHpNsoI9Dc/Rz5q7Us3X8VNR8ZtaloL7CUvmU5s3u+H3d1eqZ8/MhB7CTzOiDofiKZiOwrcu2P3oq2T2GKWXgaPb7ZGX/xnKH/F3dQr864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686177; c=relaxed/simple;
	bh=a3WRmwQoeA2gXq57Vy8bHBfeM8YPkxSrA2bbbRO37Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GKF9f8/oTGGfe98UjWGiCanzcetS1k/jQm8zIglSn0qcOBo5juk/yWh87EMPoHQ2P6WL+rsMlyPeGlpObC27vH+CRPSoAesdiEmsFGqhQR0HUFceRltpq2PVuBYbT5PKvKR/VyNZeWtIp84E38DPCAhelVnW2tzWz3c2F+NnMvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jfQtpgvd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4msZX011727;
	Thu, 11 Jul 2024 08:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CvE0y9FKJbyduIN+HacTd4TuD/Run/5K4j74H/OKUs=; b=jfQtpgvdm2uVcJXP
	y8JP99dbAZ282weI+b6fEJlPQl6qS/fTR5QN93b3s1KQPDdCzSqV6WDqh4hHLDhJ
	FkvKxdskAve8XXaJqonKZjgItozHRltiYN4CaTx7P7zTlUBc1YMwfpJfmuhFePjg
	yTeZGYruvCwZioWHMztrE1jaxaJB2U2vuKGqqtwXtwY/NAwayGROhN32h+aoJHdj
	y5WdYSZcNIjrHWKHXGaWkLkLT7XDgBUeqLOQAI0MdyfLJgh76ANtfXSymy+GKk2Y
	CVP5nBAwJxXMty9mc0qCKDhj0tPzeP535IhN/o2W1wAMnFyBt3Usc0UmGkTDupgn
	PKfmCA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwupuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:20:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B8KkPi031803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:20:46 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 01:20:41 -0700
Message-ID: <c5d70219-0aea-4025-bee3-8d8446432742@quicinc.com>
Date: Thu, 11 Jul 2024 16:20:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight-tpda: Optimize the function of reading
 element size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        Jie Gan <quic_jiegan@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-4-quic_taozha@quicinc.com>
 <2fdaac53-3695-45cd-a57a-1afaf365a19a@arm.com>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <2fdaac53-3695-45cd-a57a-1afaf365a19a@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1-O20lfSrcEgqf4cuf_u7-G5ZwF7dIQU
X-Proofpoint-ORIG-GUID: 1-O20lfSrcEgqf4cuf_u7-G5ZwF7dIQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110058


On 7/8/2024 11:49 PM, Suzuki K Poulose wrote:
> On 05/07/2024 09:51, Tao Zhang wrote:
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
>>   drivers/hwtracing/coresight/coresight-tpda.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c 
>> b/drivers/hwtracing/coresight/coresight-tpda.c
>> index 52b0201090fb..fc5a4e46cf5d 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -110,9 +110,12 @@ static int tpda_get_element_size(struct 
>> tpda_drvdata *drvdata,
>>               csdev->pdata->in_conns[i]->dest_port != inport)
>>               continue;
>>
>
>
>> -        if (coresight_device_is_tpdm(in)) {
>> +        if (coresight_device_is_tpdm(in)
>> +            || csdev->pdata->in_conns[i]->filter_src_dev) {
>
> How can we assume that the filter-source device is always TPDM ?
> It may be true for your test board, but driver must handle all
> possible cases. I would rather prefer:

Got it. I will update in the next patch series.


Best,

Tao

>
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c 
> b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..b1d6f1dd60e3 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -110,6 +110,13 @@ static int tpda_get_element_size(struct 
> tpda_drvdata *drvdata,
>                     csdev->pdata->in_conns[i]->dest_port != inport)
>                         continue;
>
> +               /*
> +                * If this port is tied to a source device,
> +                * jump to that directly.
> +                */
> +               if (csdev->pdata->in_conns[i]->filter_src)
> +                       in = csdev->pdata->in_conns[i]->filter_src;
> +
>                 if (coresight_device_is_tpdm(in)) {
>                         if (drvdata->dsb_esize || drvdata->cmb_esize)
>                                 return -EEXIST;
>
>
> Suzuki
>

