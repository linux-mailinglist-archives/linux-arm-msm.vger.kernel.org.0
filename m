Return-Path: <linux-arm-msm+bounces-94297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA/yHaRNoGnvhwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:41:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE73F1A6CF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A3C43124B8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D7A36402F;
	Thu, 26 Feb 2026 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea09rAuf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeNVU4tS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50C12D7DF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112961; cv=none; b=YWKLsNKbfp6epHw5rVdWDMYqJZJyYYsGoTxlnE0rriSZQKJhC5Eyu6oqNgu7N36Yg3X07C+sdkskiMGsK8bVcdZzQtULLLv4Jb/+znFxuUrD44Gd0kfQfKUT3wy7zUAvzlHA/ITkT9eBtA2baM6ez6U6cej/EEwm1Xf+snpD5Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112961; c=relaxed/simple;
	bh=dfp57Wh7NygrlbAmtuE1trvXXicq9uTT2x5859/wlj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnvT/TwQ09Ddq7YKyZwTJJ4Q+FAsTTiTNnWrUBC9CAR6M2V5B23Lu5SmjHLpne8fUSsnkug3Dy7BjMXKrU1ROr+1R4xZ7qh4/Batd6Gq8Mjy/N+bbvIm4cICTiCjyIbS4mwdFRcUiiSZbpCLzqNXcp44IwZyMBkFlbObSSDfpQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea09rAuf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeNVU4tS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKi9v287800
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DS2CxEyTgthuGQAVEtlYxEVVfe8xEdQStYBbw5wclOI=; b=Ea09rAufso4PE63R
	c9tJcD9lzTBGPzZVxa35/fpMuphM+jvxULuB3yEpMdpnSAkq0X5HfZs4Avjbr4DZ
	AngN5q+gWk+8PbXIsX1NPX6vFRnVedlL86eQ5xrWq36rFfgfxYtzWo1Bt9ic7CNk
	Jv1C/eZ1ngLecugaK/NgJcr0tgoS2R//ItkSHpbLuA4fCJ8VKjiLosgdLN0uAU38
	0PI6UH7ygZOfKbGwjPJyHI2v4ZOe+8VTpF7sDAE41p6WwHd8qITqCXgWk7FGWniX
	IQQ7DR1JQVuCTuSeCVqeaZm8043sg36wxw2RqPV67pewWfCqIJSnJbuiEcojRuAs
	cZg0vg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u0h10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:35:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7177d4ab4so76273785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772112957; x=1772717757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DS2CxEyTgthuGQAVEtlYxEVVfe8xEdQStYBbw5wclOI=;
        b=GeNVU4tSSDu4lk4lSONP4glWHaXU887RH2+bl2VLVMxMBX2Qbzig+GgdWincrP5OCJ
         eW6JJmgZmNbFrOEGNgQhQ2vTafzQ9Qqc5XYM4NkIbPOY+HB/4kPav+X+Zy397KtP0Xe1
         2TqjCSzXLY2aab6uur2QbPJe3YEmQY8Su3vOXFn1c9hi1fC8id4piNq0jjjjoUvjG6Sr
         nh91VWsUxL7Ufo8zR2BJ84ggY+ITgwoSmhGCrupIRGS6PoTCOxXe3/51JGpQjBujA7nn
         qnndyYgx9S3v9l8x8UUt14342QgEBQfyBoG0ffYmg8N3M+iw7lyc1w+wsiPMQDBul4ov
         wMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772112957; x=1772717757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DS2CxEyTgthuGQAVEtlYxEVVfe8xEdQStYBbw5wclOI=;
        b=h+hLu140PBL/aRX+v7ar1tDhDtrvFbhg9hYuQSJm9jt0xePoATxBC7EGfwQooCZ4tO
         8ktXZtT/VqySkS91hfSFZuA+XPyOgNH4DSmJe0Fazycq7CJgxe6nn1ltr6N5oC09NT5Q
         5aZra9UG9LXvmVbSmOgvy5KYwxjpjAVF8L9ZBBVyYnrIkrLaSHlOf1IjVkr0e92GVi4V
         BjpOsqu70TKPf9/D9+AiCYr+HLwPEHIHawvuN7PLhJS1HPldc6m5QxvXWlRF2wR+o4sH
         IidzN+Xpm2vx9uAS5YcsBMw8aY6N1CwZd6y+XdNr0VTihs/4aQkeubfiHAKi6Hu7AEQN
         4hIg==
