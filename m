Return-Path: <linux-arm-msm+bounces-86432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A724CDABB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 23:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 999923027E02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 22:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C00313295;
	Tue, 23 Dec 2025 22:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pnYWgpI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSnOm+De"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232152F5479
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766527681; cv=none; b=kOOHLWEygjoWzkhF0Cgv01JpQikYVA0usycj8Rjgr1JLhzd7hLqmDPTe1FbXUJT/PmzlRWP2Rq/qP8I47/ClMR49mLgPZTlYTurn4uxt5fsqoJi66a6wlFmZLiDL+nLYRiOoSuB8KSRTmKQbVTJh/G9Rp8LmZVSFz0UKy5YBkzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766527681; c=relaxed/simple;
	bh=FQCRae8BAY0BBIjiv1yr2asV12UdZHwBUj9dOhlTE60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIXFauvHThQR6Az5sq+qjBHryK4GSKv9/jk+2naGDqwtO+NP6tZsPi9tH5UdD29eTxjIvSRbEL9H/0PMVIXEf5CbDDihc2f/KItwSCr1wHn+0soVvVW5vBA64T5VDxW50y11+Hu/ud5Vua28r0/EJw3eXkCjicAktP8Oo0XtPtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pnYWgpI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSnOm+De; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFOmfh024545
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jMGcMKBFiRUiXwR0Q4eaONoH
	D+Ff9TMZZ+q68jc2VWE=; b=pnYWgpI2MAvaIAw40seMT2h94/YWQZy6IjWnTw18
	LCt7F03Y6t76OmMoad3QFfVQJJ48tDgeTcn4nXaOyDeSDUGlZPNr7p9HnXB5zOyX
	uR7S+TKLwhnsyPR+VBQVZpJ5Ch6BMJkdeogkIXtyZQ37mrAe6BovYetDpOINEwEI
	KgfcT1U5JhfMmkFs1caaHSof2GnqbzDG8uhM/Nq88mT3DMr0iXO1wuPEw/6eUjZv
	ay+tzRGL2cNyv0vA1k+b4cXwznqGu/aSw1XdJQ2kEEZ37OxpHYJoDa3VAquEXbyk
	ZyjSTpOz6IhgSsgEG0dBPop24vqea0tD1/fN9SIGkoOkCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhcap6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:07:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so174425781cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766527678; x=1767132478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMGcMKBFiRUiXwR0Q4eaONoHD+Ff9TMZZ+q68jc2VWE=;
        b=NSnOm+DeouEau3CGh56N9I46YVgDSabLhC+8nyi6VotsXqbhqQCVJW/ZmNwnNZWH+m
         c68Xi477AdFNRMYTnloNli+CV3uBOXgDxaNbgY2EHwZYZ/7d4fFdrx7eLgebimxuOiYl
         hAnZJaKbgEaSCfjCjLFSzKeRIcFxlMonbDl0g8NvhlcWBnRWde4bapLxnAgOwEBOhifi
         h+mwKkm7YLNP1siR/e7px4wtwqA8M0JJCB4zRuAimBg16pXTddCXrqqPfGMuSFn7fwwr
         3iBu84yDUxByT3J6DkJ0nHCn+OOcsplLAsU8Ab6R4krlUxb4HPMfTl0jFU67e+1699cl
         5S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766527678; x=1767132478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMGcMKBFiRUiXwR0Q4eaONoHD+Ff9TMZZ+q68jc2VWE=;
        b=D7ljrQ+yew13rWC1wvS6T4OGSXgWlTzRD9tXbL+BT8B4av7o0NoaxjZRu+M0uL68TM
         MM/SmQuW5BK5hLxig41JPfX4UoSGsMFREcpKBNPmRh46g35jE995JnKio3/pXOLx/brp
         L0tqyD+QOQRGVxWm9+WyMnTyoxnITIuw505AEYeDK9BZTAn2IfHnMc2mt09DfjqAy9Tc
         xlA55a5Qs3nGWdx4cJRkKiCPNBXeMSaTDPzsKPrrZynKeNOsHyUy2KZGQEk3IvJ0sKy/
         aRB9Xb3O7qKicyl6j6tRTIup/g+RYxB4vhZP5ctwdRFLLFWu6fljt68Ur5ZkyfOwDD/Q
         IkZA==
