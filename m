Return-Path: <linux-arm-msm+bounces-63200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846FAEF68E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 532344444AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C623272E56;
	Tue,  1 Jul 2025 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIOPd/uU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEC270EBC
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369392; cv=none; b=kGormtREweLg2GClsx4C15c2JGlDlyX4rUuVXGmBhFThulsR+vKzWVj/ApUBbZGwZpSaSMfMKbWPPpCcefhb5K+vyLyg2c+RCy7ugdep711uPGoNQ5ADZ+VTZfo4XvYGJEj9wZXypcuaaDLOAZsDzd7Vlq98pIr/6Zv/0KCMm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369392; c=relaxed/simple;
	bh=aecfqIgcgMS8NEZYswyAdEeWrhP/4nJk5uApShw52ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9nFjeeMReW/M00D0wrnXfULuYiJ3/Z4igldO+OBNbBGU3jiFR2AOWvz0dxz50QbV6oB9bfEd50YBaKT1sPFDNUgT00iezLu9JOZXlTsfqiuXzYpjmJu2IhzRsTl9jeZXNwhtdRcrSZh4lzjfCVk45TYNZZMDRvvVrZrsyuEZME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIOPd/uU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619qgos018588
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 11:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HeCUTIvo2J1PhAD2wDzz5Zb5
	XHzZC9YruSB6ZaOdH04=; b=dIOPd/uUrm1KFxuvaymajs9D5M53DEntgx/u9nzu
	yQbOgJ1n5XwxciyfA5G3aTNFJwP314unQHYkGGGdAd2w3e+YFUwp1wjNOe7yuQys
	mwPB4uMJCR242jdy9hjaWPvRRi/7p6yiSADi+3EY5WU6NGy+3RzQo+BRosJKQmfB
	pnKXC9sTCSedMq4zLhi5gKQcKVGxPaBYlNRuUn4U1OR0uGamvj0PlV0i//3ZYgv8
	pmDcdocRb1gQlxbUnmRD8SGB/B/LyXtUiQnI5c3Q73pNXKGJcZ/qUMduPtHsnaIN
	tCjbEZlJC3RBixAoY6Pa2Z9AegRiSw7Qf+r6oMe9TRNpeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxgr6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:29:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d45e0dbee2so348911685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 04:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369387; x=1751974187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeCUTIvo2J1PhAD2wDzz5Zb5XHzZC9YruSB6ZaOdH04=;
        b=E+elj6bc8Onsj2CywliX6VjxIcV5CVG+zoAWDUm4CL5id6rZ1DpUzwzw2KuEzmzpF2
         B0wC5l0HPeQeRN8BV6ReH2bZyluD+SCSP7RqvVTYGLWRiuddPc8rEigzFfKVQC08VUYz
         GTsMy3dulgKDNUciSKKhUDiQSC8TZsuJ5zT2NNyUTlRZ/ZTkcZ5zz9p+7FZ1j150aQm4
         rOqkZdMt/mh64n4HQk9Ah2SNxNP5m43T9ckGjqjaAL1D8n6mp9w+o2oFqRtv53SpbA/m
         5TrqHCP/pM8EzZxdwwphb7SKg2d60oTPbdpjI5pD8KbzCjDfetmPCbmiFtUHW/JktfLH
         +FCg==
X-Forwarded-Encrypted: i=1; AJvYcCWEM3ijkd7zyY0CMPQ9ubfomxybxvSKMk5MPM2bMg6Xsoot3hEl8BpGmJJDd0QZ8gAsnqtDFArFRv5Vxb16@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uLDnzTsqNiqvZsEIeigqTFqspxsrAG6gaHvm94FUESkEITdP
	Y4snGhjCakfgA9KADv1+QBrSnQynPHvMraEuGVvc6tp6Ksz3wPMjxky8JOId92lyDis6sX/yjwd
	LDpmEL7QzigNGLpgIGwbxOsgqGlCJJp3qHmLcfMQ+xmr0IGBu1rxomrxXijn/LGLq/+IC
