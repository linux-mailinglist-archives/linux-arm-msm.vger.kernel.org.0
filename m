Return-Path: <linux-arm-msm+bounces-35262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8A9A6B38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 15:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D01E281E47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 13:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FE01E572A;
	Mon, 21 Oct 2024 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8iIYyQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57811F130F
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729519094; cv=none; b=hGX2X82zujiCAmdoVoox8pTnGfQwSZvT8ZmFkHSAlmBWGpbY8hTjKMQC454MNeSMmKXD8qE8TqFyj58kZdc7xX7ZSq12wIeFuJl429brcao4hlJJaoaQrrISEPOK27pQ467q/fBkMm7Hp5RE+61rMPSfycXa5ToB+l6fweto6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729519094; c=relaxed/simple;
	bh=NPhBoj3xcxNlJXTqklaF506IqEIEDAzTVf1JM8EHZD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFo4dvZBlrbaC9xgqr4qBRJ+BEXS5AW0cDHKB73beJ8nNlcCsoH8nhWjB0W9639jD3oWo7ljtLccBIZn9teq2PMNA333+4QEESEwm1EweeG8Q6EYajSQK9Cbqq8CZLjb0p6pxYpb6p6965PxPtw08tQ6D3lVzmvSImnNqKHDzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8iIYyQZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LA0Qvl008859
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 13:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OI7Wh1fO6bHFXo1JQ2ZRfpx/pcAU9uIg8fircEPSrek=; b=N8iIYyQZQDBb9wae
	XDu6UWUeU8JwCQDB/K7WWmfH104Se6MFWPl8QeLsBsWI7qXEgGWbByrcr78uhLhc
	nAxgNVD4eXoqfGRt2x5MWYGXqqAVZpl+zCJ0FeDJbdkwkshqPzNfVj7yeauJ6wiw
	+seHBCy4mBdgtS926WY9YL2VyL54TlwCTyigFXNETaSKPLjtcWtl862P/rdVA/Sf
	QDzqEUaQSCjLJc8RvrzNXkbHeT/jEODvwrfWmscsy/N0qFUzeGGULhc28DtLNYeT
	1un6ORL6VViWekNt0dqyiujeNTP2FaE2CZkq7jfZanJd+4YUHihP6Udt/OfXE9wS
	eoTIhg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tuw007-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 13:58:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbf2a4afcfso14643166d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 06:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729519090; x=1730123890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OI7Wh1fO6bHFXo1JQ2ZRfpx/pcAU9uIg8fircEPSrek=;
        b=q0hnXw4ACzVQkxlTrFIKy1/j0nzU/KhbwSyjzJtKuoX9vQbgvgIcDCoFlhHQDmVG3r
         hMCndWEosC9Th8wrSvxzHfn/9kgwsI1daO5nJIPTqmdcrV6GSvCVvcvbpTNPdQxMR2v3
         /mJJAhPBXovaVoMTFZuJIhhGxU5bbPusBJrOvSjhCuRqCL2ZWPzSWaKkGOafmpvsNX0G
         RLhwW4GxNi1LAzAbCcXd7XLqlczkwjS3fF4o17EnHW7oncBrODFAJc8HmelEV1utAjT5
         vOiOlYfYWSe+4dXQHjMI9kLJfHviQPS2j6iqr21gvEYfcNQJ2VdfW9MGEW5MW8yNB3aC
         g0SA==
X-Forwarded-Encrypted: i=1; AJvYcCUTMryoj6rY74V+ZM4ngbnGmP4CZAFDkb0ThtgxxJTvTzJMEUS6d5eXyM/PlyKN71yF1dfpmuxWCDPcrYWz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/syhDU/Q437BMCQ0F/00KmfNx2wtMB0r1A5rXzoUE8jk3gdg
	RHuMz7iX//6Qk4c5PV3BH/GLzbCvXNdqDVdpJynWzPuvXRa8VLoz2xKDS+zpm50E7SoLs1rTUDe
	AwviOZD0uMmU+WS8CnuBBShAccpYS5CmDXFfAPliua4COzUgMNma+iwSkIX9Z7YEZ
X-Received: by 2002:ad4:5ae2:0:b0:6cb:bc57:d840 with SMTP id 6a1803df08f44-6cde14be181mr79937926d6.3.1729519090076;
        Mon, 21 Oct 2024 06:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCScMjTKswmyH1uzl8JIZj7OfIdN55ExFoP9OG2mAym/s4cspQQgTi+8KuXBFsGXeVZUKm3A==
