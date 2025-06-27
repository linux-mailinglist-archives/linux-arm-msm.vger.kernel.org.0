Return-Path: <linux-arm-msm+bounces-62781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7EAEB7EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64D925625C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C0F2D3EF2;
	Fri, 27 Jun 2025 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnXVXbvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E292D3EE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028055; cv=none; b=FQNX37NbXrScC0h850EB4NtdrzrMJB5brPVZ4IaOXW27gXsMcUsknPwO+FJo1VFnboyPBSbBAC7Rm8xZzXuNkpIm0eKgso5jBpbmdBF9R9tBU6QCVHt26cNwVm480e4fJCiLyVRJvcKbeDwtWTEmnUEYdBYSVzk/EL8vwX23b/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028055; c=relaxed/simple;
	bh=fUYDPKQN+ScTBoYcWLPFcBGxVQbXsxGs/dfNklpTgAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6dbfhimtWwasgbxuH01wAPc3SYPLxgXXEx7THxC4GewVb+dGmkMPDXK0juDLhiYE4GvO6gxCdGWAXog8vpEbrVRO+4RW8u7xKGzh7jon00il7hMa2j4WjV/wDAhIl1oHhOKcrAxc/xGUTdW2IcbFg2PvCRtd1jSv1JSWtrhDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnXVXbvL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBnEgq032685
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHlNGw65/NyPXrUrl04t6D1qYWyjgSpHMuXvzrQ6OaI=; b=PnXVXbvL9qq9IFjQ
	oM2ccLOCXSvwoBWg4NKNTOJsWpiMAnmuVMtPr6wzg7dE/7EgyLHMRIFouu0qSkmM
	y2LAvEGMKTaHjdM4Ll6o/3Y3+6K9T+5XNVUzbnBpz059R+OT4wRihnOcvEtUCOLv
	Rz3ULETE2Wrd0z4tgsOnaL5CgDpCZjaugaDP5v7k5G/AA9HzNdQQp00Emwsj2Dhx
	XebTfMka6XTFBPxgrrfh7l5tVbxYKNRz2MQ+4Msree68f9tGRSMSJseFcWUgbbGH
	OzW/pmSB5Q4O4hvoMMhhbZzbTmOxrkBKhL+oGmP4Zl/1dxU9DVAb324l1h8OpxV4
	LsU3dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdguqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:40:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so293229385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028050; x=1751632850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHlNGw65/NyPXrUrl04t6D1qYWyjgSpHMuXvzrQ6OaI=;
        b=MzO6ZG76NOu9MOVDhdo0mZodewP/Wa/hcT53sx4ZRseEAKafHWf0bQ2EtAMVmtCCvP
         //e+RvdSKZv3D/6NL82YIogTmyQs+Fw0nWcWu4pMUQo+n7QlYkxGF6DLWZJ5LtXm+Gz5
         /nipl62d6o7NcZx1OB/AmGruYvXN75lU2TLWhBxoDext+4CoKWM3RSmkpfUyTV2tCYNh
         uB3Aam2+IFUXW23xYdZpjxhQRl/o3O039wVydpkNonWxf/Ty0tHBwyPUI9cF5lL43+jl
         2FRF2YV/hrCefJk7a4n236GZCgNhqykKg67pH03PDUhi1DM66D0w/HJQfmjsNE/fQuj5
         w2xw==
X-Forwarded-Encrypted: i=1; AJvYcCVoRrO0aCEZk25NnBHqXmgVQrbcp/ioVJyiM4nlzNHVkAWUY8huQRtwtlDypLnTlJjukgWhq3P6ZWDw/vSu@vger.kernel.org
X-Gm-Message-State: AOJu0YxdbZ2Bf7emGTJM4bikTk8mZkEfN2ndBZaHqujS5gvw9lfkoiN1
	+Q/F+bVQ/7YAuDoxyQcY8N/QBy6kxdCvorg1Fr3bYprwlCtUna45NNs0eHqhHJKmPVxhBvwN3dR
	t0IzOWsSDSPsbF1yk2LboZXDMkPxOp9rbYULHz1cckb/+a3DQvJoZVH34TLqKNNd/rVFb
