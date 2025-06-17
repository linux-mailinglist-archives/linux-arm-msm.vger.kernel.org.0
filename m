Return-Path: <linux-arm-msm+bounces-61576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DAADC772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C973B85C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D631C28C2A3;
	Tue, 17 Jun 2025 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFZ9z+LD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00022BF012
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154652; cv=none; b=bQArLf6JxnGXXIDxGe6ObxBRoIl2AxqWD2ylCngkgUtobib15RcwZvQTE4upZVUlXsmlYSmrfi1V7hql8mzsghziN3/yyrL0fFu56VoVICTJ3H3s77XhXdh/9NgM33fimAUIgePFUxLUbKyCd0iaT4OqvvaJELkjaKqqLLeqWDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154652; c=relaxed/simple;
	bh=8T6XGntRet/Z6G/uVi8ecQ2qd6xlMey+nPT6aDLp9EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmWnuNsmI1tpN5ecnLZoJ0bG24l4CjfoojzC+h6r/3fY+OclB8KS8ZqbDI++V1eicaV1uPr/4rYr47fMeaursS79KV5A8aCHZUH3LkTOiXaoEvIIZEsDhWeseXBeCApPfrSVnErXaeIAWQk9u7+ATdoNOnsV5kkMh3+cvy3QKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFZ9z+LD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H9OWRN002291
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 10:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qQ6chZxwb0kaN95EAupZIbA55eTV4KovirnoXg/Nr0=; b=XFZ9z+LD0aFsm4Xp
	obIib7tpEfq3obX3cs0RL2FUzgbH9XugZVk8H1XLHdRXvdQlXTlv75B7Zvd5L7NS
	r5qTmdbsm1nK49PNS6ozQfHaLvEOgsAPnEbtfBPYZpbo6LPUMxCZxv9zMeRwI3OQ
	3XAiJJCdgz28UnaCA/GldP5dh5PcMbi8hcJQVX2Hh4frDguuYx9H+hClVyaFTult
	yoNAE+KcB2WWsJkuulW9kJ0ZdBoY8A8kMWENtFhmLFU04oJpYIe/AjYM8HV08IpE
	fo8jSEobGQDnLG8iBtxh56XsizNz3iKer3w7e4AwRgu7g0sWdd6scS+YU4xgWDZQ
	jnAk6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwbauy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 10:04:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so942535885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 03:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750154648; x=1750759448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qQ6chZxwb0kaN95EAupZIbA55eTV4KovirnoXg/Nr0=;
        b=jUv3RONgIkqsvccxIzO9JIrpwWP1zcAfWawsYdJrWTgmBmZi4rBDxwJ0YNSKgWqf/C
         upC2V0Y+FQfWeGNF3cmrvYrPOLFTV667zNpG7B3fTT5SiVeh+8BWAcFt8taxVqgrr4Et
         c3AgIzIaVn/jdwlZ/J4l8cUt7iJBr/bmFNurUmvzHULobSw4KzIRphcQQwJ0OITZ3M3H
         ca6rDWWqZ1LSydcEaYLPreB5iTMJ2Kaf3eQCFfp0xSq3AzlmEFpDVYsAA0qSWRU7gR/c
         R+i/9S9Fh/hkUWzN9RQKOF+ERCEl5AMXLEwFkjne/TBGnkR7W1dMxSicR1Fis0H51QFP
         pwww==
X-Forwarded-Encrypted: i=1; AJvYcCWeinMpWYJeCYCBXBbg+aGEHJEICoeCq2psW3Ld+KXSjwyalAmZx3lKdas/TJY6QDoXRF5Vd2SVmyVgH5gS@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNZaKBp0EP6o3dXTfK4AUaJwD7hM5FkMLNyQDy8g3mOD5Psy5
	Ikk/ibjMnnjZr+fgGBrIxlyF0eglv4Jdflk3v8PWe348L+JyWBVHt3V0jDqHiA/NsijATCd8fV9
	Yp7arDJccX2uV972jdLJLvQoVR3ceVcKPHzM+69ETK9GLdVTk86d0BA1iCA0UXxr6FUGE
