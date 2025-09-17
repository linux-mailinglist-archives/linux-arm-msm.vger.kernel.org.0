Return-Path: <linux-arm-msm+bounces-73932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF57B7F8AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B48D5802D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E5D33AE8C;
	Wed, 17 Sep 2025 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGG3Fati"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264323397D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116520; cv=none; b=JnfSFa7PqEAvBjgFLc08APoejaFBkRxgRsCzUm2LgiKw1sO+x+Ek/Hd+fopu5ZGs00yzae2LZxcH5Na5s31IXATqZWVlja1/otB6vYaTnp629oeL6sR4St2gfFARr0lTLMLImTYKYx4spOS1bVsSphMDraViBErBrP0hqlrCwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116520; c=relaxed/simple;
	bh=c3p3OzQJm94uowS2ousRWbIHVldkwb/XAGj2i/aaEtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjRy/mjE1zcH5oy3mCwNet8lVx0POrgFIxfC6LhcSttdYFbON2IFBMprA1dI8YY3tFCj8LX/kjJDouC6BA8asqJscKI5gTBwNXBxNLdS3eeHZy2MDq2KCpSbbs61L3IdNNrCD8qcHFxkGTLd8eQpl2AeZXI2D4N7CpeyHFPMt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGG3Fati; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xiwq029779
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qpC6Qh56Qa+EAaZ3N4PmVjwB
	N0QhCvBYaOuM0pbHWqw=; b=kGG3FatiQR/uGrofjwfwmNyP3hqzm4R/v2uQda4X
	FCn7NEfuhG+5K+efRmNAPf6TER4KehfOQfag50DPSKIaUVHTG0FeCbxYWo9hmVa3
	Bu48FRayL8ZLNeXUAEm5RMufa4uHdVklQcafCM7oTYpkWWsOzbe6jAYSpfBgQYz/
	yPw7b6bkQs/Ywz85hiRpn+pgOX2B9KRKcI6S3SyUqtdh641gOLOOM78BeEvs/sHk
	xDYkChTX70Zs4IH9CLlSaOMRRKilWMiI5mpO0yFSmkvflf8FlRjSAsuhQrR+OV/l
	ohgFQWEdDU6vvwpOAa7ig5LKiiKwIbVkSs2VqLXgsr43jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0thst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:41:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-718cb6230afso115027376d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116517; x=1758721317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpC6Qh56Qa+EAaZ3N4PmVjwBN0QhCvBYaOuM0pbHWqw=;
        b=iZQF0m0B5oPEu6Ek69koTjdJhE/l+N/qXWvHV7DwR4eMx9i5fqMbJB/zfmwK1kRwyM
         JNHNcA12uxBZQH7jD8EEnWnNJKZuM3lBouyPhgqZVOrFUc4yQovfJ7fG4EcDC+9EEXxm
         EOfdQSTfcyWx5CiY35/t+iom7YAt6pPWGwCOTIp588cJDZTam7lUzOQgf6raJOgx5jC0
         TJ1DDz99NJPNCulYmZhbgJipylZhLevlmie6R5eXlQbvYwUjy7V+E60BtJHkZXf18Rr8
         9KaeM5aQuXiHr+ZTpnNsdoiKDcqYD3Z2B9JVz3bzb1aWskiiKd/cXvFItjzxG/1M1Cn9
         sFzg==
X-Forwarded-Encrypted: i=1; AJvYcCW9XDfHVxdUrrV0OcEtfmMEJkYc+BSdfYnTe9nlh7ssE49XhxRRYqf09tHLp7aN0p0mGw/L6FMjzV+4YZ+1@vger.kernel.org
X-Gm-Message-State: AOJu0YwPLQOxglhGpQyLHE8QD9cQg7KWKpzsMcpHi9Bm1XTtziMMGOLa
	cGps1Cen35VATCaN0M1Y2KkoVoTzIab6yVLWq7B0SigopLj3WOCDhK9LNCHCrFPdGmk9ZeVlUXC
	Sk3w8Wn14HkZaWlUPCwGTiZd/WSzMTvTjP6eaciXc+mObV60RZZod/D8S0/zZUuJRn1R8q6nNvW
	eI
