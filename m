Return-Path: <linux-arm-msm+bounces-33453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70FC99386D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 22:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E20A28478F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457011865FC;
	Mon,  7 Oct 2024 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K1egh3ae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78C81727;
	Mon,  7 Oct 2024 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333644; cv=none; b=JD7Q1RmB+CZ2nTcOG1xsU90kLwU8WfxAQuKTEjBEYdNFEFdm+dtMiNHv4Gf/+6VbAwdjKHwZei4B9qtw1RvZfcSejPo6gCJJpYXZIvbDAkQuPyD8M5b1DLAj67/PZbBJHa13w2Sb/NTgyLa57/Ova+Kd/D/VqZiAO9Nmn9mLE9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333644; c=relaxed/simple;
	bh=FLCwmZ/Hn/iyF5AwvBG6cLSb/FnSNdu7VYbYWE8S6oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TGaHHg//t8vAsFSANvJ5DIQr1BkMhaZ2ctaHqJsK1vMs9vsEj/bydJMrTkTx3VVxZ0CS5kwN0dNUo0uVnOXCmDlbv+BodCkUdtTN72DrCAtj+NXcTRyQF8+9A8DDunUhye8Ys4C+iPJ9n54r09PZfjVzON/i7KSTezJpRMXv1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K1egh3ae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497KdOU0017237;
	Mon, 7 Oct 2024 20:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPSKTPCTTPqJMs0Azumv01NrakAMCZY5uO45cD8tIxg=; b=K1egh3aeU6PtPU+m
	XLYKMuUmzd+IErNoTmhq7TbHc19M7Z9Co/6FrMB1UI89o6cFClSKctVOojU2JzKi
	61V/GHFtrJTOPTuUBizJRlBYtrjVuURo2V3rAj79vtU4emhfzwQJzGGHFKyTXg6l
	2TNBGWLCDNU3aDXaB7q1XAvhHnWa69vVAQmdKMGNN9DZiJfzoKSlIVg6XjURln8j
	uCLpOPbdkfMGs2OBjyxcRTWPxsXJONuoN7zgV6A4KCNCSl41NH6YaJ588FQaCVAw
	B8KUTu6ICPt/12jk8sGnLdgXA4SJHpb9/8zfe36fpiFGps2KnQyjs4IpuFCE9or4
	NBi/7w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaerg1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 20:40:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497Ke7mo013908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 20:40:07 GMT
Received: from [10.216.6.71] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 13:40:05 -0700
Message-ID: <87f778cf-0e1e-4505-a0e8-7434316a9537@quicinc.com>
Date: Tue, 8 Oct 2024 02:10:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-2-quic_kuldsing@quicinc.com>
 <mgdj5xvqby3ftnnhma7dxvxskavx4p2pkzyorg4z3cza5xkimr@sqe4k2szwfbq>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <mgdj5xvqby3ftnnhma7dxvxskavx4p2pkzyorg4z3cza5xkimr@sqe4k2szwfbq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x23qsIMJTBjEfkr5cq9gLwJnm7sWz66e
X-Proofpoint-GUID: x23qsIMJTBjEfkr5cq9gLwJnm7sWz66e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070142


On 10/7/2024 7:10 AM, Bjorn Andersson wrote:
> On Sat, Oct 05, 2024 at 07:31:49PM GMT, Kuldeep Singh wrote:
> 
> Please shorten the subject a bit, perhaps:
> "firmware: qcom: scm: Improve unsupported SHM bridge detection"
> 
>> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>
>> Currently for enabling shm bridge, QTEE will return 0 and put error 4 into
> 
> s/for/when/

Ack.

> 
>> result[0] to qcom_scm for unsupported platform, tzmem will consider this
>> as an unknown error not the unsupported case on the platform.
>>
>> Error log:
>> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
>> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
>>
>> Change the function call qcom_scm_shm_bridge_enable() to remap this
>> result[0] into the unsupported error and then tzmem can consider this as
>> unsupported case instead of reporting an error.
>>
> 
> Sounds like we want a Fixes tag here.

Ack.

> 
>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 10986cb11ec0..620313359042 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -111,6 +111,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
>>  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
>>  };
>>  
>> +enum qcom_scm_shm_bridge_result {
>> +	SHMBRIDGE_RESULT_NOTSUPP	= 4,
>> +};
> 
> This is not an enumeration, but a fixed defined constant. Please use
> #define.

Ack.

>> +
>>  #define QSEECOM_MAX_APP_NAME_SIZE		64
>>  
>>  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
>> @@ -1361,6 +1365,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
>>  
>>  int qcom_scm_shm_bridge_enable(void)
>>  {
>> +	int ret;
>> +
>>  	struct qcom_scm_desc desc = {
>>  		.svc = QCOM_SCM_SVC_MP,
>>  		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
>> @@ -1373,7 +1379,11 @@ int qcom_scm_shm_bridge_enable(void)
>>  					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
>>  		return -EOPNOTSUPP;
>>  
>> -	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
>> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +	if (!ret && res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
>> +		return -EOPNOTSUPP;
>> +
>> +	return ret ?: res.result[0];
> 
> I'd prefer, with the additional check, that you'd structure it like this:
> 
> 	if (ret)
> 		return ret;
> 
> 	if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> 		return -EOPNOTSUPP;
> 
> 	return res.result[0];

Sure, above looks more cleaner. Will update in next rev.

> 
> That way we deal with SCM-call errors first, otherwise we inspect and
> act on the returned data.
> 
> That said, the return value of this function, if non-zero, will trickle
> back to and be returned from qcom_scm_probe(), where Linux expects to
> see a valid error code. Are there any other result[0] values we should
> handle, which would allow us to end this function with "return 0"?

As qcom_scm_shm_bridge_enable() is an shm enablement call, need to handle
supported(or unsupported) scenario appropriately and other errors can be
propagated to qcom_tzmem/qcom_scm_probe.

Please note, other return values(related to access control) from QTEE are
failures and do not require conversion to Linux error codes.

-- 
Regards
Kuldeep

