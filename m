Return-Path: <linux-arm-msm+bounces-73305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A399FB54A0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58015585041
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD602EA73B;
	Fri, 12 Sep 2025 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWrtb5M8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1C819992C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673584; cv=none; b=S2kMCnsce7gFLlchSHjrzuk1EJ6CQJy10zpGGMXFWPFzj0qNpftHsS1zrXafO9F2M1jMsuNArOxqA7m11AxHR1EPKaDJxnof8SaFFQSUPBMvjGS8zQneWn51C+rH+w3PUpqOdHPYZ9sjXb3kVyoB4oGXErPAM6ZMwKo//fjDHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673584; c=relaxed/simple;
	bh=EPRqwnvVq7RFG6+168lPn3q1JyblPKu+9pU2ZTAP/d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCZUGMC6ghmCveJQu/C0TOkFQq/g5/0uXnSgomlPnlyWJ42Cs2ZITRUWlMZIQN63pFTQkaq1VTGA1VySIgGvm1dt27g1rNIv3cvZ6NMfYTiBSepEeTNGLVeEdH7dJBek7EZbG2QUgktFUvEcVR+kjN6IMFInj/UUhC8VxgfPTDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWrtb5M8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fCDm017410
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JZO37LOsBsf5QkQB3SdvehHO
	fE6O/aUfSqad1UHXEXY=; b=CWrtb5M8zWyJSZV0/SCddrssbyxp3WZ1WDxot9Vg
	96inzXhFYQOhvwakMdUZGf4q+RGMpVo7jrokQVN28Bd6Pj4++FlJOsPI/v6TIjYt
	y3VcRTNY/d+4FI8e/A0duerWbuBDAluaxBSNPVUTmSnoTFbcYkR0gX77Hig1Busq
	uEbHxm6i+l6yaBF38szdLXWwaBMKXxZDVslxqxwHRzVNzSFCpC/EluaZdWFETvcy
	R2yW+EYjq1d3sphNTXfe8e7Dyz8KGVc/W61OCSHI6h22VdHTifat51MXBQ8bJfJ+
	hNtxjJj5WrImWUPVWIrPcnogCkToZa/z9hLDmuLUy36HHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8u97b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:39:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso54867761cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673581; x=1758278381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZO37LOsBsf5QkQB3SdvehHOfE6O/aUfSqad1UHXEXY=;
        b=HJ3TYwJE7WCD6CTB75j3eVAUP5W2a2X6tZYtdOv8RdyKobBWXk2j7BYYRFY9I+mTt9
         mB53dz61RRH25Xz+oTkA+cy8GbVQdkAbk/JrWW7N6pxh3Scj00mIMN02y5zzH8NZ2Mkf
         GhKjhT/667LfVf0pK1nv5cmIydZaFYTk+6JVIK38Z+Ia3tBfDX6mKs4kd9kejBGBcfpo
         HN1qftX9BlwSKD0A0kkIUtuTZw6FNrYwrPZW96VCpVfYPm53gu/Mr+2BGwFoqqGjPwGA
         QXwFF1b4Ms/OoPVARZRNxdcE6vhkjN25eputy+blBlenLkdXgExE7ce/uq38oTLox/jC
         B8SA==
X-Forwarded-Encrypted: i=1; AJvYcCXw+WrTX1BpSDRLOnn9eGN3hn0p1KffRQFEfXfA1HT63VE+jch4WD2I0S+bHOZutRQcINwLmPd1/JdKzJNY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+tJDIaTvzowgEGLMCL2GKZEUpGhFKdjwBZNTarkGkfi0hMbbc
	ehHuoGY2ZNibSEgDA87AcNUb4HrvpiCcOqBVVtAG1SWTkiAxkbdGVz+ApE+NMdmq+/w6jCdjBL8
	dtvJncQVQ5Y/xAOe9tUzb0CyYVIexJaZE31NFEPO/p45e3QrJy/MOgB7Gxp6u6qH++573
