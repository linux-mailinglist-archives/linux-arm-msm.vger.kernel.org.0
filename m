Return-Path: <linux-arm-msm+bounces-107374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH5sO1+ZBGqwLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:31:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0098B536309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95579301C02B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C7047ECE2;
	Wed, 13 May 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2JhHYCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPgesYYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D530ACF2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685268; cv=none; b=j3noYovCNO2IBeoa/ScIxaDMfaMcj3B0Sq9IkD71t3eJ63Ab/X2jWxheJ1LJss5CbNp9fXhRHC0UEIVrV9qIzomUwVkIGWyt+XE+189noVZsdzJw2AdME2WcgxePAoECeP0shLoQDTbcNQom6Mnd+kSUmq8OogC0mU5Ep4nVSsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685268; c=relaxed/simple;
	bh=Xpe+7OwmMZuuj00e6mntMYVTzw2vd5zumxJHZHdvMNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JC4PMGjZDi8JctoIzdidhsYtxEAQ0ZCZnqbhDcAyLPF+Y27/lct3Q48R+5tf0mbZI+QWSutVq5t3J5YvQcKq8s7iiTB6CYKUy86lHi2SQrSRQPvBdotbgDQMbe0zKNlXH+YE8yQ7s7iGzl1S9a4FlD23sCngqlt7rKboZPVrqmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2JhHYCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPgesYYo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWCQb2321270
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=; b=M2JhHYCyn5lAOr3R
	n4UHLY03f7KpqCz0UFUF/L231DZ79ATU7TsN2F69dnFm/NzCBpYFW3YC+rT9tkvg
	eSTT2pp47Bq/1EtOWpJQ90jTS1/awM5ogZ/l6nX2x3G1m+8GAgqeEq9p1kS7KIsd
	7I/TzBorh2sE18uF+TWeq772WfVS4Uo0tnYC3MZl5LeN1qITI5xkD96R9o+LjNxf
	xNs+mu4Hfi/lARFJ29x+RmtqeXGO+IiOrwr4Y83qTDx/DPrC2OAw+pAWbpv3umIG
	+/TPZSvTCffuyKlZ14UHQtfDFfjuj3IKGqtREpHey4j90llAQgxHFSiQM4e0lG/4
	GNOfEQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguan6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:14:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cdcf8363bso3035607241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778685265; x=1779290065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=;
        b=iPgesYYocx6mAjoTE3CoKJ1ii9f9btzyS90RpVMxgEP8gumuP+hhZ7GYn/5wIePYrw
         nOTsk8iKQtAixZ1tPW3hsCXLlM76eVh8eODTi2rS6CJPwqP4lwjQbwU9gP85z0R+9Iao
         BeIgDsUOJfOAHfwMxWOunFG22PB37UTbV2XV8I839sdiL4pymQj3pFn82zqhuJoVUUKI
         Z7ZL3fMlgWtz8rjwg1v0POm8X9UOrW3m6js7BAIjqXt6SXyIEvmC7w83lMlvxQfrRqcZ
         JGDNrzoRRPVQJYtzCwdX9hB3mUwviH8KhU65wXhe3J3jF4h9XHqvypEui+GpOXXmwpj3
         YJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778685265; x=1779290065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=;
        b=dmmclUmDwJ1LnmycDJkX8IexEbdTjvh1RBKQ/II4lAIpykyu7Pr0L8hW/xxgfRR9Qy
         WstinD8jFm9rNTdloQ8O5NfGk7C62dmBPeOmoO2i7WhRvGLOZrNt/IofpjcdFMGEN/Qj
         VunuZFuqTUEj1qpcOImskFJvPJrcgFvTVsBQ9ZhPAxYUfLIdoepzrMf49jiURryfyM79
         +xnk5Ow0/1JPGDU6qkHPMC/6Cj3pWQ3qbqE78JzTc+YwMKsE5NiucmcANpabvu9wfDWV
         LmfEzlCXbrgGvvvhjIHsIWs2bwOyFf+GFOC3sxYaWQc40EBjYvXwcdVAbVa/mJudbTlV
         5mSw==
X-Forwarded-Encrypted: i=1; AFNElJ8Bd7Y5uPKDdM0RCnpQip+7dUrcXjMPvJ1YZROF4k1grzu+fnEdaDe4K3QOGIrfsC/gdlbGjic2tcD2lYr3@vger.kernel.org
X-Gm-Message-State: AOJu0YxiK/hd8YKuINRNMvSgE3f8W1ecOJUkZ1wnu6ULXO2cpKax+hiV
	rKi56TJsyWbIW1jKReTEwRinmWXSCtS6/v06qVc4qVfd1Et50saHGUZQYoqJu/p2ct4TciB5UMf
	jfyUI8wzE6yf+vvAe+nsNCGvCaCsab561+jjoWZ6LG9C0r414DfY76m2spTMy2mDDoqhJ
