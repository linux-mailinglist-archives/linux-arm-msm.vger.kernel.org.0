Return-Path: <linux-arm-msm+bounces-101288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGUiFgbrzGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:53:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE73780A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE335317BC39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539083DA5B3;
	Wed,  1 Apr 2026 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Itml+h1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPLA7Rw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BEA3DA5C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036645; cv=none; b=aWHgHnNMHiRlVcJHcyVILNsWwmILSrqshwcqNeQKfUMtdMCekoznu9OJ1T0nWPY6DUKY2/2kBT3kLj1AFgtpOjJFHhombttmiOu9wMucy78qDBxikuJ7lgZ94ydVWugQDsvhNTx1CpO5W6fHIDCu4PUPQEiWpac7kX7WeziX5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036645; c=relaxed/simple;
	bh=g4afngB4z12TD/eiekfxAzdecOzu3w5MB1Q8zLgPCLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcgCsZxWms5D993VK7CYsf50vLwP5aWZNqluUJZTDogwwRuvsefvCK5mk0UZ8vH1/rGvmnLzbaTLjxl0wBUH9bEob3C0+O3UqdFEOB9qoVup5HLDR17epPSn6/4q6maWhrQncdI2rSfjcNYkCMwUMlDynVAkZIXwhEFkiqFzSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Itml+h1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPLA7Rw7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318eHNG1459303
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5zEIap66Dc7OLWAsu4xghw/A+bEZV1aEWioMMAJ35c=; b=Itml+h1iZo/qp9DQ
	VIUN62PT66x3t2V79LOG0TzdAQZM9qTbcUimbLPA9Jz8t2XIvdxO1B7B6FrQ6cz2
	KeYOCCVk3+0gVxD7Gp8aYOPC0YB55Q9+wXWPjKftxtDeht7qjFhsAbVQ9u5wf2VC
	6tp1ykNSzDRBx6KNFWqvd6K2v9J3BG9aYSm5EHjEpM+TqHX7kbmOzfXSNoPgqLhg
	g1U0xR9NK/GKYKTGvBvAak+iBIG5HXu0J9Wf4RDJ08n9Tvs17itmWge58zU4fMXF
	zlfTrRe8UFhzxd72V6XTJBJYV61PIbaRSzP2uG9WrIJuNJ3Dd6mzVBYNfDwqIPQ5
	wZGNtQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1f0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:43:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so119310a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036635; x=1775641435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5zEIap66Dc7OLWAsu4xghw/A+bEZV1aEWioMMAJ35c=;
        b=TPLA7Rw7OXZJzpoBeQJgZ+65d+ifWYIcE5s/wQ997KF+HybhIXkkEhPESlNoMJNHqg
         oujX5DxuUK/ZQnGaee/Cl9dzAeLvURvxxrDA5LfKmPQ+oZbLAYsYw2FgFwtUrGHKXT8B
         hJsTtpYhwrhp7gElVu5lNq33b+bxSNL2X9r5qScViui5EV77oQhAv/1PtJj02nzoImcH
         60Z4RNQympPMi61Y/Wo3GnDrn9PzMDtPF7vgJSJVG878aF7nCxcHTpg2nZEEsj6QEuZ2
         a3ulebW1zkg8ZniXjImAgF4qAKEkcVjRoElpg+O4he1kugE6LydXdM6uf3V5jD0f5JfL
         /Zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036635; x=1775641435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5zEIap66Dc7OLWAsu4xghw/A+bEZV1aEWioMMAJ35c=;
        b=CaOnQZbjTcF91Y8yGOKHw3+BhyPo9HKLoxQaNWkJnlVfvZKVePWVJeQeWLpIHhkvYw
         hKf0oaGhxMJZ0QCsKL7yZUNSrawiicnpkesdDjnWxX4g/nWhnUHb5LYeKDIzRMSRCwWD
         tbwCC5Wp1TzvPRgP9FyWsPSnoxZQNm2RtrQ9psJzruvMj4wgUyn3gdeDr3eGD7Kz+Sir
         d3ZVHvxA8JFc8IddAKDZwkutF0S3H/BcVpnFoS7mtsGmwY+yq9yIuvgrX3FayONWEjjX
         bGoJ/z2p2rgzdgORTTpVTQGflB/iLOdmocT4ZCSIXUEuGgd9A/DRmL9dRrclk9VfES//
         uAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFABnjycn3zqJwEhBPHGn5EA/vV3zIx9k9i5XH43KldoJBetVhK8c+SoIQklU9XlNuRBSodMyLZnNEq66h@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdrspQd5jtKqszqR98bl1xv0/bm6XDS7ztzyVkUwuktgxJKBi
	Ju3eHvtR9SeprvPhySsnoRIcyxxQU587CA5WRjkdi9MG2rP5ktTGlLIGC2D3ZaDO6D1NHmvgeXo
	mFJuuWD5vBQj3HtwnhM90pChao3mivU6kNfV08qenthjYaWyjW8lH7NGi6JW4+zFqdXIi
