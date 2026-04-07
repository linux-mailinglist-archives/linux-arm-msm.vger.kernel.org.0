Return-Path: <linux-arm-msm+bounces-102042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LCxBBhu1GmatwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:38:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A90EC3A925A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E73AF3004F03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 02:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C33D209F43;
	Tue,  7 Apr 2026 02:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLFHy3vF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlkd8UjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973A381C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 02:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529493; cv=none; b=U10aY+4WJKKgEsGxO4R2Jn7j4aTu+/ceEQWoYmrOT7plVwXQ4P1lx5gS1P4HO8gT3Kwcyt7DrWKgVv9Vr8gyxmle7wInwW3JlKpqnI8yzQHp2wuLUpK0Sf1565/PUhdUAaBq3lPM1j376OgQ0j1TirDNBo1DGQQpu/LBsK2XwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529493; c=relaxed/simple;
	bh=g3RMF/mWhs8dsj5tlWogdLRJp2PO7B07H1LcLUDqSW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=louTt/2Qg2zHiGawqaWsBxDVZYkdyqQNHvYqVM8QsrAUM79aiNhcRpLCZ1irBGn7GxSA/t+nORtB8S+VqUr7FvfBoqsL5Tm5y06yFPknmvB84NW9hLClhe4n939I2p3DwP0NfeFm3AuKj+eD9DwhwmZjHcNu0L323IC2AA7doQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLFHy3vF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlkd8UjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ55G492547
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 02:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxY0yV5+oNV02QxbphI8pejM9GESpyjwddOZocNniT8=; b=TLFHy3vFsI8G2Wze
	sN3yd7eF66G2DcXNKF2blrtbxDw/IIuo0qMiRH5X0rY8WK7sARfDNjsOjYPCOkZX
	BuMGOLSAJRlBHIwjqz5vEZRcLConkn1en2xCjvxd2N0WSgi5T/T1MnXXJbR2adoq
	tK9iR4pYmiC4DY8kkqPLJzHiXwnoMgTq11VGwbYcBarPjjV7UQ+agXTYStjwa3wJ
	4fpYN8kOkHoqgc7hffSTw9jVw174fJde9znJ3BnTYvDXZgGgyN+pL86uMiSYALMg
	f2iPeCIGNXz+nBLsnz0YXYnd3XK3oTEeR1ZH+3mYqzPJH25wkF1pELHt06/Bb7NZ
	AYgXOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8rp4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:38:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b241be0126so126153345ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529491; x=1776134291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxY0yV5+oNV02QxbphI8pejM9GESpyjwddOZocNniT8=;
        b=jlkd8UjGzv9d02t4hyXZEQhmAsry9bbylqk0zWFO7q7qEudrR88wW3hDQf8FoodHge
         614gFQZkJ+kcUgue+fTMk2rQ4B4l4226mWn2dqINaHKELUDvUGTfcUuN3TL86xvAjVCR
         HgAMB3HpAbnnb+ACDmwKcGQBmTr/FuWrHPIuH9BGlHCDK/vzmSBESgxstxIHJuLc2rBs
         qK6rDlb2CSnkFf0pz+deqtap/qepzXq5r7xJOm0Jq5m2lufmIGTNKFCAVsxRDNccXyuy
         ITQDtO2TLwYaePner9CV8jAxqbnmxOglSPb5LUPY3Azkjtl6+vmxVqeE5kFSvUJadri0
         R23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529491; x=1776134291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxY0yV5+oNV02QxbphI8pejM9GESpyjwddOZocNniT8=;
        b=T7PAIghkUQuJl+LNZeP9QGZ0yaeH+CJEtjk1VEwg3jPundJb0/mZfEQADN7rxLGYJP
         dRRdlIUEWYyw9R/jM437wbnLHwx1ly5HvhDg9SEguGrNR0TamAtMlQSAlKKGab+7nPzE
         Wxg79lxA/Dq9Q60LpPsDonK5T3HeVybG+ND/9mxb2gsFHTqjuMUTqHLP6wIqt9SANKlz
         FHmkkKgDajt3XitNALRoIipo9UEOTM4rzD0D4LWyemDiF9LRdASfgyQKWxGZO7GhaiQ5
         gAPOiMbehOIiN28juUle6/REYuaCzfLv5NuWmUS7LTNGkh+rizYVuhWKuePB5oxFcc4c
         1BPw==
X-Forwarded-Encrypted: i=1; AJvYcCWaGlusfb2GOeQicc5y79ohss73VU8IHoKQ5RCFaGPZnvxqPFSyngFhj2NyKTHgtBbNkxkyTBX3zcWo1ISS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0uGttOefmM4nnrX0pfaDS9J5//Zz5nUjl4ghg3cSKKd6TLDGq
	ghm/UytGGZyqWrg9+dhvoldRzJh9qOun+7Efk4u7D5BN2DDm7TWpK3339Icb7m0U2D/TULT1PfQ
	4Pk+iMebTJESHYjVEdCvKlT0z7/0rLl55q1UjLH+hM4dLkIpcnFv0f3uCq2ACtQzfjdHt
