Return-Path: <linux-arm-msm+bounces-110747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICc+FjuQHmpTlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:11:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9AD62A42F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 352843047BFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FB43BE147;
	Tue,  2 Jun 2026 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dcstd8YE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/WUvgZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4613BD659
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387444; cv=none; b=h4ZqQZBvqQ8Khpa1vOAyzClHpG4aKaebYIfNDqwVoJL1WN1UisHTZkrg4cHDnei1eL4XS7L0mqVZp+XYKMfBTqQTv52lYTwllFxj8xkXGeUiHYn5e4pSpbu9jErTddZ2KQJU25B5cQHhgSI1Onv1ZPuqVAkJM8Bpiobd08xaJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387444; c=relaxed/simple;
	bh=wHWYPBwxS5QefgBslkuOUMYQXZfZ49Dl7VJsokb1Hi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ndua/LSzwoK8p4YOr+DdEo0gDCumgkrpoaWGVzpzY2179r9gwg4iEJR9aTVTXwN6GasfSlxjZ45FzANkripR36/Z4vDSybwg0NKml3JE7TDkbakTiqHb1V+KWyuoWx0fVRFqaBxC40jUl7dPVZ2k0YNS735NdDJ3Khl/oVJVNKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dcstd8YE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/WUvgZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526KxuK2884681
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 08:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B703hGO+RaNSrRMp5DLHVw+od/NRHRIOECEIiojPEEo=; b=Dcstd8YEf4gFzfFd
	IlwVlkBiyz+1iAW6IxNSrYNQQUtCD9rrbbAtFq0rgdc00H9CfBre1YkYCoaSfihF
	2Ia4HRJ63VFfhoztv4wy1oBZZ0umAhXpTdCHAjoqD3CsXvDCLCtGQsc1v+r5zhnu
	ZhcBUJuQg8GmxsZj9IRIWny1IB0cDXX15i/oELJbA26y8TfjS7//6uSdEk9rmKrA
	UyKb8aUjxzLiVOeqx3gYh1q1shkxnJpSk7Bm43OwKKS4e8aJGt7gHdPuTO+NYz0z
	Cs2Ubbqsyf8Oz2PS4CnwonISLvxFOuXf9ahMBIPaQXD0P/VOwRwmdk/MjpU2PB+P
	9JTdVA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu10da5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:04:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a329928dso2697860a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387441; x=1780992241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B703hGO+RaNSrRMp5DLHVw+od/NRHRIOECEIiojPEEo=;
        b=Z/WUvgZd+wz96PjjXzjS4XkhvKaWnLl54s2PPqEJrQiWIpczPOnUviym5K7qgUjTDK
         /oGPHCwsiIS4yy7Sc6uG7GBX2d9RvVZwP7u0irNyfmse6gb5xrBcz2DMafCtYBOqaDex
         LNHfFmV056CURp9wo01kCWuXvIJ0FBp/IH6JkqZ9jpYTvuIYSYr35Ms7+lUyRSdKCyzj
         UusCz+c9z6D7JLZnqV5f+7W8fPKXSIsTpov+2S2ICxn92bIU1jNQxtjVyNMvsyQkoEZW
         yviIURKVKNqT3jaH6tDX1HgvHmScdyOfnKs8+P4pTlyHDaVdO8XGJjjqvJGQJ0eGN3zJ
         yi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387441; x=1780992241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B703hGO+RaNSrRMp5DLHVw+od/NRHRIOECEIiojPEEo=;
        b=FyZIV0Zm6wFtrgVMqPqxk/pNlezMAd/kWjo5Jv2q7p7+6gqzXv1h6MGiaBbC1uhgHm
         TGcKZcr5p6JJgv0ZHg4y1XTuQVl1MulTuycFQp548ldVQQtwh9ZaEDZp0BgL03C8TZQf
         aKXNFIpsWZyPRnCOzt9/BdXeg8Qr8xiFSsVHd7qN9zftlPgXNw8XNoYzaseYF8T7pWst
         6pH+jRSLNncEqcLpv/vcY8zFXOATUAJFBLsO+8/lYukI5ITNkpqpCYHiaOAkCutVcKmV
         mVEdCaoL+uHYBUuhhxkQFLo/rw5AJwEZGQ86IgJTKIvpfmYzRLcUIcRev+hp78YYgrI8
         GmqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gmrbqcald7iZZkRGCQYtieVPhw56FYOFOWVb52HEulyPCvrHjNyGvkziI+4llrf5lajOS36HUHzdbsbx9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGo3TDEGf+bweUEVJjJvfgIthv403GrYCa8JpLnCagV2q0kBh
	U5+7FpKc5x8Ou9a+mG2z7X7VqjTcqYFkdge4E33pBqAOqTgxhRpJWZYnvZjGF+ZWjYoc4+hD71n
	e17KFk+OjT9Kx/0AGJe243oGMyT2aVZ+G3AnOaU3aiEoP2yrAvt1DWRVgwHsyEAkjWjFE
