Return-Path: <linux-arm-msm+bounces-95344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKuMCmZGqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:49:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8575201E8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2212F3018AF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905BB36C9D5;
	Wed,  4 Mar 2026 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBrizdpC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA+/Z9p/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BE2F6560
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634410; cv=none; b=UUVb2QQ1lBHmtJB54jFgMyueUog9uSgYzsDBbcWS7f/NScVoeWY5rM/8cPifYBSYBsPiy28MGGfMcApd4WaevBIE2dmQPMXdv8U+p/WUmucAEwwfu9ZLBdq9pFkw3/+y6f0GzrNTCWW4VDUWygBdbRbiqqA8brV3JHKEKU0iy4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634410; c=relaxed/simple;
	bh=To2wc+0/A42ocK8hpbfhR0x15kOpCy/gPUDRdGPgZLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V72BnBVC1eQJc+tDj5lPZQm76OViU2xBdxW8x6Mz2tY0IRfVLtj2IGWU+uzLf3c6TFiOV7auzPZmcmnjH3r3cNxkctACf2bu5Q11/dEGfZZMb6VwA7BTpmdDod1vh2UuzYYmi9PILWwwnv4eCB70iYPI1uWcwi80SS5yZm1J9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBrizdpC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA+/Z9p/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CxdDn957613
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+M1phruyaNQyYOXJJUwrTZI1CDqhXvJ81qaPlJepRk=; b=IBrizdpCzskltSf1
	6ItCT7/yxMTYSD1Hyr4eD4nWBnOHAYjvmj26RoCL8hfhok89Iz9sUHxWSLGO+65r
	NEWiRi+vX0TP0Ys3wV+9Yc5Nolk3wE2Rb52Kmcja2LBHOD8g8cVGOQMs+/Ek+82v
	nyXsBALz5823fBz1875rSGVhbuJjSN6Vz/pC0nZZ8I71MhnIpBHIKhwBOJsZYpal
	Y7IqVOQQow0unuFh0LpcJklv7IQEPK2QOP7tGzeqWxAqzxr+SVaflDHTo8qIzh0A
	+IO6BPOer1BUiUkVkq1yagHeRWhX/cUdg4Z6UkVFeAOqq/3IL80RTk3nSJmnNT39
	VAdIag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgb5cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:26:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so1090057885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634407; x=1773239207; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g+M1phruyaNQyYOXJJUwrTZI1CDqhXvJ81qaPlJepRk=;
        b=PA+/Z9p/DSdYePTPryB/Vw18Hv/+XhQXMq7anE2f+/0onT5/r7DD4IceLox6J4yVqo
         HqIwyed+mq5r4A6Ctx/FrhDHq9gxb8VIuktw3onndv/iH/ihjTsy89b/OSxDNDY2TWZB
         oX3ZiwNFJZZFX96ZoLrPzIymFiQ6KPqzW6SFg+fEENX05E0q1JnFr61M5W2zzxMnqgbp
         SUHLKhWCd4Izy+pl//8aPdDd9Xh7WtxZgXEpNPoySzX4BBZEeyfW0lwCd9c3I5lXYT4H
         8rXCdJh+a1W4cb7IqXsVb5/Ma0I6mHhyB+xjU2ohRkxHctYtIY6wAXMu7R0WnqO5VdJt
         Y/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634407; x=1773239207;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+M1phruyaNQyYOXJJUwrTZI1CDqhXvJ81qaPlJepRk=;
        b=q610a4NsieSdzIo1xtGStVdgIq3ROvnPkZdkfeyEuULTTOTcX6GjHI0rHMKWPqdwYH
         aJNNUaJeBJEFpLaB8W8eUi+mhpQoeOJf/i6087aldszwpjQFba4ZDNcXlfDAWIJNI+t8
         Eh73wdGsRSYSYHX0htf/LWZFoj9obkPD/H6dV9wwInV5qV9nKToqv2AfhCw6zAJFzzwG
         TWP5WgNgl81V8rdzwO2GBJw57RuGniaviz6pG55pT1vf1eJR7AeTGtI6SdWJaIDjQTjs
         fcPyFd+gKSGDh76L9bNTO/xGUaFZHAL3iY0eVSXF/k4QxrhxUU3BHSN9fHuMuedgUiMz
         boSg==
