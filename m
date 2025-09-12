Return-Path: <linux-arm-msm+bounces-73390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4766B55807
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 23:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14BF1CC711A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 21:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1A441C63;
	Fri, 12 Sep 2025 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YgG5eUwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F120FA9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 21:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757711138; cv=none; b=m4AbtOk6uOg7waBnLvBsv5d11vYopuO5fbjPSjyESLoYLQ8XpLGa2UGdBOMqxeHocxhq8NrC8dtMLm4cdXeMclHrTDbu3hri77Td+4YifWwBlMubx6bDj0kwHsHQsyT/Q0M59Q8hdrQz2iajoCjNSw4IQye7waGleYyOpw/WikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757711138; c=relaxed/simple;
	bh=tAKgUDssB2Zg+/L2UJaRq55G33qRsupCF9DvLWF0uL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5HEr/OxUzdiZr5MJe3P7QCvtri3kWBUzIILe3mvZDc8xSYHmaUz0Z4oV0kIPj/VQzmmiarEcAHoZZg0P0xjxMKsWc+hiAo/lm7EDTcPjDKUlHf8UiDYmvZ6VTBnrH9trRvpm6+VYW7AhisIzjD8htCVGLoHWbvgjCR28vlv6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YgG5eUwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CHV4Zw019885
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 21:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6x45dTFSIMJV/gJWuKckpagRMD+esitL+Lw3qTQiUk=; b=YgG5eUwoIypKISQz
	S3iZ8dryEFCU7L9bIY5x1iq3uIv6ymIkOmPeNnHca4X+3aVlPvagBFvQv9khD2f7
	dbviXKSxuMoAaglxDZkFhI/6RweerfDJxanl2R8S/b4UDKBUKuFj5/wXZMVPnvAs
	PkiaULnpAHyFMGtnxEDCIpinpiE8bEJxRgGEZjdQQp67f9hN0Vd6RCC/j5MO48lQ
	McODbKSYYi5XBZ/PtaZyJUd8q6ESW6orIrH1a/MH5BgzwmxP4F2lB1ern6n2Egoy
	0YsUd9GOkgh20tdc8ZZhVa/LiNH7s1gdQuMAgu11leBEqlW1QGkxA2Hk8XGP4N4l
	0d3+Ng==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t3898m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 21:05:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71ff3e1256cso66026056d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 14:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757711135; x=1758315935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6x45dTFSIMJV/gJWuKckpagRMD+esitL+Lw3qTQiUk=;
        b=uc4mn0fuyP1lpxTOg7EH7d3n/vLUr5yDxKFh6Kl/VjZCnp0qo0RFeByasddknwPD8o
         c/R/g08OTeM1wpy1zjv1zqWrLrcQ3G10VADX5jBKn2duSykoqtJus9YOzvixS8izG3yi
         uWWMdtKj01w8swxu/Ud8XCg+eMLShST6v2avqeN/aXMXXhhkLX67yrkBpzthUcyfmgEm
         d9PCsuXldOnaAyBaE9A0SnEgEYFJotO9k3ItQQ8y4A1Dg+s8y+kBeW+7xAPL0mpNHAkq
         GxlcDobqAd28JGf5jcce1s2n1FXDLXqdaQYW/Gpssm2z0pnleN0X0Tn/b21i/07s9pCh
         Q1IA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Dw5rUv/8w4VMY1HITlEkzA/A/hhP6Xstlimy3G+0vlGhJ0bRdTa+bx2A/H9kEzcEO0OImmz6xUOTMYop@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4ThPGVW1Aj/i7+jctWjwYV4HeCOPAxQn3ZJSIFtk4IbIo+Y4
	MhHKX5lVu95v8K2PRvQwftz4yhJqJo3FbhPWD6XoLo5JioDrOSkMh5R1mMBtvlbBInU3hc49gom
	XkUcDotxfMzLMo3+YYFKK4KPmyG7cOcuFwNsjhj6B6+mB2rcXthIZTtmJPzofeUhDRO28
