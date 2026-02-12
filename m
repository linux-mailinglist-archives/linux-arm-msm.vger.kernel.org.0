Return-Path: <linux-arm-msm+bounces-92681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOWLDcO5jWl96AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:30:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC0112D03D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 036A0300AB19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FC7311C21;
	Thu, 12 Feb 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp5oxCmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwK2gFx+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008322C3256
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895808; cv=none; b=mkzAWHDHclDfM9kpuZHnQ9viGF9jSc6YVZrmY3WsmLCq2mI5pS0rjCzlwoC2hWHDTLkqwrFf1ryT1KEV/kCwLNEg9XLPQ2kCm2p3WKTu7/jLuya+WoZZk8usHHYErsDu73tYFkLDLcu+R6OGUpagDD+lbwTnXkmS/Y21EqDPDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895808; c=relaxed/simple;
	bh=s/xg6C6WN2NIXO1VE7H68jznG8Lz8f8idcAGIpFhkXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hqc2o4OqX91kWDqTSsXP7wiO7UGSHThDkde4tS66mWLV8TQN6j91npmImMDaOtZEkwonrRmlaLrQ9s492qQreLzrbJWvWGFKQiR6VNrB7SmLwQ3Y06LCnM2izKtzdBIhkwM/TmetUnvrbXQ0zuZRVeoOUHgSZQLiW2v+KyleyDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp5oxCmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwK2gFx+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAP2CM3888000
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcafTaVjifqFrLoCQd4r4m/zCs1n46XiePZ4WiT65Tg=; b=cp5oxCmmi5uiP91R
	omlhAZvPlihcPIEMr6YJPdw0iPUivmDq5wu6B57wr4cIWi4vy0l4gSNtuvYAHHqk
	xAX5ZrV0dm2qV17PeYiVzPwmQxlWvOTueaqPJpGt4ko5Yxnvt4xYX2sdjxaASZE0
	msurNksYX+8eOhTtVLkYUipLDwKzvbu0SQDaYfew3EqxaliXJaImO0WDKYvArodf
	GrXQULaq+GwSqKsSjCsGfDhaYaPtK7cfvcXaCTItZlrBAr/4IovFAeOTBsXTc3ck
	elsHEh/eElFLiZSN2r5R8xoC5BEhDls71jpW/B1tBpVFq2H93vUPMRmEENcZzU7G
	9BlgGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wjad1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:30:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3978cdb2so7968285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770895805; x=1771500605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CcafTaVjifqFrLoCQd4r4m/zCs1n46XiePZ4WiT65Tg=;
        b=cwK2gFx+005GnA2gRJEBkCg4Y+rXXGjABsdpTTufPculx5Imzsr68LztdsvDf4ozTe
         gEOC3qeDxwSwGNmA9jDQ1MiPIlJYMq5jN+7JW379ZjNHRGvE9fA/noezMXaRDV6j3O0q
         oLy//xmVrTtwPQv4yixpFLMHMdt65vtms8V61CEaBngL/qFWAkfmo6xj+4tGuK3g89Bf
         v6I1DczdAtjhrBN/LEwsurTP8YfoiSlYQPExud1gKJZ/vQvR34j2PYtkdCygT+/p3/5x
         NmktCbIUtEaas+emSCVEB3dO9qYYDBFxq7EEphCWS+Gaj1R3MXxYh4dFKqamiu6dFPBk
         ayJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895805; x=1771500605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcafTaVjifqFrLoCQd4r4m/zCs1n46XiePZ4WiT65Tg=;
        b=KKQa/aYUL+Sgy7tuRdtShc7bGbodrWvTnY2JNdN2zFMT3XGvFAS29Kp9PbsnJdauQr
         fr4drDWOjFfaOQ/WL5JPjI29Tbc/vGiPf2kN/rp2dh3HPoNkC9pG6g0f6fbFwUnXL9Ts
         QlvrWuIw8zT8RU8lvsPX24am9NIeAR0U8Nng8BJz3pIwA03fjGbswWWd8RHW2wQALEi1
         +LkdlHfkDmHPSkuxy+u7thWz2J7/ejR3mC2K1gxK7NXdsYovG5L/GGWef1JMll1ZUEne
         vq9BPNBOLMQWrnARn/YT+SFO8Ale8B/838fg+63c7VbgCVsCv6fZDr/UX6gQzfIcsdra
         T52Q==
X-Gm-Message-State: AOJu0YwPqNmmRywvZdbFH97xFTzJNVY4nOx3QVdPTUSJB5Qn6UOGJD20
	sJX5h/CEkqc4oOuUK0+Y8SZKfxRFLasyryI/gY6PBSK9+aVUIekH3BSQdysF5MXmHcIif4TproE
	TUaPqECRwGdlj2bjNueKmvlaBLfngHMvjMlLcU97Kfmov0XWBu3l+Wa+33/HYlZmaAVrN
