Return-Path: <linux-arm-msm+bounces-88633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3A8D15895
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 23:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 796A330248B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 22:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D987434AB03;
	Mon, 12 Jan 2026 22:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5/Pts4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwVjLOCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8152D3A6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768255892; cv=none; b=KDWs5CFzRmyBUmU1ZQSIEguSp8LSeVzfwB5dHycka0jHiOoX2H/QZtqduw+k54RfMXzklIIdJ8xp7ZRbynatZdD04FGvFGTVif7E1QkYtJnweu2GI2uUm6KKJR5Hs0v+ptc17REMNgq4+XIcGoFjX1R39BFzSz4Teg9kZ9OD8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768255892; c=relaxed/simple;
	bh=Ij35304MyVdMGpBR9HlVwgyCpE8KQSt8d3JxqXR3QrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig3c0jXmgl7yYHY2zfeC/wXDKQruR2F3GMSoNiuAS/HN9iHgziVlr4ZhIhSu+KHdKbd5sx8MAd9Djw+4y298/scubS6XuQh/PblIhWmEeMDKLvMkd5KXjYD2XQ8d0pWXLLGKWocUG2qac65BOHGWOr5Oi9wj6dEOFLdpJIVl6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5/Pts4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwVjLOCl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHf9Xd1426476
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhEhZwjw8HgyTavKW4D9RGlwsOdPgS5h4taGGLgVlvc=; b=T5/Pts4XE6rWmKAx
	R5hKrYgRuXwJKvNQ7/F8Qv/meNZkp8t0lQ9EwDMeiJLBmx72R3dDbLVgSB5zIjnS
	0EWjJ9WBlP6kNdcLdGjBDAYn0YUPS1bOysMakSnV7F+hGSz1TZv+Cg014gd6MCGn
	VPoTesCNO9ECXmuvxRW535qKYp1r5+dfO/TK3UfHNpbph2G6M4PUiREWsN92r+J9
	jZQ+YFjslOXkvXS3GPoNnySlOs93ZGurclPSW1cT3B6uj57xZup3e6yJ1pmVGFn6
	ywGA2rKri0Tzk7uzHifdI4n9U+8EDkNKHeWpJ7rlzko4f8IRan5CZbJhIT25w0Wr
	l1S8RQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn34g9cft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:11:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e41884a0so1529468085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 14:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768255890; x=1768860690; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhEhZwjw8HgyTavKW4D9RGlwsOdPgS5h4taGGLgVlvc=;
        b=kwVjLOClcceSzxEXZ3l/S2Xjd4vIc7iuL/sLLbZcckiJOgL70YrxeCcA8o1ej2JisR
         fVW0TLusUPqMeHxGqM9IhMlkZy7aKzGVr5JKUZMuz2B6fh8W/3wlSHcWbNUrZ9gKH5LI
         lPyQizsHhtmFVbTZIqv4O3MS5hIaUXhu9DUfKWZj2g8z6cr/Myf4nKGGSsZ++eEEAjiy
         Potx5hxgQf+oFTC6lV13LnEcd21AYFDUY0LScgibu49zV4lqTV4kcfJRRyzGOk32jtLg
         xmdj7oOXpuoYl5Saygv7JPoCQmNMhepi7gsujgcK4gDFLT4gErmj10Po0our5MVVwbjz
         WKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768255890; x=1768860690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhEhZwjw8HgyTavKW4D9RGlwsOdPgS5h4taGGLgVlvc=;
        b=t8LQxSxCbhalgB8JqM6tNdYmUf1eDfgTQL7SvsbsagCCqo0RGxCMIxyxVb3DgSVLFE
         lcnrID1dqUHMaqzhzQGKiGnc6cK9tgkQT1X3p4/KhTUcr7aZ/Rl5kAjmvFFcBHkDWrdY
         tFF9Gc8/P+eUnPPJf217djgVPw0nJb2aJpW9O+lVymscoD0qV5VAa7FB1SfIWPZTtiBy
         gacycsxUA8W+kmJT7JaSjkJhCqEIMXV/OIn5adMolJlOBve6I+hQqb3jV5y/oZ/6nv7C
         m2ZjkR3OZnS0ybRyQvUOzOYGZW6KZm2q3Gu6I7qffJRuQbcG/OO12FlLD6urMEnjLtpY
         3qvA==
