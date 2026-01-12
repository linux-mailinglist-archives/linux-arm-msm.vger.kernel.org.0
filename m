Return-Path: <linux-arm-msm+bounces-88634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D05D158A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 23:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36EF5302DCAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 22:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1532534AB03;
	Mon, 12 Jan 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXjoBguP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVzlPP4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555D217F27
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768255962; cv=none; b=az+MhqUK/nDTRDX+tO5LLkG3StsVj12QxXQVjlo0LawilSSY0AOMpFnOK3h0VJ7iaJAzOENBIZ+BgJI7Su+Bnt4o7BomLkNH1AmIQ4ym7GYiE5TKYxxOouZihs5vV019+WZ/43RPMi6nR8yScFcoGgx+ckottWvIfTLy8DBo49U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768255962; c=relaxed/simple;
	bh=7mAdSEHLYXU3Z13MUQMgyUsl6jtAA3o3vfnyTnKLfYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oE+uWGT7G65XWxFlT5RtkFWjRSgHNAcIudhQTJBZLQHRVcD9z/rQv7L0Zm1S41EfKpzmk29gdSIyE0bEkOc8jM5Bz35/laYARDsHaqOM0Lup+PSLp8R1R32ZuhAcnVSnH0KG0Ok7kAsgKaJjIhe4Epe3fMSmLw7F4FAmL7RRJno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXjoBguP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVzlPP4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHvbo72224705
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aoe23L4OFK89AKOHuwNRlqeZ/C+XhTJjPPU/IbqAxr0=; b=UXjoBguPUfkG/l/s
	WWNhwYhzNc9PRkwoZIHPxrt8sIX7Xav971IOjT1ruT+4V63uR4ZIU7j0o/AQnfvi
	j6Wrv5RtNKt2fidosE+LbRRHEfGv3Hw0ml2tElb+nQtZR7avVRpdHvl20LfJUz3x
	n1zT94jo1y/rR8tI5pRnzNKOSS6RLcGI4hxu9mrXGFRpIPnoPu6yqc91IK0lkWC9
	r2qRoFQwBDGCpkiIeJVPoXWC9N6q9HYxvnagrYWEPRUr3aQoP6MeBti0vfbCGL4e
	dZzEt5fwE8BDBNjDqkTlAiz6EQ7vucRgbj5QbQEzb0Xie8IumMxAOfBxBc6hMqSI
	BK+Fqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn5tjrq3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:12:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb3388703dso2818866385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 14:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768255958; x=1768860758; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aoe23L4OFK89AKOHuwNRlqeZ/C+XhTJjPPU/IbqAxr0=;
        b=BVzlPP4xKcA5MDmK5su35xc41Pyrh9Ko6WWpDWB2ADZjscyBPuYUUwJF+JwQqjN18E
         6lHbECG/eVMbosYw639GbSwcv00yZS42emN/t5J68kR2EPHhd5BRBwGChQSphygxKbk+
         7UP2TB/2+SV5I/L6p7XfJOngKlF/aLGnh32FnxAzG3XISYakQA2ooZOwJV8P/qE5BEVn
         TsBLVajHHn+7htGwuc0LC8SPtxX/FqfCiJL3aAZRcSKRxd8ch1ssmesKQG4ZUNvbTL7v
         Wnd/ASQgrN1elx3GC4umrMEY6o41FdRblU/Tzfz6TxWSXYJNRFLms2y1aZosNYvhGfHE
         uQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768255958; x=1768860758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoe23L4OFK89AKOHuwNRlqeZ/C+XhTJjPPU/IbqAxr0=;
        b=nHccT6cFUlHwHJ0yXJoFhONKCwBvIABjLJ5wp89kCKDlmAGx0mMI0f3Ys2Wg/3bU+6
         GvGHen9U9xq0YYRyu6c+FIAcFu48HOg/+lzKe4gEX/UJZCHtS9fBEp4HhQlHru+RqybW
         B8AeRuefXnvQJPHp02vLA2w+18nI3YlxsWHBaSUOFKWAxuYtMjT+s77RO/gu8A35g/Ql
         5FYH0jbCQtR6AmuPJaQoim3G5DGooV4TenDD/yjuHYkWX1Rjp5+2YFm85kt2Laoh3Yqc
         01c46VcruBWYVsdj4wEnVOUJoyFzWVBo7QRq3e4JWz2oDIl+Rgwmyt84bX73li6O5a4I
         fnGg==
