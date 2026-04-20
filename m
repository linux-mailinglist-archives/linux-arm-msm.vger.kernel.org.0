Return-Path: <linux-arm-msm+bounces-103829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKfiLklq5mnBvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:02:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A5A4326B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8952C30162BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7C83A4F4F;
	Mon, 20 Apr 2026 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KT0ZfJWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWyPBSil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1E3A1692
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708147; cv=none; b=q0wq9sXsmX1sdKCIWr+o/yLDukG6CdebSLn6TsJknLmjfxqb4/a/YEYpJp5zIu/Nt2u2MuFAXp71kqgW8KxKwU+FmrEE9jPxPA1UqjswRqhh+lDEO51EeV9zJPXE+nU2v2ydsUFUJKtN80EueUNFTBn2XEJMi5YyqDJ1AoxjYkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708147; c=relaxed/simple;
	bh=QPOzdTkTnKDPqiKWUp1qxBEtNuz7+M+d+MCGMi9gFq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1sdCruISvNg1fgqI3EscJjUW7u+/uL6BlYXmAPVRfYhqVGLq4c83EIbQHlXZX2eyUa75xt3pODwxpoN3QhZYqB+zlqktZMoow1+yjtYoKokayBSqMiGEP8Kz6BYvOd3QYyDQFNmyv1MFNGgDqndH4Q5apqIQhwa9SImcrZcjbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KT0ZfJWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWyPBSil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHt6te3015208
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ADkajNOwG8DU5CpO8r0SYQ/
	0ro5URXBiBxiGK3Xx+g=; b=KT0ZfJWh+079sxfBbShxDUjQEl80qeEHNU337KtT
	IQx7E1PJnlHjwe/OYDkjCuqH/TqD4E2oOdRB0q0b5x9vlO6My2R83k+hTYvl3EC3
	gyA2d/NV7wPOFxLbmhFjloOwHl9376tSZyFquotTC+IJkB7AmDtbdx82MbA32PsJ
	amyJYlGSY3HEMBqVUwdLqwwKolFE2EMIXNTW6pB5YkoxbRCRHKSt4ziQ7QQwuJE0
	Jbkia4bM6fkB6R2oLzWUJqU1wFKpPjbazo4Bar3NcE/VEwCTV1oli39EfhYNU47t
	LBlF0Tn2HdsCmmkWSvYYY9CiCCagt7oVGyJHE47/j1jbUw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuksjn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:02:24 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-463a1cee56aso3727961b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776708144; x=1777312944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ADkajNOwG8DU5CpO8r0SYQ/0ro5URXBiBxiGK3Xx+g=;
        b=kWyPBSilNLNPslJVJ8Ras+tVaR/yLq6SB1mt2BSYGaiCS/AL7KrhdhPHiy5SoE+PM5
         4pHm1qL/dAWOQMBbCLbadF21ZNyk25YMgoDWeKnUSYRRY7F+v44W4gkfJy4nigzmNBak
         oV3YT2ddmS1n7JHa1nJOgO78g97SoIp2OPLT+p8RKd2cqZdBsWCSj2VXs4yPt0T0oddu
         hRenLxRusOq6XI/YmYiSe6/20SuUkbhT9nyoj6nXfikiCqXxo9dQb1Rbom51WMfIcr8p
         dR/5DOWi+mdMqvxC4vtbKv1y4Q8ywmr1GgY4nvYDasMwMUwrO4DhSXsWuMFYXyIssmbs
         js0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776708144; x=1777312944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ADkajNOwG8DU5CpO8r0SYQ/0ro5URXBiBxiGK3Xx+g=;
        b=F2hUIIyGIpRkGyo9dBD3F/HxHlF8YDTJqIx37v/kO/y6gFJ4ASRv8RDtKvNmkrfeiH
         uikykoAMySepSWMmC5u3SIt/jWPOHv1iLdrrC0/7ETJSfs2jF4PMTQZGx7FxIm15OwPF
         //sGvHAIMVZhktdOgCe+AKs90PTrE5XhWs3qRoNGCh46gis+oQdw0LAEKviFLKW5+WZX
         5N/0DxWAh0JTvhIv6B9CkJeMV7FAOK/hKO2Ck3IIm7585I/PnLFyeki5R8pG8y0n9dBk
         QoKpJ3N9Woxy/Dv2ktS+LI2iDkScGu+zFgXQNG729IXlCLKiVbt5MM9XIakyVudrVc/0
         vYAA==
