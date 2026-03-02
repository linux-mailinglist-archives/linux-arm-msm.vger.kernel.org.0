Return-Path: <linux-arm-msm+bounces-94852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MxEOL5qpWkaAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:47:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCCC1D6C9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3F0308AF59
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682713382C9;
	Mon,  2 Mar 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gehtB3FB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fteU8HJc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB432ED2F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448127; cv=none; b=j5fyjmtIIh2pTz20Em3rnsejruuVTYgPKT0/cqC2v5X6BW2Umvcqy+FeZoajeax/nm8fuVRspgfa5WkiFXqbzEee+5ziJyv50PQw+9BUFs3tTundi28eE8akcNU8f72+ntsZmgqUq1+SRN+38XD6m9U5vm5cGMJd89/5R96gMG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448127; c=relaxed/simple;
	bh=bAe+izALw3+MTGbxw3vlzb4sKdgAftZ47r+NVh/UcNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6SS37194mbsBWKI5172zcq2HL2AU2FoGhSiI2/AhjLCHiJWXUxPhCRpHiQkJuoC8CWhCKGK1icvLr+C1by9BYI3B0Y/thR8kDOkG+VeV4ZHPOESiabSQ9qmmugdZ0NWBrhXmW4SVA/6TejziTIy+Fw6Ugz4J7wE04irTDiTkYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gehtB3FB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fteU8HJc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62287jrx3223985
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5oh1Y3E4ZRYRy45drg9tJ/H8Kljy9D160tvJTu3A5M=; b=gehtB3FB48mBjiiP
	qB2zbLDdWTGKmktVVGRoTWZHgUXMqyQN5EQC3AMsWy4m2hkA1ZDvTwlYxdP00SGL
	bilemr6YV5YirSHDQaKyy2toFpuH8xGNpsLgEeJVrzBpd4FKRrFlQldVzdsbOog8
	/upllLXqicWm4m1pOYzh1bZDAnsoBxvNwFi9HI4wIgV6zJ3iVzcun0H8hR2zt7zE
	XNj5tOXBomSDcTDNuiUtRXb3vdW3UnEgEdfwWWMu0Dnnl8z1XWGhvYO2vIiquDRF
	Hih/1iFRjTlDOXnuZob8c1QDQWrgHW9r0RxuThue/Kn4HE8Jzgb7LqIAXMA2XFHv
	3E+hXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1ht45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:42:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f6011df3so5656436d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448124; x=1773052924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5oh1Y3E4ZRYRy45drg9tJ/H8Kljy9D160tvJTu3A5M=;
        b=fteU8HJcBn4mBzd5fCqmALYBcLYg0xTAlSdR4WP8Jib/5MkgQLz612DXR0MpcydCqj
         TReNrvZh4b1Jetgii1lOn24V8QCj8w0rImIuIQoaTAexnCitX/9sZSHrfNMTgc66l/LC
         AMqu7pl23Y5bGrCHYlri9D1vijFyUpWia1JNBzerqZN3HrlLCwDpqYHNBE9ZtOVuRhwe
         ulcioLa9zwMCbA2ikkE/zh4PuA5uTnrLSyJnkjVb5qVd18dE1KWNT4Vkg6nhEnrebLcx
         cTibtzYLQTqffvAhdNYM+4oljArLNSv4wqcESljkUqtLQHdGLSGYjM2RvI3Kw4gtOP5x
         8mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448124; x=1773052924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5oh1Y3E4ZRYRy45drg9tJ/H8Kljy9D160tvJTu3A5M=;
        b=pdLOwmk5XW6BfZCHGRm2ynK7yNOxPas7eXfL5v6QPgX4dro5fjhkTVqEw/9fC3Qac/
         XEyRUX5PL1gmbf/EDfXIPTA/zjUVNV00A0PFnVmQUCC3hSLSCZQZa6RG9Liw6xJxAQDL
         oOymu5zz4b+tInK6F9OX6p7nhovPCbusaCizXRfekn90y7x1kTlrxV5pHe1gTMCBelRa
         fAkDmRg1rsYQn38XgsmheS8fDued59NP3RIQD6vd5NG9mWlBi4ZEP5Sd4gcZOzl4ukAm
         r8b45bYeaMuj3quFvKuMH/aJvzdZqQL7aQ9HSqgUx9ug7REtHNuz6/R4PwfF+Y8cckfh
         YMbA==