X-Gm-Gg: ASbGncukzifEQhjhN8jh5YEg9pdae1aZh6NqTX/bb6uHzN7WUq8GE8G2uSqRbkUzhnZ
	qoaDnWvceXy4rJVu0f8NDtIrUQyqkAtT44oL0uSRU9/4nqLjV9cBv2vFfUSt4EZDEGsZJFdBl+F
	uV22b/jSXjt+m3Cv4vxeSQj6+e/hSn3kMlyUSEfGs2DEiatmEEgLjAGIxJb2JsH8V0HA5qPNMIP
	QUNZPqDqSNj1SBlfI6nJ+LV3repxCgyeVlLXuCTA05DWYDepe5rjIAGf4TPLwCuQSorLfARh5Za
	COcamAvP4YuOx92jl6idv6y+/4JtTNfr2QrI87rW38MHf25ItKS1BybCz10KPSg5Xp4lxE4C
X-Received: by 2002:a05:620a:4492:b0:7c9:3085:f848 with SMTP id af79cd13be357-7d443944496mr405477085a.13.1751028050354;
        Fri, 27 Jun 2025 05:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGYrhNi8hnOY1cH9dyXDnGqvZDsqwNKN/AW+njjW6jkmrRMGgW9N8CNDZRf1v02A+GskMFFg==
X-Received: by 2002:a05:620a:4492:b0:7c9:3085:f848 with SMTP id af79cd13be357-7d443944496mr405472085a.13.1751028049780;
        Fri, 27 Jun 2025 05:40:49 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b255a51sm441777e87.88.2025.06.27.05.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:40:48 -0700 (PDT)
Message-ID: <521402f9-06c7-4d49-b78a-080b06378fd8@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:40:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/38] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts and drop panel drm_edid
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
 <g6wqvbszbrw6gnvxz7cjmhx4rc53kyulcr5wjekfjaisontikl@723odzngtlnd>
 <326bbd02-f414-48e3-a396-4b94f19054f7@quicinc.com>
 <buvgxzf5u5wkj2nxd6rquvcktjmxoclwrkkmxeih6pnikubqe3@yoytvnayvxtv>
 <014d535e-ca9c-4707-9ff4-7afdd489b780@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <014d535e-ca9c-4707-9ff4-7afdd489b780@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e9153 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=II6myPHIT8NnAhXeErMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNSBTYWx0ZWRfX00X3i0T2D4p6
 FwoOLC2Ejgu51FtiBWPZkHCpbDkSiervKUr+neDRNgfqKT6DAYRAclePl0R6vVVi32MdlxF1ubt
 x59o+w2dSCNJwPd1Udbr2Go8EuSKQgyZp0gVkiXytvY8R2PCDtmA35Jo/09P0Vle06p1jTf1fsK
 dbqrL3RYZos+4S34MErl9FB/bugW6fa10Ab0KSBlvk+RdfAPViRwXUUz9eP8F9N6cTPZwtUhaUV
 AWmQ/qd/OvadPGK65LU2oyeXxBfhdo2tm5OcjYja+Io+LxBcB1GYBDUIIwH9HPU79tttflNCctK
 0xr0z2JtfesPm7viB7It28ADe1jOPKck09iA/fKrHL5NdnvsjdBZQTp1F0/1nihdERU+8hEH0Sx
 87TxkH9AN1Hso8h3ESVHzu8QdxrXQSnykkeJxV6aSC31TADF/vG9M0SegA78/A87pIKXs+UF
X-Proofpoint-GUID: 8lYnCOZ_PgRCXA3UQvquw_cgGmaSYAVO
X-Proofpoint-ORIG-GUID: 8lYnCOZ_PgRCXA3UQvquw_cgGmaSYAVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270105