X-Forwarded-Encrypted: i=1; AFNElJ8fp9+cZ9gvWhXj3JWHLbuEFac9NCQCbf8IEkGgMIHtnH4V0sjEASgQZGrHxg9YvnAu8IC0VoujwhKkoWWd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6voWyNULe9fZ62qSaktT/G0l7Sd5oOonYoZzKKE5cMQqiJpp/
	VWBKlDbf5cabdsYgTzuOe+dkQ1kWYHoHjvELiTSyzxUWvCeEdNju5XpbJsmqZFF81vnEFHjfZMV
	lqol6CKV3UYQAQnabwUH3gusxUW6jql6ZgiFmAeaGdvnexGA7pt+DvibpZl27QI+xstS4
X-Gm-Gg: AeBDievsiDVsy5i0PmWRHSnXusrCwmlmMAYyQKA0FgXR5kW89AowT9Ji6pe8EGGI2Ql
	CqE4d9Yz8voDAyDa/gw4CSYAmBErL1CHiS562gpo4uzOqsjD3FuefsWeSIV1kLMO5+Zv/uN/2Mx
	3yUyBV1tRKf8sTL8sXLHjH9E2fwdoG7/Sl+SEbQmbVt8St5SL64W8w5s95XwgSj8SM+AEPdKqKZ
	GG/3+xNJqtf/+J5ybQN2N5r5HPwbWNFgZdqsDHCEf1520LHr295JnXglbzyRdjx6OveTwb3INZX
	Uwbu4gsMwZxIn/lZD2DnrLskrifCWH+MDmyA8jHaPor0v3wghSI81bq5brztVmq8QQkHKag7ep7
	JLhT98BRLvkB7yAZ+K9qNPThcmh08VxDwtVQK+/XjdMznVCEvOqo2Ax5Zh9irADWs0x5aSd6CRV
	eMA1+MmwE/GyjfIftIFEbBIYTSMjQFVtuRLnwkfBd4EHaIAg==
X-Received: by 2002:a05:6808:14c2:b0:479:dc28:b71d with SMTP id 5614622812f47-479dc28b98fmr1483231b6e.38.1776708143927;
        Mon, 20 Apr 2026 11:02:23 -0700 (PDT)
X-Received: by 2002:a05:6808:14c2:b0:479:dc28:b71d with SMTP id 5614622812f47-479dc28b98fmr1483141b6e.38.1776708143325;
        Mon, 20 Apr 2026 11:02:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm3147366e87.36.2026.04.20.11.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 11:02:22 -0700 (PDT)
Date: Mon, 20 Apr 2026 21:02:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Message-ID: <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: C2lFo3rpXvZeqse7gQ-55KLHqKMhznQE
X-Proofpoint-ORIG-GUID: C2lFo3rpXvZeqse7gQ-55KLHqKMhznQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NSBTYWx0ZWRfX3GLf1e2m2QUX
 Pptq2KzuIcjXD3jnopcwXo91zXMYGDGEh+zx0751Rk1sLtt6iJgeyUFAiTS47p84wYo4xnBdTAX
 ukdb4gaqnK+n+63mMq2oaGIAHzthpxhpQSj4WxyoOFDejxA1eurn1Iq026pS7ZwaDp/cG9K43SX
 BXEdDGjUarGlqUEDDxPOtB7x3Z/CAUXOq4hSml08OEKcogUiHF8SZRo+u3btTXSMdcNINx1acQj
 pWYVkUAVoWcf7x7py88inlxGuyemyq3PqpwWSrht9rNcQHVfTfc41n3PU4mvgDyPBRpF3rkakJL
 RGys1YT4OzHpXSEBLhwSb/+HF0/2mtN7ytKwMcbq4Tph/bznlXAZrLH58ThZy3LJXK5daGmBJjn
 jyQDCGEp2odKUeB9Jn8duvnDkBx0fbILnvSHR3clPAv6B3GM36Wx5TaXOjtSVJ8NkEeDLvO2JpA
 4YbWzrI/w1ePmziDylw==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e66a30 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=61plZmegOCgpoSuf1scA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200175
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103829-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32A5A4326B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
> According to user manual / programming guide there is no separate PCIe
> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
> is marked as the main block with additional sub blocks for each 4-lane
> phys.
> 
> Describing the sub phys without the rest is not correct from hardware
> description, even if it works.

Is this the case for the other bifurcated PHYs?

> 
> Link: https://lore.kernel.org/r/20260420-optimistic-unnatural-stingray-80da35@quoll/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 39 +-----------------------
>  2 files changed, 1 insertion(+), 43 deletions(-)
> 

-- 
With best wishes
Dmitry

