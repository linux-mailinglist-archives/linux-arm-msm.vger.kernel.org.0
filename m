Return-Path: <linux-arm-msm+bounces-69685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B6B2BB4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAFA21887980
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913C23112B2;
	Tue, 19 Aug 2025 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxHxocTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08665222575
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755590378; cv=none; b=Fypk8lu89p7QCfwIIYIH5/KRETlf60rMklS1aB7vqLl34ukKSNGwRtVk45s1H2858Z18zNXN4O0YevhtEqUbucXdsP8GeMNeohFeTv7uEivKmKFukONOasI1klV2rOs4HZM1FM9L+R2vl5iFLHZP6y+BAJPJ3u8FUlNWu/yC2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755590378; c=relaxed/simple;
	bh=TmIqGmZD3H9vgCSTYIgWGkAwUVmyYjcneDo8YIQjEzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVxnGgckx3cgbonPekFPbf1bQWmJplEw1D/CiMGaoURyNArvDazkkfAt6/S2x3RuqSgOo4K4nYuateOhdV1sDRQl8TVxU+tza0HFN/djACTuwyxEt96lL32yG6GpCghSOVv4D70Gj+w/P50kQb9VKyS7XZJIhwj0lqC4Bjps++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxHxocTu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J1X1qK023680
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3vU6X6UmptKEeubZXKONa3UV
	WPBKyO0rvUIh820/nkI=; b=AxHxocTuLdMKi6qPApw02H8p2uKc9/gCfFXp6JIk
	Wxrg9EWZNdMQHKdQ/GGv2JYKe7qTS8dWUR+Rtq93OIlUSzsxpfRzW3p3XtVepfcX
	JpVfAr7f4hw1dJaVE0fuIuL6Na32UrtXQ1xJPFyzQomZHGJ2ialZ88e659HAadkN
	LPlO8t4dh/z0HIlDM/3GgStv0OZoihhuG0ZlG/jvLX0V4dDByjjU2F15jWqb5D7h
	P/JPGcAxltYQo8Y1D+X47NJx3vaEa7Ij643UlrkqccUo0l/EoJ/d1n//w26XENCm
	PF0mlMyRL+L94jXit2BEne4DdAtI+3tEKqM9ks2bk3fpAg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99qn3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:59:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f55eb56so116951576d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 00:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755590375; x=1756195175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vU6X6UmptKEeubZXKONa3UVWPBKyO0rvUIh820/nkI=;
        b=AE5Iwhra1jC3DaoaOZoEAZSviKQojkPEMXWxmU8toSxbX6KlwOHT/3Pgy1znOzb3AG
         R3zZNlQV7hgXrGDNoeKNGZcsMHY5lO0oNjYU8iaNksaMsEOqeWlkAvrZ7GHJqB0jaxmy
         nqQss0mKMJtjrPY/WxlVOU4cHNc7Ejf6/MfX8GEKL60YvZKvaibE8KnOcy5OqpS/wX6A
         B6NMUJcMU01Uc5cjx0/2TOCyq7Ue4P5h5bYmXaMsDcyFRANNVPkcIGGoRqN30ShZTPKx
         Uoan59npuMwxsnL7so2jccTM22cIAA3CXurNKcH63EnPcebV+DQL4m/q0l7svS26T4Zk
         YmRg==
X-Forwarded-Encrypted: i=1; AJvYcCUKGEqjp1zK3htV+cKRQ2U8d9jT/a4WZQfdhWTkfzeeTff2JQHmiXHkXx/jSVL/mtPFT1hkzDg1PwMDmpZp@vger.kernel.org
X-Gm-Message-State: AOJu0YwYw6gdNTufwnARRNag19snMjd+Yul5mt9NPABLEzc7SHTfidA4
	cHUNXuWC6remY6F6ui3JRVOzhxQC736JKRqCOqLpXrPuBoKLd0hm+tzFlrnTrx20ZjudPgqTXbY
	NUqMeXJ1Dz6gXPEYpb3SfmIVlIe0XZGTn8A9cE6pmJGTFnVwn+BHHEz7xTqiaS+2RHOQB
X-Gm-Gg: ASbGnctmNEOJJWZhYezwIuai1wmSFzF/vcQeOfDmUxG8xkJsTGRyG2ZifN6kqx0eanw
	y4R3GBeYzfagHHX1f37v/jeSXCGWqd7A/iwC4aNalgWvr9WApYVklgeWTdNAx/uoiQ9cnjAwXyS
	+MoEydu7NZFdtNg+Jbraxi8UinZ8CVk0Jk8Lp/RtRaFIm835PoL+80Ep6m9j9MhW3t68IQzrvSM
	2/rNE2ayl6PmDqGkdx0aKtAJlkFsv/BLJ2ZUUHtch2DPoRsqDjkRuauKqnLrVG5ZRMRjNtqRVmo
	VPtbPNkEdjPpUDKizgvMn/JJzU+FRFrh4wSm6aeHsFNJqB2wufsNquNVXgYxTEzdQWNq5t2DfK8
	GKyB6P8KUt4QY/wFT+so/NuXwg2uZzWBUR/2CrmZEfqWtQKGyEm7O
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id 6a1803df08f44-70c35c1f06amr21420456d6.45.1755590374874;
        Tue, 19 Aug 2025 00:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiMVGZQHvFNLcaq5/1TlbULCLv9YgylRXF8bOeajYtu4DRaeBUMTeUknrqEQR/YcjE19k0Pg==
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id 6a1803df08f44-70c35c1f06amr21420206d6.45.1755590374394;
        Tue, 19 Aug 2025 00:59:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3932sm1968059e87.109.2025.08.19.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:59:33 -0700 (PDT)
Date: Tue, 19 Aug 2025 10:59:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <brculyyu3dgc5nkj2cuzv3jkjzcouljy5o4jwr6mw33r6i7gt7@j6ur7yvwmky5>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TCdyGrRBdXw7XuOXSeDfoXtWODvbOWj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX0UaK2h7xngJN
 rFGvpYQ7CwX+RjwwqA7yQIR0V+FP9WagOQhbMeXm9bCTkt5wV1rhvYyXOcqjSWBcf2ChCWu0072
 lOrldBgt8LpF9HXYg7YoEn1kjmSNrnx/7QsTy8+bW4n1s8y/18gcgm/c9mkChEwTHRj5XZHk8+U
 r2RvJIbBYxo/4ExB0ykndlbuzuq5UpyJRxQ/hGs8aGCq711IZuGuVcG+b4oCU7Eyk8Hy7XCAv4c
 /CukACiqCsQuReOYlnOyg+z8p4WeQ9tRduHrh4n+ZUJ7I3P7nyWBLF0N9Yi7gDZqjjohkW8SW8t
 Mg+b0ciDt/qlZ7ouRUaA6vURRcVFcuJhpu/O+UXCO4tWUlzSAn2iYK0AyaBziljSRkKk5n/xX/C
 3SqVBZQV
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a42ee8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Yr_zk0diUUozgDP3y_gA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: TCdyGrRBdXw7XuOXSeDfoXtWODvbOWj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

On Tue, Aug 19, 2025 at 11:33:33AM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.

Hmm, no, you are not using SM8650 as a fallback. You are using the data
structure for SM8650 for QCS8300. That's a different thing. It would
have been using SM8650 as fallback, if you had declared device with two
compatibles, qcom,qcs8300-dp and qcom,sm8650-dp, and then relied on the
second entry (only) to provide a match and data.

Exactly the same comment applies to the UBWC patch.

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>  };
>  
>  static const struct of_device_id msm_dp_dt_match[] = {
> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
>  	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>  	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

