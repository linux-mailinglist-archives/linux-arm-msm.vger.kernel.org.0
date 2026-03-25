Return-Path: <linux-arm-msm+bounces-99954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APBUFQ9YxGkCygQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:47:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB90A32CAB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 839AB30B33E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482D93988E4;
	Wed, 25 Mar 2026 21:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdimBKcJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIbKheCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9663C8733
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475194; cv=none; b=vFQqE1wBJzwRqUlf4Tuigww6NmgpEZbOHfUyK+40rdCW8KvWX1ytQkaDmt40ptuCPO3U5r7FpQZGeYv5fuZtHsZVGH0cjwkE80tm1Zdy8Ykx3T16Od7lItqAJBym686edIhtzZvsG2GQDGMVUxGuxLaThflBZm0Ea4TNPLZH36o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475194; c=relaxed/simple;
	bh=DVWCQ8NqG+tUBJXZDcsZ/S+o+QyjDYDrkQI0ATlfZkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxS1ewMtxax7pNaz/0ul4Zb/RKP1JtfQ0A0DYu4cPo84KQJ4PYX4plfh7vIQVBHMqm5DGMymiBX58qQ+2V9aSC4dJEcTRQOzbSJXNe4SmbxywYHoAS8DZLLnV3gSmeeDggv9q9A4r39KmM+t68ozl0LBHePJHB6WCHImFP8ZDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdimBKcJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIbKheCG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKwQE11175819
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHvpyCZJsypMHVwxXNF2FT+oeJZbUA/sFO+4H7ugunQ=; b=GdimBKcJjkA5CCQu
	kW8yzErCbl9vJ5021GQ6FIhsz4dVPvFr3QTIAZqzRychY7nbW3zwRlRvhFtqL4p3
	2/jh7svL26CyWAf0pq5rHzDW3/8tJXs49hkEIWM5CHxyTDZTA6vl3mq2oJmhLAwb
	lDuzIqq6Dxn4Ab8u+ptgpaUTvH7qiugNjS5SwxFMcNePxhcgUf+LAkCFypi9lqOV
	1jz0xjH6ppCx4a4ZLSI9sB7fMbUehUBN8Hc/9ZcGpLFZYpXYMQ65HcFnpiEPLpRW
	PvMOWnRkty5KqDJ5BTVQVqpqXEc90lxpurylU0megs7LvGCTNbthpxpTORx/gU/A
	CmKPmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76r4ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:46:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso393910a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774475191; x=1775079991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHvpyCZJsypMHVwxXNF2FT+oeJZbUA/sFO+4H7ugunQ=;
        b=NIbKheCGa+DJWqoyoa/oTTprB4lwzF6P1sPk/PE4XoPzqkmyzT/PhCWqyEoF9YE1qp
         sxDshiniyEwo2nd3lBWQ5a3Q72esqEPLIqsPZfqXG19xtmLaRvoQE0eBbDfS+3DU6zuY
         WTclZKSFFT/z1/odFxmb/EnJh3zkjNYenIKoxPCfmD5CPODluqlKniHhtLtcjrul7ZGS
         AVgRqm2h6IYSvrkuSXiA+zPJQvtDCGk/iqZoEBCA3Fo4UgSc8NAQN7l6vw6mBLfZy5W/
         I5RcrPdpFK1HJ6scWzbr2A2tbrnOmUPmGHYeTcbpyDFxy9/Glf3nfd7aKWKdbZnX8oKZ
         s/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774475191; x=1775079991;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHvpyCZJsypMHVwxXNF2FT+oeJZbUA/sFO+4H7ugunQ=;
        b=VLCpDPp9RLLka9owdC3U2zZ4Z2PO8idIHExsgIoDUG8o37bIr+AWDcF5bJjwAsDEBs
         p1tIvdEuBLlFYK7q+g3k2WZw0f9BOEQIM0vEW/QsBdr6RW1TkM2ZARfek+G83959GHX3
         kdrmRIEkLUCA/tazhLkMJ1oxGpnQ2+WG+EBuPTtXF/bNC4TyiiOqDIssnT+kuXEIfXM9
         gHviHsYc6yz7UpZfcP3IT5+WzZdWyHqywaxEJgguxz6m/njn4Vhgs7ItIjXck/S8bA7N
         2bmyBgcN/SVwl7xxDLWymeWeo2bP0YqoAi16Oirk4XKlSpDvf2IGqYNKOHtifei05VG/
         TW1Q==
X-Gm-Message-State: AOJu0YxsnlDbc7CWp48G1cY9JicI9gbh4Ihq6de/CwAeaPDjQRLJ9KwH
	FJ0mHQz2a5/dpnrQxt2ntlODjb7FevfD2iwLHIsKVG3sSAnfj9Q+vKHM/y5WH2koVfRxQrDiafr
	AYkfGAPSiDcJYcsWDOiRuRpWpz1UTOhlhrAZ2ev7QMkR73sSN1Ui/1SoEEfXgeQ4YrsSn
