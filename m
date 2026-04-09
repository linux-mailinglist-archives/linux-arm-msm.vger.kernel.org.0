Return-Path: <linux-arm-msm+bounces-102383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kADjGOIE12mPKggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:46:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4633C551B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B07FE301990D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 01:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B10E32E6B4;
	Thu,  9 Apr 2026 01:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMam3GzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnjQXUUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D28332FA3C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 01:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699135; cv=none; b=B+dNmQcM0QcyaDbHR1knMRuBdpnoqJ8F4FetrFRM1xBv6UsM9Z2VHRDnz45KRqPum5BEp4nHczr01ij3H9CVDcHnzjthUB+RwvTnQoSh1QuDTZQT36lLqX0oJ9587BHiTqg3qEHxp2AFGaKtgzh+8TNzsYwUm6j6dTdsnc2wRnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699135; c=relaxed/simple;
	bh=A7OiPeDVqfI9y90vgpOUe1guRE2QgQrmXaqIoA6mjAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stzUnHBYF7w+f+5GpvXAz1xfITVeXd1Cb9LpPJp6XCGU8XhrPeaxgVDn9KAr/SOoq4z3aYqgZOy2bTbYVYitIydwqNwdGPQSXj/aGcFVG/bNI4sGNp46G5WxQC/G2O5cln2rg8t2B6/Vsy//cGAkCjoCTDELSppu9rWsB6xmy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMam3GzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnjQXUUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638KwMGe4107652
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 01:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yF3K6jCyIzB4qUf5GHAn+Gx4
	W2p721JX0X3qaCwgLoM=; b=hMam3GzTG429qX4ttEVsBAp1ZS85g08tvR26GdNd
	QNCVxLwQXZ0msw7nld4RfI/P2vYd7toEwvesfQwJI8Fysc6K/BA7Hsl0GHOHG5vO
	dZuqAwfVerh5hG4fEJYFLO20u4yKVoV664ikSeOoWcMU8uUqMf8/JYqpBX/Mcv01
	PXld2YCEv3B0U14selTLR+zVO6sSLEbSaQj25zm5Ntw2ka5zPp5FS0QGCRmAWREf
	3Dq3NKQlWuKbIZzCv5iNkgJf4FvdBSxjL3AG4Ia9CZEqLDHUsJIEXBUwwMW81IlM
	nX2JIIG/b5015FlzYPb02pXi6vh8w+uk0Vo3tURCKqXSuA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhagq4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:45:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ac04b2fc4eso17932676d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 18:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699128; x=1776303928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yF3K6jCyIzB4qUf5GHAn+Gx4W2p721JX0X3qaCwgLoM=;
        b=KnjQXUUkxD4fBvI0L861AYHneYAj1CYokqKF7C/GWGEakJcD5TVCcLUkErBw+vzvMj
         uP0r9lY1tP4jCbFPSz4T/Tbpv9dpfAXiTns7q7dxyUJL44H9e3AKeyW0Gxzwr/52j/sR
         LmlBHDgxMNxbdjKJnKNX9xVZHajDHMAWpTNI8ZDdeltECl1sXLdecQUb3NngMOs2L6R+
         y2yy0+AKW9vl7n4Uv4LB0fVKcDAIu0YDX1OPzAkf0d6GMqZq6pz6oSd/I/TvFU5FtuuF
         Fq2eAzTmLjiJYPiEApc10OdGx0UCR4wbWThDSqFXZqSWMlAlsWva7G9bff4kTeShfasI
         qGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699128; x=1776303928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yF3K6jCyIzB4qUf5GHAn+Gx4W2p721JX0X3qaCwgLoM=;
        b=UOkAxHoH47cQbIyyH53vacsIlQCKqpSHX0ISiOkNE54b9WZ20zhAfGamAN4124Qvko
         CMJLZ0WTKncHEhJ8VrVw2BY+qRmivEswt6pnZtOC0C/1IpRPGfyBbUkzAMlJdlOaQ2jP
         J8rO7gLYaDgNVUm12FUG2jxwj2ZWk2UhWJRiJ/3GjPVlzuD2EXE7xm9SRlreOJYpCHET
         faSp6Y1iWpSIT+rTxW1ptdNUsLRWSgCVqpwxtuMRtlwMYiyGsesVy0MemBMsoB0BuW2D
         krXjACSYnmwJsfF44VMUuI9uPNoA3trsAegAVZKCFN1dYXmfsXkfA80mnNsEq/6VJUZ6
         oZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRYhMh2TR6GAXsfrhLSH71hdBt/fHr6R25qZYfVXeBjQaIMOl/sps1Lls8l38kwuxxFj2FDUqPAdqMU8X9@vger.kernel.org
