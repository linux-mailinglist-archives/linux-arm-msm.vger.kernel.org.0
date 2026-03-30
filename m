Return-Path: <linux-arm-msm+bounces-100682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLyQGhksymmQ5wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD30356B6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF468300681B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A0C3A8730;
	Mon, 30 Mar 2026 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpMTcLAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlPZ7HTh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1BB3A901D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857234; cv=none; b=IolrlNNlgzHU2eAxl27WKNTrOVIwCElvScKdOJ22lHe4EYcMIgvJTo/nf0GhB/e8eA8Lhkv+QK1abPLIWuKRdpTt5Mm0ttI5KUv0k7e9ETwFJlJ3Uvcp3sqa4DpIOaPK0c2aemyw4PXHgz3jYojZEOYlHzmmBI768QccyTjb0XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857234; c=relaxed/simple;
	bh=KsJU2GOUL2rxhhF6b9KgYacAej+D0aKUQzgrFpI4v0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzRd8iEQa5ddBsydiYLwIiI7fqxss4HN4YfzD3nUyqJZPzkPSQzuW+1yyCnxaAAgZYEOySmdlsTIR4g+zYHa5eCrEKxpWgng7cBqXdU2ZtTv03wsRpJdYCQz1wXhr77C5gFXwpJTv51PzdH9The5wd7gYlclteoQC5RsMCvj8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpMTcLAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlPZ7HTh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4H9Ys1756012
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rpOSRoW2BeG5b+IvWAJcqnNsVMW6l5tpe0p8bVysWio=; b=XpMTcLAKjaXwY9Y+
	JnVklt40a6+Wl0+MVgX8XaR56OYUwtEshab0E9+Og37KB5i59zOZaxxStnLEzNX0
	BFHZdX1GcpG7F0xsXmxPvHsNItP9sbcR7euGJ2yRX2hYnH3qyq6aiG2yNuyScBfT
	mGk2UYucFnfBT3aOuOCmQsCdvaOn5zYA4JwGLC+lTuZv1PO1KTfDdBomEzauQkQ+
	4u9VYsWR6JPS4eiBnZYr4Zydk2///D6tPyoOFmb/O+zMv8JKQ4GUMF6fuwywJdmd
	PG1Zvp/q623QOCgVCgLZ04LTxXnn6otGbEDXvPZouBhMb8CuD3vP7cbzEibOM+2M
	KsjI1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmk55e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:53:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso12863735a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774857232; x=1775462032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpOSRoW2BeG5b+IvWAJcqnNsVMW6l5tpe0p8bVysWio=;
        b=GlPZ7HThptihERoYlOwxXQkdYYEb1MLM/1D+OwARQ+BlcElZdhaYA8cshR7gwzq/yo
         6Ac2hAUSwNu489BC9SIF0Mz7s7uvaGIax6f2EAvspUIRZCGecnR71OETD05goZmZmGL6
         H7jvtsCNQvDONEgbGpM8qSOAaV8YfYKc9cJxNOe8YmfF/ZwAiN36DryB4uHUw53A2MVC
         7YspZw90v8zUFvNCAPK8Nap0iei/xq57ArawYVm9jCP8n1IwU9U3z8dJL6PLhs/XpouL
         FFYDF2+KYHNMdqIDNQmbTkJMm58RXDTSqkzrbq+JnFfmOZXNEuDzYtnZM4O4AZgJTpAo
         9MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857232; x=1775462032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpOSRoW2BeG5b+IvWAJcqnNsVMW6l5tpe0p8bVysWio=;
        b=sNHNYWqgeHjzQC12jfJf1XGGL7lCIwSrUGAaPiG8gbHySiaG5VlxR3p7qoqIJmfN6V
         +jpynJFOgCg/MRyF15mRTJtObltPeAuzLNjwFLfaYsOYV9U4LnQkJNmxC521z4ifTn8P
         mMjcf50M/SUIGgaQXlzgS2FfBb8tQiaiW6lQ1T66PFbI+TcfrnX/UT1Xy20MMPQNzN4V
         XgOk43MZMyQ9A5x8U3yZ+BFiM02Ig+qa8BKAPjoEq+dOKrYPaEOyrdu6zFdNk5aje9BE
         sy+bFifhmTWtW4eCa0ZxuxufjWIjFLSu6KvDo1p1fc+x8AjMMenzI0Gi/LBzDn/uy/QA
         Cu2g==
X-Forwarded-Encrypted: i=1; AJvYcCXl34pcjHZrkNEntv7QwCi/4LpBbJZPnm4RlJpJNnPCF+Sv/925uF5B/B1Ph8Egaf7ze0ChwRwg23pNOnVO@vger.kernel.org
X-Gm-Message-State: AOJu0YxZcIzOxZwAjVEmwOrbJYDLTgBMpdxg86TqzYqYNzFoZXPnlXYu
	ME5qekFKcKHpAzbY4pei+7Gh5u0tMW4G4ojsdKOihZqUMOMFz3ak86U44JvgKpnIzGtfsmQfSu4
	PzG3uLk+m4TL1VxF4B+MfDovu6fLrAJ9YKGRvmg4XcGFqVfHvUtfm3ONs/lRvwJLvAk79
