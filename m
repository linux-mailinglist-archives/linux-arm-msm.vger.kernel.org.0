Return-Path: <linux-arm-msm+bounces-59690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE62AC68ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8751F4A7538
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA7A283FDD;
	Wed, 28 May 2025 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBe5zTmC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E2F253947
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434479; cv=none; b=B6RsvI8EYwt0KEvZFeHy39zOQk+M/JnZk3BvOPpfOiK3PNNYsEgx8jCG2i5WrYQWsKqZSTZmb1ON4Boet8p19QXcjpa1HTyY3WA3Ouy/tR0YCtjff57VZTldY59i06od9dx4GM163lFgImreojN7R6JUuX5mwnsAmWs7DG68Vos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434479; c=relaxed/simple;
	bh=jYOPvF1Iu9M3uetpmwUkrikZ5IUGSU8JmbXp4kxQezU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoGcmm9dXO7g0FrjLxDWDXiA+SsiUg9OhBQIUr5QPnQiTsbJcJpiv/wkx9Ri6o3ydzLo4Xaeggq8xktzIhsK2drxp1KTReEwiSBbVsMAfGKaePAO1Q2UqZz56oCk9bJwxzAaZrX1lKQYjrM9vWlq+jhF6P+yZRspkLs3FZBou74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBe5zTmC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S707dC001393
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cjdekBqq9jQ1YXFhfk1E8WK4
	nJD05A+u1nrX/oJj5mo=; b=OBe5zTmCx9eNzb6Gr9pjOGgX4nz68VzF4PYfCXmb
	kpSlphATodbmzpK4/CcmXm9Ry/OB5hR90fIcgX6j1WoovJYM43uH1nX733aVpOQN
	Cq9cPEMS2NVqazTry1eX2iKI42IF5KOYjgz+IsesBw2FW7JekOVJ8BhuYYIEHT1p
	EiVFoQ4KHnUy6uI7KMqFJe+IjQCz+1plpvlL5/MLzg4wPFOsGIHzZaeDzVmD80EU
	jyHDUXcAXCKtCvZq2Jsy7jzeZc2De6XBjm3sTzq3JvHSBui/ACCfmv73YbCN712T
	SmCSMiVLwjIz+D4FPCgRGtqat5McrFV5FvRmWhpkaTgYJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkux60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:14:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa443fb86so37916726d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 05:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434476; x=1749039276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjdekBqq9jQ1YXFhfk1E8WK4nJD05A+u1nrX/oJj5mo=;
        b=EfRInGDy8S6S2U8p/ij/fYhAFGjctu8qYf/sGyV27ih9V7IJqui9SEds2mFq5KuhkB
         S6UHUfpmnEdUMYjn9bEK5z4vbffNzhcgDP0umS3vNkyeRUq9Oumq7eKrOvMfiNn0l3oV
         7/LUouKx79gfZhcw+3q6jdEEAYdSTvW6wzKuh8ZSbXorUnNU7QG1zejE8gotkphfhWQi
         iAIqmAji4dPq4zMihg1RQYoXCPr0ThtUsVYBeBD1XZf1JyR18TDwUpnGAyjfJjmBmEMg
         Bp5YwAY+cGcW9RQ5bAr7WadU2MUfa89dfHnfzNu+RsTzJmn3jyj2+r5689o/4dyXjJ6N
         QYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZU0Zrqqai6t3STebLzRpmWhmDCzOEHWKMMDpJx02EmUj5My/lTvlJYpxQEUp5pXQveiZNvXBD/bd1RmDr@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnIfBgr5Nh2tLTVP3f2e6CjbO+SB6GPFddY+1qtz+1qAaWabW
	v4ET0k5p7MFwtlFxNNs6iYKrsJHZjZBxwUq51KLnmun00ji6DD83UnucSQtIHJGBbzQ18xmqoAG
	XpMTw7OscM25KFcA6cqRICjUgKBQppxCT083Q8xji0wdDHO3YpHzIxIfaTHQrUTNWoGPZ
