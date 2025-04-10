Return-Path: <linux-arm-msm+bounces-53745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C91AA835F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 03:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3F76171514
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 01:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A90278F34;
	Thu, 10 Apr 2025 01:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TO9NKiTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E94BA38
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249727; cv=none; b=e4y4PTsoluKBHVaYLVlhM2vpAXnBvDv+DDE5bfORHNSnP+2rzQyrZIuh+Pa3cEsCfzEX0eMxjFoKmr28Ae6cQ3tIBGGS4PBNnTc3Z345EwFBXKvZv7t6mAngf33pDL97fxjlFcQkKhVH1uM+CL3oVzdmue5ertxu/sMmTPyu+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249727; c=relaxed/simple;
	bh=ztyuZYD2QiwTeaHwR3oqEp34vmJD2uUrPKv6pNLOgBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b02TFVRwRtJpCnkpX0VRhqwtY8jJflvs4Hs2TQO51CHA6hRPZVY+Fo7gG+fwI3r+7zKdwVzaz0aN+EHH1neUzV4akqXpL0uGx3g/+nAb/rSXP/vd3rqU/qVAFJqtv5GwI1U8VLDwe1PJj53knzVruLJt0MLF/+kQjYmXjs6a3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO9NKiTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDpi2030960
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 01:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zKhnfdV3GEFVHaKgfNhvY0tGFR+eogY4Uoy9iYfC7pU=; b=TO9NKiTxT+KRwnz2
	QigVSd7ytIopiNDdF/jXyAAt61dTRhKBdXqf2i8D0k5p1Noj4zdAZWQNfg2gjGgX
	j2ZFtkBYj0NAnek1nDr+gXRu31N40VEo1ZneLLOeNMvgmmfM53oF81b0naXZjbUS
	Mv7cEVuF+q4jYwKUA65F3kxcFuks2tHXYGYe6o64q+XgWPYsvgZIOX+vBSXQhP9v
	g1TGIM7Udw+d7XC42pXfxzXLRjJKJyJMluaU9US9ZgWRJaBgoNiO0vPqAd0CoqIQ
	vw/lT4MbPwrVIqCmVfW1nBO2S8fFrnOp5GGk595YXfmxBjx/sbPKaa0AJXPS0sRc
	LguVhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbun9e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 01:48:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f7210995so63804585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 18:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744249723; x=1744854523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKhnfdV3GEFVHaKgfNhvY0tGFR+eogY4Uoy9iYfC7pU=;
        b=BcMHyBNquj/Vod2woYC+KVtvoXRbthhuZREAfZiGkqZbOJhK5X2QMayEcxwNPt0mIL
         OF+2F/yzISqvvKe962J9e0YCrAAZuSH+VEqtJ7WBwtw1eRFvVU+4/UlPxwIk5Ze+XgYa
         JEHC47ZtmKvlxPT+T6UNS++Zf6DdsUd4I9oZnuvdNxDU+DTz/zuanSrZNvtLmamxZD9r
         E8clKvWiyXKzBAcUvIv4RrEot77bbM4knlTtl+Fxhhz4YN9OP3Cy22Ed6Oux8WtdFf94
         AZZT7w8rWYmg08fmi8h9IupNp9yooEBHRFELIUnxeD02aaEvu7hc0sEVsIzlFOaUE5pT
         IQTA==
X-Forwarded-Encrypted: i=1; AJvYcCXSYlkASHlZw7frv+9A5bHN/A/2WIchhQjF8HcnY3JTU0DfKzf1KfCNULXmw17Wc+KCsJ6tYY/7Tg/ZQdeo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/YJcY59TXmR++d+/oTadUfAz8OJypOGxLrwvD0PoD5qmuQrx
	sg3Vvs52AWSjhPLHq0RWZ+5vC9HPx5PstxTQPwnEIGnkKNA3EuLGQL93hV8x1CWL1nSLsoqh3EJ
	azHGGD6QBl52HoXI9s2gMf42hJDrfAh6fpyZgx8gs0kJprI4C4zLNMjZ/pawFWfAw
