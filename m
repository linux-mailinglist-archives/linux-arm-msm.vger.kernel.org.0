Return-Path: <linux-arm-msm+bounces-119200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WP0cBMtaV2ooKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:02:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D687475CBF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:02:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pa436c9H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GC0ZfKuZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1B2F3001FA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82268435ABE;
	Wed, 15 Jul 2026 10:02:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0C519ABD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:02:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109764; cv=none; b=H3z4+DgNBPd5ZArqGkrTZLdX/+5rvAs+EoxFCuvt7IMhKYbQqhikHWFy1NITM2qn4fmhUr07BLDtEWUJ89sKGE5X7OEUiJMPVk+SU+oZ3CkEl9ii2uhJauHx3NEz50JdSVs1tsQDuv+gByeHyiNcKIE06jmZd5bNffWQdjEP8YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109764; c=relaxed/simple;
	bh=X4NF+McAcxUqThnGUD6A1f5AYPYw39dM7Dvs7CZJmuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hz6MskTuJlLFmkgymkAmqYyYUyHVDt5b9ks5H/IatJKW/rxkzCYrXqmg77HMpTzGYuz1gKdBB/AWu46Pq4e3MeTnKhVJUsdhWZ4aD3tCe84uLKTb0rQz7egTFIgSOPi+v+mPjlFrWPL5TF9zNxfxEPDo5cxsGuNNCu6r9duin1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa436c9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GC0ZfKuZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9R8SB3143584
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3dtyslUMAksOtZ1g2z3oPzlCvcvMPUpkJW/ah0ZywCs=; b=pa436c9HeUbzvSq6
	ycByz+xM8mJEOmTnzqQk+lcDHaPOpP0Baw+G4pLBoNZTFz965OusknI1lS/b+lXT
	OqZkwYN3ud3XzPbjcwpUmPehCElY+olDg603RI3LiCxp37XDBZO3s8/Sk+yrd1Sa
	/O9dMChjNuCICGLZkESRfTFxum7l8Gg7xGzjzVfF8tc+zV2/ijRzUm6P20zSW8Qu
	pUg1ixF2bCKHFqvHe+MeJ1/KPYbT9+kbxeYvmWfAzBbknmjNx/UvK0ReooLtBO71
	1hPg4IHxYHE5D5M3e6PCSd5rhRjX6uFLGpqsWqATTA8om6rWO5R1LSYxqB5nsdZy
	Y34Lvw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka84b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:02:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96917d46b8dso71225241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784109761; x=1784714561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dtyslUMAksOtZ1g2z3oPzlCvcvMPUpkJW/ah0ZywCs=;
        b=GC0ZfKuZoRnN79BkLf84Omgh5p75CaKziaXbbNZ4kgaeEGxgaeno+PFbueBd6KGDr6
         aMv5RuHfa9PBIkqhXvyEgi3UjU1zLRSyHG9mfHnEMhd6JN/VslUuqYg7mYKMAGMCk6fD
         uYRfxcUCLLLnCPtLBbvoMSwOzCb7ErsVVH4Q7ohF1heOs82CkHSJtRfznKUeRLM16OZE
         ZGTPa9RVLr74h3zEs/M/CAWQxSNEothFtJaFhO24Nmb4VVtU44roHyr7UZ5CBnIbItol
         yVuwe5iWHVVeMu0tmlvbDCgSRWMSwsKGFp8HujDNaedHSg+Wvejdu3XIY5vddlC4tiAO
         Je/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109761; x=1784714561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dtyslUMAksOtZ1g2z3oPzlCvcvMPUpkJW/ah0ZywCs=;
        b=JjLTiSFPakHX/q9sFkCy7gY75PZzC6vbHUIxUZD7WqEVFz5IhbxEucMCv4pkiRC2fG
         vGycm9nVJGG0C0qxbPjP/CZN/hg97A180QBvkadVp23k3e+oHu6Gq2KPJi8QZABJLslV
         8m46cQiUsetD30Qc/5B6rQVp2xzopqIIFo8WZok1fauRqL9q2NienkvWdWXOwJdchtFM
         3BeeZJscRTePZylMybxJmCY6tTwbwJpiOoeI+7cQG9r+OZgDuEf2GPdiHnh90am9AjS3
         9rMbx4aUEmHQ6ExxqbHANsV8hnsE5W4tz8IB1cqpxPk2v2jVUdBAM8aBtYnCpJqIWwSa
         GoHA==
