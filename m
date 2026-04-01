Return-Path: <linux-arm-msm+bounces-101244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAyfMZTBzGkWWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:56:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 399CB375760
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCC81308C972
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE67258CCC;
	Wed,  1 Apr 2026 06:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGSgGsSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGNzBVle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F726C3BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026167; cv=none; b=W/OHwk2+0yrtUQVr2kRFRMqupq1MO7O6eaV8TR4AcjhwEsCfR/SRm9MpL1plLtIvUHK1w6UmMGSScgk4AmZ8Snc2iZUxb73+JQqwiXQGgR6mpK2yMCnOrnWOp0K3Dd5SKBDPaLu/wM9PbRJgFW97GhZpxXnKt6ohpL/lsjRcuLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026167; c=relaxed/simple;
	bh=QCxtr81m0smkx7MtgRUGEJbDJGOsru0lsnaJDTtqgzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u68GfU0FTqBMQjpht0y0czsxkccVJMveidcsFEllkTu41g+SOUI1LZJe3ZTh++lY0nkZI8WnlBEnptHzjvkJf8FE0xOgtMDPz0+Cuk2vlxajHeVTCq6RKVIVgS5veTAZEoPuELrg3dtIkWZ10MxAvFtAybVE5cE/Y4AspMF4WRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGSgGsSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGNzBVle; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316HZnr639212
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kaSZtLO1O6dHgdsj6HMqLMbEQ2wzIJZCOsaKSTu39v4=; b=OGSgGsSa9xKJAaOw
	eiGzLuUwYlHDPFurD2a5lT9AO5s54lv48gc+p0ws41/EQ868kUA1Y/I7RLjRvmlu
	WETWfxzzVmLo6w0u9zpUH1sfyJJN0g4iNSVcEdraJTZR9Xk4cdegViB9r+LcMmac
	FHj4Bc+WPKm0cjT/CjTeXYEXHwDV9/BwR3hXa5uz2x7DgSsotWrQhS5IPZhY9r6J
	yhraGtVek0HnC/Upb8cL0cfrzAfmeaPZXtgXZ04TACCgo0jZlUYKzLrfSD4oVLBP
	EyEK1DC0Y36YHrn/h6pRVCi3Ih7GmEVItr8j/j3p+vke8PkGfqkmOVkv4wjS/6QF
	FNSMgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2aushv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:49:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50911c94db1so159382401cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775026165; x=1775630965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kaSZtLO1O6dHgdsj6HMqLMbEQ2wzIJZCOsaKSTu39v4=;
        b=RGNzBVle1TNrwPZ/XbPCbqHEM3w+SZIfWLzQv9H0RvGe9tfF/8taQYF/XEmaggsZJk
         M2qmiNG86jl7CUtDZJwvK/YtLHLEmFNHWQjaj0R/7/fQq52OUsGB4ZFR6v0oVhEOLjIz
         I3MMEH/3BNVRr/nSqpInC6Um/kJvXH716TtkYwJ0Rw2J8gYLTEvEAL5yY9Iqw9WtV/1w
         yevsXH03VdAPJntrB2yUeGFfBcdoPAvvv7WHkptUY4GrtV7JSHqlL6zel8yEsH/eK5Ih
         xRwLm91taSkIb9pL0bFNVVPwGn0NqYKYCG4yBgi26idMSqTBPff0KNUOtXMUybC0VUEm
         zbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775026165; x=1775630965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaSZtLO1O6dHgdsj6HMqLMbEQ2wzIJZCOsaKSTu39v4=;
        b=NZm0McEr7OAGVTb8u4dS+POhMsV4ZNOlasWrFpvDnet60IeZIVJQdNV9KlpJCRJAzJ
         jiwt9xYXm+FxdO+iNEMsvFBYaegZD+aNYSZGkPTpDGDPa4j9NfbcnjkCHKw085BX3t/8
         QxspUkQ5e1gnxtmr/C0w+6herEL44LNqF2QR9NIXEH52rswLSyDyKggnJUizQ1we4ISM
         /bPs4pj3dkAMMGuPz690yiwgioKkHszYLRh/PmZWdtEiOC+NcqwEItNlmuhp7ngnjphq
         Mrti7d26yjI9UlRfoD9zEP1wyuA8LYsrpGDk8ULlmrUKflcn6vRLJ2CCY3g1NBPbQET7
         hxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8BiPs4X4dVMb7r59aVXCvgz73IAD/IkRCJoshIP2MYJxMNUgYVBLCNgpBKisIOe83BmKNdBCZi9XFdvP/@vger.kernel.org
X-Gm-Message-State: AOJu0YzHTlEasBO7H6RCtNTgLcWdoCuZnOtLlMZAWDh+/jrpVVTGiWl/
	g9L0iBboajvFik3eIkm+jItAFT3eozL10jacifretqM+0PB4t71TbOXlTnrR3C/K0g852j/8ii2
	jgG23hZZp12eSYxQ2tj7kS/CpKA/yZn6WQjKyZ/tnF9ES+auww+dDFBxwhAqU4amCMRi3
