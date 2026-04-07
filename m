Return-Path: <linux-arm-msm+bounces-102239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GcYOoJ01Wl+6gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:17:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9253B4F0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FC7D3037436
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 21:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B2937C901;
	Tue,  7 Apr 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9Z7GZ1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRTrAy0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82711370D73
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596664; cv=none; b=La2jsuG0yA11jS/LaUf8Z2G3n96o8JLY/IJnq2MTnvxrLZPMH4P9Febxessf5eRTrGX8bdYKLAz1ztwmfhIBWmPFzLll8ax8KUwa4wV0104vxkEyyB/nvHU8h3xRd7OT258TbDHz0bzo8uR5J6I/y9IIMnP/QheUKg3Qt9oT7I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596664; c=relaxed/simple;
	bh=CW2mmqVPJOfpQ+uwXf2PtNaHas3MeOWFcHTYfSdcq0A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lMHABwDbgwSu51nt74a9rORcqZ9nnbzpLUAeT1DKCPE0WYDcQWnqJ+qXr4axD8kXMDTcr0wMwiSbiAKMxSpR/OIFu/COgtyvjWIQqU9t4v87EMTxCJOxZZ2QFWNj8fMbpuqLb24TjpF5kzdfC3ka1GeY2vXpSEwX/QovcEBzhEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9Z7GZ1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRTrAy0U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637JiT9l3815781
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 21:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uEwzIG/WP3KfeGGQytAvkF+cLGebDaMgBafkG54molA=; b=L9Z7GZ1Q3EFl1S+D
	FtFp7TyJHqGUwFpXxRrSIYRA6txv+kkIweUM48X00KEOV6T6z0Cfhchg0Zj3BLbF
	Z+e0ZUKbBQyQ+V75gWyVBd+fZvhGxjoRj0yIv5DZ3gaQAQYgls2I/T1q2hvze8lY
	uhtGm2yx691Or2svpfLQvIgv0zFO2MI94EdaY98w+vvBE3IZcAo2GfVrmySKhE6S
	W1hagftbsjrgTXR2AFh6Ic6/f1AViEoBHwQLyY1TnbqddzDkye3o5x6SmE4+2/jU
	p+UNWjbhw9618Fa2eU5S7SOTk2D+ZLu7CQe/xMEZSUtT38ihJ7ier+XgGEceV3oz
	EyD1xQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4vnp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 21:17:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so3573329a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 14:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775596661; x=1776201461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEwzIG/WP3KfeGGQytAvkF+cLGebDaMgBafkG54molA=;
        b=CRTrAy0UVS9NLszitUdA2d/it7gkgpWC4UKWYkiv9MOlufKlaPh/zgQ0caiEoTpOsp
         qLQl7mSxkvVRYHy9FtH5fzD5TMk9TNWo0zFuL1ptpXzgxj52GKb5iW9tT6CdbBVXROxG
         nlBrGz4MyFy4+x+FJ85STZxJm5e3/+ODAtSaMiiAwGK/LMT86Ksg3yu3d5zicS2bA2HX
         DrBPz+lH4ZphvoCq85ecUet8kzboxWIzByRUsS1yMTbfyzTZi1T6o5OWv2etyxaFxuCz
         ztT/ZkdOS7h6S8Z2crQNBHP7fplLCb/Y2YS5hB1UlCCQvM0izSuURqtzc303cnsdkRJS
         cFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775596661; x=1776201461;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEwzIG/WP3KfeGGQytAvkF+cLGebDaMgBafkG54molA=;
        b=Do20w/0uSmFOnMsGdQYyOYyfhB1mzQenMcfd0ek4ZqtJ8E23GeV/we/0vnkE7DW55X
         l0zwSkwlXDkv708VWLQ6l3YgyI5LLMIcgsXzIE/Lj3dyZrKTd4AFVdafcgC1JE8aJ4HZ
         pIzFMxRnTD3d02yatrYyJ+0pcjMNCc4gn0GfcVd8izJ8mypUquJn5YEfc7jBy6oB0h9L
         HqxtUmHG8HvJlWdUIdl13s6jVgI54b0ZZ3Oo2+V8IhXcw3tynd7dFWL8fTE1L1QZjBJR
         sznoi8MKU6aOO1J96tkyPe80kNX+kCnWqnPalUFlPwHbWV+Q9/58uSezqpA3WnSjRAPS
         hqig==
X-Forwarded-Encrypted: i=1; AJvYcCW5le/msuTccxHEv7quLznra9EvugxK5fhSzmQu2PaLWeahHPwBGMCBK3HfsAkuN30Q/9bmBOSeXzZY9idD@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyFTpFhpc7CsfkPOrTFFG++KVUZRsCKQgSHyRlVfm58pZLRQ8
	WnpocckHihp8MO/88Xxg+QELIqEOtnLR++1wTkbe7JwlGW7h2+HTsoJLc7+1Nu/bk7vRnRIosh8
	b/h2fOmm+g2ri4oI/eA2sE409L/VE6q84tvPaSok64mF9j/ThdWyvgV0ApzgmrF4RHwMa
