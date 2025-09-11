Return-Path: <linux-arm-msm+bounces-73132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEDAB53317
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38B0E188ECB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E007322DAC;
	Thu, 11 Sep 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMPIOm8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137B1322A33
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595771; cv=none; b=OXAmx7Rb+fZTtpQuBflT6a+InuRPJkQCRIf27qYEHCluewCLk7lW5kaskXOWwFpUrCKqPdspsqNfvsXR1BgTNN7iTWPzsVBS+PGj8x+fIR2HuPlpmGeKqHX9w+FUDkdQMTqfKHqN0897zaGZcer69hdDEJGSXd1M8muamS0Kd9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595771; c=relaxed/simple;
	bh=A/d9B+F1+seir7iNB0L7KE5Pg1ky59wbEws9IQYbYRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgtMe9AQakG4TM8qTaPlcZg2Ys0HtvOvNv7QfZKNeGud8iMJrMxulP1doiJaaAcI9X+kOcpINZ789ZcqBoizg/EzPFdQER62EdgFFnpV8p7BQM0S04axDKxaRiBf5TZ1meRCx2+YD2/wMMBh2jNDjWAFSBTYJ06vDdUql5f1AeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMPIOm8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB3OcZ002499
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WOjKakWSJUNAIQxWsQlAPujB
	r+5TdOe/svr2H2na+E4=; b=FMPIOm8Awg8n6eaKaddTiTh3sj+RnU56NbVJ87hz
	NIBlaXAAIkvKo9pYDptzD3yqHm8DJBEOs0yYNKTLay5mxJY9D0WOsxnodTlo5hxi
	xR7+vm5RPDaoguYR9ZBi46k05KFoOD5f7Kt7cy4tioE45QskcOYQGUOsCONy3s05
	Q+6/WBFo9eU21CNfir16Os/a0iGz9/VfLR84RQ8LzNCi6uFRrd1RgTU0NZTrZBsq
	d0EKUsDiVUyjUz4mnRvBJyfUsxUbwORJa1Hgd0DuyWS8IhyK1IvDRJIrbweDT/Vi
	aYnm6VKk+hH4kIspiUYJcvqCdZ7O+XlwNJRUS7v7Nuvlbw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8qrk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:02:48 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-621ab897e88so769516eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595767; x=1758200567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOjKakWSJUNAIQxWsQlAPujBr+5TdOe/svr2H2na+E4=;
        b=YrPxccwWTbFOBWY+DyRLYlR7rFLl8GvEZf4e3jQkVPpfRMyAUIo/Ip06EhuU2UngRU
         iSQTMzNuh7zrHBqsyziHZ2VebGjUxyq1wECVSSCMXamJB/D8x8E1iF6RQRt/8MOgoQ+l
         YuBIPIdcy+NyiC1eVf/s925INCNx1Ywwt98wQWDmEpaQr7ItZt91oVWYa7N6GMkefI2W
         WTJYZ8e7hyixKo5k5w2GYCI+4/RhU4CQbvPTrDmW7cH4f0R7sI7fiv+AOi196qjxOcUW
         eX5bTSvVr4kJ43xfnFww1/B7fmv9M3GzRlNvVa6mNnI16TjB5pNthKPp5S6g1YX8Bfi+
         8DiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5g5sbFF9H9TRSXqdT8/qG7UgHRdNPQ2DBe4m1Zc2SEJKItycgyl2IO6tSkMuUfFAYqytw3VLTtGucbbmJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlCTmrsM9A9GNDCO9YYWDP6pKpfY7Cw16nO1fGUjrS2JqTIz+
	UkA2B6slrBFOtk0ouDirkP2XkuCsupugQiKdp59Hu5hmJk2/vlbtSEOEinWejPHkgkYE/idQzLP
	oFN5zEUW93U//APgQpDCiZWIXkRvmVza45VouHDjiYvvCLz/tVsPItHL81+4kCu+gBUoZac8wKc
	7v
X-Gm-Gg: ASbGncsw1/1w+B6Zpkus+5WZhy/stwKdF+paaWW58DvoPcBDO96a9GSHEvJMiqIEhY/
	o2FwWYNfKCq0/ZFUTFLgfNO/7EcfPk0qvtdmAPO/k7jSfpZXInHbIQB6T95sm/6onYgi2OUUUhm
	/Y2kmmLS41hPWMRH8GU01a1quoeur/nXpPXg349wscxjdgzjhm4G0N7i8um5kUeu35s9DIuhSty
	UJLFf0I3c7RKGL7XxElDgAsWs/QbLMFPFcLjxIIdCplEY0PB5CXwdBE8i3bk2tQlV9o1351+PEb
	r4l9JzgWI6viwlRh2rIdDYW2p3zuC/hvgO4oZBguI0kgdR3yUhMT83ntyCQtLug9HHG6BKlE2YJ
	DWJHQbBzqNPwtzPmSmFXTXeXas60iFbVc3QvUIZEI3T8xWNRpw+j6
X-Received: by 2002:a05:6871:9f23:b0:329:8747:1653 with SMTP id 586e51a60fabf-32987569accmr6700531fac.49.1757595765359;
        Thu, 11 Sep 2025 06:02:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHllAsg+d3b0kcKub7S1vojdU22rC6Gpz9ONEV9J6SRbyOSxxcJp+ShDd6GhvzKBP0tyHSfqg==
X-Received: by 2002:a05:6871:9f23:b0:329:8747:1653 with SMTP id 586e51a60fabf-32987569accmr6700417fac.49.1757595764406;
        Thu, 11 Sep 2025 06:02:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5cf2f446sm425872e87.42.2025.09.11.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:02:42 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:02:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Message-ID: <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX/vA1kDU1mRqn
 USQv2Nlc/AiRCoqvZOeWfR6Bxi2qil24f/pig8kIptuIvhnLOryNWsviAJf6Y7ADXqSj+2zvpj1
 +bVvijnYTehbTnzURQdkQMUBtRb3lLrKsb8bYIcJTKBGs3Wfq6QcknsOKWyzmRudIgWAbf56A2G
 qMLt0Ofm3Nn6bNtTCMnjK9vdHRqQfR3JFJcND89j2XEsvF/NMEaVSaDOLbUOMxsFX4B8g9adaFk
 FiCCi0y5Ua6U/DUaEFhI/JUPIwjNal0IBSFduuHySPO1pF5phsr80ImDJ6W0tL6kpIyLoNsA68n
 NWUIEkK9RR5R/ApA4tuo1rN+s8xc9ZPvr+gicSGn0eBKQYtdwtfEFhmqa3aPLyxeM6e4Hi2MJxK
 iiKzs3nO
X-Proofpoint-ORIG-GUID: 0pleCelx75oFARlLcfHYDBQzWhX0MnLN
X-Proofpoint-GUID: 0pleCelx75oFARlLcfHYDBQzWhX0MnLN
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2c878 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=cOPp_-mWbVNMstl9cqoA:9 a=CjuIK1q_8ugA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Thu, Sep 11, 2025 at 03:28:47PM +0300, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump. Differences are mostly in the DPU IP blocks numbers and
> their base offsets.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (6):
>       dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
>       dt-bindings: display: msm: Document the Glymur Display Processing Unit
>       dt-bindings: display: msm: Document the Glymur DiplayPort controller
>       drm/msm/mdss: Add Glymur device configuration
>       drm/msm/dpu: Add support for Glymur
>       drm/msm/dp: Add support for Glymur
> 

This will not work without the UBWC config for this paltform. Please
include it into the next submission.

-- 
With best wishes
Dmitry