X-Forwarded-Encrypted: i=1; AJvYcCVFx20E8HtTW8lyKSa8GIDx1vzqktnydJCfhJAFcYPxvNyTupo1xvLKWQmVoQtZxzVQUCVK6Rj9P5Nqe5zy@vger.kernel.org
X-Gm-Message-State: AOJu0YyY75fq4lX4XSF1hvapAQBGxyEA0dgKYIiTYC+SBsqbO8MooqPM
	hukFnJyp6xbTTtWmnC8PrAWdRgiQ2yofIdvKdFV3UNQL929nMGLMJBT7WqJhy7AbRH/LyZJ0Qhd
	INl/Duv0+ypK75jdFM33FeagBzxK7lU3FrqN8jdhF5+7jRkUy469UaTMNHvIWm6rixFTj
X-Gm-Gg: AY/fxX4gdxJ81Y2it/+AysxTy3+sCS2FV9U1v/EUHImqS25TGmNlNv4v1zVEJUiSYRB
	XXOPx0ihU7ig8nv1TQHJBSKmIt6SFocu80pmhXoNsh/VV6UMexgR4R7oZFXJxdwOFd4jBqejKM0
	xNheeIqaUpQuETQvkxTRcoll3ITISGXONJCvTCUs5TezxGahfnzQqPllaPrz2OTEqqrljRrEyZr
	4Wzc0ZiFwft/idNKgnVJaxxvh+21FrZFqmVXaBtEJjqUSPYO/BlmcXoWuWOgNoC35IFShigbOTX
	ln3aNMxDNfKSnIALLx8XL3OEVrcPJlHTqZe/oAuRj71WgrbtTIFZxrMqHQNAppDg7TD6AcDaO4z
	AXPcwQkQYHDR1ZW8Ir+B+B9On2mUglUPcEneGbc6iZVjGE1qooTy8j63RkuTIm2NBvkykrsJD/z
	tdnUPPrk5Z+4s8tqDpZmVTyBc=
X-Received: by 2002:a05:620a:1a97:b0:8c0:cd96:9bd9 with SMTP id af79cd13be357-8c38942954cmr2803827685a.90.1768255889737;
        Mon, 12 Jan 2026 14:11:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd3WmM8Er6jZlz4GY+Gci8L3m6OdKJ6zduDCwmHM4ZmhRoP3rIVclFhmckVLuP7QTQ+XGYYg==
X-Received: by 2002:a05:620a:1a97:b0:8c0:cd96:9bd9 with SMTP id af79cd13be357-8c38942954cmr2803825085a.90.1768255889303;
        Mon, 12 Jan 2026 14:11:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7868955fsm3403076e87.2.2026.01.12.14.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:11:27 -0800 (PST)
Date: Tue, 13 Jan 2026 00:11:25 +0200
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix msm-id
 and remove board-id
Message-ID: <6mxiysnjmrije7hz3opgaw3f5kn6p4glgoivxvnizrkjtjiywe@5qgj4jxfxa2m>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
X-Authority-Analysis: v=2.4 cv=fbKgCkQF c=1 sm=1 tr=0 ts=69657192 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=4Ix3DnIw-zF4zot3V68A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE4MyBTYWx0ZWRfX4No+ktAaJ6f9
 b52tDou68UwYKJB0nz2AHtw+LeKkIoAFzdPqnAyGtXq+B4PcUJdhqlWA4x+DsmqVELqf4LcE/xw
 gPmJUMN/wbnuxiQzAytkhndbckxK09wg5XwQy2lV9fPvuzSlofw7vL5CganRL5Azhd6BqzLFb27
 66AIi10vO5Zefow1EMSxwMJ2Fpaa/S7x2p2McV3j8pyNqExzHFBjviXyEpwgTwWYl/JYE5zeMtJ
 VLsnztgFeZo+eZ3WQA4E1xyCmvCGXB2VGyrn2hna3lCza58M+NsXzkNQu/kii6PjRxTewcgQV87
 9Wjr2yUk38FkyoYfRNoqoAv+HLZ3xFF/94A93dHBX+PPbw+mMel5KUGqbjcx/MHMCpGUuXiiToe
 Nd2EP+2K+BKUflniEY6SD1VGldKb5p/9wk2nPEbOag4HAk7sI5m4ZkOQREeXqIcAyKI30rNifM6
 V+K3wN+Mkq1BmbGULrg==
X-Proofpoint-ORIG-GUID: LXsHR0j8lpyWFhWsnbK75ePChKtRxk6R
X-Proofpoint-GUID: LXsHR0j8lpyWFhWsnbK75ePChKtRxk6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120183

On Mon, Jan 12, 2026 at 09:13:24PM +0100, Barnabás Czémán wrote:
> Correct msm-id what should contain the version 0x10000 and remove
> board-id it is not necessary for the bootloader.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

