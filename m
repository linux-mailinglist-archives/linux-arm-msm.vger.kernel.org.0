Return-Path: <linux-arm-msm+bounces-101250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIRCFsLLzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:39:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4737617C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B50F0308E067
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD032080C1;
	Wed,  1 Apr 2026 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPcE9R+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhpPEXa8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B337E2FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028579; cv=none; b=Vh5qZL30O3tor19abkdfSriVh9KC1mq4NFp6xohFaMQUy+otWcmGC6wI5a4UiStg4dIWKKmOzzd9ew5L75YdIi8LOAxtgMKn4gf/vAc8hP0xC0pcCTnr5TpJUw6bT/mBPqn0XCkoikEZT2DnR3fFnHeGhiFpfgrfK/PSOSMDN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028579; c=relaxed/simple;
	bh=pdceCx61hLe2j/1j2lmTPYtHb6MpZMwBUw+RRosp1pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Izi62t4cwSZSsK8tcxyoul3is9bUXQr51OFhP8qYY0g4M9fRsfleHTw8EoWe2DPAMfKjhyBzaRrEBw91+iV32PQE2+nU6pgoA7TICHYj+3qOWK1AQQ0ydUgZVUBs7haIh0dNVJvDoTK+ANvVGx8I1LtqZR7T2TNCKyn/UOoonSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPcE9R+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhpPEXa8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6315kgmH639248
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 07:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbS9+v2BBjG7zRi/OvSLkU/Ie2NFTC6i8v/tksgC6LY=; b=NPcE9R+sxT492Isa
	i5OQBCTbMTtO9lcB1zpvrVxBSX0P+f8FmzR0VjMiYhZTpwmS2pkjsq9Ue9systaC
	q6v2BAWitGZDIYjEbvx+hHVBK5jNCNm4z7A3PkN56LUmGbiODLSDXNdc49rzMf2n
	XJnaai8imJcrkEQg6Qst0M5I92ot7pLI+PoC4+cL2hY3kIN3cT0Iwuq5AEK2HEnt
	qZ+j68auShAi7HHvBihu8ZZzzAmviRU4tduhKUKilO3sj1wvXBq4hfS5B4o1PK/n
	oxOs1lIeetNdTo97b2qZTsETtWB6FKsEMEYL9WDMfWyR9+O0Uv3rIdve2BWdUPXK
	sKfgDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2auxrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 07:29:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so166996361cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028576; x=1775633376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbS9+v2BBjG7zRi/OvSLkU/Ie2NFTC6i8v/tksgC6LY=;
        b=AhpPEXa80Ig3VQ0KN8kHWKsoLdzB0yvy9zqI9wGIXPkgJFt7zU4Lb9dYUJtSkQSqLb
         LbCyHubsxqErt49/RuzMNjQ8GqNQ2SoVFw7xF3Av5/2PyXxqkvBVjEIc3HoIlZ5hWCqk
         BQF+SpFo5Bu4spKWapgTBaXzT4oseqTvV+2diL9b+fMP8iWgps0tMYYjMsXynf+ItrIX
         HSYqGU3vcLGFcLKi3jUJvho90Qac0AlbsJ7dMyGLIp0eS4Wb66PeWdPqfDx4UkQ12kNb
         0a09u7tV5Kde/dAxW3Yi1y+/DUChpQ/SWCA1IOjOwb92+7g23YlOoRiq1k0yixlyLdRa
         mVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028576; x=1775633376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbS9+v2BBjG7zRi/OvSLkU/Ie2NFTC6i8v/tksgC6LY=;
        b=RG4tZD6IIfJkJ1RX7tkcvG9RXrncSWtZNvTs/I0A/0EzO40exGJNCxthIdrLVHcBvM
         xLDg8I9xPf1xQVIsP9tOuc0JY14rlsqm5ftC442fIbev9ZDn1mcbi5wJgTUqojh3WAbJ
         tCSlpGQFWjED++gImsmRHT6jS/EPZjdOjwIdSnHfGCMA0sVQwAP8IkeofbibE4acfKcg
         6nAjvtUGOzOw0lEor0xVv0bRxUTSr9tILE0qDFZymKePD/wISFry8lVRPgGRYTOC0Lf5
         HQ1DcUU/WhGi56BdB4LgAQznszlHOwMGP0yzEmUaDxJ9A0syPPb3Zxz4RKsDUBe6yDu4
         pUBA==
