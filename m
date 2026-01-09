Return-Path: <linux-arm-msm+bounces-88242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A20D083A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 689273076317
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5F5318BBB;
	Fri,  9 Jan 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkuXLcFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUFun1Lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55A32A3D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950992; cv=none; b=sWxXwFchj0b6wqK3+bw8P+deQmm8mJCBwx06w3Pz4lp7rFCXOOp54ErmQLlSCXN4rn5I6J5vnYKJcXB7XCDAobRPUrAbweU6hS/uxbAuRaZ1JgKY1jVE78vsvktDi5YmEwddYuC/FJ5cppnlHwREAhfw0mvijtUvljedLxPEFsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950992; c=relaxed/simple;
	bh=qLH3+LsoQDK36n1KPvfyio91r+N+YODHZlioin48h3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/Uv7CoDBozxh6y94PeRx3OyFpgXtvWy5ruvUfSdmY5/t2GuIdDtGHNbLzYa/NBVUZtYqoTFzOB8w/mnukBNyo943GqfKWafh4oV1ZEtGrmv+DSQe7C+VuL0G/L+YsMRm7qNgUpMDbJx+kkc6HHT5egFdXW2RcFF+dLfPW4870g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkuXLcFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUFun1Lj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095SKAK1701969
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rRpTpzQR8ExrbdL/F8XL9JZf
	0Q5dvO5YHpixCRZhmJ8=; b=LkuXLcFVJVGueu+PgdtFAUc8KLvOB4MDXyDRZDUt
	fgbw56l0wty9ZvEFcoyYO0c9CEpgKtdvciLPFOny4keFVgkY/OtNfTo4rww8/cVz
	xqeYdsprJGbxZfFB9bObGvjgP4R7evezj33MjETENm+Kg8zY8pllhOxpeds08pom
	t18LZsgGR49y3d4S+6jlONqTb7xTNAOrq0Kg3kl5/Mb1lb/5UnglI/Krdm3J9fTL
	iMkipS5bx7eLzqFi7XozK2vwmreK929gToAbIgJobfA1BnkJF8D8VarVdvw/PK2g
	lETjgihfnOanC/azuvf3KAUi+H6swQy7G0ptnsrvu4ptIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaasp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:29:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1038010785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950990; x=1768555790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
        b=QUFun1LjneV9OPQR562UfpP5YAuphlaK0T3Mvj74YTSvYy9aaZazHluJuCfnuQTC2B
         wUI4gj0uBxm0uy1HdXDt5enamHyqA1WVqRw9smxirp20ubB16pJWwMeO2S6oUn+5UNg7
         QX3ZMdfFWy1Q7aIQMeEZzR0W2WLLGhP2N+wK5duQUfWTwZDPR2J/MkPhPgbuueiCDCiz
         HCiVQJ+BJtY8U7NGR6CEm3iLmVCUGu+JVdcbKJ/4Fsj1xuSHrASw66Tel/Xt4i+hFrPr
         QvvhYkKC8AMVXoJrTasRGu1Hry1ktYnAlErw72pOjv9CurHrBm+SqckmC9IBeNd1BPvj
         c0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950990; x=1768555790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
        b=Ew1si2iay+TlE3Hgl7DIKki8PlCH6awgBiMllFV6DZFTnB5MnDNB+jpzJThEokSx+O
         25ElQwy8QQzjatYAuVMfqs43l6FewFfC8n9hCaWKGEfuGX/fD/kn98D0N7rHjQyUxS+E
         rYlgYAzY4Ae9QXRedMTq4au+iMDsQ/vq94MFKtfphXNA4y8lERl+VWt5uKxX5qVtcBZl
         NKGKeImRfedIPhAoPU56wvCWdREmNr3T6byHoqlJCMHoX1ZzeNrjurE+fGhDh7SBFAqK
         ouL6G8G/0UvJ5jvw68+yNhnJpCJUcKyfR+GA2azhnrr/xQVHIdjwxiAlnnot4oDS+9fn
         KA0A==
