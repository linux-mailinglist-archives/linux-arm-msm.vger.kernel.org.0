Return-Path: <linux-arm-msm+bounces-88905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F06D1C8AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E193303D142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 05:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AA833B6C7;
	Wed, 14 Jan 2026 05:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W44kEkzJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXdPJcdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40789334683
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366815; cv=none; b=XBrbvxg5tRfJoNz+jnX4Jmx3rQwlYako5L7x7idQoG+ys8K+9qB/08fweYOw4x1JnGww7NXjLb/B4Hp8wFt52qO64Q3u5TM2kanPwxinyEIP1IUD7SEqrGkzTw6EMUP1S/goW6IXzOKr6/tSn+YV30t+eacAAW5kH42Qk/IgkA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366815; c=relaxed/simple;
	bh=Me0uaNCOCdmDG93e4FTUyqIjBV+w7Z2GzDu76zrkl5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVvAyiffpkpGwuo3EPTNdYDY4csXJt8reD7jL8FOJmQXorBsCoveiHVCwT41RBxCnsQNdJ2FB4IDRogEYB1u5XDdpFny8a5OSx8aMqm1D0YaWmCVDmNCRrvC+ciE2UPqpNWePvNgogEKS3RRBOO/7XNGVS5R4HSmTU/KYlio2f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W44kEkzJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXdPJcdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4OV902601040
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBV+73iqbWqm/MmkEzJmjXDj
	m9RpMn1YYDYUK/AL1VA=; b=W44kEkzJ+qgNefc987D4mcbXWbNK6nMQGv8A1MAt
	Pv8+MkW3fEBePb9Q+ewgJB9Ox/nbf6njnOY5kQcU4y6rpV1PoJRvA2HSQLA+n2Zf
	OMbW11mViCmFbDxCCndbKATEbIfU9NqHYXkx32g9rJGIQEk8ojY1AP/nNXzbxBeT
	GHYacBiq7J4ONmPQiHH3Ym69jcd6kxsq5pymM8a6PhKHz3L34rqTgSAaZNx/n/PX
	rnOcgLgvtPNTGJVQPVMqgGiRaiNqiesc7hdKRnp/+W//y2uTCZMs7cLuOrNnHKLt
	Sl26GwsIlUE1lHnZTPxr83aXs7UGURu3+Nj3qj7xKkm6WA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89h1c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:00:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5296c7e57so372380485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768366800; x=1768971600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBV+73iqbWqm/MmkEzJmjXDjm9RpMn1YYDYUK/AL1VA=;
        b=fXdPJcdKzaqDhBwNHodenkQDL9u4+JvvPv3VBxku1OgAGL820fEoQ+zdVcDIIaGm6C
         U+ijjLwdypoVM9H4JJcLfYqKw9Nt/n4vozJl//8Jbgm5ALJ25z1xL2EUNcobJSa40+u1
         qlH26HFtXpavJ2iTxPk17DeJ21qSd0IGLOsaU32QRhgs/mIA+Lr3/IoRJ8u4LhZGB8Tc
         uCamoRH/vkIlTt4Q4OTTfZSqz8wk28ICGo4p4VEpiYj46YUgQ15c91s1TKniDP4KD8R9
         /ECE+qHPXnowg3STQqSCgyPMPoMd5yyxHJPA8P8a4qHdfQ29d5HOwY+eMbZ/THUFdZOn
         0tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768366800; x=1768971600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBV+73iqbWqm/MmkEzJmjXDjm9RpMn1YYDYUK/AL1VA=;
        b=WU0Vl5yfZ3MpOXowU9zO5+4d5uAZut+0/rIyUC4nLIq98sXZ9pvb72V/D70SlGxYdf
         Q6dzqjM0CcrWa/tLxqvPn5L5ZIw0SPLJjMP+fQRpSNMDK5wHXEOqQUc+v7B3IOLsH5a3
         LS1G9pWYQMheqa8F2uF3gj2P3tueuxPldUC847JWtUBCaEMakC1wC8sKM6CEs8qPMz+x
         3ILmAAWc5rJOiNAum2pSE4k6tklFYchmxvfpi4lomN9Ua9kDvM6B/8UrWgVYMXvDweum
         0dfvzx8tcKGkLeQo+6iJN6LSzIKOVu0epO/p8KSwPXozE2gC4oWdD28yNCWkJnJDhz9y
         It5g==