X-Gm-Gg: ASbGncsSwYeNaGfIIpKc2aDiZ6eaYzjfMq5cMSnr+6w5dJxwToRW/I6dFjnIP0GIxVC
	fvIpfRs1g5zIX+iJ5kVlY26y9qByvB9Fxi1vmoU5ZloZ1fLsp9yy4At/uTigwd7SSvt1UYYB+2L
	3dKnxhFVqrwRD49Kn+dj3qrKAeXtNxIdc2kwfeigOZnBOD0pzx9QaME6o1iqqK3/AvqgJXn9+by
	xwjQWJIbSuKcNH4TIdERbTi2kIzSqFDIjaQaIl8N30oxGaPdKA00aM+5AcaYqltb4IgPYEc7gx4
	1roiFsNVcWTFbOVwYJys9+u9V3tPDFZtmO+/obH1u+ofsC5vIkHdqn1HWmD5ywbxpK3owgQTDqX
	g8LbbO4fADOuz4mOmBxlcfmUcQpk33hHG7VA=
X-Received: by 2002:a05:620a:29ca:b0:7d3:9025:5db7 with SMTP id af79cd13be357-7d44390de6cmr2236946385a.20.1751369387453;
        Tue, 01 Jul 2025 04:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlEPq2TzJvQkQhhpGX0KRHwjYHWsll+9h6ewOO18Z+pocOSxBGiQFARtIuoG0qr8FCuX/VUA==
X-Received: by 2002:a05:620a:29ca:b0:7d3:9025:5db7 with SMTP id af79cd13be357-7d44390de6cmr2236942285a.20.1751369386888;
        Tue, 01 Jul 2025 04:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2da80dsm1785087e87.220.2025.07.01.04.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:29:45 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:29:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: add missing dt property in
 QUP SEs
Message-ID: <3qji4ppbdd5lvalx6qmbr6f7jsvyhyulfshchlya3ajsykbkel@rlu5uwvc2biz>
References: <20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MCBTYWx0ZWRfXxLHlowZnZ3B6
 9sbm+UA3i5YMtn6yegJbM+ZKBpcaIFtY1RMM0OqdHSgSDj8cPA1JlQlM8972YsA+SE310YL72uV
 F2yqz27Xw3o9twxIc2XBStInDuRHaFj08WzwXTH7DJU5BVvEzfL5XhS7VUiDD3xDRk2HQpHTx9v
 AtnXwppUcxLaMZ+TAqPVV5oEbrP661UTYHvVPjoKvhGEnJX030TPl7kAY3XNR2OhvgIe2bUTGKU
 Ff3XY8AuxTW4d3RLPaokr6/HymDUlQw2IIwAKKI/QtxVYgaGXpp1056S476ZwKIVbzENHANRdHw
 mOypl8X2l2lrwJ+6u6xjx1hxEGsEf5zDmKylbVMepJO+4zRyfNiFlbV6UmFl3xHmfhWTY3QlILe
 gI8kgBfxik2xt+nUpobGbgI+CieOqZMTMowAUIGakV6mE06u8Y1xBj5uK6OLNHgzUTmXkMlz
X-Proofpoint-GUID: Qv-zctI8YrsgRAJt05ocPav2gBBg-szE
X-Proofpoint-ORIG-GUID: Qv-zctI8YrsgRAJt05ocPav2gBBg-szE
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6863c6ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mQHHEpzZ3wyIVHhDumQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=717 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010070

On Mon, Jun 30, 2025 at 12:13:38PM +0530, Viken Dadhaniya wrote:
> Add the missing required-opps and operating-points-v2 properties to
> several I2C, SPI, and UART nodes in the QUP SEs.
> 
> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
> 
> v1 -> v2:
> 
> - Added Fixes and Cc tag.
> 
> v1 Link: https://lore.kernel.org/all/20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

