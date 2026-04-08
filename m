Return-Path: <linux-arm-msm+bounces-102333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNWhDtxZ1mnLEQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:36:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34D3BD05E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CA73300CE68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF0933D505;
	Wed,  8 Apr 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBehY+M0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNA3vwJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECCC382F0E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655158; cv=none; b=H8YqTUTXMw5PdvkxVCfZZttzTPzc1ENNJrUBgSIBp5PCuUEYsz7Bkn5TVy55ENrygASvmyprjMeCD0X52qs1rh97DodfpZpsWCFpWbLYSCewV6Paq32G0dC0Yg/kJdrAvo4zVlIX3SzJE8DNPLZyz/hdm/BH8P6kLp+SoPx08w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655158; c=relaxed/simple;
	bh=XX3qEm907aHruAI8TZ2340Vb9mz3NyRZrDjcinuBtQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfbGx/999zmCk5M8gkG66r0I6obG5az1HBzT5gDZuR9L1ZoCNvlOxFRARWTjcw3gaM3SdfOxvAht/s3txc4Wo3U8dH7/NzLvbVzv8Smo2qMlSGqQIW84erhUrtzZeuzgfDKzscXQXCMUSiWXx51OkrsWQz+5JI5qHmXAUMEn0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBehY+M0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNA3vwJZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638B1XVa263064
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 13:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6RvOwvFYEYCyXFzHd+gy+nHIBkNAGshdd9r2tXEymo=; b=kBehY+M0qav69Qet
	5ajjor4PS9U5phswhDEmanQbecRTIxjQkdHqhF4NtLP5+xxkqfqUh2xO9BG81xgV
	k6obVktxjCuWzBW98LLSnYKMlO1UesW5hFhzIpTCHT1G+eE7cNbofMkRQyckYdu4
	dY+twkQcsdBJxw3Wo33I4F4aFPSuGM+lJJey994WLjG3K5+dkaY3dQt9NVWlP5uj
	uuTrFZfyzP6kuLu1Zn5H7N/1OZc8Ol0d4llDTZEOQOCdFybB13kFJSnoXfCCUsV6
	kzfYcWFGZLe+k97XifhYyN25y3gbJQ2SK5bsJKLO0Ph0IeOy0NIFYmo2ClX4qEtz
	pwEmkQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t23hj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 13:32:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a016b99579so26476446d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775655155; x=1776259955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6RvOwvFYEYCyXFzHd+gy+nHIBkNAGshdd9r2tXEymo=;
        b=JNA3vwJZOvRgS06xrjW7TcFaJqWijqDTvg7TRf8myU2KPEmlD6mWlGffS5K4/MEM/S
         nRS4qcxciBVSkgiqu38zMLkTJWQXRK7V234rOcczZCSjR3CuJZSToYkEIzyVMh+kd+ZM
         kl2B3i+rAUpUV37y2dKJgsVDaO62ZSg0xgT4ND8ejpk0wGOyCqv05doGs3/2O426WNmA
         rMtxcuteYvTEE0Fl+Id/RrsA9HZGK1rd3fdYAOHjXAp2S/rkKIguJ7B4k8BQ5JunhEmz
         lDd7XYtOr85wYCP3F1bljnClsF65WtVJMDt3dDpvlfzYuEgsONk+1RNHRsh1F8nbG1Og
         30uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775655155; x=1776259955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6RvOwvFYEYCyXFzHd+gy+nHIBkNAGshdd9r2tXEymo=;
        b=HLKZzfuJ9yQpyh0tiBqzfwn/wW3P02beR3n7FXRgvs5G0x1TJeFETZA7SNYfM4VwXi
         WwS0BaCYFFol60zYo/u6wvB0gjt91vHuvp9m3ZXVmK9fyyBufrS1xiyF7nnzYs+QNhyZ
         phSg744P+r6qSQe8jCNf0TFncOgDbQBxMSesTKHssF3ZmmmNFP2X0fSU3BKLhUJDWxjX
         i4XWp2IGTF2snpcn8c5h68pxhRsgFSz+X+mhYEy7tQJwirabjuba8BHcCqUaVvr3UI3V
         17FsMSw5e0Axevo/jWOLl9SvAFC39OLbmHLRQPukrsgVxAUgGSI4R6vmju6kHWFj4vEa
         ftqg==
X-Forwarded-Encrypted: i=1; AJvYcCV+bAQc7f/k9mXn80sUpCUR3U1T0oBXNGPqpInV8yCSFgabhal9Sv9m51/ZyA7xyH1pGmYntO15crsLr1dK@vger.kernel.org
X-Gm-Message-State: AOJu0YzHcxz4i+WXL7hNzcJGGJ7nUO0H8lOItPOARbcoywmUd5hAu6s3
	qFOEH7iszGEvF31dPQQhA4Ml9DXL5L41fINzq8g8W/ynqxTAJUTedc8YMMlyzGrEOYabWbuLSgV
	GeesHlc0cbU1ohwIqNcJ7wB1jAwZL8Lq8SghHa7J19OMLknr+RntG0q5SXIGiaTbKagJH