X-Gm-Gg: AeBDieuojAR8SIh318r4xSeItfMP97S4uZ8kKbiodEH7oaolaD9qEqhC1+URXoIYn2l
	dqhvCty9s7mGcpzK8AbkCvUEFNxW/0EE9j5DaFAF8WDN4RRHbCkqvuAh9xVyY6bp848RefNYW5S
	LjhWJNwcF5kBYrdC+2yvP4Vkwp+pxVOJpzg/loQzgdvPdFQXbIQg8DmRgf+D38r0WfWST2Yv5fA
	/3tajDDh2qvrAlXn0XvDufpVhuLo1u9OaTltM/px9edSIbr+sZ3sRCTy9IpsA3aw14+D7r4TJTu
	3NgrztrNQpc9taJJFYTiikrhRHImiP9n/hIfXMoW6h0CH6PVcwyJ7y8PndXkCV/A79MQqrhuvhv
	G4iessoAYCFJFaMhYLJqGCZYuA/d6rqOpQhbz4+XKv9duVjvCfMNe67vkU+cPNNA6SfmamY3jJL
	0qGqrFVOG5Qy779srMCA==
X-Received: by 2002:a17:902:ef12:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2b2817c061fmr164317485ad.33.1775529490788;
        Mon, 06 Apr 2026 19:38:10 -0700 (PDT)
X-Received: by 2002:a17:902:ef12:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2b2817c061fmr164317035ad.33.1775529490329;
        Mon, 06 Apr 2026 19:38:10 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497c117sm148544335ad.40.2026.04.06.19.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:38:09 -0700 (PDT)
Message-ID: <64fdfd7d-4a10-4032-a5c6-35642957705e@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:38:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/38] drm/msm/dp: propagate MST state changes to dp
 mst module
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
 <20250825-msm-dp-mst-v3-32-01faacfcdedd@oss.qualcomm.com>
 <bmni5a57d5c6wu4zwlu3uokscnrmgsuvze254afwqcfdlqplzb@fss6ewfptdvv>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <bmni5a57d5c6wu4zwlu3uokscnrmgsuvze254afwqcfdlqplzb@fss6ewfptdvv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OIDvoZETxia-m978TR6-jBW-YzRAfL1k
X-Proofpoint-ORIG-GUID: OIDvoZETxia-m978TR6-jBW-YzRAfL1k
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d46e13 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=25Fo4dagkznjro4wADQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMyBTYWx0ZWRfX3bRFPRWNMjGs
 XBXXyVayI6ipFpmaz3v2gU8f20oV75nWcBvC+Xb5KYl22BDtD/cAimXS1AzpKUTp3NR5157mkr2
 7NffG4Y+LYFQgf1X8G0OF2anoZyKWD2TNpcDB3GelDJ7W3ddRAb5NirzsE4XBhIZF4giXxqvRH5
 CNGhuldL/a34yHowNxX0duMVNwriY+7ZfRw/tH+HYguyLVBXXh5iA532OOCgaBgPl1YS/MM+WsH
 RELL1+cQ/jZx8ArRuGdGxS2kLPkHcF7mEm3HbjzNsVIV6l62S/pudnw/VkgX2maqX2DIFOB+rPG
 WNFThg1EwFRZ2rg0NchO8WT6GPveTIBcm46wuXjCFKhVf4MxOWGmvTZt5Glxi+4WVeLkUZ4mK7V
 Q7HXmBJ+Sx1NCZxewV7LTokg0MVqOmR7dvTlCIBnWI3jH8D1TH+Fr8HW109vANXmwgExZZ0sQjp
 /T3a4sWUC3Pw5Nx5hXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102042-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A90EC3A925A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 2:43 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:18PM +0800, Yongxing Mou wrote:
>> Introduce APIs to update the MST state change to MST framework when
>> device is plugged/unplugged.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>>   3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8..909c84a5c97f56138d0d62c5d856d2fd18d36b8c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -28,6 +28,7 @@
>>   #include "dp_drm.h"
>>   #include "dp_audio.h"
>>   #include "dp_debug.h"
>> +#include "dp_mst_drm.h"
>>   
>>   static bool psr_enabled = false;
>>   module_param(psr_enabled, bool, 0);
>> @@ -269,7 +270,6 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>>   		dp->panel->video_test = false;
>>   	}
>>   
>> -
> 
> Unrelated
> 
Will drop it.
>>   	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>>   			dp->msm_dp_display.connector_type, hpd);
>>   
>> @@ -386,6 +386,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>>   
>> +	if (dp->msm_dp_display.mst_active)
>> +		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
> 
> I'd say, this should be a part of the previous patch.
> 
Will rework this chunk.
>> +
>>   	if (!dp->msm_dp_display.internal_hpd)
>>   		msm_dp_display_send_hpd_notification(dp, true);
>>   
>> @@ -608,6 +611,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
>>   	if (!dp->msm_dp_display.internal_hpd)
>>   		msm_dp_display_send_hpd_notification(dp, false);
>>   
>> +	if (dp->msm_dp_display.mst_active) {
>> +		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
>> +		dp->msm_dp_display.mst_active = false;
>> +	}
>> +
>>   	/* signal the disconnect event early to ensure proper teardown */
>>   	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> index 331d08854049d9c74d49aa231f3507539986099e..ca654b1963467c8220dd7ee073f25216455d0490 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> @@ -924,6 +924,21 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>>   	return connector;
>>   }
>>   
>> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
>> +{
>> +	int rc;
>> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> 
> Reverse X-mas
> 
Got it.
>> +
>> +	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
>> +	if (rc < 0) {
>> +		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
>> +			  state, rc);
>> +	}
>> +
>> +	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
>> +	return rc;
>> +}
>> +
>>   static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
>>   	.add_connector = msm_dp_mst_add_connector,
>>   };
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> index 5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a..8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> @@ -87,5 +87,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>>   int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>>   
>>   void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
>> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
>>   
>>   #endif /* _DP_MST_DRM_H_ */
>>
>> -- 
>> 2.34.1
>>
> 