X-Gm-Gg: ATEYQzy3th25f/bTfn3QtfgskvDe3p2tJk8kIgdgHDaDaIVG4I9L3S2Qa9YSNW3m9Dc
	RhPXHtfCs6EiJi5OVEioMLz6OoyaytKR63qtEQoS8AS2gXtL+DFFDPnb4PJR1vVp43N97s6Mk/L
	5JvktLbmUq6f7bKzO9ziZN++vfA4tPJzT2bUCpm4Als12vbe1P2bnrjaOfGGqJxy2PJIC9tbTyL
	aDjWSMtTgclSFy4I9zdEwi4PbLGc/kSC5uu4lR1Q5d2cIYcf/dlEGpOgACrOkw63VKE560pXMw3
	CiUjTEd2hSDVYbT3dkSioOiSeHlAe3P/cnuMbavurPzNJM7EYdUXjSOhaM/5JCjG7kSd2QJm01k
	kOanQOJ2gcCvuigT+4NlmDMXXrnmD50M7HUdcYtg1caDTzveLOYPqPAxlSnQeTfbRG1u6lZiZJw
	35lb/e64d5YnOSgwPiL0QjbSis
X-Received: by 2002:a05:622a:488a:b0:50b:50f5:b8e0 with SMTP id d75a77b69052e-50d3bc3dfffmr36131961cf.28.1775026165025;
        Tue, 31 Mar 2026 23:49:25 -0700 (PDT)
X-Received: by 2002:a05:622a:488a:b0:50b:50f5:b8e0 with SMTP id d75a77b69052e-50d3bc3dfffmr36131801cf.28.1775026164639;
        Tue, 31 Mar 2026 23:49:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a073:af00::4c9? (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cb6sm3076261e87.27.2026.03.31.23.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 23:49:23 -0700 (PDT)
Message-ID: <b154111d-46b7-4bc8-abea-d133e929c6b4@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 09:49:20 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in
 mainlink control
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
 <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
 <ahgabnh7e2zszqjakexr4755orihk6afvqlyw3lvcffyvr5muw@hmy6kf3ociku>
 <49dae108-ad9d-4931-a10e-810de5766790@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <49dae108-ad9d-4931-a10e-810de5766790@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1OCBTYWx0ZWRfX11ZZ+AzOhMNz
 IFWUhi+N65OiWTwKTHWGMO6J2CnBktPlbdM7BAeYWkPgf01MuzYDhFcb9FwBbwRG/9eezyLU8/C
 dkXvIOU8ewQLkpTQ3heu49DpYjzOA2WnZ3+z7I8TQCgoCXH0Ssg1RVExAvgaT8eB2EVngUQcRCu
 kaq+KoHKQpWkOassPWC18lexu4LoiCbIp3xvxmMZPJgwfs8in2NOnago7Cnx8zuIFRz2WNseasw
 XUEZ309Q0nckS3IfcyozLkE/rirUh3UPge5gbRNrztn2ZC8jum1RVSIkpXh0DQ1NRth0LQi6zVw
 EGS1El+TNRAcZYMOVBeZlFXaIY4p1uWcK3TjiyCkQaz+hAIP5Pcgph2TF8cwnECb4hxWh6mkD2V
 6vOrrslZDFOspng/dHq/CVhk1kcPKvuS5t7VtzT3FKt70KZdWUU24DXrd9GZr0jyvovkMQKpxw1
 z38vFgI+jPEukOCnKXw==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccbff6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lP0j4_6gZTFRyBZCz58A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Au7g-SLuKYMXa7Edx_wUFhR8hDWMThP8
X-Proofpoint-ORIG-GUID: Au7g-SLuKYMXa7Edx_wUFhR8hDWMThP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010058
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
	TAGGED_FROM(0.00)[bounces-101244-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 399CB375760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 09:46, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 5:24 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 25, 2025 at 10:16:04PM +0800, Yongxing Mou wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Add support to program the MST enable bit in the mainlink control
>>> register when an MST session is active or being disabled.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
>>>   drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
>>>   2 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/ 
>>> dp/dp_reg.h
>>> index 
>>> de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>>> @@ -128,6 +128,7 @@
>>>   #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP    
>>> FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
>>>   #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE    
>>> FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
>>>   #define DP_MAINLINK_FB_BOUNDARY_SEL        (0x02000000)
>>> +#define DP_MAINLINK_CTRL_MST_EN            (0x04000100)
>>
>> Why are there two bits?
>>
> Bit 8 enables MST, and bit 26 was set to select the required ECF 
> endianness.
> 
> 27:26    ECF_MODE        MST ECF Endianness
> 
>                                    0x0: [63:56], [55:48], ... [7:0]
> 
>                                    0x1: [7:0], [15:8], ... [63:56]
> 
>                                    0x2: [56:63], [48:55], ... [0:7]
> 
>                                    0x3: [0:7], [8:15], ... [56:63]
> 
> 8    MST_EN        Multi Stream Enable

You can guess, #define them separately (and the ECF should be the GENMASK).

>>>   #define REG_DP_STATE_CTRL            (0x00000004)
>>>   #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1    (0x00000001)
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 


-- 
With best wishes
Dmitry