X-Forwarded-Encrypted: i=1; AJvYcCWqsHqJrBe4xL1ssBlMa80MAXivYePP83aiCy3S0IGP08aKVT8M4euCbTCHTjRDdKR5dcTtzQGD5p+cvlFk@vger.kernel.org
X-Gm-Message-State: AOJu0YwKW5fkk4Ttv0xsioTigGvxPT1pG+yp7NTSxyt9702YwHfIimZ0
	Lz7It2gho2BsHDaIbY66/1OPF36R6qPLcSOQBDkcQ+mS7Z0VkTHoT27Yvn3hIcnuFnnn6zeaNYv
	nMfwlB98q0WhNBrw41Z9xHY56EndtujGSf04QwhLvy+u3MMLg8reHddWeURzLoYRlJH5VfrsUoY
	wd
X-Gm-Gg: AY/fxX6O0RBtEsGUfLRvfpA7lDnAj+TmCG4/s83KO0AIJf9ujqmRdELezMzH5psCWD/
	5XVduZYkiuGblUA01nlnfGKQLm4ck03kTHUvjJgHjqmmy4/c0X74HUaIsUIQw8A+jUbQnGZ9fXv
	5zn8doazfEt78uowF+iiZD/bPretpsgLU/74UizoIH8zd3CbrkO7rkI9EIXjwRwzD6qNkeFixZN
	mJOTVhwRruOk0Mc9qhdlEOW91Ns6kqYwU+OVrYWpEWmS9ynGPq2lUSkR2+XbufEVrkzTuaGVdYU
	5ECbZslfU8GFdK3xESTwmm+3gCU8KCx1PE+exyNdJ9isQgUYyHrhHpUfnIfMjJRtOv4amc7clda
	+BqRHCJky2ZKqxuMZDgVEH8aLh7rKGCfRPq7gaA11/hHVGlqR3sXYNftjJt60rKzQ7JVaYALkYp
	Zd1b3AIL/keu3YxM07oBezHOY=
X-Received: by 2002:a05:620a:25ce:b0:8b8:dd7f:f032 with SMTP id af79cd13be357-8c52fbde068mr210513585a.78.1768366800164;
        Tue, 13 Jan 2026 21:00:00 -0800 (PST)
X-Received: by 2002:a05:620a:25ce:b0:8b8:dd7f:f032 with SMTP id af79cd13be357-8c52fbde068mr210512585a.78.1768366799742;
        Tue, 13 Jan 2026 20:59:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba101ac6esm344536e87.15.2026.01.13.20.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 20:59:59 -0800 (PST)
Date: Wed, 14 Jan 2026 06:59:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: merge duplicate references to
 pmc8380_3_gpios
Message-ID: <xgxijlsbnslrdcrghmmdrpvnfpnxxwhhnqdkkrj6lh7lpcjej2@mihxs35ofiir>
References: <20260114-hamoa-v1-1-c96ab354924c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-hamoa-v1-1-c96ab354924c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAzNSBTYWx0ZWRfX9HZYtjWLcvwO
 fnr4vPkv/kU0xMIMzGJRZp1AaJAjMfqzBKNxLbhBHKWcZqwAJzVA1DFhW+1VI8UDGWp/ztjl9Wt
 UfC5yiCuBmd4QLhvSkSs8P7iCOK6o961CMEEZ2iP7tBXfdixW2dftxRNwDKTk7ij25KNKA3mDx+
 J4SVLoC4CIpTVOH7A3YMopAQX3JuenyorR0XMp3DYLXWcTmxqOJlJ7iM4CcABB80WeawRFXxuZx
 HR7kWWH6XT9p1mw3z2SkixQAcP2krcpoRnfOOLaemFAxWKgFIH0tjwccladpaa15ECr/q5ZGhiT
 yNfxi/bmjZH/dFhsq1grs0+g7rYRuRWhZkICXPocoxsCRmCRkzu7hn9HLDVpmoFOiblE5BP2ir8
 e+Omka+xsTtITdbFbMAfQ8E76xdpNwJxbCLsMlNyP5JXgS2QTdLw87letVXZX4/eUBvR/ydZYA8
 PrhveAALVfwDqP9ci7Q==
X-Proofpoint-ORIG-GUID: buudiS3gUEdt-pBybV3lPAbI_k-665U6
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=696722d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sQY9gcyLkgkrsXYK8ucA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: buudiS3gUEdt-pBybV3lPAbI_k-665U6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140035

On Wed, Jan 14, 2026 at 12:30:43PM +0800, Yijie Yang wrote:
> Merge the two identical references to the pmc8380_3_gpios node to improve
> clarity and remove redundancy.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

