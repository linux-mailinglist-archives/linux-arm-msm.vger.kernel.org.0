Return-Path: <linux-arm-msm+bounces-81456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA7C5373B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2AF620B91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C51341AD6;
	Wed, 12 Nov 2025 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdIZWY56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBmorgj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C89341677
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959751; cv=none; b=oP+dh98raeW3hyqax5fpQ+WC5QbR7pNJRpKLV3mZ6Vx0UYSGkQOTFt50RzAJXVqUZNf9mdCqg5jWozA2712HlBy0NgnoSljJkE3OChO8L6yi9z2hh3nHvmnwgIV1EMIsZ89cIbRRUqYe/rkk3qIOljmZ799hOuh8Jyuz+A8QKkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959751; c=relaxed/simple;
	bh=CfT77znIg9qdeT1Z4VjNAk8vqIo08d7ivaszU8MXIws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QY8+1DWo7gn6b3CdAbTnUTa7+EdG0iqwp7w00/LtHRdWVK7v08fIVHFHXmxg8CtEHfwlITuzcNC0QTA9fwrU9PfeANbT8VUruE1UFhRt8JnFBb0JO7wndI77ReyN0hwjtKYtaltPesRGCcWn1+U2Sf9fGGFGdC20XOQlO0+yc3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdIZWY56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBmorgj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACDsCO11314293
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9PwAEKpczd8XRoN6RgeDHwaN
	B5Dd8dXsbN63rEAf4lU=; b=OdIZWY56RLFypMiDBZMb8JTFBEG9ggXGawUiuOw1
	6vYu90286O9tCJTuf0jGZJ2VH/j7/2+GiSPSlyTm6/WKy2nU8HlUpv+1o2NsV3qU
	L7aj/GPnCo1lucGgMeVfRoO961pWqGkm/wRT/jZMfV/94j6vlLtwqeLFBNNrfF6W
	9cMC8x9MxqojE8BNmoDRnT+FIi6sJ4oStSMPPH1ykBXXFGvlf90QZSETL+7Fds1r
	JuJAKONXGgkJ7/+aDjVuop0b/Eiy6IeCLCPSMRoQusN/eYB4rWqayLjti1kS33Yg
	f1K9mM8JkjC9JIVJDyDMKkADlc8FQhgxruTN0Awa44u2LA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuhg073s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9371fb858afso618835241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762959747; x=1763564547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9PwAEKpczd8XRoN6RgeDHwaNB5Dd8dXsbN63rEAf4lU=;
        b=eBmorgj2al/xba5Y07LZl8I2D3GUmQk5CwNNjUGe0rC0SIZ8uTyI131PGV/X7eD52u
         V/grfCx5TxRLDmrVKtFBkY1NB4wGN9RZ7h2VQH1AskNm4ErgqlURplQthkpy6EZs4toe
         JQLsVEjkh+rCFZ7zTdiIdJunvo3OYDGqPWC5SypfAaKjUCGX8y4n/VhiewIOUrwGX9o2
         b3VUkK2E4w18V3Z/J59t5uvmxDdBok+Lmxj7xvaLCTKKwRajc58r6ki1wVgfu+KxCUhn
         f9Qt1X+T7E1HOGWYY9C1d32f5HTO4aMhB6GIrGh5E1CTPm2FmORTo4epuJ04jPw8JPtB
         RTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959747; x=1763564547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PwAEKpczd8XRoN6RgeDHwaNB5Dd8dXsbN63rEAf4lU=;
        b=R1IaU8J3dzpWJAR1W/7LYBU/3TcuOPtN4jcxPzzRVyqQJdNf9ZRI/UEtgG8uizRMY+
         1XbcNN5W8K4eX+CVSRGWxJLgz0vBHnndQFH1z/elQzkP93GqZBVWTOr4AkN1oj6PMDa6
         1++zqUFFlJEo7TEQGx2NFop53Rv8ZPoRK27tx/I5900q8G8ft2/Ql1BMVlsu7NdMO0w8
         K7SU5P9usFhc2l4enBYmm3GXmshlBHUSQfPLXVev+XegnX8zq+jwVNI8AqBw5vfTaXS4
         d79UB76B65/h3LGDb5IkkXMbez1pmyFfF9q9ypgAuGeJuyGXdx4oipS7wN+aFjc8tfXJ
         77Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXk34HdmLZm0ZjIMGe3qd9/313U+xI3GnoF0pMbG0wfn7EaR1XoM9Tqwwu57fOhcTgg922sF66dP0Zgd/UF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywne6GmOX12M4N3dWH0FLBcva2ptUqb2XXOwz4/0vDXhgMl0mSm
	HyTJ3mJonBnVy7/JTPhEfWilUb0QyUaaNZe6Rus4tZ+xachignY0pTuEqmjYvTOlab0ANHuVdoT
	BT4qzrpPjbBt6vYKB6Qw5ARJVtEnmxbz7V62+6MwP/+3SadaT/DL/xHTKgeVzZcuciVNl
X-Gm-Gg: ASbGncstGxwvZTwA4t/uKwfGN7ZSiOXiG5iNoEqTF3e7MjisgrA5Z/icVHRLnM19uXK
	xOaYjkdqxzCvYcuTUzzhIKNQiWmBWei8H05IU55MWQ4NSZ2WxLIwJzuICyDR8wNvXBbzvYei+kk
	8IXPEQGSciztWfNR/FMTobuRpQu+DGWP61oLIo2nX1KfBRC03rK7dECmcIRSoEUsdd2Vg5hvaWQ
	7Kf3JfgcjqYNUoEi0lEpR55be7BUoeXlXnDitluj6Jh0jABOX1yNkLRMT1/wtlw7TZrryyfFrtM
	sIqL2asadORClSu7GgnjeuK0G7RUnIyPhr/1KLXFDcfpbtUJdk/SzO4CY7yUaJ0sGc459Ve8w0I
	Pl+dCFMdq1ZjrPU9a9oP9IoUK44+oK+f37I++aCVotAa+Ghz/kMro98HlkbfaerAWjx9hnbDZ6F
	wzWisOymtLmESr
