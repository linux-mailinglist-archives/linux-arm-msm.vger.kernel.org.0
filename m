Return-Path: <linux-arm-msm+bounces-45186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67721A130A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 02:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9A1163287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 01:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6FA5CB8;
	Thu, 16 Jan 2025 01:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f0HTXeRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67768282F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 01:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990370; cv=none; b=WpISOTV5mDhWTKoRhwNE22QJaFiyzfmsU635Yuo+6CuUe+7eogj79IGt+vEN4I1I8tb6fmRIraim2ErKRVid7LkMjb4swQ9V4IixLbI6XQFf7bYMCbkvtpHXfyyoz6dUut+0WuxBcFNPpneFVca/ci7ya9XqXMlahETTvy4yitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990370; c=relaxed/simple;
	bh=KPy/nXwb6geM6Iy6Kv7wW7UilTv/Ap8DC3cGQVkUS8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k4POo9epzYDSFMQGS7gsFsV2maGGTu0ySs+pjnUuxZxfxpEymONahnh86r6iFFLJpiETpzL+3t063Vp2v3Nv8z3zky8UMAcCgFJjGuUIGp189S+l/ZUXhU8XSH5oTS/g0OI8T789o8Zdo/tsfStPJlTcySrf4T44b29gYwdu5Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f0HTXeRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FLto4G004278;
	Thu, 16 Jan 2025 01:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOjh0L5dnAHIV17TBIx9PUQNtlEynFWqao7Ob7k+KiU=; b=f0HTXeRlKNFX8anA
	Ea+lLCUXlOWtMlKw708OWdsAV+hsGCF3yVpQZ1fBd034DTjJToAN00BnVRwiQtTT
	lYE/EZYp2XuE0I9xlfFkby2IryZp1H5gps5EkBnpZyzvTfxPkahxHc9GNT1yNNIo
	jyVUzkjjum1pAIfA/666z/D2b10GxGy1C5TCMHCganCwymix0s6ZdgmEio1pWj9u
	WvcoWfLFNKr1OvslgYy0zvgBnRII7v//QvU2UWlMWNxgvUk0WdZ8JlqrEUG0Q1B4
	+E/o8RK9UjRUlHqdtpkzMbA+7C5VnQrjD/WXkLkI79+g61L8lYASv0TVXaai7qzA
	fOsW5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446nc3ratu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 01:19:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G1JBBn023306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 01:19:12 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 17:19:11 -0800
Message-ID: <4ec8d87a-2842-47e7-bca5-d7cc2264ccca@quicinc.com>
Date: Wed, 15 Jan 2025 17:19:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] drm/msm/dpu: rework core_perf debugfs overrides
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-8-00b248349476@linaro.org>
 <86152d89-cf42-4e2f-a188-c401de9d47df@quicinc.com>
 <2qhm7oqpbgyoghpj3txjpmb4q3tmxd23cvrdqxicw3lpmwfcwg@m5mn5flvovmp>
 <aa7fd49e-ab48-47b6-8e77-15246f79010f@quicinc.com>
 <usk35aka6di4iay4ltz7gv2oydga55lvjy6n5netypixgp25ue@2djf75uegzyo>
 <3b857797-489b-4dfe-af2c-6f25bb8d51ea@quicinc.com>
 <hqxli6afdqwklvckrg3eokzpygrwshan4kuihextzdgnczrbyk@du4k5gmiuem3>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <hqxli6afdqwklvckrg3eokzpygrwshan4kuihextzdgnczrbyk@du4k5gmiuem3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RzT5PdqXyi36tGJy_4pVfXcKSdqWYHQF
X-Proofpoint-ORIG-GUID: RzT5PdqXyi36tGJy_4pVfXcKSdqWYHQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_11,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160007