X-Forwarded-Encrypted: i=1; AJvYcCV5Bw3sXPnN7IhZ3psslzARmk4HkZV6/Wq8j+gPJEFm4obtoyAPXoiyxgaPnyVw2hD9WbSsYiNhs4Et5jB6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu13ER1W0hFgl32tCzmV+PyZoR8BONUFx34vXPBLhk2bqa7Py/
	06qwLZxp1AybrYH+5S5iuu0wA333ysnvroiTKrp/JsYyJfpWX1oBrmU7sBPngic2iMKYzMd+ndZ
	bWEAUk9BRuXnDkz1ksBqjUzLmWsIuqr9bHEbu6K2IXBhYlB+pqqEutyJsc/bBVSTV9o8o
X-Gm-Gg: AY/fxX6NMkuAe5jT0E7qwcSHwwaFnwM1G8bN0QvAfeZcs3PmDLF6TzuGXJV+Pavtld1
	0MGnjqmBso4kYMzkSuv72sVOxb0OFQKaqrcnKD+2QCtaLe+uXKCDsO2rC568yYk280JquOx7CkD
	N6YJ7Q2KQJn9qrr/YI7HPwFOK9ktdgClkfCRQvh1QDUugKTjl4dkb7nQyqaDCvtpKFL8TmTuNKY
	1VLO3NeH0mGXo5ZKSOSPORBUpzL7Cx6/TX9ocC1CqOlMJXivGH+S+kpNiYp5qFCj1lI+7WtOiBO
	Ihua+690TssLwVcRgBHjKNUvETL1gGlxat8By6Hgv4NZHonCoQ4MgLRxMVh9jv0gqkdyNIrCyjv
	hsoIXjvtm006emHUWC1mY
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id af79cd13be357-8c38939254amr1257045985a.28.1767950989817;
        Fri, 09 Jan 2026 01:29:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXoLCG5LO6zefGjgD+xKyAVNrDH56nL2+22oLiyLggqcBqmC9ow0fJTq3cPgpQOVlQjcJAWA==
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id af79cd13be357-8c38939254amr1257042385a.28.1767950989227;
        Fri, 09 Jan 2026 01:29:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d029bsm1076667766b.41.2026.01.09.01.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:48 -0800 (PST)
Date: Fri, 9 Jan 2026 11:29:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <7t7ctq5vasottsmiuvo6zwqsnlcocc3c72fno7qlhgeqhmhxid@5tsjevpuobty>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960ca8e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 31sWpY4h6BB5FPJn22TziE39cInPZJoB
X-Proofpoint-GUID: 31sWpY4h6BB5FPJn22TziE39cInPZJoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX4wzCnvRrQDl7
 Kubmqa3VcD9v4woioNzRpVHXFEqxeQ1RhYp89F8ATnUr6t+Ol79WCxttL5pI6ZMNUN0P2zno9PR
 uPte6yAZvjb1OmnH+LYCE/lerY73+eBYnvHmWnRyAEjZGJYfjDb5rgpe8WBERLsNrC4r+0Uza6B
 UMV+I8H8E/4Jq2j9ofpQiv2+akfyGrkKV5/8AWRvnD6gttlJQ4riPkR+3b8MY52rhUdV74cxfQw
 b83yDIUY2q+z5qNbyXIpT/eBz0/YoaXh1/EGF9wR5kIzKc1AfzBhCrfqxhcElK8HHRvdh2khJTP
 auPWA+c2ZmsUZJOz4QGAqqWDMGkg40e6wsbFVkpoZDTMy2vFU6eU9XeTNr9SHQhfIp480XZnIUf
 EgwjG3lbw7/BIAavHE0mMz2qBJfqERZ3+H+4VAl8Bjni83RoCFxJTF+MSR5UOAy89hvEC98Izs1
 kc/aIAaZt5qW2eRILnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 26-01-08 16:16:42, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

