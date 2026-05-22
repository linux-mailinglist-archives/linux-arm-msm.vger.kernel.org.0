Return-Path: <linux-arm-msm+bounces-109304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CPdMFJMEGq5VwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABD5B3F48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B35C63095465
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788113793BD;
	Fri, 22 May 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbPyYICb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DuhIEnTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1D5378D7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451621; cv=none; b=Q3pHBpmWkkp+tlfen8yfdTGBZBXlCxyZ///SU23BDkF+om47Vss+MRii6WUvobY1V7USOKibQtzn2ArdSehbLBuaZEt247Vg+zkGeoeQOaiNLEUkUP952Ci/OlFvsB55KjSoI/hUBFNp76s4X9AeQZ8iUzSclOXQ0WQj72SB994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451621; c=relaxed/simple;
	bh=hGKWTQ7bsE+PGf08e5bxxUPoPUU2pgm9NtWT0Vo1neI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoXG6DV/EwAmxy77rjNCj+6HiJgSMgEiJwHHsaWfKPpuopFbr2+oray3z8MKDoHSoNawb1HHS6Ndkbajlxa4eXtHaJWgl5XotiwyOFbsYLc4WVRZwcf6qEX/fcnrK7ZhJB89hKAgt1V1oQpmN8JTkmXroJlADT0gDSsKPJqJ+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbPyYICb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuhIEnTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6tePE778834
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuC4SrN5QXHeOndDmUz76nUGZQ7L7HnziVS8PNaqBls=; b=KbPyYICbkw/yR81+
	kcwtkJE+EFGBR52L0V90LzQMV7Dkug0zN9yHQZfqVwW9Ub0TEst1+DfitJg4ckm/
	ifKTLg3d3eF3cGq8BuJpzAAxlpbLZsgDC3ctoCOslSF6G5O/wkbppwBHWfPxgEDc
	wBJ0T1qhJLQK7ImPXTQ4DVUY6xBGInUn/iaT3V9uhU7JyW4jSea8rDC9aurry9ya
	T5OiqUQnm4poTl7B9BzJNB8PShzzRKdx2DJR5EZNJFtAP71xkqtGMfiR/2rX4rRl
	UlQZ+79o9ZPtqb+UTGNj+kKHAA6YJnXh4CmyP8X1kdA71OjQLNPy4fzEg9YzjW0t
	mPrcoQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atmcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:06:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9569deb349aso268652241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451617; x=1780056417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuC4SrN5QXHeOndDmUz76nUGZQ7L7HnziVS8PNaqBls=;
        b=DuhIEnTSusR0gc5AI/RGYNZhTx7+4DH0kMKfluomo9P6LVICT4QCmJNQFFBzesrt6/
         C5niljcflq+2tKwvTSmau8QE2OkDwl/K6GaLUBCxlzHsViWFCRd5C6ov0a1Qle/YgDOk
         06TOnjF8pouGgTduHMpxY0FuwO6YD5y7nBC+CzKS3KmdD+sXQ3zwfoL+FzwmyaIFq0YG
         AbCeWpolsWfDDf96W4KJIgOw67FRIW9p3fVh3yrb98c2Ubwh5rcOUBVzxoz0Vo8fzki6
         VD6exsYshLeaavfNbuviorMScUUEBI+TL9Q0XcMvVkUyByspuQcYCLmGHX8fOx1AHvmK
         sr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451617; x=1780056417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuC4SrN5QXHeOndDmUz76nUGZQ7L7HnziVS8PNaqBls=;
        b=fdFYLrnaGi7WGRak6xlf05rQluMJ8hSKBe6VsOLYfpCtwIVJgNNPT0LkmHFuUfRRWz
         l68DfM+pVgKsD9CGYEF1vHdjF6BhvGyeFO92xstBcYizzApREnyDhWZjHQHB6v6zYutN
         RQDHm77dVn623wyW1eTpaRF6PZCam6Iz5Z9UI/zBkNM8lGXA1mWgC71wWL3AA/Ts4TTx
         Y19EkkS54pSwOkzSGSHAMhvWG6zAruMAu3ctLA+mvf7NTXBcG2NT4nt/gsgZN/YygGIF
         ynmYVzGgq2w6OvxLZFoaBCiTC7mof74i8jue6MpcHk5O2x7j+HGitHQ4qrP11QuVRZyq
         j3mA==
X-Forwarded-Encrypted: i=1; AFNElJ/Mxh7Az5D8TFRAFGYYh8wdonFWRClfB3gfToOFj4O7xxCENpBlQfviC3kJg5XIDRzup0pq7yCcTOWjzmiE@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVC40k2wC9cx5IEJGYPXDDoqh58S5SEiZgJ7gSedTqniom81n
	Ulxd/Tg5DV4vyteoJoy73gOgHXehlwwQPgmK5UduWgQhlWRWTctOynVlC+IyFhfcFiy7WuaK8PR
	c//DaNhU3LLyuUD050+JkAjDk1Wnfx2xLtUzXBOdX14mtc7AcWSF2VYzf0jp/oLzuOrvU
