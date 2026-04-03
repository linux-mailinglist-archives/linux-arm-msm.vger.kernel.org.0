Return-Path: <linux-arm-msm+bounces-101711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJKZHgT3z2lT2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:21:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E465C396F1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC87F30160EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650A93D3D1E;
	Fri,  3 Apr 2026 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZExL75a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izQOt2Be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224803CF02A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236843; cv=none; b=JBOEAIeTdOf2WmMd/At0heZ0d5mh5uvQ8l3epvw7did3JqaqHMPy8MAG3GpKL5D1cB/dJbEiM/eW5gv3YKkGBGRojAMZoEiW97setwSOyV+FaefjmFlwAMszZzEfoXCXESNTNJIOzCFObzavxGeXhDOlnbELyz8m5hpaBtkdRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236843; c=relaxed/simple;
	bh=wJ4SGi+RUgIhsJJAdoRj67zG6o+9Ks6jcb+OggrbsfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSjxQ7DmEkTMl3aM0YYXxO97CLc/XN0Lfd0WSST1fPLRBWMhxWrLIFRHH5t5YWnOsfT7vlqEUcHUfcAa2ry4ovAxMFCwfLMoHus7roZzK05SbU8wWipmGu5NDoDCSQww8CEYpOx0tHFAe1KgsWqj/OLvUfgWXr0yq2FvFyRppek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZExL75a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izQOt2Be; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DCr0o823178
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 17:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8V39+f9OWvpwnJiINSpQbKQIemQW2g5kxmXopgAHlw=; b=TZExL75al14O3yLM
	hCBa44uZKs372wBO4QEEPh9kk8IL7LxzCRgoFoSW3eK4bgdY+BSB/4GCxwwZvj/2
	SMmSDhWHiby6RYcnoQmNjd6rwOQPp2PKv7cL3OX/p03c8odXIfYW7BinrNlZ64e1
	UGCCMOeVLqiny/0x/Zj+LYaw0HtHLSwlANRV9SPJ6NivGkG23S413T0jl+NFBM7X
	iTM7fagd7BQ67t7KttylhWBE3nR2RM14gW8fluGSey+0PijZi3IsGqtlPMRGgqPE
	Od03efzR0kewHYYZKm5TG7GrqU2SJP4oz+KJ3wf3ww0+A3FZT2q1aXMT4QGcdyNz
	VBlczw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da673a629-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 17:20:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so2144208a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775236837; x=1775841637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8V39+f9OWvpwnJiINSpQbKQIemQW2g5kxmXopgAHlw=;
        b=izQOt2BeoKmVzZkhV5RnGN2dQS4eO+DQ86LvX8Z4c8M8PO64fRFXkLhdv6rtUbbbuO
         0ix4IsM8lq3+8tDxtowPJ0Oi7K5LpF9XDjiwETHjkp4lzwqldfLhAGE+beS1SdBmehX5
         6wxO680WltKukxpYqGJibMzUxFOBrZjYPsFx933CKW0J8hcnrKnysZVqVQ+BBeuq3ILO
         mdogv8oPL0CYEQcFnD/M0OajUSK49aklmfG3YNa7M8ElhYms9o4B7+wrhzVUlqr/42nU
         LrcoimoRGX6DUcAsxmQfTVsdc4MPh+ZdTmYqRUZyf6TqspxspUfn9E8Z5A7nCw8c4/zP
         ieAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775236837; x=1775841637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8V39+f9OWvpwnJiINSpQbKQIemQW2g5kxmXopgAHlw=;
        b=solv8HbJzJ+BgzaKcQU3dy22SvejNeUarfDILCmwcQr0iiOazhAUzFBcqtPVbN0Q0d
         vdWuYV1UqXE36IN6mK251mA6bS3NiXLpjW/bGTdHkePMmp+kZvCUnvDmFQ2rInlaiT9Y
         rgygKDT3Hqtu57zo9fPixEMtYt9uC0k7hVk37Grp99vuN7Ha/l8XK9ZQ/7AnvQHLfRJj
         3xd5L1TpaRAlogMgEuHzNtrLXtTd8gzL9PMbSor1Nmxb5cFl/+M/a6zYuZgfrEo6Hho9
         SuNQ/EHg3fn7CASd3XSdgaMfWnIt78x67Ipz4zKnUTDQ6ohYL1MTbX+YonXxCAG1q/IG
         ABug==