X-Forwarded-Encrypted: i=1; AJvYcCXSQsIdOWh/ijDjq7+zXVAiCJQC7vvN99HYNAYbIg4u+hDQ95vzJLb8Z1iiVp1hl4yEXlA3wOpMCr5FCIAv@vger.kernel.org
X-Gm-Message-State: AOJu0YwHWjYmGFILZFmYIssi6y+LA3hwCuZ4Njlpb01Bunvn1Nbnho0P
	jm5d0y8Ry5dblTPq0sITFZtZaVP9zvFEbTpPHIdVFLJL6I9yDSxGML+1o99O9d9OWnUpelZwtCE
	7k03VkDx3vbZ7kwzcgHAlTx30PeovFeSw8aNpiWx/HIl+k+S4tBg8X4Dfie8qbrJWOQkl
X-Gm-Gg: ATEYQzzGC5Lj43cqGuJjUxyq7W5LY3VXbzNKlU2akk1NjAZcYYCZZId8sqZBqcsq77+
	7ZFHDDqM+c4hdK2wCiCHXdeZB6O95p9TGpevh7pTSjFv1kn26RP6RZ5jGXbjxAqUwZZAIQfsHHr
	sL49wIlJALvfqBLvjjfEPNDRDRChHLwNgbM7Z79BLQpT1vgUAFEsOocBFXt+eAfM2yzWODF+MxK
	zkCrzosSpW474qRIZa3AS4j5uO7zufavr0XP/l1r/dIfQ2Tj+dYyqK79d5XWEEUuG7SKLA1NkU3
	UkOBzb9V2S6QQfL9AXlzzNfn83jc1klSpgj7mer9Nvm4BFVkpR+EmLB+PUITodHUPbPWUNcDXOS
	coYI2gr71ozW9RaCfhPmoPloDx41bGKcDA5MhK9dy7Zh2JuVg6HEPvpJqkBq7CHtCH4PeSAFAbL
	1LxmY=
X-Received: by 2002:a05:620a:4093:b0:8cb:71e3:242c with SMTP id af79cd13be357-8cb8ca936bamr1771696785a.8.1772112956878;
        Thu, 26 Feb 2026 05:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:4093:b0:8cb:71e3:242c with SMTP id af79cd13be357-8cb8ca936bamr1771692885a.8.1772112956297;
        Thu, 26 Feb 2026 05:35:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13540sm56921666b.11.2026.02.26.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:35:55 -0800 (PST)
Message-ID: <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEyMyBTYWx0ZWRfX4cZBwi2iJ3/e
 WZt/7ZgNGe58TZWH2qKkW9paFA05FUlpSvr9Z6uYpPdKCrWq1ebVpkENmjztUr9takYkZ94epzB
 wtWjjxKkVdvTC+GElo4F/6wsmBhZF5SwsQSThKMQbh3TUENKrBop2ZEeympmAtV8WY0rj4fzJxl
 WSoejFqbrPTIRIIDqpL7V+/17FOwPE3AWtl5HGbPGyf4Rp+s7Qnfq+rMdoh2b2uEloZiDeRN/hX
 mdyJaLneSxtgEAZ0GMmzN07TGnoItnkwxU056ZNSoRL7GhHoJwvPXv3czUnduVs43Xm73RZwQ4F
 GOIoFL/xv4axcpVmEsoyz6ttfTnkYNcBNygNeMPDnyO5qc32XJU2iNBnGlY2XeOLE0ONpmBMuDl
 twb1br45Dfi8oLEvGl8c+c0rqHNI4X+qtybqYBO0tgnr0/KOqFBa//JCiJqFWDUeB5DCzSR0ysx
 VoKSJD4qZFQBrvve89Q==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a04c3d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JKcAygG6zsn5jYD1T1IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: D8gjs-J9G4mrHgUtW8S6z2DViK9osl4j
X-Proofpoint-GUID: D8gjs-J9G4mrHgUtW8S6z2DViK9osl4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94297-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE73F1A6CF9
X-Rspamd-Action: no action

