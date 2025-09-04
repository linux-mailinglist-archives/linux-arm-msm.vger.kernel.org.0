Return-Path: <linux-arm-msm+bounces-72056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E7B43D82
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7364D1C84D06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF6B2FF15B;
	Thu,  4 Sep 2025 13:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfLBNwul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B0930496A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 13:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993439; cv=none; b=puGIfqKIFz8a0+8V76/qrMKe00qkQsJpWgVMAAzy9GwK/G/dLfMaTLG/KaVNX8bJ7hYhA/kCiCSHeOP9ReQ+m8zLTYn6hdHzomTpS+W32qL9YZb2ByGB6ERgHyPRNb6//2Yjh1KG5QRy4uDbEup63IBmA6PFWurwsYzgn+7h0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993439; c=relaxed/simple;
	bh=pY+0hMoVoBUn8oqRetqFYduNjO9W+fhU6E5VEvndFN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWYf1zgfrxme5dlSRC79yfazX+kCavm3Vng0kBkhL48lt/qkcRLJN71wCXFyAJMI8mRAioz4Ef1Tkb4hrFKppkvfNDfkGWci1GUdhN41zzHOZ3nBVHuafxd90WSIxaH+C2riSGLJGlfnnYZKNW4x6rk2tlP+H35m8/T5Ed1sNVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfLBNwul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8du031807
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 13:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2glEwf25BhBn22EfU2RgmB2K
	pr+UPvjpjFbd0WLfYLk=; b=SfLBNwulePti93rH0/aneWsCdnYXKsLO6rjNRc3a
	l296k5oxt2aEN724wrVb3e3YyMKdw7rqbuEmEyaDn4kIitFBuv5DNIbjywYVoTOi
	o6Kt/Ev5RGQtuLn5rTcIoG3AJZCWWP9f/HSfWlu+TAI8xxTyaAKEdejbi17hNp7h
	dguK3cZNUKWyfbE58+O60e7x6ghUMes7H9Eg3Bj7iWx95qJ+eS9UkUnPa1g72+AD
	FyCh5Is+I5tB3OPZ0q1zQtbCtALUCL2ITkPlyLuvkslaOYnlkSjDvzQYRF2j4G8t
	xD6e8XawIvSEig2bPgVjks3vMZ1PyYNc+0gXlGIiSFJB0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw07pc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:43:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b47b4d296eso21964031cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993436; x=1757598236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2glEwf25BhBn22EfU2RgmB2Kpr+UPvjpjFbd0WLfYLk=;
        b=LnbbM1AxDBuR72civS+kymlcM5UwkMGox3etYP/tS61LuliFTnQ3R9XKNGR6KVA1UA
         LlYk5uARRlycmfWuEY6+hrx2jB+54rTboCzz0YicUN7/v7ynzMcZGm/OVx0I7bV0rQq7
         z+k8EFYO//RyXpVUG2TuY+y5jxBmazqiE2QhZlVses1IyqDY/6ufQK8/440RYiXqR6OS
         N9cZFx5Nd24LHdkTSYtwvtDNCLcDxdvcvRwK+Z/A0tC+OzvzFHa8hHyGyV3yF0h18z/U
         mjY6umCgi1iTvAFFYY1Dg1JfFvsZzmdK9Ks8cYcV3VFbZ5DdrV25PDr0o4h5KZHIsibf
         9w/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDlJqt+LFhD8gkxcyQqbojtfiBXwQ9ZoLX77zk+T523jhXgMCkkcbyV1uqFAYhItEsvvOD+0aUwVlQeHkG@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPWgOSqMrU6t0w0/Cc3z6OXVjF2I4i5xj/boIbXf05hk3l6IX
	TpJC5lHdPNvig9wioLFk/plLT9GhmTEOm0jvdK7XfsF6ydxeW/YRP+do5JF99VWVYoahQvtXFti
	WgmOfYlbnrWDsXDR6ixRc/uG1/lfw6+BdDF9SgCir++PJ3SaEaAoL5D8By37kBsapxCVG
X-Gm-Gg: ASbGncsUQiYehuGLoL/mFIXE/dIZnTpgjLzWORc3Z9Y7K7is05xFoaXfHLusCLlBlVB
	r53tLoNxOcmFHImtkgO8jykQ71oYJv+tCgLmnLCxptLgo11lj0oDEhPk1G4L47ESkK51RVKHO6x
	jleq3k5r//Y7Uf5v3kxtVIvUO80yKo/n3/nArcEVhtX5rJJWKLci/H+Nph96CXbkvVPhCKMrgHn
	4Q1m5hrKhr/b2QuybT0rRoLMLtfPWHbrEJlrkoM5iOYnft4QttNhtYfHyVHvHT6noS+I49sEi8l
	2b/ypJcUPgSB08ydHk/Wzl81FI9ndSD0z7Z74GaUd8c3Z9G0Eqg/Cf03SaIFnjhJQpTJeqZs8PT
	KVJsOLO81Qvqp3zf3QOvcnw56b3Qp/s2hBlq4cv/oYsHN39iLcvrF
X-Received: by 2002:a05:622a:8c9:b0:4b2:a8d9:8683 with SMTP id d75a77b69052e-4b31dcd66e8mr252982991cf.53.1756993435577;
        Thu, 04 Sep 2025 06:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH390JIg6ufBo3mdh8M7wnVIbtdqeUgFOXqUz/fvQ0dn7b22yTZGY91BOUB7sk585pcqQx+eA==
X-Received: by 2002:a05:622a:8c9:b0:4b2:a8d9:8683 with SMTP id d75a77b69052e-4b31dcd66e8mr252982531cf.53.1756993434991;
        Thu, 04 Sep 2025 06:43:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace81a7sm1199096e87.74.2025.09.04.06.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:43:54 -0700 (PDT)
Date: Thu, 4 Sep 2025 16:43:52 +0300
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
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
X-Proofpoint-GUID: euHgqw79mVliOQWCcntCWSaxsLgXFkL0
X-Proofpoint-ORIG-GUID: euHgqw79mVliOQWCcntCWSaxsLgXFkL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX86RULyR36qBs
 jpo0J+1s1fze5djnOxtqI1pSux41iaCpLpvQiXn0+5iSbewVU5VgKOTs83nCXVd/UChB8ngIOPa
 gD5onEXfnnFLXYOGNdN8kaPvDYnRTKblAr4JM9bDzyxoOtUiNkGoKpXacf91de+ZEvgUOJdo33c
 UYBdcaQI+ouVBfotckSsLyN0jrEAoDleI5fpcNITEts2gy64Rl3j6Sp8RKA1lpaxHblOunCEQnj
 SxqlLsf+P7swh7K8ak/NqTeiZX8AfIiWQ1KWXE1XCvywAu28tFKdTt/LxbzwWOdjQs042smx7vJ
 yHfdDoly62pZD/zyFJG9jPDbpnsGsApwvXRSmICqhQ5J5BCOatCsyvJeZ2hhdqq1h8h+W8Dgyqw
 BXPoepCQ
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b9979c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EGIftIUl1-O6pfvt0j4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> that supports 4 MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp

Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
new one?

>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -195,6 +196,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> @@ -295,6 +297,26 @@ allOf:
>            minItems: 6
>            maxItems: 8
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              # QCS8300 only has one DP controller that supports 4
> +              # streams MST.
> +              - qcom,qcs8300-dp
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +          maxItems: 9
> +        clocks:
> +          minItems: 8
> +          maxItems: 8
> +        clocks-names:
> +          minItems: 8
> +          maxItems: 8
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