X-Gm-Gg: AeBDievu2vt6g7Cl0h2iMC4LJBReapQuPMi/q1yADBMobYms9XCbSgVTfstszEyFfmx
	fyfJYrhjPKwchK86vONdQ31tJOxDmTwoMd47os5OtB5z4LEoIb9QJGLi1q9wfGkmQiKkviMsafB
	pJteZ2VHgvv3toKH6U3a08DO9h8Tf+vDz7V/2xwVM9AXbvv5kzA0f0frJavb7xPmOcJcYbYFA7X
	uhON0NItz3qLso3cz3MT8LMNrwD4xWdkJH01IU7/Ow57fEMVcfzT9Sk5/ZVzTtmDEMH59Ah+FlW
	NpBQwNiX+myrzDNNrBVUtoAZTNremygs0KiwXXjZRbqPYtRdZzsZgYwSoJfOy1MMJuB00gNbRPm
	+zwQswR2wxDs7BnioQnXGsTVbpOAeaoOOPX9/Y7jeCnHZiw==
X-Received: by 2002:a05:6a00:1ac9:b0:82d:24f:2516 with SMTP id d2e1a72fcca58-82d0da2b115mr16522204b3a.11.1775596661255;
        Tue, 07 Apr 2026 14:17:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ac9:b0:82d:24f:2516 with SMTP id d2e1a72fcca58-82d0da2b115mr16522166b3a.11.1775596660698;
        Tue, 07 Apr 2026 14:17:40 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm16813935b3a.23.2026.04.07.14.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 14:17:39 -0700 (PDT)
Message-ID: <27e2e6c8-fd8b-446a-9ef5-802e1af0fb2b@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 02:47:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] drm/msm/a8xx: use pipe protect slot 15 for
 last-span-unbound feature
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
        Bjorn Andersson <andersson@kernel.org>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-4-ce337ca87a9e@pm.me>
 <f85253a3-e03b-4f33-a7ae-df18ba01fd8b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f85253a3-e03b-4f33-a7ae-df18ba01fd8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d57476 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qS-k9e48XBCiOm6aCyoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: U9ZPE1NEWEua6CD3_23h-kSFnI-eQ-fj
X-Proofpoint-ORIG-GUID: U9ZPE1NEWEua6CD3_23h-kSFnI-eQ-fj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE5NCBTYWx0ZWRfX2lNG+SST1DiM
 r0s0oiuWt+WjNrYkZsCNnaBjut15b2gviFPauNaaLP3utzM+7QxKv/ZUC+e+inw51Iqj2N1fUNr
 +ekS2gSOxKVwBH4aWGPxZmp3/3LSj6S1qRuyYD+s12zHzgjC1pt4mRheUsogP8D1VGEAsQi3Ti1
 frOSA8URqoDJuFYRIdCmb4wV0VA1LfCrlBEVOMLJNC02VjUE57Hf5Ky+D38mUuptFEHM7FoOS0d
 0B7PyKSwQgwVfdQ/1GZZNlCyqQY8Gcb2z+p8LqyOGilcKhfjA1dhTsHXDP7aKAykw7Y+lcKFwiN
 czU508SlcEZYJedISEeXPtFVbUA9qGYuePrdY7s0Mw4NgngjUh5XY9vibgZ43LX0860bVHKFiSY
 rSc6UH9YOOXnJpbk+McGlGVTJt1mshmZTL/nzLnZgcMP6/rOCdKBF+8p70U/kgCLW6VFq+waoE9
 OtKQ0psEdaONDnIK5Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070194
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fairphone.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-102239-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F9253B4F0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 2:44 AM, Akhil P Oommen wrote:
> On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
>> A8XX GPUs have two sets of protect registers: 64 global slots and 16
>> pipe specific slots. The last-span-unbound feature is only available
>> on pipe protect registers, and should always target pipe slot 15.
>>
>> This matches the downstream driver which hardcodes pipe slot 15 for
>> all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
>> A810.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> -Akhil
> 
>> ---
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 8b4b022d9a6b..102d5e751536 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -252,11 +252,12 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
>>  	}
>>  
>>  	/*
>> -	 * Last span feature is only supported on PIPE specific register.
>> -	 * So update those here
>> +	 * Last span setting is only being applied to the last pipe specific
>> +	 * register. Hence duplicate the last span from protect reg into the
>> +	 * BR and BV protect reg pipe 15.

Not sure why you modified the comment. The original comment is accurate.
LS feature is present only in the last PIPE specific protect register.

-Akhil.

>>  	 */
>> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
>> -	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
>> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
>> +	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
>>  
>>  	a8xx_aperture_clear(gpu);
>>  }
>>
> 


