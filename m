Return-Path: <linux-arm-msm+bounces-100902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPBUB1TeymmgAwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:34:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FE1360FB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 623CC3010213
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE95375ABD;
	Mon, 30 Mar 2026 20:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRs6zXdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtYqH/cX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEEE2BE7DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902860; cv=none; b=KxKiCWQ2kxCYNe8lWRSG7hKqI96u4cuf1sq4jFJLssq0IIg3oMp1h/fEK8BoyYNuGSrHDnboTDdLMSAhTd/P8lWAuYCOi4DZx7gL+ZOhZQSZqdX8zmK44mVYPfMAPkxlWz+LdDR2MUTekoJ5fDvfMGMP7+QScPrgcSIp8A/33Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902860; c=relaxed/simple;
	bh=mgyZa6+VAXUFf65uhiIQnesnscUgiwTJgUzZl/hgqo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnkZljy8wcgH79cIyBdSq5wI53li9S1SWVp5OUnJmanRgchKB/otUtKXTb3ttZg2i9JIBM+eMBABj1atdfjjbOYFVK4KoykzrtimFPF9iyQtjBjQsFt7UXow40XBP3knotYDlXChhhZVLvfhW9DpUeZ9M9b8GLL9P/QWzml4oOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRs6zXdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtYqH/cX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UHQrIP703490
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGvHmo/XuIHKu6RSmajSbZfGYuTsJcvqIRS6kB5ctsw=; b=YRs6zXdVjv4lA3Vb
	4ZSgQmNHGhNNi1t/Hcu8pBkwxkhBjx5QGgAiMlD7EEQ3ooSVV/98KWcJ0DL505f5
	ynQGDMBwWu5eMso83EOU1AzqwQmpKZfhJj7pLeX4RYMlPlvfWEzZ62kbw3BwdzGM
	Yus3vr11v4lJIWG/I6P1m9kV6iCz1DLyidaUyynFuwszY3JIOmXGud4JSmjPuq6Y
	hqRrmeQcQarCnDnHCFRAQW71EsBgCuO6NupRhVpAa9K3er95fpzk56S6fcNUNIlv
	q+mydM2aFAFiho8Ni04BD29VyfVycK/tLuhU2fYWYLqwyuDqwmF+nTCrn1y/qnqC
	4em6AA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansutw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:34:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so1795843a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774902857; x=1775507657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGvHmo/XuIHKu6RSmajSbZfGYuTsJcvqIRS6kB5ctsw=;
        b=gtYqH/cXru9Enm2N79ggB4dFOf8TgK7HIrazkqVYBi9iWXU8B/l9+FKqGXgVnfCgMJ
         ZMj2mNO7jmsHqwijXSTsskyVo2769pqzUjYWkFmqdJYuDTP9aTnABbqolCAndeFexYT2
         m1QXmElgVa97m5ATDyOGtbLRLGU9zjfqbAcbb0jw72xLNPbEocduvsVkx05w5AtJzCAk
         uA5L3intGsQR8nJXZuBAhA+c2lGewYnptSgUA3wXhHPKQnsQ7T9euYYtK3fa031sAa/c
         WcpanPguJUAZasYgKOgpr2RhcihFtlqYzKmkEWq6F99wBBIFr6fFGaU8xiR1tzGooh71
         HQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902857; x=1775507657;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGvHmo/XuIHKu6RSmajSbZfGYuTsJcvqIRS6kB5ctsw=;
        b=K6KrWCuUE0z57NWbS1YaY8zOLpZOi2ELqz/IxKOk3UIyaJVTPfdFfJkuLWvLxSEaJG
         tev80wpYJ9h9wlhpDDaAs8Wey2x/DtTF+1k4HoTzqqrcMkuDg1twWXeBWYXm7VDqLv1X
         4hS7+uM9IDVfortOE2Wi3L7gwHgIiilZTePbi4Bw3NvtNcWn90TOxigyjEUfTWNr4vZ6
         eoIGVQsR+M2eMt9KIbbJzcB8f2z5PL1hU8xkvOHCaYQ58Msp9mVuXVG0xL4DsJlDiz4k
         /y8rsduBL93khzLbySGC+X3SkfX9KSjafKhdYvv4w3e0Y0nnjAPS+VM3UZtOCRfawfhq
         NcTQ==
X-Gm-Message-State: AOJu0YzexOJkylkGu0NsgY7vZCm644eYvQYGgP2126/wUffq6dmj3eRE
	kh18Gnq9M/RrouLnRlzOhg6CLlxC2/wOwBqIZpG3p8ZFH68zQPw4GcrBevkNTg9q9h7jsHHrdzl
	aznmOCI+rACEiW9WJXegZ2Y3qCX2RlKDcj8yN2fGkxI8p6a8kvR6LPCj3jDDJ5NNutmDC
