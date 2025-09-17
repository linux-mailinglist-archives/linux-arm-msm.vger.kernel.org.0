Return-Path: <linux-arm-msm+bounces-73931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6FB7F871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6CEF17A7C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2C930CB4D;
	Wed, 17 Sep 2025 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Axf5Qmmk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883C431618D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116472; cv=none; b=mD8PCgG/03CN2LafLvRj8yVq+pe+TOtgZI5WHD0iGnXg1yr9mPHqZ1pLhqs1go1WTqxdhWeKDIwu78DocFLFerNiBDc1mtaL4dyp7t1GlEKKWC/XHrdyzfWcw+gBE2QPfJEoj4Ex+k0KIwEAq3AbavlDezzLLkkbw3ewxSBXi3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116472; c=relaxed/simple;
	bh=g0He+fScWmFw3Wrgr6o24cjCzpRTesI9T42kVWMJSnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1hQjs4KyRlQ5L/7wa4UFiXt8ajQCYlwt2JWnYV89zZYYYRfEXjefI/QRhEP0YSkCM2ZhSYoOEFX0IZ8BRs9vV5C/oCsI/2MlTXWK1v0S9t/nMwolCFuMko5Dzyy/gQ7G59W0kea8QaQJjUvB2AaAjcINPAQcuQBku+RlbbqmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Axf5Qmmk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XcdG029909
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2alquu6If2SsvZ4fYTINgicB7yPUpfZ+7K13zW+7ZVU=; b=Axf5Qmmkeo9hEM+P
	uyxbaSc1R9Vztwualh5MCCoa2Nn3SZZm2/Nmbdv84VF2ZFeDiebbgkNpDL9TRJ1H
	leKghxxHoyjtMCGOllQmKAFGyoeAUtROurE3cJdzgQwle94b9G3+shrS0bwMU3J+
	I9W9PJ+FE0Yq7+jPGtxMAfLan8B4cG6PEh7LMsoY6dq5CE2B8XCkJJSer/FK6YyC
	gOAHUVHt9Tl9F4q4etkAfmil3OeeJF5F74/F2vxtc07Qo6ikA5Y1zyOZxzet5bFT
	3sLXHxKXNBLlB7Rfl2auruqPaN5v9SRPytgQXxDjQrL7ByzL+D656JKiPJLkhj/c
	QqAVzw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxjj8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:41:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78ea15d3583so14117406d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116467; x=1758721267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2alquu6If2SsvZ4fYTINgicB7yPUpfZ+7K13zW+7ZVU=;
        b=IuNbYzW3CyK5CVYjc0+2LxX7Pli7nc8wJ/0Af2CHS+wwCBVq0r2o8HL4e9OaiL/DSC
         QOdgDivn713RLBhmO57JLYJmA3Urpe6C7ErTRWI+BLswNdeEM152u8VSNiEdhITyUjrk
         VSixE0Mu5/yO9UeybjLci/M4Fx3jJ4+nKPwppIhB3gtFY/PlhjWYDojUUzDsFuADDGs5
         7MYcAPf94Tn/f4lQzPi+b7meCpHRsLHxnoGZTuE26SjNYVkyvJRcSGsULaoDDfjyHMb+
         uICu9VUtHBBKwqAalpX0K3arN7rnVwFGZBZcXgrn6bdd2m+UCQg4+hEj7wrpebPTr0p5
         nRGg==
X-Forwarded-Encrypted: i=1; AJvYcCVBDjKP/Mxhlizy6XXcEtnVyyY+kn2zhdWSjRY+UXh7+O4y2psJtZPBrVjkFzK13KUQlHsBe5Qy5PHF3PYY@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9SLUN0CBRND68UUcYm0NpoHCZibZfyI1EdMFctmoUZN5Zd/e
	ZDlHZ0ArT06l8R3d7yfTsqmamLpjUmNZIZKZS7RY8j0zxxobCMqCCQP20ezbBTCEeM4bNixJP9Z
	ePpXDOVxjo6fQ37KvVqrdUCyBsxaNLPA0U4be6dY3dH1sAIsrDCbwfECAgo+DAWTHw7Bw
