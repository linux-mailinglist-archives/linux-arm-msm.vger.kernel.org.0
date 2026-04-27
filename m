Return-Path: <linux-arm-msm+bounces-104692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LETLCxE472mD+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:18:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA2470CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3111830156F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CE8309EE9;
	Mon, 27 Apr 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8KlCH0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKhGHSnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C630AAA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285110; cv=none; b=S8vFZBthfLlBS0/jFV7YrdmG6v85d+udn7IFKT2KeDFlIZkH5wT+ivX+jWLrls4VbPCsg4axjAgLusWDxJAokE1o3f0ohWh2GqRDWP+1Y4g/e80HrvQDzKf7gVnjb+0ilakLAK2hfw0BYWR6TxX8c/O0w+oruboyJ8BpcO3DvU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285110; c=relaxed/simple;
	bh=qi07rhbkZX5kV1q7T3eMORzlTK+gMtVNcpbOp1pndqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fkw7+yMF2ldDNtdEqioqeesuYcO0MswXIpo4y9yZIrHbwHicKSfe7bRdgFYLFNVmiR5O4X+SFT829OLzaDUf2drV+1F2teECVG32YCD44jCvRaqdK3w5GFtfgKFGhgxI8MS/6yKtIrLq9GCl9BSt6dVeb/2h0NT4iRsajh8zlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8KlCH0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKhGHSnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TEF32793226
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=; b=B8KlCH0Wvv4A+Cnf
	aAVr7DHhtWimI/NUqHBH91bRFRAutSWQkMrCJksWuA5WWWUPvmRoK/lkKC+RNSCf
	Qw/8gGVTHITFDlI3p5hT4tFg8JghvCccvuc/gSfh1HNyx/Hx5XHnhcwA04LJ3y0i
	tppEJBrhIJOY0EfVNOreAVkGgYdyf/QDXuJBCaKzjz7DVf9ZC3nj0HUcGh3N/uxa
	gM+jqtlHAhfZe1jXx5KHrcLW7lJXrKMp0DBwybqp3JixYQzCjZG6MLy+XKRDxtGd
	PePi5ToaWJJiQTWKCmKP3WajGdCpReYNUzApTcm9iiNREyyqNga7379Vo2seVEhS
	Xk21tg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uuq6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:18:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b047093195so18526126d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285107; x=1777889907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=;
        b=ZKhGHSnPnr+GKviibXPWqyWgvYLS7TGAWh23aRtx7FKhlxF6Fmcww/kpq3Q3Erc8IW
         fDlCkUDIB+uKNpQt6AZopdS+vjSzzG6BBLykW83Ja9Yd7D5tFB2dGiyeXOYCDhAfk9CE
         cUjf23E8z0H7CZ5fzUW5r7KdluurA9MI4V5arSnk9oXoKfz6koiNqhUBP6b7SGRiJqUm
         4UMG8nANVMFXKWjKnDuSbkJd4x2n7T1a33fq+tZRmtf6dxWjRpto6GgpF650fbjMdeBZ
         Cl2vxlSxFEOWqqOFnM/rK3DIaX93gsp+SEhOBem0kXlHchtD8+MiB8+AQ7vRhAOg+Ueu
         gRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285107; x=1777889907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=;
        b=Xm3USnfSxMypd7Way9O68N58yB508DGa58OjjIsAROybpy7fULRKluJGX6/v28ebE4
         PbijSDYzhqR7r0MhGs6iEdAY/qQoOLk+Q4G/IslG/5SHieuGy7Yz55GNbxnHfEJLQJp0
         5Ec+wspGd08khs0C0GpyRq2RSQ9LW26NgzA+TlgwiAWVLEHoVnyJ3VXlMcUgtvRpKzHc
         H6Uqr9WqpcnZz25e2dAQc53Yh2DfkIkQOoqm/phMxY8qMAt2p4GHcLCFt8tVLmHz9Bu9
         TOaJknKchY5c+gawzNO8nc9PM8gPMOu5C/F6WpEcsUIhwnc1WyNH9N6ADz7xgJyflFLk
         JZBg==