X-Forwarded-Encrypted: i=1; AJvYcCVsL39HHgWcJ05b5prEnWEfNNEiuU25efmmx5hBEZfNKEbwomJ7zNfgD3Oh/o783rpYTICpupEfG/E1oHsr@vger.kernel.org
X-Gm-Message-State: AOJu0YymveOVzBGoC7Nnit1vU8Rv2di6iZrkp2ygHSPG+s4LtEWuC7oW
	MaeaSTkyXpbcM+GJ7kUFQPzhXlM6kgwh9Y8kZkAy6j0j8tjlYX4b3ut7carUpdx6i51kzdVfxmY
	S2kKAT/mClNL/4b/myBWvRoRBI/XF7dwMnlMHXEWqFW2s+o7Rdh0nkhSiwYQ9/BGQJRgd
X-Gm-Gg: AY/fxX4md2o76ucz5lNfLEo9xHIZWYPqzzPh/jc56t5VItueyKy6NPOl++LA3wh4czN
	1DDSDv6EeRYIqKa0IIZHbnA+tQnPEYMbtPPQNNE5D8NAqSH9Q/C3r4h5hfTa/aPg1lEKKod3pdi
	T7s1jW4lejFaGc4INPiXiOkVxvVNi7CZtvBxWtnRuEIhqFrwalhYu6WPfZ6r44LJbB7/iamGs4g
	ZTA9WYV2K4IJ/iwiR2LDc+T5vzXz91LTLgBPMDMDZTpsWYKYm5JZJ3x4ttowf+aOCLlYrTc8vgl
	5zfBA1BpqiwOjiIkYRGz6arFMzIDbqwDSZ+UBAI5FSRllJv2wah+/a18OdB1ohWPqQeM7tdJ9b4
	TplvdGB6Va1rFR1kKkPZzMBckisCVnWL6dNXIITPRLBHEdIiWXkOMNV1+ncpk6Cn61oz8soVj+j
	ojKzH7xl6lc50Tzivib/f1W9A=
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr197213261cf.59.1766527678193;
        Tue, 23 Dec 2025 14:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR4ZB7JsPEycMaOnjCWZZa8CpHCY92b7eETRNpkra/hjSaBy96sg0KxqZJWwiI2hVRlVOrHQ==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr197212971cf.59.1766527677811;
        Tue, 23 Dec 2025 14:07:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d6fsm4439608e87.65.2025.12.23.14.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 14:07:57 -0800 (PST)
Date: Wed, 24 Dec 2025 00:07:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm845-axolotl: Update firmware
 paths
Message-ID: <62mgy6obfy5sqizamx5gycy7rqomxzzhgoqyfts5ib6s5rzxhi@e6hyqaaaeutd>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
 <20251222-oneplus6-new-fw-path-v1-2-a2d366f9eb89@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-oneplus6-new-fw-path-v1-2-a2d366f9eb89@ixit.cz>
X-Proofpoint-ORIG-GUID: mBlwyzsqQLYWoKj0fA_BeqyH71yIDcKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE4NSBTYWx0ZWRfXxOABTo9Jsgi7
 UDZ+c6MIlH/xeUbON4SyJat/VJjFgeWVHSlNiDXRrthxEQScE/o4TJtmk1A9CY4NDfXXjL6ti0s
 kwlRhxM9Rf9xjx4yS+vO1JxN2gFVywHVMlFwQHBvRJc/FGgZFt25/RR9wGaUnQE0wZlIbE9RdnA
 cBfsPac5ANSMzGLjz1K2NMe5gBEjBXUDdTFe/NM2uKwP9MZBLJiD9FhfP2o7GyjB/z4g0h8Asjn
 CmGngLWKE8sAOX8TL7PBFz+5q7y7Melepdor+4bzK+xw5Et5zGg86E+G7pjh6pAlesoqomcFejG
 nJwa9VuS9DbPIQySioNPRmylxGlULsDHe1sp58f1r/YPgGg4qieFQ5LL99rA41dwRBWvJ0ybRVG
 xQspIh+Jc/50NNRXrgHGrqctMgXD9DhrxcYPkVQTvEikKXpV2AXnXkYoNkUDAMuZ+sCUGExnaFm
 0iwyJWVh3vziHV61uvg==
X-Proofpoint-GUID: mBlwyzsqQLYWoKj0fA_BeqyH71yIDcKu
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694b12bf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Je5-vcQqzLJVh6QI5oIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230185

On Mon, Dec 22, 2025 at 08:05:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Conform to the new firmware path scheme.
> Includes cosmetic cleanups.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

