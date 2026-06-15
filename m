Return-Path: <linux-arm-msm+bounces-113137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OLytDWjAL2oXFwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:05:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E260684DE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:05:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y6cHb2o2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cd4HYfbD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113137-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113137-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 106B030254DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BAA3C3C1C;
	Mon, 15 Jun 2026 09:02:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21A30568A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:02:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514158; cv=none; b=b9xyKLH0a9hAH4m13VZ+kvxcak9LTST4AYMcY/HNQUDWEusra63Ilw2rhj2Pn13T0Bp/jeWlizCK+Q9rqR04DLgI7t2dLtnmWY5J0AFV6XmmECkV9Zo1N1W+l4pwcwmYnCr/7NNWEoE0rBrzMw8yZ+PDdq5jnTd2zfQ9ZQKsxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514158; c=relaxed/simple;
	bh=pTDNi0W6fqwMgjHgwIiamotJyeAUzb/fHjF4VNho4r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsgG1jLTgAg9rQF7VC9POyTXFIZyXXYL0h1W/qmIOMJnisXiku876NZRLD3iWXbHhJjJsJzl6ct28pPMqCO+OLfb/uAVNeIWUhyjioENutgStA4bcv87uSsWY4u+RCjg0phn8S7zcX/CV5h/wZNOa3tY49WHnkm+K8JsoZWnp14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6cHb2o2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cd4HYfbD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LnvF3853308
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Cc4D/6k3H0E0CITsdFqF/FNnfsipdjLFJuu35eAJpM=; b=Y6cHb2o2fCuKJbl+
	axs0yLnX/NWVtHNyvAsyxF8I5rEGDvtdg4ZYezbKpX06xQdrJg6EqUjLCr7rKu6R
	nuk/erGsQWK5GDT0WEz21aMKGzUiC1lIhHO6JqnCXW5hKhTJJ4qE8LlbdE5GsxBY
	iDW9od0ChadxO1uORdCjkjBb/nnPfQ+54xd2Pp1dOo2UYoQKbA9irTDrCJYWy/+6
	t8jJkGZtqWtasvXBUAqoI7P/TA11Kgj9YpUkoRPHI/P1x3/0/frUgeRNZmPrbGwB
	UG9mPHOVXMN8B0fdGZDIhFsVIRDmwnbZW6QPP9pi2FiQzds+8zixrw5l+fvBhhqw
	qpGQxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxmjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:02:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so3494031a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781514154; x=1782118954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Cc4D/6k3H0E0CITsdFqF/FNnfsipdjLFJuu35eAJpM=;
        b=cd4HYfbDH4+poRbr6qOP5kLjniQn+S1SFWV/a3BT3MjxvktM5ixO7a/EAW8dmldrlR
         68NS25s4WvR+rjnjXdUfspJuGeLFoH7+IlzWE/fwthBkzoTkhYqcgb6Xix68Gqb5wY8Y
         kbCXeiExoPpQP2lVp81KL4UO94OVBrP8oSwwobEmTui+8q3voDtpa8lUKhziOSgHPqtp
         jGLNN9RREiW/vqaJs/8AubDnW0the/di9BP6iyNgxiliA7fH/p52K9T1unEgNU7XWwJs
         yO+ABg36Zsm6Tfplt71hQm0dHeBcgu9XnKG/DZbP1JhtEAdKe/nGaeoElyScBnLqN0aM
         PFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514154; x=1782118954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Cc4D/6k3H0E0CITsdFqF/FNnfsipdjLFJuu35eAJpM=;
        b=pHisqccCo+v7kxT9xbZPmmT7P4CdI7C76CuamgXiPVNw1Nk4UkvAnVKgAK/IeqCwKN
         0EKat2hKXMAIpkpC28P6xxS6HpF0+Jryc9Xpwbbpx4pdygKiGeBcUp3VXOM2CiCqYroh
         qDx1jaWPPNxzMhUHKY4/nd5AkPKVveNNpsuJOgBl/xJy8l/1bC+jHufXBcIuZo1pu9yN
         GxxdlZpprJu5heArWoyr9/lJCUWL97drdq30yF3Mw/MGhFIXcZ/8zpsohyTUY8Zkd87q
         FE7Df75krLLhpEvIFu9mKZgiyQh5Anb8D9yO6QPwUASR0OuBRGbzbO4e8AlmMIKqfhXO
         ZN/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9kXOfMs/NKoXM/qWUrIkmhY2phcOlgGTpG9oIyC3vNpOEN4gKhqdtVxaaPj5iGn+TAuQAuUgQS1UO0KbOg@vger.kernel.org