X-Forwarded-Encrypted: i=1; AJvYcCUjYOYLn4YaGLjtLRPW/yVm5zqljuLzUgTpGUjrJmMkvrOtNa4ytY74cjVUb/ZTNGO8KFDRrvWGJsZA5A+D@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6Fp3Q+KL46OOWG7NIVr/HA6wb3ISRYxuNSQ9DghZaYx8uqm6
	3J2LF7cG2oEJfv1+vS06S0gIgreZFMiox4jqIxiQca1SpO8eCS2vSJFB9nZWTZzWIgWHL9boOa9
	7LnJh0zeNHIv7l/ZTh/TO01zj8oidQzPRN1tmbgw9XuL0IlAQG+HxVLVnKdBIhYMr9F8p
X-Gm-Gg: AY/fxX7ls48JuM7+O6SAahBG11FcUpY/h1Jc9lj9jTTlk72AS758VvCeEAY0zNGudg/
	me7gqn2dcxlvWbqz9080LvOibd3FnJuX5DzsShlc9co+C1zsxLgn1J99l1qKA7fB/hRx5auKgYg
	AZgwuJ3KAvjRBwOIYh8tQ6gLn7pBPmIUQ+Jqso5BgE0hmtrlVpc0tsCiNuoP/H9TVE9cgGF0err
	TRaxh43HE7RrOhjg1BUlD2OOcBQ2yR+3m+SE2hLsah8hJIQ8VIxvkBm8C7L7rI02/PPn/gI5T9p
	3GSEd6hbwZmtUdWwbsC0wYtV+6DDOqxb5tKacsm82/U0xxuJFjFlsx1ULPB/vlSkzDKlLs+AcqS
	ey2Z8cf0U1Jz8IBBCq+ck2e6n7bmxoJXF7Sus1Whnac6gDbTo4ktEOVc0S6lf8lW5poM+xsyWkO
	qlVcNvKbERsWkB1ImlVa6Q59w=
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr2764977885a.1.1768255957705;
        Mon, 12 Jan 2026 14:12:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpWfaC6zzmGNW08ncO6Yj4tWMEC+55OjIaJfdURxdPuZnVHLaVtN8kFv+kvi7VNbaF0Ca/cQ==
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr2764975485a.1.1768255957277;
        Mon, 12 Jan 2026 14:12:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9bd2sm42099131fa.29.2026.01.12.14.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:12:35 -0800 (PST)
Date: Tue, 13 Jan 2026 00:12:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
Message-ID: <ynsicrtn5r2ldpnyf6kigq76dpdvvh4zikdhl3sjbnqvgzb6wl@37yxpin322zi>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
X-Authority-Analysis: v=2.4 cv=CfcFJbrl c=1 sm=1 tr=0 ts=696571d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=MdDK0SfbWQR3MZ74HusA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE4MyBTYWx0ZWRfX+DiqDOjjqIxw
 Wg+yhwtWq14AGj+mCfxbARtlxdWdEiM+V9O9eRBXif624lE85Q6VppSJnJ4Hv+xGme5JaBNrfl9
 nD7FSz4eaCNWnFblPMrf1Uan8ES6tFqdfTdYGNR7cM//h+DpvFP2hhs/xyUBZ8XcMFLmJ7RjIKW
 WiDXb2rTQHg6Um1plT+CEpfggxkxFQjtJ8Q79BJZMr84xLg9MUUZU/FscLOa3wU2UDsZT7h5T2E
 hZdvNBhHKAAI6ediJ30Xr1guZWQPB/4VDOD1lSnAPpcV+lGC8jaKa4uTUx2oklu/J8OqgDeMMMH
 vhhi9Dm54OCuPSBWJ8iTaWwuwg6lm9dPbzf8lDV6qyO7Jj8cevhjalRevCNL/3Xq3NsncZ5i05Y
 LzOQVSRZGygVPcV2f2DNTJVoTbXF2Gghjz68rKG8iJwUF3auGhGW7PP6XeO+EBSCFmAIwUN2t++
 sKIRIg432/GHNbnmLNw==
X-Proofpoint-ORIG-GUID: 5ddvwGdMzLZ0o28GLxhUc2WgLzxqkjXt
X-Proofpoint-GUID: 5ddvwGdMzLZ0o28GLxhUc2WgLzxqkjXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120183

On Mon, Jan 12, 2026 at 09:13:26PM +0100, Barnabás Czémán wrote:
> GPIO pin 102 is related to DisplayPort what is not supported
> by this device and it is also disabled at downstream,
> remove the unnecessary extcon-usb node.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 9 ---------
>  1 file changed, 9 deletions(-)

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