X-Forwarded-Encrypted: i=1; AJvYcCUBk9EU03ZwrOSMq1fPzJFy6c7RnLBlPz+ABYa5ieIy54KMmG498nadhs52Lh/BrlkQdqdwVv69eVMjnOYp@vger.kernel.org
X-Gm-Message-State: AOJu0YxAvHn0wW/p9jb85euqrDQTLDgYkuvA7AYZ0IrIrLNT+Yjaw7aE
	H6OzAsbVMJVb9f8YbF5Jdt+NDjPC/koUWOqk3ZBGkdJKoYUGMGq3jmHLgfqxYmISSzO0EYlWRxt
	QX2J/BtK/Sft5dpAzpoS42BmWgB8kn9xdQX4hSWRmYg2y2u01vc1pHFqMWzcMSCFwvjS8
X-Gm-Gg: ATEYQzyuAiWrAzNxVGLkUOnXfLT9QUwruwl5l7pD1UIoRvxZu2Sjp9BmMeMNncsNC6N
	ftKiU5IZ8qQd8qfOipuXoGRv4VPWM4IsPZM7zTjR3KrwAAJxCgdI4efcIetAdKqZwK4GYLNOiyx
	PtJHnl3ot6gqtM2ZrDf8vD1aGE7PXcZ+L9O52+6k2SVz6R9iL97jfW2sAGtNSDkVJuM3MAtoO/t
	ZHrpXAF9pb0myzG5jKOA3XiG4L283v2kifp+PmwEGwvIiwDtwTMVHoVTDef+PMSkE47P28MLLd5
	RycDCYS01qrg5L3V5elaoeSuFpIx1fsfKcGDO1k4oIZTVi2ZBxKgK7k0FnYxJJYb0XXtrXWeF4y
	1HyR78d++HQrHJI6AeOxS22zYEzRlYvKAbMWYKM0i6zmifEFIDvDRKDizgZCdYk3Bfb9prmE6Cg
	QGmfw=
X-Received: by 2002:a05:6214:4705:b0:899:bff4:af84 with SMTP id 6a1803df08f44-899d1ebc53cmr112436286d6.7.1772448123942;
        Mon, 02 Mar 2026 02:42:03 -0800 (PST)
X-Received: by 2002:a05:6214:4705:b0:899:bff4:af84 with SMTP id 6a1803df08f44-899d1ebc53cmr112435966d6.7.1772448123479;
        Mon, 02 Mar 2026 02:42:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae60c16sm455580666b.38.2026.03.02.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:42:02 -0800 (PST)
Message-ID: <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:41:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fRnFy0Gx1Jp4nrtrzO4H2ejtK40tm0Vw
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a5697d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GNz5de_MuxAREYx-QrcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: fRnFy0Gx1Jp4nrtrzO4H2ejtK40tm0Vw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NyBTYWx0ZWRfX1/zD+po1bxIO
 WTRupS/zUBxFqfsdDrytNaYfZp6u8lTdLKpAoqbmAlovx2SOgxSSrN962LYMBHp/M1RxJNwBmHD
 r0ZPwhd30fEpnPoqLWRQIpi5dQdHEbPIGKPL0j7vS9OuDLx1zz69bLhh/EUjifhtD80rPb1mFnh
 4lnnx1SniAZsGrUlIZyAKmiXiV0FdTw1tsjuTir6W/qwcXcu3bvMHEwIIAmp93ZYLuIy4JGLBUG
 f3RHPdPnk1bHezQB24lX1OJwm7aITCH5vNyIRCflZcwHyxJ1ir4Snd4P6bogdThu9gDuriAiB4a
 7LPKJGt6JjFXHqx9+vfB8t0X0KztN5MBccgPKswTkRB9oLO9ey4GSKNtAM9FBvdIaiLiWO+x+RJ
 KaY2m2BGtN/hzC1mDjySMirRlMq/LggLoQ3txWXn+NgcWeAnrB1lg93/5GXVwLIVgImd0ay1RZJ
 OffwjqaENkyqJPY/7+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-94852-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DCCC1D6C9C
X-Rspamd-Action: no action

