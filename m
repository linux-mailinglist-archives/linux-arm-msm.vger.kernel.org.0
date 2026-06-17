Return-Path: <linux-arm-msm+bounces-113683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTYPFNQUM2oD9QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 23:42:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C3069C8CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 23:42:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a9ted4yr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Stk+zsTz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113683-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113683-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D214D301BC01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 21:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B5C39F16B;
	Wed, 17 Jun 2026 21:42:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032D32BF24
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 21:42:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732551; cv=none; b=YcHwAKVh06Rlwjpztnyl57SBJTQ+d/txAzkbUhdsfNV5K5wSz0nkZiO8ZYjITwN9ASjaoH7FCV3ghh29vda2VGSxY7nqLFb7GLZRIUxebNCbA8XNKk8pK4TT7j6mWgkYJ/4iwK6APYj7U+Yo5UET1XjOd7B24mx5TtTMCoU+mLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732551; c=relaxed/simple;
	bh=WQOz/FpowsZ32XqFFETVouryEa1F/0R8k5pJuBp1ezI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiySvPw/aaIiMdibjy4u+WU0ot2FqTJolL6w9I7BBHBxDNd/+agiJ3D2jsk+x8j26orUsLmXXCT/SZ4ymcZNCUsZPpMSzl25z8X33HvJRNwr5vWQOb/XbBAGANvCIyK/0AxEvA6njC3A+aFfGMYvkPJcMEULIpc12CG3t03T+RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9ted4yr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Stk+zsTz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HIsbXF3068230
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 21:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IlNdZzz0mcq8uXSZYVq5G4To
	YroDK4RMx4Q0MAkPfKU=; b=a9ted4yrg3hbWO0fe20SEY24yFMeL8Rg4RkSB1uW
	shllfmmXZYlUeD1weroB24Lq359SQIx1T7N0P9h06kbBnOitnxilm5gU+ADpu+Ok
	/1I9SWnrJoCwIsG7WiahnMdUFbB0awcON2M9qM7S8mnzsBjA4ztNr/B1CpVk6o1l
	jGxSryWchma4Tj1kLYUdWYNuPH1D3++IcT9bazDUsD09lhIdGAxy9vxp4F+9GNv6
	o1p7gJrfr+FxW52cdoO05BjKfumWM6iyMufD0L+wqa8l9uQ5zliY+DaqEkNgHDbK
	VapWZKAUhPjxzPtUNnfpOoGiI0KLexry0obhjABJf0WZRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev199gj6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 21:42:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91578c374easo84802085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781732548; x=1782337348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlNdZzz0mcq8uXSZYVq5G4ToYroDK4RMx4Q0MAkPfKU=;
        b=Stk+zsTzKqUaFJ8XPdhX0uB8hyr8o6JaN/i0vFzOr7eL1b0ifsnqNbmLjn2KVyscqK
         Nr7Kt5rDZJcb3zg8Td/qpUqb02QyH+2SVmO6tcCVtHYZqThVso6dddzXZZfGiDw5Gt7h
         7cKYrq1WBbua+vBiVzJfHvywA001n1z7hkbjg4UjjJu1llIB7nuM04Ny9R4D2b3KmSq5
         9/9fpb19AnMpgV1pENYc53fqB/7VjV+XBBJX+FmKB+BomJSZU5NvjdS65Jzfo3W+mm5s
         zANH/mqKmHka4VP+eaMQFN93GXhEQ14PhwYn/6fRcwyl8ZeEhw8cROA8FHtZIepqV1BJ
         1pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781732548; x=1782337348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlNdZzz0mcq8uXSZYVq5G4ToYroDK4RMx4Q0MAkPfKU=;
        b=Z70u+M4I9mLy1SswHvvf8bzT4TeMAtQFb7Qy/BuwCqX6WQabGRiiM3Mj4T92JOErqo
         n8DCzcR/WUXQI1UTG3LL/32hGSUAYlxUQeRql+yhoFbRLNWkQmZSRKFxGywkMWnDCBbk
         dUsezBei/uknUH7hWhC8Se/B9pek+GhRHBrE6tqgOhrM6pEmK++/IOvIb/vHrVm98ioG
         FaIspKJluxbu+BEDuIVpOuX2ENGMY6BRWqNJ3dFmWnyvkYhHXL1y3COETlASdLzhX9Rf
         lr2k1US5eAPoqYSswCidj6gBXznVLU2WieX7OX/fb4Wd8GUGX+QGBayBZ6oDf5aQp2BK
         TPHw==
