Return-Path: <linux-arm-msm+bounces-73465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F5B56D6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB8AF4E0630
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9901A76B1;
	Mon, 15 Sep 2025 00:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7G0htjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DCD192D97
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896472; cv=none; b=nWu+tnTQTu0dRZCFleBw9q6geSYfl4TCzh5zoCjux5MCkcoj9KORZ+ZSEzFUzcxc6daZUdNbAsXKDoy0s4nIxFzn7QyZb6+QuBo1R2TXwQIZJALDlJs0W41YMdRAxOplhPbRBfs5Qk2bvglsG4m6gbtTg0mrXvK3U7yabmnO22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896472; c=relaxed/simple;
	bh=gnpTXz1hC0YULu6XjlDdXqEaN/yyxOhWnkjpyCpHikU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQeQeLD1NrRP6uhRmM4UHW810Mybn+dmYvYoC+R30odYUUVVCP3EnFgBiWX3Kz54PJwABq2K6Xzs3Yz4Py0+UAg/WxeCdtWIFRW5cAA/zOeqSaPskZAC+u5Y8/yVswCLJvI30PVxiSTcXQD1Mj8qUbopsy91SmkLA1BYJUsfDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7G0htjZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELIQRE005907
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j5ola8LeytkGQ8rZLaP2dj6T
	nr7eP4J3lVcQKMOGykg=; b=I7G0htjZJfP7+Sg2Rhzjdtk8McHddBYyEReZ9ZTm
	BBTzzrxpOzJY+s0s4VuxBuxBdk2ahdYVw7zcHJYDyvLeTW9Rq2W/iyukCanscyYM
	wHYTBeFp+4F6QZD1gl7Skuid0HwCbJU+rYX5sy7oZ72F232g8qwFGRhLfLj59Y5f
	eJHGNpL6Qruv0qI9LAQW3do7McxLtwXbUUKPwVsHeDGwfYXOEcgEFKT7v1ZCQ4i5
	kkj7zShQV4VTXOTOzBj/+KHkyL3/HmX655p3qSexDwQb5Mf1r3khi463eNgmsJD7
	IkCn62O977LJ4IySdGenNwcZk/ZB7SJ/m+KWnuQTGygRFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chax0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:34:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5fbf0388eso51708061cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757896469; x=1758501269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5ola8LeytkGQ8rZLaP2dj6Tnr7eP4J3lVcQKMOGykg=;
        b=T6OllE2zOSJE+Gv4JP79Z8HifmADeD0/qkA4yidTMbZXwngOfM/6QLKAPWPKjM6mx0
         SncysX2vp7WAYsnow4mEQRcxjp0x7kMI2wwCfJ0mqMcNy6Mt+Z/57Dvc/Zhvn3RLuiMx
         Txf2Tr7WIMzWLyitd9l+SbtKU+FHiYuU29WrPi3K7kccBIjAlV2jnv1IISaJUJC543ac
         9A1PaFoT/n0cwmut/DMqcHHT822hIr/phgc+6HdjrWCxsBz4eeTHz+Zjttd3CW1myldU
         qicrxpKl8QrCk8W/njXeSDYNUYwez6TzKRTLGXUMQgRaHlO1/kh+AMTvLmcSt7l77SF1
         9wMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQxuUtH+rZ9L7p+uYNjhvjKw3C6CVBqj8KjF8VYOxxv7EF68AOoc3ztLQhP9Qboko7Fhee7pEK3mhQK/Rl@vger.kernel.org
X-Gm-Message-State: AOJu0YzzoxVoge+FnkXItW9HnVSHgj9vzYJJYZ7TZynL05PX+5bLTZ6h
	BMsNJl989ZL4sM+oqONkk30kaCCMf1x6vJsKqx56gZL5ubFO6wp0gd4dXprkQiORGXk9VSghjon
	XSMUQ4gzDR1XkEk+F23TQR2EuHyjLpVAIsF6L7YACbMQOWwQ5Z4+nCfi9csdZgRkN31Re
