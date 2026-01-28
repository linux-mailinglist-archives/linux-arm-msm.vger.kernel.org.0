Return-Path: <linux-arm-msm+bounces-91083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKTMNkaLemkE7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:18:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47428A97FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24A75305ACBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 22:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CB3266B67;
	Wed, 28 Jan 2026 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nehQZQsZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQDY6+Hm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B61134405D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638637; cv=none; b=sXHmFFjgM3h2Ew3FXhfEy2d1W+7UqjIBDtlUWkxQpWBukhg21aVD6zrZuHoiJzCDrguZ9Q4rn+ZzUFW00rfnMVJSK1fFowRGVD4fYET444uXmrjF+Mv9gzFFr5153gXtfTeuBsn/2NBIsEXrZL7EGaw5H2/Y+yK79Nklp0SIUHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638637; c=relaxed/simple;
	bh=8gCm+keAh4iloPnPUPFhyZpkhcs2+S5XGOmc6PZKlAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INn15/umpiXcDZLi6P8Eq4nIoRxxrOxKRs2L7QXGasi9EUwP1tsn+W1a9AetvNs47RpogDIysvD1UEKWY0PY+NpsnurdMZgrmqSsdp6wOXeIporN4+yjzE5G5+wIKxXFCQFsekxtaCWpkeQxJEim1KFoImYkFyprTQr4ziHWqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nehQZQsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQDY6+Hm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH44J81407450
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LiSPXLj4QSiN5MSKstEEgtaG
	EF4LVNZ0IAEy6B5hhkc=; b=nehQZQsZnUyGSoaBwALnypDTGwnULyCFAEVJuFRf
	6jncvHpjdcUcxW/5oO9KK4zmkNMCOX9UnDzX0igiPsgEjRU9+6IA7DN5vz5Kk4yw
	X9fwnYFEqwZy+aB85sp4bQI0Zh8Hy0jHQH16ms8MCbK8yuksabp2Ciw2Nq8d7CqM
	i6BFUj63gFRXi0J+igV3JQmm1/fhJOL7kaaR3dMPlkMkQgRBJFYUxOMg/7SAJ5Z+
	7YzdlyO9fH03HF/kDQqDiVGiFqnjlHerFNnifDHpOKowQmTQiKzhrvaSlc2SJ7tS
	I+8xMVDh/gYPocLxqXiEZPwFjpsOCgicnbDvJx2tbijbDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphggvkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:17:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so87891485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769638635; x=1770243435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiSPXLj4QSiN5MSKstEEgtaGEF4LVNZ0IAEy6B5hhkc=;
        b=iQDY6+HmmRaKFdHPcfOlaPuQWT19U93SXZwOF8JyzDD1IPV4ZNyyWdz+vRNrpwbQHG
         L0Ih6yiY1+o2FGNyXrzef6hHGfI0EX/DWNOeBWCgwrubxsCJqwgPS/B5XSJDb2UPFu0b
         35ZB8Xr34GYY3mHanAX9t947D32Vhtg9f1glqVMXJ1jK6r7jNdcRXGNMocMH0QgZoxdh
         2AbnuWIyggbJQUJWTeU10KfGUNYpV/ePd04gu785BqltgJmVOHp1z3Xi3zp6bDWvFKZp
         sZjUii9/uBG/JLyJq11LMXdpr1eZD2b0QlgNY4nNVm2WsbFVY9HM6TTc2FcvaFk1yeOG
         56ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769638635; x=1770243435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiSPXLj4QSiN5MSKstEEgtaGEF4LVNZ0IAEy6B5hhkc=;
        b=Y+n16YWGHo3gZu2UxJRujpp+jQ1hLizI974CXnkCH1C9uFBh6oy8lXprd34PabXBvh
         mk5qGg4qNdljL27+nADzysx5KX0dBKmdTtue41xM9L63l+h8/5T2nkTcPRonD4MzV+r0
         khhFcZQ4vHxvHOB8dtzBBdC4xO/xnq8NKJSOWKqtCmCsr7dU8EflSXfMS9RDyM0aKS9k
         rKGWgtkxIQjskIsimCgaQ3TLSRuV1IVVb9OJAoSDRcE94tveQ8T2DGX6+pkc/Gm4Gow0
         YLywXjsUnHyF+WsprubT0vrHx4rLv/nXg2QeWnzTjYpipt7Rc77eTZHA+NoGz4/567pw
         X50g==
