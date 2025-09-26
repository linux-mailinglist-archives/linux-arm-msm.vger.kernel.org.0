Return-Path: <linux-arm-msm+bounces-75321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A9BA3F11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D2417AA9E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD8814B96E;
	Fri, 26 Sep 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHy0mU3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42338DDB
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894575; cv=none; b=kDGqyXRHOa8OER6VQAJi/FIKZjDWaqJFkqQ9bE26SmlBe+AsPD3JhYYTYXJUPv0+EeIrWj2pv0v0psxS4HXeqh+yt+fP8cyP1TK0RBs7E7esDzQEsQbB3+eK3rznVpe507mQ10v5QJLWdJDP2POPDB5j2e+I+PvCTOjew6EpHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894575; c=relaxed/simple;
	bh=Db08r4WBepijoO3oZHfH0NhL640ck+ontuJnpli7CSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dgv+kyaRsIE+BzZjSMuryUYcIEpJEXFzjkDhZLVDGfPELkH4DExLtYX1MOWESDCEZQgLEdFNh/SD3Um0rtswVQZJ+ZOLgyblxAzqzJwTH0EHuiZJKl/n4T7kHceJr2/naOZCtu46+fY1i2FPTOAu12qxKhfuAY/wGsCOFQh79AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHy0mU3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QBZoPX031823
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WAJX3xDEN4jUGy3bs9jmN30/
	NVEDxtaS7JRNwdjwUEY=; b=aHy0mU3HhuVKURn/uHzG/RePuy4w7/c1pN1+AzyD
	gUGPrtncdpAOn58KAqdTQdH1XLvdAFF6mGtCPW4ntq0q7vvB+ZyK4xVlKzSV8FvO
	3W5WtOees+o8lFEtHIKnDWiX4INq3GzfTzbLdSKtvmqjjSvQ1JqaChDErbwrlIve
	JtcSXvb2A/BRy8z7lAjQXX3/rq1mjHjucouqrPey5bGcublmXP12aYA1fHE1EBxg
	pECSC0Wl0K4tq04CP6HotXt6pDjU/wCdY06erPyelS4HU0f6eYGMZVv2u9bhE8p0
	C702F6qKhNkDmi1BMHIvFphBfqQZH/NCoTJLM3FMzRgQLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dt3g8apt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:49:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4db75c7fa8dso42974541cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894572; x=1759499372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAJX3xDEN4jUGy3bs9jmN30/NVEDxtaS7JRNwdjwUEY=;
        b=b85lkwYJ0JK+j9ynEBwRmQy9tUsfEii60T33aLReJgz2g9Kjrri/vukR7w1CdiZe11
         wLwQbxbe6OD14Vcdu/MoYv7fewE5vLMQrVdDiSYMA74vk9CUS2ZGeZlr5UpSygyKnOgb
         Rqncq5lkhhjIZ9PNbIFOpYuP5gPM9VAOyFOEwzTY3eWQxzLqSA6zzkaOfRJ9ZfD6bQAm
         qxuse3Uq4nYLg03Tv6fCEMQtn6fNyhYZs4LYzdOLA0Udj9pET4CpCmEQC+rW9Ink/ZEV
         1b1Oxzd8u9s5Bavt94WYTQ1fa+RA0/1DNaxaW2o5IhWZ4k37Cv7inP2ux7kaO+VGnFQt
         p/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUk2ZKtubrw3rXeiYUytDw8/JMXiDs1rQUvpWkDMa8gSBAgsKOunC/C5fE2gCJ1qu3PYVZ4DhjiyhUD1wWh@vger.kernel.org
X-Gm-Message-State: AOJu0YwkybUSCKOiWi/qEeQc71lFv9uMDiPB302H8cEspjXlMPaoKpiU
	B6HsYCz7IG2Cz4SQopq2N3BvgpJubFzQmpCz0WRKT/K371tlOQes/9fX7FE9dscqlmnikLlru4y
	JPTDDMoHgm7VlC+j4jX+3WM+UK4v4GS7YyDKvsMqDHqSu35qGpj7otCg3hyo+MjCR+rz9