X-Forwarded-Encrypted: i=1; AJvYcCUnzc1bRk0OBZq8rqrhoNdKidK0UbDvzaNzFZcoP2KVdFrHBv5JfNQtWHbT8yrMg4dJWmgslv/d/BH/ETKA@vger.kernel.org
X-Gm-Message-State: AOJu0YzBluiMEcd+PSLRv3q9KgTXY/hRAJCkXhDKvrEQmPR41riv4KNV
	eKKu+R4y+zDqBrGk7zfdvpfmnyIrWPAzHrGI8k6gswABgfZGTbTGunZPOAFrnfDiPgGQcxM/4wu
	mi1hZ6UqqNiP8Xe/bbZeGyZQmcjHpXwidb4MC4/DOKTPDgsL4oWblwA71Vop/+33mrBdO
X-Gm-Gg: ATEYQzzDrp4hw5hblSSvAVQdS8HHNzMFYI4/Oxjs6T2ouja/HwgyMwuyDZaWTbVFW8i
	GtQx0YDCs2SQN88qYOJ9IRO4EJakbqSVJcCK+oznAUeTgt6ip3x215eMgEC+wfqMrfflcbPKNZO
	sU6k5bSfvmOcMJCtV90mtW6jXIPHWGLcYwbnDt4xyb0oHul1D5+UPz5ayG7a5SCUh+yvaZI8+cD
	tLt8iCdykwP4Z0iti2txxTBFK4V78pF6Yxs1DBsRM2/PCsf1NY6vg9/ROv+KQ0YLyUXYAE4O5OM
	xA//eN3qRXMwn2GI8bYIUwoebdDshdsLVKXsecJj2sHALiKOKDMQcUFbuj32ABTa+xJVXtzD/yN
	HrgYlOW7e7U18+7dbAlWUvQt1CfoJGX7OHr0UgfrrWTZHTfEql9LLQYCN6G+r8V1u06FVGGgJIG
	ElttFi+c1xeWDGCONNENj1iYWE
X-Received: by 2002:a05:622a:259a:b0:509:379b:d4e with SMTP id d75a77b69052e-50d3bcd2630mr38914981cf.32.1775028576212;
        Wed, 01 Apr 2026 00:29:36 -0700 (PDT)
X-Received: by 2002:a05:622a:259a:b0:509:379b:d4e with SMTP id d75a77b69052e-50d3bcd2630mr38914671cf.32.1775028575723;
        Wed, 01 Apr 2026 00:29:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a073:af00::4c9? (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c3d32cd0sm388804e87.8.2026.04.01.00.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 00:29:34 -0700 (PDT)
Message-ID: <0009a801-8f58-487c-b5c6-5b264393ef25@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:29:33 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/38] drm/msm/dp: add dp_mst_drm to manage DP MST
 bridge operations
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-28-01faacfcdedd@oss.qualcomm.com>
 <h22zh2zcgdcv2k3mxc5rslpfd3xnerjfailehtaw3wbtpnisy3@s56vudwvoh4q>
 <cdb5b1e6-baaf-41e8-9133-6889b5e686f6@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <cdb5b1e6-baaf-41e8-9133-6889b5e686f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX6z2yQJkor3tx
 QeJAk/yN/BWu92lAUICMwrjncGnAamaIE1cO8E6VmENEHnjHSt3ijpw4qVAIkrKT6lel5eh/fba
 wOcE/PPdfULT7ZbZ0PAJi79RKMf4lpGx6z+rg/zd8GrHQ+JL05FHhVZoJglcFaqzxZbMYPPuB6d
 kxwZwGBNXVWZ2RaWuH/PttcHkVinRbcDf8f/CmUL1EjM4aSioGvhd+3f7F6lnX3oSPrTg8d7gR4
 iq3iP/IDKs++iSpnoxS5bXNlooI4W6g1qHS8c6II52An+AkjZnUtBtViGouSaS3KAIRWpnlGGgi
 cb3GAxNbu5NCsmV87BylAmutzdGMFKZh0cUrdvZDppo5C4YSTuO2ooUWNgYt8IHY9gGkbgwfOEI
 I5thtKKp/hmL7O6CGiAOHaEAEQIBnyqLSHBeAOfZ+pU3thTG4BXc+Gs1Cz6SEU6kIy97L7Srhvs
 CAZ2RB9B4WdE5YW63nw==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccc961 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=nlcTEVPeAIpjwhky54wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kOl1qJMSv4UxakxyD2o9N4PCLF7lem77