On 1/15/2025 5:15 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 04:47:34PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 1/15/2025 4:35 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 15, 2025 at 11:51:20AM -0800, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 1/15/2025 12:41 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jan 14, 2025 at 02:02:54PM -0800, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
>>>>>>> Currently debugfs provides separate 'modes' to override calculated
>>>>>>> MDP_CLK rate and interconnect bandwidth votes. Change that to allow
>>>>>>> overriding individual values (e.g. one can override just clock or just
>>>>>>> average bandwidth vote). The maximum values allowed for those entries by
>>>>>>> the platform can be read from the 'max_core_ab' and 'max_core_clk_rate'
>>>>>>> files in debugfs.
>>>>>>>
>>>>>>
>>>>>> Apart from the concern I highlighted in the previous patch, the only issue I
>>>>>> have with this is that, this went from a one step process of using the
>>>>>> "mode" this has become a two step one.
>>>>>>
>>>>>> There were essentially two modes we are talking about - "fixed" and
>>>>>> "minimum"
>>>>>>
>>>>>> With respect to "fixed" this is totally fine because this is preserving that
>>>>>> functionality because to be able to set the fixed mode the end user must
>>>>>> know what values they want to try anyway.
>>>>>>
>>>>>> With respect to "minimum" mode, is where this approach is not that great.
>>>>>> The end users of this can be non-display developers too such as our QA teams
>>>>>> who might want to perform a first level of triage on the issues and route it
>>>>>> accordingly. This is especially true for underruns and some performance lags
>>>>>> as well.
>>>>>>
>>>>>> If you really dont like the term "modes", to preserve the "minimum" mode,
>>>>>> how about just using a bool debugfs like "max_perf_params" which internally
>>>>>> maxes out the max MDP clock and ab/ib params.
>>>>>
>>>>> That's what I'm trying to avoid - having an extra debugfs file which
>>>>> overrides other files. It is much easier to work if there is no need to
>>>>> switch modes, it is easy to overlook it. I think it should be fine to
>>>>> use `cat max_foo > fix_foo` to override each of the params. After
>>>>> renaming the threshold_high to max_core_ab the names of the debugfs
>>>>> files match.
>>>>>
>>>>
>>>> Its just a difference in interpretation IMO.
>>>>
>>>> the "fixed" mode is trying to given an option to incrementally try and see
>>>> which value really works and also to see whether its the clock OR the
>>>> bandwidth which is making the difference. So individual control of those.
>>>>
>>>> The "max" mode is trying to see if even the max values of everything cannot
>>>> fix the problem. BTW, the max was maxing out BOTH the DPU clocks and BW.
>>>>
>>>> So this is not just 2 extra reads for the user but 3. (ab/ib/dpu_clk) if we
>>>> drop "max" and use "fixed" for max as well and even for that the user has to
>>>> refer the max DPU clock value.
>>>
>>> Yes, I understand that. However I still think that it's easier than
>>> having a set of 'fix_foo' values which are silently ignored because of
>>> the preselected mode.
>>>
>>> I can probably see an option: use your max_perf_params idea, but in a
>>> form of a write-only file which immediately selects max values for clock
>>> rate and both bandwidths. WDYT?
>>>
>>
>> Sorry I am missing something here. This is the same thing I had in mind to
>> have it as a bool when someone does echo 1 > max_perf_params, it will
>> immediately max the values for clock rate and bandwidth.
>>
>> So to summarize, there are four nodes:
>>
>> 1) fix_core_ab_vote
>> 2) fix_core_ib_vote
>> 3) fix_core_clk_rate
>>
>> These individually control their respective params
>>
>> 4) max_perf_params - which maxes out all of the above
>>
>> Is this what you are referring to as well?
> 
> 4) ... which updates those to the max values.
> 
> Yes. But the file is not modal, you don't have to echo 0 to it to stop
> using the max values.
> 

Yes this is fine. Please go ahead.

