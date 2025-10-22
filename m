Return-Path: <linux-arm-msm+bounces-78352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC41BFCCE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D70660229
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242D5322A2E;
	Wed, 22 Oct 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAMgLndq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFA347FC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145666; cv=none; b=tCl947xhwmVWUTsdDpZ/I7FkbcEFYgCJ9vJx+gU0QoAmOZfeoNAZKxilab0zPWD6dsBLPIW0HrwcaXXS7ZUrU5VPT/4l2mviDFtmmaU8mtW+/Qe7XjKqOR5SM7RKm89BMmYA1ncD0odis9T13AC6cX18J8E/oXlCrJpHw/Ob128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145666; c=relaxed/simple;
	bh=cM7UKuyA9lLWg3NK5ViLuZaeP+xsfXVhzIXOQDzVv0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjrU2FMoMSmAR0qL2KaCFeLbP+3U4EnM6YkC1RFEf8ITrOh1FhjEun92SGoRmNa0XNUfG0yU/KR3em4wkc7bThogTG8po/dNirrhOdivJHv0dpGtccUAhvJGdZC/p8X2d6+VuqRXlhmuXFpo54PV558UmRmv7YmnJRJ5+N4Fx9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAMgLndq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M8VoJI004617
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AizstXEr7j+qbEZcyP2bfp+P
	4ZNYzI2uQPOCe7cb9eE=; b=VAMgLndq5aZabdDcknWnnVTZSyxEm3BZHhfkYEdy
	8LbwqLs0IjtwkctqPa7y47YKvZo1zWhXPJW0IP6opR8rTmllLnwLMfx7UcLCvJeS
	EwQ3lRLiYfRg/yOYDCI+oUsAkmGmqdRVFZR9v57weOQvxjR9aZleUhi2aoR7JZT9
	16/zxlyDDV0nBEgIOy5P1vUBA1TZeOlJ15dHPIsVdxyKSQX+ucwRYwRHrcv+fT7G
	e/8lpDtKqTNZ5ncYm+HQY0dkitQzRI94G9DIOnDS+r7AV2ZgN8XY0gB+tbZNXRRN
	6to9VhqF823AB4K+14koNECPB4gi0jINzr0M29Bc8s198A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsankf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:07:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-554e68b14cbso3452196e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145662; x=1761750462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AizstXEr7j+qbEZcyP2bfp+P4ZNYzI2uQPOCe7cb9eE=;
        b=jweYV0BUiheTXSl0BTwJOJsTtc5jHD59pG0eG2/JWlgNIzqMUp00i9IMw5OM0lKbU1
         GaK/Nvt7KjXAV3rGpu4D33vm6AnFUEF0ct+cfdl5fKR7XpgFBpSxth8xKfPX1nEzRvdL
         k+A946gYwGupqVxla4bVG13sJRwBpVfCaoJbviL+bp5d54lJbYM7rV1Yo7Uzmjfp0QM3
         k0ZXhwEB0MByCD6SyDS8Map3Fs7mZoWXVrx1/fdPkDM6DE9yfGsdf8qTtyeOdeNLwOZm
         SUui0lCbrWbaEuVbeMVri7DDTP1Yz7u9tXqPSLAC+ZwHnYjoyv79+Z4HPgtu0l9jsid3
         Rz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDtis2FITG6jsIsXLA1LJ/KAdMQ9uFnjrcv5g4IZldzyGxs9F7AetFSGA0uKcEkfbu6FXgoJy8We20iMvz@vger.kernel.org
X-Gm-Message-State: AOJu0YyGT7PhqpcYJyKCTrXP1YzG4udK6CLh79NU50lbUrA6j3IvC5Jm
	rNYX+0/DXB6PAE8/U0D2+tTzKVYkGtnZJQ7MJPR1uwMneTQ+3Eluqsp3YSFiA0ClNf30wY2VyjR
	5tK0BwsopWpOfrMUqbzWN03EKb+y1nQlmKFyRO14Wep+H2t2b3tTr88MSGL8WSWXSKTnY