X-Gm-Gg: ASbGnctEBU+rZJL4XRKtoBzmOSbsH74kQz2LILA6BhorsMn73bmx2HFoDMKfm97AhPR
	KJBAnjwTapySCT/TrTCgT8rLCLghzCOne5P0htGu+xAHNaSTs1FPNVEx9m5RnkyTCg2rhRYujJj
	TYWaNg7ejVs8nT1mYt5EUp7x8TjQSkECvA/qil3mejIEXXMvDnUxKQNdpW+JpCvplzli7TlVMsn
	lWwN1jUG14g2cM1NkoKqzxnM2GN+YcX3XOJdkgUdftMTP+iY+naGkXfHN+kC05K+4JXrhKI4Jsq
	/vZLk0WGAUlY0Bl0KzH1Nl9WXyMU/yYCVtX484xEmK5sNVHQUGsXxRGjuJqAgRoTx25mBa5Huil
	ETCc3jYxC04IMR6jG9IzSKaaCvlOLxj4/lAyaGSq7EnXD2txpyNlgIUWK8rWxijRscolGsGz8lA
	Q=
X-Received: by 2002:a05:620a:84c5:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d3e03b10c8mr316439385a.4.1750154648453;
        Tue, 17 Jun 2025 03:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvna9IJ6ePvmIjs2uDIO38vWP2NflNsfddbUTeI2csRoT/3ReiocEENEsqlHc9sjbmCU22Tg==