X-Forwarded-Encrypted: i=1; AFNElJ+GUB66BTfDJ4dtHIs1keK8jgixGm8GnUaFU4ScnabM5YSO0PCMSC6WI2f/nAb2/Zvy3qFI+WeXdCGEcUyE@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAnlHEeMK6gvOs85v9zniIf6uxaNbJinCfXmLeGuFmuOAtNKY
	MKviC/3c/4EbKwkG3tFViWXyfsqLPfEc4eHk6q31uQl2REnyUQBRPuh2S56HvV1hUMNwoSGk5l8
	4Ydq6LEhwyko0TW3x4ysU4FAiZwOym9JIJV9P2BomlwOAytqFlJJ+OrGyXrD0tCJjOJC8
X-Gm-Gg: AeBDietHoAZRF5vT/kWMz9wggkJu1ejDnSwMMAJ1POmmqA0YKQkTK0ka+5kVUBJsCpZ
	fhz/mtq1pNXGowjokLDpzDb2Zp9TmZ8/O0OmZruaG/8MbfLn9SWviPenZ+3YnFWAefZImkKqwfT
	v9ZdTTOxNloYBLzjxR7xkxhs7EVXyfv6+vWcdEYkCaJj7O4TyNkfz6CTqiVR8PP3hLG5GLUJZ0k
	htYaQGzj7ul46z9yRygvMVLRl21DIbRt5qZOA7Ewvb0TrSl0mudRU2u1SxcnXQr8hPNWoIbX6cg
	tyvs7w4MqcZ8VSpV4xnfy/gbeWFA7PWlTSKVRZBqqfnxe7LFWAqar10tuWKA5D0pq508dnpFx90
	DU3aeG33hZYUcBkQqv9AMOTWRMAo5b1snH9sFuhTLO/YtRHfnJ55jSC3F/gKeKQOCcA0MJeboU3
	ToGTeeE5PB5DAY2g==
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr461283596d6.6.1777285106684;
        Mon, 27 Apr 2026 03:18:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr461283306d6.6.1777285106202;
        Mon, 27 Apr 2026 03:18:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455043cdbsm1104657566b.46.2026.04.27.03.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:18:25 -0700 (PDT)
Message-ID: <54cd62f7-bccd-40e5-be19-624cea3dd1ae@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:18:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xbnr5-YFXWyiUufQ-bUY95KivProU3fT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfX9afcex4Ns4K2
 BoTc3qwMBa0qBvOKS7B0yLK9hMFtCeSXxTCEMdPsj/8Guu4RJd43EiDSsxWPI9J7CGy3hLBICWH
 mE3fhFED+ic+eg6qyR4QX2ZedWlGSq5TTAeA2yWz7Jm0V+YRmLK/BRF9XWcKCk+dUoFEI/6+qkN
 AMLF5q+WiQtsnSRUNXBu/1s0+40oFyGFjjhkQreM5efy1ck/jB/zbdxssqIsBuXlOX9K0k5HRB1
 BxgRBgXyNOcwi1x3ayzz5COT46MzyfYHRg4gWkDnoAxYg5G7gvjvy6vGnbeXH7WeIgvuGzavDoZ
 5catv9ugAuq5WgGJjswxnD3fHP6M3isPEldou3iUwCzDK0SENeujutODBKZa0mb6gjeeM3tPmlk
 etx9OHbAL766c6NsDJrgpR91DG6jYvB3cz9BVo0rnEWg6cRnD+v3tzI36qjJVvvTsu6Ao7KuUxM
 VnIAaWdL1pgTgAXr4mw==
X-Proofpoint-ORIG-GUID: xbnr5-YFXWyiUufQ-bUY95KivProU3fT
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef37f3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rorZNA5PaGnq6atEbW0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270109
X-Rspamd-Queue-Id: D9DA2470CEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104692-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/25/26 5:55 PM, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig: enable PINCTRL_SM7150 and PINCTRL_HAWI, which were
>    not selected before but should be, because these platforms need them
>    for proper boot.
> 
> 2. arm qcom_defconfig: no changes.
> 
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
> 
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

