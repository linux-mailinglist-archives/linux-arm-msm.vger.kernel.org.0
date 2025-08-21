Return-Path: <linux-arm-msm+bounces-70132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5D7B2F552
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F07DD1644E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549B12FABEC;
	Thu, 21 Aug 2025 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CivwUtCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20942FAC15
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772107; cv=none; b=Gg0Ii55sTlCgNKmYJW/0tHH5KiSPn1OnCgnvSrdfQJ4YbygN5XC7/+mZsKnVIOClQRSflxXA/hL2z4/3CoU8yUBLjrs2MlTACq9p8SpPAMsOCZ+r4Z22vx9EzF68F24HpchPVrbdgMVh/5ow43HO446Eb+Y1miEsdRjRCOftGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772107; c=relaxed/simple;
	bh=tfZPMqZtElzvCkRSGhlgoViognsyA3Qe60Shjgy56KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJmWxiUWKNg6vpce5uyUnFrnkoXGUWGtH8ShysohshCtbo0/27aZQ5W6c6WgoKMGMQFfmlRaCpskMHGcygZMP5CI1NjC3W6zALNSBwNfUhEEU3x1WP4LSOzVC5J/fd907dOreCpbpnjOMIqexdH2g3TLIREZZgrsAjUOvCUgMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CivwUtCh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bHYe012893
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bo/sYYeMVH8ubDzUgHDxT88A
	ZENWIvmqdh74NivXn0w=; b=CivwUtChF8i1DNVsez1ALO1+qJB3ve2S7jUeT5r0
	LmxxdTJx0OVqCVRcTyLKGsbXHvHx6R9XKyQSmuQ28t5VE+9cvH9k5FaBInfMjnX0
	JjIqEP5+hxHNuYO66Vh+J3/M7t2XWQVpobj7hYSEoPV5z8PS7/352vy5bEOJckEr
	j0Z41snS1EXDZREWJ4+PF5WR73VUhgppFNzy7yR90sS6M+wancgB6Z5trIm9FjT/
	FjYX0qLcKjBMgVO2gVZStG8Ub/DbnXz4MhGXYFm7nOLgnVGPqaUKqIqE2zV/Zqlz
	fMtLIqeVo/HOMKQlH/lIya/tBWp37D+snFXNoibYywITOw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8av2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:28:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a928da763so18410576d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772103; x=1756376903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo/sYYeMVH8ubDzUgHDxT88AZENWIvmqdh74NivXn0w=;
        b=gwmFLobPEliUMPLyoskQJgPiPEVhlnry3T0xzbLElEWvW4B72pE0rj1OwMJBL5rxqI
         rWllbKN+pLfwwWM87rSpH3ZHR901iv2Wc5BqpkqZ4i7gLC6/no5uBQQYle2dqMiJyzzH
         U1Pc145LCOd5OFLpHWgYt8fz+I+qgsDshfxIrEoC2w9BMCCmVSrNwKmqdSfFKXVA+j5c
         BYvwfkGvCm0oR4ZBFzMmiha26sCrK21s3AC1vxbNocvMS0EmQxaTz+d/mTo6h7UAdBYI
         fTlo9fXBdyTPgB8XiM38x7k51jCUJw/G8ttGqgL+jeg3ML0TeMXfPinhIcfc55AfqVAl
         nocA==
X-Forwarded-Encrypted: i=1; AJvYcCVCeInj3SQf7OFLNJjCRHZnc4J//QUupfSTbHsAPZoBqgED8Z7h+JZvJuF0bDYmNnlStFKN+N4CTMnp61Bs@vger.kernel.org
X-Gm-Message-State: AOJu0YypgM1lYSQTeEtV51fsILsQy5hE57wOvapv47zOgwgVBL8R+NcJ
	49Z4dfFJgILZJaalpwY7OrqWxWW5zCgBRD3DtqnYPSa9B5eDGqzD7PwRLbXzAdyPVaPKB5t1OVT
	4oZXBsoBMaoYIWMaJH7nWpRsOOKNYcMwouqO+q1Qj0rjVqYhod21hAdmoYroVSeVkzEhG