X-Forwarded-Encrypted: i=1; AJvYcCW1WR0jZntfwYiDnj2edeXnEZXqrkH0wZrAmmyj0EvjzTiwyjSmpgV/G8ywqb5+Jn7LZYXDrRXaLLMVygcN@vger.kernel.org
X-Gm-Message-State: AOJu0YzU8DU7HjHAU7LVcvJg8h0thqvo/0Pg07lYb+18uhjg1FGY1Ey6
	wHfoZYU0ZiRf2pKdKCiqy+vFOSpoE+tPym1ODth7xrK1oQANyiMFhHMwrmBXkr7dOUAPppeA2lR
	2PZRK6RMxg2txB1m+HP+/3lfe2xegZemmWj3SlZTl2ir4ABrfmqrrDunGEvM6QyeEdniv
X-Gm-Gg: AZuq6aKHapO8LlZhOSIOBhFeDJBo8bZl38P/xn1Gne4t8Fm/8/5eMqH5werpvkAC3d9
	Fp9oJeVPRdQS2BkbRsZEh1785tAeJC/aONRYT+pb63UP9ZoIwPylJpzYaAAx7llToRuxDp9Nyc2
	sdFQtfuDPFmLw78WeIcAWdrdnNvCMaZu8OiSECopZI9TDK/z0MkNJufN1Egz+ptVqXqdXwVak1j
	0NqCI1ySv4g8v7yKx913cH0a5nUAE03bzD7lDV5lJL59tnF3xsulAsQD1fF2NzU1QP2fKpZsq1c
	0dfs6inigaVCd7wdvdwEE4AR2bs/T+dKF/i7fBq+xwO7MUm4KQRSWexPEqInpJXK2dWesM/7k7/
	C3W/i4G4RrOY7+1+Ig094W2hB6UAmwwpxSDI58wVWMUEcYIlbd9nBR0XQ0Sz7gthj0Z2Jvk7Res
	lsYxF3YOrJofpkgzKQ3BCwSrg=
X-Received: by 2002:a05:620a:bcb:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8c70b860766mr819708385a.23.1769638634535;
        Wed, 28 Jan 2026 14:17:14 -0800 (PST)
X-Received: by 2002:a05:620a:bcb:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8c70b860766mr819705985a.23.1769638634131;
        Wed, 28 Jan 2026 14:17:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fbd154sm5748571fa.43.2026.01.28.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:17:12 -0800 (PST)
Date: Thu, 29 Jan 2026 00:17:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable LPASS LPI pin controller
 for SM6350
Message-ID: <44ar6f64zneh5ix62mjtwycp7np4n4fpabynftrpb6yev4qshr@lopazp22g6o7>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-5-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-5-36583f2a2a2a@fairphone.com>
X-Proofpoint-ORIG-GUID: Ospo2cDLaUnnCq2o8WFUGmZSL37ZX082
X-Proofpoint-GUID: Ospo2cDLaUnnCq2o8WFUGmZSL37ZX082
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697a8aeb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gLsbps8-TBLE9aXLRz8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MyBTYWx0ZWRfXxvirV7T6oRqp
 3tLQx+3WN8ZjQBQ6Yfz8/bn05fpXCoFUecPql3wGMb0IPB1IHJgBDohfTemP2iU9cdA03V4CniK
 jv8Q/cZqb0XMVtbUkXkYPu2qYiC2zFUfrm6JIuJIt+PXV9slboXmrzfBsJK+9Sx6CiRlhVGA3U7
 X/zdoP3hMdgWu/1+dLZB8dAnXFWQDNqoKzuXH7FyAZmX92wP5TzrGizNhzavTm3G4utOtQy6wCY
 eA1uDsajCWHlSg4UsqfhUwTYz5dNBEt+vslJtfQnWpVQ43XeXAp3xL0dcrDXvyoLOkbbSRiio3T
 3J6HqJgN6PWyJf5SgnSIujCgUDB2uNig0Xbe+2GCoxl8U3iy5Zmj7urT35eyr85g01a8AnLp/KC
 M8FKAgpZ/yz/Hi/sRYgZWvnYwXzEJqFsUKVKDxxIVT8bztNh2LfbzZcMZzjHCajOQCegUBsl7T7
 Lt1r73oU7VJ532Q5Pmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91083-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47428A97FF
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:26:53PM +0100, Luca Weiss wrote:
> Build the LPASS LPI pin controller driver for SM6350 as module, which is
> required for audio functionality on boards such as the Fairphone 4.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