>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
>>>>>>>      2 files changed, 9 insertions(+), 88 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> index 7ff3405c6867556a8dc776783b91f1da6c86ef3f..913eb4c01abe10c1ed84215fbbee50abd69e9317 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> @@ -17,20 +17,6 @@
>>>>>>>      #include "dpu_crtc.h"
>>>>>>>      #include "dpu_core_perf.h"
>>>>>>> -/**
>>>>>>> - * enum dpu_perf_mode - performance tuning mode
>>>>>>> - * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
>>>>>>> - * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
>>>>>>> - * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
>>>>>>> - * @DPU_PERF_MODE_MAX: maximum value, used for error checking
>>>>>>> - */
>>>>>>> -enum dpu_perf_mode {
>>>>>>> -	DPU_PERF_MODE_NORMAL,
>>>>>>> -	DPU_PERF_MODE_MINIMUM,
>>>>>>> -	DPU_PERF_MODE_FIXED,
>>>>>>> -	DPU_PERF_MODE_MAX
>>>>>>> -};
>>>>>>> -
>>>>>>>      /**
>>>>>>>       * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>>>>>>>       * @perf_cfg: performance configuration
>>>>>>> @@ -215,18 +201,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>>>>>>      	if (!kms->num_paths)
>>>>>>>      		return 0;
>>>>>>> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
>>>>>>> -		avg_bw = 0;
>>>>>>> -		peak_bw = 0;
>>>>>>> -	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
>>>>>>> +	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>>>>>>> +
>>>>>>> +	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
>>>>>>> +	peak_bw = perf.max_per_pipe_ib;
>>>>>>> +
>>>>>>> +	if (kms->perf.fix_core_ab_vote)
>>>>>>>      		avg_bw = kms->perf.fix_core_ab_vote;
>>>>>>> -		peak_bw = kms->perf.fix_core_ib_vote;
>>>>>>> -	} else {
>>>>>>> -		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>>>>>>> -		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
>>>>>>> -		peak_bw = perf.max_per_pipe_ib;
>>>>>>> -	}
>>>>>>> +	if (kms->perf.fix_core_ib_vote)
>>>>>>> +		peak_bw = kms->perf.fix_core_ib_vote;
>>>>>>>      	avg_bw /= kms->num_paths;
>>>>>>> @@ -275,12 +259,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>>>>>>      	struct drm_crtc *crtc;
>>>>>>>      	struct dpu_crtc_state *dpu_cstate;
>>>>>>> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>>>>>>> +	if (kms->perf.fix_core_clk_rate)
>>>>>>>      		return kms->perf.fix_core_clk_rate;
>>>>>>> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
>>>>>>> -		return kms->perf.max_core_clk_rate;
>>>>>>> -
>>>>>>>      	clk_rate = 0;
>>>>>>>      	drm_for_each_crtc(crtc, kms->dev) {
>>>>>>>      		if (crtc->enabled) {
>>>>>>> @@ -396,54 +377,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>>>>>>      #ifdef CONFIG_DEBUG_FS
>>>>>>> -static ssize_t _dpu_core_perf_mode_write(struct file *file,
>>>>>>> -		    const char __user *user_buf, size_t count, loff_t *ppos)
>>>>>>> -{
>>>>>>> -	struct dpu_core_perf *perf = file->private_data;
>>>>>>> -	u32 perf_mode = 0;
>>>>>>> -	int ret;
>>>>>>> -
>>>>>>> -	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
>>>>>>> -	if (ret)
>>>>>>> -		return ret;
>>>>>>> -
>>>>>>> -	if (perf_mode >= DPU_PERF_MODE_MAX)
>>>>>>> -		return -EINVAL;
>>>>>>> -
>>>>>>> -	if (perf_mode == DPU_PERF_MODE_FIXED) {
>>>>>>> -		DRM_INFO("fix performance mode\n");
>>>>>>> -	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
>>>>>>> -		/* run the driver with max clk and BW vote */
>>>>>>> -		DRM_INFO("minimum performance mode\n");
>>>>>>> -	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
>>>>>>> -		/* reset the perf tune params to 0 */
>>>>>>> -		DRM_INFO("normal performance mode\n");
>>>>>>> -	}
>>>>>>> -	perf->perf_tune.mode = perf_mode;
>>>>>>> -
>>>>>>> -	return count;
>>>>>>> -}
>>>>>>> -
>>>>>>> -static ssize_t _dpu_core_perf_mode_read(struct file *file,
>>>>>>> -			char __user *buff, size_t count, loff_t *ppos)
>>>>>>> -{
>>>>>>> -	struct dpu_core_perf *perf = file->private_data;
>>>>>>> -	int len;
>>>>>>> -	char buf[128];
>>>>>>> -
>>>>>>> -	len = scnprintf(buf, sizeof(buf),
>>>>>>> -			"mode %d\n",
>>>>>>> -			perf->perf_tune.mode);
>>>>>>> -
>>>>>>> -	return simple_read_from_buffer(buff, count, ppos, buf, len);
>>>>>>> -}
>>>>>>> -
>>>>>>> -static const struct file_operations dpu_core_perf_mode_fops = {
>>>>>>> -	.open = simple_open,
>>>>>>> -	.read = _dpu_core_perf_mode_read,
>>>>>>> -	.write = _dpu_core_perf_mode_write,
>>>>>>> -};
>>>>>>> -
>>>>>>>      /**
>>>>>>>       * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
>>>>>>>       * @dpu_kms: Pointer to the dpu_kms struct
>>>>>>> @@ -472,8 +405,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>>>>>>>      			(u32 *)&perf->perf_cfg->min_llcc_ib);
>>>>>>>      	debugfs_create_u32("min_dram_ib", 0400, entry,
>>>>>>>      			(u32 *)&perf->perf_cfg->min_dram_ib);
>>>>>>> -	debugfs_create_file("perf_mode", 0600, entry,
>>>>>>> -			(u32 *)perf, &dpu_core_perf_mode_fops);
>>>>>>>      	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
>>>>>>>      			&perf->fix_core_clk_rate);
>>>>>>>      	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>>>> index 5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d..9d8516ca32d162b1e277ec88067e5c21abeb2017 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>>>> @@ -24,20 +24,11 @@ struct dpu_core_perf_params {
>>>>>>>      	u64 core_clk_rate;
>>>>>>>      };
>>>>>>> -/**
>>>>>>> - * struct dpu_core_perf_tune - definition of performance tuning control
>>>>>>> - * @mode: performance mode
>>>>>>> - */
>>>>>>> -struct dpu_core_perf_tune {
>>>>>>> -	u32 mode;
>>>>>>> -};
>>>>>>> -
>>>>>>>      /**
>>>>>>>       * struct dpu_core_perf - definition of core performance context
>>>>>>>       * @perf_cfg: Platform-specific performance configuration
>>>>>>>       * @core_clk_rate: current core clock rate
>>>>>>>       * @max_core_clk_rate: maximum allowable core clock rate
>>>>>>> - * @perf_tune: debug control for performance tuning
>>>>>>>       * @enable_bw_release: debug control for bandwidth release
>>>>>>>       * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
>>>>>>>       * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
>>>>>>> @@ -47,7 +38,6 @@ struct dpu_core_perf {
>>>>>>>      	const struct dpu_perf_cfg *perf_cfg;
>>>>>>>      	u64 core_clk_rate;
>>>>>>>      	u64 max_core_clk_rate;
>>>>>>> -	struct dpu_core_perf_tune perf_tune;
>>>>>>>      	u32 enable_bw_release;
>>>>>>>      	u64 fix_core_clk_rate;
>>>>>>>      	u32 fix_core_ib_vote;
>>>>>>>
>>>>>
>>>
> 