X-Gm-Gg: ASbGncvOtkX+0LysRtDl2unxVDZzPiE5Murq9IJAsH1HrwyheMYzs28kXthgNwPDZYL
	NKMm3dKpufZ4zlg9JxtOo2lChkH7Hs/HmT/+4YMrzv/4hr0TGVFHvI5p7+sO8ADAzD/LZhMw3US
	t+F9eM3ttBvR8pWpLxeYI9wsxXLpiS3bwCr283u+U9NeDUtVJ1bWZw164kO4klV+gwoGU80yeKe
	5FUO+85O2Ocxzl4XLVBfwoJy+g7ivYMsn5FT9A+G7qDP/re621OciNDmVd1CBobWG7Z2HlCahaj
	QiP0gJhfghXF3bDJ9yyjWK3RyGtrdO7EaFwXqpkrH+BhzUgzaspaP7FSvOYrWV+S6iRSSJTP0rT
	uZcL0O2/RmmkonOsD5SLpixCqF/QJeVfcVICE4wNstbpOgvEjKLUh
X-Received: by 2002:a05:6214:21c2:b0:709:31f8:fd96 with SMTP id 6a1803df08f44-70d88e96a7dmr16543846d6.20.1755772103361;
        Thu, 21 Aug 2025 03:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwYF+lZ1f8liHpI39C8YmGl+9DTxpGYR/3aTWLPUKxMN0WxZXjU48KYaq6jDvJjEnbHvlfEw==
X-Received: by 2002:a05:6214:21c2:b0:709:31f8:fd96 with SMTP id 6a1803df08f44-70d88e96a7dmr16543666d6.20.1755772102918;
        Thu, 21 Aug 2025 03:28:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc9c7sm3038380e87.71.2025.08.21.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:28:22 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:28:18 +0300
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
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX5Ts+gq3+dAd2
 Wn9InzoIJ1uHF22xb/aVeSR20kmTsiu09q199wuWLfUsNEFCFXspSgd0ZLs1SP7ZQfydtJNkXvK
 KS213UAsv9tZWnSxvjE0QdLdSuZBA/+9z/5lp2eaTYlXejuxguEtRvFNjfvlKELYBPRz4Qnd0uh
 vTfj/SVSloa2DH5CbVmgJ12xfD4nmXe32F9m2nrBs4MN3Las6cSc8qM1EvnHE2Gm4EfpG4uF6TV
 cXJwym7oCvEfe6P+3X+DDVGyey/nG3xYpNoVhmF6F1TAg2nYBzCOGPNwq0d2p2YOQaUVAr5Li74
 iAeqFM6mMW/1G4Y6Y2Rm1tobSlxV9/EZYnPBu8AW/0/Vi9NXbg2sI2QgWoGkLNjmo6OkBTUIFP3
 86LgdxGf/20GoAzT3lVajxCTFvaJQw==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a6f4c8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=WnZbLXWYNgm-BG77tk8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: cUPG5oJBweUKWA8OgqWqMUXa7WEkpie9
X-Proofpoint-ORIG-GUID: cUPG5oJBweUKWA8OgqWqMUXa7WEkpie9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. It requires new compatible string
> because QCS8300 controller supports 4 MST streams. And 4 MST streams
> support will be enabled as part of MST feature support. Currently, using
> SM8650 data structure to enable SST on QCS8300 in the driver.

Bindings describe the hardware. There is no point in discussing the
driver here.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -179,6 +180,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> @@ -217,8 +219,9 @@ allOf:
>            compatible:
>              contains:
>                enum:
> -                # some of SA8775P DP controllers support 4 streams MST,
> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>                  # others just 2 streams MST

QCS8300 has only one DP. As such, it doesn't belong to this clause.

> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>        then:
>          properties:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

