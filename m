Return-Path: <linux-arm-msm+bounces-19200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D18BB89E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 02:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E69B1C232FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 00:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A71629;
	Sat,  4 May 2024 00:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BdfeVsGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525A36D;
	Sat,  4 May 2024 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714781286; cv=none; b=RmFuQJOzrix0a3K7+WOZtNJBMd9aHYil3OZ/CzrJqBYMFaSQAKJKboiiIBKEcX3TmNJYwW90+YwbJPMoGxuAZnH/iy2DGnW52YZIInuAgZ8M5XAHZrBWros1ivu07INjnMjIXFEGagvaS9nhk9OVWlQUYcYcyy/47T3IHZkrBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714781286; c=relaxed/simple;
	bh=4FRRARZaWQXthGDOxg7wzzYkWKjg1wiIOfmDSN4kUMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n3apzVyjuQ6201FLiqzp2hyjzzMkP/qpGnCErm5wj/YGJOJ6+5nvvCQ4MAKb66Sco7/++Fqd5UfRCkrKhvuQfFj+JsMiepNWbjygwpSkTU+bkvZZylC3r6poPzaDnRitZ9h6X4QV27ejZfwloLF6wc5nzwEJa5exru4RMUJ3NFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BdfeVsGg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443Loq3d023739;
	Sat, 4 May 2024 00:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2gHxHWVt0EgLtC05azmjUJ9T0o3w1UNl8Tamh28ZgyU=; b=Bd
	feVsGgqnlRjitK+dOOtENrmd7kZjLnQnghdams4WsChLFdpEiBvI0WoyWre995Ar
	K+xqd5xfPcD2oLoj8b2RvjsPboUBTLNOM7PeTx5haFlMFbzcGfb//9aqcfSDLdCb
	fXKrXhqpw0heGBvE5S5eTOdcBsDPTICOLH6Em7PIH5i2c5WycRJdnr0E3v3SB4bE
	OqkQ7zBWWcfyInAVCFMssbLsJO2aeZy5lXaly0gNkVlI2QHxOnh+Fz5KjLUpor8m
	Z2ltF2ytSCszP5AhwjZCPxfwUg8T1SPtP224cXMdpCmXmgqj3zVhYtCxCxzxl5As
	TZ4HNqkpphwCuexx+LIg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xvrt4j86g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 May 2024 00:07:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44407l5w006552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 May 2024 00:07:47 GMT
Received: from [10.110.114.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 17:07:46 -0700
Message-ID: <e082de17-f4f7-1923-cfe0-10916c2e3caa@quicinc.com>
Date: Fri, 3 May 2024 17:07:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Helen Koike <helen.koike@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
 <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
 <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
 <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
 <CAA8EJporB9jjKtT-XS4PcRSYzi+FJh1smsjnBCgy8f5JvDtjAg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJporB9jjKtT-XS4PcRSYzi+FJh1smsjnBCgy8f5JvDtjAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R9H9ZhyJggZ-YTD_qcyRPMIWfyJEHLkW
X-Proofpoint-ORIG-GUID: R9H9ZhyJggZ-YTD_qcyRPMIWfyJEHLkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_17,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030171



On 5/3/2024 5:02 PM, Dmitry Baryshkov wrote:
> On Sat, 4 May 2024 at 01:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/3/2024 1:20 PM, Dmitry Baryshkov wrote:
>>> On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
>>>>> In order to validate drm/msm register definition files against schema,
>>>>> reuse the nodebugfs build step. The validation entry is guarded by
>>>>> the EXPERT Kconfig option and we don't want to enable that option for
>>>>> all the builds.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/ci/build.sh  | 3 +++
>>>>>     drivers/gpu/drm/ci/build.yml | 1 +
>>>>>     2 files changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>>>>> index 106f2d40d222..28a495c0c39c 100644
>>>>> --- a/drivers/gpu/drm/ci/build.sh
>>>>> +++ b/drivers/gpu/drm/ci/build.sh
>>>>> @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
>>>>>     apt-get update
>>>>>     apt-get install -y libssl-dev
>>>>>
>>>>> +# for msm header validation
>>>>> +apt-get install -y python3-lxml
>>>>> +
>>>>>     if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>>>>>         GCC_ARCH="aarch64-linux-gnu"
>>>>>         DEBIAN_ARCH="arm64"
>>>>> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
>>>>> index 17ab38304885..9c198239033d 100644
>>>>> --- a/drivers/gpu/drm/ci/build.yml
>>>>> +++ b/drivers/gpu/drm/ci/build.yml
>>>>> @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
>>>>>       extends: .build:arm64
>>>>>       variables:
>>>>>         DISABLE_KCONFIGS: "DEBUG_FS"
>>>>> +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
>>>>>
>>>>
>>>> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
>>>>
>>>> Cant we make this build rule msm specific?
>>>
>>> No need to. We just need to validate the files at least once during
>>> the whole pipeline build.
>>>
>>
>> ah okay, today the arm64 config anyway sets all arm64 vendor drm configs
>> to y.
>>
>> A couple of more questions:
>>
>> 1) Why is this enabled only for no-debugfs option?
>> 2) Will there be any concerns from other vendors to enable CONFIG_EXPERT
>> in their CI runs as the arm64 config is shared across all arm64 vendors.
> 
> I don't get the second question. This option is only enabled for
> no-debugfs, which isn't used for execution.
> 

Ah I see, makes sense.

> I didn't want to add an extra build stage, just for the sake of
> validating regs against the schema, nor did I want EXPERT to find its
> way into the actual running kernels.
> 

This answered my second question actually. That basically I didnt also 
want EXPERT to find its way into actual running kernels.

Hence, I am fine with this change now

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

But, I will wait to hear from helen, vignesh about what they think of this.