X-Gm-Gg: Acq92OE1XoVOVxLOZ52Y49nmoK1zeI8sjRhp2bV+4FxVRYeUNE3dg/kzky2/TvWDF7c
	3qP9Bmu2jphk5xCn5chpcZzQUZyBRcUJsNX/M/IoSEDSk58YsE6J+usoUhywVSfyJV3AwtXxueq
	st1A3GXMWGevQi6eXMbee3BpIsRjh8/TaeDDItf5XIowBTlIBWDf4BtxlLIdnq8baQwFHpycBn2
	K8KM0bk0bUPSfeFaA5LZkkiGbIuTiMeH8xopSID8jhYPf1QrrE0JowRvT7pOdKeypFXoOxayt9P
	MyngTI1fCUiWaPAC83XLG647jRUuvb799l8h+V2fTCM7b6g8AN3WD10mQilAE3OnV+BEamkN3mR
	cZzmOrTa9PRCJP+aqoGdbhJ5gZzepVkazzoWKMdnddWqKDw==
X-Received: by 2002:a05:6102:12ce:b0:631:2a09:94c0 with SMTP id ada2fe7eead31-67c704cc2f0mr493737137.2.1779451617114;
        Fri, 22 May 2026 05:06:57 -0700 (PDT)
X-Received: by 2002:a05:6102:12ce:b0:631:2a09:94c0 with SMTP id ada2fe7eead31-67c704cc2f0mr493706137.2.1779451616558;
        Fri, 22 May 2026 05:06:56 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d3f21sm47749466b.44.2026.05.22.05.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:06:55 -0700 (PDT)
Message-ID: <fd4f87d3-6c3b-4171-ac19-7ba28a899dd0@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:06:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/msm/dp: clear EDID on display unplug
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-10-0c8450737d64@oss.qualcomm.com>
 <93327e80-c4fa-464c-90d2-26a7b08b2ea9@oss.qualcomm.com>
 <kpx6hqics3odr66whpatyr4q3onj3sbm3bmoesr27u4up5wrcd@irdyyavhfvo5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kpx6hqics3odr66whpatyr4q3onj3sbm3bmoesr27u4up5wrcd@irdyyavhfvo5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iHgYBILtLJ59PEbx5-pvD0U8imrCvTLk
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1046e1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t_vVken9Fv9OD4yO6SUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: iHgYBILtLJ59PEbx5-pvD0U8imrCvTLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMSBTYWx0ZWRfXxgdF6gIHRhPn
 1KaHB0nowoj4uifJvYdhHV1p6TCAc9JgBIRdbys0plR2iNs3AtwmVOB5PddyW6i6ak3peV+gfCP
 OZQHSEpst/koOUTV6TORihCnoWj/GD9MiISIQo3q9KuTPCjt2P7jPVuLO3vA/PU5F8OESI23VZZ
 WNJd9mnGgQb49U4eEL/6Eidw3EZqJAndeA3zjQqNWVq+W1X5zdQqsaDIAwKLW24Dr1sKL/IVOvK
 4V3iFx9Of+2mDpa0VWqZEA9F7Eb0UF8YZTA1MOvz7fd7wA7ynhOCTmrxYf91Gd/6xbUgc1tZrW8
 6ZbhuqsJQE0s0pdMtARmgE9mMdwX7vOyR2iggLCNcEyTaPrLENYNplFDKzJ8Hc0jTDs/Eqy5/Ib
 RtwE3Er6xkYdYYhDM+OXGgqphZFyLAyDjhX7awjybhmbAYczKgTtpMHM3b6KxtSncz8YncCadsq
 Dbu4+OVydHcE8rc3QwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27ABD5B3F48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 2:02 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 01:49:50PM +0200, Konrad Dybcio wrote:
>> On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
>>> Currently the driver only updates the EDID when it detects a connected
>>> monitor, which results in the connector still listing outdated modes
>>> even after the display is unplugged. Set connector's EDID to NULL on
>>> unplug to clear the list of modes.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 8 ++++++++
>>>  drivers/gpu/drm/msm/dp/dp_panel.h   | 2 ++
>>>  3 files changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index 0a38957ea901..5c6a24ec140d 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -447,6 +447,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
>>>  		return 0;
>>>  	}
>>>  
>>> +	/* Don't forget modes for eDP */
>>> +	if (!dp->msm_dp_display.is_edp)
>>> +		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);
>>
>> Is there a change some ""funny"" panels decide to output a new EDID blob
>> after a "proper"/custom reset sequence (e.g. to remove limitations
>> presented to the DPTX at the UEFI display init stage?)
> 
> The panels don't know if it is a UEFI init or a normal reset. EDID
> changes require a long HPD pulse anyway.

I was wondering about the possibility of the panels effectively having
a side-channel for absolutely proprietary configuration. But your last
sentence makes me believe even that shouldn't be an issue

Konrad

