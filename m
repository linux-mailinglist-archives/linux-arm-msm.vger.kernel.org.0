Return-Path: <linux-arm-msm+bounces-86433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB76CDABB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 23:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D96D4301E6FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 22:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D94E32692C;
	Tue, 23 Dec 2025 22:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8f6WR4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvIZjOW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9F2F39B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766527698; cv=none; b=namnJY6IACzR/cRXnqaWKKnYgU7C0hjU4JUy3vgi4vS861YiWAaQbhIu75jYAtz3deUK4IlmEmGVpp8NT3qxXOieC1vicH5LgbSYwGnAa4V9+9NmW8vD7bNKwvLRcKQhMvxCjYvmfPuJkQ2pByst0YkRNVY5YHQAW+rPaTL2+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766527698; c=relaxed/simple;
	bh=a98mvWaq9EZp44r0pI82gjPXVlfxzp4tJqf11M8SZbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTZdCPH3S3KGrSr/qcOXcXGvsl6ekAuhqvpq6DeW90WN0V+kKTWCvFucDEqHwpgea7lGY1Swz48O4zw6mwBgijQWxKQhhV/myBxW3RGp2h0s2A7JcbqM9rYvYee6hE24m+obcaEz36NYy7PDvYyDdCxuE3zVetZ15D7vaeEYjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8f6WR4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvIZjOW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHrgPg678327
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZ023nu64DJJ3Y8rgETunY1O
	d4d2ftvJ+vLszIxbrBs=; b=i8f6WR4VoMU6AyBB5YCIuJI/kQN2ycJ9FbpfA1Be
	xidLtJhuGCH6pIVzj6cuvhWTd2fV1qtwjYsWdSsxog5hhpyxV61BKubB+hAkpfds
	K7s1M9zGlPX5SyZrZTCkN4nwL0VViVSSezmMPbDd5Cy1Zh6fgkbx79hFEzIDe8nt
	3XwYpjFOBpO7aevFq/bc5kI4LoR+cKhkipuSGfc2s8FhxdqDZOlckZFsEda/TYLE
	5TKLr5EDvFJMHrFNp7nzNnIahl0TUUHxpm8T3ZN0D9pKRA3BLtis6FDwj5AojGb3
	dcvur8WCrlFMsfIDFZb6oZQIMnOthdLtuiWtscZFxMLuog==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq0rcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:08:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9433e125af6so9962314241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 14:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766527695; x=1767132495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ023nu64DJJ3Y8rgETunY1Od4d2ftvJ+vLszIxbrBs=;
        b=SvIZjOW4MuW6kkLIbA4wLjq/85COGDkSaX7z3iUnf89oj/WwY16CKACaj47bcFwXd6
         HaMDBOr7ZVcERWSYh/i1In0uxqGQ85py84cR8+wR7+J/k2QtjQfiz/qwm+DOxKYmLj25
         At23afiqHYjftadA2L1HSNzAX+gUiN9uZWWlhYQExArKw05nLedpkJkq2qDQp7tgr7OC
         rRyXNxVGAjsm6fP4FbL9mV41ZiwsyfNeX7ja0OiExOOSneTDdxmFoytLmzz9m8aRUhk/
         8omZz5CBsSejSNjZT3JkwC6nwDX4YPPdXGb5Iu2AxCCSGFH0GznfPwwEcn/7F2BJENCK
         SdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766527695; x=1767132495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZ023nu64DJJ3Y8rgETunY1Od4d2ftvJ+vLszIxbrBs=;
        b=sCdEUUhnA0ancNYBjeNjCGK7VcOVh6EQX9JkWg+3kyFjp8JucI8tCuc5Z2/AdEN4zG
         bSQhWmHNETzHJqNxCfo3uW/E0YgqMYPUaMAbLEsndSK+077nCQ4FfsImO/Phm12udfL7
         YWz4aT01pqZ1FT+J2BbJRBLrzgf6k29Hf3UV8GHZ3+sjTANpIpNFu1o3Aog1XMq9pMoT
         T8pM4XQ2bFWC7Jejd2wL5lt1Q2EVMs0xwqE/IKSB6YJO6vtdTpsRmDUWyhu/6oFaapCi
         bAkyj9vTLc0dHgnIW0hCDy1HT0WL/7n6qrIUOrEnlvQi8LFRsT+lZIf01NWdYNfatBE1
         SPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsjtKbBO9bpsQzzmbXpSgxM9bsbZwYjkXdCBiGK6fMQqCQK+gHEiYTN73cOodrHewNVkACq7XqrrBOic7v@vger.kernel.org