X-Forwarded-Encrypted: i=1; AJvYcCWZ60CTk/kAJzwUrCGg3Bd7uuJiuGs6czV9V9jv1JbERbQ7W/bzahgfIiNZlUEq/ThSFxZttW2OTDg2uuQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZAJm1Ouq5JOyzDluU/KRVXKrY7SfFexqIiSZB5NqhIWUzYLB
	K3bVG6P8yqFDLty/PeVSqSMGDyws3Ke+poUTOn3/9MXB7eJYntV6ZFke2r6XzGxsuPBCw8JRbcz
	AZS10zwFn2NUH+roU/hywPMBJtbMpBlNvbZCJqAw0RYnutOZtvg/KvoenQlElCuBAch+2
X-Gm-Gg: AeBDieuqt0FrJUF5XelwGIq/cpF+UUWrI4sY9tOV5esfbSZek6E9kya529gcmefqZI2
	eJPCLe2HrYZvTBgZzgm3C1jy72oYBWSqAGyMp8HKeup3qCLqIhZtDEHY7POWRaEKBZ05VGI2mYJ
	4mfYTfDot6LUFAl4QgKbYeb925jYTQnKjEbgImeuetaEWlVp6Ouz0YauOawOOPKpYgMQXGXD2IU
	lpoJcj+KFi4tXKu+FJohrrDtG5XmgKr3xC1NbjdPaq2xZaF1o3i0hGN0U4h9AHlvkkIFEWgBNfK
	mILvpg8QGJU2qfP0RVu079O8Ta/gZHxZOmWTd8CawSFYOcNg/3ZVOVUdfzQ4kzD3cBZt7yBho33
	bF2euDkmCm6l2VsawYRBO/w1bXNLKPBST08Fbk5fjPNkhY8Dm4Pc=
X-Received: by 2002:a17:90b:4ac7:b0:35d:a2aa:3b05 with SMTP id 98e67ed59e1d1-35de678f96fmr3529427a91.5.1775236837124;
        Fri, 03 Apr 2026 10:20:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac7:b0:35d:a2aa:3b05 with SMTP id 98e67ed59e1d1-35de678f96fmr3529399a91.5.1775236836568;
        Fri, 03 Apr 2026 10:20:36 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.147.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd367bfb1sm6322767a91.10.2026.04.03.10.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:20:36 -0700 (PDT)
Message-ID: <0375e235-0b8a-458c-a797-d5b341dc60b9@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 22:50:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-1-669b96ecadd8@oss.qualcomm.com>
 <a616c056-f9aa-420c-a543-7f1539e9e886@oss.qualcomm.com>
 <ac/L6y5B+6SyTNuE@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <ac/L6y5B+6SyTNuE@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cff6e5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=pj5RAjPJ5lVSI15MjsbsBQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dSs25HfLhZsUXQcnLhoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cYgKI3tf0mlu2UVRGg5HFJLTGb32TzSq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NSBTYWx0ZWRfXytZ9dducCTcl
 0D0AHNVaBwbU0zefz0XCTxoOvqJQJxAd3yzQAjkOBA08+SMiti5ztrKKngRIi9pCAE+iWwAKFkq
 xrqsaH7AyN6geVGUSu2yCUbZNrXTkAy6HxgoaHznYwoXpZU2lSAjgFVN+zVwlnH0AAv2ASw12AN
 Bjnrasbx+r7VghJ6VQMGVZ/uwjV2e6G4f16WyUCQuhRch4oirxh0UH21e7VxFuG0EIGKcgYDt9B
 Gvt1lblTKMlBxKT8vQtJYcRwBlcWNY9WVKUBFEdlwOCCXusNdYtFX3UXMKELUtcNdZhd6BcXv7I
 LciyMvTYLFLBIfOoWwxrGLYZ3Ng2WPJCHhGOVedZqkQWnnP4C1Vs3xUTI1k2nfz+J+xEiSvzFwx
 vM9dmJJ2o3/eVO+KlN8W8dRcI4Cw64jTqsZu74s5fv0cDhAlru6gUkvsaNVTV739kUN1KBA4KrP
 kGgbef/IQegAratOy2w==