X-Gm-Gg: ASbGncsidtFjZt6sa68KycAhqgn2vrPqRY0492MHGxQ1x7z3AI3eFqzH4RB8oas4EVA
	4rVepB6jpL5Z68XgGcr2i6yA63Ik5Icf636iHlC4GLEIeEChwW3ZSqB40r+0SsJpRVP1k3YmR29
	r8j0GiLxFEXiNisUTV1ixKwwGyLJIL6nGY5wbw4MnWjLZV1sAjrd+cLX69bD9Cu/7YQbOSN1T/w
	jXNRVw6oH8MhVCySCm2hDvRr6q+B48AX6bOVaRoC3ZrJ5sQjc8SYPe0LOT4oYUtLTQ0nA35WOap
	APz5hxHdpLEqFA3alNyVqa0pESw5pYkcgZr5ENtPGIroskV4HJ9aqr+Zr8JCdrPnq7oxhzl6Lnp
	kSHyWlkEOhdpiCFbOhx8rBUwip5mpt99gyzzTbH7q8GWE8kM5gV8j
X-Received: by 2002:a05:622a:590c:b0:4b3:4fa9:4cd2 with SMTP id d75a77b69052e-4b77cca8d4emr39186011cf.33.1757673581461;
        Fri, 12 Sep 2025 03:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElx+sIo2TyNNDSZKhdIXfRdT6OrkK5agLSxJeNhZFAzJExqCsm6/N6pZpW9c9ZnhxyWSL7dw==
X-Received: by 2002:a05:622a:590c:b0:4b3:4fa9:4cd2 with SMTP id d75a77b69052e-4b77cca8d4emr39185691cf.33.1757673581028;
        Fri, 12 Sep 2025 03:39:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e646135b0sm1042248e87.110.2025.09.12.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:39:40 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:39:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 12/13] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
Message-ID: <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX54Cgbts70m9j
 DKrj5AK3bIWd6C8z8TSScZBXnA6r9uUElU5YgXOkY5EnK/xXx+xj4OriqrsUoXiIRLwqA3wxNFf
 mnHcq0hNa9FwPerNMxWvceTl1z9uPPdZr8ccPeU74lS7wIBN5nZ/6VDcdtaLL8xi8tY2gy4TgRb
 ZRugjX7exusJm4bYc+k7M6qB6uIDUU4NI856uQxnuKUTBMmZrKxJm/FhVf8cW1tmVoxmlFE4hMT
 HjCojos1mvHDH2a71Km22DvNuZrzMloqKX4LlG9m6qGYOeFkrU4AUA6Tvvj/3bplNtOJWQLrQ9U
 PpgVJ0CeAOEz+X48uHm0pHgC3tow7SLVQWqA/9cB8zCZy9g0lksa7C5qzvajD1JBrEGFF1wlhQq
 1hXPgdgc
X-Proofpoint-ORIG-GUID: ePHM2YvOcafT1YQtWkpp1yNw9eoHpWu3
X-Proofpoint-GUID: ePHM2YvOcafT1YQtWkpp1yNw9eoHpWu3
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3f86e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qgWfkWmIk_iXozLJbygA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Thu, Sep 11, 2025 at 10:55:09PM +0800, Xiangxu Yin wrote:
> Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
> their parsing from dp_panel to dp_link for better separation of concerns.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

I thought that you've split all DP patches...

> ---
>  drivers/gpu/drm/msm/dp/dp_link.c  | 63 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>  4 files changed, 76 insertions(+), 72 deletions(-)
> 
> @@ -1225,9 +1283,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
>  		return ERR_PTR(-ENOMEM);
>  
>  	link->aux   = aux;
> +	link->dev   = dev;

It is only used during parsing of DT data. There is no need to store it
inside the struct.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  	mutex_init(&link->psm_mutex);
>  	msm_dp_link = &link->msm_dp_link;
>  
> +	ret = msm_dp_link_parse_dt(msm_dp_link);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return msm_dp_link;
>  }

-- 
With best wishes
Dmitry

