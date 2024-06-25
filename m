Return-Path: <linux-arm-msm+bounces-24066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 043DA915E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 07:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 656B5B21833
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 05:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78161145A15;
	Tue, 25 Jun 2024 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bcz5M/EZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4872D600;
	Tue, 25 Jun 2024 05:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719293665; cv=none; b=D0LnZzLNYADATDrV+17vHuMaotgsbfd68Vbnwb/zYtWC6wYhJPXqxkz9y9trzC3jjiI3fPKOQv3zbeVeYQyhjijJIr7HSnhTasTFOhUGUGg415LF0ae/jDKmqF2OcqFVNGlllWbYygtAbHHu8/gbzDPhym9X4o9XIleG8+jSf/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719293665; c=relaxed/simple;
	bh=WG61A8AegrCQ2sc9776tr4hXXzDrdIphGqwVreN11vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fi4DHCb8wR0J9dDhHRepkoHNH0lkDNX+IBofxudPC5US9mnGExj+2814oto7o4pKgAmxg3CPJKZfuY/iE4HvH4yj5VfvbAFiCztjgGB60GSSgyYy8IiHp/R/geNSlMOIRucvQkC8VyuU4UiBIdtx4zCCJmx48q8HY+zFN5Pu4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bcz5M/EZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OHV4VN001863;
	Tue, 25 Jun 2024 05:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LoKPufBWxhxMKygsmQzlMm1MysiDrvGUFIj3Sx6alRk=; b=Bcz5M/EZoERI0SHa
	Oa2t3IRNPR9crE6GxO4NTIO/+PyK2rMfZL7D279z2R/nUHLEI0VCvX5mBQE3mjGN
	TU5VzEaG1AXRILyYBLZfFhom4uBDZc6fcNtg091qQz33NJ6s6RAnUBs/KjDF/t8u
	ZGNud6P6OmOatMFLuAWgOhYyVvQ74N2OmTprCbKVy3EKrZsexiln5kbU7/YRrkUw
	uEP5WK3dWpbNX196uDLMN34rEITAdNOMWdBcjS6nIZ2+wKkb6RdVwyH58trY/jtU
	WCgUeUm460oZXScKfFwO8ATZJZMVbsXES3U0WjzY9Vdvu1a0/D+q9SAB7Y7J1pSk
	9BuAgQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaewt41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 05:33:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P5XcS6015993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 05:33:38 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 22:33:33 -0700
Message-ID: <73cb638e-4982-49a2-ba79-0e78402b59ad@quicinc.com>
Date: Tue, 25 Jun 2024 11:03:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>, <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
 <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YINY9aTmPeiUpakPTSs3nRPKSnHLlcMl
X-Proofpoint-GUID: YINY9aTmPeiUpakPTSs3nRPKSnHLlcMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_02,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250040


On 6/22/2024 2:38 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 21, 2024 at 05:16:52PM GMT, Gokul Sriram Palanisamy wrote:
>> PRNG clock is needed by the secure PIL, support for the same
>> is added in subsequent patches.
> Which 'same'?
> What is 'secure PIL'?
   will elaborate in the updated version.
   To answer your question, secure PIL is signed PIL image which only 
TrustZone can authenticate and load.
>> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
>>   1 file changed, 47 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
>> index 94f68c919ee6..366b19cbd994 100644
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -91,19 +91,6 @@ enum {
>>   	WCSS_QCS404,
>>   };
>>   
>> -struct wcss_data {
>> -	const char *firmware_name;
>> -	unsigned int crash_reason_smem;
>> -	u32 version;
>> -	bool aon_reset_required;
>> -	bool wcss_q6_reset_required;
>> -	const char *ssr_name;
>> -	const char *sysmon_name;
>> -	int ssctl_id;
>> -	const struct rproc_ops *ops;
>> -	bool requires_force_stop;
>> -};
>> -
>>   struct q6v5_wcss {
>>   	struct device *dev;
>>   
>> @@ -128,6 +115,7 @@ struct q6v5_wcss {
>>   	struct clk *qdsp6ss_xo_cbcr;
>>   	struct clk *qdsp6ss_core_gfmux;
>>   	struct clk *lcc_bcr_sleep;
>> +	struct clk *prng_clk;
>>   	struct regulator *cx_supply;
>>   	struct qcom_sysmon *sysmon;
>>   
>> @@ -151,6 +139,21 @@ struct q6v5_wcss {
>>   	struct qcom_rproc_ssr ssr_subdev;
>>   };
>>   
>> +struct wcss_data {
>> +	int (*init_clock)(struct q6v5_wcss *wcss);
>> +	int (*init_regulator)(struct q6v5_wcss *wcss);
>> +	const char *firmware_name;
>> +	unsigned int crash_reason_smem;
>> +	u32 version;
>> +	bool aon_reset_required;
>> +	bool wcss_q6_reset_required;
>> +	const char *ssr_name;
>> +	const char *sysmon_name;
>> +	int ssctl_id;
>> +	const struct rproc_ops *ops;
>> +	bool requires_force_stop;
>> +};
> Move this back and use forward-declaration of struct q6v5_wcss.
   sure. Will update.
>> +
>>   static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
>>   {
>>   	int ret;

