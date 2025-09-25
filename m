Return-Path: <linux-arm-msm+bounces-75198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACFBA1826
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D740D1C81114
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8770F3043BD;
	Thu, 25 Sep 2025 21:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTFdw3tn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648532128E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835010; cv=none; b=PKjCAHBa9W2FBq2k5LFaSNujw6emz+gZ25es7Bff3BP4rK10qqbwus3pNfdIe+gbpraDYuWFC+CPt6JMVJAJQ91yydhqNXI+JqQx7SIRPVpE/rS2sCKKxF4KreHx6i5ORpYHmhibQcbMg2PYfA6uFtZjLSijbSsfSjlycsinJlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835010; c=relaxed/simple;
	bh=RglpZ36kxS+z5qVy144dZ5rbhB8eMHcCR9GOuwDPVBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF3LdODRB4ChXfglACM5s8RJL8ONl9GWR0dguw5NTgKUKbBEPgJnaZbKsg8neZU8AU0tL1Rtmn2lRDQB3pFdHWopELjIvIVoBzcI4I2DwhETZeMIMLbQLH/T+4Qf9l2R5Rgsrv0kRv3WZNAHnpxw6zF5+dQFznpaYOORDcU8cb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTFdw3tn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQHuN015888
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=at38ec/t9CkX0+S+1EyG2jd6
	TX3Gl2UwrmZ9Ict3FUc=; b=cTFdw3tncju9PH/vdqLZIZXQrSnVtqlvO9+fDXbk
	8G1MjF6OOFZNwsYzcDzmmYjvZQNDNr95wFLkLYmFEWKztLtJukCFoUo6Dg5bsFdf
	zbzvdMFUb8YKCP2qsXHPj7WRgXJKs44XOqkFFAJ3ESc+rVOZsMquI8lNdOM+CVYl
	1GDtItPGQfNc4wVzR9FXssXO6L2/Dz5IipdpplscS5XM29jPaq0jPPlRfgvJvQ7j
	bTEP1gdy2s//1HtrvHlzxOMr+LeR8pUK6ZHwTANEGlAPzHWEsKLvQ+OWz7k+61O2
	WuB64iEewSNkgR0GTev7668k8F8Efqk3d5iZwfz73l3R7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t8enf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:16:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4cdcff1c0b1so47567971cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835006; x=1759439806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at38ec/t9CkX0+S+1EyG2jd6TX3Gl2UwrmZ9Ict3FUc=;
        b=tOIGv78IeZYaeT77ZUd29w5RurB3Sq59ScPo5ZXkgHKYPMKI0l4Q4PHTzKGR4uJ24B
         X4820gQCo6MYFPeY4OvhDJpVnoJWoRn6JIsY8QkFMpMTSav2138lL0NcW31vdP1fggG6
         QzA2cCcDWp+uK4rG+0jbQdheaDWv2TiSLYFi7YjSsHwLQggjSS3ui2u2YBP3BVv/6mz6
         j5oY9OTt9/rVEreCRdZocasTQZkimUxL7z3tGUrIRiseTCK0Ns6igRQGT6f9gHUCQ6fd
         2KmGt4/68b5uMkt9QS5N2FdBMSqmPFKPcX2ptP+RYzU0DB9n275reiJ1aplaNDVY73zo
         3IEA==
X-Forwarded-Encrypted: i=1; AJvYcCXlYsZQfu2A5RxDW72laOgUsCuVWhxyGdjLk+aJ+522G3TWiyYvtyVDl6FrfDWdEh2lD/NYJenjY6XwRWa1@vger.kernel.org
X-Gm-Message-State: AOJu0YyFbTNVTxmwyM7j6dDE1wP3GV/5CKRqx/AE3IUaUgD+w7HWunjl
	XVXhGWBliBRV7YbfRbIsXLna6wYhteqbnhWzI/yFnM3qF+Y3MEg8OsMM/JpY1X17zFxIUjX11vS
	gkRwQ3e7pVI+UL3PrjkbSqemQZHtMqdpJmCbpHDs1d8T8J8rv41ydY81oGld+sNRgHShl
X-Gm-Gg: ASbGnctUn52GQQ0kpykdJFJjF8uJeC/CNKzHj5Jjq4pLMttJ9tZdZv6/+cXkK3N1Lz0
	beDoRVuWhP93B2840t7SCgVf9E8qj6BXgMJmgVRAZxSnZMYy0U9vWIuqbSDhyjcq/hHj8ZU9B+j
	Kcp/LolWF4yl439FgtJ9/BzEeQBDHos+fO+qypWxBteaIKVE+rfxii0G6xXw2Ynas36uQHA8RFe
	C+tvukNBvoWR5zicQk7CZZQV9JOrY5VBZNUnObNSc/aN/GFM1DVw6Pt39MrRAO3TD7cMwFIDzHq
	lxIn64a0kI3+kgXLEixKoLay/AqfoEJE7JbTP2xN/ft4LTRWTOxGyjabHS4GGD3u4zZR3lCG/AV
	qPJnkr4TJiGAyCikCWqHVwuCtL/pYAQSo7J/98a5Ymf8n0Nq1KsD/