X-Forwarded-Encrypted: i=1; AFNElJ/YgoY3DloU0+siIBXObsiLaB5FFOR0pDIgmnE73m015xMNnddlDjW2yDk+4sF7eB8iVDTaU3Usqqe7lTYT@vger.kernel.org
X-Gm-Message-State: AOJu0YxnMpCDqEjpslONLeIDNdrAfL6wxaTBsV3hits7dCRizR/fPnzz
	pTyk9zUt92Gi8FNEZoasAQ+VrfTG5lg0BM/qZ6ADojfGseMgD2OEIv2jXfLZmqG68lXXNEwNxHq
	H9dX1/bCYTM5ME3+THwsLZd+NQvZqqjosGm8x0VHm0aLsuVeOztMPwrpX/4foo7GNNA90
X-Gm-Gg: Acq92OFde4bJLH8J6YMxj+RFlT93mgQpGizgLxINxn7YcjR3w+nbKVEqtG7XZylAcnr
	ICUwqRE3XWYdtHiXYZH8rVyPNxFDojAWco0wNuth7ishUDF4YA+kdv202Jr3AzHt6yeTxp+4szQ
	Llpp+0IHAvZjuEOntHpnqYkm5beApU4sB8QlYqt/Do2JDCHOpg35/C3sAq28dxXI04F0rTl/H8F
	e3ownCXOLQD68VYnn8qOZ9fYLvsPvqyl+jSy1g74/NoCBmNj1V9deYrQ880JzE7WwDMqLuiIM2P
	HWy+/FrF9/bkAy18oQFx14s3Lmw4FUA+e+xPlM7atLMrKy6QR929zYLI3PyGwDfj4mH5zxgH4Vx
	1ZXs+oGz88AHG17/G1T0zv3benxCNWFvJSDJ3suDdKqXDYSMeTc2zFEI96IFNqWp9iaEcGnBWce
	KcXFSPN18UIzoaumzM8z25N1yx
X-Received: by 2002:a05:620a:d8b:b0:916:180d:5791 with SMTP id af79cd13be357-91f25ca5afemr164289685a.2.1781732547655;
        Wed, 17 Jun 2026 14:42:27 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:916:180d:5791 with SMTP id af79cd13be357-91f25ca5afemr164284785a.2.1781732547216;
        Wed, 17 Jun 2026 14:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a02asm4737924e87.21.2026.06.17.14.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:42:24 -0700 (PDT)
Date: Thu, 18 Jun 2026 00:42:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] regulator: qcom-refgen: correct the regulator
 type to CURRENT
Message-ID: <y5azvga2u2hyauqrspl7zzpmblex7hwdku7l3a5gumz6o2w4w4@u7ea7dfhqsb4>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
 <20260617-ipq9650_refgen-v4-1-c505ea6c6661@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-ipq9650_refgen-v4-1-c505ea6c6661@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Bl2-dQC-HQqZYXxx8ad_JIZVXnfim40L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDIwNiBTYWx0ZWRfXzR3t0raRQtmW
 jMBSWeSovmYB5jUhVclU6RDRT/xse6yFl0dMbef0DKKP0p70OeWl9QNUXBZaKan1WM9iZQJDf+G
 uhnGDDBKVCC1/sfec3+WIpoooUYKNCrUDseXGmcNLzoQ0QSFfVbHmRE0LY2vFpBKAQZMGbvKhbP
 t5tZKtPgVxd1SAo3TAubZbr06Pw/RykTszBBsQ52haGa+wSRyjF80eekajSE60ETeVdgM8TSA53
 CuZM+1cK99B92qVMHFbwB/2kCK6GzrG+qdSnXkYWZy8tKHt0BPD/CGnWDodKTy3TR1ybBpwStaW
 5Ok8I/47Vf+YXl0mqdrZVq1W4r5F200liuX/mzF0ugZIlghuEri6Q3f0ZjZVMg0Lurtiu2YXE1i
 R3z24xUFRTt1BxxPVC2/KxRhcrtKEsrlcBTVJDnFXSCIFg1P3By+D3bNNNLAkbUuEX+H9iDKgkx
 CCji1/J4OkCSHRueDlQ==
X-Proofpoint-GUID: Bl2-dQC-HQqZYXxx8ad_JIZVXnfim40L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDIwNiBTYWx0ZWRfX1A+IwlNbp6aN
 3p3eBgOjgoLlCGJW8ghlqy50ezQLAjuNKo4orpXJlesdR1ExATn8mZoNvq2HlrF+dr8dtWEk+o9
 CHAwfujHOW3lZW3L9jDdtkmj2x5XjP4=
X-Authority-Analysis: v=2.4 cv=U42iy+ru c=1 sm=1 tr=0 ts=6a3314c4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tQRUmb5bEndE2dhV-mAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113683-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:stable@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0C3069C8CF

On Wed, Jun 17, 2026 at 11:08:43PM +0530, Kathiravan Thirumoorthy wrote:
> As per the REFGEN IP team, this block supplies the reference current to
> the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
> to match with the HW behavior.
> 
> Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-refgen-regulator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

