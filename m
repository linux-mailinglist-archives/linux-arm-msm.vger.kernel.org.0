Return-Path: <linux-arm-msm+bounces-102539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPktDqj012mrVAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:49:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D59443CED88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2447A300951C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A0B314A90;
	Thu,  9 Apr 2026 18:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAOYphju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3cJZBjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BA92FF65B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775760506; cv=none; b=F2x54t5xW0+UgBqHPCg0HKoraxKBm1Ul5oLGjhMbT6kV1m7AegL+HhIWJqjwRAkBhrkZt7ksqISIdeIFd1X6wy153LiVnZuUO2d/T4/QhF0gxxBhgF3lGz2+yOG8kWJE4wKqs49X/lm3BdKEEoiR2kGHaI+OTMP3W1hyooJAnYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775760506; c=relaxed/simple;
	bh=B/PO1g6isoQH/4CSdcSS2JFpe4MLKsTMjbALL52rnyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJxtunKeJCySVIOQM6cVWPKjmY0bFJndEsvILEzmVi9SeRbOICgDApBmOZ2g+ig+RxJS6LsWM2ykGFMJeE2+RxBSvlYzAjvKUaRQWR/9X7HSxLKt5Hdu8bo0c2DHhk6jWRKRFGTWP0etntSU8J5JO0C2co7lnEAKNonkOofNz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAOYphju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3cJZBjR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CwgFu1432467
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzKr+jCCYbAhAkTkPpAa165W
	nNaZvKCyJFBqJsHtSIs=; b=nAOYphjuKg960IBYE/CNwCgu7ZTsQ0nvp/u35pHj
	ihWKBb76SEXgVmbwih0AQM1VcDXpQghlN0SdhsYdjVFIrsBwYnQGUCaAqIStnn+Z
	QX98Jqp6ndpDRuzvCKa7azesF9wQmLv/IgSdXkrY12wd5atBXYYLKHmVBeikwKwM
	+QKDX1JIcnMDPLUZYQFUmvYpqZ/690bQdDIf2fH1glrCdrZ7/5rBadUq2rb8HT/H
	z6+CT8kAgrSMhCh+qwQv1qKvKkguLCw//EDOnelSr8uTl5yi5I+1V6vngmZopM7a
	An6WSt7hjUEh6wMOKQ1mw0E1sxxo10GnBk5IejqRIM1+tQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckf9bb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:48:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so33237011cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775760503; x=1776365303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzKr+jCCYbAhAkTkPpAa165WnNaZvKCyJFBqJsHtSIs=;
        b=h3cJZBjRkt9wQez3MZgAxtCFSposixRyE9KbJGRtQWl5wFTX0jq/UlT2Umn25+xEVE
         uGySOuD9jOfDAXTKP8t8iLqzYZigsQm1yMW4RTNEnxvs9oXDAenPh/DaUV40pwWWmsjX
         6M/wV1n4d0BYrGCDiQI3zgfmDL4nCYxsr1gEqW0scPSaqC6Q3gpkkjVT5mEWOWQ8sdT5
         QOR70LADy0GhkLHDN8oS+8SaQk90rag5W4kI8llT/fqMfqy9poxPcmH+/u1Qd2fzjEeo
         CqBZClctFdvk6yfsKcMsCeiLRLLa7vKV0PJ1ux38VP9I752O5yCP7M+VPGEWkpH6DEhr
         qpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775760503; x=1776365303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzKr+jCCYbAhAkTkPpAa165WnNaZvKCyJFBqJsHtSIs=;
        b=Nhb/F0tCcU0+EZD2EyFHAL5ydVZEuYMBuZMl87T9AKH7Nv8YO+4u8fdctjYOGJKG4k
         Rcgo7TCBhXxx5lKi4JWCbLhNR5HtGphRZU1E45Q1qVtBBqCCyVepM0g0UrglEgc7GgjV
         SDBgsfhUnRUgoObtwFYqmcahldWpVelVvpdSwlgMtWD+dmb9DH9yIPGVxWS6eDFS3lcY
         QIIeTqsOcihkH0ygrIoXccCKHWNWYJBNogDmNPytac/aL2CBBZNSSD9r3VnrV/tG3+3w
         pOt9pRmNmNUC8vA1/pJwROfERjmgp5jz8Ya0Di7J4oC/Qo7bP0i3TJKSPCWcHuKR/tQY
         67uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXesXIzv+goAXlgb3bv9CS1It8HrKtdQP6B34rDPY/McNHzF0Dy1dgaHE3p5OU9ivbcI7EnwRn1P/gAP1p@vger.kernel.org
