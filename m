Return-Path: <linux-arm-msm+bounces-73193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17CB53FC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 03:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707C81B27788
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 01:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589F82AF1B;
	Fri, 12 Sep 2025 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ML384WLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CDB18C31
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757639901; cv=none; b=eNHJVxlvGKe+fSEuikX+ASe0zt0/fII4RyJtuqu5lfFGikDEyajrFHQqdXsCIiC4XGZr1Jz7AbfBdympy3HVqU79Pk49/2EPl8iS3oJUrD+nJ+AK+qy58mzoymLJFGgU07qBEH14QhElKUR7YhIC61itA1UNNV0aqdQqkY7mCYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757639901; c=relaxed/simple;
	bh=h9qaaXSqvN9cBSTuj957sTTg4kjY5I2KZ2UivSEhI8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzszPwnmDPQdoQziNk5R738Psk7q6EVettvpALyJ6cEonUkokI2iMPidgaW1CAhrzpOKfnUHKwDA0HZRrUrUX9fy//6hlYVTwJQCbF+cYGC3JzCh2Q3Oa9J15O+s3n8ulNRmMW9P8Q9vfRIs+BMDrgyKfjcx8PAn5FrlBK6O50Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ML384WLP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJZ9dO026420
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MDT5wpotH29qgokGXIt19ncw6IhYm6XttDNFxIDNqI=; b=ML384WLPI0lO26Tj
	lQZxrvI1G9I3++QNOnGlZ+fA15ERR9k2GoRmpZkq/B/lkw7aGXEeDDeOcCc4dPLf
	15sVugOVbRg5sIuAl64tVghq+8GU4i3V26VXgjxiYLP/NkVLmQM+bUDvTI+AfCEF
	4H8emOm6W0ZNDmGc/yYxUWBy/Aby/bqYH2ZUFSJaWZY0bqQHVFIwbBMjVgmLF3ZJ
	RNcldacG/x0KGKSRgavKfQUalRkleLquSiVyJM/xGQ41R0BOOxLYKwfMK4kM2WuG
	fSWGr3iHLTUWFhfyOE/5l7/Ul6syRO4YKwBqrPU+aktCTirMO1abuyQEyQejCNHg
	ePlHxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj11rne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:18:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-806a4452050so265821185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757639896; x=1758244696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MDT5wpotH29qgokGXIt19ncw6IhYm6XttDNFxIDNqI=;
        b=agjBxdONJsKn7JFqkVCHw3twnHj5zds0PCGqG4joonOf1QWIttwxXqBNue03XvqcJh
         dstbLdprzqwkpISDNtp0ejUTe1rBZVVOenvR2/DrjcQ9wClYzn3O0N4ck8smBicRB88R
         hnD6dqOIlB9+2LU54O6d7dUC/huubwlylCSQ5wraZBteZKInxV5yeXZjxmsd1bHNNCX5
         TAes9MrINV6wO/xsQFvZuEkxtnAjjQxcIPHWxqiJHsiktkwrjKY7yhzYoGu3fVBcCuCC
         0wYn5JRfETe6JRBv+nsBpZhbEVJ4GJ0avopuU3ZNz+kZqls55mPvoflO9dCo/f+JXlE4
         YquQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo6s7C69gc0af+XQm0eE8TQThA1WmJQeNcoAOEsC/4AYAbXcAM7lavz0H6P1Ahvift9KpzzrtT0PZ13nz3@vger.kernel.org
X-Gm-Message-State: AOJu0YxhX/eASa0Ss4IvFT1AOSJJpksA6gG58Q4YQ9/dRu6hN51aa4js
	ebsgQMf4900siIIdDnxXjbwabRTU2bVAEgk0IMXAwAr8mjZUAT+a5ivuKlAymK0arI+O8EQAR0s
	esxW53M4Mqz8gKSBc7LJOuxlXWFqKwvmOTzRnH8wzcbfXYGD6XLITGsqSk+ZulfPC2U20