X-Gm-Gg: AZuq6aLKB3bZp3CN8RyM+q4E1m3hL8UJz/cZJ0MyPl7EBDjAqCg8AnRv+txQUlU+hPO
	2//E9CzZELlGTUDAII74D+fZtYHbn7KaG6mnMEt35jF5XYiwcpAoqq09Ax+C2tj+wWB+W8S5aL0
	ilWhgHXInj0xuiZwkN2GozoNlPdKzbX7vP82B6u+ti/PmdiEgNTL0zmkWeHjFhziN+UjwmHeuA7
	biHGKMqIgcEKpSrc4/z5eFwlLQ/wmf0m5uG/AV0aZG6eGwKs/oaan6kv2dnuXfY3XociRD0H+b5
	hdhBMWpi4miH78PlwySmJNnink9+zQ7kGN2P4kvghugT33VzkXs9AWUBTKtp+VOfa25TpskjVy0
	xTChhAT1RggGtBtKrpmEDAK2EVtGJeY4LaZtJEadDmNMKPO/eqyExS30/JjRLvjcN/uiFHGa5oZ
	T1G8Y=
X-Received: by 2002:a05:620a:448b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb33115b5amr226371585a.6.1770895805150;
        Thu, 12 Feb 2026 03:30:05 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb33115b5amr226368085a.6.1770895804702;
        Thu, 12 Feb 2026 03:30:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ecadb27sm147972666b.63.2026.02.12.03.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:30:03 -0800 (PST)
Message-ID: <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 12:30:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698db9be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=cMzz2QcylWOBvAN0VsUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4NSBTYWx0ZWRfXz8uHZls2w1PI
 bkjUsoVDm5vgyW23yE4z/afcpTE5ULyFH92dOGA4328VtUknhEJLk+OExKV3iX3iU9y3SQZFbMM
 j55fmOqrlREjUq56VxgXhE0XnUSLVXc21Zz8T7JqrwnaacQ8Be1GyPUXLa5ZofO9SA/KCxAlxJx
 fSjMkLwmUvREQEJ66u1I01kP3iW7IvAgSoqpVoaXYxXr6G2in1e9RX+4ZfSIntK+JctKjYASEUk
 YU/uR/tAYVBl3kwY6nmL4ko1NwapmhUZlCkvm/mVuLmWxO05ltLZFfteMDkB+kx3AZqaa3FwEyv
 MaWctnGJI+cPUczF/avZQTZLoCr1hvKtOuXBrat/yMS6PuVbZKbJOj6SNHvLxc1kGG8SL8SNP+A
 4VRbzuK/DhZPfgilbUDue75TopLuLw1Uyub+OJgy4ZfwJO35j9QBgs1xx2w4dzKMFZn+iC6/azq
 E/JGIjNiIWkD6i9Ah4g==
X-Proofpoint-ORIG-GUID: PotL_6TMToWGBlHtCArSFx3Sf1qfhCLj
X-Proofpoint-GUID: PotL_6TMToWGBlHtCArSFx3Sf1qfhCLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92681-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFC0112D03D
X-Rspamd-Action: no action

On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> and aquire its minimum and maximum frequency during ICE
> device probe.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use flags (if provided) to decide on
> the rounding of the clock freq against OPP-table. Incase no flags
> are provided use default behaviour (CEIL incase of scale_up and FLOOR
> incase of ~scale_up). Disable clock scaling if OPP-table is not
> registered.
> 
> When an ICE-device specific OPP table is available, use the PM OPP
> framework to manage frequency scaling and maintain proper power-domain
> constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

[...]

> +/**
> + * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
> + * @ice: ICE driver data
> + * @target_freq: requested frequency in Hz
> + * @scale_up: If @flags is 0, choose ceil (true) or floor (false)
> + * @flags: Rounding policy (ICE_CLOCK_ROUND_*); overrides @scale_up
> + *
> + * Clamps @target_freq to the OPP range (min/max), selects an OPP per rounding
> + * policy, then applies it via dev_pm_opp_set_rate() (including voltage/PD
> + * changes).
> + *
> + * Return: 0 on success; -EOPNOTSUPP if no OPP table; or error from
> + *         dev_pm_opp_set_rate()/OPP lookup.
> + */
> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> +		       bool scale_up, unsigned int flags)
> +{
> +	int ret;
> +	unsigned long ice_freq = target_freq;
> +	struct dev_pm_opp *opp;

Reverse-Christmas-tree ordering would be neat

> +
> +	if (!ice->has_opp)
> +		return -EOPNOTSUPP;
> +
> +	/* Clamp the freq to max if target_freq is beyond supported frequencies */
> +	if (ice->max_freq && target_freq >= ice->max_freq) {
> +		ice_freq = ice->max_freq;
> +		goto scale_clock;
> +	}
> +
> +	/* Clamp the freq to min if target_freq is below supported frequencies */
> +	if (ice->min_freq && target_freq <= ice->min_freq) {
> +		ice_freq = ice->min_freq;
> +		goto scale_clock;
> +	}

The OPP framework won't let you overclock the ICE if this is what these checks
are about. Plus the clk framework will perform rounding for you too

> +
> +	switch (flags) {

Are you going to use these flags? Currently they're dead code

> +	case ICE_CLOCK_ROUND_CEIL:
> +		opp = dev_pm_opp_find_freq_ceil_indexed(ice->dev, &ice_freq, 0);

You never use the index (hardcoded to 0)

> +		break;
> +	case ICE_CLOCK_ROUND_FLOOR:
> +		opp = dev_pm_opp_find_freq_floor_indexed(ice->dev, &ice_freq, 0);
> +		break;
> +	default:
> +		if (scale_up)
> +			opp = dev_pm_opp_find_freq_ceil_indexed(ice->dev, &ice_freq, 0);
> +		else
> +			opp = dev_pm_opp_find_freq_floor_indexed(ice->dev, &ice_freq, 0);

Is this distinction necessary?

Konrad