X-Gm-Message-State: AOJu0YyYmIRkXhgMCZfAzuvu8AfVYCB7CcaXo/iPS8cdHS5li0dYYOlV
	Thybb1iTdIyTpG9FBZZDMF76yaCv+ybGA2M4VhWmssfNOQiF83hBl7QJsgubm2HD+3QFUvr9TgK
	2PC8C3BjXn0OeJ3HixhTNJcJ3z0uPYWHkJy42F85TYH3LDRi9hCvmB9ew6dYIqXWFt5NY
X-Gm-Gg: Acq92OEEMyTcqlptoZff6EPotAH8iro+tCEUV2xu/r4u7VbJvv9EUcUn4lmaVf4OS3n
	cdYpFpIb9rOlSCX6ub5v9J2CBgnGmbnzzr8OQP6+wQ1kcu2noBMCx/CjnVr/lTfTKEE0wkYLFpY
	qvNcjpK4UtIKNF+yKEudU1q2hpkX3Z8VnGsxG5fF5tWAAb4HqMNpMLmj6ZlZ2FPlZQRQgAm4vnf
	XDMhp3kHAoOk6natHOOZ/VyhNO1Jco/qCsMEPE4VxXPWFrrG2wJy5mgskZE+O8WFbEb+BDBx0yv
	0xTb/5B2hJybqn/ZrMzQhWgX5hCfhg6Mmd0eAnSRQsSFg+g95RLptbLomq6M7xNTGzD2HNa0Dr4
	I7FUnfQUcEMcFTHD64V5RYHZ4xNJow8XM6AXlNCl9PcB0SysoXIbiF9wANxBJSLN8X7w+nvqE9K
	bVmFEuMy0W+XKYhcUccA==
X-Received: by 2002:a17:90b:3c90:b0:36d:633a:c7fc with SMTP id 98e67ed59e1d1-37a1fc2a147mr9020649a91.10.1781514153614;
        Mon, 15 Jun 2026 02:02:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3c90:b0:36d:633a:c7fc with SMTP id 98e67ed59e1d1-37a1fc2a147mr9020553a91.10.1781514153018;
        Mon, 15 Jun 2026 02:02:33 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2678375fsm11760041a91.17.2026.06.15.02.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:02:32 -0700 (PDT)
Message-ID: <1fe8d286-7182-49ed-b6fc-dfa3766f851a@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:02:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/39] drm/msm/dp: add an API to initialize MST on sink
 side
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-29-b20518dea8de@oss.qualcomm.com>
 <32jtwnkusxultvsgvnalrvccfkcyk7744yf4d42pqm7wudysvt@l4pnrzfxh2f4>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <32jtwnkusxultvsgvnalrvccfkcyk7744yf4d42pqm7wudysvt@l4pnrzfxh2f4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NCBTYWx0ZWRfXxK0OpL+bgCVl
 AfwHUDHFHT+xKGksCB/x5apfE7GsSjxY4MwnSsfm4+04Ue0vfRt5k+jx5ay46SzeCc8XgPba/sB
 zvzJhpfAXqz6sZjeev3spPrWEzHQcV0=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fbfaa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tepjUtBTXmVVZiRr_ggA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NCBTYWx0ZWRfXwoEIqSJ1I5zY
 sTYUP0OSMvIdoFD844J2/hNb+CKHlSuyot6QIphRV/y31Ep+iF57u2taHDMmj89T7Fv5Db/WZR0
 Mf/A/uWfYwC7cuP3Dz4/2n/MMy9ri42LfDZo3y+sHzDggTgtgLcjIG9BASvCOK0hoLvNTj3lada
 07KuVyAV4sStvgaBTeqh5vdR+nwAlIACStQ491N7MxeiD6JxBcGcRBH2YMns9RK5csH8+MuMAHC
 yN+le8cbhG/JIB2OrhSjmJ6Fk9kGBp2SUkHg/ogqNgx4z/ZeFfZss/WeyPR0GtnQgCsrD4FWKYk
 4He2sYbATuWaE6uPT0D3mYrFOw6t96Ft+jC9LKrpoYCSppbsi5wKKqR258XZG+2vsv+y9h25LEw
 ooIhe7WYhDt6ZCam8ES8OtekCXcQ8oq7tFqh03sYJ/7JQXPh/k1drAbeX1ujiiDV6VzPX5rsJar
 I+R7en5JXnR2Fj/Rmhg==