X-Gm-Message-State: AOJu0YzjR2w433jngxjpaL3Obo0LpvwNxaUu2e178rWnUOxF7+FePmnb
	P9FkRWDbVq2vuNvNX4wNjtUzrD+ZF5G9yvnX/7rqfWGa4HCUIo4eBaz78i+GJ5N1VuvfFGMAIA9
	2ehxIIzLg58sMlJrAKBnl5J2hHfiuGHf06UgehCsH4tU9AjMOIRt0uYXRZH9ASukv04OY
X-Gm-Gg: AeBDieuR9SlSU+Cioh6oiQS/eM601mNXVEjXyg+EXmF5dk3ErQ9fpbVtEJkatnVCf4f
	HjTzsza7/zjmvI2K70TNICDefUGXccSdHiuy15rM8uacqGDExvMihRn+ukfSHAshJPkli0GaucW
	VJ3W0aBwqg7RlNKvBIxIwk46FXoToLj9Uf4hQeoIF0V8/hI0SLRFPNXWek0ABVo2VGX2cQFZwwd
	Xs8Dr23+ZkHl/55LhDcAy/MMEdNHR4ZGqay7BWWlME/J7l0KAJUBHSA78k33BBVjzxGq+zoiRXx
	jiv2UVVMOAEalN8y7C8/tSD3zTF/TyeJ7K/J196KQBnIvaaFet25OYn2Zx1PWiw1CP9Rejm7NUq
	/dLuiCbCGg8mlhY1iAXOB0MxFghsjS1jdU5fa24Zxq3uwq10/ex0WR9zZ0UjUN2n0wD9+W2m0Ob
	wfJUw8G2J4hfo+eqHsPfCvbTVl6kiqXAPggbU=
X-Received: by 2002:a05:622a:15c5:b0:50b:48de:5448 with SMTP id d75a77b69052e-50dd5ad0a9amr6227001cf.6.1775760503269;
        Thu, 09 Apr 2026 11:48:23 -0700 (PDT)
X-Received: by 2002:a05:622a:15c5:b0:50b:48de:5448 with SMTP id d75a77b69052e-50dd5ad0a9amr6226581cf.6.1775760502800;
        Thu, 09 Apr 2026 11:48:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541dd1sm1145581fa.24.2026.04.09.11.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:48:21 -0700 (PDT)
Date: Thu, 9 Apr 2026 21:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Message-ID: <w6mog6pigbqzvcbmedjcyvuth5ipjodi3xso4ibhbcfgqirdji@wjuhdbyywpzh>
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d7f477 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=p2qfuXT4Ie2wcHrZ6aoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE3MiBTYWx0ZWRfX8jmqvUKAvlh1
 pl7BoFPfriSqKW9Tswjj63hT957bnpWegE0fUcwAucPvXe3fpXWcw9CbF4aCo+irGfc0oewV3On
 PRXReqR31WAZZ2AeU9afT6W2eWNe3aDfivHDqrGPhK26XQaf9q9d//nPT0LNzgz31wQhi0rUMbC
 rEi0T4HhOZHy0nJ/epyyW9AFA2Vacdl7U0MnKQ8VgpaRMgSO5Ph9pL9FV5xY7iIhfpSgeFpAVVf
 FKxk2OISTuzZj70xiwrVg54hGF9ifQ3xyVLWgcWmDgPlyReGx7Q1E5IBao72iCY0/Bnq3tRhcwa
 yfsRkChVaXNCCJqx9IgRkPoYMTq4sGLkL3KQA3sFwWuvva31h2SCpHwq8lrK8X47Bb14262TnoK
 g6Pkq6pdDCxirakGNimcGhMuZEKdnzBFSMFApi2+qFk/iNwSkvM3kN575tTrQ2igGESL+5n6gwv
 ClELhhPVV8iT6PpMuZA==
X-Proofpoint-ORIG-GUID: gk8ahOf1RX5N01tPROSvcAjR0TVOcrrm
X-Proofpoint-GUID: gk8ahOf1RX5N01tPROSvcAjR0TVOcrrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090172
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102539-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D59443CED88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:43:29PM +0530, Mukesh Ojha wrote:
> The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> users in the upstream tree across all affected SoCs. The only user
> of this label is qcs6490-audioreach.dtsi which references the label
> defined in its own SoC dtsi and is left untouched.
> 
> Remove the label from kaanapali, kodiak, lemans, monaco,
> sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Not sure, if these should be individual patches..
> 
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/monaco.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi   | 2 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