X-Received: by 2002:a05:6102:1621:b0:5db:d91a:ff38 with SMTP id ada2fe7eead31-5de07e29c50mr957357137.23.1762959746997;
        Wed, 12 Nov 2025 07:02:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFje5CR/7zyERYG2PUvXBh2UoOiDNi3xoVPPlazkQeKcFFMRcCIpeMZ6qUlePdrr38PAGnB4Q==
X-Received: by 2002:a05:6102:1621:b0:5db:d91a:ff38 with SMTP id ada2fe7eead31-5de07e29c50mr956797137.23.1762959743942;
        Wed, 12 Nov 2025 07:02:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5957b2ab3f4sm615018e87.89.2025.11.12.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:02:23 -0800 (PST)
Date: Wed, 12 Nov 2025 17:02:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 rb3gen2 industrial mezzanine
Message-ID: <kosvayxmpbngn56v7t734f4qqrc2rptkjdd7q5q23brg22dvov@cxs7kzzuapim>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
 <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NbnrFmD4 c=1 sm=1 tr=0 ts=6914a184 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dL66UOUvONAFlYJuld8A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 6xQTQEyB_c3QUC05MUh9NlsSOW0Gg-CM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMiBTYWx0ZWRfX1f/fsw2jnH+l
 iXzkslpJlsmV6nkpVyVg8SVM6wIW9KlaqQ5X+uPFG+KAft4FWQG1maniFXitFanJITkxQOxUa8x
 JPFinJsXpZMW2PEA3TklA7c4HeAwxqdAFQyp+ld5O7WRsZwCSHgEZOlXk89W1fvfhe1SmqvjD/Q
 T2AWFbhqoW0m6AZEl2+7LGh81h9DTJoqLvXzXS9K7LvsN8GeR7/Wmazy8GWkXaFm5DM5ZJ50zRA
 DPJiBs2NexSNB08jovLJPb10nAkcSaitHjyFTFS6yhqYDNE8yvegJIP8RTQ7k+1QsR3w+tCDAbQ
 9UkpZZxVpE2yyVfRnU6k2VI4h6fqGbqofN+bDUQ8GEOZTJiZ4eOK2WEeHXgsYl6bu+NsOZqx6rR
 SKX7Bz2qjzmkEAAg8vvgt1/oLFwz6Q==
X-Proofpoint-ORIG-GUID: 6xQTQEyB_c3QUC05MUh9NlsSOW0Gg-CM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120122

On Wed, Nov 12, 2025 at 08:18:11PM +0530, Gopi Botlagunta wrote:
> Below is the routing diagram of dsi lanes from qcs6490 soc to
> mezzanine.
> 
> DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
>                  |
>                   --> SW2700.1 --> dsi connector
>                               |
>                                --> LT9211c --> LVDS connector
> 
> Disable hdmi connector for industrial mezzanine and enable
> LT9211c bridge and lvds panel node.
> LT9211c is powered by default with reset gpio connected to 117.
> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 619a42b5ef48..cc8ee1643167 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -8,6 +8,112 @@
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
> +/ {
> +
> +	hdmi-connector {
> +		status = "disabled";
> +	};
> +
> +	panel_lvds: panel-lvds@0 {
> +		compatible = "panel-lvds";

Please describe the actual panel using compatible, etc. It's not that
this is some generic uknown LVDS panel.

> +		data-mapping = "vesa-24";
> +		width-mm = <476>;
> +		height-mm = <268>;
> +
> +		status = "okay";
> +
> +		panel-timing {
> +			clock-frequency = <148500000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hfront-porch = <88>;
> +			hback-porch = <148>;
> +			hsync-len = <44>;
> +			vfront-porch = <4>;
> +			vback-porch = <36>;
> +			vsync-len = <5>;
> +			de-active = <1>;
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				dual-lvds-odd-pixels;

Add one empty line between properties and subnodes. Drop empty line
between reg and dual-foo-pixels.

> +				panel_in_lvds_odd: endpoint {
> +					remote-endpoint = <&lt9211c_out_odd>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				dual-lvds-even-pixels;
> +				panel_in_lvds_even: endpoint {
> +					remote-endpoint = <&lt9211c_out_even>;
> +				};
> +
> +			};
> +		};
> +	};
> +
> +};
> +
> +&i2c1 {
> +	status = "okay";

No clock-frequency?

> +
> +	lvds_bridge: lvds-bridge@29 {
> +		compatible = "lontium,lt9211c";

Not supported in mainline and not described as a dependency in the cover
letter.

> +		reg = <0x29>;
> +		reset-gpios = <&tlmm 117 1>;

Use GPIO_ACTIVE_foo

> +
> +		status = "okay";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9211c_in: endpoint {
> +					data-lanes = <0 1 2 3>;
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9211c_out_odd: endpoint {
> +					remote-endpoint = <&panel_in_lvds_odd>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				lt9211c_out_even: endpoint {
> +					remote-endpoint = <&panel_in_lvds_even>;
> +				};
> +			};
> +		};
> +	};
> +
> +
> +};
> +
> +&lt9611_codec {
> +	status = "disabled";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9211c_in>;
> +};
> +
>  &spi11 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