X-Gm-Gg: ASbGncuJFXRchixzjqSCYitpBNQ8GFTg3zgzRTTq2yxcZqfNsJ1qZAeGLJJszLRhRG8
	Rpkumy7G0A7x675c7/y0uyvxiOwM2/UJLWVi5pdY85YZjsZbE5g58hhlq9Rsd9FW6VafcUwnKaz
	pjQxGcYWNKIUV/1u3zG3A2yM0F1iiaXxOD4pELL+Mh/QBIqeow5AGBsyjin2EzSqGzH5Ty6JaX1
	2Ed9Q5MrsFZNvSnMHn81tnYCFk2FJqJGanfONX7qWJ2HOX/9qNXDI9ZF/FEzp+P253ofFC7PMK9
	4ZqM3LfUggWalvRtUMwEwM0CzW+fFqdowqgIjTycQaGYrLfXXO01WjfdYblVbgzyJJjEHSrYek1
	cXe4jFTVJTgNIYW1cwD617A701PIIschhNh6xHoi3GpO+q7HTAZGx
X-Received: by 2002:a05:622a:507:b0:4d7:bf73:7644 with SMTP id d75a77b69052e-4da481d8f9amr91206571cf.12.1758894571936;
        Fri, 26 Sep 2025 06:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUzL2zGBtiAYNc8MFpZoNaV0hhqhzKYnr3u+gtoMqLy4vqtTE8NEKQG2bMZ9W/WISGzo3mgg==
X-Received: by 2002:a05:622a:507:b0:4d7:bf73:7644 with SMTP id d75a77b69052e-4da481d8f9amr91206161cf.12.1758894571300;
        Fri, 26 Sep 2025 06:49:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm1817869e87.81.2025.09.26.06.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:49:30 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:49:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: pmic: Remove 'allow-set-time'
 property
Message-ID: <s6dqap37vs6ihtsdttvcx6p4sbkbzi5rd4kpa36fwfleei3fss@wdizdscqxfah>
References: <20250926-remove-rtc-allow-set-time-v1-1-76895a666939@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-remove-rtc-allow-set-time-v1-1-76895a666939@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=df6NHHXe c=1 sm=1 tr=0 ts=68d699ed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RuSpVAPlDewHRWl8VpoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: z3eRl1CXhJmPuYyWKFzOE4LE8DXGXW4E
X-Proofpoint-GUID: z3eRl1CXhJmPuYyWKFzOE4LE8DXGXW4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwNiBTYWx0ZWRfX0+2DweSSRwS/
 CNItKnrlqNLx4uHMZdH//zzix5al8PxzYXl54IHTVbga1b4p3vOIi3soL8q9Q4txNAwzk1Ozy45
 2lrw+zMmXbIBmfZJcKE/EQTz/9pzTLrK/NOSXN4aBO9e4UB6loEvyjImeVNmYs2vnWw3TNSp3CQ
 hOX0HvmQy8Z1zt43PU53MplzfLvrD+HHx83tIWv22um/AjVyNfZb8St1/NKagWlkzgPSPW9iEsY
 hvUaM4xBs8INCbZXRtEOddHgsN7b3f/IDB8UP6rRrP9RqwHJtk7kfUcKIioSTY3TUm2fy6sE/2H
 +rXdKFFgeBHfgNkGteXcNqbNzAUerGJdi4B3kpo0GT4p6zB+ycvllXRZHV4uzezGr0XqMBN/0bk
 ZSSYwNsCJM02bW5C4lH1U0HB6kLIuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260106

On Fri, Sep 26, 2025 at 12:09:27PM +0800, Tingguo Cheng wrote:
> Remove the 'allow-set-time' property from the rtc node because APPS
> is prohibited from setting the hardware RTC time.
> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi b/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
> index a94b0bfa98dc39e41d1a0de3373753953609b95c..e990d7367719beaa9e0cea87d9c183ae18c3ebc8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
> @@ -18,7 +18,6 @@ pmm8620au_0_rtc: rtc@6100 {
>  			reg = <0x6100>, <0x6200>;
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
> -			allow-set-time;
>  		};
>  
>  		pmm8620au_0_gpios: gpio@8800 {

Do we have a UEFI variable or SDAM offset to keep the offset between the
RTC and HLOS then?

-- 
With best wishes
Dmitry

