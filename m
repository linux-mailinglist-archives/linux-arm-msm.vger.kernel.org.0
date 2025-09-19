Return-Path: <linux-arm-msm+bounces-74234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692CB8AC0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 19:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213D73B9AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DDC257852;
	Fri, 19 Sep 2025 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikQ4kj6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B80251793
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302685; cv=none; b=qej0/Vvs1n7KUtKoHYA5BPEivuyQCTnvjGt/BIWtB5GA+g30N257xg7fSwzJbgA5KwkalQro+HV+gBIktF04OIYwIlq0cEyCzzVEMlfLWLN80KkSMmZ6q+OQWscOiMxvoqSJ5/TufwqkFtNb2nl4GyzmMJ09+lv6m7nTKJExEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302685; c=relaxed/simple;
	bh=nUD7Mqxyf8HCKjbUfGSDdYOrI3tSww+l2id6UKdAl3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vztp2UUxL+j4ErpZ5+qWDjStXmd7+Ut6wTGE9adQfpCLKWDnqPkUxATLzLCR6/5L9SMLdO6J/935ua0QnuyNiYMNc6xqqZ3dUuvTTIUoe+JVwPi5raqXzE0sBPaOEXbjjGE+bvBLgzPV/bLjzxZQJgXgrxsDu0hmPyTgyOyMImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikQ4kj6h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JFANFe010750
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sfLD5wKH1cWrD5Py300UeP1w
	AIwntjYTUDEiAKCdHnY=; b=ikQ4kj6hkhoL0u2+k6v9AMXbWc3X8wz3SI+61fBU
	Pvu1zC6WvMpSOJo2iT1LaHTIY8tuc/9uUanb+6PsP86oPfo7HEjZ6L7wS3guFHEw
	cuXs1LMlFPRC4h1EMBEBqpsCDm1SStENYT3/OyUQvyPccfncqPEfkDUELxZP3V5j
	yB9XKsqLZdT0es6V7QQ5zymT9OgpAF7uzrej8kQtHdGKDd2UQFPKJD/nrrybDU/Z
	W7FSdGzMKWxN8P/5nfNDsvfwuRHfxzFfijjjyxR2EptuGd7HPPUvDNw5nRZLop3I
	IEDi0bFSvnlsMQ2hJ1RDWhpZJBRGJb00JsPw45flk9hJsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy36k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:24:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f818eea9so36679461cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 10:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758302682; x=1758907482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfLD5wKH1cWrD5Py300UeP1wAIwntjYTUDEiAKCdHnY=;
        b=YYtvRHYHGpU11AtuIO96xm/oD1R0DbdssCKFHr7cRgFAprOF6M9frySkw6RJ6OQ7+R
         yS56Yt/aG73M6fFOHqA48ViROxg9di9VsNVEL5lrNpWu/wPhvOEhQvKv+qIvgeamOaqd
         2Xw8+Ri/f6aujEp+jSW8Tc967eoNpWgqdM82rGVQqyMYBnFfBidWjUvVOxYqU/3EHph5
         diup7TpV7vGb71J0ucaHZWLTj/5twCOxEu3n/2/yMsxgwBM7dVbnVLdzcfXbV8wcF6yo
         ifhDQo9f5h8hMyParJJrSNw2TzFR0mkTPyGEJIopLQfhGpEYi4WuyN/xZ7XxduXkeP73
         1mtw==
X-Forwarded-Encrypted: i=1; AJvYcCXa37SxTKGLz5eqUubYPSdaAvvGKpF78UmDlz1MrGNWJKvq9xX1f+G4ATE4VjCSKaN+zXuf6apRlujUhLF0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9WvUotwol+p1sQthcpdsZmojJDQGehNUnEDZI4lMw6JgaHZnl
	SAXXWFlYibtGAEfzxakzP0X6QGPMyWIUZyQfRMWWbvMNy2o2Zlen8bxfNfd8uK6UidI08iRjaLp
	ANdJ+3ADVn/lWfzBdDNK+V4CCRh1pOUqpPVLeVz+yMHzpCyUd4oS2+dOxhjO4SysTyRVJ
X-Gm-Gg: ASbGncsqEz177uu+WN+lughm4KUyF/AfXT0YjDYwtDkiVQSxZLh7x7347pKExEGOtO/
	ckqi9RjDlzOtVMjyBnjBRbmPk4lyuXtKsg327pOVAP/6qRafoolzBDSEjA25qSKRe7cCttEkRM2
	5ti9qwuC8Sg3VX5aa9qVeEKG9okz3GoqzGP1YjXMe2D/3AphHD84KNR6Ul7hg8Oz1k+UWbGQB39
	iq1VBuh9aNXZFZEGttTWwe361nVBsGrjDZpBCUL7Aa4c5kS2rEZjNwHVGekIeyG53So2Sg3XcBJ
	tN00z/7rwZzgZF/iUeCsP3KFOfU2bZT3kLEbQ9b3Dz9HvyZwVYqtigjG7OVKxjw+V5/VzS8a0qK
	1CO+qfI5ZdOzaJaRZEQ6jT8Ap3odP56TOlFYN7MOUgxy15icFyKVz
X-Received: by 2002:a05:622a:424e:b0:4b5:f47b:d048 with SMTP id d75a77b69052e-4c0754a9b7dmr47724731cf.66.1758302681612;
        Fri, 19 Sep 2025 10:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRSDO8HWCdUU+fdlrfRlmaUavGLqtYvJYYt2DzT/Kh06TBTbg6GtLuCasKGawcjZNEMrfsng==
X-Received: by 2002:a05:622a:424e:b0:4b5:f47b:d048 with SMTP id d75a77b69052e-4c0754a9b7dmr47724351cf.66.1758302681218;
        Fri, 19 Sep 2025 10:24:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d52sm1505837e87.143.2025.09.19.10.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:24:40 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:24:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
Message-ID: <5gqbpc6ciivvp534hnymxhkaxd4dy4bkg4epamxp3t5fvacpya@k57bctjxm4gi>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-3-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm6350-mdss-reset-v1-3-48dcac917c73@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwJEMsKVzaBUx
 YjfdR/O3nKVSe1aj79fmct9hVjiuJeZ68Cw/pJMFSkLbTBS329J5Qt3DF1nJWHCU92Gl2K0MsyI
 CbeFhen39iHv/ZejQ9HXfAr2bI6laY3uRIhYjPFvKi1S45lCThRpPrzEgTziWT7G1MlFO0SrY0t
 c1gVTkIsiHPWni+ro+i8af+f6WeQtQgy7xh2QnaR7w589aTwNrSpB/xzsXR2QuBs13fKUzyqANA
 s9hY81BQ+UFtf44auh+BeadOe1tCNHU6ks2ilLRyl74HX045yNbJzWfih36cv1a5MmGzCacZdkw
 OzeT3lYlkRnYSsAQv2804lTzVy18CcnyenhPa6m4xoZASG3+WEoPOACa/988t2JIjVl5I9gIJ6e
 ceC1tUFp
X-Proofpoint-ORIG-GUID: EK5h5xHfZKGm0w2lhIFY5-v19ZixqBsI
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd91db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jUxBeYcaErFFHf2TeE8A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: EK5h5xHfZKGm0w2lhIFY5-v19ZixqBsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 11:57:25AM +0200, Luca Weiss wrote:
> Like on other platforms, if the OS does not support recovering the state
> left by the bootloader it needs access to MDSS_CORE, so that it can
> clear the MDSS configuration. Add a reference to the relevant reset.
> 
> This also fixes display init on Linux v6.17.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

