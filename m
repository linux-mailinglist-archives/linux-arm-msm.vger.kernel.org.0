Return-Path: <linux-arm-msm+bounces-42288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA29F2879
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 03:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 986F97A145A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 02:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767DE286A9;
	Mon, 16 Dec 2024 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PPTqzWMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A78F9DD;
	Mon, 16 Dec 2024 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734315582; cv=none; b=ZakTIbzxjCkpyqzRT7JgsTv9p2m80PJOynEXJBI3btP9Hz5BLgT1a6Y7Hrq7Zs8NzNtyWvnmLwxj/ZtZr6rNPIsRlG2IXB9hiZ53eTrTVUvZ2fWaWUhrTXgUxJzBRhcd61sqkdkTIw5REWpR2FBhTEq7MguX+QPw8AX5yYs7lnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734315582; c=relaxed/simple;
	bh=hKzyIpBqw7KkcqlCuzxVcow04rFKSSBvdFMEgjPd8IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DeE9tznEvE6RuAhxND4k+WUb9SEiXx6wA6qzVw1CvkdGh5PmifwIeBLXibqp+an6CwtXVIcavfCLQcmEYCDxw1EuIfqs2U2t8aYLAwL29kHGawYdFcglyJSjdW7ar2MWgcLSsFGgPxWkMjL3w2hxo972G8ge3uRQW+cufu1YwEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PPTqzWMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG28xsY025873;
	Mon, 16 Dec 2024 02:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxqPQuZdtSzYqadtsbgVmkNynvY2w4/NYzWtD/niH+M=; b=PPTqzWMp40LW53uG
	t2+Yd/An6bEnxidi9776V8uE0G+88Okix0mUxWDkONr3/GGBFWGTmeoLRuLyLxU9
	5KsbDlwCt+yzdeUlr9AcOc/o4HGoKIu4Bvgtvk3fiazcc5pMfmpKDjcyBET+mJSs
	lalY6xA8Y+YPFWEr1xmUOlKbqY+zoZTdk4mWMYnLpdIrJkj5pvB32ELqwndjLMOf
	YOGoQ/1EECEvGi5esR7dcBHrvdWLGBWYiHGZV5nmqMUb642Ze5eZ3MN0DBb9SNd4
	hsUF5SgtoDcWs1gLJQAQ9aIEUI87NwwaDXqTTUCPy7haRHX7lNlZ8yWiL1m1S+sQ
	3gmifQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jb5rr0k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:19:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG2JBB5010962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:19:11 GMT
Received: from [10.110.102.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Dec
 2024 18:19:10 -0800
Message-ID: <54188c68-41c7-4a42-9eca-67363b30217a@quicinc.com>
Date: Sun, 15 Dec 2024 18:19:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maxime Ripard
	<mripard@kernel.org>
CC: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
 <20240925-hasty-bald-caribou-eedbf5@houat>
 <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K9r6Da7mMNK9VrorMF6wFaFU1tsW4mz0
X-Proofpoint-ORIG-GUID: K9r6Da7mMNK9VrorMF6wFaFU1tsW4mz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160017

Hi Maxime

Gentle reminder on this one.

We are looking for some advice on how to go about KUnit for this static 
function.

Please help with our question below.

Thanks

Abhinav

On 12/6/2024 4:48 PM, Jessica Zhang wrote:
> 
> 
> On 9/25/2024 12:23 AM, Maxime Ripard wrote:
>> On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
>>> Check that all encoders attached to a given CRTC are valid
>>> possible_clones of each other.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>>> b/drivers/gpu/drm/drm_atomic_helper.c
>>> index 43cdf39019a4..cc4001804fdc 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
>>>       return 0;
>>>   }
>>> +static int drm_atomic_check_valid_clones(struct drm_atomic_state 
>>> *state,
>>> +                     struct drm_crtc *crtc)
>>> +{
>>> +    struct drm_encoder *drm_enc;
>>> +    struct drm_crtc_state *crtc_state = 
>>> drm_atomic_get_new_crtc_state(state,
>>> +                                      crtc);
>>> +
>>> +    drm_for_each_encoder_mask(drm_enc, crtc->dev, 
>>> crtc_state->encoder_mask) {
>>> +        if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
>>> +            crtc_state->encoder_mask) {
>>> +            DRM_DEBUG("crtc%d failed valid clone check for mask 
>>> 0x%x\n",
>>> +                  crtc->base.id, crtc_state->encoder_mask);
>>> +            return -EINVAL;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /**
>>>    * drm_atomic_helper_check_modeset - validate state object for 
>>> modeset changes
>>>    * @dev: DRM device
>>> @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct 
>>> drm_device *dev,
>>>           ret = drm_atomic_add_affected_planes(state, crtc);
>>>           if (ret != 0)
>>>               return ret;
>>> +
>>> +        ret = drm_atomic_check_valid_clones(state, crtc);
>>> +        if (ret != 0)
>>> +            return ret;
>>>       }
>>
>> Pretty much the same comment, we should have kunit tests for this.
> 
> Hey Maxime,
> 
> I'm working on the kunit test for this and had a question on the design 
> for the unit test:
> 
> Since this is a static helper that returns a pretty common error code, 
> how would you recommend going about making sure that 
> `drm_atomic_check_valid_clones()` specifically is returning the error 
> (and not a different part of check_modeset) when testing the 
> check_valid_clones() failure path?
> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>> Maxime
> 