X-Gm-Gg: ASbGncvu3oG7+t77WtC+toFHJAYkVtUwBoW5k+qMW0rpP2FDUrlNw4Z5Tewoe3o9tiA
	QclxbPwmv+l2Oj2Jx2mVr0FMG3/5lR8sTu2QPDPo3GlosHeIoi2+A+2KZR+wgsyNm4KN5dF81VZ
	VFIuHXx4l2lPQAgM5g6fdAhX2qk0u1j7g+MIRLsB5fh++TJeN28YoPLfpwOymOCoxHX/eflBWc9
	VQO9cZYBdAXHefROQIYbK655ApRxjQMjL6chzyoeoTH9PZVg4UB6v4KT0rxqK9BjYoCn4ZhsNJ3
	3zZqw3d3vUPGG+Rg3yNHgwWvUM2zcf5X+QXmV0Ezl4MBdArtUnzEktmnsqPfmrRtPmI=
X-Received: by 2002:a05:620a:d87:b0:7c3:b7c2:acf6 with SMTP id af79cd13be357-7c7a7675c27mr147094485a.15.1744249723357;
        Wed, 09 Apr 2025 18:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVpTVwea76PwuaFk+JPjY47A66yas3RifEpD1NxW5A88uPSJBzRF7DiQ+Tyo4KIZTq6M1MLg==
X-Received: by 2002:a05:620a:d87:b0:7c3:b7c2:acf6 with SMTP id af79cd13be357-7c7a7675c27mr147091885a.15.1744249722981;
        Wed, 09 Apr 2025 18:48:42 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3ce4da20sm18066e87.0.2025.04.09.18.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 18:48:40 -0700 (PDT)
Message-ID: <c87c88be-211b-424e-b033-496e1e877d10@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 04:48:39 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
 <20250311234109.136510-3-alex.vinarskis@gmail.com>
 <ytqnodci5xhkd4eqs3homrdwbv4zkaiewalfsbuclvkkaw754t@wpt3noqxlcvu>
 <CAMcHhXrZiO7PxyGsZY3upPzk=GeM4GVSmwUUWy2J+DYEe6ggVg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMcHhXrZiO7PxyGsZY3upPzk=GeM4GVSmwUUWy2J+DYEe6ggVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NiT_fWmWt1wWgaSld0JFSvOPHMAptTGx
X-Proofpoint-ORIG-GUID: NiT_fWmWt1wWgaSld0JFSvOPHMAptTGx
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f7237c cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=Hp4AkEBV2qiAwbuNyjgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100012

On 09/04/2025 01:29, Aleksandrs Vinarskis wrote:
> On Tue, 1 Apr 2025 at 02:55, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Wed, Mar 12, 2025 at 12:38:04AM +0100, Aleksandrs Vinarskis wrote:
>>> DisplayPort requires per-segment link training when LTTPR are switched
>>> to non-transparent mode, starting with LTTPR closest to the source.
>>> Only when each segment is trained individually, source can link train
>>> to sink.
>>>
>>> Implement per-segment link traning when LTTPR(s) are detected, to
>>> support external docking stations. On higher level, changes are:
>>>
>>> * Pass phy being trained down to all required helpers
>>> * Run CR, EQ link training per phy
>>> * Set voltage swing, pre-emphasis levels per phy
>>>
>>> This ensures successful link training both when connected directly to
>>> the monitor (single LTTPR onboard most X1E laptops) and via the docking
>>> station (at least two LTTPRs).
>>>
>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++---------
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
>>>   drivers/gpu/drm/msm/dp/dp_display.c |   4 +-
>>>   3 files changed, 99 insertions(+), 44 deletions(-)
>>>

[...]

