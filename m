Return-Path: <linux-arm-msm+bounces-41178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC99EA2E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F054188674C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FF0223C77;
	Mon,  9 Dec 2024 23:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lAeIIkpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8DF19B3EE;
	Mon,  9 Dec 2024 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733787421; cv=none; b=Txe9U18s/v3TidmHYhzJ3oaydvdmyVKKeIk6HuUg8EAmAusrTi1utoT4+LxCHF2G4+C46srb2Apf5Nne0ofHwy/BDxrZZ2nrVf6Ex/oC2VLwDVmoodeUlFGt3lW9DGFyHXEH9xoNfqkzsDGlFJBNTCBzS3YE0gKArrfrETINOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733787421; c=relaxed/simple;
	bh=vq8IYiFu14xQTthJ2nLtz8ZOeOJCA2q9zrxzcz3XchY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DLkzy0H8bOvtCa2Pngq65juCKAXz3D+T+qD8oJeIasrm7DIIORvnJH4hVOdd3JNUpg/OgeUhRQ8B2+4WHXiDiEVBtW04FKtpgcP77SOJ1Jv1JliwkcUL/Z7J9F5k0TL/jyOQS9N01oDCgV2zkhuC3dzlmAveJstlg3gdCD3XPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lAeIIkpd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9E6kxx006930;
	Mon, 9 Dec 2024 23:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4/jRw10YAjFx+3/nCGJzhXy6tTQOY51O8+dTPwLffU=; b=lAeIIkpdK+mh4bmU
	HV90lf+vVbj6YjGNqPczW7aYlYw9YZLlbnAcLrxjZXF+atvSdR/lfchjfUQT5ThY
	ghS+6TYrz37yOlTnR8XkBocFrRwJMEyX3cbLxoTE7LJbqVSjTWvHO14qyMZbnO6V
	JSaUG6kr/mSTExxBzjqrn7U334skH2mgp37ie32PoOnLqYIZ5ffyaMDYpeaUytWU
	iFTW6pFTiD9h5sPKp0Uiq6PHS8QsYXDcahHaj7SeBBbx8drxsYawgzK57rR+5mHB
	JJqV8WV2w6s3Kk/61cDdQZCtBLtaUbmduRtci+pv5PCZ1CgEizETvLeqgzICUzW8
	swZAvw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e21bhes3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 23:36:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9NaVGC003760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 23:36:31 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 15:36:30 -0800
Message-ID: <a22262d5-f1e3-498b-a850-d377f29166f1@quicinc.com>
Date: Mon, 9 Dec 2024 15:36:29 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Leonard Lausen <leonard@lausen.nl>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Johan Hovold
	<johan+linaro@kernel.org>
References: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
 <9c42bbb1-bf6c-4323-95f9-0ac9e7426d0c@quicinc.com>
 <CAA8EJppMA-AREJata0MWHCDYC-7ra723zhC4Nu_xD59O0mX_Ag@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppMA-AREJata0MWHCDYC-7ra723zhC4Nu_xD59O0mX_Ag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UIQDnhkmJuC0ts5-timquwcr0iBX5h58
X-Proofpoint-ORIG-GUID: UIQDnhkmJuC0ts5-timquwcr0iBX5h58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090184



