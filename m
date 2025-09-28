Return-Path: <linux-arm-msm+bounces-75399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF4BA68BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 08:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 467093BAB06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 06:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF7D283FE1;
	Sun, 28 Sep 2025 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuNq7OuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB322620D5
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759039893; cv=none; b=XhDbVr3s3B6q0HYH3OKO9K2jvZvFufH1fZ0VpFVGvhjiKrtruAZxAgNUterptc5358noC1lzjVe+tvCziPaTfyUudbxjIdrXWKXvPIcdI12O3d5U4VpBObhh8mHDmalL0IinOnT5fl6HfFUlEWo+nPblsZZkRlK0ptAonxZbw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759039893; c=relaxed/simple;
	bh=6EeLItj9RgH/iM48wpNqwHT1GBX744iD0+SHhEj2mxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCLy/0P0TlVjHRN5hyI2kr/geyQCZee3EG3FVRuF53DOl8tqzCpq6E8HIChulTFGh1IuxVFGCkpQfgySejkhHvXLHjumrw88h5Zi7CeG/MXv7KEJG84LyUtBW9JZD1bWniSBkJ2biUZ3mvdAaUrdOsRBnkh0BC3vTxsizwJj88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuNq7OuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S0rNGe010468
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 06:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0y4r26rmfntPrF0VgZDFQuaSwpW4geYVgGCdzUjQpo=; b=RuNq7OuN3kDmT8W1
	aqOiKKlUwPa9Rueq+DMOSHvJRjYzZLciVeYThwt9DZCqOZgXwzWq3HhJ9h6U7ANM
	97Di47feW6nTz/PMY+Gm0KhekbJWs2JHq9hTpCE36NUBx1F13XupgV7rHozpD0U4
	6F9lDS4DFdu5tyZhGsITRUoPSH0277fdj5Z71noatcKpZFFZ6eOis4ESVTx7quoT
	66swkt6mJOj3jLqJCouXi+jt7ZMf3nwRmrbte4sProqlfo0HhO8aXvTiN6CUp2lK
	YesKRObkCWJemiba4guNX5CLWvG5luAgpaakOx2LVDSrDz8AiU9TZ3sW0h3B++Yu
	RMItHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5ja8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 06:11:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4deb67c61caso38172261cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 23:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759039884; x=1759644684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0y4r26rmfntPrF0VgZDFQuaSwpW4geYVgGCdzUjQpo=;
        b=hwdixrNlcAFzsLNwnuIVTZ5nR9su8DTRylm+q24s8RenyX42BM+oLWLcHt8gLZCAlq
         Cfw181POlWqcZodWJs0OSpARyFol4/tvmX3Bncod72twQhPGiVwDQ0tHisnAy7Rb7OK4
         4qhtRGka382M6gOzggGX8EEdA0YGzjMM2xhfovU7kBjd8QJ0yF49b9hJT64WSl4lLlBA
         k9FbfzuzclR+AYFmj5m5AqTR4temXUGtNz5UfvK2qVeJPAL4j0eUySUX5kfUP9OniMkm
         AfkXA/aOBWB1YntEQh6ci4f3zukX8zK0TSVl3h6r7MIkK1ARebGNlNhJKWSrWYOAfMb7
         nd5w==
X-Forwarded-Encrypted: i=1; AJvYcCU5JQF9w67gmJJkIDUSFJDUQqU8ZVOPqGQ7nCAtkemRkMOWl+K7tJXSb5PJmQvKVApdJdioQ3GxfARpkKRz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2czOwSJ4sv/5qYdmsRl5n/65fwtBRVEW6DXgntblMGBW0GVZT
	gvu6rQWlH6eDW7FHH6KESJ39tSIoPk4IIitFcD/giene1wyxpj+2ZkeRuX0DEKmMs2HM3c03OkS
	FiJ97AQ+rOzYr9XnYA4MgY+ae8jzfNaDvttv949r8zIGWwwDaHGwkwEArsEgloEgyVDo0