X-Gm-Gg: ASbGncti7oiMMLZZzv48u2nMD4da2xesVUTf6D6x2pXC0Ak4wZ1mMTkiIbZ1tIIsBPb
	DXum/XPG2mRfxmDzOPt0upstX9vSDg1wXAz5enQvxNer8fQi4Uqrx0hi4OMW1ES8BrNANSqXSZf
	sJN0x6QAHujhOjEGuR+wWvBMAvuSQIQEsnPQqX3HC4n4KX+i9tTN2PhCgBJpezwlNb1dl5cf1nV
	AOvykVmfDlWmJwZ5DObPV6QwOWl9mgQS7br4ibzogBzyyIQpfvzWNF6kcJXVPAzLLaRzYIc24Pd
	ZrKNkyLVrj1LDdYh8Qvg+ABqJCRlB2CWUXaQ8zjyOMyTKyJd3UiCE3G6sNZPF1CiAH5ii+riULC
	ePsLy9HA7AckXSQIWbKwd5vmloOUOOSVwTbaw/xFW9rbRgN/NECQJ
X-Received: by 2002:a05:6214:5298:b0:72e:d34:573f with SMTP id 6a1803df08f44-767c215fe50mr70480616d6.39.1757711135059;
        Fri, 12 Sep 2025 14:05:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnPEfmxh9SvYDKqxVQYcOajqc191SHlEL2DXweV7tBIxlxuRMvWPEoACAWRiuFYSJsB6Xgsg==
X-Received: by 2002:a05:6214:5298:b0:72e:d34:573f with SMTP id 6a1803df08f44-767c215fe50mr70479806d6.39.1757711134456;
        Fri, 12 Sep 2025 14:05:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63e47sm1413683e87.80.2025.09.12.14.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 14:05:33 -0700 (PDT)
Date: Sat, 13 Sep 2025 00:05:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/1] arm64: dts: qcom: add initial support for Samsung
 Galaxy S22
Message-ID: <sbushql2kigkpuqdgt5w2b5jdim5h2jk3ncestgfgyaloqswpk@gf4pakjdcp53>
References: <20250912202603.7312-1-ghatto404@gmail.com>
 <20250912202603.7312-2-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912202603.7312-2-ghatto404@gmail.com>
X-Proofpoint-ORIG-GUID: vLi6ul53muIn865fvp9w_HHDP1gAWaYl
X-Proofpoint-GUID: vLi6ul53muIn865fvp9w_HHDP1gAWaYl
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c48b20 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fUB9F6JP8phhdykgREMA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9ZLbFkHpHK94
 TWW9CD54NGo3OcYAkd3vkpP0GxWIyfAGGm2yl4vD/AJ9ERq/vJ0hJc6g04xtJaSugxTFg9HYhgY
 n/r7OC0jjSZNZ9qAyASNx/tffPontzTLp1OPswEPxU7d8eWEjlHouBGvFV3w5YXnNXP+GvwmZjd
 O4NVKi0yGcuJeAJXreozzLFuPLV44dQgxwd15sSEU8lHXdp4uD9H/2/6RNbRzVvKOL562y/AZAz
 uBnMCGd/PM4w+L0D7vWODIJlGOInWWRSr5n4ioQRG0fyvBgz8RKjANcd1AWMFv1A/aLhiOIrRE9
 lUhncgvhuO8a3yNBbMq31DaxzhEvEmNTfYv4A1iotaK1XxBnox5QJX72zgTugCYwDog2sEZSmcc
 rVHZPGGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Fri, Sep 12, 2025 at 08:25:57PM +0000, Eric Gonçalves wrote:
> Add new device support for the Samsung Galaxy S22 (SM-S901E) phone
> 
> What works:
> - SimpleFB
> - USB
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

