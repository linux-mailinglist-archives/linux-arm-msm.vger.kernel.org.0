Return-Path: <linux-arm-msm+bounces-74281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E0BB8CB5B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 17:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B2046133E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 15:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E9317A305;
	Sat, 20 Sep 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHdi39/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BBA2F9DAB
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758381764; cv=none; b=bvMVwE53aLGT1ad1i2ch68ScV4jrxvL1NKFT4fpoZQ5YCYjsU+AtqmHHBsHqr5oDK+dLUedK2Iiszl/Zjea0EgqMdIh3qHQ5ngW7Bb14f6Qht5jmxSuRcEmf04wqHeU6k53j2GcTtcz3EkPznkC8lInyoTX3KqIf6CuEGS46D0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758381764; c=relaxed/simple;
	bh=ADtsq7AKzm5Iw0ISFNLkeS8bqwkOPzAKJJ4xuvJ/GhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URIFDKh+2F6pZM0ru9BIGocJ6VdMRWtcDJThQiS0JYDR06addgi+r/QUOitv96WCdkoVSerYIeMtaG5psruU4W0bh94vfvYkrlbBlu7sf8iomIUL5/d1lvSgUQRqwr0xq0gqsWlgsJMYFo5lPrwnk3F9FoRIBiJU6YEcfAESYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHdi39/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KEc2YZ028543
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qMvP8F7p/iDOTofUgdqZ4hYV
	jRyQ8rzwo1S3mGKqewI=; b=EHdi39/sRKMF5YFMprLKbxk2PLKoxfCXgK62NOBa
	lh3Dsw0MKcrUKng/QZ5fVT7lNhoFNhMC0mQUN5TSCmf3VM8+MfO3aAUVR6dGDJAp
	+jnND8JM0Yru8ZOCmeI8PyeXU2t8tdjskYPeQUWDsigwwIEVqvml1xzaRZX2RcTB
	oK9WskshuZpjyOQoD1FZUO9H9T6u5Bmd3W149CO7J99/IJyoQYhg9VBk+OHhIRKz
	EdF0r6z3DHdnfQ9pIMPiMyGENsHIb2Gu0mxABEEi88zkOkrgJcpbuHSBipC+C0qp
	qXJbcpCYR4CCG0V/a1bYECWjegISWElZUf6V6tev6zKuMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8rrpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:22:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-82968fe9e8cso903438385a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 08:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758381761; x=1758986561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMvP8F7p/iDOTofUgdqZ4hYVjRyQ8rzwo1S3mGKqewI=;
        b=wWazhNZQCg6hJq8Y5ny1n/Q0CWxRLWBpTG/kc4qe939XyDa17b/4GXoh3kKuJ1dPqN
         t/4EqT5sa3offY3tbxks7RH2AlRQZmrz/qKqplbThLjOIljwNcLR7kV7BFSi1fUh/i+N
         HouGSHpoz/nLB7qe1Vp3kbrokXmN/4wK1tcFgFBr5+8slQTEIQWIG8FSDNSPDD9XnORQ
         8QOpkZ79cxXvFQgOTv+ipOTNPH04+5LhBpJERdxNuLngzbYW1MXtp3M7EeW2VpAGFXBm
         rDEk2/fYjz4lqHUUwyqqtpHWe3hwaxws91J3tH3/ptelr7fkYJjxBQwZ9kJi1hHopC1E
         zvmg==
X-Forwarded-Encrypted: i=1; AJvYcCXSsL1XCoMJopL5R255cTKRHw5+pEwYCZAdlFZ4n0230sPtbpYMDKhNYQOvxUnEI1O/aXjYXvF+mFyyw0oG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5ySYh3fWbtWSElI45lbgZH4z9dSawGAv6ZG6ZW77nMoABt/L
	CaK6FwXRsseL1W3rH5lCZkCuTX9esyogOAOYPfgn20p2jtDuQv9dqEWESGUEzQs1oD9T/SIIpeP
	7XEBqCnq3M9SNH998HnhQLd6LeB8zn4QDJUl1JA9CPoVGhJMPNfC8HUPunRNWiLWd/3HP