X-Received: by 2002:a05:620a:84c5:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d3e03b10c8mr316434085a.4.1750154647952;
        Tue, 17 Jun 2025 03:04:07 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:3ae3:d1c0:258a:276f:153c? (2001-14bb-c7-3ae3-d1c0-258a-276f-153c.rev.dnainternet.fi. [2001:14bb:c7:3ae3:d1c0:258a:276f:153c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3307ae42sm18230001fa.43.2025.06.17.03.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 03:04:07 -0700 (PDT)
Message-ID: <4d8c89be-2589-40f9-841e-27cb7b1040de@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 13:04:05 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
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
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
 <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
 <7r7vdbeols4suew7rlvogft4b5lmg22osipydxzkubxsychewi@lpyj6vmoapzb>
 <19895a7d-4f30-44f1-bc5f-45d200666860@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <19895a7d-4f30-44f1-bc5f-45d200666860@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9SM9z3Z4HB9XAvR3kuIEog-gM0EvQBya
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=68513d9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=WoTifGf_cgNeg6NlKB0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9SM9z3Z4HB9XAvR3kuIEog-gM0EvQBya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MSBTYWx0ZWRfX8PY+dqBZZJa2
 e8U28Xj6YltDO/AQl4nqnB0mrPVHUt/p3/QL3T5ljmg220/0B9OrPBK5baYieuRRmIi4afhhTar
 DZasnkyS7xKAAwSanfKQQqEAf4gSlScJaN8bTOOeARkXD1MrvVndAdHWnKAY2YNae8hkRLWy7BN
 BbR65TN1Nx4OxutBXAQtv+uCD1SO4g4Uem9f1P0Kv1CRRQfs0t6AOFWfyJcuh7gHOemOZlpK8CB
 DXR41z2Vb+0IUPrnWcroDYWwSnTE92K6IZwZicHENMDDHECmzW0lDwM9g2Ixr93gFIsDQyFUNmz
 VhnxsoMx1mZ4sBfNGnV0S+A+gnDBGwVaJj0yx+PjHNVDt5M56C4Z37IgPrZ85GY8yPUcTygK+Hc
 0IKxEmd1CAHUTx2oIbcxAtE7qj+2C3v0ZetGKq2mX7ypDu8kZDX+9J8lcjKG0fG840WqZGoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170081

On 17/06/2025 10:52, Yongxing Mou wrote:
> 
> 
> On 2025/6/16 21:48, Dmitry Baryshkov wrote:
>> On Mon, Jun 16, 2025 at 08:43:40PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/6/9 23:51, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>
>>>>> Add connector abstraction for the DP MST. Each MST encoder
>>>>> is connected through a DRM bridge to a MST connector and each
>>>>> MST connector has a DP panel abstraction attached to it.
>>>>>
>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++ 
>>>>> ++++++++++++++
>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>>>>>    2 files changed, 518 insertions(+)
>>>>
>>>>> +
>>>>> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct 
>>>>> drm_connector *connector,
>>>>> +                                const struct drm_display_mode *mode)
>>>>> +{
>>>>> +    struct msm_dp_mst_connector *mst_conn;
>>>>> +    struct msm_dp *dp_display;
>>>>> +    struct drm_dp_mst_port *mst_port;
>>>>> +    struct msm_dp_panel *dp_panel;
>>>>> +    struct msm_dp_mst *mst;
>>>>> +    u16 full_pbn, required_pbn;
>>>>> +    int available_slots, required_slots;
>>>>> +    struct msm_dp_mst_bridge_state *dp_bridge_state;
>>>>> +    int i, slots_in_use = 0, active_enc_cnt = 0;
>>>>> +    const u32 tot_slots = 63;
>>>>> +
>>>>> +    if (drm_connector_is_unregistered(connector))
>>>>> +        return 0;
>>>>> +
>>>>> +    mst_conn = to_msm_dp_mst_connector(connector);
>>>>> +    dp_display = mst_conn->msm_dp;
>>>>> +    mst = dp_display->msm_dp_mst;
>>>>> +    mst_port = mst_conn->mst_port;
>>>>> +    dp_panel = mst_conn->dp_panel;
>>>>> +
>>>>> +    if (!dp_panel || !mst_port)
>>>>> +        return MODE_ERROR;
>>>>> +
>>>>> +    for (i = 0; i < mst->max_streams; i++) {
>>>>> +        dp_bridge_state = to_msm_dp_mst_bridge_state(&mst- 
>>>>> >mst_bridge[i]);
>>>>> +        if (dp_bridge_state->connector &&
>>>>> +            dp_bridge_state->connector != connector) {
>>>>> +            active_enc_cnt++;
>>>>> +            slots_in_use += dp_bridge_state->num_slots;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (active_enc_cnt < DP_STREAM_MAX) {
>>>>> +        full_pbn = mst_port->full_pbn;
>>>>> +        available_slots = tot_slots - slots_in_use;
>>>>> +    } else {
>>>>> +        DRM_ERROR("all mst streams are active\n");
>>>>> +        return MODE_BAD;
>>>>> +    }
>>>>> +
>>>>> +    required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector- 
>>>>> >display_info.bpc * 3) << 4);
>>>>> +
>>>>> +    required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, 
>>>>> required_pbn);
>>>>> +
>>>>> +    if (required_pbn > full_pbn || required_slots > 
>>>>> available_slots) {
>>>>> +        drm_dbg_dp(dp_display->drm_dev,
>>>>> +               "mode:%s not supported. pbn %d vs %d slots %d vs 
>>>>> %d\n",
>>>>> +               mode->name, required_pbn, full_pbn,
>>>>> +               required_slots, available_slots);
>>>>> +        return MODE_BAD;
>>>>> +    }
>>>>
>>>> I almost missed this. Could you please point me, do other drivers
>>>> perform mode_valid() check based on the current slots available or not?
>>>> Could you please point me to the relevant code in other drivers? 
>>>> Because
>>>> it doesn't look correct to me. The mode on the screen remains valid no
>>>> matter if I plug or unplug other devices. The atomic_check() should 
>>>> fail
>>>> if we don't have enough resources (which includes slots).
>>>>
>>> Currently, I haven't found other drivers checking available slots during
>>> mode_valid(). Intel will check the PBN in here.
>>
>> pointer? Also, what do AMD and nouveau do?
>>
> Hi,here is the link:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/i915/display/intel_dp_mst.c?h=v6.16-rc2#n1504
> 
> nouveau just check the mode_rate and ds_max_dotclock in MST connector 
> mode_valid().
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/nouveau/nouveau_dp.c?h=v6.16-rc2#n527
> 
> The AMD driver seems much more complex, and I can't understand all the 
> logic. It looks like AMD always tries to enable DSC and use the smallest 
> possible bandwidth.
>>> This condition can help us
>>> in the following case:
>>>
>>> Assume two downstream devices both support 4K 60Hz 10-bit. In MST 
>>> mode, when
>>> the first device occupies the 4Kx60Hzx10bit mode, the remaining 
>>> bandwidth is
>>> insufficient to support the same mode for the second device.
>>>
>>> If we check the slots in mode_valid(), the second device will reject the
>>> 4Kx60Hzx10bit mode but accept 4Kx30Hzx10bit. However, if the check is 
>>> done
>>> in atomic_check(), the second device will display a black screen 
>>> (because
>>> 4Kx60Hzx10bit is considered valid in mode_valid() but failed in
>>> atomic_check()).
>>
>> If we filter modes in mode_valid(), then consider the following
>> scenario: we plug monitor A, plug monitor B, then unplug monitor A. At
>> this point we only have monitor B, but it has all modes filtered when A
>> has been plugged. So, it is impossible to select 4k@60x10, even though
>> it is a perfectly valid mode now.
>>
>> Also, with the check happening in the atomic_check() the user will not
>> get the black screen: the commit will get rejected, letting userspace to
>> lower the mode for the second monitor.
>>
> Oh, this scenario is indeed just as you described. So let's remove this 
> part of the logic and let userspace decide the final mode.

Ack. I think all three major drivers don't perform a check against 
currently allocated slots.

>>>>> +
>>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display- 
>>>>> >connector->display_info, mode);
>>>>> +}
>>>>> +
>>>>
>>>
>>
> 


-- 
With best wishes
Dmitry

