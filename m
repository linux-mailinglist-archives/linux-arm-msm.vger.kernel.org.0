Return-Path: <linux-arm-msm+bounces-74850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6F9B9CFBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D2A382B74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A03D14A4F9;
	Thu, 25 Sep 2025 01:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GW2SESp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE94B78F3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758762731; cv=none; b=m6mQ/i4DUizG/RbB3RWSq5lHtTcJ8D5N0D3rwDxx/ntLaKlzOWlOP+AxpMrJC+AnqzSZTszLHqwMPOu7OwzjLKxAR3mkXKk30GkuvyYSSMSHw2Qri2/gnagGatEsyBE1TVtbyjO1ye5rDxIVJ8gLwIGUqKDwBO5yqR8fWUtz77g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758762731; c=relaxed/simple;
	bh=DrXL8HLxC9CP4klpaZkd6+ccqYpqaBZIzbay4Qvc77o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKJktqFRuBCFBCnnNhQCH6RUzwUluo3U0Clyi89c5dfQtMsWqp6fIw0JJiY6eIcsJ3ClghXZSiFqRK6YfoHVk6zCJsKEcpvNY66nGHw/X8KzRtKE4xL8jNiisn/dDNrcwK1SsqNRrkid0N/03O8e/w9UMEoX0uToF6J4Xt9SQPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GW2SESp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODIX2f029565
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MQ6UCFt1uTELNNSw3dM2CC6N
	2IBuWYa+2G5IROr44dA=; b=GW2SESp0Y2UoreJfxhsyh1KpoIzdgPedByV7K8GT
	xnezcHj08w11Pvw++EUhS2lAkKRNHvhBaXOyNh0gtSPHpmFXdUbiNdE58fX1mb47
	Yh/PyOSpG/GIE5e+R5cl6NMbrVb4uLE+HudYfzVl7yr5JMYizzXoBQNv/3aYWEZO
	gA9kQ7N4WwNqWWv+3Gg22pXP3riAaHFFRn8bPM5YgNwgZj9sLcx1JIR5vli8E96l
	Mk74PeRqjlNX6uselFBQYO8Yl34rz6ToNda7kBT+1eSDSi6xWCaUwo/HnPRu0fSy
	5oT/n1jS5xxxPGJ7pQjK4LSwql4D8IylfOy6lleO0KGVRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fp4x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:12:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6a82099cfso10326031cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758762727; x=1759367527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ6UCFt1uTELNNSw3dM2CC6N2IBuWYa+2G5IROr44dA=;
        b=h5pCz3fqlpedKl2nqsCkoh4YEEt7FXVqNaBLjQgymh5ESAgEeKcuYgR5dIncgdvnbf
         G202OEziMBwiLA7vIeFGFVIsZfNV117A510kWxT5n1VWVjVT9v4lKLn5bYYJVlqpjC1u
         mw1o+59IzXMC7QNzwf6QaeMdzIKBMfiYBjU/o6p09bxEGdf5XcbE3EFKDsTtaD7hOhju
         QOPUyzW08lnUsMtg/3msN2VbN0viu7NNbB0nVpR2EZaixrMOJx6Qq0PG+GIClh8e1Mz8
         x6e/V7y1+dP2JUDEFyE8y4Jo9SS5XsDTbNSYXcE3BoA3APXbJZhCIdZE4BDS5Htas3za
         Zc9w==
X-Forwarded-Encrypted: i=1; AJvYcCUkxgyV4CkXqWYJ+WVBTv1TDwgzNqoJMYHQroPJqMmOoh9BVLcPDAGyGoyVLE5/RDQSDsYW1P0lqbqYTlc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz546ipEMltmWE4LErSRj7cYMjnnfQRJbhhzvgISy1HHWMQO1OM
	H7hLH91aWoFifcSiIMSaoZgORPbUDJHT/QjhTXq0PcgBoI8iGndIx1IuneFpzOCQ3yIRzqwXLVm
	0e62w7kJI1rSqzor04rg3U5SU048mrZ8ibOzN2H57dCwSK1j+RhbABhBZJ7c9gIHhqpVP
X-Gm-Gg: ASbGncugps9JWpokSCbC1Lubnkfc/XIBJlnG9YNSwdTWJYr/oa7tqhGy0Zzi3QOGjf2
	//P7HR0VxECBIMqnqX9H5xgLGhlnxNJCHnsFJaDsDo8cdcY6OVrpdniNBSi3u3bwtt2H1Vt6Ked
	WaDR4dOg2t2qqY3qNdYHxWMcUC4NqjkTscLY0EMUMiren/ieUhbH05imjTh9Vv8Nmdq18wz06aT
	+cniz6EdAZ5hIPfHVMcaB3HaE2r7ERrL8fCc5ZVjqf6vLAhVGYOa8FB1ILZ9cIns1Neur7IQ4d6
	Wnx5nep/4pebFzaIlTzcqLu2jRv16W6m3HfQtQoE2TcHR+dyRxgW9SJjmKUVurkyn81s8Vjg1Oy
	Xzo2YU7l1OCyoHLvITfRTVJ333e4jGqBbCI9vvSVIqOKLqcNZq8XB
X-Received: by 2002:ac8:5f53:0:b0:4b7:7d98:d3d8 with SMTP id d75a77b69052e-4da4dcc6b08mr24709351cf.75.1758762726599;
        Wed, 24 Sep 2025 18:12:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW8TqfUiIdyjOYKHmfe38ArP3DQyQEl0zmpp3cjDaI2nOnb8fwmpNUD155WV/L9oKMabVPXQ==
X-Received: by 2002:ac8:5f53:0:b0:4b7:7d98:d3d8 with SMTP id d75a77b69052e-4da4dcc6b08mr24709041cf.75.1758762726137;
        Wed, 24 Sep 2025 18:12:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313fc02c1sm198591e87.60.2025.09.24.18.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:12:05 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Message-ID: <5mwqf4djs2jee4x6edplwmd5ugucoi4wazrzjoiw2p5ndiv6h2@6xqnnavp2a4i>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QbwwQaHumOKys5vPwGT6k96YJV1JZCvH
X-Proofpoint-GUID: QbwwQaHumOKys5vPwGT6k96YJV1JZCvH
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d496e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=95jUwCB-LgHD7RhpIBUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX7PtRtwMIly3j
 j5kG9+sIWfRLWNd2N8fLDdzW5kv3XdqBmGDkeAnaxKi3U33vmuf3toqS8xgNfBlI//PmPuWlRZF
 YD2VDI7/NL2BIaOoy28K6Myl2ichRKkcwXMwm55MyynXVpaapVIZMCPL4Bw14ok9mujYYSuhVcw
 B5FOsbEpFBN/ZvUeWef8x+bmyG9BoX78TQ6yI8MMvA1f7fellMgeK+uBTOjTBzjps2q6XwwlKBr
 i8fxlYRV9WnmxzsK6ZXpP8mQEuxW/Y95MAxubSpVKkBxERPBtXcaeLlmRMItJp2Z6eiCl85qWYX
 Hfih9t8VpoQ1YPCtonhO8+03/o2MW9FmAQ9eCFeuH48hDT+zKEd0BWL7ikhNU6zlLKTJAN75jbl
 NyWNDlaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Wed, Sep 24, 2025 at 05:52:20PM -0700, Wesley Cheng wrote:
> The Glymur USB subsystem contains a multiport controller, which utilizes
> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index a1b55168e050..b0ce803d2b49 100644
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

Which device is going to provide this supply?

> +
>    "#clock-cells":
>      const: 0
>  

-- 
With best wishes
Dmitry