On 1/12/26 9:25 AM, yuanjiey wrote:
> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>
>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>
>>>>> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
>>>>> the MMCX rail to MIN_SVS while the core clock frequency remains at its
>>>>> original (highest) rate. When runtime resume re-enables the clock, this
>>>>> may result in a mismatch between the rail voltage and the clock rate.
>>>>>
>>>>> For example, in the DPU bind path, the sequence could be:
>>>>>   cpu0: dev_sync_state -> rpmhpd_sync_state
>>>>>   cpu1:                                     dpu_kms_hw_init
>>>>> timeline 0 ------------------------------------------------> t
>>>>>
>>>>> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
>>>>> to stay at the highest level. During dpu_kms_hw_init, calling
>>>>> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
>>>>> fall to MIN_SVS while the core clock is still at its maximum frequency.
>>>>
>>>> Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
>>>> doesn't do anything with clocks. I think we should have a call to
>>>> clk_disable_unprepare() before that and clk_prepare_enable() in the
>>>> resume path.
>>>
>>> I do check the backtrace on kaanapali:
>>>
>>> active_corner = 3 (MIN_SVS)
>>> rpmhpd_aggregate_corner+0x168/0x1d0
>>> rpmhpd_set_performance_state+0x84/0xd0
>>> _genpd_set_performance_state+0x50/0x198
>>> genpd_set_performance_state.isra.0+0xbc/0xdc
>>> genpd_dev_pm_set_performance_state+0x60/0xc4
>>> dev_pm_domain_set_performance_state+0x24/0x3c
>>> _set_opp+0x370/0x584
>>> dev_pm_opp_set_rate+0x258/0x2b4
>>> dpu_runtime_suspend+0x50/0x11c [msm]
>>> pm_generic_runtime_suspend+0x2c/0x44
>>> genpd_runtime_suspend+0xac/0x2d0
>>> __rpm_callback+0x48/0x19c
>>> rpm_callback+0x74/0x80
>>> rpm_suspend+0x108/0x588
>>> rpm_idle+0xe8/0x190
>>> __pm_runtime_idle+0x50/0x94
>>> dpu_kms_hw_init+0x3a0/0x4a8
>>>
>>> dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
>>> And freq MDP: 650MHz
>>>
>>>
>>> And I try change the order:
>>> from:
>>>         dev_pm_opp_set_rate(dev, 0);
>>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>>> to:
>>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>>>         dev_pm_opp_set_rate(dev, 0);
>>>
>>> But the issue is still here.
>>
>> But which clock is still demanding higher MMCX voltage? All DPU clocks
>> should be turned off at this point.
> Yes, no DPU clock demand higher MMCX voltage here. But next time pm_runtime_get_sync
> need higher MMCX voltagei due to high freq.
>  
>>>
>>>
>>>>> When the power is re-enabled, only the clock is enabled, leading to a
>>>>> situation where the MMCX rail is at MIN_SVS but the core clock is at its
>>>>> highest rate. In this state, the rail cannot sustain the clock rate,
>>>>> which may cause instability or system crash.
>>>>>
>>>>> Fix this by setting the corresponding OPP corner during both power-on
>>>>> and power-off sequences to ensure proper alignment of rail voltage and
>>>>> clock frequency.
>>>>>
>>>>> Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
>>>>>
>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>
>>>> No empty lines between the tags. Also please cc stable.
>>>
>>> Sure, will fix.
>>>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
>>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
>>>>>  2 files changed, 15 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> index 0623f1dbed97..c31488335f2b 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
>>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>>>>     struct dev_pm_opp *opp;
>>>>>     int ret = 0;
>>>>> -   unsigned long max_freq = ULONG_MAX;
>>>>> +   dpu_kms->max_freq = ULONG_MAX;
>>>>> +   dpu_kms->min_freq = 0;
>>>>>
>>>>> -   opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
>>>>> +   opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
>>>>> +   if (!IS_ERR(opp))
>>>>> +           dev_pm_opp_put(opp);
>>>>> +
>>>>> +   opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
>>>>>     if (!IS_ERR(opp))
>>>>>             dev_pm_opp_put(opp);
>>>>>
>>>>> @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>>>>>     struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>>>>
>>>>> -   /* Drop the performance state vote */
>>>>> -   dev_pm_opp_set_rate(dev, 0);
>>>>> +   /* adjust the performance state vote to low performance state */
>>>>> +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
>>>>
>>>> Here min_freq is the minumum working frequency, which will keep it
>>>> ticking at a high frequency.  I think we are supposed to turn it off
>>>> (well, switch to XO). Would it be enough to swap these two lines
>>>> instead?
>>>
>>> Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
>>> disable clk is OK.
>>> we can drop change here.
>>>
>>>>>     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>>>>>
>>>>>     for (i = 0; i < dpu_kms->num_paths; i++)
>>>>> @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>>>>>     struct drm_device *ddev;
>>>>>
>>>>>     ddev = dpu_kms->dev;
>>>>> +   /* adjust the performance state vote to high performance state */
>>>>> +   if (dpu_kms->max_freq != ULONG_MAX)
>>>>> +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
>>>>
>>>> This one should not be necessary, we should be setting the performance
>>>> point while comitting the DRM state.
>>>
>>> No, issue is during dpu binding path. And in msm_drm_kms_init driver just
>>> pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
>>> But We do not set the appropriate OPP each time the power is enabled.
>>> As a result, a situation may occur where the rail stays at MIN_SVS while the
>>> MDP is running at a high frequency.
>>
>> Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().
> 
> During dpu_kms_hw_init and msm_drm_kms_init and msm_drm_kms_post_init.
> 
> There are multiple places where pm_runtime_get_sync(pm_runtime_resume_and_get)and pm_runtime_put_sync are called.
> And each time after pm_runtime_get_sync(pm_runtime_resume_and_get) will access register depond on MDP clk.
> 
> Do I need to add dev_pm_opp_set_rate after every pm_runtime_get_sync and pm_runtime_resume_and_get?