On 12/9/2024 1:55 PM, Dmitry Baryshkov wrote:
> On Mon, 9 Dec 2024 at 21:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/9/2024 2:04 AM, Dmitry Baryshkov wrote:
>>> During suspend/resume process all connectors are explicitly disabled and
>>> then reenabled. However resume fails because of the connector_status check:
>>>
>>> [dpu error]connector not connected 3
>>> [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
>>>
>>> It doesn't make sense to check for the Writeback connected status (and
>>> other drivers don't perform such check), so drop the check.
>>>
>>> It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: move
>>> writeback's atomic_check to dpu_writeback.c"), since encoder's
>>> atomic_check() is called under a different conditions that the
>>> connector's atomic_check() (e.g. it is not called if there is no
>>> connected CRTC or if the corresponding connector is not a part of the
>>> new state).
>>>
>>> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Leonard Lausen <leonard@lausen.nl>
>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
>>> Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
>>> Reported-by: György Kurucz <me@kuruczgy.com>
>>> Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/
>>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>>> Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
>>> Tested-by: György Kurucz <me@kuruczgy.com>
>>> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Leonard Lausen reported an issue with suspend/resume of the sc7180
>>> devices. Fix the WB atomic check, which caused the issue.
>>> ---
>>> Changes in v4:
>>> - Epanded commit message (Johan)
>>> - Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org
>>>
>>> Changes in v3:
>>> - Rebased on top of msm-fixes
>>> - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org
>>>
>>> Changes in v2:
>>> - Reworked the writeback to just drop the connector->status check.
>>> - Expanded commit message for the debugging patch.
>>> - Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
>>>    1 file changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>>>        if (!conn_state || !conn_state->connector) {
>>>                DPU_ERROR("invalid connector state\n");
>>>                return -EINVAL;
>>> -     } else if (conn_state->connector->status != connector_status_connected) {
>>> -             DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
>>> -             return -EINVAL;
>>>        }
>>
>> Can you please explain me about why the status was not already connected?
>>
>> In all the places I checked (unless I missed something), if the detect()
>> callback is not registered, the connector is assumed connected like below:
>>
>> 404     if (funcs->detect_ctx)
>> 405             ret = funcs->detect_ctx(connector, ctx, force);
>> 406     else if (connector->funcs->detect)
>> 407             ret = connector->funcs->detect(connector, force);
>> 408     else
>> 409             ret = connector_status_connected;
>>
>> We do not register .detect for WB as WB connector should be always
>> connected.
>>
>> What scenario or use-case is making the connector status to something
>> other than connected?
>>
>> The places which mark the connector as unknown seem to be covered by
>> warnings in drm_probe_helper.c but the bug report doesnt seem to be
>> hitting those.
> 
> Because nobody asks for the getconnector on that connector. For
> example,drm_client_for_each_connector_iter() explicitly skips
> WRITEBACK connectors. So, drm_client_modeset_probe() also doesn't
> request ->fill_modes() on that connector.
> 
> I'm almost sure that if somebody runs a `modetest -ac` on the
> unpatched kernel after boot, there will be no suspend-related issues.
> In fact, I've just checked on RB5.
> /sys/class/drm/card0-Writeback-1/status reports 'unknown' before and
> 'connected' afterwards. You can easily replicate that on your
> hardware.
> 

Yes this is correct, I just checked on sc7180.

It stays at unknown till we run IGT. This matches your explanation 
perfectly.

>>
>> I am wondering if there is some case in fwk resetting this to unknown
>> silently (which is incorrect) and perhaps other drivers dont hit this as
>> there is a .detect registered which always returns connected and MSM
>> should follow that.
>>
>> 111 static enum drm_connector_status
>> 112 komeda_wb_connector_detect(struct drm_connector *connector, bool force)
>> 113 {
>> 114     return connector_status_connected;
>> 115 }
>> 116
> 
> No, that won't help. You can add a detect() callback and verify that
> simply isn't getting called. It's not resetting the connector->status,
> it's nobody setting it for the first time.
> 

What we found is that drm_atomic_helper_suspend() which calls 
drm_atomic_helper_duplicate_state(), uses drm_for_each_connector_iter() 
which does not rely on the last atomic state but actually uses the 
config->connector_list which in-turn disables all connectors including WB.

Is this expected that even though WB was not really there in the last 
atomic_state before the suspend, still ended up suspending / resuming 
and thus exposing this bug?

I am  now more convinced of this change as I understand the flow better. 
But wanted to highlight above observation.

>>>
>>>        crtc = conn_state->crtc;
>>>
>>> ---
>>> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
>>> change-id: 20240709-dpu-fix-wb-6cd57e3eb182
>>>
>>> Best regards,
> 
> 
> 

