Return-Path: <linux-arm-msm+bounces-74887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69382B9D36F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92293189D905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE39B2DECD6;
	Thu, 25 Sep 2025 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJsc3Gel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42611713
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767928; cv=none; b=Uu0m2IqV0JzZBPgUjT65jgIYcAQgVjHZoYrrhRJaRHEWiAghAX5/HdYjlNgDgrHKvONdeApB7i2LYfWs7LqndPsFb2hbCz7SWr4ZAuGUALaYFBNaOfiJmFRws6xPPFbYm2xdA8G8lnVvcFbHsF2HFBgLZe3or3Vq1ncDvL5JqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767928; c=relaxed/simple;
	bh=XJUYhg0VFEFsFldPgT7FY7B/fRd3lwXDjvW6ijcWA2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uB58aQqg1cbLIJvHd9u629+cJOkHNK5Jw6NH+M5ruOC7gJPNJSWSp1NHmMx3LN6SZ9+jIHiS0smNOH2GXFP+KVll5rMQQPYwLA/ItarfWz2dErA4jsJ9+sBjDQPZ4PgQybq0Kx6yXMc12LelYFMKlCcqQEnZMyH9/NSgrGxiNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJsc3Gel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0kiQX002114
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dBE8wCPmuYIKAvATllBrBFt
	XuoveB9RJyGGd22KLBI=; b=gJsc3GelbCCaxk56G1ZmWDeZOuARJATTmewX1iCN
	WySsOwM7j+mT46n7E2K7aGftaSd6Ry/38Rs0mpxmcY+JCQ47MB3g0/8FO9CIT01K
	4QSE0SvoknYR5ONMZ6JFVkxuTrQP7e1zH5Pd9vd2A9+Uknce+y+ODjhvNfQ0SqQC
	b+YkDZZBYQLiTsin5XWQxoZsU1bakv9hqwAziiBnZ6/JDuOw7liU+zWg31sbUmKX
	SVx7wLoSxK/LvIyQTimO/jtM4tvy0p4tM9wyVl7mzvcfdULxCEwzCrQdHN95LK2r
	IR2VtiHRrp8wXU/0xiv09jauuDdyCMiGEtNKRjpktpoDqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pfjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:38:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d9ec6e592bso10114391cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767925; x=1759372725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dBE8wCPmuYIKAvATllBrBFtXuoveB9RJyGGd22KLBI=;
        b=J4m5SZoLHevOLS42Uv6OUt73VzUKus64RC5TfL1zDAtcqqATILfBsQgheu3fMVxUMo
         C8WTn1M7pH2FpRQ+6OEjTI6kFsrIlL7TN/uxT1LXthBtiydYFfCuyV2kU+KWPCpj7sI2
         rAn/1xsGzIJJ0GWhVu63NWqbtuthUW71oAT9BL3zXyf0FVyRZItSrOtSeNJLgm4RtT5s
         UgPsGWy0GtdzmVhHftznIiiakE/sNdi7x83HTY+0BNqkppGKPg3XoWrf8cXpQJ5xu33j
         peQMXt4SrXDy3Ji/ji4zV584t5B2QC+IB2FNFl04KCNQiNIWxiPfRsqVL5ccqOAzXWSe
         m5HA==
X-Forwarded-Encrypted: i=1; AJvYcCVxIHx4Kq0IZjla9nMdfGzALlTRxouRBPNVtdFYxVQ+SRALZZWODOjGDVZjqz/3t+Jbwbx+s8bZRGS4xUbv@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnUK2ee8dt+fB0XwLCvVYBxHAj41H2ZFwExLeE0wBMna1lTg0
	FfqIKABXWK1XH8NnbznaD+f7xQgdz2Q7X9C652pjqvf1vDm2BnKCfr3WI3TMYUeuZRXrThYy+Bu
	azC1PeIJuXcdjrOw4N07s+ILVDIwnA8NE7Y/nxtc6pNmIcK9ZQ1ny6Mr+KUqbGdnrIA3f