X-Gm-Gg: Acq92OGFcupDGISalg0P7OOXhDLmt9jHOB2EM+8evwULcwPTtxa6u4sLzpar5ED1pZQ
	zQpmxH5OuZVWF+Sbr5lH2xGGQocUYTwp+Dwd2kA1CCEdA/dqg7uot1712TnHJ2TzHg4FEBrJfps
	YnWjOGlMkULXYluK7zdoObu7BtS2B6XRQaGbgo5Rnkz+lv7ImrEQ2sSs5nWBWiJ+ZGeYnqVsdNo
	I4aDoubzsQ27ge+EBionwnD++5pL+lNfIxBMSVNrEsyJcITpBI3hsRbd63TTNmDPM3uYr7mIq5w
	DJrS7WoQAyifXctWzyAB6UOKXmzFMUHFGGO2hFjKbND/7uqn9R2cmQaftPFm2rNpR7hNmg5s6wL
	siTLn8vxnguTeTQdafa4/UuFur4SeQBz6U2IM/WzuaoV+sW/saEX3gjJKY5PHigursx4eYe92tI
	mU9AD1PtbeQt9iWU+VW0tuZzQnURmIKEaix4cNNLmG5Bb1YNC85fJ9GFXnhyKRhg==
X-Received: by 2002:a05:6102:b10:b0:631:5ef5:8325 with SMTP id ada2fe7eead31-637a7973223mr1260291137.8.1778685264847;
        Wed, 13 May 2026 08:14:24 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:631:5ef5:8325 with SMTP id ada2fe7eead31-637a7973223mr1260208137.8.1778685264069;
        Wed, 13 May 2026 08:14:24 -0700 (PDT)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95661aasm4088965e87.68.2026.05.13.08.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:14:21 -0700 (PDT)
Message-ID: <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
Date: Wed, 13 May 2026 18:14:20 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a049552 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G-sZjMlHS12s_U-QxDAA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: X6fkvVg-yCihZx26oXfXwWnO5RPjWTQi
X-Proofpoint-ORIG-GUID: X6fkvVg-yCihZx26oXfXwWnO5RPjWTQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfX0PFhUUuBKHTV
 XgZz0b5zVmzPLdw3g0t7L1smfRJTBdC5BDcJvH1S5qhW5Bjes0ZwRRyW7U9Gk8s6c/KbZ9jUmuA
 Qu81GcrzSRP+JnvfgHKnfSQ2U0++8GJhsEghLUo1ifvu2evZvd1HUULbmsRhCvzlmAHmAPzjnwE
 DGMHUb17ZXQp1dLblQiw9Bk4t9N/G6Oyj4U9DU7QFnU4qMxV3LaUbu978xq2Npv1fkME9y2lOC1
 k1csDT/NaXhaHG8MxDjVBOOxybNkxCzMOcNXebiyd0HidHnqHgpuj7M4YQnwHoPL0w0/rQfuNOs
 Nxkg8izNd+mNPTnNfQ7sggZ1GfyUkgb7mszRvFUFu9UNHlIeFfX/BdJsASqxcAdj+vIcSs7j3V3
 5r4gAzfwh604sFZpLSoFmLOoOxZ7BAi0dlFNY7bq/Pg7wnpd88Xhv1j13nsQZPBPEamR6+AsKPz
 wtzAZN4jFEpwZclLgZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130155
X-Rspamd-Queue-Id: 0098B536309
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,oss.qualcomm.com,kernel.org,lists.infradead.org,linaro.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-107374-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 13/05/2026 17:29, Rakesh Kota wrote:
> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
>>> --
>>>
>>> commit 457abf6e7ac410430c866842e08e602ec3daaa51
>>> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>
>>> arm64: dts: qcom: Add Shikra CQM SoM platform
>>>
>>> Add device tree include for the CQM variant of the Shikra System-on-Module.
>>> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
>>> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>>> new file mode 100644
>>>> index 0000000000000..401e71720519d
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>> [ ... ]
>>>> +&rpm_requests {
>>>> +	regulators {
>>>> +		compatible = "qcom,rpm-pm2250-regulators";
>>>
>>> Since the commit message indicates this is a PM4125 PMIC, should the
>>> compatible string include a specific identifier for the actual hardware?
>>>
>>> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
>>> the fallback allows the kernel to apply specific quirks if PM4125 errata
>>> are discovered later.
>>
>> This can be ignored. The compat is a leftover from the historically
>> incorrect naming.
>>
>>>
>>>> +
>>>> +		pm4125_s2: s2 {
>>>> +			regulator-min-microvolt = <1000000>;
>>>> +			regulator-max-microvolt = <1200000>;
>>>> +		};
>>>
>>> Do these regulators need to explicitly define their input supply dependencies
>>> such as vdd_s2-supply?
>>>
>>> Without these properties, the regulator framework might be unaware that the
>>> PMIC regulators draw power from upstream supplies.
>>>
>>> If the kernel dynamically manages the upstream supply and its reference count
>>> drops to zero, could it be disabled, causing an unexpected power loss for
>>> downstream components?
>>
>> And this is a correct comment. Please provide missing supplies.
>>
> As per the Qualcomm system design, the parent-child supply relationship
> is managed by the RPM firmware, not the Linux regulator framework. The
> RPM ensures the parent supply is never disabled until all subsystem
> votes are cleared.

How is this different from other, previous platforms?

-- 
With best wishes
Dmitry

