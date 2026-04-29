Return-Path: <linux-arm-msm+bounces-105252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N/REcEt8mlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 18:11:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C408497873
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 18:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A4A3004C91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69593FE357;
	Wed, 29 Apr 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y31XWIlu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcvwPrAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B453FF8BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 16:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479074; cv=none; b=EKU0RQWlN4hkNDBKeUFU4yWwnf7xAOO+qTFq99Jodzk3pxEpEfNkc7ADBYclatCXaN2KuCsJg2LJ8tj+imFILiYTJExoUk+A0Frn2DpX5BW98M9IG5EPZvuzHm5C7bw3VRb2xPnQfKsuOKSQMyunAGVsI5DS98qCGV2gTAcRxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479074; c=relaxed/simple;
	bh=cnfRax5wZpylx4yUhUzrhWUVFJMpDuyHxkQo+5rgTO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpiU32Z9UQQdWNwwDQ7k3aKM1EvjKcweYtnIUHUr/9dAt3UtGbl/Zqrumn/Zing14hKXutET+LAwbWcjZpVyWYN07FVNRmzocS5sSUitdBN/Aeq/jZ/G3lV8slYno98SwjuTvM9DthmxELCYwa//8imTMCNCToB83Vl5grMIsWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y31XWIlu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcvwPrAd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFN8md3066947
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 16:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY9x3mxSjUPzImVqBR5MCsdTNqZKqCBeloJrD79EG8k=; b=Y31XWIluZdt38gEC
	Coizspg0MgFLj5kS38Ql4+JehnWcwk4+KG5j178MJdiWZRWHZLcM6Xll5EcW+arT
	AC6Dnmk+bgLQGK83gLPOchJpKa95saym6NnlkpFhgTuWJY5ax2eIPxcBco0YLpQx
	s/rw8M35nQn6WQq8pnmzGk7aujzNiOWYzrWHO5y2OC4kKqh6WsfHb9mtqJ7qZby9
	78LeeJxiAXA5xqig0ozHFA4BpXMOrFr4cztGu6TGEbe/SF3JNYl951fKYznasHIl
	T+fLRcuUx3k7O+8zWiMuEqARAgQ+XMSmMGV1eFs+dLuypwGHFQmkzHwfwBx8FlNu
	a9lRqA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxbdau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 16:11:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-47545742e67so15476222b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479062; x=1778083862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DY9x3mxSjUPzImVqBR5MCsdTNqZKqCBeloJrD79EG8k=;
        b=jcvwPrAdXMx3z8WFDLyogEpek4/cbpQ9F8128baQg0bVW9JJwzKKfiiJsvOaUxXPp1
         H/tUcjotlddaVGXhuYVotz0MQWJvVkQEdwQMH0zr7LTjMTH4A25AEqrO/8mTVq7fbdao
         +A4n3d7Oyt9gz8Bkm0KsitrPvWEEFsNR8V9xHdwvdwk4KneqrZSG5wfGbUSXt02WqHBp
         VRRe/TdSgobO0MHsOXUx+XyX1kZjH61VMAsv2gCp3MecyuSdD23wbXepwm6YvBVz1JcU
         qPNvPt93iA2mCetAodEk2fuhV8xU2LH8zzvDI0b7HXTDlXrSBKqj9e3mrwWlheNj7C8k
         ql+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479062; x=1778083862;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY9x3mxSjUPzImVqBR5MCsdTNqZKqCBeloJrD79EG8k=;
        b=PLC8KP70mMm4uUwaOqrpOJhk9jpKfuHMaujEwIl9vnB40hVVKq8z3S6lT9OlNivKY0
         zt308wOnzy67QclMoOdEpOMD5PSbihDNEzZUbB2EqftWBjZzNMZGZu2cJZchHk9ZuWp5
         yUhjSQ0j3jyMPZzWDdgQSVeAxbNVUuH7I4V4/AI8kULc2ICOBMKpqbfNSz8mjaTCV/uz
         Zef58C15wXU9s4VwTnFsoAL8zTsg8xiVxtACVEnapcE5K65DdMS7XRgZqrEw7M7yiOTa
         GGkLxzVXm8O51UPjZJbWTJ7Zqxn0lBuhihuZAUK3WZCubFm1rxyqdKNlgUTBWQGlQuS3
         20TQ==
X-Gm-Message-State: AOJu0YyzPStLhvTsBsVM42y5+pJy1Ec5ueFeomqayvIo0P5gPoTSwvBt
	7mwA2GGdanVW4d3q8XSomYuYmnJrTUrpaSg0I8LaXeRiVL5jXxMkGfkT+rXfETmUcR84GVHhg2Y
	zfcuTHb+a+6lh5dz2Axh9ElQFGFmgVLuQkUAAGFvnuH2FqtO1YTE1vHuO2oEWnLwCnW8NNCgDjj
	xz