X-Gm-Gg: ASbGncsO+2GNe7Lo+XRmI3Pq3tpKEgQY8Qnqw/IG5HIkJsBjn15hzgov9T8Md3xt8vX
	Q07LMnoamzUBEy7Y/OjGU1RS/xRCL2dZSPkt/f9v9PoNdSeN6V5CW6GxvtuCYsQXM4tm0ivttv5
	nll9L6xJ1zNF6qTQrsbh5uysuVFDpzzifdd4JGjQh7ovBO4acZTD3NgBhX3zr3ZCFuQCmP6pMSY
	ec5mqRqFuPsEyy29eVG8lQxnywom4HDNN+FwcS0hoDnoqhOvl4ai7HV00kt5Zsgg4YxHHcftitk
	riLR685caxO4r5lk0/SQSJkZ5e6eOxz2E+ZF0kcSexI8yOwiiDtMHUxPo8/zYVSjWBZUJHJMH9a
	b39oBLuprEzxK5Xjx8Q40vWYu0enk8BYh1lEg4tcvgTdC8g/Bc/8f
X-Received: by 2002:a05:622a:13d3:b0:4d8:d502:7469 with SMTP id d75a77b69052e-4da4cd4c801mr27417461cf.75.1758767924750;
        Wed, 24 Sep 2025 19:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzAX+Bo3ArcJumD4HPQ/3vJQ49cheZkg9XDmwTcQRShTjOBjhcFEYQXZyYcD5dNdPNkm6f7w==
X-Received: by 2002:a05:622a:13d3:b0:4d8:d502:7469 with SMTP id d75a77b69052e-4da4cd4c801mr27417231cf.75.1758767924318;
        Wed, 24 Sep 2025 19:38:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e38aeesm2096901fa.18.2025.09.24.19.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:38:42 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:38:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 0/2] Add Qualcomm SM8850 socinfo
Message-ID: <ebxbhaaefuoemadcef5h4lxfw2k2hwkfe72aubctqb3tk2zdmp@p7ck45rd2hy7>
References: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
X-Proofpoint-GUID: 0yyU8eJQgLt6uqY9ZNgupAfTuQNQrCaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXysubpMOkbFU0
 lZtrcDZmyQiLDiJqZiIFCk+eXbxERkkLSaQQP8KxQeb8n0koKVCOgfO1nZubTR/2RzjruXWHAhp
 2uCgb9zZTysoXh3MiCzcZ+X9lEYtBPxFwuxt60YNCiVr3BOjb46SpFeCjgaVIkjHvKhmh6J2H8y
 hLw3WSXFWS6oh9mh0BRJjzaGsbauY2HXY7davXSrDuarira97FNsEg/Ua/VUC/WlRNdYtCwV9QJ
 ACWibiNczk9dj1AvFHqhdAYFX1G6UkeJRuLkW/cDeb/aB45l5S8WBJ1Lxs4OWqKU5Ow4acY5RpX
 RmduM01CNEYb+UOWDamxLO2caEZtpXjFwelk0q4fc1eP80YmqjZOJtQvfMaUbAnCbTD6y+gpOay
 aqDIgVL9
X-Proofpoint-ORIG-GUID: 0yyU8eJQgLt6uqY9ZNgupAfTuQNQrCaw
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4ab35 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MSJ7r52RwriqJIIK1REA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Wed, Sep 24, 2025 at 04:17:45PM -0700, Jingyi Wang wrote:
> Add socinfo for Qualcomm SM8850 SoC.

What is SM8850?

> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Jingyi Wang (2):
>       dt-bindings: arm: qcom,ids: add SoC ID for SM8850
>       soc: qcom: socinfo: add SM8850 SoC ID
> 
>  drivers/soc/qcom/socinfo.c         | 1 +
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  2 files changed, 2 insertions(+)
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250917-knp-socid-f96f14a9640d
> 
> Best regards,
> -- 
> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