X-Gm-Message-State: AOJu0YzRY4lmqywUhDHIj1oNX1AtYilYyDwjkkq6ihoW2Q4o6xXRNrRZ
	V2m1ePNJAXYn5iuvu4boejOihD3UMXFBfxSKbSGlHQ5XN4lrv13EKeDt0fvVcDZOPpoCyKMgHse
	FeFnKia4raPI+o/v7UZ62062M82h1maM3KQ2QshcPBUZgav4lIj7nO5ig1kC26RVnbszF
X-Gm-Gg: AeBDieu/v1brRxNTYxJvIydtE3XZwxUpdTR0IujUbgBnNob1W6h7vUP3tBfD25RQcv4
	JdKCzmaYwAcKDZHH3j8GCrMP7YJ6deH434IuFnJ+R0psbJZ4WxJUZPQD94L+8gqij88r07DFowe
	TOkG8bSQIILJw3HVZtyalLhwC6fdZYzds8w7D5bBZ7GJwKicH45L8mpoPmNB3RBNzwnMHufhZF4
	WbKR/mgfpCJVDokIawr44elBER97UgfkVYKWCRJF0YaTHGFIQ8tqEy1i2lco74fkO+o1PbZbIKi
	EF5JmfmcY8qJ36+JirQAfA5MlA/7n3YxIolXe9m8yQLFl5Ayvnr24/KVTf2LsT4UMTag0JuSSlm
	5DT/FvPIciqdALDKTweBPYcc6+AgWnN8a2yxsRb73rTayICmYeF2Ra2SrImJJcUV6ZfthOEPlOo
	GPYpMtO7VdMueKDHS4Ke6HGUbDkGx/uFJJhYU=
X-Received: by 2002:ac8:7d02:0:b0:509:120d:4311 with SMTP id d75a77b69052e-50d62b4b204mr346669061cf.60.1775699128213;
        Wed, 08 Apr 2026 18:45:28 -0700 (PDT)
X-Received: by 2002:ac8:7d02:0:b0:509:120d:4311 with SMTP id d75a77b69052e-50d62b4b204mr346668681cf.60.1775699127678;
        Wed, 08 Apr 2026 18:45:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951c7sm5090676e87.17.2026.04.08.18.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:45:25 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:45:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sm8550: move IPA properties to
 SoC device tree
Message-ID: <nwpdaxlob7sumv442qhiy34opi45p6qi4xldmijkfkvt2qhtcr@5eeuj66nrbdj>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-3-d0c7f447ee73@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-rb5gen2-dts-v2-3-d0c7f447ee73@axon.com>
X-Proofpoint-ORIG-GUID: mpa23PX8buSPpoDjUwIAn4QlJ91RMIjG
X-Proofpoint-GUID: mpa23PX8buSPpoDjUwIAn4QlJ91RMIjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNCBTYWx0ZWRfX+orJ15SvAX3T
 mfJhntNPtZWJuUuuyvBuk8GEg5RQJrBaMjIQfSZU6SvDOnHb1CwKc+GBQD+/D8bFczSKMLd0VQh
 /ni8sfeJEAUMxyeAXcO7ic0n0glB4zeVkrLUA24m7GzgVHXS3o5ff0f5vr3oYyBNhML/pKrGzzp
 YGn82UuZ0+EBF26HQkPpsIjDsgld+IyrUzjMaQrztmgFZ9G5EknYvNk7Y24pmk5mu3MJwMXXsGz
 lXQ5p7Odg83PQ+1QfdBFX1Y05oL/cKg530GfokpszyWL0PGuGiCxbkASgZF8/FdumY0akNMZxdh
 w65S+CDKCyMUF1amXPkKRXtStLNrKa9+HEFfjGN/9D7tEow2OTi6t4TRi6F1XeQedkjffj6K7Or
 H9od2nFopOSNpSgsmBwmjlD33a3RjEb9MN/LsTGpsDkM2rImGneArUUOVOuj8bIGWJOxv4LRFRX
 NdnmdA9GlRh0/C75mxA==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d704b8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=h77gEMGJAAAA:8
 a=EUspDBNiAAAA:8 a=-5q7LgwmfLsncSyo2ooA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090014
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102383-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axon.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC4633C551B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 04:46:46PM +0100, Joe Sandom wrote:
> Move qcom,gsi-loader and memory-region properties from individual board
> DTS files into the SoC DTSI, since these are common to all SM8550-based
> boards.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 --
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 --
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 ++
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

