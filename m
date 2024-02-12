Return-Path: <linux-arm-msm+bounces-10719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A8851C70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 19:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086581C2101D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 18:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37C33F8F7;
	Mon, 12 Feb 2024 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8sHxFl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091463C6A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707761277; cv=none; b=ZcVgBOATF/bdEMwFsaFK6pBa//PRBJVAyK2HkpXBFihPeZFGR7cRIVnkp0a++ppfpQmvoR5/7nLugk/Sb5/fb5ENOp24pAw4j1P9Z3V9jXrDDTC/6Ek0FW6Dp7h5Uv2QDRminWNcbmannx3Vh/haTzLcjJJfDHjtVXRQHrJGsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707761277; c=relaxed/simple;
	bh=e3OWp3PFpMNrdUIVoT/5mpQVSasNjh4dJRcwniIgPhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W5Wmkq7P6+VVmslDR9WXeudhSIjjiP+/fafbJ4Q3imbr9KlJAo0KjoLFXI+D+lYYXnKsHfhTflqyqzGWLmH84eqX66FuuZi2kIOTxh3tZKlvpGBeJEveuAI62D9wUz4DEc++iUSEqvAgeYCMDzP1UGNa/uRLpMHKZJ0bNdPxtNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8sHxFl+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CEnfSP017931;
	Mon, 12 Feb 2024 18:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wEiyc3BZVR8cfdDVK2VKogaqEm8yOWfi9LSgQ3sFk+0=; b=h8
	sHxFl+KcLCBpUzWsunXEhy6+yZwlw40q5Rkqd248C3AyMzHxOMPSdGV/UmvcAjy4
	0Hy30GWEtievC3KrEFtFCqHFrXNMjc2p81w7LKBqktlDtaSbBM/vxHWROsoNLLFS
	Qy2i7iQA6+ngeY54zginfBYTK1QMVTiqkImDX+rdAkWiUlNiIG4JeCSrardrdJgR
	kZhB8lH7XODaLL3/bps+TzJSlYVwkjC4ZcfHlsgrYJ4G/kLddHxiuMaPd94Uwx6+
	AR0QPLaawhw4UU8wh5dUxkHzu+xUOP8YfJgYqM2ylKpv47dD9LWfVXf4k5L9mgJt
	vlXGatvLKWCvNG33KXpA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62n042va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:07:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CI7gUR029087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:07:42 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 10:07:42 -0800
Message-ID: <5462b147-3ea7-9b85-7acd-701589ec5f9c@quicinc.com>
Date: Mon, 12 Feb 2024 10:07:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 12/19] drm/msm/dp: move parity calculation to dp_utils
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
        <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-13-quic_parellan@quicinc.com>
 <CAA8EJppppDiaQdEzX7WnFA8rFJQBTHJUQq4o6kZtfzTm5Y=nnA@mail.gmail.com>
Content-Language: en-US
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJppppDiaQdEzX7WnFA8rFJQBTHJUQq4o6kZtfzTm5Y=nnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KAA0TXeRrmtShBVzxVCjgFlWPrQJGwUj
X-Proofpoint-ORIG-GUID: KAA0TXeRrmtShBVzxVCjgFlWPrQJGwUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120138


On 2/10/2024 1:55 AM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>> Parity calculation is necessary for VSC SDP implementation. Therefore
>> create new files dp_utils.c and dp_utils.h and move the parity
>> calculating functions here. This ensures that they are usable by SDP
>> programming in both dp_catalog.c and dp_audio.c
>>
>> Changes in v2:
>>          - Create new files dp_utils.c and dp_utils.h
>>          - Move the parity calculation to these new files instead of
>>            having them in dp_catalog.c and dp_catalog.h
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile      |   3 +-
>>   drivers/gpu/drm/msm/dp/dp_audio.c | 101 +++++-------------------------
>>   drivers/gpu/drm/msm/dp/dp_utils.c |  71 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_utils.h |  22 +++++++
>>   4 files changed, 110 insertions(+), 87 deletions(-)
>>   create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
>>   create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h
> [skipped]
>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
>> new file mode 100644
>> index 0000000000000..c062e29d07898
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DP_UTILS_H_
>> +#define _DP_UTILS_H_
>> +
>> +#define HEADER_BYTE_0_BIT       0
>> +#define PARITY_BYTE_0_BIT       8
>> +#define HEADER_BYTE_2_BIT       0
>> +#define PARITY_BYTE_2_BIT       8
>> +#define HEADER_BYTE_1_BIT      16
>> +#define PARITY_BYTE_1_BIT      24
>> +#define HEADER_BYTE_3_BIT      16
>> +#define PARITY_BYTE_3_BIT      24
> Nit: it is usually 0-1-2-3 rather than 0-2-1-3.
>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Ack.


>
>> +
>> +u8 dp_utils_get_g0_value(u8 data);
>> +u8 dp_utils_get_g1_value(u8 data);
>> +u8 dp_utils_calculate_parity(u32 data);
>> +
>> +#endif /* _DP_UTILS_H_ */
>> --
>> 2.39.2
>>
>