X-Received: by 2002:ad4:5ae2:0:b0:6cb:bc57:d840 with SMTP id 6a1803df08f44-6cde14be181mr79937766d6.3.1729519089768;
        Mon, 21 Oct 2024 06:58:09 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c6b974sm1964000a12.67.2024.10.21.06.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 06:58:09 -0700 (PDT)
Message-ID: <24a674f5-17ba-49d1-a865-77f907a05c65@oss.qualcomm.com>
Date: Mon, 21 Oct 2024 15:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: add support for SAR2130P and
 SAR1130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org>
 <20241019-sar2130p-llcc-v1-2-4e09063d04f2@linaro.org>
 <7fa066b6-a214-4866-9d0a-f75896531d84@oss.qualcomm.com>
 <CAA8EJprvQTGABZ6LAq1qXRfPgOz7VzxPuKnRz_EO_4S6tveXgQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAA8EJprvQTGABZ6LAq1qXRfPgOz7VzxPuKnRz_EO_4S6tveXgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rubvs1QbtZB_wec3qW2LN4OmqsiAvjdx
X-Proofpoint-GUID: rubvs1QbtZB_wec3qW2LN4OmqsiAvjdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210100

On 21.10.2024 3:13 PM, Dmitry Baryshkov wrote:
> On Mon, 21 Oct 2024 at 14:04, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 19.10.2024 6:26 PM, Dmitry Baryshkov wrote:
>>> Implement necessary support for the LLCC control on the SAR1130P and
>>> SAR2130P platforms. These two platforms use different ATTR1_MAX_CAP
>>> shift and also require manual override for num_banks.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  drivers/soc/qcom/llcc-qcom.c       | 468 ++++++++++++++++++++++++++++++++++++-
>>>  include/linux/soc/qcom/llcc-qcom.h |  12 +
>>>  2 files changed, 474 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>>> index a470285f54a875bf2262aac7b0f84ed8fd028ef1..ef84fe3b2af4e777126a8308bfd4ec47b28aeae2 100644
>>> --- a/drivers/soc/qcom/llcc-qcom.c
>>> +++ b/drivers/soc/qcom/llcc-qcom.c
>>> @@ -32,6 +32,7 @@
>>>  #define ATTR1_FIXED_SIZE_SHIFT        0x03
>>>  #define ATTR1_PRIORITY_SHIFT          0x04
>>>  #define ATTR1_MAX_CAP_SHIFT           0x10
>>> +#define ATTR1_MAX_CAP_SHIFT_sar       0x0e
>>>  #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
>>>  #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
>>>  #define ATTR0_BONUS_WAYS_SHIFT        0x10
>>> @@ -140,6 +141,11 @@ struct qcom_llcc_config {
>>>       bool need_llcc_cfg;
>>>       bool no_edac;
>>>       bool irq_configured;
>>> +     /*
>>> +      * special workarounds for SAR2130P and similar platforms which have
>>> +      * slightly different register mapping.
>>> +      */
>>> +     bool is_sar_chip;
>>
>> This is not the only odd ball, please make max_cap_width variable
> 
> I'm not sure what you mean here. Moving max_cap_width to the drv_data
> / configuration? Or do you mean something else?

Match data (qcom_llcc_config) is fine, as qcom_llcc_cfg_program is only
called from .probe.

max_cap_width would be a new field that denotes the width of MAX_CAP
(which seems to always be at [31:n])

> 
>>
>> [...]
>>
>>> +     /*
>>> +      * For some reason register returns incorrect value here.
>>> +      * List compatibles instead of using .is_sar_chip since there might be
>>> +      * SAR-like chips which have other number of banks.
>>> +      */
>>> +     if (of_device_is_compatible(dev->of_node, "qcom,sar1130p-llcc") ||
>>> +         of_device_is_compatible(dev->of_node, "qcom,sar2130p-llcc")) {
>>> +             num_banks = 2;
>>> +     } else {
>>> +             ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
>>> +             if (ret)
>>> +                     goto err;
>>> +
>>> +             num_banks &= LLCC_LB_CNT_MASK;
>>> +             num_banks >>= LLCC_LB_CNT_SHIFT;
>>> +     }
>>>
>>> -     num_banks &= LLCC_LB_CNT_MASK;
>>> -     num_banks >>= LLCC_LB_CNT_SHIFT;
>>>       drv_data->num_banks = num_banks;
>>
>> This too
> 
> This can probably go to qcom_llcc_config.

Yep

Konrad

