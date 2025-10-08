Return-Path: <linux-arm-msm+bounces-76364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBEBC440F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 12:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E4593AB796
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 10:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591312E2DEF;
	Wed,  8 Oct 2025 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d382UR+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A892EBBB7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918131; cv=none; b=Rl+8DRjgFmmyfK3M2pYtqIe9qKv1vqK7RazSJ+NB79R5BwTO0O/WdvkPT2jmhk/zODMI0h0BqEo1YmE5vm9V/dhmAQjXN9a7mL8si2poAA2oeT0OjFh50kBSWrbVW0/HjW52ST8q7BhB035xvQsWRsXAITs1MlhcU9iQ2KynTVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918131; c=relaxed/simple;
	bh=zuOs8T7fLtRsx2rbN/SbWVW9SGMe07Bf6XP12sXbvSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2JRLlb/TqJEK+vQmGdpBI1FbeDgD1Bw7gCwUuQG+/PQKfLZBbw69e7RuDrK+imOwHqbolr9+eEvdXdIWNZFUgs8g4xhdLXxqj7XZKWFtSu2zsJcktu3oY39wJI3eP4t+lxU8vTbWoKY36r03Svw5P5T2rVNs7uBNbPZUT7ZzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d382UR+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OGN011740
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 10:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb77uwPvrX0HmHHrh/7RbLO2O8/7B/9lfzBzQHCPdJU=; b=d382UR+x20GSYTni
	aSJ6aH0t1OBNTWqYDFFN6sDYgskDXgHkYZxXQ9x6kXEQ5NdPufUz8o/g0ds4OsMl
	Iq6J6p3a6GAPyTOg+KyD07hpDhceuBJCQzcUFzd+x+DorywEJIILxgvR78lRj7Ee
	s1DGW9/f3tbOAnkAEdR7vniuhedczox2vlqHwfzMIUhFMcsIsfHatNACIUq/n/2Y
	2CVAPe9V66CcazTXes0Sgd9Sat5jhQRdtbGCJEFm6ZhmxvwQMdY99IIwlliawMbV
	16MBsfYpsd0J9efxOZX2sJZLN3Ac02Sn7a6PQg8Xap0NX1HHe9ITBlnTct9nCzBZ
	mqgx+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpvw14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:08:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e0f9bedf1aso22533531cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759918127; x=1760522927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb77uwPvrX0HmHHrh/7RbLO2O8/7B/9lfzBzQHCPdJU=;
        b=DRx6LAgABJJrm2A4VfX6sZ+WXFullvy7M1EonQ/0zcxkjPBgrXDov+haJY7UO7Mmbh
         NEOetvLr6paIko5ESeSaTjTcIscnzchsOOYGlwWjf2vsAfqXimjVBRPo5WzUS9JPk3aZ
         vVqwnbcv+IjANvEseI8TOnWjhpvBexlw9gimx3R15CZ9T6uCi7O8//xc4EhMHrOfCphd
         /0UqGreHNijeLNuXd3cM8MVK+2jr0DlG/4396DfnmeZAZFRUFT2gv/V3JC7Dd6W11PKx
         4UvpFjS69WKBflHs28JwAMHHp+/0MnSBebkHGoOQ4OMZxuip31eb3Z9TcvKujRuak+AF
         Cogg==
X-Forwarded-Encrypted: i=1; AJvYcCXGVG1bmBcD1CvIyLhEHplrL6DnLeNhhekn9cJqhrbs4LiB14aDzYFDNU9I6fhlX3ttFPt1EMb3NzUYdKae@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+xJNoE0k9dzereeApSFiNo3jC4cevHESRhuJj1dG5hKdzIf3
	EPgkVFWcEHQ3cAbiyDCdWB4JS4z1i0G1gGtt+DN5WmobefNHfYo9TnLisPnqXq7YDeNU4fkvSD3
	3NYJ+i9SNw1UgxnvD/e6BJ9vX0fjlL9/uoV/b2Z6pgAuy1e93K/6gtNKlIAlTwY4GkOcP