So I took another look at this thread and I think the correct resolution
here would be to stop calling dev_pm_opp_set_rate(dev, 0) altogether if
the clock is getting disabled, since the PM APIs seem to take care of
removing the vote during runtime suspend:

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 61d7e65469b3..ddc6aeae8f55 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1462,7 +1462,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
        struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
        /* Drop the performance state vote */
-       dev_pm_opp_set_rate(dev, 0);
+       pr_err("!!!! SUSPENDING DPU\n");
        clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
        for (i = 0; i < dpu_kms->num_paths; i++)


[root@sc8280xp-crd ~]# XDG_RUNTIME_DIR=/run/user/1000 DISPLAY=:0 xset dpms force off
[  163.099585] [drm:dpu_runtime_suspend:1465] !!!! SUSPENDING DPU
[root@sc8280xp-crd ~]# grep ^ /sys/kernel/debug/pm_genpd/mmcx/*
/sys/kernel/debug/pm_genpd/mmcx/active_time:159146 ms
/sys/kernel/debug/pm_genpd/mmcx/current_state:off-0
/sys/kernel/debug/pm_genpd/mmcx/devices:ad00000.clock-controller
/sys/kernel/debug/pm_genpd/mmcx/devices:af00000.clock-controller
/sys/kernel/debug/pm_genpd/mmcx/devices:ae01000.display-controller
/sys/kernel/debug/pm_genpd/mmcx/devices:aea0000.displayport-controller
/sys/kernel/debug/pm_genpd/mmcx/devices:ae90000.displayport-controller
/sys/kernel/debug/pm_genpd/mmcx/devices:ae98000.displayport-controller
/sys/kernel/debug/pm_genpd/mmcx/idle_states:State  Time(ms)       Usage      Rejected   Above      Below      S2idle
/sys/kernel/debug/pm_genpd/mmcx/idle_states:S0     67845          3          0          0          0          0
/sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:State  Latency(us)  Residency(us)  Name
/sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:S0     0            0              N/A
/sys/kernel/debug/pm_genpd/mmcx/perf_state:0
/sys/kernel/debug/pm_genpd/mmcx/sub_domains:titan_top_gdsc
/sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_gdsc
/sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_int2_gdsc
/sys/kernel/debug/pm_genpd/mmcx/total_idle_time:67846 ms

(and the correct vote comes back up as the DPU resumes)

At the same time, we *do* need to ensure the correct level is set *before*
clk_prepare_enable and any set_rate operations (the latter is already done
via dev_pm_opp_set_rate())

clk_prepare_enable() happens in:
	msm_mdss.c : msm_mdss_enable()
	dpu_kms.c : dpu_runtime_resume()

(they refer to two disjoint sets of clocks but both cases need the fix)

I think the easiest solution in the MDP case would be to set the clocks to
the highest available OPP (lowest or *any* would work too, but going turbo
seems like it's going to give us a stronger foundation for adopting
cont_splash one day, avoiding potentially momentarily undervolting running
hw) during probe and count on these votes being adjusted either through
suspend (if unused) or to the actually needed frequency (via dpu_perf)

For MDSS, we're currently generally describing the MDSS_AHB clock, the
GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
table.. The GCC clock is sourced from (and scaled by) the NoC, but the
MDSS_AHB one seems to have 3 actually configurable performance points
that neither we nor seemingly the downstream driver seem to really care
about (i.e. both just treat it as on/off). If we need to scale it, we
should add an OPP table, if we don't, we should at least add required-opps.

The MDP4/MDP5 drivers are probably wrong too in this regard, but many
targets supported by these may not even have OPP tables and are generally
not super high priority for spending time on.. that can, I'd kick down the
road unless someone really wants to step up

Konrad