X-Gm-Gg: Acq92OGUbaTUE3iLqRGYJKg7qOfiwU1zMFhF/Hrq1H3ArPWYTrsHnuG6+oVQFdkpAr0
	lnwfgZR/5eiHRMLc84jB9vtPQiwt3hoCSJZX82OsAxK4tOV3HcOXk3OI1gF2RQ+haGt9nMcSsr0
	ZLaN4GDfmNQM9ONPidx9y6alGF/wDyJ2aPz3gQK58yyJ6pi7k4oqVh3lv02Z5D1/KvMOwGTU3WH
	Nky1G3hVKNaEnbdvoYJvtRkE3Ph5LlRY+zeU+wukFcRkmLGqSv1GP3Qijz2Je6PevUVBW2x7Pst
	TflqEkLFlKAJP8nyDS610FswwL5yeeV4FhPXaiUtKneswCY8DddxVkgGvIhxN1ab/hwxyYSjqoG
	SDgpt3P7SGiDKerUj1vV+3f+0blpfzgjw4U4pj7Bgw2a+jXTJCv/q+S53DGPQ6AodR6CnENx4XC
	SAuG4kz6A/wrMr0L2G2MpYQGi/L04=
X-Received: by 2002:a05:6a21:6b8b:b0:3b3:298:a063 with SMTP id adf61e73a8af0-3b427f50ca0mr15597590637.38.1780387441409;
        Tue, 02 Jun 2026 01:04:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b8b:b0:3b3:298:a063 with SMTP id adf61e73a8af0-3b427f50ca0mr15597547637.38.1780387440965;
        Tue, 02 Jun 2026 01:04:00 -0700 (PDT)
Received: from [10.133.33.92] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771d367esm11645229a12.11.2026.06.02.01.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 01:04:00 -0700 (PDT)
Message-ID: <ebf6693a-46ed-4a8b-b190-da8663d668a1@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:03:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
 <20260528-dp_mstclean-v5-10-a9221c1f1f3b@oss.qualcomm.com>
 <mar2smjimo3uoucxctofmjd25vsfun66m3l6i4prnyvo3z7dzg@7e565usiluvq>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <mar2smjimo3uoucxctofmjd25vsfun66m3l6i4prnyvo3z7dzg@7e565usiluvq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s7FhneKabYb2PAGDiU0SrXFXx3UFoUSs
X-Proofpoint-GUID: s7FhneKabYb2PAGDiU0SrXFXx3UFoUSs
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1e8e72 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EvH9m4XvAzKA_BOLlAYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NCBTYWx0ZWRfX9QRB1orDLd2N
 F0BHPSSzjyqduLKnO+Y6KFKba/l1earBU1cRn53yC2P+c9dMrRl0Ds4x5W0UcXWoONyVtBVN7JI
 t7vOJ1ICgJXEyPBy7xiPj/T4kK89gbafnxAfH0i6Cd2jd1CSt7bToBNFiUYgDnXnG+BCxBl0XrP
 4aRB917GmTehAeoGr8HmY6Fr1Yxkp6kDpNeOQ95ZbSe1qvWtrb6foGZHbSGe9/SJAAlskVg7WNs
 namHDT09o99fKe6kEUH6GtpljXobz7s9VkvQeegwSpilToHauXx20TA87iOABviE44Vjl+iO6V7
 S/zHLnMlaTxxNWt0qnjcvN6drB5lLWgXk/BltuVzhwYolCHJtjEvqRseekufP8uQO2pOm0Ya7Ld
 ss7BlxpwMmOIbG8/RrGKoqkHoKt4WA/BoLssmxlN4QR4JPMISVQfkfmBfelKrJq92q/dXBQziED
 AhNSRdKMZ4w6DI1+aYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF9AD62A42F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/28/2026 11:25 PM, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 06:40:31PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> With MST, multiple sinks share a single DP controller, so a cached
>> panel in msm_dp_ctrl_private can no longer represent the per-stream
>> sink. Drop the cache and pass panel explicitly to all stream-related
>> dp_ctrl APIs.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 208 ++++++++++++++++++++----------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 +++--
>>   drivers/gpu/drm/msm/dp/dp_display.c |  24 ++---
>>   3 files changed, 146 insertions(+), 114 deletions(-)
>>
>> @@ -389,7 +389,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>   }
>>   
>>   static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>> -					    struct msm_dp_panel *msm_dp_panel)
>> +					    struct msm_dp_panel *panel)
> 
> Please don't mix sensible changes with the renames / cleanups.
> 
Got it, thanks, will fix it next patch.
>>   {
>>   	u32 config = 0, tbd;
>>   
> 


