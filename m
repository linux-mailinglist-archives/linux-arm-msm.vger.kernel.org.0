Return-Path: <linux-arm-msm+bounces-34352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD599D429
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 18:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930F0B2DED6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB7B1AC884;
	Mon, 14 Oct 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TfNk1+WU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C421ABEBB;
	Mon, 14 Oct 2024 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728920937; cv=none; b=E52estdQlpGFLUO4vYJX4x3klxQEbbMIZrdex111gkPls2T9XyGCm90Aqr9hMAob+IzSkgu7Ad64HQyaIn4dMvVPNon91hMrh+eDMugzlOa95dULRnl4uy2h+XcD7gUP7hSVcGSfKR8zxvqvF8s9id+RTPV4FkTJ32wpIhdkV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728920937; c=relaxed/simple;
	bh=JQGSBcwMNjpqunkDYPLWcEdn2r3Y7x6SXVy9pz5tXEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bRNTTGExDySU8OIlIt9T/y7Oo2lu1vbH6JJTyH7RnNQ8e4osJ4gO+wlvjbHWLGTgETr69PD8CeZNGX3jzXkQzEq97jVZaSlzkhFStxyfz47ZwWQBtcW44jBNSHshtBsWphgJFIjHBtnYV//hvqnnijXNBPc6Pfyg2uWWruarcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TfNk1+WU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EBgnnd015497;
	Mon, 14 Oct 2024 15:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fbo4BXqtR+rhnUhSESCMNgugyvLcmfeTaOWImJblAhQ=; b=TfNk1+WUQpIbt9It
	U9jvMbMFHeBbvl/aFdPdQf6/MMT7bZQ+IguwQQfgVSz/mheCRcLcNRIvSpAPHwFv
	NDk65mpMigybsGrGfKi2RwvY7t92MS6IOby6wQGVlPG9hNpMBvdi+OZtb0sHJpUa
	0LI4+otTHCnuUqsWqf6hp1s2H1f8wbX6vPnVjjaVaz1awU2X0YtRSVMR9ClihQvq
	mZ/k/moYo2jHEzbmeYtsquZwHtGCslpsS29TdpIYUq6mrUmNvsc5lZ8LrTPGRNkw
	pQ+JvO3Ij2IOl/n0ZMr9ns6V//kyh9qdF4pIdPwHZLRhPN0rutntzuyNPkpeAyyX
	MDa+7w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfvsg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:48:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EFmnIM019941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:48:49 GMT
Received: from [10.216.15.50] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 08:48:46 -0700
Message-ID: <d00f0a6e-575c-4886-8e06-30d5d1c15d81@quicinc.com>
Date: Mon, 14 Oct 2024 21:18:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
 <CAMRc=MftQBH_d4Ew_5jdqqk1WpM511huWJH2ZDwnhXVYDboYLg@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <CAMRc=MftQBH_d4Ew_5jdqqk1WpM511huWJH2ZDwnhXVYDboYLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qfk8yU-fs9dnUwFi5ZG17Y4xmL6PPKu5
X-Proofpoint-ORIG-GUID: Qfk8yU-fs9dnUwFi5ZG17Y4xmL6PPKu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140115


On 10/14/2024 6:35 PM, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 1:19 PM Kuldeep Singh <quic_kuldsing@quicinc.com> wrote:
>>
>> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>
>> When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
>> qcom_scm for unsupported platforms. Currently, tzmem interprets this as
>> an unknown error rather than recognizing it as an unsupported platform.
>>
>> Error log:
>> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
>> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
>>
>> To address this, modify the function call qcom_scm_shm_bridge_enable()
>> to remap result to indicate an unsupported error. This way, tzmem will
>> correctly identify it as an unsupported platform case instead of
>> reporting it as an error.
>>
>> Fixes: 178e19c0df1b ("firmware: qcom: scm: add support for SHM bridge operations")
>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 10986cb11ec0..0df81a9ed438 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -112,6 +112,7 @@ enum qcom_scm_qseecom_tz_cmd_info {
>>  };
>>
>>  #define QSEECOM_MAX_APP_NAME_SIZE              64
>> +#define SHMBRIDGE_RESULT_NOTSUPP               4
>>
>>  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
>>  static const u8 qcom_scm_cpu_cold_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
>> @@ -1361,6 +1362,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
>>
>>  int qcom_scm_shm_bridge_enable(void)
>>  {
>> +       int ret;
>> +
>>         struct qcom_scm_desc desc = {
>>                 .svc = QCOM_SCM_SVC_MP,
>>                 .cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
>> @@ -1373,7 +1376,15 @@ int qcom_scm_shm_bridge_enable(void)
>>                                           QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
>>                 return -EOPNOTSUPP;
>>
>> -       return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
>> +       ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
>> +               return -EOPNOTSUPP;
>> +
>> +       return res.result[0];
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
>>
>> --
>> 2.34.1
>>
>>
> 
> The patch looks correct to me and like something that should go upstream.
It's upstream mailing list only. Please see :)

> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>>
> That being said, this doesn't seem to address any of the issues that
> we saw with SHM Bridge and it still leads to a crash on sc8180x. :(

Verified on qcs615, and qcs9100 by explicitly making shmbridge
unsupported in QTEE and patch worked there.
Sc,8180x is something different it seems as there's no scm driver probe
failure and instead screen stuck is observed.
I'd like to check this behavior and get rid off it from blacklist
platform list.

-- 
Regards
Kuldeep