X-Gm-Gg: ASbGncvjqA+ndCe2mqfMYvfeGWVXUzRpwYeMjRrODDVm7Fhj4wHqDiLOpHvdAe9kDdy
	/8FYr4OgL5wEOXhp5HbPRCnrwCKCa9mi2StHUMESYYGtkyLY5g4l5zpjiiWQLWfHJDmrrvH1pK3
	6/OpBVqXlnGgZphclx2KBSnVrFexQSf/R4poR7DJ2ka7Bx/PaMikleI1owp9VqAwSqFaxrfy9Sc
	nTV0FQWZWzUfYALKNkWXyKPUotORRGxqfKJM4DGG1c/BVadQnfxo8tjBNBpJrN0MkE8xiTwJSYg
	JezCkyiHlK08/vQzRcB2DXt2F50yuiqDRkxS9s/cO7VvHe5PoEeO3BTeksYypJYxpOsyoCH8hI7
	HgR+PoiuACRw8pGOV1mHy5IufPZncoxekEfFZpC3+lbcGGFx1iMlx
X-Received: by 2002:a05:6214:d04:b0:784:dd6b:e415 with SMTP id 6a1803df08f44-78ece74b887mr20326386d6.41.1758116516243;
        Wed, 17 Sep 2025 06:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYsXsicQy7T4aM1//JPfQjQMyi0e++rSfHY2nycNA09VHDuBpw2sRqKKR2CHRw/YR8Wtwgdw==
X-Received: by 2002:a05:6214:d04:b0:784:dd6b:e415 with SMTP id 6a1803df08f44-78ece74b887mr20325706d6.41.1758116515455;
        Wed, 17 Sep 2025 06:41:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6041sm5296003e87.10.2025.09.17.06.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:41:54 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:41:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <bk2yuuqyhxi77ckoe2gkd4ghsgtuzfx7nedcvpb7qreqdllraq@ctdrddla5xcg>
References: <20250917-hamoa_initial-v12-0-4ed39d17dfc5@oss.qualcomm.com>
 <20250917-hamoa_initial-v12-3-4ed39d17dfc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-hamoa_initial-v12-3-4ed39d17dfc5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gp8FLwlm9ApQirKnjeCChCe4sdecM-lE
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cabaa6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=kMu10WXGbiujYwnt40gA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gp8FLwlm9ApQirKnjeCChCe4sdecM-lE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5FTDMcACT3sc
 oO5XPBiBWP7dLMRU43WmbbeoGbPQ0XjtpssK0QA046yxzZ79Z9cnFpFSCjOSbUeTO+/mwS+Y2jr
 EOzHbxmYsMDTDN7xMl8AMLHxsITrbXpeVUufD2AhD/VDMvaTAQclHUqR9Yc7IlF4ryF4zwT0m4S
 rTBDnNxBXFTugqiHKso6kWTF7gECV0NrTy3cM444t7tg+88pJEoNGdZoSdMQFYiO2zmCHnd4NJ2
 a62kdLlfqMUGUzkboOW2eqpEtRI/sV15QSkgTvXtJv/JHE2tvIJiViQvic00YjHbQZI9HKTdU4q
 yrcWmVomTbW4zn7LuhgC3ieACK27wyz3lisIoE0pkVGaqDH5Wz6bBRHfRjg/L5f+8eRs81mGo48
 506I7iVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 10:59:00AM +0800, Yijie Yang wrote:
> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> Make the following peripherals on the carrier board enabled:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - WLAN
> - Audio
> 
> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1222 ++++++++++++++++++++++++++++
>  2 files changed, 1223 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