>>> @@ -1129,18 +1144,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>>>        if (ret)
>>>                return ret;
>>>        msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
>>> -             DP_LINK_SCRAMBLING_DISABLE);
>>> +             DP_LINK_SCRAMBLING_DISABLE, dp_phy);
>>>
>>> -     ret = msm_dp_ctrl_update_vx_px(ctrl);
>>> +     msm_dp_link_reset_phy_params_vx_px(ctrl->link);
>>> +     ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>>>        if (ret)
>>>                return ret;
>>>
>>>        tries = 0;
>>>        old_v_level = ctrl->link->phy_params.v_level;
>>>        for (tries = 0; tries < maximum_retries; tries++) {
>>> -             drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
>>> +             fsleep(delay_us);
>>>
>>> -             ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
>>> +             ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
>>
>> Please rebase this code on top of drm-misc-next.
> 
> What is the relation of drm-misc-next to linux-next? When rebasing on
> top of drm-misc-next, I lose all displays including internal one. Same
> if just build drm-misc-next without this series with config imported
> from linux-next. I could of course address comments, test on
> linux-next and then rebase before submitting, but that sounds wrong.

Usually drm-misc-next is a part of the linux-next. Except the time 
between -rc6 (or -rc7) and -rc1, when the drm-misc-next gets new 
patches, but they are not propagated to the linux-next.

As we are past -rc1, linux-next should be getting drm-misc-next as 
usual. So, please just rebase onto the linux-next. Be sure to account 
for linux-next

> 
> ```
> auxiliary aux_bridge.aux_bridge.0: deferred probe pending:
> aux_bridge.aux_bridge: failed to acquire drm_bridge
> auxiliary aux_bridge.aux_bridge.1: deferred probe pending:
> aux_bridge.aux_bridge: failed to acquire drm_bridge
> ```
> 
>>
>>>                if (ret)
>>>                        return ret;
>>>

[...]

>>> @@ -1902,7 +1954,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>>                        }
>>>
>>>                        /* stop link training before start re training  */
>>> -                     msm_dp_ctrl_clear_training_pattern(ctrl);
>>> +                     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>>
>> Just DPRX or should this include all LTTPRs? Could you point out how
>> this is handled inside Intel or AMD drivers?
> 
> Just DPRX since this call follows `rc =
> msm_dp_ctrl_setup_main_link(ctrl, &training_step);` [1], which in turn
> calls `msm_dp_ctrl_link_train` [2].
> The latter one with the proposed changes will attempt to Train
> LTTPRx->Clear training pattern on LTTPRx->Proceed. Finally, it will
> attempt to Train DPRX, without cleaning the training pattern:
> 
> ```
>      for (i = *ctrl->lttpr_count - 1; i >= 0; i--) {
>          enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
> 
>          ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
>          msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
> 
>          if (ret)
>              break;
>      }
> 
>      if (ret) {
>          DRM_ERROR("link training of LTTPR(s) failed. ret=%d\n", ret);
>          goto end;
>      }
> 
>      ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
>      if (ret) {
>          DRM_ERROR("link training on sink failed. ret=%d\n", ret);
>          goto end;
>      }
> ```
> 
> The reason for not clearing training pattern on DPRX right after
> training like with LTTPRs appears to be needed for compliance, as it
> should only be cleared right before stream starts [3]:
> ```
>      if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
>          return rc;
> 
>      if (rc == 0) {  /* link train successfully */
>          /*
>           * do not stop train pattern here
>           * stop link training at on_stream
>           * to pass compliance test
>           */
>      } else  {
>          /*
>           * link training failed
>           * end txing train pattern here
>           */
>          msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
> 
>          msm_dp_ctrl_deinitialize_mainlink(ctrl);
>          rc = -ECONNRESET;
>      }
> ```
> 
> Intel does a somewhat similar approach - they have
> `intel_dp_link_train_all_phys` function [4] which would Train
> LTTPRx->Clear dpcd training pattern on LTTPRx->Proceed, and finally
> train DPRX but not disable training pattern. DPRX's training is
> disabled separately in the `intel_dp_stop_link_train` [5] at a much
> later stage.

Ack, thanks.

> 
> The difference to msm's drm driver is that in case of link training
> failure, Intel schedules software hpd event [6] and exists, while msm
> stops and restarts training with reduced parameters internally (this
> very function), hence it appears more than once.
> 
> [1] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/msm/dp/dp_ctrl.c#L1856
> [2] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/msm/dp/dp_ctrl.c#L1273
> [3] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/msm/dp/dp_ctrl.c#L1917-L1932
> [4] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/i915/display/intel_dp_link_training.c#L1338-L1364
> [5] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/i915/display/intel_dp_link_training.c#L1107-L1136
> [6] https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/i915/display/intel_dp_link_training.c#L1313-L1336
> 
>>
>>>                }
>>>
>>>                rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);

-- 
With best wishes
Dmitry