X-Gm-Gg: ASbGncvWPCxXg/jRDqD9I1nnFSDq0eS/W+pVGh+iIdp7GpVYi0MS9ty9lAuBRZYAP4+
	cSTpSwqlRa6Y3G1BeYloY1Kad84qTDM+MVSW/HRX8DnSxrl92rUn9teMVuNv6u/W7AyTLV6cx7q
	fGsU1tnt6Qh66ATswlFrwCHFS3/lDDDMPpbZGsrtrc2xut81J15TvkJydeAY3a/JH/TmJnwF5jR
	4iGhxKawdcqxb3NuOys0KVlwLqvXZGBtmGMrAwF0DHqHynhhOYG/oFVyaroxgzXDp1bLhWCfTde
	phFiZwvLD9GonXZlBEyoCZX0M4hlhbqaG/MCT3xYQpRz30tyNozsAcUiW7x8vqvxB1REsMR5N3A
	=
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14195046d6.5.1748434476043;
        Wed, 28 May 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2p2VwJWOXtJEGL/fYyqmZpdkmAOdMF5Qq25nUD3joqlGl9qIwB9aKQH/bANxFtWon8zcbtA==
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14194596d6.5.1748434475626;
        Wed, 28 May 2025 05:14:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb688esm2323591fa.24.2025.05.28.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:14:34 -0700 (PDT)
Date: Wed, 28 May 2025 15:14:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Message-ID: <ari3245mwglxyelcpbct2dnclmp7xtgj6jwrkopb7t77rzdmio@zkpzkyzydig2>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
X-Proofpoint-GUID: _MFBE7WUvY-66jh6YW3OVDakldf8bxoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNiBTYWx0ZWRfX41dKP6uwSPDH
 tU6Yv+DwXtmzZ4ESGCrbH/9vaP3vrpE2oNvPFjtywpE9AyzTRQTPdkC7NEeOmKX39RFtwtem0Di
 csaMsQnSfPdm0J23Q3G5K7wvBYKAIPJFeip2Iol8mceLb3c1Trr7YcdvdmH8QKOZK5T6G+yRM31
 WnUI/BLsomIKX89rlG77gbAmHN9dG+3ohwk7vJTubhlE/EapBNIP8S2NrKbR2rMvvjK99cculsP
 lkFWWfEjrTu0r0/v9i5amw0gD2lpPbuPaVY1/lkp2JeEQNPsjR1zjX5IujpFLSsoNBWE2XZEbbW
 uQLy1hscneCc85NCC+KZNJV8SWGuyXkqh8Oho8aI/NDJSWEiadD6lWICaSQV42koS/To0pZPyXB
 crwErNXBoPB/zEG2rAU0oyuZIbPpJSkPRh/V9YWx4vJANParU8QUvg4LHaShPcSlM1PXZjd3
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6836fe2d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zrS0zEH8eRrj_hfGFQMA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _MFBE7WUvY-66jh6YW3OVDakldf8bxoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=546 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280106

On Tue, May 27, 2025 at 02:04:39PM -0700, Melody Olvera wrote:
> SM8750 does not require an XO clock in the dt as it is the
> parent of the TCSR refclk_src, so move the compatible to a section
> where the XO clock is not required.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4..298b1472ccbc4cfeb04927da29ea40b9883d03eb 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -227,6 +227,7 @@ allOf:
>                - qcom,sdx65-dwc3
>                - qcom,sdx75-dwc3
>                - qcom,sm6350-dwc3
> +              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> @@ -366,7 +367,6 @@ allOf:
>                - qcom,sm8450-dwc3
>                - qcom,sm8550-dwc3
>                - qcom,sm8650-dwc3

I can't stop but notice that SM8650 also uses TCSR clock as XO. Should
the clock also be dropped from DT?

> -              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