X-Gm-Message-State: AOJu0YyVG9ApzBpAk38RK7uyi6T3n4jm45Jv8CSiNssGiPqA+GuxAAfH
	QFEnR2N3EAdBCniWj/TnO12mTI1Z62BYVkJ0gEEc8R5Off9qAvg7c5ZCbZ38HVe3hlD2flWu0TG
	XKfowV7C4T5kC8zQLcQCiessvf7qIp43pZ4FM52Y4fUWWDcVFx1pR3/WYBA67NqOSkb1p
X-Gm-Gg: AY/fxX65TKzV86FnOVFTrG3JoemwC+8UrIURfL4ScEEuvsOxV3Oj/HDtZ1G9uM4wkTd
	mt5GsypH9vVnh2B6+Zms3IFmvTeMvv5J1U5wZNWc/StkZSUaCu00AS/dsNOo8VM9qJJuXXr3wkv
	xNtJOQGz0yOGU8OxPB+KI92L/awYREfuMQjHmulhfUWLYTwaGizDkADRd35SjL4yZT3W+Yp8ay0
	jHC8RYMXJGyd4LVDaK66Gp81NqkATB5FJ3kvRK3bSgtmYC3pqvpCVhn37m181PIDe4T4MV9dASf
	JOtC0uTfxHFUnores+JBnG9EDJvDHYoA3OuCHrJ/9vNL/LL5UXAImKt/0o5TDGJT9RkMA117CCF
	GIqtMwGYsSajkAKmoAdOLkP2kwxpT6cclxxtsnE1yR0gL6EF5WkZPmxs6frCspEDIBlJjAPz8BT
	anVginWNDvEsD0CtKpqn6RjIQ=
X-Received: by 2002:a05:6102:2b84:b0:5db:ce49:5c71 with SMTP id ada2fe7eead31-5eb1a6b167amr5577663137.18.1766527695398;
        Tue, 23 Dec 2025 14:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL2kbDar7DYki3vQpxPi1t4IuJfKgj+kVmBUoqLUuX5UzEVFW5WoifqAha6zGIugEN+Z0Agg==
X-Received: by 2002:a05:6102:2b84:b0:5db:ce49:5c71 with SMTP id ada2fe7eead31-5eb1a6b167amr5577648137.18.1766527695030;
        Tue, 23 Dec 2025 14:08:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251affbsm38741161fa.17.2025.12.23.14.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 14:08:14 -0800 (PST)
Date: Wed, 24 Dec 2025 00:08:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845-samsung-starqltechn: Update
 firmware paths
Message-ID: <vy2kfurhjzwbrt4uzyi7jpyjr35izw6bgnojxlrnaxtc7oonpt@rnykz4blhdwi>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
 <20251222-oneplus6-new-fw-path-v1-3-a2d366f9eb89@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-oneplus6-new-fw-path-v1-3-a2d366f9eb89@ixit.cz>
X-Proofpoint-ORIG-GUID: 3C4stJWTx667T9srd2QTKlTuFSIsMFDP
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b12d0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mzIAMnI6jw0G_sTere4A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 3C4stJWTx667T9srd2QTKlTuFSIsMFDP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE4NSBTYWx0ZWRfX1Hj6HKMWtemT
 m1KE/3+0ElmS9UL3ApLVFWQ4qpNReQfpJ6CTCG8S5hbJOHR0vGwWZEPMtyEWHrBU+qWPLZqoTRI
 xwff7B1GRt9fzhPGfCDgkQIyk4tjpxe4bocOpxV6QKwJt/+Oka9pKN9+tM/sl4Hc/heSzTwDmxr
 cc1hsDDRKilyJZJkwqeq/nPInKEwRJBJP4hClwAUpLUQAON5kkY+3kivcFtKEKXfhHTsmQSoRHL
 4xAvszMj3ED+V8XkKs6AkPnwiw2bCI2tJrwzLZpnDo3RbDcA/D5FF+0F0m4ezxsp4OEPgtZrSbH
 NOu3fLdmyk5CGC6yWbd2WNAdo7xe7JFTO5rt0DN18F9QBZuix3EZTeuDBf7p8fKpw5qEeRL92VE
 daak5CfJaasuMlvPCc6bcmGs1cib2yKj+rLWOPQA0QO7Ta1GVDWSc6vUd47oUTpgONNBkyAe6cy
 jk0umYH9IAXwGo4mMLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230185

On Mon, Dec 22, 2025 at 08:05:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Conform to the new firmware path scheme.
> Includes cosmetic cleanups.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