X-Gm-Gg: ASbGncvHOSul8ZkB3yXKxdpmNwPDkfqjNNPNbGdATDcCs96g3KPO9NsdUDCMITZt0tJ
	8nioxECdl0XfJTiHV7x4NHGyxcPWbGzIHdONnxs1feohnyjGoBUzb0s5509F6+cm7RF75U6WJS7
	a97ASVqDeKHzo+jOK8ldpwwLRGh1HNcrM5P+egUg6Rf1HG3N8ZaIdaMstmm5nsZsooK2OY1U5Fi
	N3BrfADnFtsp6TaaJXm27hWUjCaqA9vf0JjiBBLZD5mp5pK0ee4cHKRfeU9ezlWahvf/cNldw9e
	Zv526yIAJBxXcCbjJ0/yNI9C1hgHrW3wROFHyQtpNsF99NJb4UoH8Gwvban70TFrTeEtb+2oYXM
	FmkOmbmnw/agLxqP2WBvo/bsDrciK83ZwDW/WJ8k4g6LaFScEfBFo
X-Received: by 2002:a05:620a:ab06:b0:816:461c:f9bd with SMTP id af79cd13be357-8240084e246mr159508685a.44.1757639895671;
        Thu, 11 Sep 2025 18:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZHSKnYlZZHqZR6Hj9n+C0UmRrNSc/yTGeOKw7+RBx03laoFH6xZ7XxJqWCd7NVxlWZWClAg==
X-Received: by 2002:a05:620a:ab06:b0:816:461c:f9bd with SMTP id af79cd13be357-8240084e246mr159506485a.44.1757639895218;
        Thu, 11 Sep 2025 18:18:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1c6cabedsm5830451fa.69.2025.09.11.18.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 18:18:13 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:18:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v8 1/1] arm64: dts: qcom: add initial support for
 Samsung Galaxy S22
Message-ID: <l3c4hjgcjmc3fsxcyanskvy2rotewk6hdj7wbvcs7gcdfcpfoq@f3rgc2zak33n>
References: <20250911224734.51415-1-ghatto404@gmail.com>
 <20250911224734.51415-2-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911224734.51415-2-ghatto404@gmail.com>
X-Proofpoint-ORIG-GUID: CbJXj28BOV_JLPe2hhLgJZvFRfbwVnj4
X-Proofpoint-GUID: CbJXj28BOV_JLPe2hhLgJZvFRfbwVnj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9Z0s6e6cIDxB
 f1WmLbnHuR+Ae8nE8uh8GVgKNj8+zjzDUrBl48v4jolOyB1wAYvr1W5JP6c7jDwlapjlqz7jpCf
 xi+cewBfj7KcQtFRwVandlr8hKcixcs/BlrQBGFGlpukwAjnj/hAmePZ/3hGwumQdZ7vjz7+Awr
 sSll8kMnjwRxyNVb5SSdGhdGMUN2NFMo+ypqrjwOeZSghp7G0J/NqQyEOyMO9IMsk6BrasRK24N
 SkyK0L0yQV4x4mtP0+hiu2hUO91pLpRQiEXZ9tsvo2/SZtkhyOug/xmK4sQ9HRXSA58MX9xvO0T
 UBE+213AzFqvMbnLSQFwwCueIPe6eRPedjyB2LkFvzxbaHIe9KFEhpUQO50Koh2srfaOEL2sL2+
 sYNhg4Sp
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c374d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=QWxc95z4xnr1JtQ8ubcA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Thu, Sep 11, 2025 at 10:47:29PM +0000, Eric Gonçalves wrote:
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
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 94a84770b080..d311e637327e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx214.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx215.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-samsung-r0q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx223.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> new file mode 100644
> index 000000000000..b7533c2287b7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sm8450.dtsi"
> +#include "pm8350.dtsi"
> +#include "pm8350c.dtsi"
> +
> +/ {
> +	model = "Samsung Galaxy S22 5G";
> +	compatible = "samsung,r0q", "qcom,sm8450";
> +	chassis-type = "handset";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer@b8000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xb8000000 0x0 0x2b00000>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {

Could you please change this to regulator-vph-pwr? This keeps all
regulator nodes together.

LGTM otherwise

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +

-- 
With best wishes
Dmitry