X-Gm-Gg: AeBDievK9sVMXkHb/lgmf+G+IyhBk2+ElHWOBSmxmU6Sc4AtY2sC02/6AUvMjz5BniD
	O8lPEANJoCdU/7O/QrEvkUgyVFEA0NvtDiNzNAOAMUqW7QchL6aaulkcLAFRFwsUnl0Jv6pTAXc
	eZPkctubOJ2zpxbxeU9sI/JF9UxfhO3BnvCCYOlAwJ70rfQmvepDInEhACj5ZGDAxt1UCCjE/dZ
	k4XlzFINMV/BTWRZFJIpKOh4XMjpIoxnwgr4H/bAhG8VD3O7mz9/g8pe5PPyv67INWOd31CH6Rw
	bXeMYxbCT++x3VjPY4Nnjy80NUjQssEj6PZGaPL6J57nXHtFuIsx2MzYtxt6AK3bfiy/rsR52GK
	EjVM5dVyNm+CSrTn/vkizRA794QfDIrMAwQSnkAy2zVf+9Znhdk9u1GXLSkRarMuz1qAg3jrjST
	1+VC0=
X-Received: by 2002:a05:6214:29e4:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac63fcca40mr36122516d6.3.1775655155374;
        Wed, 08 Apr 2026 06:32:35 -0700 (PDT)
X-Received: by 2002:a05:6214:29e4:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac63fcca40mr36122206d6.3.1775655154784;
        Wed, 08 Apr 2026 06:32:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c97218esm647078566b.9.2026.04.08.06.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:32:33 -0700 (PDT)
Message-ID: <437414cc-e2a0-48c7-858f-65cc982d0861@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:32:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-5-725801dbb12b@pm.me>
 <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
 <hvcBm15eFRX0ZonD34zzneuD50ceOzKGo1pE8LkQrQL1qEb4t0pEA4ankxEViVr7lwghJeGOoYp2ub8Ti2idrIzMfBXHBqnXejwukigxz9s=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hvcBm15eFRX0ZonD34zzneuD50ceOzKGo1pE8LkQrQL1qEb4t0pEA4ankxEViVr7lwghJeGOoYp2ub8Ti2idrIzMfBXHBqnXejwukigxz9s=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d658f4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wpl9K_kFG4-g1iQaUfsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyNSBTYWx0ZWRfX3Uuw+HCLPzkC
 qYE39bBqJHA2DGllxI/pLzYNq2k9r8gy4/01fgvtzJUm7SaEjboNGO9kylxXGo84BXRj1/+xED5
 HrsZdXx4uWsbzn+ytOuDaf5qgoieaplu/3XhallIT6C9SHh4Rl1k5q43zO7KH/uj1nyX14Vt2Df
 wTQ60GyrNpR+96uvWqJG2ByIbV4OdRX8N63zfSIerrTuRiU96KB8TMQcmzQnqds3kcB0GeXWyEz
 rf/g8rvWNmIFpb54rVK8XrvpzH3oQ4mn+OFYEDH+/qrdhUhwovMhzAVs7VHjM3A/NSUG6TNCSyW
 0Q6KGAk1Wtz88koYUrMsd9z7zTk2hwvl2wL9vPwLRXf+XRu4L4rwbBqjLWXd/Fl+NYsjszAZFO9
 YGy4lMb5XpyvLxCOH/mouXIVKvaJWk3BB6uDwOFiINYa+sGe2qBAB8yC5v5MCwBqoUK4v3YTDhb
 LEF7v4jCqhBxxO4MjlQ==
X-Proofpoint-ORIG-GUID: E2JdUget1L_Ia14_RIOWLb0a2hZyyWxK
X-Proofpoint-GUID: E2JdUget1L_Ia14_RIOWLb0a2hZyyWxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-102333-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E34D3BD05E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 12:14 AM, Alexander Koskovich wrote:
> On Wednesday, April 1st, 2026 at 6:15 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>
>> I may be on an older tag or something, but:
>>
>> $ diff /tmp/downstream.txt /tmp/upstream.txt
>> 24a25
>>> { GEN7_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>> 27,28c28,29
>> < { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
>> < { GEN8_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
>> ---
>>> { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
>>> { GEN8_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>> 31,32c32
>> < /* Disable write slow pointer in data phase queue */
>> < { GEN8_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
>> ---
>>> { GEN8_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
>>
>>
>>> +};
>>> +
>>> +static const u32 a810_protect_regs[] = {
>>
>> $ diff /tmp/downstream.txt /tmp/upstream.txt
>>
>> < A6XX_PROTECT_NORDWR(0x0ae00, 0x0),
>> < A6XX_PROTECT_NORDWR(0x0ae02, 0x4),
>> ---
>>> A6XX_PROTECT_NORDWR(0x0ae00, 0x6),
>>
>> -> the difference is that
>>
>> SP_DBG_ECO_CNTL and SP_ADDR_MODE_CNTL are not protected
>>
>> that might have been a part of the ^ difference
> 
> Going back for v2 and making sure this is 1:1 to GRAPHICS.LA.14.0.r5-03100-lanai.0, I
> think I was going back and forth between my own downstream from the OEM,
> GRAPHICS.LA.14.0.r5 and GRAPHICS.LA.15.0.r1.
> 
> GRAPHICS.LA.15.0.r1 has gen8_3_0 support, but I'm not sure if there are any
> devices that actually ship with it on that branch. Seemed to be fairly out
> of sync from LA.14.
> 
>>
>> Also it may be that the better name for this table is a830_protect_regs[]
> 
> Can you elaborate on this? The only names I know this GPU by are "a810" and
> "gen8_3_0".

gen8_0_x is A830 (8750), which seems to have some sort of a common lineage

Konrad