X-Gm-Message-State: AOJu0YytT7J0VymC0PaOSm9RU3CnyptedZ0vI572FNhGnYeQX9qzz6/W
	WCH/Bdtn7MG36Rb0bn1ce4nK7L0bBC5XJAjrl/L89VaClyypMovPwt+4zPXnz4hADFAJpatD25B
	d9HNBIc9gtIGbg+t5vCt/xpVdowzJykk2LVQc0c2QMmYcG5GYxkh/j9clxIhl+auyFS35
X-Gm-Gg: AfdE7ckQgZrYi0fekUcjqV62sH4IVqvC/3kV+8bcE1IHvjnV7L/T13vkhCSUKehCRcD
	ktIOpIIvnFsTMm5MzC97l51BHkB+ehS3dz1ZcNTg0ELKWVgS2dAgcqHSpJ575B3sDeCLzyf1vsM
	AuEsxVodR2ENYWMFpWIJ8LgbKwEcB7RLm6V8Awc2uZBoEfJhuKNNGOpNby/srlXr4nWhbeDAyiu
	x8BHTfk1hVeTmsuhSJ2vyDcXSRH53kIDrHzNkwzf1X5A383aA5FlPeOws6JJcwLVcbWiPK/7nuk
	+GA7GE6Oaf5hr8ocgqEK6P51PEcXudn2ggEJz/xVOF9/2EOx2M7kdeKLw4bfGoFSFfSERJGx+Uo
	GfRjUNS1U74BMirvGG2zvQYKALykXxqoXIsE=
X-Received: by 2002:a05:6102:c11:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74533da180emr3860077137.4.1784109761514;
        Wed, 15 Jul 2026 03:02:41 -0700 (PDT)
X-Received: by 2002:a05:6102:c11:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-74533da180emr3860068137.4.1784109761138;
        Wed, 15 Jul 2026 03:02:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2955dabsm2691322a12.28.2026.07.15.03.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:02:39 -0700 (PDT)
Message-ID: <5756164d-2e42-4eb1-ab18-69c6f784b789@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:02:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra: Add CPU idle states
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a575ac2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AJ4WnVOIilw5oRoLkpoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: LV6Ht2Yy4jZdtu4fDQCrcbpvye46eCYi
X-Proofpoint-ORIG-GUID: LV6Ht2Yy4jZdtu4fDQCrcbpvye46eCYi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfXyijtwUkoVqr1
 S6YWbB5SkBef3dJiRHEDi9Q41Z+LrKrICM5Cr+Wik/Eu/CndB+PfPnvw/084h0GNH5ywAN47JRb
 e66bDxUtTKFYVWSc4xmKBhg3XWvFuDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfXw+Y4F7Oy42Kz
 WXr0wKnHR2reuWjUhnYTgY6TeGeaZE8E0TNMNX0T5XM+s/xOU8GKTfLV3VdUqaEzcmnilKHkU+B
 ZTPJx49Ty0B2KpSLMkv2zJuiTLwcIXNpAOwskZk6UCHZh0ZJ23TvF/zxPS3QIVQpJLJP6Zqv5Rw
 A2EGaMe0If0NdXg5IAiwrCSKWacm/rn7cECpK7JhQaL3GPcXQzVSNy9eCaK/xMTCpmpoBoREk33
 UtCZhcwpHvM35/vPwcHcrHAo6BFDKJqjQD5ZO2/MNplTm27esXAM11cpeRbtGp72poru1TBHpqB
 8bFryOh2YbikHJfyFoBmojNqj32EMrKehtlGmHZfSlsw4TZoyZOgs27h9rtxdoBUc0tJXHtNQ4k
 WJNF3G00+CmbF43jgsopGczohM0JpMm3sh7//leUms11CqVfqQdF3aYBbloJ2jHEfT85rrcvBAm
 YtOjyAq3dwhnWRb13ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119200-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D687475CBF4

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables
> deeper-than-WFI cpuidle.
> 
> Add MPM under cluster_pd power domain.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +		domain_idle_states: domain-idle-states {
> +			cluster_sleep_apss_off: cluster-sleep-0 {
> +				compatible = "domain-idle-state";
> +				idle-state-name = "cluster-power-down";
> +				arm,psci-suspend-param = <0x41000044>;
> +				entry-latency-us = <2752>;
> +				exit-latency-us = <3038>;
> +				min-residency-us = <6118>;
> +			};
> +		};

Is this really the deepest state available on Shikra?

Konrad

