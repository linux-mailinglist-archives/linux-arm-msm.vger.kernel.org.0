Return-Path: <linux-arm-msm+bounces-60885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A378AD45D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7EF41757B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DE228B4FB;
	Tue, 10 Jun 2025 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX7VdYmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA557289E3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594102; cv=none; b=VlXd0mU03UFsYIQy/7azrPVhEiKDPEqZndZ0ol4Uy3N0XvacQWh4OI8K5vVgSidL/nS4UwWVPBhZaMya4iSCMa6QSeWrze6oBhUxDGScfRwfOMuink5YeuNEaUzOe0WUBs2jHC3MSJeulf7rqMxyJxU0tDe6IxaggohvulZiiLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594102; c=relaxed/simple;
	bh=YvdzXJMQSdK/2qt8MvMMQWgunI4DcAdj3g+QL5Ek9oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGPcMshy7EgbLz/v+IiBtCW7ibdZak6XYT+xpsHbvU4IpRX3/KqPibpTNe2KLttgNQ7V7Z7dBJIxt09U0dhl70JXKreoTvdmkiBPXBiq29nzdavFFWCkPld3Zl58BEMs2qDAACDANznepJdG6hcl4+yI1SRVKiprFZUy+5po0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX7VdYmo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPtRf027410
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RV1FvH/Z3KH4jd5rDx93/TSY
	2YFYDygQCaUG4Knudc8=; b=XX7VdYmoYX7cozWQtTQRknuFrZXvGvvFWi5qAfAp
	PR0tOwPUR0Aiv3ZrloGKJSaAmqhsVlQ/gWGXSkz2GiflXyeUFyJkvC0RmUdQ0wLP
	WzmVAltHcHQWxvbLgsvQGZA4KP/OigVcHmyVJdZMmi6omMoVmvmd/jEWP54u/bCU
	9k+gYYcAXxaD0UHWPKREq/zpDdq4tNUut3qFoVv5xGHq1jtYK5Ivr5ymJJo/iJwu
	znaNIc+PELGU2h0Ic8lsc8GfmTJ+6GxNt5kjyXw80UV7DRTQA/31w4NuJ5Hhu20m
	dvi87IXMXncUA1AGc+TjuWTDeYG8vWu+7vxE5JrPPAtF2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mckp1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:21:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so1049153685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594099; x=1750198899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RV1FvH/Z3KH4jd5rDx93/TSY2YFYDygQCaUG4Knudc8=;
        b=wEXoomxsb/9ie0oEWzIE9Gs7DdXy3v5BM0sOWmUrc1mB58R3fi/l4SDE17cMSkzaie
         ia+6SMSnhu422649agubbPHv7ueiuM+W2sWgx9AfW0kHJYbZcm8Ic8+WU5ZkjcsX3J5+
         lt7vcTGVvZvP1EkStO7BC/DwQNaQeh0AyYnBqcXPQ5XbKx5OuzTGdHkpOabAixantsnZ
         p4BjnRwAjOww8lXgLikYV2Ip2/siLqED1WNv/qMugE6jWcjkmkC5gYJktb1gbW2IZm0K
         cUVkfWpI5hJPdKN/c69ZofEb6cM4GapYeYabRXd42Pdq/FNxWspAOEffsBJiT5UDYlns
         B1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXxPokGu7ymxH0IhdIyHr4x/t6EFzxCDxQ6O0LxflV3Os9YQYWQV+e0PEjY437wV/3DytNAEJ7esICENxTX@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOsuEzutMBfq23U4czsxBpStj7ao/nV0BiNfnlObExpiMql5i
	V6uDm7LfGjM7fpO5j9AUa3WIIj19ovijdtmkwHgqAmtt3Lj9VEUmLLQD+1tTdeyCscmUEuqmeyi
	MmfVTxtgw37B9/wT8WgXHlFmp7IAGE1sinK2WNE8mHdQ7nwWysF0n/Yo5Z1/6+UPiTdkh