X-Forwarded-Encrypted: i=1; AJvYcCU38kwQdBAK4quQjVt1i0EtUi001G2EMmjuTGZISwvx1iOpl9scq+W24cgYjYYbZBPlDckytSKhvmgw8b8k@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoekWQxb69txgQTQ+5vg1CHxkXnztWCSD+vRNQRVjUbPni3OG
	klELa6drtIoE+47NLKv9kSDzOX35omWujLxyxTRtL6mi4MYzUL/aCGNM8yqIJVe3USiecmVQTjW
	g9utdTHfIYHQ+FqCfIBJj3oqmDJ84o/+rKB9z8AwkyFzmzBQ3hiIEKctP2Re6dne11Khx
X-Gm-Gg: ATEYQzwN5o9inkmkK6ILn2H4Y0k6sKtpzrDSau7c7af/wy31KSJixu+CxP7pEfTOwPC
	uWEwGjnpeqA5ldB5vpsVKHA0X36CdENHDX2IkaovXvT/HfL6J5PuJPMleWbIZyg5bcyLmHFq6IX
	6xhnIiVjow85ecrp0m4tdqvdDQO7S/ZPyeNVY5hUfb6JCxl7RrfyXO2bhOw8ztAyQNN1I4shE73
	LzAjZnUKUN1iWVi4xf0yu4tkkMAVdzPOedbi/fy6LT0CT71196D1lcTtA6r9tLJuluWAieUGr6N
	6gN7x/1YZs9F+F9vhZPNMka0NnrkKIab0E1EB+2tOsPbUycaBhJ6zZZ4RFF+H6Il3MflnG/UdFU
	CkXh6vFOe5YBgzDIHKNiYYP5csU9N/wxjBYuSz/k1y3ydJYkRH2UznKvc4g7uyvi2NST/oHKI+y
	Rx2MI/69bmcZhXE2I6fpwmO7xwNV88WhwWcPs=
X-Received: by 2002:a05:620a:4156:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8cd5af0bf8cmr260539485a.23.1772634407479;
        Wed, 04 Mar 2026 06:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8cd5af0bf8cmr260534785a.23.1772634406944;
        Wed, 04 Mar 2026 06:26:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3021eebsm36368621fa.39.2026.03.04.06.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:26:46 -0800 (PST)
Date: Wed, 4 Mar 2026 16:26:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] clk: qcom: dispcc-glymur: Fix DSI byte clock rate
 setting
Message-ID: <okmaag5algd7v3i2qsei6zkezb2bx5aogrngtcw5564aajtj5g@thpxcx2fjuyk>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfX7fEhQ1pwtb4S
 KWi2xaZVRo9x8g1wDKuEbtHovrZon3ZxSf9y9Y94YpHCp32yeekydINNc9VIiyWNu2qBdw+5DxB
 9MvXIpoQLpmhQA02xdqu/CSvbGQh0lhpNh2YgXmvxGHrXtSSAblxD4rN5dipLwQ9Bqie3Kc5CrD
 zlcYEVT3MpIeCJNKurxanZhMGgdpESImIXRc/rio2F9Im4f0kWHFKKhoTl9s/qTYctApJ2Xi698
 S63nKXzEOt2TWCoxlIHJosVi6Jt9nNhaOLjDGpQFTWQLbQ2LBZAZg9tio3i9a2Tc64Y/FiC8UOt
 SzX2uEIbXOr7g1IZeonPZaxawN8JjoRHfk4SMvcawO5eSRdOGEYNlesPqC0fhSq8TxjG5x/Ivqf
 FgBe+qFD3krNqKEHeI1Kq/Fswqg1ChZhhlat9VPzNivLORjpi9eBPMlkAWf0moy0C56cnEFZqQl
 Noz0Z8RfKiR5vWa/dDQ==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a84128 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: aF-2P58a71H3KSCvYsd3gdud9oycAl0n
X-Proofpoint-GUID: aF-2P58a71H3KSCvYsd3gdud9oycAl0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040116
X-Rspamd-Queue-Id: B8575201E8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95344-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:48:27PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-glymur.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

