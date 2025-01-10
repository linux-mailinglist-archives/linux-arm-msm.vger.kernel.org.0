Return-Path: <linux-arm-msm+bounces-44771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A580A09D96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 23:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189B8166DC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 22:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB032135AD;
	Fri, 10 Jan 2025 22:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XBsuZ+L+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B546213E84;
	Fri, 10 Jan 2025 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736546957; cv=none; b=S9hN4NgFc1COvjRa9ci7qP3ifhn5tpKAccSWhXdMZ6BbFd2pdJ1/06qoMiUyeARbDwSuZIMQ5MBtvEdCTkGaC+sheYK5f6K1ZbSp+nLYHB57KZs4edBVPBoZFPZjIm5aqDBb9t98v8n2wl1amBcA5iqVIZAZ/E2R4M9AVGvAInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736546957; c=relaxed/simple;
	bh=Rdbgpbtcff2MSSbJVoWYsC3f07Rp5ZC86pYzZ8ZyJ/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RL7sufukXFnTWRBCu+wYtfoYZtX0Jqh+a4m04sG9b8zy4R0+J0dYjXbLuvgTwEZmDMe3mkogsLm7OpHrFbC1IYfa8L9VBD9KGWODaBbAx12eBciM5gUTLMrwhS2/kwcFL+lz3PciQ0uVTSgQjj7gwLY56SuvA8C67hxyCA9YNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XBsuZ+L+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AIZ3GQ011234;
	Fri, 10 Jan 2025 22:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8i4zGtAr69mjhMlT7YQ2Z2YKYRASQ8ZPpk31Kx17ykM=; b=XBsuZ+L+Kgo7W5vY
	iVpOB7RVyn8sR140+p0ajdU8DAyrcu6KEY1Z6/e/j0oroeV4u0DLp3QGuC3FCOv0
	WufudZdxYNzQnW8JR7QKxx3ocKSZljMV0bbGUEFIOtd+MXRmrtedOP/XkMgmzkFe
	VwO9SfUURC18o5+oXhyLzbKryBiY9PodKNHRTjs3CXsdhHUZF8FuW67x2N7Et/aF
	BoFTmaeWUW2RLCsAkizXQ7/2R+VTy22nDywj/4o0b00y+kdzDXwcHnXRPsdZeO4P
	dzFBE2yTTKIAzgBghvm2fHkx65Qlse0G3S67TyOeYv9KNxS5MM+NY7hAL6WCMA2o
	B+IgSA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4438xxrehr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 22:08:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AM8vVl007435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 22:08:58 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 14:08:54 -0800
Message-ID: <92666877-1a88-4590-9adc-15cd7b4af06a@quicinc.com>
Date: Fri, 10 Jan 2025 14:08:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark
	<robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
	<ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
 <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
 <a4akor2liqafta53zeev22x2pkqwzo5szwidr2ruzdvttvze5h@jtio3jue7ez3>
 <e47b33e6-142d-42d6-8ae9-f2d2c7793d18@quicinc.com>
 <wheu3izj3pit6k3cmslpyegunmrcryy65y5eu432nec2y2aor6@kda3xnujhtnm>
 <0b741278-7c81-406b-bd28-e0cb9252e459@quicinc.com>
 <CAA8EJpogbq+iU-PA_ZXkTzU-1+MLaeLUaXWt_D+hTYnJ5_26Ew@mail.gmail.com>
 <fbba6424-f831-4cc5-8ed7-f508722c86bd@quicinc.com>
 <657hmty7qisg74pugmgxz4y4idze65ddozm25vnizcavqsubov@fk56ijbl23uv>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <657hmty7qisg74pugmgxz4y4idze65ddozm25vnizcavqsubov@fk56ijbl23uv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w6QEXyunb1YlhiYuqUIp1BN-Smcf0ZIT
X-Proofpoint-ORIG-GUID: w6QEXyunb1YlhiYuqUIp1BN-Smcf0ZIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100171