X-Gm-Gg: ATEYQzzbA9Ucll0iCF0Tn+YUdOjOKHU3kuwZz5fX7I0NVMHiElgiiUuoY0xYkkYH/Sc
	dGH/uc7zMQGdkF+KaTPb7kDIo9okcW3s6CtowoGHD4gMwv8lTh0Ogq7977P3Ulzj64bgTwTovyV
	IsuAACYdl/3dBXgYsQPPYog3Nh8ioHcF+ou7MJb7VbdGdVC21QIr6Qy/a+KOpnh/hsWRQaMSTYO
	/6haZzVV01+DrKOBJEnjZydW/Rj3bCF6893BxjhKEOftx9KLTIu4gp/7DiI41yqcs3kDF+eMjV+
	3KXbxwZW20s1eUd/Z3Qb9xeOW6/CtpFGdoJu1EQ1/jZp1G4HdFmQuvS0+CQmaoq+0s2RdHXWTO0
	0UxMg3rCqEhezTzOy2gdiVbbYPpE7VMoSH3WMeD+2f0f4tGtkm979VmxOyuH1kC2rJ1m/EneOjB
	9FoMtAtfJjf6HwITRHHQ==
X-Received: by 2002:a05:6a20:9329:b0:39b:84c9:3861 with SMTP id adf61e73a8af0-39ef6d8e95dmr2018581637.14.1775036635108;
        Wed, 01 Apr 2026 02:43:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:9329:b0:39b:84c9:3861 with SMTP id adf61e73a8af0-39ef6d8e95dmr2018549637.14.1775036634466;
        Wed, 01 Apr 2026 02:43:54 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baa53sm11599580a12.5.2026.04.01.02.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:43:54 -0700 (PDT)
Message-ID: <1698c35d-cefd-48b8-8776-c7deee000afc@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 17:43:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
 <smvfckejheyi7oehubdkhnh6pxokn7yugvlrynraypsu6kssj3@6vinswn4yku4>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <smvfckejheyi7oehubdkhnh6pxokn7yugvlrynraypsu6kssj3@6vinswn4yku4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfX/8+oDNaa18h8
 sxKFz2gwqGCHAFLQMkqOh/68X3no4eJENCoeOz0Xa62v8cmBpNyZ4MpCmPeiyXR0M+Xy+CivCza
 E/c8hKRHw3d7fN2QGoahe/GlXw/viE9yHLFywDnX5JDlAiXKzwCfDe+4Nw/TCoNeudH+S4xC6tb
 rp370Dr9dkolDtPvhXyVG+MAgQq+II+xo5gMNAQekXkgXYn+0oyeQMaMV35hnWOiXHeLVhX4IDL
 55VI56EvKc7nYSemLOY6x5tPmyGzwB3P07CXqjEuHxwxsqiMkDO0THFClPnQBrpnmHTOolUhw/o
 HKqhzNnJDJffL++97x2wceUeL4dm7xvQtjGloRaBsDxTzfnjLZmGnBVrXqRKYuC5DOPmVKmx5+N
 XYiwgag56Jy6U8pN43u57nYnNRFUI4jH8P5eb9O4uCKrdEQbvy/bE76UstqTumrk+PFTFHNXD7e
 qKAkCkiy/zJwg0wke/w==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cce8db cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hAwsQ9a-qRDmXk3_GycA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wT01CMAnXbYNCY_SpalTZBZKwwVRdCdQ
X-Proofpoint-ORIG-GUID: wT01CMAnXbYNCY_SpalTZBZKwwVRdCdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101288-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4CE73780A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 12:33 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:13PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add an API dp_display_get_panel() to initialize and return a DP
>> panel to be used by DP MST module. Since some of the fields of
>> DP panel are private, dp_display module needs to initialize these
>> parts and return the panel back.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>>   	return 0;
>>   }
>>   
>> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
>> +{
>> +	struct msm_dp_display_private *dp;
>> +	struct msm_dp_panel *dp_panel;
>> +
>> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>> +
>> +	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
>> +			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
>> +			       dp->pixel_base);
>> +
>> +	if (IS_ERR(dp->panel)) {
>> +		DRM_ERROR("failed to initialize panel\n");
>> +		return NULL;
>> +	}
>> +
>> +	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
>> +	memcpy(&dp_panel->link_info, &dp->panel->link_info,
>> +	       sizeof(dp->panel->link_info));
> 
> Both these lines show that link_info and dpcd belong to msm_dp_display
> rather than the panel. The panel should only be describing properties of
> the particular sink.
> 
I agree with your point.

This would require a larger cleanup of the panel abstraction, which
seems out of scope for this series. Could we address it in a separate 
refactoring series?

>> +
>> +	return dp_panel;
>> +}
>> +
>>   static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>>   {
>>   	msm_dp_audio_put(dp->audio);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
>>   
>>   int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
>>   
>> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
>> +
>>   #endif /* _DP_DISPLAY_H_ */
>>
>> -- 
>> 2.34.1
>>
> 


