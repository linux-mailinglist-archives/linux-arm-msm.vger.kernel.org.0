Return-Path: <linux-arm-msm+bounces-116012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7D/rOupbRmqCRgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:39:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE4F6F7B81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:39:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/7bB8IL";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b1H3iuTJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116012-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116012-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B96F530CBB2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE9747DD42;
	Thu,  2 Jul 2026 12:17:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C53C345B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:17:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994660; cv=none; b=kUZw1T9DSasQaLpL/FRFIhcnxTnF5HvteCsQsOc85Re2Yg7lOmPdSk27AKDSXcvbyJMEJeOUv+YXc8+X44bOk7/XFTk5b7VibJCmAqEdpL1ZH4KfxohbfxnGWTRK0KhAgLmqcXUKwTpM1slAd+0UcT0u4PyBIkFJze+3TZOGw3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994660; c=relaxed/simple;
	bh=d2zjVFisejDw5DlWK3026+2i4XLfiQgYGnyp8NqtcPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lhs5Qyu9tjM+5J+B18eH+5D+vJCa/avJJLjg1TNZ8AxzQNUstlbKDneVBwn+OtrUkRZWbAZXtdxliuhvDr/ofyq0Z6nAJkxd/k5x+vuunL+Rl3bmY4wtHWsBIaJ3U96OP+mIYxFnK28lLsgBViSnNbh7e72g/EMcGqv4M0G+34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/7bB8IL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1H3iuTJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nRoT4139546
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=; b=k/7bB8ILtTDhbbU+
	q/jbwd4Ps+xgqOjcsez/it8MIa44mRiNh03RNDg+3t824EkvbbLt9A3v3UD4dbLE
	ssra3Hs3MkmNwczHwFX0jO86vm4DHoU3WzVFwAOEN53E+OA0DauuAtiIT/LrOTCt
	4ftFjypqoD/H7SPlkJRGGbJ2TnGYKNH5GBLsyNLuQpsN3M3rx1ffRMYQ96QNJ/Ib
	FZhmndeor/IuBW0f5ljHCmclwQkVajnNoKO+NKuaXdoqbP3MA/437fgxSJw7uD1K
	iPtdVLhU2E3Ly3j1HpDeuLIHSB21e8rBJwO/JrGaxsdWL/cqap9UKTZq33QT5KMY
	dFM8Lw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8hwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:17:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so4497251cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994658; x=1783599458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=b1H3iuTJRjEcV2KD+gpqTKfT3QlVRAIXsduUOCS4ojpuOdGVx1g3td532a0s5WInp7
         2jUvWxaheRZ2+oxzIeqdM4Kkuy7nJMNm7ul+X0Ebm7sf8XSUikUaGr/K9p2HluOqDT1A
         y37SP6hIOXCXJUu9ucQbTbz0Z3RVadWo/5ytXP4rY8RuySJb8MEkEjrWAFmoTuedNEvt
         j6w+3qdLttWex15pr/I8QZJqBbCwA9J/WbED7P94K+U9Rjx5ij04idx8jAP4mdiL5KtK
         DGLlsSBHeUZ1nlbWlyIu+smbAQF9iDjw0E1TciUoNpODEHMDRKtxi1tvwl7o15/nIE0O
         koUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994658; x=1783599458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=nwbQj49dRRGqcYwEN9Q4+gg4hmoy28eK8c4SsJWJ/8Kmd7Q0K1ajqG3+YzBQGfSOcs
         gkmUYip/cj205ktrKF/d8DhxOB+3O+FZzy4eqOxKMFZZAZoja5IuYgYuJaaAMOHKDxnh
         2FUgQJR/ooYrt4FSMzKSWBf9svIVh887Z4M1APJZ3iwGqqIjqKdb49u+4ZJOGZWUgLrU
         qdpQceCJhp9zD7I7oMRPmp8R9QAddRK6TIKgfRamHSaYMCPpgEb88PvrJtDSO+f8iJF8
         Es9al5mw0AWw37elhag5dizZITzGk8FxiPdKpXKVv+LI313rLeS2lkRfuUXWSMCnAF4Y
         8G5w==