X-Gm-Gg: ASbGncv/2vY5v5P2SR/ctlz4Cwcp3FUrxd6waPVWUMMWNvFKAHiCyUY5eWOeZn03MR/
	05crh6p/P9xzXpgDq1EU13mtzJjTzNJjbKzM9QXQ/6oC2golhuv56IKWvjL+j2NAuwYC97VTOMB
	zbhgY67ljIMAStthntXbXhF9+lwm7czayd+BlJ/AfaqIjMuHLcPGpd/eygQey5iPL3Gd+W2DJCY
	DeEBOcMSTGdf8BBt18f9T8moTdmcYoBeqqbnIDsuWXSGzAuK1KCUNnDfVzK1WpGZVOheVnHRPC8
	K7JXj3hxq+Ac+ZW4Rsdh/TMudRdj0jLl3TDybaNzijpXlOOf9b26KV7UgxtGa5lO8y9fctBCSOW
	0QX8oDvb6Yk4dnXT34sQ2ou805es=
X-Received: by 2002:a05:622a:cc:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4e6eac002f8mr24163961cf.0.1759918126549;
        Wed, 08 Oct 2025 03:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq5cTLJ2mJwk3+csFy7Zr1eDTsQM6gCeFtxrIkdUO4dqhY8aZdotYTGDmV81/UlCQ7NMHKtg==
X-Received: by 2002:a05:622a:cc:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4e6eac002f8mr24163651cf.0.1759918126006;
        Wed, 08 Oct 2025 03:08:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ebbsm1618598366b.7.2025.10.08.03.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:08:45 -0700 (PDT)
Message-ID: <5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250905215516.289998-6-mailingradian@gmail.com>
 <20250905215516.289998-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905215516.289998-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: __X3Y7EfNhgwuaFjmQkJZdQCjKIKLMBu
X-Proofpoint-ORIG-GUID: __X3Y7EfNhgwuaFjmQkJZdQCjKIKLMBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX2HCCmPjlsN04
 qcqQIAQQBv2AwJ6affJWlHsIMLL/0XgJ/Zd1OoG+TDubZSOIQfWex5SI/c30jbTLA39TNTxyCpg
 Dk2Fn8QcbL/xsrgGPLtcWLNAE6kbDA05NWtV+PNXBEUjDCrYBjkx9sKeQQlq7eYzvszCc3QLrTe
 n24eFSQZWV2EW+E16+x/XJLANpwBLlR7zeuu4ccAE6Q9kegdjWUgaeLxNlMMBxY5SoLBy3y/6Uy
 LcHy72XUBtGtt+hXOhDpKZM55J7vsFbMbi6c+qnxDeDMZJaggRDCNGVUGhvswyuUaLORh3ZIO/h
 Rg0dNs8be05wsV1dwgEFYiFj3urHXl2qoxD8WDbL9h0TNyRCPwd2t5iOS6kMwtv5sIeYcTHgGrD
 OEYd4jZ3+TzbtbDvpkMnX1EskGPBZg==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e63830 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=CiInEcA6Zl_SvUJEBKkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 9/5/25 11:55 PM, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +	cam_front_ldo: cam-front-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_ldo";
> +		regulator-min-microvolt = <1352000>;
> +		regulator-max-microvolt = <1352000>;
> +		regulator-enable-ramp-delay = <135>;
> +
> +		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_front_ldo_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	cam_vio_ldo: cam-vio-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_vio_ldo";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <233>;
> +
> +		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;

You say active-high for both regulators here..


> +&cci {
> +	pinctrl-0 = <&cci1_default &cam_mclk_default>;

mclk belongs to the camera device

[...]

> +&pm660_gpios {
> +	cam_vio_pin: cam-vio-state {
> +		pins = "gpio13";
> +		function = "normal";
> +		power-source = <0>;
> +		output-low;
> +	};
> +};
> +
>  &pm660_rradc {
>  	status = "okay";
>  };
> @@ -509,6 +604,13 @@ led-0 {
>  };
>  
>  &pm660l_gpios {
> +	cam_front_ldo_pin: cam-front-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;
> +		output-low;
> +	};

..and then you set these pins to output-low

drop the output- properties as they shouldn't really be used anyway
and please settle on which way is "on"


> +
>  	vol_up_pin: vol-up-state {
>  		pins = "gpio7";
>  		function = "normal";
> @@ -548,6 +650,20 @@ &sdhc_1 {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> +	cam_front_default: cam-front-default-state {
> +		pins = "gpio9";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_mclk_default: cam-default-state {
> +		pins = "gpio15";
> +		function = "cam_mclk";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

this mclk definition you can push to the SoC DTSI becuase it's as
common as it gets for an internal function..

Konrad

