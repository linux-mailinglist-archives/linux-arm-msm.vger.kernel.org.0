Return-Path: <linux-arm-msm+bounces-21502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A388D89F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F09B21A93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 19:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1BE22F14;
	Mon,  3 Jun 2024 19:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DlwhyFn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB423A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 19:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717442441; cv=none; b=NAQSwLVPWl9Ecy0iDo6liujZL9LXWrlfrPnm/4WBPiZG4F8ua0iw5u8/Vcj+3Ul/5h0RBrqE0M/MTsEJ6YU2/U8vDzuZJfYazanqLddbDcAnVBm0umyPvsNjx2MLZbqMtnV1dQrxsVXOyRhnu26FeA/XPyeXfElKGxMZuQwDE1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717442441; c=relaxed/simple;
	bh=1dpWG9NhIt09AAkiHVgikbNIuxWdTB3CvNigj3IiWog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OX3elCbMUn1aGN6nDKnmdhb5Tjxg09/eq+RBovYlYvORh7fWySP8S2IEMT6fW+0axt23an7fkWTQ2zbjh8mt/wHzEsGSUYggg2JDpc5zd/r/9sefTLYmnCDBJNZxNNomAfwX5oi2VUfSOhpSbTMUis2ymuFh8Ecaz1LvZXPy4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DlwhyFn5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453DL36Q020209;
	Mon, 3 Jun 2024 19:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xkbJNP54I1ZPo3DuDDQhRwMqDUGtewTgThz8cvIuUw=; b=DlwhyFn5Spe4sWDM
	unlqyzmTkrfYFf3NMNTLVdIiKFBS/3Y7o6OllLBPwMqVnilgtYcBuJPD23lUeUmb
	giCTPzkozdV1oVPzcJY+JHUfCi7PDPiIbEsb09Qci3HClsfXgAyOsFJO6Ok3uiBp
	Vh2XNeA15kzZ85PQY6acAcpF62l3au2vls2ugN1cFXtebsJFyLssIQNJ3tHT/qAF
	cwQW6sNKudpYarPwxjbUZVehOHCILEtXFg5zqZDRmjUimqG9gRXggxNCafglV6GR
	oORo7RJ5w6FplPLRA7/haBbpv0Ex8wQf+J3tiIgUg/qBpwEhS5ffsTj9Sj/8Yj+N
	dkNB4A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4d4ydb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 19:20:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453JKUQr005878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 19:20:30 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 12:20:27 -0700
Message-ID: <9e9c3ac3-a9b9-61b9-22d9-f490ccbd601c@quicinc.com>
Date: Mon, 3 Jun 2024 12:20:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan
 Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
 <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
 <rqddqmqznhq4liusiyvowt4lfybb25qfdxak6ql6hdrreduutt@6uwkrlsxa4gw>
 <81322c16-8d82-16e7-dafd-93c29b07f169@quicinc.com>
 <7uqzoioa6enpxocrcsbykmdcucfgb4mglgep3k6b7strevs7cc@dqeyxrmieuvv>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7uqzoioa6enpxocrcsbykmdcucfgb4mglgep3k6b7strevs7cc@dqeyxrmieuvv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NOnihzLVgaibPltPb3G1CP5mVL-U25Sd
X-Proofpoint-GUID: NOnihzLVgaibPltPb3G1CP5mVL-U25Sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030157



On 4/22/2024 5:22 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 19, 2024 at 07:37:44PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 4/19/2024 6:34 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 19, 2024 at 05:14:01PM -0700, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
>>>>> Move a call to dpu_format_populate_plane_sizes() to the atomic_check
>>>>> step, so that any issues with the FB layout can be reported as early as
>>>>> possible.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>>>>>     1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index d9631fe90228..a9de1fbd0df3 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>>>>>     		}
>>>>>     	}
>>>>> -	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
>>>>> -	if (ret) {
>>>>> -		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
>>>>> -		return ret;
>>>>> -	}
>>>>> -
>>>>>     	/* validate framebuffer layout before commit */
>>>>>     	ret = dpu_format_populate_addrs(pstate->aspace,
>>>>>     					new_state->fb,
>>>>> @@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>>>     		return -E2BIG;
>>>>>     	}
>>>>> +	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
>>>>> +	if (ret) {
>>>>> +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>
>>>> I think we need another function to do the check. It seems incorrect to
>>>> populate the layout to the plane state knowing it can potentially fail.
>>>
>>> why? The state is interim object, which is subject to checks. In other
>>> parts of the atomic_check we also fill parts of the state, perform
>>> checks and then destroy it if the check fails.
>>>
>>
>> Yes, the same thing you wrote.
>>
>> I felt we can perform the validation and reject it before populating it in
>> the state as it seems thats doable here rather than populating it without
>> knowing whether it can be discarded.
> 
> But populate function does the check. It seems like an overkill to add
> another function. Also I still don't see the point. It was fine to call
> this function from .prepare_fb, but it's not fine to call it from
> .atomic_check?
> 

As we discussed during the meeting, discarding rejected state is fine 
and is a commonly used practice, hence this is okay. I was only trying 
to avoid that.

>>
>>> Maybe I'm missing your point here. Could you please explain what is the
>>> problem from your point of view?
>>>
>>>>
>>>> Can we move the validation part of dpu_format_populate_plane_sizes() out to
>>>> another helper dpu_format_validate_plane_sizes() and use that?
>>>>
>>>> And then make the remaining dpu_format_populate_plane_sizes() just a void
>>>> API to fill the layout?
>>>
> 