X-Forwarded-Encrypted: i=1; AFNElJ+PpiwYh7md9F48kfVHtKSNkhGbpNBLaPLV2MbQqC3UfnXKouEPfQOCsLyQcMCBQL8h7Vy7EpDUeSj+wh4M@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4QlHA8t6YHRHSun/6KQTHRF9ZtExVmO1q3T+D5a0KMIr2GNBN
	6fzraQrHLyQ9NvR5mn//R1i3mFvFRD5VmymR1TSAFHmx0XvkkSCFnofxTOlfMd2X2NloxgSKX4R
	vvgqCtAFH+Gjeu2osg7ORC2v6VDaSAXE8Al3wKwWp8tpnS9ivSUqOMgIFzmzINt6Mav5u
X-Gm-Gg: AfdE7cnFUQF780Q1jVYiFm/q0tcs/vG5Ls7qjpm3fvCqBFRwTVq6NzcYTpehknYJpUm
	5HlU7j9ZvNSwUCLuwsk6U0IHGwtHrvIC46/4hRD0fZ1TPReC695kw6JUG3lkBRh8s+6CFJR+Tww
	n59JPjMBbYC4VPIJR2ntIfmZVhk1fxigYeB9PGzOU2w1Sf08f66iLfBRgbl3o+aSx6xtlySf1M/
	mBpZuiRPiARgyDSkdT0ou8U7jwjzpTmGikR8U0dw3ElGzIX2cN5fs8toO10ujFpFyiU6hlYjSwc
	/Iq+bvTM8m/DuTA/F65LZSyATy1U81ewl+t8+3wxXJZ8GgsVhUsCIrSS9WA18fXSuwEVq4I7ee7
	/ETK9TIHP5kRAU4k7Y2O2PdOX8D6sVpVyQvg=
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48830301cf.2.1782994657826;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48829951cf.2.1782994657207;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm122892566b.16.2026.07.02.05.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:17:36 -0700 (PDT)
Message-ID: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:17:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mhAqXVOZpXf0wRveKuP0qz0Am1YE20uw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX20pWXzhVH3Nb
 CMor9l2qu8aZSAnnfrtS50z5YIGLjrMjPZs00RsbgIyiqfV9cgCyTgAOy+eOdFFZ5bwiMmi6kym
 cr6zqtvA/75uQCVxnbH7nkxqSKTvNDo=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a4656e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4cq-bv2Ru7092N9bbaEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: mhAqXVOZpXf0wRveKuP0qz0Am1YE20uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX8L/nGhAdqTQK
 9QuBrHH1WhVSGuff84XaNWjgUAC6H0w+VyxBz1cX7Y71Lo3pnTSFAo34+E6Ik3Ap3LBi56szTr4
 e02esq5k1UD+6X9N2xK1MWimR6DJqwlFRSFOTrWvHSpJu5wwNjbFq44Jqb+MGzv5w5LCiBZSu0o
 S949LwMc8GTRgYkrYdzaU2tccL8ksrrSPHgFGl4ZSjRcOccPCIsj+IeLihdw7hsxGXSJdFubYIM
 7ZqrNjOy3SDBD36DLEQCrGsNr0dKcsbWRvpcMrsINQbIJUoNHvg1MdhfZI/CUXjnsMlT+eISdMg
 ngqMQXoqfALQI1DD+OqU7c13uRh3MjlsyClVKFSvSkHvY4an271640bK+BW+GOZD4DPradchceq
 HMZozWn+opq1vyEqBHWLjrfAR8CiAENun6ErHMjNwzZ9NPLaKtq4aNM7UrC39JTGYAkANKIlQ7x
 5Oo+/KEfDx8EkB2iOeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116012-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AE4F6F7B81

On 7/1/26 12:37 PM, Daniel Lezcano wrote:
> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
> 
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.

[...]

> +&thermal_zones {
> +	ec-keyboard-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <1000>;
> +
> +		thermal-sensors = <&ec 1>;

Do you think it'd be worth to add dt-bindings defines to avoid raw
numbers here?

[...]

> +		cooling-maps {
> +			map0 {
> +				trip = <&ec_charging_psv0>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +
> +	};

Stray \n above

Otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