On 27/06/2025 10:49, Yongxing Mou wrote:
> 
> 
> On 2025/6/25 21:32, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:43:55PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/6/9 20:41, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 09, 2025 at 08:21:20PM +0800, Yongxing Mou wrote:
>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>
>>>>> In preparation of DP MST where link caps are read for the
>>>>> immediate downstream device and the edid is read through
>>>>
>>>> EDID, not edid. Please review all your patches for up/down case.
>>>>
>>> Got it. Thanks~
>>>>> sideband messaging, split the msm_dp_panel_read_sink_caps() into
>>>>> two parts which read the link parameters and the edid parts
>>>>> respectively. Also drop the panel drm_edid cached as we actually
>>>>> don't need it.
>>>>
>>>> Also => separate change.
>>>>
>>> Got it.
>>>>>
>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++----
>>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 55 +++++++++++++++++++ 
>>>>> +-----------------
>>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  6 ++--
>>>>>    3 files changed, 40 insertions(+), 34 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/ 
>>>>> msm/dp/dp_display.c
>>>>> index 
>>>>> 6f05a939ce9e648e9601597155999b6f85adfcff..4a9b65647cdef1ed6c3bb851f93df0db8be977af 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> @@ -389,7 +389,11 @@ static int 
>>>>> msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>>>>        dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>>>>> -    rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>>>>> +    rc = msm_dp_panel_read_link_caps(dp->panel);
>>>>> +    if (rc)
>>>>> +        goto end;
>>>>> +
>>>>> +    rc = msm_dp_panel_read_edid(dp->panel, connector);
>>>>>        if (rc)
>>>>>            goto end;
>>>>> @@ -720,7 +724,6 @@ static int msm_dp_irq_hpd_handle(struct 
>>>>> msm_dp_display_private *dp, u32 data)
>>>>>    static void msm_dp_display_deinit_sub_modules(struct 
>>>>> msm_dp_display_private *dp)
>>>>>    {
>>>>>        msm_dp_audio_put(dp->audio);
>>>>> -    msm_dp_panel_put(dp->panel);
>>>>>        msm_dp_aux_put(dp->aux);
>>>>>    }
>>>>> @@ -783,7 +786,7 @@ static int msm_dp_init_sub_modules(struct 
>>>>> msm_dp_display_private *dp)
>>>>>            rc = PTR_ERR(dp->ctrl);
>>>>>            DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>>>>>            dp->ctrl = NULL;
>>>>> -        goto error_ctrl;
>>>>> +        goto error_link;
>>>>>        }
>>>>>        dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp- 
>>>>> >catalog);
>>>>> @@ -791,13 +794,11 @@ static int msm_dp_init_sub_modules(struct 
>>>>> msm_dp_display_private *dp)
>>>>>            rc = PTR_ERR(dp->audio);
>>>>>            pr_err("failed to initialize audio, rc = %d\n", rc);
>>>>>            dp->audio = NULL;
>>>>> -        goto error_ctrl;
>>>>> +        goto error_link;
>>>>>        }
>>>>>        return rc;
>>>>> -error_ctrl:
>>>>> -    msm_dp_panel_put(dp->panel);
>>>>>    error_link:
>>>>>        msm_dp_aux_put(dp->aux);
>>>>>    error:
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/ 
>>>>> msm/dp/dp_panel.c
>>>>> index 
>>>>> 4e8ab75c771b1e3a2d62f75e9993e1062118482b..d9041e235104a74b3cc50ff2e307eae0c4301ef3 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>> @@ -118,14 +118,13 @@ static u32 
>>>>> msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>>>>>        return min_supported_bpp;
>>>>>    }
>>>>> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>>>> -    struct drm_connector *connector)
>>>>> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel)
>>>>>    {
>>>>>        int rc, bw_code;
>>>>>        int count;
>>>>>        struct msm_dp_panel_private *panel;
>>>>> -    if (!msm_dp_panel || !connector) {
>>>>> +    if (!msm_dp_panel) {
>>>>>            DRM_ERROR("invalid input\n");
>>>>>            return -EINVAL;
>>>>>        }
>>>>> @@ -160,26 +159,29 @@ int msm_dp_panel_read_sink_caps(struct 
>>>>> msm_dp_panel *msm_dp_panel,
>>>>>        rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel- 
>>>>> >dpcd,
>>>>>                         msm_dp_panel->downstream_ports);
>>>>> -    if (rc)
>>>>> -        return rc;
>>>>> +    return rc;
>>>>> +}
>>>>> -    drm_edid_free(msm_dp_panel->drm_edid);
>>>>> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, 
>>>>> struct drm_connector *connector)
>>>>> +{
>>>>> +    struct msm_dp_panel_private *panel;
>>>>> +    const struct drm_edid *drm_edid;
>>>>> +
>>>>> +    panel = container_of(msm_dp_panel, struct 
>>>>> msm_dp_panel_private, msm_dp_panel);
>>>>> -    msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel- 
>>>>> >aux->ddc);
>>>>> +    drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>>>> -    drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
>>>>> +    drm_edid_connector_update(connector, drm_edid);
>>>>> -    if (!msm_dp_panel->drm_edid) {
>>>>> +    if (!drm_edid) {
>>>>>            DRM_ERROR("panel edid read failed\n");
>>>>>            /* check edid read fail is due to unplug */
>>>>>            if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
>>>>> -            rc = -ETIMEDOUT;
>>>>> -            goto end;
>>>>> +            return -ETIMEDOUT;
>>>>>            }
>>>>>        }
>>>>> -end:
>>>>> -    return rc;
>>>>> +    return 0;
>>>>>    }
>>>>>    u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>>>>> @@ -208,15 +210,20 @@ u32 msm_dp_panel_get_mode_bpp(struct 
>>>>> msm_dp_panel *msm_dp_panel,
>>>>>    int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>>>>>        struct drm_connector *connector)
>>>>>    {
>>>>> +    struct msm_dp_panel_private *panel;
>>>>> +    const struct drm_edid *drm_edid;
>>>>> +
>>>>>        if (!msm_dp_panel) {
>>>>>            DRM_ERROR("invalid input\n");
>>>>>            return -EINVAL;
>>>>>        }
>>>>> -    if (msm_dp_panel->drm_edid)
>>>>> -        return drm_edid_connector_add_modes(connector);
>>>>> +    panel = container_of(msm_dp_panel, struct 
>>>>> msm_dp_panel_private, msm_dp_panel);
>>>>> +
>>>>> +    drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>>>> +    drm_edid_connector_update(connector, drm_edid);
>>>>
>>>> If EDID has been read and processed after HPD high event, why do we 
>>>> need
>>>> to re-read it again? Are we expecting that EDID will change?
>>>>
>>> Here we indeed don't need to read the EDID again, so we can directly 
>>> call
>>> drm_edid_connector_add_modes. Thanks.
>>>>> -    return 0;
>>>>> +    return drm_edid_connector_add_modes(connector);
>>>>>    }
>>>>>    static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>>>>> @@ -229,6 +236,7 @@ static u8 msm_dp_panel_get_edid_checksum(const 
>>>>> struct edid *edid)
>>>>>    void msm_dp_panel_handle_sink_request(struct msm_dp_panel 
>>>>> *msm_dp_panel)
>>>>>    {
>>>>>        struct msm_dp_panel_private *panel;
>>>>> +    const struct drm_edid *drm_edid;
>>>>>        if (!msm_dp_panel) {
>>>>>            DRM_ERROR("invalid input\n");
>>>>> @@ -238,8 +246,13 @@ void msm_dp_panel_handle_sink_request(struct 
>>>>> msm_dp_panel *msm_dp_panel)
>>>>>        panel = container_of(msm_dp_panel, struct 
>>>>> msm_dp_panel_private, msm_dp_panel);
>>>>>        if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>>>>> +        drm_edid = drm_edid_read_ddc(msm_dp_panel->connector, 
>>>>> &panel->aux->ddc);
>>>>
>>>> And again....
>>>>
>>> Here we need the struct edid,since we drop the cached drm_edid, so we 
>>> need
>>> to read it again. Or we can return the drm_edid from 
>>> msm_dp_panel_read_edid
>>> and pass it to msm_dp_panel_handle_sink_request, then we don't need 
>>> to read
>>> drm_edid here. Emm, I'm still a bit curious why we can't cache the 
>>> drm_edid?
>>> It would help us to access it when needed. Emm, i see other drivers also
>>> cache it.
>>
>> Yes, they can cache EDID. However, in this case we don't even need it at
>> all. This piece needs to be rewritten to use
>> drm_dp_send_real_edid_checksum(), connector->real_edid_checksum.
>>
>> Corresponding changes can be submitted separately.
>>
> Got it, thanks, will separate this patch from MST patches..  Even if we 
> use drm_dp_send_real_edid_checksum to send connector- 
>  >real_edid_checksum, that’s only when the EDID state is incorrect.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c?h=v6.16-rc3#n1020
>   When the EDID is read correctly, it should send edid->checksum instead.

I wonder if we should fix the drm_edid to always set real_edid_checksum 
instead.

>>
> 


-- 
With best wishes
Dmitry

