Return-Path: <linux-arm-msm+bounces-101495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CNINEYwzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:00:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B36386687
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D144A3088712
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16E93C65F8;
	Thu,  2 Apr 2026 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQP17MGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAz926sS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9582328E0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120061; cv=none; b=fhPo1oJV63rpwlPbZ9q+YurmL63exHOxIj4OrfCVF0wfazpBbcODm7MugsqRAUS4ASZGoGDU+PGP7x9nCcnidd3wgLJXb2UnbFyIstbsDUXI53Z7m63qWA/xtVyStp1yPVcmlYgPhm/gxpIGBk4SFeUDQ5fqGaKpuk7DSFDp7Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120061; c=relaxed/simple;
	bh=wx4f3s4Q0YmmrDaI1gSZKZ7xQGorvJMnNLeIPYRBLW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRp9SrNBuimDT1k9lIISjis09TZCV8VqNRXOyUfdXcH1xDJPZbIKhDYwqSjM4RGRw+WTCpRYGtoArVQDvvGoHtaDDX07xGHJkB27QWNc/lQSvWWvKKiArypAa/UhP7BldNpDojYwwb5qzAesvRwHKQry2063F5Wg/bg6Dp2ndDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQP17MGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAz926sS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QhuP1551221
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zn0ULxxINqSZTY311BmgCi3uX/AWPrKs6tXmK2YVbzE=; b=pQP17MGBT/fQk5M6
	pCADYGH5IwiUjrQGoP7be9Q6K8RaycbflM1dpsw4ldRrEC2cYQTYYGoozNDzJDGM
	lZfGLXOby2TEPbN/5NVa89aQYruI2jYNtP3eW/LXMJ6iqkOSnRGsFTqF3i0d11JP
	gtbSwIImnuq0GPdrpNSxxi5cWfIYNiL6IBqrimB1xZJhhTe+RoBh53VKuSan64eJ
	pecQCIgne0PrDWrtQIZjMofcqhtegkcbq2tCtFueXoW6DPK8Rqb+qT0rOWBLKdI4
	WSHvXd721MpnlhB0MO+dWTSjdj+35KboymqrOMkXfk+YChhn5/c9rcgP6Y7GT3aW
	1J4elA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9hees316-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:54:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so2697876d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120058; x=1775724858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zn0ULxxINqSZTY311BmgCi3uX/AWPrKs6tXmK2YVbzE=;
        b=QAz926sS0bGnFSr2gaYIOD3OlExlEFE3SPorFljsnvmVqXWI9xnTCUP/IvQd+2GwbO
         W7dG5mcKjr8Ty2ldd/tRiGXlEsFyt6DaOjP3QaejYFgAk+JC78aXQnpXKJjdBiK0s+NF
         cMcIhW0dvm1GSm+xuI2dl0PT1BSoFaWCof596TvMMk4zvxWf+O/wDa2IYTmjTaVcqPLY
         LzcTHRPfPx2bHeY2txpAFSNuYj+GQe/tUH0tteS+njrIVtkhxzBADJkdH7drCS8Zs7bY
         8QVYEWRQevLybx7DVAGI8XpHiGh8mAUj8Pfl59eRUgWFcKfZR6CBlyQ/qIFoT4wH6mbg
         WwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120058; x=1775724858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zn0ULxxINqSZTY311BmgCi3uX/AWPrKs6tXmK2YVbzE=;
        b=OV3I7zTvEvaetzyepWj7CWFULMEOtE2QZMbyLBeYF21G8C+fKnEOZCOsGNv84WPFW1
         SjWwvDv8QldzanH006gQbUl7ubBADQweG8G16mnl0hwv1MK7oXWWpJ+7gFowrnR2tOqY
         Yi44slJ6vFI1OIguGLAzMypTpzAs5VNjXSp4hQIoh/4OozUnFk+wW5nTOwjFBgKnS2gR
         F1ubHL75tO8CzJtPBPsSe5HJ/U2yQPT1W++EXAxo77ETw8fyr5uLixBMYKqKeWe6nwBM
         QqICa1MbHpeLpMu1iFVP4ak10wXX7/Pd3kXnV4n7Q2hg3ul2iqV4avOXoyGH/nRA5TLT
         pOTA==