X-Proofpoint-GUID: cYgKI3tf0mlu2UVRGg5HFJLTGb32TzSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101711-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E465C396F1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/3/2026 7:47 PM, Abhinaba Rakshit wrote:
> On Mon, Mar 30, 2026 at 08:09:35PM +0530, Harshal Dev wrote:
>>> +/**
>>> + * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
>>> + * @ice: ICE driver data
>>> + * @target_freq: requested frequency in Hz
>>> + * @round_ceil: when true, selects nearest freq >= @target_freq;
>>> + *              otherwise, selects nearest freq <= @target_freq
>>> + *
>>> + * Selects an OPP frequency based on @target_freq and the rounding direction
>>> + * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
>>> + * including any voltage or power-domain transitions handled by the OPP
>>> + * framework. Updates ice->core_clk_freq on success.
>>> + *
>>> + * Return: 0 on success; -EOPNOTSUPP if no OPP table; -EINVAL in-case of
>>> + *         incorrect flags; or error from dev_pm_opp_set_rate()/OPP lookup.
>>> + */
>>> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
>>> +		       bool round_ceil)
>>
>> Any particular reason for choosing round_ceil? Using round_floor would have
>> saved the need for caller to pass negation of scale_up.
> 
> There isn’t a strong technical reason for choosing round_ceil specifically.
> The choice was mainly influenced by the earlier discussion here:
> https://lore.kernel.org/all/15495f8a-37b0-4768-9ee1-05fd6c70034e@oss.qualcomm.com/
>  
> Also, this helper isn’t necessarily limited to the current caller.
> We might see additional users in the future where the semantics align more
> naturally with flags like scale_down, which map cleanly to a round_ceil‑style selection.
> That said, I agree that using round_floor could simplify the current callsite by
> avoiding the negation of scale_up.
> 
> I don’t have a strong objection to switching it if you feel that would be
> more cleaner for now.
>

No issues, you can choose to do it if you spin a v8 of this patch series.
  
>>> +{
>>> +	unsigned long ice_freq = target_freq;
>>> +	struct dev_pm_opp *opp;
>>> +	int ret;
>>> +
>>> +	if (!ice->has_opp)
>>> +		return -EOPNOTSUPP;
>>> +

[...]

>>> +
>>>  static struct qcom_ice *qcom_ice_create(struct device *dev,
>>> -					void __iomem *base)
>>> +					void __iomem *base,
>>> +					bool is_legacy_binding)
>>
>> You don't need to introduce is_legacy_binding.
>>
>> Since you only need to add the OPP table when this function gets called from ICE probe,
>> you should not touch this function. Instead, you should call devm_pm_opp_of_add_table()
>> in ICE probe before calling qcom_ice_create() then once qcom_ice_create() is success, you
>> can store the clk rate in the returned qcom_ice *engine ptr by calling clk_get_rate().
> 
> This was added as part of the review comment from Krzysztof:
> https://lore.kernel.org/all/20260128-daft-seriema-of-promotion-c50eb5@quoll/
>  
> While I agree moving this to qcom_ice_probe would be more cleaner without needing
> to change the API, most of our initializing code for driver by parsing the DT node
> happens through qcom_ice_create, which keeps qcom_ice_probe much simpler.
> Please let me know, if you think otherwise. 
>

Seems like a suggestion from Krzysztof and not something based on strong opinion. Again,
you can choose to do this if you spin a v8, I feel it's cleaner.
  
> Also, I don't see any reason for moving the clk_get_rate() logic to qcom_ice_probe
> though as it will not be set on legacy targets in that case.

I thought only new DT nodes will be specifying the OPP table requiring us to store the
clk rate and restore later. If legacy DT nodes also possess the OPP table, then ignore
this comment.

> 
>>>  {
>>>  	struct qcom_ice *engine;
>>> +	int err;
>>>  
>>>  	if (!qcom_scm_is_available())
>>>  		return ERR_PTR(-EPROBE_DEFER);
>>> @@ -584,6 +640,26 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>  	if (IS_ERR(engine->core_clk))
>>>  		return ERR_CAST(engine->core_clk);
>>>  
>>> +	/*
>>> +	 * Register the OPP table only when ICE is described as a standalone
>>> +	 * device node. Older platforms place ICE inside the storage controller
>>> +	 * node, so they don't need an OPP table here, as they are handled in
>>> +	 * storage controller.
>>> +	 */
>>> +	if (!is_legacy_binding) {
>>> +		/* OPP table is optional */
>>> +		err = devm_pm_opp_of_add_table(dev);
>>> +		if (err && err != -ENODEV) {
>>> +			dev_err(dev, "Invalid OPP table in Device tree\n");
>>> +			return ERR_PTR(err);
>>> +		}
>>> +		engine->has_opp = (err == 0);
>>
>> Let's keep it readable and simple. engine->has_opps = true; here and false in error handle above.
> 
> Well there are 3 cases to it:
> 
> 1. err == 0 which implies devm_pm_opp_of_add_table is successful and we can set engine->has_opp =true.
> 2. err == -ENODEV which implies there is no opp table in the DT node.
>    In that case, we don't fail the driver simply go ahead and log in the check below.
>    This is done since OPP-table is optional.
> 3. err == any other error code. Something very wrong happened with devm_pm_opp_of_add_table
>    and driver should fail.
> 
> Hence, we have the condition (err == 0) for setting has_opp flag.

My suggestion is you either explain this in concise comments or simplify the assignment of has_opp
to make it obvious.

Regards,
Harshal

>  
> Abhinaba Rakshit