X-Proofpoint-ORIG-GUID: kOl1qJMSv4UxakxyD2o9N4PCLF7lem77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101250-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8F4737617C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 10:07, Yongxing Mou wrote:
> 
> 
> On 8/27/2025 1:36 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 25, 2025 at 10:16:14PM +0800, Yongxing Mou wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Add a new file dp_mst_drm to manage the DP MST bridge operations
>>> similar to the dp_drm file which manages the SST bridge operations.
>>> Each MST encoder creates one bridge and each bridge is bound to its
>>> own dp_panel abstraction to manage the operations of its pipeline.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile        |   3 +-
>>>   drivers/gpu/drm/msm/dp/dp_display.h |   3 +
>>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 556 +++++++++++++++++++++++++ 
>>> +++++++++++
>>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  86 ++++++
>>>   4 files changed, 647 insertions(+), 1 deletion(-)
>>>

>>> +
>>> +struct msm_dp_mst_bridge {
>>> +    struct drm_bridge base;
>>> +    struct drm_private_obj obj;
>>> +    u32 id;
>>> +
>>> +    bool in_use;
>>
>> What does it mean? In use currently for one of outputs?
>>
>>> +
>>> +    struct msm_dp *display;
>>> +    struct drm_encoder *encoder;
>>> +
>>> +    struct drm_connector *connector;
>>
>> Why do you have connector both as a part of the bridge and bridge state?
>>
>> Please describe design decisions in the commit mesage or as comments.
>>
> Emm. i go through the msm_dp_mst_bridge_state and msm_dp_mst_bridge.. 
> Can we just drop msm_dp_mst_bridge_state? just track connector and 
> anything else on bridge.

If something is being handled by atomic helpers or being computed by 
atomic_check() for later use, it should be a state. If not, it can be a 
part of the single bridge struct. The most obvious mistake is to set 
globals or object data in atomic_check().

>>> +    struct msm_dp_panel *msm_dp_panel;
>>> +};
>>> +
>>> +struct msm_dp_mst_bridge_state {
>>> +    struct drm_private_state base;
>>> +    struct drm_connector *connector;
>>> +    struct msm_dp_panel *msm_dp_panel;
>>> +
>>> +    int vcpi;
>>> +    int pbn;
>>> +    int num_slots;
>>> +    int start_slot;
>>
>> I'd definitely prefer to have payload pointer here, if that's also a
>> part of the state.
>>
>>> +};
>>> +
>>> +struct msm_dp_mst {
>>> +    struct drm_dp_mst_topology_mgr mst_mgr;
>>> +    struct msm_dp_mst_bridge *mst_bridge[DP_STREAM_MAX];
>>> +    struct msm_dp *msm_dp;
>>> +    u32 max_streams;
>>> +    struct mutex mst_lock;
>>> +};
>>> +
>>> +struct msm_dp_mst_connector {
>>> +    struct drm_connector connector;
>>> +    struct drm_dp_mst_port *mst_port;
>>> +    struct msm_dp *msm_dp;
>>> +    struct msm_dp_panel *dp_panel;
>>> +};
>>> +
>>> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder 
>>> *encoder);
>>> +
>>> +#endif /* _DP_MST_DRM_H_ */
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 


-- 
With best wishes
Dmitry