On 1/9/2025 6:10 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 09, 2025 at 05:50:16PM -0800, Jessica Zhang wrote:
>>
>>
>> On 1/9/2025 5:42 PM, Dmitry Baryshkov wrote:
>>> On Fri, 10 Jan 2025 at 02:30, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/9/2025 4:00 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 09, 2025 at 02:34:44PM -0800, Jessica Zhang wrote:
>>>>>>
>>>>>>
>>>>>> On 1/3/2025 10:16 AM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Jan 03, 2025 at 10:03:35AM -0800, Jessica Zhang wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
>>>>>>>>>> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
>>>>>>>>>> to account for concurrent writeback
>>>>>>>>>
>>>>>>>>> Why?
>>>>>>>>
>>>>>>>> Hi Dmitry,
>>>>>>>>
>>>>>>>> This flag is necessary to specify that CWB mux(es) need to be assigned for
>>>>>>>> the given reqeusted topology.
>>>>>>>
>>>>>>> Why is necessary? Please rephrase your statement (we need foo bar, so do
>>>>>>> baz).
>>>>>>
>>>>>> Ack, what do you think of rephrasing the commit msg to this:
>>>>>>
>>>>>> ```
>>>>>> Add support for adjusting topology based on if concurrent writeback is
>>>>>> enabled.
>>>>>>
>>>>>> Currently, the topology is calculated based on the assumption that the user
>>>>>> cannot request real-time and writeback simultaneously. For example, the
>>>>>> number of LMs and CTLs are currently based off the number of phys encoders
>>>>>> under the assumption there will be at least 1 LM/CTL per phys encoder.
>>>>>>
>>>>>> This will not hold true for concurrent writeback as 2 phys encoders (1
>>>>>> real-time and 1 writeback) can be driven by 1 LM/CTL when concurrent
>>>>>> writeback is enabled.
>>>>>>
>>>>>> To account for this, add a cwb_enabled flag and only adjust the number of
>>>>>> CTL/LMs needed by a given topology based on the number of phys encoders only
>>>>>> if CWB is not enabled.
>>>>>>
>>>>>> ```
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
>>>>>>>>>>       3 files changed, 20 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>>>>> index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>>>>> @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>>>>>>>>>                    dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>>>>>>>>>>                                                &crtc_state->adjusted_mode);
>>>>>>>>>> +        topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
>>>>>>>>>> +
>>>>>>>>>>            /*
>>>>>>>>>>             * Datapath topology selection
>>>>>>>>>>             *
>>>>>>>>>> @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>>>>>>>>>             * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>>>>>>>>>>             *
>>>>>>>>>>             * Add dspps to the reservation requirements if ctm is requested
>>>>>>>>>> +         *
>>>>>>>>>> +         * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
>>>>>>>>>> +         * enabled. This is because in cases where CWB is enabled, num_intf will
>>>>>>>>>> +         * count both the WB and real-time phys encoders.
>>>>>>>>>> +         *
>>>>>>>>>> +         * For non-DSC CWB usecases, have the num_lm be decided by the
>>>>>>>>>> +         * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
>>>>>>>>>>             */
>>>>>>>>>> -        if (topology.num_intf == 2)
>>>>>>>>>> +        if (topology.num_intf == 2 && !topology.cwb_enabled)
>>>>>>>>>>                    topology.num_lm = 2;
>>>>>>>>>>            else if (topology.num_dsc == 2)
>>>>>>>>>>                    topology.num_lm = 2;
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>>>>>> index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>>>>>> @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
>>>>>>>>>>            int i = 0, j, num_ctls;
>>>>>>>>>>            bool needs_split_display;
>>>>>>>>>> -        /* each hw_intf needs its own hw_ctrl to program its control path */
>>>>>>>>>> -        num_ctls = top->num_intf;
>>>>>>>>>> +        /*
>>>>>>>>>> +         * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
>>>>>>>>>> +         * control path. Hardcode num_ctls to 1 if CWB is enabled
>>>>>>>>>> +         */
>>>>>>>>>
>>>>>>>>> Why?
>>>>>>>>
>>>>>>>> This is because num_intf is based on the number of phys_encs. Since in the
>>>>>>>> CWB case, the WB and real-time encoders will be driven by the same CTL. I
>>>>>>>> can add this to the comment doc.
>>>>>>>
>>>>>>> Why are they driven by the same CTL? Is it also the case for platforms
>>>>>>> before DPU 5.x?
>>>>>>
>>>>>> This is because the WB and real-time path for a given topology would be
>>>>>> driven by the same data path so the same CTL should enable the real-time and
>>>>>> WB active bits.
>>>>>>
>>>>>> This is the same for pre-DPU 5.x.
>>>>>
>>>>> But pre-5.x platforms didn't have ACTIVE_CTL, so they should be using
>>>>> separte CTL for each of the physical encoders.
>>>>
>>>> For pre-DPU 5.x, enabling CWB would mean configuring the registers under
>>>> both the WB and MODE_SEL_* cases here [1]
>>>
>>> But do we still have to use a single CTL or would we use two different
>>> CTLs, one for the main output and one for WB?
>>
>> We would have to enable both WB and the real-time output on the same CTL
> 
> Thanks for the confirmation. Then the text your wrote above should be
> mostly okay. Please drop the first ("Add support...") sentence and s/can
> be driven by/must be driven by/ .

Ack, sounds good

> 
>>
>>>
>>>>
>>>> [1]
>>>> https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c#L588
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> Jessica Zhang
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +        if (top->cwb_enabled)
>>>>>>>>>> +                num_ctls = 1;
>>>>>>>>>> +        else
>>>>>>>>>> +                num_ctls = top->num_intf;
>>>>>>>>>>            needs_split_display = _dpu_rm_needs_split_display(top);
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>>>>>>> index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>>>>>>> @@ -46,6 +46,7 @@ struct dpu_rm {
>>>>>>>>>>        * @num_dspp:     number of dspp blocks used
>>>>>>>>>>        * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>>>>>>>>>>        * @needs_cdm:    indicates whether cdm block is needed for this display topology
>>>>>>>>>> + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
>>>>>>>>>>        */
>>>>>>>>>>       struct msm_display_topology {
>>>>>>>>>>            u32 num_lm;
>>>>>>>>>> @@ -53,6 +54,7 @@ struct msm_display_topology {
>>>>>>>>>>            u32 num_dspp;
>>>>>>>>>>            u32 num_dsc;
>>>>>>>>>>            bool needs_cdm;
>>>>>>>>>> +        bool cwb_enabled;
>>>>>>>>>>       };
>>>>>>>>>>       int dpu_rm_init(struct drm_device *dev,
>>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> 2.34.1
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> With best wishes
>>>>>>>>> Dmitry
>>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> With best wishes
>>>>>>> Dmitry
>>>>>>
>>>>>
>>>>> --
>>>>> With best wishes
>>>>> Dmitry
>>>>
>>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>>
> 
> -- 
> With best wishes
> Dmitry


