Return-Path: <linux-arm-msm+bounces-74867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB77B9D204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BCA21B26D7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B367D1EA7CE;
	Thu, 25 Sep 2025 02:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcJ9qBim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB151397
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766760; cv=none; b=rAItd7zWxborKuDWFYAK132ZU4pXeC6bdFZ3txazRIxDyhJnyohKAWMWJ4dFufLsqNn0jzVAZWyiUucjFqPGxV2WPdrteXjdAjBsDIeMU2YDfMI6+LosLyoeQ+WuCJrRk1GABeG/J9q96UdKlMjDbJ99A236zaygwL1GxQGE7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766760; c=relaxed/simple;
	bh=V0o0RUbSBp5pz28ZYimBAnWbI9+qlIN8juPN5I30FXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jl9QrAMKmsWIsSv9nkD6EF9RWnouEbb5VV+WzFcBkgRVf7ub4oH6F0M1WbxxjKCOfOOL4c0z2NfRLiShbwro4ktljbuiy1YKOk0YhUDXXezV7xx3y6ns9bpNWWAm6a9/rxa69A54vOz2n0wjHluhHTXMBnXaz8VTqWsBAv2djK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcJ9qBim; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1CQQc019949
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kXk60tSvBFJFBNcCoJMszP6h
	av8IWwZrJglPAylRH68=; b=KcJ9qBimdnC4DcQ9taZSKFlEBr65ZwgcP691v3rR
	rVBr+bJOKGlI7De2HUw/QaU80Zor7DjqZT4daVHVTDgRLtgDeguznlTSq1ssCAIX
	SKrDS7FnshiAIjqMrFr8foGlk3n3PopOtyyeBKqP+bpMH4AFd3ry/8yzEP3HqpNj
	WgF5phMsGUnfe31Y07O40j0MimurZujxMWVw5rsIp9bJjGEmZJ0hlBx9517haYC1
	6zm7Kh58VygsJgmQbqC57zfsPwe3o8uJs73z4lxF9XgJETc9fl6Xu0/0y3KdRrrh
	uSmPOVafU5cq87OBUHsAnfXB6nv0//HbjL41ij3xTRb6BQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdymus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:19:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d7f90350f3so11421381cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766757; x=1759371557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXk60tSvBFJFBNcCoJMszP6hav8IWwZrJglPAylRH68=;
        b=XDmufn/VqkfZcPqbHR653G983mQRbBZWX0KqVNbIOTPViCIoRSYTmObC/ClF27gxLz
         pXmPwu+pZKpomev4HIeYDmVeugpCPnWz67pmfLceLqiC1ZgrBJy7wC8wFMZ6KAam8Uf1
         UbxyZn5zelUVvVAbmHBxvx2n5c4pTBCwkvIz49A3uZn8IEtbDHqahyRNcaZwaU+avegF
         93J0o6uBIAjUw3mXcCaAdw+7ZmkJRLyc7nnksXZH1m3Ep+iUDwbnVD273C9EDlwHh1F2
         2th8eh+O1LMzFzL8XCWdxru2shWLAGyIhjuwrha4g5rXoU6OTD0sTRj6hMisWgBhTKmd
         hjbA==
X-Forwarded-Encrypted: i=1; AJvYcCXiU8PjTerV6H2x6X6fa2iTWJCtEp7s1Aa84pyxeo3sDd6bBx8Iwwt5GBYlr6gLd6Im6aq6AVIkKh1BaH1+@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjRicqItVfwVAvrmbyZUka3ETrXa095Aci/k2P+xiywwBCM3r
	heS445jeLisbFwE822qK8Bk3CGXHjexUBuaOeW3U0ry7RvANXozhb3g6J2X4uX4A0O5vbyV2Ote
	RyZLVGEixVjFUtrYI/0rAF8rLuI8IGgfk2bEs0hkf8VxOavkdbnFsRuq3P/x9+2HBsJIL