X-Proofpoint-GUID: m07FNxFVrsIbsbNiAT1D_j62vvNUq34v
X-Proofpoint-ORIG-GUID: m07FNxFVrsIbsbNiAT1D_j62vvNUq34v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113137-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E260684DE6



On 4/12/2026 8:15 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:34:04PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> If the DP controller is capable of supporting multiple streams
>> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
>> DPCD register to enable MST mode.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 57 ++++++++++++++++++++++++++++++++-----
>>   1 file changed, 50 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 8ae690ce2b9f..abf26951819a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/string_choices.h>
>>   #include <drm/display/drm_dp_aux_bus.h>
>>   #include <drm/display/drm_hdmi_audio_helper.h>
>> +#include <drm/display/drm_dp_mst_helper.h>
>>   #include <drm/drm_edid.h>
>>   
>>   #include "msm_drv.h"
>> @@ -270,6 +271,40 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>>   	return lttpr_count;
>>   }
>>   
>> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>> +{
>> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
>> +	u8 old_mstm_ctrl;
>> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
>> +	int ret;
>> +
>> +	/* clear sink MST state */
>> +	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
>> +
>> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
>> +	if (ret < 0) {
>> +		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
>> +		return;
>> +	}
>> +
>> +	/* add extra delay if MST old state is on*/
>> +	if (old_mstm_ctrl) {
>> +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
>> +			   clear_mstm_ctrl_timeout_us);
>> +		usleep_range(clear_mstm_ctrl_timeout_us,
>> +			     clear_mstm_ctrl_timeout_us + 1000);
> 
> For 100 ms you should be using msleep() instead. But where is that
> timeout coming from?
> 
Will switch to msleep(100).

The 100 ms is an empirical workaround carried over from downstream — 
some sinks don't exit MST immediately after writing DP_MSTM_CTRL = 0, 
and re-enabling MST too quickly broke topology probe. It's not a DP spec 
requirement, and other drivers (drm_dp_mst core, i915, amdgpu, nouveau) 
don't have an equivalent delay.

>> +	}
>> +
>> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
>> +				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
> 
> Isn't it too early to enable MST? (I don't remember this part of the
> standard).
> 
No, this follows the DP 1.4a MST spec. DP_MSTM_CTRL must be set before 
topology discovery. Topology discovery uses AUX sideband messages, which 
don’t require link training.
So we enable MST first, then discover topology, and only do link 
training and payload allocation later in atomic_enable().
>> +	if (ret < 0) {
>> +		DRM_ERROR("sink MST enablement failed\n");
>> +		return;
>> +	}
>> +
>> +	msm_dp->mst_active = true;
>> +}
>> +
>>   static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   {
>>   	struct drm_connector *connector = dp->msm_dp_display.connector;
>> @@ -288,14 +323,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	if (rc)
>>   		goto end;
>>   
>> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
>> -	drm_edid_connector_update(connector, drm_edid);
>> +	if (!(dp->max_stream > 1) || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
>> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
>> +		drm_edid_connector_update(connector, drm_edid);
>>   
>> -	if (!drm_edid) {
>> -		DRM_ERROR("panel edid read failed\n");
>> -		/* check edid read fail is due to unplug */
>> -		if (!msm_dp_aux_is_link_connected(dp->aux))
>> -			return -ETIMEDOUT;
>> +		if (!drm_edid) {
>> +			DRM_ERROR("panel edid read failed\n");
>> +			/* check edid read fail is due to unplug */
>> +			if (!msm_dp_aux_is_link_connected(dp->aux))
>> +				return -ETIMEDOUT;
>> +		}
>> +
>> +		if (rc)
>> +			goto end;
>>   	}
>>   
>>   	msm_dp_link_process_request(dp->link);
>> @@ -317,6 +357,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	 */
>>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   
>> +	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>> +		msm_dp_display_mst_init(dp);
>> +
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>>   
>>   end:
>>
>> -- 
>> 2.43.0
>>
> 


