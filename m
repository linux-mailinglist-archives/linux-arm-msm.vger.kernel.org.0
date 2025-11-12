Return-Path: <linux-arm-msm+bounces-81457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582DC5317D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1CA76213F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B9434253C;
	Wed, 12 Nov 2025 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmgGa4JJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7+cjIY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97BE34253B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959771; cv=none; b=hHMG5gjY7q3dd41e6yP9Z70Hn1nKRpmBtP1zNRCaof2aYXts83ir0uSkfSs9dGM/Rhb0D5nL5oqOQI3LZbzd+IRQKT0x09BevSs6AxFLS2Xs2mycIIR2LUs1pnh4zfSwjCf7C0oENOPuTdQzEFWbd49YfYf7Fxxe56xhlihpzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959771; c=relaxed/simple;
	bh=iD4qsnKznEoOb28KGZ84ux57r68RZ32XkXTT4u90lM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVYKkN/DmdoPo59GXJJ0X1UZamCUl1+y0EvAmv7oVhzHxY9FVqw9tfv2XisFtgaDrObf3xEZzPogyebTsNZI++B8r0wsEX+oo2ln5oVYGWPSNbsfUDC4Y0X6+ihMblKA7mwc4CcyhoaiIduZJXbR9DWCCOAEZMLa6YbYJDyeb1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmgGa4JJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7+cjIY8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACEJAbj1382326
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9rRTmxPmVpuHkJ2g/EvFY5Hn
	zt6+vzvauOfhyJ8/hJU=; b=DmgGa4JJWIGDnZ46LPY3gqsLs2QAAzxbY9dixRM6
	KhiJp0ND027Y62a8UoqPWaFEjGM5Me4ptwDlvoZI0WHTREXDhNzCfkBQcE0zw3nP
	17e1UufPzbepL4EpBB/ysTOnH6npHhcSJAVTyfdI8ghlDOY/L2jYUnbjR43YFZtX
	LJEIDYSzUduSqYlbB5wAL9zaPuMi4xCTUXuZ1ZyS2uFY5lNBa19XwjDLmH5BGiEp
	R7PJgLKMdkXzqmzmHv/NioNw/Wz/P9QKSGPQ3JFd27LQ86F425zYsXRoR05zE0yb
	RQfMJgSjydrBBiBWtEhdgxdAVB/hiThMnbcyaL+P28cdzQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw484b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dfae179bso22371605ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762959768; x=1763564568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rRTmxPmVpuHkJ2g/EvFY5Hnzt6+vzvauOfhyJ8/hJU=;
        b=F7+cjIY8dIaSjF51QmhmedgISsF/g325q/A60CThAmwlpi4+KAfUn4SXsfi6IaNddY
         2gqxo53lKk5HbG7ECGPJUYYBQ8X3LZF2kmZhmY+6HNe5hTBBQByj+cx2fVGxZtYzVY20
         BH1b1XXqdOiWd1ZB3QZSYOAM+4/a/hpZ5++KEaR6e9OdxzmKqHKs8UMO0Bi1T+63oflp
         BRE6llS7V87fR6ozeQfJkJu/KFeYMU2Baq2jqGj7HKmZw1oXWofz8IWxbyJk7RoUujG8
         FU6hq+qhB5q+hfjt3xhZNbfarVDB3jitqc7V3ErbsZSi9Me2aYiN3eGXMPiQnnb7hNRt
         0OyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959768; x=1763564568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rRTmxPmVpuHkJ2g/EvFY5Hnzt6+vzvauOfhyJ8/hJU=;
        b=lrl7+ZRYxTDrFuaWmaepVFC+cZYxXBZMD1ClTHQplizom+UygiyNv4KHNcNvTXa/yb
         DVt/tOg6icPlRhDhdW5ccijTeNp7rzF9HzSMdkuapmw8ZjmilpW+UGU2e/wcNRo5btgG
         nsiDOqCWUxuKTeWzNYPD8aRuqjDtfz3H1X7FGcDPrtFNHUaFVmk2TDkU0bL50RAwmrmO
         RAkAqN/+FsinePMYsmq6lIS34IUhgYiW5KHX6k8PZ2O4Cwz/xKHBEV56VAPMEnUzzpff
         VicmNbGsLvg82D3gV0jT7SKEkg58G9C/0AaaXnZfMa6DHEF2IL80ZMOiodtjl3/4LSfa
         4rHw==