X-Gm-Gg: ASbGncshvM9ntoYJ/+HqdE7bvWQZtjosTAZlv+KOTfqI1+i88hBig6UFiRMyOcn7iW4
	2jQMOan3XqqKKMdu61o8j3kycMdphJsi2ujsoio0/MIJndmbTOMtHKDZ8ILeJopQRO0wVZ8PEck
	llqr0Uf/BWxcWeD5k1TPTOgTrHmQZKS3VFf4Dcz+ogxNXcl3eIFEeU0vEzAqZ2HUZZYo+0tFL4j
	BmeXqPzq1RyUN750oaQv34clT/ddSsB6kLYqnSFCti6uGeyQLMcFqiuVAVsHk5e7s78szsKVSTj
	FzeEyT56VaFQSjGjPZCSWV2RgNPOI3BY5WKhu0aZcyozjJjhORU1wGkwSx2w3a2Oi7oB1scAEEt
	jAza4q2vu5YbdtIc6gHvwEj4GosEBq7TmvIcEtfdpzNWZ2RPxuN4+
X-Received: by 2002:a05:622a:1355:b0:4b5:edd3:ddde with SMTP id d75a77b69052e-4b77d10a730mr130971931cf.81.1757896469099;
        Sun, 14 Sep 2025 17:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFj84HG1yg0KGXTeoOZG1JsrRK4U0R+HdjmP62TNo46rgH37tgO7BjijtTa96/Q4Lf2TTy/w==
X-Received: by 2002:a05:622a:1355:b0:4b5:edd3:ddde with SMTP id d75a77b69052e-4b77d10a730mr130971661cf.81.1757896468594;
        Sun, 14 Sep 2025 17:34:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f163f495esm23295051fa.24.2025.09.14.17.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:34:27 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:34:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Message-ID: <ja4oeddeirvmtqx7lmxxjwp476hskstxmvb7iaajy47zil7bqa@oubzrtrdrvw2>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-4-23b4b7790dce@postmarketos.org>
 <hzqsdhqvgw2cp4xnxocyddhz246ovicwaml2n3qqdooohscyis@3uo2qjlrapr7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hzqsdhqvgw2cp4xnxocyddhz246ovicwaml2n3qqdooohscyis@3uo2qjlrapr7>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c75f16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8 a=SBX87LE02F_xfZc4-xQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: V3e4jxJdDuFdPDvwDjH5fNZL_-a9-Wk-
X-Proofpoint-GUID: V3e4jxJdDuFdPDvwDjH5fNZL_-a9-Wk-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfXwrnR6DUiNGJL
 eWVeDF/ug4Ed3LCj3f31m+MsITVB8L3muuTjo58YrSpgi6HCoFfCtXdK4WjgNTrFtMo1foa5rv0
 MsMHxLAz2ktEavDjKrSAdMgCwB5H42lFTs0Cy0nmg/be/sHUJ5pfrelOhuzdR72LxJiUUtcOj0/
 /i5Njo8qxqfD+I8vDs/V7nkatTKpZ9eV1dW1mqwN7UBrPTYC20A4wSo2hCH6+ukVLM/ZugOzMZS
 BGWN4XTett36XB+x+WOKhHWRyi0xHogUSSKuRAWa87Cw7fFFu8U6MXlQ1SOtJF6ROEOoII0BK1E
 CykAzqSUBVtJp5OzW9AaKHOWeWB0KPDXp91qkoECtvVMhbMD6Mypo1NEpgPZbc2Xr6cLFAxHZxF
 gde/AO6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On Mon, Sep 15, 2025 at 03:25:45AM +0300, Dmitry Baryshkov wrote:
> On Sat, Sep 13, 2025 at 04:56:37PM -0700, Paul Sajna wrote:
> > Add the camera flash so it can be used as a flashlight
> > 
> > Co-authored-by: Amir Dahan <system64fumo@protonmail.com>
> > Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> > Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > index d6129ce03f537f0c8c78c2ae5f39be6146cab7dc..df826bca2bef5e3f85cf49708020a47b8d6bd8bb 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > @@ -604,6 +604,20 @@ vol_up_pin_a: vol-up-active-state {
> >  	};
> >  };
> >  
> > +&pmi8998_flash {
> > +	status = "okay";
> > +
> > +	led-0 {
> > +		label = "flash";
> 
> Not allowed, please drop.

Okay, allowed, but still please drop. See how it's handled for other
boards.

> 
> > +		function = LED_FUNCTION_FLASH;
> > +		color = <LED_COLOR_ID_WHITE>;
> > +		led-sources = <1>;
> > +		led-max-microamp = <850000>;
> > +		flash-max-microamp = <850000>;
> > +		flash-max-timeout-us = <500000>;
> > +	};
> > +};
> > +
> >  &pmi8998_lpg {
> >  	status = "okay";
> >  
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