X-Gm-Gg: ATEYQzz5RGXwegvXt3rH5bPUf5+nefA6Ew0GwgccRG0s8mZsZ4g8MW1kSDXGBjAvJ61
	w7swuwSdUARtjQWpdlHY9Oibn6A+McqnfPO3xiFnUnUpSQqIa7V2Zg2p9HQJ6oM1vr1YlTs4RR8
	GQlXk1D744sGKyuyuqhku+furr55KeHgeFqnrPyM9Kr1qzIypbvn8AxD2uhFVzoiVAFRbyvQlvk
	qXcDub1OqA/RQ964wxDOdVvQlDgZUuSHakxWBusMkCFtN99ismS3NBecBHj7o0lkMFyCrIWLHFu
	h47fPMsNm3YtEI1wXdOEBAaB8NMOxdFSF0UMamzqNS1haTgn9Hw5k7WpdM9ST/kXuEd0XNY4aig
	rrTh+nJ5LZsZhNNqQwZuR5Hr4Y1hTRxoOB8P55H12wWx1
X-Received: by 2002:a17:90b:1d11:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-35c2ff6afecmr12444982a91.8.1774902856887;
        Mon, 30 Mar 2026 13:34:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1d11:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-35c2ff6afecmr12444951a91.8.1774902856401;
        Mon, 30 Mar 2026 13:34:16 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35daaf2a70dsm3488317a91.11.2026.03.30.13.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:34:15 -0700 (PDT)
Message-ID: <1aa49c9c-279d-421e-879f-d0d93728841b@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:04:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] drm/msm/a8xx: Implement IFPC support for A840
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-14-2b53c38d2101@oss.qualcomm.com>
 <b9f8d016-e22c-45ed-a50e-51e18f5d6e6d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b9f8d016-e22c-45ed-a50e-51e18f5d6e6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: StnyVXHH31QtC9OYsTl9AIywOGFHlMPQ
X-Proofpoint-ORIG-GUID: StnyVXHH31QtC9OYsTl9AIywOGFHlMPQ
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cade49 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=khfaMGtS6DP7kCttXrYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3MiBTYWx0ZWRfX1xItxFM1nVSj
 TKf1Hhq39+tGxLDNksauPnjKvmZ7SvjoQCxvWh1Qse9kVuRh55q2+qQfkPR1aI1gkj59rHcW1Dp
 8tL6cyo3645EneLjmcSWiB+1VEOO8IyaT7pRcjBxlUz0Nq9plrvkfyxS8CvTm3D/Qsa7Aev5CC0
 Wz85EwxRfaHqpUeRctbceCMTDOVxkFsyergxZnqcYQkDkAvuStQWIBjMR/hPmTIGdjaaiA4+Dhb
 +P8ZxxT4ze4SdOa74Ra+HsjjzZrviLBy545ZtYYaziCfA156j+ccT3TJtqheKltAz5WG5uQS6V7
 0HydpWVFv4fK2u+P/k3i/0munkCSilZZiWVRbTWSPWZGa9cf0DYtQZJNjGcZwouiWE7bOxbSP6t
 Iw2R1sAgJ2Tw/cusDcaVCwJo04w9k9n2xvfDDtUdLoWA84awis8CwG3EB3y9LrwguixsNKEfVIw
 rJJp89iyl1ST8fwE0sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100902-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27FE1360FB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 4:37 PM, Konrad Dybcio wrote:
> On 3/27/26 1:14 AM, Akhil P Oommen wrote:
>> Implement pwrup reglist support and add the necessary register
>> configurations to enable IFPC support on A840
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	REG_A8XX_CP_PROTECT_GLOBAL(51),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(52),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(53),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(54),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(55),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(56),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(57),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(58),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(59),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(60),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(61),
>> +	REG_A8XX_CP_PROTECT_GLOBAL(62),
> 
> 53..62 aren't listed by kgsl, but I suppose this is more robust
> 
> Similarly for:
> 
> SP_CHICKEN_BITS_4
> RBBM_PERFCTR_CNTL

I can see SP_CHICKEN_BITS_4 in the recent kgsl code. RBBM_PERFCTR_CNTL
is required as we don't handle perfcounter management in this driver yet.

> 
> The other reglists look OK
> 
> [...]
> 
>> +	for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
>> +		for (i = 0; i < dyn_pwrup_reglist->count; i++) {
>> +			if (!(dyn_pwrup_reglist->regs[i].pipe & BIT(pipe_id)))
>> +				continue;
>> +			*dest++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe_id);
>> +			*dest++ = dyn_pwrup_reglist->regs[i].offset;
>> +			*dest++ = a8xx_read_pipe_slice(gpu,
>> +						       pipe_id,
>> +						       a8xx_get_first_slice(a6xx_gpu),
> 
> IDK if the compiler is smart enough to pick it up itself, but
> you could do const u32 first_slice = a8xx.. beforehand to save a
> couple cycles

This code is not called frequent enough to worry about micro optimizations.

> 
> [...]
> 
>> +	if (!a6xx_gpu->pwrup_reglist_emitted) {
>> +		a8xx_patch_pwrup_reglist(gpu);
>> +		a6xx_gpu->pwrup_reglist_emitted = true;
> 
> Would this flag be better set in the function above?

Agree, but we should update a6xx_gpu.c too. Lets do that separately.

-Akhil.

> 
> Konrad