X-Gm-Gg: ASbGncusfyScgf7ApuYzJGkwRyJAPRzGaB5YasYjp2sCkODCCeuNEnQGxs16/BEn1tv
	e3FvReLX8x+QXk/htB7eqg2kqxE5+U2nKtYegafaunMfhysy4NIwoymqc7y1nSd/0zkKVzeQPU7
	zoY2dZYTtGxYNxvM9fcnTeG4W0E1MCDciJ3dRVuFVREKGiNF2ygOnR3F+qHAj88uyNWBz7oEbIO
	N+2TBtPUbhWR5WS5T/okac0aNUPPCdqFCXbQtkmygqTJ95FBcDuiB2D8BTLY5rxWj3SnTddpiSn
	5Utj/sNN8g7ffZpdvRZ45Bkq6W7kfTgLOpl4CB1pFVCVSv2o4Wlt72EFuEFl8Fyho52j3GafgK5
	rMim5+Fn9RasJEJ3jJ2uqkIWHs++zOpRamMSlbzfH/iv83CwpEmhQ
X-Received: by 2002:a05:6214:f01:b0:793:1b9b:4a9d with SMTP id 6a1803df08f44-7991c5f520fmr84609186d6.49.1758381760598;
        Sat, 20 Sep 2025 08:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWlAgM3pnMSdAw/Rq7z1YnN1kZKJ5qD9fwFMBKD5LFNPD+tDGwMgQD4d59xA4K90UQvVcnrQ==
X-Received: by 2002:a05:6214:f01:b0:793:1b9b:4a9d with SMTP id 6a1803df08f44-7991c5f520fmr84608976d6.49.1758381760044;
        Sat, 20 Sep 2025 08:22:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a27c0242sm18259521fa.21.2025.09.20.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:22:37 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:22:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Message-ID: <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68cec6c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=IEiawqspG9gC1EAg6qAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: UdaRlohm6eIr8kkf_ERdnsA7x6l7OwPN
X-Proofpoint-GUID: UdaRlohm6eIr8kkf_ERdnsA7x6l7OwPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfX/TMXbehn64KZ
 Blb9Sq9ql+3YQ0hV/uC62v2y5y5/oCudNsU3XvM1dZUw2SgjcQRdreSV725b26cP5Xjg4zeUSJA
 0fCO7oOBo0Ns2qax0s9fdmD6fBeuhTJdmqwUGUrEDk51h48ih4H9wigg/w0MswL7R6SeEmJRQJm
 QpQFyRmwo/M3VrO+S9U48lP4wBeiFFGWHek4wM0EA5/kDivNyhCrh8KD0R/FUHd1HegwaNSUb9m
 lYgkYwPtl5paietmwIfSIDsDZNoAxa0HEeRtd0DclwP1j+73ZK2qYTj/VXkNOUb2NwHYiUQ9xzj
 wFnHGlEhvzy7tQpwOWtdRC2cQp9FCxmDSWuW1CalUyvWw4kmhAlfo3StptDOqUn0vYU0As+BHFH
 rfLTwC/k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043

On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
> The Glymur USB subsystem contains a multiport controller, which utilizes
> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index a1b55168e050..772a727a5462 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,glymur-qmp-usb3-uni-phy
>        - qcom,ipq5424-qmp-usb3-phy
>        - qcom,ipq6018-qmp-usb3-phy
>        - qcom,ipq8074-qmp-usb3-phy
> @@ -62,6 +63,8 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  refgen-supply: true

You've added it, but it's not referenced as required. Why is it so?

> +
>    "#clock-cells":
>      const: 0
>  
> @@ -139,6 +142,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-qmp-usb3-uni-phy
>                - qcom,sdm845-qmp-usb3-uni-phy
>      then:
>        properties:
> @@ -147,7 +151,7 @@ allOf:
>          clock-names:
>            items:
>              - const: aux
> -            - const: cfg_ahb
> +            - enum: [cfg_ahb, clkref]

Why is it being placed here? Please comment in the commit message.

>              - const: ref
>              - const: com_aux
>              - const: pipe
> @@ -157,6 +161,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-qmp-usb3-uni-phy
>                - qcom,sa8775p-qmp-usb3-uni-phy
>                - qcom,sc8180x-qmp-usb3-uni-phy
>                - qcom,sc8280xp-qmp-usb3-uni-phy
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