X-Gm-Gg: ATEYQzxmzMRpGA/9tAi7Kg/3sEF+Glx6tvF/Dq1sPGtJG7F/kavVAAA8eiiccUiHkTW
	KtBOtRbVyRqZ1ew6CHIMQia7wPNaN7kLdLnxde0vO5cfgezsKzRSlljuSZQKv+zSgECmJN6XZCp
	IS/OSmnO2SyCIiBn06xZNBJO64X77xmkVHZ/fkUHZHi4Tk/5hVnmTBjGDi2FmmOdQ3j7162Gmxi
	ni41rW6Z6jFR3JlDENPptw3xRCl7VqvwbWQ/mYrDXir1Yb8nbJehKpQLI91ZXEPyIe5Sk2jf7qt
	7IGUk1gmtE/tVuN7mo+UAmAHdYKR8foaCHRkB0/0/L0m/VDgF3clgQ2DyjwWT33DyLGWfzH70Pi
	NAOjo60VWWAH6WTX3o2nNzMUpyiUHawvVoP8e2DBoNsj7L360
X-Received: by 2002:a17:90b:380d:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35c2ff08081mr10329003a91.1.1774857231612;
        Mon, 30 Mar 2026 00:53:51 -0700 (PDT)
X-Received: by 2002:a17:90b:380d:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35c2ff08081mr10328989a91.1.1774857231193;
        Mon, 30 Mar 2026 00:53:51 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a54fd5sm15147371a91.2.2026.03.30.00.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:53:50 -0700 (PDT)
Message-ID: <9d65427c-f192-451e-9e67-c1a068aec2d9@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:53:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
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
 <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
 <xwvuajrm76flwhnciclz3bxzj6vmvladm4t73mr2pyrblczi6e@wbyq3x2yabrk>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <xwvuajrm76flwhnciclz3bxzj6vmvladm4t73mr2pyrblczi6e@wbyq3x2yabrk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MCBTYWx0ZWRfX385Kn6t1MSiP
 B100EMG0vraPqYZ/DJmiNcqdjW/b5sSzF/TM+kmsdk/SIb6vKAkZtpnjA39ygTI0Yz77A5zmyMW
 tdsI/V3I0U1ryPoFCwGzRCMjU6aQwRjeXKLCdaxyWKTL++275VCl+f5TycNGt2/7OdDhI47m7kq
 Y3yBcK2V+mkWNTwnPrMPngCw1NcrGe6EOjrK8TSO+cwWeW+oaexXm9+A5FSTeWpqIkt2gAztG2w
 kUWq8T50lUi0ps4jIYwJB1JY8FVrSe6bwnJDbUvbCCC2oHwkhxm8Q52WMTHNq0mAHZBr1LplF0X
 x+s7M4XmUcsA3rLLaj5H9zJmxM7gLighHcXQHsPAOe4Gb7WncVgfN3uUY2Loo2BSMIh+1mWKOAX
 sakozX8mH0nqAsGPtfhp6/tIQYsbICEeWmryFoRuktObEQLnIO8Pi029i1XSyRYbUm02B7fhEev
 X70SOxTEIArICOTE3iA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca2c10 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1ibuz8dZZ3-44BQBXskA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8953b5LQ6EOkVD1kw_vRp73oKk9ABXQZ
X-Proofpoint-GUID: 8953b5LQ6EOkVD1kw_vRp73oKk9ABXQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300060
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100682-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FD30356B6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 1:13 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:49PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> dp_display_enable() currently re-trains the link if needed and then
>> enables the pixel clock, programs the controller to start sending the
>> pixel stream. Split these two parts into prepare/enable APIs, to support
>> MST bridges_enable insert the MST payloads funcs between enable
>> stream_clks and program register.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  51 ++++++++++------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 113 ++++++++++++++++++++++++------------
>>   drivers/gpu/drm/msm/dp/dp_display.h |   1 +
>>   4 files changed, 113 insertions(+), 55 deletions(-)
>>
>>   void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 60094061c1029bc7a06ffaa80d9403b40aa07eb1..2fbf16f27842bb7639efaa2baecac7bdf8908432 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -20,6 +20,7 @@ struct msm_dp {
>>   	bool link_ready;
>>   	bool audio_enabled;
>>   	bool power_on;
>> +	bool prepared;
> 
> Why do you need this? The msm_dp_display_prepare() function can only be
> called from within the atomic_enable() callback, which is not supposed
> to fail and which is always called in pairs with the atomic_disable()
> callback.
> 
Sure . Will move to the appropriate patch.
>>   	unsigned int connector_type;
>>   	bool is_edp;
>>   	bool internal_hpd;
>>
>> -- 
>> 2.34.1
>>
> 