X-Gm-Gg: ASbGncusSsBHuj8jwryxnh+p7RtiK6a7fJ6fOA4/Hn5+uZ/FbgYRnQmypizxReCXhm2
	2CbeI9ojcx4JkHFVkB8hBsEURmHk3+uBbzPIYmQ+XjUIDiEKDj3BThU5a6PFg0fTvfx8rCOV+Zz
	GmQlu1X1eL92dnJbo6b0s2tJKsNts43JQ0i8EWNQZpxIH6aIMoeh5Ovxdptep+e8soSpOmoSHS+
	0enAeqo2MUZo8tHdC4D5bA7+ucjeVfTBmPm5jaivlfAZEXtWLijdYo1+WE7dN6Wai5kqA9zp2y/
	rrpvarhvKPkzSM50cXC/EBxrGti6KMuct7sxfWPH1qkGmMpnIqQCY5Bph6ysOADSqiU5I3RtSVf
	ifdURrKsE2vWUjbZjG7pCuzn9gnqMS7LoAYGLeQlkXvwUCC/iRPZS
X-Received: by 2002:a05:6214:4892:b0:791:34a5:8682 with SMTP id 6a1803df08f44-79134a587d7mr2378746d6.38.1758116466884;
        Wed, 17 Sep 2025 06:41:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG8CjJ+HmCrpSHuGNrLJMUXXobGCkzRxl+dlfY1SXW04kxl2vskOrhELTFh5H9YnapKZMXaw==
X-Received: by 2002:a05:6214:4892:b0:791:34a5:8682 with SMTP id 6a1803df08f44-79134a587d7mr2378216d6.38.1758116466202;
        Wed, 17 Sep 2025 06:41:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f15a5846asm42557711fa.5.2025.09.17.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:41:05 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:41:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/3] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <gpnnlwwvgip7cew4y7jfzzt2y532bw5xdabud5ulntz6hvp6g6@rvscoeoyeb43>
References: <20250917-hamoa_initial-v12-0-4ed39d17dfc5@oss.qualcomm.com>
 <20250917-hamoa_initial-v12-2-4ed39d17dfc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917-hamoa_initial-v12-2-4ed39d17dfc5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/fwkS7Hr9bE1
 SKmDwM4tODMAZQvmhEnmz8aaS9KA+9JIugufm9c4mvxrYDK5mh4FqrZnZGUY2G9TcGvh0I8KwRU
 SxbncJbfhTFDm5AwbiAr1s0FpngWfNfHtGulizRpL5c2IbZeZmcqHMO8t4qLNG0jcCklAl8SJxJ
 dAwhS3YuVyESNeETXieuGSmtrZ8k8fPFN/GZ0BnsIUOFIAozLHdZujuYtLE2oYhIWhfO+D1Izol
 pp4TMrahp7bYDhWVJCDwWy7i+f/qvx3AYFiAJ4S3ACt5yT9mehF+NCcoQWYwH9w3kYH7sFYHE1K
 DRkTzXBClvBZPVwpYLLQTJE3gePhJqDFfOZoqOnwaIOZsAR6vIxOzJghXMvHE+nvCgE3KBp0uop
 cEvZQ/YR
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68caba74 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=PhgHo22kut4TJJxNvVMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dNaCOTyd5aHK33hatLdBoKO6hEFOubcA
X-Proofpoint-GUID: dNaCOTyd5aHK33hatLdBoKO6hEFOubcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 10:58:59AM +0800, Yijie Yang wrote:
> The HAMOA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1e80100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> Make the following peripherals on the SOM enabled:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - Graphic
> - Video
> 
> Written in collaboration with Yingying Tang (PCIe4)
> <quic_yintang@quicinc.com> and Wangao Wang (Video)
> <quic_wangaow@quicinc.com>.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 619 ++++++++++++++++++++++++++++
>  1 file changed, 619 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