X-Received: by 2002:ac8:7dce:0:b0:4d4:4a2e:531a with SMTP id d75a77b69052e-4da48d793d5mr67769611cf.30.1758835005726;
        Thu, 25 Sep 2025 14:16:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5xlKRssdgPLBp/mVDcyq87qqnlkucZFhvWb7yeGXI6WmTeu/PYEaxkEmHz66PV1TGrfpY7g==
X-Received: by 2002:ac8:7dce:0:b0:4d4:4a2e:531a with SMTP id d75a77b69052e-4da48d793d5mr67769151cf.30.1758835004978;
        Thu, 25 Sep 2025 14:16:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313fc1640sm1139215e87.61.2025.09.25.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:16:43 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:16:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/24] arm64: dts: qcom: glymur: Add QUPv3
 configuration for serial engines
Message-ID: <dmuhltvj5shmysyjmzjhf6q6nvng45odpwbxsi7frmziunxtgq@xppf6cpyqt2r>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-4-8e1533a58d2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v2-4-8e1533a58d2d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QFQnSaFIlBv-xK8gXomTP6GdCCplEWuB
X-Proofpoint-GUID: QFQnSaFIlBv-xK8gXomTP6GdCCplEWuB
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d5b13e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wkpnFKx4ilImXzAVKykA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX149DmLs4g+YY
 DVJxn0wPJOwmIDRQs4D0VlBTBoCeoMoZZ4L8Tm3F0eeqbYQddq99YCDVFjKxbBsmKVGi6p4WH8k
 r59mdtzNqashjC1+7Q+/yPmWwWgRwtmVYShofDMx+sOszDT9Rhcv4aWkQaaShJwxEcx1fSzPIvB
 HNEPr2i9on36j+m1ihNrKUxLlEGVbvI70wrhu+EroatGNjdh+1EpcJKpbtB07gyP2VKInMX549o
 pFu7aLf4s6CGQvPlEqUDvk/zuUbLDm8Cu0XPVcd3HC27CvTjRFYz6v1jCRJ+oqyIReFjsBnUtOU
 dPBNtwQMrctcxJ7lK2RF4wbROPXumSzTFgof2afV57BJiiDBHLpLDx7r+2NfUEIUooYqhWOVZoc
 SK6JeDosVet2UM7y19ydiS2qeKR7JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:58:10AM +0530, Pankaj Patil wrote:
> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> Add device tree support for QUPv3 serial engine protocols on Glymur.
> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
> support of GPI DMA engines.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts |   43 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 3041 +++++++++++++++++++++++++++++--
>  2 files changed, 2936 insertions(+), 148 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index a1714ec8492961b211ec761f16b39245007533b8..4561c0b87b017cba0a1db8814123a070b37fd434 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -13,6 +13,49 @@ / {
>  
>  	aliases {
>  		serial0 = &uart21;
> +		serial1 = &uart14;
> +		i2c0 = &i2c16;
> +		i2c1 = &i2c17;
> +		i2c2 = &i2c18;
> +		i2c3 = &i2c19;
> +		i2c4 = &i2c20;
> +		i2c5 = &i2c22;
> +		i2c6 = &i2c23;
> +		i2c7 = &i2c8;
> +		i2c8 = &i2c9;
> +		i2c9 = &i2c10;
> +		i2c10 = &i2c11;
> +		i2c11 = &i2c12;
> +		i2c12 = &i2c13;
> +		i2c13 = &i2c15;
> +		i2c14 = &i2c0;
> +		i2c15 = &i2c1;
> +		i2c16 = &i2c2;
> +		i2c17 = &i2c3;
> +		i2c18 = &i2c4;
> +		i2c19 = &i2c5;
> +		i2c20 = &i2c6;
> +		spi0 = &spi16;
> +		spi1 = &spi17;
> +		spi2 = &spi18;
> +		spi3 = &spi19;
> +		spi4 = &spi20;
> +		spi5 = &spi22;
> +		spi6 = &spi23;
> +		spi7 = &spi8;
> +		spi8 = &spi9;
> +		spi9 = &spi10;
> +		spi10 = &spi11;
> +		spi11 = &spi12;
> +		spi12 = &spi13;
> +		spi13 = &spi15;
> +		spi14 = &spi0;
> +		spi15 = &spi1;
> +		spi16 = &spi2;
> +		spi17 = &spi3;
> +		spi18 = &spi4;
> +		spi19 = &spi5;
> +		spi20 = &spi6;

This is a very weird numbering. Could you please add a comment,
explaining it?

>  	};
>  
>  	chosen {
-- 
With best wishes
Dmitry