On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> [...]
>>
>>> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
>>> dpu_runtime_suspend, then we should be able to also skip setting OPP
>>> corner in dpu_runtime_resume(), because the previously set corner should
>>> be viable until drm/msm driver commits new state / new modes.
>>
>> That matches my understanding.
>>
>>> The only important issue is to set the corner before starting up the
>>> DPU, where we already have code to set MDP_CLK to the max frequency.
>>>
>>> Which means, we only need to drop the dev_pm_set_rate call from the
>>> dpu_runtime_suspend().
>>
>> I concur.
>>
>>>> For MDSS, we're currently generally describing the MDSS_AHB clock, the
>>>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
>>>
>>> No. As far as I remember, MDP_CLK is necessary to access MDSS registers
>>> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
>>> platforms")), I don't remember if accessing HW_REV without MDP_CLK
>>> resulted in a zero reads or in a crash. At the same time it needs to be
>>> enabled to any rate, which means that for most of the operations
>>> msm_mdss.c can rely on DPU keeping the clock up and running.
>>>
>>>> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
>>>> MDSS_AHB one seems to have 3 actually configurable performance points
>>>> that neither we nor seemingly the downstream driver seem to really care
>>>> about (i.e. both just treat it as on/off). If we need to scale it, we
>>>> should add an OPP table, if we don't, we should at least add required-opps.
>>>
>>> I think, dispcc already has a minimal vote on the MMCX, which fulfill
>>> these needs.
>>
>> I have slightly mixed feelings, but I suppose that as we accepted Commit
>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
>> we can generally agree that it makes sense that calling genpd->on() actually
>> turns on the power indeed
>>
>> What I'm worried about is if the clock is pre-configured to run at a high
>> frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
>> and doesn't impact the state of M/N/D at a glance), we may get a brownout
>>
>> This rings the "downstream really did it better with putting clock dvfs states
>> into the clk driver" bell, but I suppose the way to fight this would be to
>> simply set_rate(fmax) there too..
>>
>> I attempted an experiment with pulling out the plug. MMCX enabled with the
>> AHB clock off results in a read-as-zero. I tried really hard to disable the
>> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
>> *really* can't just disable it" type behavior (verified with debugcc)
> 
> I think, in 8996 it was possible to disable it. Not sure about
> 8998/630/660.
> 
>>
>>
>> There's a possible race condition if we don't do it:
>>
>> ------- bootloader --------
>> configure display, mdp_clk=turbo
>> ------- linux -------------
>> load rpmhpd     |
>> load venus      |
>> set mmcx=lowsvs | mdp_clk is @ turbo
>>                 | brownout
>>                 | 
>>                 | <mdss would only probe here>
>>
>> *but* that should be made impossible because of .sync_state().
> 
> Yep, sync_state should prevent MMCX or CX from dropping under the boot
> level.
> 
>>
>> This may impact hacky setups like simplefb, but as the name implies,
>> that's hacky.
>>
>> Relying on .sync_state() however will not cover the case if the mdss
>> module is removed and re-inserted later, possibly with mmcx disabled
>> entirely but the clock not parked at a sufficiently low rate.
>>
>>
>> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
>> plug the MDP opp table into it and set_rate(fmax) during mdss init
> 
> And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> level even though DPU will change the clock freq.

That's a good point. Perhaps the easiest resolution will be to leave a
comment before the prepare_enable() explaining that this should have a
vote, but it's easier to rely on the providers' .sync_state() keeping them
online until the consumers fully probe.

[...]

> Let's go through them.
> 
> All SoC except those currently supported in DPU require SMP (shared
> memory pool) support to be ported from the MDP5 driver.
> 
> Most of the remaining platforms (except MSM8994/92) also had HW cursor
> implemented in a fancy way, in the LM rather than in a separate pipe.
> I'd really like to postpone those, possibly first completing migration
> of the other platforms and dropping support for them from MDP5.
> 
> 1.0  - old MSM8974
>        I'd rather not touch it, it had bugs and I don't have HW

I have reasons to believe msm8974 v1.0 never reached store shelves.
Let's remove this.

> 1.1  - MSM8x26
>        Probably Luca can better comment on it. Should be doable, but I
>        don't see upstream devices using display on it.

Because there's no iommu support for these

> 1.2  - MSM8974
>        I think it also had issues, no IOMMU support in upstream, etc.
> 1.3  - APQ8084
>        Had hw issues, no testing base, no MDSS in upstream DT
> 1.6  - MSM8916 / MSM8939
>        Can be done, low-hanging fruit for testing
> 1.7  - MSM8996
>        Supported in DPU
> 1.8  - MSM8936
>        No upsteram testing base

8936 is 39 with some CPUs fused off (unless you have info suggesting
otherwise)

> 1.9  - MSM8994
>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
> 1.10 - MSM8992
>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
> 1.11 - MSM8956 / 76
>        No complete display configurations upstream

+Marijn, is your computer museum still running?

> 1.14 - MSM8937
>        Supported in DPU
> 1.15 - MSM8917
>        Supported in DPU
> 1.16 - MSM8953
>        Supported in DPU
> 1.17 - QCS405
>        Zero testing base, no MDSS in upstream DT

No upstream MDP5 support either. And it doesn't seem like that SoC had
much uses that didn't end up with the thing glued shut..

> MSM8994/92 would have been an ideal testbeds for SMP testing, but...
> they mostly don't exist (please correct me if I'm wrong). Which means
> that the next viable targets are MSM8916, MSM8x26 and MSM8956/76. All of
> them require SMP support and don't make sense without cursor handling.

We can think about poking at some of these it one day, but certainly not
high prio..

Konrad

