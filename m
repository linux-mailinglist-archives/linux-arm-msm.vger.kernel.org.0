Return-Path: <linux-arm-msm+bounces-105152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IdLANzK8WlCkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:09:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7C491946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A558130036CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99AE3B8BD1;
	Wed, 29 Apr 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khqvgwsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRuJvQxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0A1397
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453597; cv=none; b=dGbdYRm9YYcVJ3wcJjhIaFztodndcBMOIIxvNI7aVRn9c4zRgoKGgvwwLePZ08rO7ykiRSwmsHX3g431WpboIFRAOq/98DGIMCErKaS0a4f1ta2dc1FFegbWUYQI/u0vMER/nQY3xF6rCsZp1u2ZDqPg7I9u7M3+6g3QBU4+g/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453597; c=relaxed/simple;
	bh=73FIOJekAZFHsPqtSiQstQv+0i/+IneTLHLzeFCt2PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDrVBN6INbZ70cWC/QxDtwQCURJX2zBgyZNbXfUagXuUvyuFN4cEtsWO3fmVWLdIKr3d2SqIdoXHVZmxI+XTULoTpaR8Kh0TVJyGWeTLMPuRmWkMeN+mTqlMHJQtWoI8jMgH64CS8OmJaIj98EXPGh30nfTD5dNmFxE6d+9BQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khqvgwsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRuJvQxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvP31728671
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOaQobyn6UPCXWT+acc6cZj62BqBzpWkmQ3adO+ANdc=; b=khqvgwsW986HC14e
	nurskZstQHRvZabSobQspE5Rb/Ltp+3q+AHMLF8HKVTV6P5bG9U4BoLeJ/FYDy9g
	GMsTU51XukTfmvAwqhK4v/Tt6B6PD5v8JBF8NPo5kXXhDyT9F5/EfIYfRk8d11f3
	rxlsUriEqVE2DSJWfkOBNmbMb+JRRQtXlPFGskR5JZhzZRenleuvGcs0jkSS8vBt
	FVii+vevWrTxNM74TCxkJTTt5NZCkGKrI30iNjpIyoKzS5if1Ew6yhGWb+VtLu28
	5wNvsr9507nhZfaZoo4vWkVbMEvpHbpLUZ+LpKAT0RHCeHUwPf7O/+/iU0lV6hmf
	5VqV8Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kr8ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:06:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ee3caacf5so929944e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453595; x=1778058395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOaQobyn6UPCXWT+acc6cZj62BqBzpWkmQ3adO+ANdc=;
        b=jRuJvQxFVdy7p3p63bCADTh9CQ/oWnBwtf3VigUjgGjWbHJ6Uj/KcsAsZWo73toPmr
         u6+Zo5B+ItMAyeV4Nfa3MJlPlb8NEY/BX2DE1CvcxqAGXVPR5w2glsotfpOwrtjKKkNq
         mYGzNiSdrOOaEu8n+pFd3uPEgEsMHIwKAUIibsXan9kjz9NQqLAKU32hHqDwdvEslSw2
         mNpipZbBBJGcKXnl8dY2o0CvVAeFOFCi5VLAi1of1+uF49oQhlCxmKJvlZUkQ23A6Ke3
         dAuzYM1OvYu75vAPfLWukq6rY5Cpyp5PJ7jAI6qqhFnlH7eMp8kCBzp8DW0kSPN8ZrcX
         qW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453595; x=1778058395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOaQobyn6UPCXWT+acc6cZj62BqBzpWkmQ3adO+ANdc=;
        b=KUznJTc+VCLsfX9+Xxj/Bom6xod5GCzwE5NissfLlTJ/udmSFElT6UAkbzJFYX9ziT
         p3tHGvzupcdAGLQx6mLtOhduINoypvqIKyosh3ZVzqUsvjY2lsDXrOt21vh+kGK8rTPM
         /Jg0F4d9GoQnI+H1lDIv30N/DwsXMFJN9obXusVCqu4nN+T/nH6UwNRChInOxc6Na0Dk
         UikYrT35GsDLwKwCiEFpjzuXS8CobmaA6KxAaxmGhk5b8gDXN31K3Nf/9LYr+EvN0tH9
         4+/Yg0qDG9MALE49wlEXXFUcF3zmfqs/bwDQmsNzrpXx8XjbLJct/nZ19Kh3oBVga/Ud
         NIsg==
