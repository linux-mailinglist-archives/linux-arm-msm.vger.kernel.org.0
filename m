Return-Path: <linux-arm-msm+bounces-40007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F7D9E128C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F322822E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5F71547F5;
	Tue,  3 Dec 2024 04:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OIuGBpBJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72B517C68;
	Tue,  3 Dec 2024 04:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733201602; cv=none; b=X+amsbVqVIq7TuUOlqX6Qd/UIogdS0lWqDHOioLEQmyXqV2N04o4xQNJSwH3GZcAvgk4j/YwvhSzlCn2Mqgh5nSXxzkAjBVaQ0VdoAD9St1sWUOMO/xDvtsojdvVjb4/1PSWmZxmGwXZpvgEMsJwRNndGInF7BxVQKuMMjqel4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733201602; c=relaxed/simple;
	bh=1I//fqllUMG8UsEaJCBLU0K+QZ3aDENe5fmu2FD9bIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aNnTeetepwC2K+D9VheKzNv1UeZKfOEZdxaPklr15JayIn4KjK9Z/sLxKmGF4XG5KHftTBqCG5O64M4Zxh5pRsfHStFXQ82o/8dG+TdZXsS76u4a4Od5lnAozUuDjTGvM1+VEjwHQl1PgeCTCTnxYvto8jyEhpS8ctRlIWUtBio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OIuGBpBJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JRFcI008932;
	Tue, 3 Dec 2024 04:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VTouYPAoBHZd1DCtz10lm0vwlJCD13zQd4YAdiJBYIw=; b=OIuGBpBJ52z6l2GF
	G5onlzWhIxKisdD2gLHDwRrN13T0BB9KwbgXOQFoMe6BXgnFiSWIa6nT1zIdQ/Mp
	TEZulxLUcZpNS3jTHcRl2Kt5LwYKC8BC/HhjYgUMTe8kgOFoHHYqzf0du4dlT1up
	lpCGJJpgJu4YhAHwcyCyTPyAGV0YQBdCvoCt+fSVMKoWJlcwLu1LiopeeXUs5ZrY
	g3ucs3ydTKmSuqjaLUV3QmdY+AsxCYwKsCAA2Qw9s5n1qgX9LpznFlMd8EJa2lSl
	kMWDgICEZLhloYImRZUUE1AbQXhT6P0VIgYVXwPmqwO4lZO4+FDdmglzhkFoCG5Q
	GdG+/Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2xtuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:52:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34qrW1029944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:52:54 GMT
Received: from [10.216.7.36] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 20:52:45 -0800
Message-ID: <ab9d5e1c-ffb6-88df-80e6-243bfae8cf59@quicinc.com>
Date: Tue, 3 Dec 2024 10:22:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: Add bindings for wcd937x static
 channel mapping
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
 <20241126164300.3305903-2-quic_mohs@quicinc.com>
 <br4vo2iygjc6p5zezss6wccuakodthej4cut3cpw76ltxyxkpb@pjalqvpszxvo>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <br4vo2iygjc6p5zezss6wccuakodthej4cut3cpw76ltxyxkpb@pjalqvpszxvo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rDtz8oyU-eOdltnCCRBYJga771fdnlGl
X-Proofpoint-GUID: rDtz8oyU-eOdltnCCRBYJga771fdnlGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030039

On 11/27/2024 1:35 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 26, 2024 at 10:12:56PM +0530, Mohammad Rafi Shaik wrote:
>> Add wcd937x static channel mapping values to avoid
>> having to use unclear number indices in device trees.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>   include/dt-bindings/sound/qcom,wcd93xx.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>   create mode 100644 include/dt-bindings/sound/qcom,wcd93xx.h
>>
>> diff --git a/include/dt-bindings/sound/qcom,wcd93xx.h b/include/dt-bindings/sound/qcom,wcd93xx.h
>> new file mode 100644
>> index 000000000000..45bcc30d0393
>> --- /dev/null
>> +++ b/include/dt-bindings/sound/qcom,wcd93xx.h
> 
> Filename matching compatible, always.
> 
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __DT_SOUND_QCOM_WCD93xx_H
>> +#define __DT_SOUND_QCOM_WCD93xx_H
>> +
>> +#define SWRM_CH1 1
>> +#define SWRM_CH2 2
>> +#define SWRM_CH3 4
>> +#define SWRM_CH4 8
> 
> Bindings define interface between driver and DTS. The values are
> abstract, so alwys start from 0 or 1 and are incremented by 1, not by
> power of 2. Also missing some sort of prefix, w.g. WCD9390_xxx
> 
> Anyway, this does not look like binding.
> 

Ack,

Will add the Prefix WCD9370_SWRM_CH1,


Added new binding support header file 
(include/dt-bindings/sound/qcom,wcd93xx.h) for providing channel mapping 
values to avoid having
to use unclear number indices in device trees.

> Best regards,
> Krzysztof
> 