X-Gm-Gg: ASbGncu9bgJAyQzUfJFBjfYK3O/LhRKEFs3nfYdJEG32AemSxO/tEcTrqcq4PzLShsb
	kaiY2eD0RQajecpap8cfDMlIRkR17KCWoAejqmAwc4yzYGOtgysfOQgMB2r7iLCHDSoYk6LfsY8
	5BOxoZleBlOZHeDX25mh9wOuAIzBdGlSguPEGWZooM6c7FJ74KbuPGRO5pRJvYw9AgHeaUgaiCJ
	Nk/fWGjD/wOt1cZabFVfzdqoKzkxq3gQIUqY9hm8rgt7l9m44DrNi6SdQRwYeB6lxb4L4sDc5Mp
	wYPGSA77ABQbtXS3ndae2e03JVBq0mzmiKSnUlBobtagOm7+N+OrDQau16nnzAdZ4mPzNwkz9Wy
	1HiJWGcyunJABWRJBms/yL3KZGX2iQLj2DZY=
X-Received: by 2002:a05:620a:170c:b0:7d2:1199:ac89 with SMTP id af79cd13be357-7d3a883f33dmr208488285a.36.1749594098711;
        Tue, 10 Jun 2025 15:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHRRQuijtNJMUaKmxwgA6z/qlHR9MTcJ875zwNfzdSYx+nk7dE/YEFyR8j7QpjOr1/vQvrRg==
X-Received: by 2002:a05:620a:170c:b0:7d2:1199:ac89 with SMTP id af79cd13be357-7d3a883f33dmr208484785a.36.1749594098350;
        Tue, 10 Jun 2025 15:21:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d01dc9sm16225641fa.108.2025.06.10.15.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:21:37 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:21:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Message-ID: <35muvo7h7ynfvzjt6jomasr54xaomfgt5etjc3uuczhfxww2ds@u5xsayanthx7>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
 <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
 <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
 <97e51ab0-737b-496e-81df-b73c9f598bb0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e51ab0-737b-496e-81df-b73c9f598bb0@linaro.org>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848aff3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=yfBDPXAuP_RVhw_2PxYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3cCqGqRU7yjLHpnBdz-bLmhFwjv3O26J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfXzjoyAPUPLUti
 Qzn+JJPr9RkeoGPwEDzcjzbbWCgGQ9EyDb+/ii4qhJ/b6cq4Pt6/oBJGttUV9MX/PUY6pNCy9ph
 jEb2SyLyfM5xISoBws4GOUZ2cmG53sR0juw8We6DeYfcCvCmlmXXpxp4Z5HP5O6UpQ6puy4hpxB
 q1Utsj42KOVkJL1pyb48zby7NcHSZqa9PadBBaj67f0tIS5if2ptse7TTOxs3Ndq8ph8fdd8kAA
 ailebc2Jbr8nszus/MwM3CsgEhBB3ubHa8e96W11tYHmed/m6VHl/n+NCVgLgbTtcH0uBi9OpNf
 LzePukeBCT319V0JnqatuyICYQCankGzVKr6K+LQMAV0TOnBk1eX6gBe5DMncRkEKdSVf9+fmel
 507mmXATVrA5CIESsOkhukgb8TM7Udpenox2jqDr3GUYCkwtJSxUalFidmZ3l4cX6KEKym8a
X-Proofpoint-GUID: 3cCqGqRU7yjLHpnBdz-bLmhFwjv3O26J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100184

On Tue, Jun 10, 2025 at 06:10:33PM +0300, Vladimir Zapolskiy wrote:
> On 6/10/25 18:02, Bryan O'Donoghue wrote:
> > On 10/06/2025 13:45, Vladimir Zapolskiy wrote:
> > > > 
> > > > How is this a Fixes: ?
> > > 
> > > I call it the fix to the dt-bindings documentation, then what is this
> > > change, if it's not a fix?..
> > > 
> > > Anyway, if there is a strong disagreement about if it's a fix or not,
> > > the Fixes tag can be dropped from the change, since it's so secondary.
> > 
> > Since we don't have a committed upstream user I don't think this is an
> > ABI break.
> 
> Well, Dmitry says it's an ABI break... It would be beneficial to come to
> a common understanding here.
> 
> > But I also don't think it warrants a Fixes: tag either, there's no bug.
> 
> There is no bug, but there are Documentation/ changes with Fixes tags,
> it's okay.

Fixes means that there was a bug / issue that needs to be fixed. For
example, if there was a user for the bindings and the user had these
values in a different order, then changing schema to follow established
order would have been a fix.

> 
> I will resend the changes with whatever updates requested by both of you,
> if they do not contradict to each other.
> 
> --
> Best wishes,
> Vladimir

-- 
With best wishes
Dmitry