X-Gm-Message-State: AOJu0Yx8PUouvMaKG+0OVk+X2XX+77JfG6+0EgVCpJAuiAYCsJBhn+rw
	MPslM9X0q5o7G0fF0RnDx4kBmbFDSDn1M3ei6+YiFwPkIa4QHysdppgmExkgLJR6a0lJ7eysO85
	UxAsk2zxpxyOHueJAuUiMyAfDJ7JnMgzI8NGZ+NKNZFHM6z9LPbyN82BW25kvbzkiPpVr
X-Gm-Gg: AeBDievZqRvwdIr2SpsrW0y2iiG9XzQ2I/e9E37j6hcpSyI6hAuYEkuN++ZYsgAPvBx
	ubAFedc67Mr+s7oQ4UzejGsapb2vl4wAUPkiAVARhuc3OTtcBPCjc6t5vEyM/Xvsu8EbARpWEvG
	G/E5SClqvlSylZEJ1HXpj3ywXuhxAlYdQrq858znZwQuiR3qKZqsifXvs+Aiz424CX6gilMsoMi
	NOBCY7JE/i/OXY7JYM8Sk2ZJVddoTZsFRI0aHCDEq6JZOIltA7g0jeFN1fzb4TWMJ2VEuayXwaX
	1muP1psr2qUQPss/qPkvISYiGxA+6ZIe+0feCm9AXb1Z3kGqrqWDiUQDtxUSMgW9UbXd4ad4BGr
	g8X8MR4ISQTwxSyU1UU+vBeV6QjGvMwXBgGMKA4f5N5/34e+mCihmPLvwzJCmND+Mu1e6VZ+fcQ
	UvV3TWdff3ZQkFYw==
X-Received: by 2002:a05:6123:5d5:10b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573abb57fc8mr1005733e0c.3.1777453594888;
        Wed, 29 Apr 2026 02:06:34 -0700 (PDT)
X-Received: by 2002:a05:6123:5d5:10b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573abb57fc8mr1005726e0c.3.1777453594520;
        Wed, 29 Apr 2026 02:06:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb985e250basm62494966b.53.2026.04.29.02.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:06:33 -0700 (PDT)
Message-ID: <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:06:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MSBTYWx0ZWRfX/qqPgdpTBFT1
 NufOL8cQDfstKJayGvEBBWX2J7VwO+zViLb2lNStpsWNU56DOo8SPDeLFLtvLzipgvYuxOioEve
 pLCa6Ca6081+1a/f7YJzvMGt2BgJLMsoEilZVlZ+kDSLu37127gxZY5TOpE46+CJUfKr8i9KlNP
 fy8baULY/H7GVkPBHPU0SmEPrSHbsNPoP0PzrzS2af8vepgnDVO5aNorQfabK/tY9MVy8I6KhDt
 /2mGeC1y95tp5WoSkELHdLLTwhn+RA7rO8NfKM2rAxhtYZzTnIZo3mxxV5r5j2Q6mZIyeGDPQzq
 GiNv7/1kft2iWdbTkNxcU5uN1B2wSrPPBIqxN2qSm6BwcfiIgfbNRRQiUwD04tkSXHLcg83rrE0
 uy/16N6TLEyVtK0+GA9YIy/wYlWQWKi4IpQINtw2wYOS8lmp7PivEVFqeA+MKHMwj2Mtv0koM9Q
 BqyClBe1lg5+hgGouGA==
X-Proofpoint-GUID: Ddul9gGWCUk1VtyrwOrwf1nmKbZe4s2D
X-Proofpoint-ORIG-GUID: Ddul9gGWCUk1VtyrwOrwf1nmKbZe4s2D
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1ca1b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oiTh_mz6bHpUs43kViQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290091
X-Rspamd-Queue-Id: 41A7C491946
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105152-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
> The drivers for Qualcomm SoC components are covering a basic or
> fundamental SoC blocks.  Usually they are required for booting or to
> achieve basic expected functionality when running Linux.  These drivers
> do not represent any sort of buses visible to the board
> designers/configurators, thus they should be always enabled, regardless
> how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch most of the Qualcomm SoC drivers to a default 'yes' or
> 'module' for ARCH_QCOM, to match existing defconfig usage.
> 
> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
> multi_v7_defconfig.
> 
> The change will however enable by default all drivers for arm or arm64
> COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
> logical: if one selects ARCH_QCOM then probably by default wants to
> build test it entirely.  Kernels with COMPILE_TEST are not supposed to
> be used for booting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Please also add:

QCOM_RMTFS_MEM (required for modem)
QCOM_SPM (cpufreq-adjacent on some platforms)

Konrad