X-Gm-Gg: ASbGnctYjQn5W5h3FhsRXVV8pxbsfmOxVZACaKT6DAvGoYVeqzREwJ4P2DUIM7043pA
	bMl3lCFAUXZ/dLEfvRJEjzkNY2v39BmNigjQmM9f1eVbuo+8/7X7gEkDuyyEqeK2w9QW2eh7h8J
	hdx57joTU4rSaajA7HeMWifBa+7Iw29hcuiMaYYCpvYsu8H4Tyra5tLKPXb8QEhFWOif2culk5I
	O0Orz2GAgXHNNHx0CHRUI60nbbm63wEfNNAhkzwdV4i2XzE3hzlt4IvIg09GIXhDQ9ekLebqevX
	6qN8aOKJGwsu7FncWW8I7wrI0ncpwS4Apml/gPt/2MsjjsrF1q6gLd5By32shUT4O/+88oSM8Rg
	Mp4I9ZTvABpMSCM9jPj1psf79gYWLkGLY2R1Uyx76iwOW8fbPiS4D
X-Received: by 2002:a05:622a:40cc:b0:4d2:c24f:848f with SMTP id d75a77b69052e-4da422ec59amr161136521cf.0.1759039883853;
        Sat, 27 Sep 2025 23:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCFI031F4POmzN8xNjPo0knLdtXvaIP0iciO46OR4x2yq72HuKbRGQbQjE9f3v1Uf95N7c7A==
X-Received: by 2002:a05:622a:40cc:b0:4d2:c24f:848f with SMTP id d75a77b69052e-4da422ec59amr161136231cf.0.1759039883378;
        Sat, 27 Sep 2025 23:11:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343113fsm3210443e87.16.2025.09.27.23.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 23:11:20 -0700 (PDT)
Date: Sun, 28 Sep 2025 09:11:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8250-samsung-common: correct
 reserved pins
Message-ID: <oi6hdvxqcble4qikfngpqc43glf6nwl24oh2ukdqwautbt4jui@geuzqecdqgsv>
References: <20250928044533.34798-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250928044533.34798-1-ghatto404@gmail.com>
X-Proofpoint-GUID: zPLt-TRNe0RFd1iRNtta4LZYN7xGU2yF
X-Proofpoint-ORIG-GUID: zPLt-TRNe0RFd1iRNtta4LZYN7xGU2yF
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8d18c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=rMa14cLU_uRGXJEyJrMA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX4yeCML3do96t
 KIVAklN+5z1NiTNlgOGqoYfW0rIQWe2XjJKQX4tQZgI76Pb5Ex28hBCNB0QTj5/W+HGCUnRR/hH
 53IDOwiV0cHj+ZQlkqgSwKR9uTj/YQOeGjpff8SOpeFU1Nb6OuSgRQVfktmaX06hL3S9aqYbQP5
 iX6SqGz+OQz0q4YsNggRpFTeOyawK8Kxy62DcYGbaajZIXoxWkqCQL4E2+4Flrr3seqP6/M+6A3
 gXt6ztD9F9hdDUOzWf+dvkNxR5HmzKPmj8NY5ablohG0xoJY6/i8iIVCBIf/1oBi0hpAide9Tgd
 8kueafBmOahOZQ+ErnGy+xxitC49XvyHO2xuqQXwth+7uLDzEMyoJI7tcfSqhL/IR7/0/GhcTOl
 tC3IdvefKYI7E1yfmnm2JAjKWRZEvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Sun, Sep 28, 2025 at 04:45:33AM +0000, Eric Gonçalves wrote:
> The S20 series has additional reserved pins for the fingerprint sensor,
> GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.
> 
> Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
> Changes in v2:
> - Fixed the formatting of the <40 4> line
> - Added Fixes tag
> ---
>  arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> index 96662bf9e527..a87e3d23e3e2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> @@ -159,7 +159,8 @@ &pon_resin {
>  };
>  
>  &tlmm {
> -	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
> +	gpio-reserved-ranges = <20 4>, /* SPI (fingerprint scanner) */
> +					       <40 4>, /* Unused */

This is still not aligned to the opening angle bracket. Could you please
recheck your setup?

>  };
>  
>  &usb_1 {
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