X-Gm-Gg: ASbGnct2SQWruJfrQvlxExERfCe1g7GXqS5mggpdWjy1q/jG2trdZpj2ueSnc5+6Fl+
	yWZCYnpYzJTcKcdkuvk8aW0TZJKiGAe2x+Q+GCfVKT4WG8urdF02Ql1sl5dquQ7cD1zV2NAUUZr
	LianO6/PYbiCsSCcU1CIPlvTvqlq0uzpwE2VuN0zvY7bj1GSKhKO+glRN4KDV58MiEaiW/MBo4R
	zN8+eFUudJxYMh5mD2ihngT/Exodh5qRveZKrSiU+m0ldOHXZeken/VLmNTxMFMqY2ecLolkbRf
	kAjCEH93prKtNBiHu1Rwz3pBb6BCuLvWHDtBa+yBSjfZeojzsMEVdotW747Pcm75AWVupzZibxQ
	N+iHbVSE8w73HZPJCWK0ywuYDNGa5gW2Ak0Ullb7gUBXIQLOLx45t0hFKWpbetgu7qEHiO0N72T
	LMj1bZ/8hLQsg=
X-Received: by 2002:a05:6122:3412:b0:556:745f:6a06 with SMTP id 71dfb90a1353d-556745f6b89mr3111924e0c.10.1761145661730;
        Wed, 22 Oct 2025 08:07:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFXovL3a0V22gWge+cpQKP3S8k4AeqKhy/tySq4N0wYr3JuPRxNPuz/9nahs3f/axhVrCdrQ==
X-Received: by 2002:a05:6122:3412:b0:556:745f:6a06 with SMTP id 71dfb90a1353d-556745f6b89mr3111877e0c.10.1761145661262;
        Wed, 22 Oct 2025 08:07:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9586b2dsm39381791fa.46.2025.10.22.08.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:07:39 -0700 (PDT)
Date: Wed, 22 Oct 2025 18:07:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Message-ID: <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXwR/R1gYoi7Ts
 wTv7AaDresGU97IQkoF7uj3e/is+9Q06JObrWx1eBGGag4CAZ5htdtgawVuZHTJ6Zoviy0/lPIM
 Ffo2ZbfdvluT6zZLdLoMkBlVFIdlebIp4DGSjzknSnDYcAbMlMeKQ7azm73BNRQ2q+4osqK8Yj+
 mAHWZaH/z2pJHqrR7thURBVpy8EUtooLiXQyBW7meqxLhVJT+UHzRchgLo0fmeSMY21O785lJab
 H8jYBE3i44zxZ9ReUna2REC7UaE8c+26nguKF1LE3oOl1xbglvWTAWAPpu1OsimkJB5anYFsqIf
 8NMO3Jn4n22NGjr3WIAtFR/iO0OMQh6wmyL5dYIBnCZecZBQ0+wF59J+Jna9sCIgm4g+nvFd86E
 80uEW5OOdfvpclpQCJUZfzZ4hptsAg==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f8f33f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=I67Lji_zawwbCJgw2PAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: H-qhBfo9NwVnOrfpztApb_a1MLkqFYLC
X-Proofpoint-ORIG-GUID: H-qhBfo9NwVnOrfpztApb_a1MLkqFYLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> SM6150 uses the same DisplayPort controller as SM8150, which is already
> compatible with SM8350. Add the SM6150-specific compatible string and
> update the binding example accordingly.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -51,6 +51,16 @@ patternProperties:
>        compatible:
>          const: qcom,sm6150-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm6150-dp
> +          - const: qcom,sm8150-dp
> +          - const: qcom,sm8350-dp
> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
> @@ -132,13 +142,14 @@ examples:
>                  port@0 {
>                    reg = <0>;
>                    dpu_intf0_out: endpoint {
> +                    remote-endpoint = <&mdss_dp0_in>;

Why?

>                    };
>                  };
>  
>                  port@1 {
>                    reg = <1>;
>                    dpu_intf1_out: endpoint {
> -                      remote-endpoint = <&mdss_dsi0_in>;
> +                    remote-endpoint = <&mdss_dsi0_in>;

Why?

>                    };
>                  };
>              };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