X-Gm-Gg: AeBDiet42Vk52WeiZ4Uw24rfuOn62koAgAlLZpUg3t+XEjtV4I3q5wONrcuxvg0WICw
	u6DO0LKyoORUqpGnPodCXY+KuULYuEoy40dDtP9BrdcphAZQxOQL/NUgWc6+5sO40AU8/eEuGrU
	cjF7+h0z44yt/sJqzDZ2kEptu8ffyF2xCBdET9C6tk+oVYdpNGiRl6EawdwT7plpmsy3aGuIPeI
	pLEIAexne20A5r1uIqZEGbcpxNCE3MxwqV+9Fttb2FTzzZqFd5weZDDro/7t3XKI9iaEjHnaQHX
	t54ktE3CHj/hnmLVb30SHX+XGKK0NAziHIro0PYF8RXl1Nd2IXG2U3MUB+r9vvRJBNeE3nxeo3i
	t/dI41CMs/u/4xmzw55rejHKiPUnMLyJ0u1evVFlRR1ODZDktL8astYlFWpM=
X-Received: by 2002:a05:6808:c291:b0:467:112e:4590 with SMTP id 5614622812f47-47c29070abamr3945714b6e.46.1777479061812;
        Wed, 29 Apr 2026 09:11:01 -0700 (PDT)
X-Received: by 2002:a05:6808:c291:b0:467:112e:4590 with SMTP id 5614622812f47-47c29070abamr3945700b6e.46.1777479061311;
        Wed, 29 Apr 2026 09:11:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm6696228f8f.20.2026.04.29.09.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 09:11:00 -0700 (PDT)
Message-ID: <bf37cdd6-b863-4e59-9459-3247080955a9@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: Make important drivers default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
 <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CRQ0ZFi7w65HxztMHU6hN2HMb2DYeD8q
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f22d96 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4qRup2qeAZOX9EWCK_8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfXzS3WnCcHTxRr
 KfPdBdAJjIcKX35ig4vCAbAosHt/WldVc5FziomZhNru2KdHIfy9t4jrz/1sY5bNzO4EuszZQUx
 mIIoLVHvpbqB9U2oltF/PAnJQjJdPrm1L2KRTKFy5b49l3+Saoy0wy3RpFyIGhNVNlxtb7B5NWg
 3B9PAWRcyiHfZDyRBE2M+XUtdoY1cJhhzHfAqLsY6gkwmH6fgBtUBWZHbcMLF+lwzlYtE+3lkSB
 +H7iar++2SY8RUNCnnq1dV4Oif2LqXG18CQ7FAAcPhnVdJnTr/H5IpAKhYoby8H0Yh7VjR1hkwR
 +Acr85/FThgRSPduzDE9m5s79KUL5G3JxUas2TE01mDkaPmf5sfyYjvwqehy8937rybG27JFt84
 pvavmqKr49kLI8ut8iiQP7YEQx2fwc+//ae8MRxrqKiJG8hBT/6vL3XdA81ql/+uS6TrYMIclsI
 VWEGLd4OQWvBaR5Nvag==
X-Proofpoint-ORIG-GUID: CRQ0ZFi7w65HxztMHU6hN2HMb2DYeD8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290162
X-Rspamd-Queue-Id: 3C408497873
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105252-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 29/04/2026 11:06, Konrad Dybcio wrote:
> On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
>> The drivers for Qualcomm SoC components are covering a basic or
>> fundamental SoC blocks.  Usually they are required for booting or to
>> achieve basic expected functionality when running Linux.  These drivers
>> do not represent any sort of buses visible to the board
>> designers/configurators, thus they should be always enabled, regardless
>> how SoC is used in the final board.
>>
>> Kernel configuration should not ask users choice of drivers when that
>> choice is obvious and known to the developers that answer should be
>> 'yes' or 'module'.
>>
>> Switch most of the Qualcomm SoC drivers to a default 'yes' or
>> 'module' for ARCH_QCOM, to match existing defconfig usage.
>>
>> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
>> multi_v7_defconfig.
>>
>> The change will however enable by default all drivers for arm or arm64
>> COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
>> logical: if one selects ARCH_QCOM then probably by default wants to
>> build test it entirely.  Kernels with COMPILE_TEST are not supposed to
>> be used for booting.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Please also add:
> 
> QCOM_RMTFS_MEM (required for modem)

It's in the patch.

> QCOM_SPM (cpufreq-adjacent on some platforms)

I assume only for arm, because none of arm64 compatibles are present in
upstream DTS.

> 
> Konrad


Best regards,
Krzysztof