X-Gm-Message-State: AOJu0YxdUB0VEluKrytahAi4O4hUYvywi6LGRgRtBorSjt8dypbrplr1
	5t/QdLo3F4W9hN57ff1UTsHYOffJuFoDiR3WVLK7gZvbg6kqAlo8yLOz61bcS3e1u/ylWYuiAU/
	9I5G4S9USpBgXpqU1LnH5Z6YSif33abbo65rGEeAbp5/aHmX0PaHo0xHHclkowbsAI4XC
X-Gm-Gg: ATEYQzwLCO0Yd75q6fuJlJjNOji2UlVUjSagzOWrUg3bXJOZuuyCd13v6DblhHFUaB9
	IhMn6/Zd/zGkofqcdjbwlGm+gOqqoxk73KBZUgoK5aKOOTS973+UPaOi6SE1UF0/gCfTRirqnwp
	T3I5xHIKj2V2MybuqUNkTsD5bhoPNbfy4yqy0pEhqihL/RBOhldliPbHqF7tCycFZgUqtn3sEPm
	3aNrsTuIqDigmz88jeEo783YLqCtXHE5wJ9xMsI0MGPnuM4H7uRQgtxpwZ10qvd9ChswE0ggABV
	tzzrp1ZaYWYIp/rTIFr0w49HiXLei6ET1uk8+liAk1hSrYU+6THS1iUSWGVBNNiAHc5om9wtAsW
	Y4WuAFJ95Y2pfZpMjicvAY1yL8bu5zWy7Z9WkiyyK9EywFbhPOSTUT+IhmnYpNmIqWzHxiIfL8q
	EsEd0=
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr75645546d6.0.1775120058056;
        Thu, 02 Apr 2026 01:54:18 -0700 (PDT)
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr75645156d6.0.1775120057621;
        Thu, 02 Apr 2026 01:54:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028995sm67009966b.57.2026.04.02.01.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:54:16 -0700 (PDT)
Message-ID: <4e06e9db-e805-4505-b9ee-636bca9a00e4@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:54:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Fix ICE reg size
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
 <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FIO8TpFrvYTbT1Mh1rkqfFy5ia0eI3XJ
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce2eba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZzotxUy_a8Dv8lCBXmsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: FIO8TpFrvYTbT1Mh1rkqfFy5ia0eI3XJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfX9FC6BvLidPw+
 lf8iA1Vv23s4UhNea1Z3f5elVwYMDMKiBXq+sgOGYWU34qiOfbLXNFhCi0U6c1O+C+iRGTspJNc
 R5+YGh1ydOqx/Zm0mHcsE3uB2n5ASx1pE/rvrDdx9B2Ru+GddIfCSECVeHexZJHYRL/pCzWCGx9
 0q5sRy9s5hI44vtcqYOgfpGYKGKOFxbKNVp/rQUhIeWR2jvW6yuP3Ritto+6/M00b43dk4Mx9MU
 TssfkQq5FQpxddDVtuMpyY4GjoQ8evkRHM/rek3lP9yGgiROGcbDMJK9H0MDs0H1PL8qjb5lwV+
 24nGk/gXLHkkEcPZdqfE3E64Ihg0yrJEReEHkaBppZU1OIU7ONyeaHwKHVSQAbXod/0dOvasnHl
 1Rw1uXvGnMszg/U+/ANdwY2VN9hk9qTXaxyCnS+i1RocpznvRNqGTHl3mXL97rbxN/63Qa2qZ3w
 XF+greZopesF2JdHmHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101495-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31B36386687
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 8:35 PM, Kuldeep Singh wrote:
> The ICE register region on Kodiak is currently defined as 0x8000 bytes.
> According to the hardware specification, the correct register size is
> 0x18000.
> 
> Update the ICE node reg property to match the hardware.
> 
> Fixes: dfd5ee7b34bb ("arm64: dts: qcom: sc7280: Add inline crypto engine")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