X-Gm-Gg: ATEYQzxM+P69vGC3jOL2xeUonFKb6zfVkNKn0BaMJBGcYcjFjUKBfoEQRyWjD/nnAfP
	ohY7oSPHlxLFuAKf6vjWFLH7FZqiayjMA3AtbmT7to+WurrjmlGoicNUGW+3Ht9iemJ+lrcPQpI
	vXWeorrtJmyzRXvlkGO5T0ViAziULhGO31VzCs5gm17M5gD4yioF+883P9R6ZPTnNlNbXTAG1k4
	YLArynIGlpTtKgLcaBdhQ79JZSxGwhzP+St6scC67CrQquaDn8Sg/i8PMNEEG3VZwsO1ZNJYQjG
	xp+UWfPcyCaNXpbYuNZOMb3nk18Cg0apbN5VCH4mNVWDhuF/QRvTLSth9xOWWxhG+qYACAWbQw8
	0GrMuVa3chadLT73FDDV4X3K70knSG3ZBApI2eqEI027R
X-Received: by 2002:a05:6a20:a103:b0:39b:ef0f:a6e with SMTP id adf61e73a8af0-39c4ab517ebmr5713778637.11.1774475190960;
        Wed, 25 Mar 2026 14:46:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a103:b0:39b:ef0f:a6e with SMTP id adf61e73a8af0-39c4ab517ebmr5713758637.11.1774475190480;
        Wed, 25 Mar 2026 14:46:30 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.235.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7673978668sm378870a12.27.2026.03.25.14.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 14:46:30 -0700 (PDT)
Message-ID: <cb4543e8-dcdd-434b-85ea-561f341452de@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 03:16:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] drm/msm/a6xx: Switch to preemption safe AO counter
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
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-2-fc95b8d9c017@oss.qualcomm.com>
 <deb68834-f384-46d8-81a3-9eff88deaef7@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <deb68834-f384-46d8-81a3-9eff88deaef7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c457b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=yg4K9g8yQ9z8uKSC4i4MOg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NwhR0-MFI0zYuXa4w7wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: zqVi1MAi0ZT9YEXDPrMMexoP4j9SmW1t
X-Proofpoint-GUID: zqVi1MAi0ZT9YEXDPrMMexoP4j9SmW1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE1OSBTYWx0ZWRfXxxTHGz+n16Xy
 /Il7apfkN05DH+VA12yv4seNdGO8a7JAEipS1Olhk4UgoHvReM79g+yEnhSFxfb6YwjsQBhzCnm
 lpLrqKmunZymBcNamrhEGwi6eEuW3kvbcpuvjR4GjUOr/tdE70VBTg2tuL0+qwDRLQoXDcBDO7c
 p2JNpPXiz9HitbFz/w4tMPkLjo9fBTD8l9Hqc4KQUHKCpeDOhrPF7+YFmKdDRrmI5jh03zEFtGs
 Md7zNh4SkR6MnpbYpjgijnSUQbtckBae6S8dWhy9Q3YWrZRtrtLRpDpVt6zGBFMd9JiD5niG6+b
 ryEiy/uR54bU5uospvhmQluMX0lsIpxDUC33LUmc6D6Q7K0liufEr4pUJCLlYsQikEoO2xYWQjq
 5UAxoO9VJiy3a6L8tuKQEcvSJFObYNoL5/BEP2ViYtZycAEDrRDYsNFDuBbMt0ruhpRt+kFvoXJ
 0Y7eFX+loHSwk6SprfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250159
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99954-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB90A32CAB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:21 PM, Konrad Dybcio wrote:
> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>> CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
>> provide accurate data about the 'submit' when preemption is enabled.
>> Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.
>>
>> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 14d5b5e266f7..93bf2c40bfb9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -345,7 +345,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>  	 * GPU registers so we need to add 0x1a800 to the register value on A630
>>  	 * to get the right value from PM4.
>>  	 */
>> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>>  		rbmemptr_stats(ring, index, alwayson_start));
>>  
>>  	/* Invalidate CCU depth and color */
>> @@ -386,7 +386,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>  
>>  	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
>>  		rbmemptr_stats(ring, index, cpcycles_end));
>> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>>  		rbmemptr_stats(ring, index, alwayson_end));
>>  
>>  	/* Write the fence to the scratch register */
>> @@ -478,10 +478,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>  
>>  	if (adreno_is_a8xx(adreno_gpu)) {
>>  		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
>> -		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
>> +		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
> 
> I'm a little worried about mixing the names here - KGSL uses both of
> these registers (A6XX_KERNEL_PROFILE vs A6XX_KERNEL_PROFILE_CONTEXT)
> to track different fields of the struct adreno_drawobj_profile_entry

But this naming aligns with the HW reg spec. So I prefer to use the same.

-Akhil

> 
> Konrad


