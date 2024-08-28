Return-Path: <linux-arm-msm+bounces-29743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D225E962321
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 113111C20925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA1316132F;
	Wed, 28 Aug 2024 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S/zg1nBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2A15B55D;
	Wed, 28 Aug 2024 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836343; cv=none; b=Il/U2iNbZMDpkRE9iv1qVH1K1Q0lq77fbqF716BWIvyWDX93KTXJK1TpUCOygBzRBF46Esy3FvQzJNJyE2+Q37k7gI1P2l0t7Q+tSqdhjwsYrm4QjPLLpBtHc3P4GBsmgzEd7bT7EtZBUv+oetTLYGzChiIPj/erDVI6ldszed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836343; c=relaxed/simple;
	bh=ZalckBvMTWaoy3jVYilCdgkf09reBQXkb7xO0PA0YzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JFVXfYL9IxXiP7Uz8NXHST1figRc1Qd3nzEANdcb/Fg+mareafrvzYwnzO9oxX4HFb+DsBVXuoM6OH0j3NjQWlRdw6pkdTSMTxKg1hUfB2Z1x0QhDQ6W+NORev+ZvE8kPkcctJdQq0W8h/074RIdLP2/HON5LtyYrgioKmQ7Mvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S/zg1nBj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLfR8V009547;
	Wed, 28 Aug 2024 09:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1y+4aFupFg5jHnRUIBKBj7VIHbsyj/E677pestYgEE=; b=S/zg1nBjFMsq+H71
	g5WO1R4ol1GRe8y5TsDtzuWD+tskw3gnVu87sulq45f6g4Qmdz8TALZEjaYqOynB
	qZG0tUd8Z5Uv13fFKP0NAmUiXIWwzdx6gFVaYLKlgonjwvmwC6lMUVuvvFeNBm8J
	LPEbltn5YOrzRd7f5xa4Ijrj9NZ7Ro1hBAU/KclLaEPpqfcw8dQoYB1BEs4OYjKm
	oGuIAtZFz6NgxQk4nHbQG/OspsVt18RCv5h5D1rdC7esxtK+TYNyq4TeD7vGPYpE
	zcqG9gQV3N7ykR7Keiim8YMRPEpmgx6c3oMPhYGg+jrNEGaUa2M+G1LEgNtZMtlt
	h+AgiQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5h90b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:12:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S9CGPd003488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:12:16 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 02:12:13 -0700
Message-ID: <4340f1d1-b049-4368-8227-b6400ae0cbce@quicinc.com>
Date: Wed, 28 Aug 2024 17:12:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add QCS8300 remoteproc support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mathieu.poirier@linaro.org>,
        <bartosz.golaszewski@linaro.or>, <quic_tingweiz@quicinc.com>,
        <quic_tengfan@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>
References: <20240828030511.443605-1-quic_jingyw@quicinc.com>
 <20240828030511.443605-3-quic_jingyw@quicinc.com>
 <udhf32bgdfw6kfqltd7qo7tvzv7fev4nvrwxwg3tnjnfjtb3md@oy6kd5jnsu3t>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <udhf32bgdfw6kfqltd7qo7tvzv7fev4nvrwxwg3tnjnfjtb3md@oy6kd5jnsu3t>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rMvDLlYLY_5qOde5thlgtLze6Sl53RM4
X-Proofpoint-GUID: rMvDLlYLY_5qOde5thlgtLze6Sl53RM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408280065



On 8/28/2024 3:24 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 28, 2024 at 11:05:11AM +0800, Jingyi Wang wrote:
>> Add support for PIL loading on ADSP, CDSP and GPDSP on QCS8300
>> platform.
>>
>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 55 ++++++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index ef82835e98a4..368aa9cc0051 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -857,6 +857,58 @@ static const struct adsp_data sdm845_adsp_resource_init = {
>>  	.ssctl_id = 0x14,
>>  };
>>  
>> +static const struct adsp_data qcs8300_adsp_resource = {
>> +	.crash_reason_smem = 423,
> 
> You just duplicate stuff. This is EXACTLY the same as SA8775p.

Agreed with you. Offline checked with Jingyi, she will remove the
creation and use sa8775p_adsp_resource directly.

Will it be ok to put the second patchset here along with the qcs8300
base dt changes together?
> 
> NAK.
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu


