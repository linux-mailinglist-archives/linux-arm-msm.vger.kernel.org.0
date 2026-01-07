Return-Path: <linux-arm-msm+bounces-87816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B2CFC97F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5559A30652B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF622877DE;
	Wed,  7 Jan 2026 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cj6Ty4Tm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqcSjAu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA218787A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767774223; cv=none; b=a+vBCfVvH2nQbJZpSZhApI4L9owz0N8aJrrmCl/eTkab9esg0NP63LGQwIaThRZVX1K8khv5QUZSrhHvenlKLaDlWcMJUPi0yrgSlkdS2hj82exIlElmnCTOk6m84R34ufowd4BIUkOkNXAKx0aMDWyPPYBH/ioKias1+cfJku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767774223; c=relaxed/simple;
	bh=U+hr1QHzRoXMDVWSLlJ/tGwfyehUdIk3yWwMMptr8KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilIpHJd3O/binUgbOZHUh6SrAk0zX6gQZQnWg5ooFYkgmHDlXRougPQ27HE7iAw9KxTs0w7fUXnfwimVP+5MbEcjyWP13EEtD0DLwae2xCTKvojFOObjURsOG3HuQuQ6+VXpMHCI98yhkoKaCCUc3qBIq5c9Zyt5ddaKA+mRiRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cj6Ty4Tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqcSjAu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074m0ww1642748
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 08:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v8RCP40dP9aEqRFT58qu9rDe
	4qvB/NuaEEsh5zktbNc=; b=Cj6Ty4TmkLKhP+JMBoo/+C2Jg2boM47q/TmveQtx
	lsG+Pi0Lj2hZEsFnrb43Sa3LrWiChQh4kgrqrVanaEFCN8ex6s0kqvtvS9bFf3Oa
	D2kmhcJ5JnybKaUfnRBFBqHqP3/8UlIXqQ1ds5DGzXTaIpV33ws3BbJLhuZYQnNO
	x9FBnhYbc+719EikUTMqMyfQ4YoHfrIRG8wigpEpVR5iF76fRoFKGXBQc6TfhrLy
	SfSX/LA4myi6scuR+rYwZt1n7BohWuTVDlbxrGHm1d6xr1HJL34v2dt9d/Ac33s9
	fIQNFbzfjV/HqGp5Td0at4TtSFUr6XRPsolZBbHJFhW0DA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfgm7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:23:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2cff375bso45398796d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774218; x=1768379018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8RCP40dP9aEqRFT58qu9rDe4qvB/NuaEEsh5zktbNc=;
        b=BqcSjAu7nTkRJ9j/Zia0XVkyELB5/oyhzhSwpI/vmphd33o9TjYX52yHq6aENY7oMp
         c997+NIMd0srTNHQroCBhhFox9u2+z1v4UgApZIEIiovDbL0oEFUwk3lmdIysxNvY5jo
         Xt6eqi2jGolWfHVvpqqOlVYFjPaPdEBjk1WQhcr23L8+Hn8iT8S+heK6hFQ3U3tAedOm
         gwRL7r2iQkaKPnfFhUwhbaPo6wC/6vkGWq2rrz+Lxl4gh77lvU7/MLj2hY9oI+xirCdN
         wWsMi5ZmA9CtIhi4mwhRb/Q/NmKzBfxiqD66NSexMwI6LVbgrQpy2F35OwuF7/UZREg9
         CZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774218; x=1768379018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8RCP40dP9aEqRFT58qu9rDe4qvB/NuaEEsh5zktbNc=;
        b=ChGJmscWIriXuZMmEV1ktMq1tzA0+cWguUEA/Mc/GR3b5AmOYPBf5wHZLAd/Gfex7P
         3Wy2s2gYPUSpzYfKhGMfFNREwRlPCXGEOuUTTHuaXzXpVxMBxZrH7lE7MmenktaTNN/7
         E9sGfybD+h9oQ7FItd3OaS6eZaTRQl2C1ZEcdtLD05geXaqyur21I1goIhL3t4IyLlBF
         pNbEZfWZa5cWJuiMO5KEA7B8JuQfptMcrm8UPvp6IEk3LaNPvfhZPip0D927knxyybZ/
         Xwkzx+pQDhaOG3vWfzPFeyt9ZQRVOBRp3OrHCK9Es3cHq68qhf6fCaLJAeJDmV8VFPyR
         NDIA==
X-Forwarded-Encrypted: i=1; AJvYcCVPz62mMxWEg27YVWympaZkuQMR4nJ4tQZCHjmhtyEEgaDrU+13zRdFykAw5Yh/cii8nk7Sr5EWNFsf8tYQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxlSmSFCmcWHpVYqU72wtvv7LwxuW4FH3Ayp9fSevOx6n2afzmj
	M4nkzpcVHQZLR0+DpdsL3PtmSV9DOYj0ubLW3GbjnOvTmHf4ZWNs2vim8KWl4yXMZT5Wg0d83nv
	499Wz3U25Yyd67rxqG5YbWg4IoOQx4rNz7hnB/EyxYOFCjHP1EMfsskk0S+xVbJMj4x7w
X-Gm-Gg: AY/fxX5cQ+CEuYgxKu9/KwRaY7ZI5c3wVOCXUWGXKEci1PH/OIYGeui29z/Y4PpwH5e
	bSXDEAzAzNMD8E8XU8PegjxKSJE2XAaxZaQSI5eE7B1WE8OlpErYc1w9OJPNqkDT21/cT9JHGim
	43FOsjuK1bKXBW4ZKXNDapof8AH5D2Sr9VcTnFlDTb1kankiziGNsOxbLXUlQybBhK/dnZ5urtZ
	CDZuKcrsGJpQ8/L1G8JscUxp6dHHuxMca9MI8WBnYD1qwSyTE8/UTgxSi6eMDcXCOM359DgBqbD
	QRj3yANe3r5fxrdP2T73FDy4CvXViud8nqhMwqVYdv/STbSZvPJcYL0HLjLsUtiXdMIqhtCBrJc
	GAd+RrMyZkMWm1DAILepkIErVJt4OM0lCFmdn520mspynU+DL5HiDHIKHSWNjyXK8IvLvIgo=
X-Received: by 2002:a05:6214:5241:b0:88a:28b0:9192 with SMTP id 6a1803df08f44-890842d8164mr21423406d6.33.1767774218529;
        Wed, 07 Jan 2026 00:23:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD8PdlT66+29ORZDNwqpWqLpJSTYj5g6EYPYXdvvT/i03znW87VXgfapJKyMkI1gFAiZfFBQ==
X-Received: by 2002:a05:6214:5241:b0:88a:28b0:9192 with SMTP id 6a1803df08f44-890842d8164mr21423276d6.33.1767774218003;
        Wed, 07 Jan 2026 00:23:38 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm331833985a.5.2026.01.07.00.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:23:37 -0800 (PST)
Date: Wed, 7 Jan 2026 16:23:31 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/5] arm64: dts: qcom: talos: Fix inconsistent USB
 PHY node naming
Message-ID: <aV4YA6wFjPD8G9kk@yuanjiey.ap.qualcomm.com>
References: <20251230130227.3503590-5-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230130227.3503590-5-tessolveupstream@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfX6PeMNoIOc40x
 a1I87XvMgf12DlGh/Ah4tJk5B3cginJ9hCj0q7a7XwG3nURDxHokpvzEFvuQ0LjbayAFsqFSt4o
 IDP5n/9R6qrI+0yrNUswGSKsJWR23moFrqTEDCOMj1iLMDC4jf4DAqeRRSKxJ3M6FdLtdKj42od
 IWG6YndshnB5yPAOFQ1i3hRoDNrnUYwN6rJHO3g3JRoLuobQqB9l43m2R2CsAOYg37w/XhyjFjZ
 5I7Ulc4b1JmRElWVG94xj9R12ClQQzSxHjWMIBSyxWN0DLfbpv0g9X8X+RWLozg5fBw/IH7y7H9
 ruRC/ucrwpTdDzWQg8Bo6eT8MQmpN7C93Ruch01s+K2m3+36uAYqdMDvOaaLYOyhiNVPP0Nw0RP
 T25PfvPJFGVYS6r9VgI4zWfn1LsEI6BwiqcfWSkaRILpqdna5OwhTNwuaA28PaY6hlM1iaVhGn3
 drLztlp7QonHxiYPOYw==
X-Proofpoint-GUID: Oo4-IsUvOTQfG2f6k9tUPa_ZVKk2T6wu
X-Proofpoint-ORIG-GUID: Oo4-IsUvOTQfG2f6k9tUPa_ZVKk2T6wu
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e180b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=zGslM9qC3G87EoaUpNwA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067

On Tue, Dec 30, 2025 at 06:32:26PM +0530, Sudarshan Shetty wrote:
> The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
> and 'usb_hsphy_2'. This patch renames them to follow
> a consistent naming scheme.
> 
> No functional changes, only label renaming.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 95d26e313622..c7dc507a50b5 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -4304,7 +4304,7 @@ osm_l3: interconnect@18321000 {
>  			#interconnect-cells = <1>;
>  		};
>  
> -		usb_1_hsphy: phy@88e2000 {
> +		usb_hsphy_1: phy@88e2000 {

Here just modify talos.dtsi, not modify qcs615-ride.dts

we will meet compile error.

Error: arch/arm64/boot/dts/qcom/qcs615-ride.dts:635.1-13 Label or path usb_1_hsphy not found.

Thanks,
Yuanjie

 			compatible = "qcom,qcs615-qusb2-phy";
>  			reg = <0x0 0x88e2000 0x0 0x180>;
>  
> @@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
>  				iommus = <&apps_smmu 0x140 0x0>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>  
> -				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
> +				phys = <&usb_hsphy_1>, <&usb_qmpphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  
>  				snps,dis-u1-entry-quirk;
> -- 
> 2.34.1