X-Gm-Gg: ASbGnct3OlQR0Y2HQT0lzVdqDOzy+wsJTPQ7U6iz6UWRC95Py3MlerjDxU0/BR+8ON6
	d1/4/zfnSYvQ6JxzgK4lyfVtoW5pj8CbiKuLjHJyKND2GsTaMaUPNHKpiKmFGwHP0uyzQuH9fU9
	duiFgqzhZaJ2+QerOQCD+j4aPLj0vvdKaJKZ1UGPWYoQsAn3Jdk5DuB+3Nw8YSvlMiN9KdqXRcp
	ZePuOEyUVK6P51Gq9DTpwPqvpJ2zvhDRZ1lQNLATEhCx687jGbWYg3tBkv4367QqLP+wqgE/jj8
	zfn1LFeSJT8R6rKwNvCYTUM7OmyT1zYgPXH62g1Cinw8l954xggnPAZwn7pQv1ik8KgN4ICUwwO
	GCNemNGgwHMygHtMY2nhqeGJ5eZGxIQZoTDClr6AVLPJlgmzx2Ed7
X-Received: by 2002:ac8:5712:0:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4dacdce3156mr13155351cf.33.1758766757150;
        Wed, 24 Sep 2025 19:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkHoyd8pfNk/u0CL0VcNtv5YsWD3I6SuFs5XOWMFIZNGOfOtmwhgR8TS+cBKd/zfDeZIjh2w==
X-Received: by 2002:ac8:5712:0:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4dacdce3156mr13155191cf.33.1758766756673;
        Wed, 24 Sep 2025 19:19:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343111asm244566e87.19.2025.09.24.19.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:19:14 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:19:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Message-ID: <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mDt0Wh1MfDeN8qRp1vFfCkH5N4mR4m_u
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4a6a6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TG0ozkzLEzouTHCdhgAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: mDt0Wh1MfDeN8qRp1vFfCkH5N4mR4m_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX0TPlzbNxGkI2
 iWEs3rGjdmcwP2oYnZBOyesxim8YRcUBZ0ZMbu0EEWf5gI35rQvZYpbiBuHY9haRB3I8TJK5Qpw
 +APRf0shl12a4gxtxXMZG0c3ND1/JuuqFixFFKPObRegMv9ohMJAin1D/vIXVPdpM+gj1dEG7GN
 ynCij9RbSgiB+/OQtBCO0E6y84KgRCp5g5NQRblZ5uRRTkpBJ2vLqHb1tjzkdDZCYIOV/CSwvTn
 6r87kKFSGpjNpcWFqcjR1yg1uwQIdZwU9fzqzCuI8Kbd/0P0ybbtxRqrXvweHELVRlXN+rKgfzB
 bgLybDU88ciKhUBSR0JdHtOjZYS0H14ABZ5xOtn3+BIJEFhP4KKEbKbPxfroQ4vyTeIDPqei7K8
 WvvwvD4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On Wed, Sep 24, 2025 at 04:37:22PM -0700, Jingyi Wang wrote:
> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
> compatible with SM8750, which can fallback to SM8550 except for one more
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 2dd479cf4821..be9e2a0bc060 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -28,7 +28,9 @@ properties:
>            - qcom,x1e80100-adsp-pas
>            - qcom,x1e80100-cdsp-pas
>        - items:
> -          - const: qcom,sm8750-adsp-pas
> +          - enum:
> +              - qcom,kaanapali-adsp-pas
> +              - qcom,sm8750-adsp-pas
>            - const: qcom,sm8550-adsp-pas
>        - items:
>            - const: qcom,sm8750-cdsp-pas
> @@ -95,6 +97,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,kaanapali-adsp-pas

This one and the next entry are redundant. Do you see why?

>                - qcom,sm8750-adsp-pas
>      then:
>        properties:
> @@ -185,6 +188,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,kaanapali-adsp-pas
>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,sm8750-adsp-pas
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