X-Forwarded-Encrypted: i=1; AJvYcCWWwpOVj4RJM+Y5veXkIxUPyAE5WV2hlW9woqpPZWdrZmaPOCefqGjOdplf1HRuCYD1a5sAPcHOHlkGrQHv@vger.kernel.org
X-Gm-Message-State: AOJu0YyOyC28ghUlzy/dwlMyRntKtRkSrp3KL1hShrC5GIf3C0fBnoEq
	lYGDRdg2gQrjVtg+qjher6Ew5ITHNlv/fCk1OmvOZGVMEekpALuOuAFSoz24oN9k+LIW39uryIc
	XJar0vypHk8pO9vbZybS6UqALThCpCByToO6X4P6FlUR+SrdnnYkSPE+XvPGSDLvT4ltR
X-Gm-Gg: ASbGncu3tRN2YNEkyViturXl5guZmAxG6FvkCXa151u3nu8jdMPqgUp1Niv5zkoHAsE
	5eov4B0TEmZ2IPlb0+CQvpPQOVyphBQavSzL9v6oO+lj8O5dTG9xE3zaCd+xBWpKFnkq+mcnmyH
	KIOOc1pUf2Xlglq3dFPDEB27O4XIpjcurwxw9ogr09z0Nx9EMAXa0TxPgG1aL54P6QzH2MQ0PZt
	ZXP5CO8MeXp0nEeBOMKAvr1LP4kLuMFbQH85jTwmrgzssAnic/N8dT8lWN0kOlaT45J4XF1XPV9
	+fEOwBn4XYQU+hwrD++2QbG9gGbtQzzciOoADo7UxF70ewL6Yw7+ebAJXa7CuKGXW85R0okOezi
	FhxwXcbWFywcRGPCQlEsrNYMiK7oiZvDgsc1td8h1bNRNV69wA4jmC8+aEZgwWRJt/wG+n9vWRq
	102DwTAvP5fQc8
X-Received: by 2002:a17:902:fc8f:b0:297:f2d6:17b2 with SMTP id d9443c01a7336-2984edc8fe0mr41003025ad.40.1762959767940;
        Wed, 12 Nov 2025 07:02:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG52Cu/IxlVXdEs1d7W8EbJc1ChZaCVEpT5U7zLUcnX+dRF/CdNr77aqvhMxDvsYHGz3fMfJA==
X-Received: by 2002:a17:902:fc8f:b0:297:f2d6:17b2 with SMTP id d9443c01a7336-2984edc8fe0mr41001495ad.40.1762959766459;
        Wed, 12 Nov 2025 07:02:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594518375f1sm5692754e87.76.2025.11.12.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:02:44 -0800 (PST)
Date: Wed, 12 Nov 2025 17:02:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: configs: Update defconfig for DSI-LVDS bridge
 support
Message-ID: <jgjhjgjchajp5lyn5wgnykqbrhecakywwumy3lsyqybsijuiqx@ridtnd3irslb>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
 <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-2-6eab844ec3ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-2-6eab844ec3ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: b5GIWaKf20I_BMnpCEGEE7Ush4upgTTa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMiBTYWx0ZWRfXzyphoGmg/Ckz
 x4QUn/xLrFHBiZZI68vcbC+0kdXqKv3TK3MN8C3TthgidbYpIBx3uF+ynjKHOhV1EE3yxuiNYHj
 kiIQxlPwiS/jRVH9B1wGtsi3Gles6yJAY6Z5dqCKRM/7qo6s/gg1C3rpnTxz80a6YpxfO25Vxr4
 fvXFTFovIsCnHOOWlXOr8yN9bE5BMLSjoB0xEPbwoAd7CiHf2GJIsXwwJM2M/HdFyohsYNSrxXg
 QAPSvORMEDrfwr7CRuAYCi7PIxH08SHzN+b6voRAJgWVH+KCeegekViWE9St+w8+uFiCHiEtWbc
 Z8h/ChZDMe0ngmLMJ+98rzLs6nGABSWEyBmS5U0wreVUb8sknM2kdqfSXNgVpoe+hJxAyOSXZ+5
 hOcgmOsgyYOsK+Wp15JUg0b0VD7/Rg==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6914a198 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4RWRdER6p9Cvvg2m5vIA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: b5GIWaKf20I_BMnpCEGEE7Ush4upgTTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120122

On Wed, Nov 12, 2025 at 08:18:12PM +0530, Gopi Botlagunta wrote:
> Enable LT9211c bridge driver.

Why?

> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 00d15233a72b..1d35af618159 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -959,6 +959,7 @@ CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
>  CONFIG_DRM_LONTIUM_LT8912B=m
> +CONFIG_DRM_LONTIUM_LT9211C=m
>  CONFIG_DRM_LONTIUM_LT9611=m
>  CONFIG_DRM_LONTIUM_LT9611UXC=m
>  CONFIG_DRM_ITE_IT66121=m
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

