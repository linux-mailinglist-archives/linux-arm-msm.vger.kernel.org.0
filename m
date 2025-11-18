Return-Path: <linux-arm-msm+bounces-82262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B19C68F97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B21754F2C54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D4030F93D;
	Tue, 18 Nov 2025 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnvK2jtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqF+kU3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F634F262
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463811; cv=none; b=FdDVIG6QUgRQPLEk2KF2B6l24xh/1bFvGFQOaagysobID7YTCz6ThGQUl594vBHd6PBl9Z4mrW2AgiiuC5a0yNEeSbJEc5bFHplr5fBCaST1trwjhLv1gqHnd4LwswhSu8S7Afu+3ZG6s7CCyM6TrBsJxwyhW+b8Fde1Oexldz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463811; c=relaxed/simple;
	bh=PeU+nU2GWiNEmKRbl8Iy9KQbVH9Vicy23izAc1lIMGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNYlk1IvdMp1jAS+WITz3DEGxRqUeTQStCy3IsDpFmuXPYX2mWKYig9ahWKOqkLDfgbjRejMYGRiBbkPYB5yh6vNfO5+57wWdION0CtsmT0ThHmA3tx68I5zeJxaJoGnVWV5L6hHhJ704MKm0w0b19o5+kH9vzBfj6/yCLvx9LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnvK2jtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqF+kU3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VNIk2249875
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrmKV8lDoEBlhPy+rG/xSl2xxaAYr1nTB4+w0Y7pcFo=; b=VnvK2jtb4eI9NPmg
	p+OyMJMCauPuKptWl+/acXpYZTjlVVs66ErQzXEwUN+l3xNNaMZPrXgYXbuHiah9
	0p1nvG9iwoMJAELQzeEw4e1DrV8sc4hVNiDmMmXauoCE79Hdrl66elSpqdSHECWt
	/Gw5/iHcvQXi3M7FeFS3hz9aSWHvH1Ki7ccKUD2+gI8TECZQxzbKc+igOGeQDlez
	5OcxuXh9cuozoJn6MCnPG5yY/ogjEyMJIf0EFZObA8e+Zq1E7CHIUWMjCe/80t9y
	LXv/0FuBZ1iJZILPkx81tSGYmrLC62v0HkI3aaUSnNXLAiPJoX6ondBpytCDtqdH
	GMisXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5gf49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:03:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed83a05863so20738341cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463808; x=1764068608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrmKV8lDoEBlhPy+rG/xSl2xxaAYr1nTB4+w0Y7pcFo=;
        b=BqF+kU3HBGJAEv3Rpm/X0p+zpF4BTC4ws2dhipQAXzXaLtqdlLWGsPtaXdL0J7zoq+
         eEV1l5RVniSGpkUWGTA9QYo2wyKbASPfqueCNZ7vOKkl/+JxxcRKKvGbBq2Me3q5t9/q
         z0G4lbZ3Jsgp4zDaxUiqD2T50qOtGZEe0KuoFUtCM9wLR4XEAZAOgSF287Smw4SluXfB
         y8miKyi8dl3WTKtoQbY6zuOgwpfrr6M/pGmJETe+hMWjiFsVBsZn/eHxMkBQzta0nZSI
         pPIfwl7Au80gIHu//bA22z/wpONp8pFJa0/vMDE774cZeGIyb3uXpSgzMqcAg/n0cuaH
         nd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463808; x=1764068608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrmKV8lDoEBlhPy+rG/xSl2xxaAYr1nTB4+w0Y7pcFo=;
        b=U0HdcrCT4Lm6xcRXrtU/fmaRkvNHPXKn1MPrtSvwr5C5oDzdt8B47835sXKVVaMQ3j
         hgB5yrKI10IAraZ7jPic+YMZN7ZwCZEqqU7Q7bFokgxZmauel+KBU1sc3GQvpKZvW20K
         pb2H0ikyMkMgmFGGhHHuh9AUs3/8ZRVNKbixu6/PUvQer93Zyqfp325K1m16AsQ3wOqW
         IhFpLlahFCS7/qxXvDVYD6iJ14G2Jdbpo+NCoTIB7xQJGVaiu9P5cKGz5W9jNbdC7vUS
         yFqh7kt1GZZk2mP9h04yt0wuctks2Obc1/czPn4LGfD8J0hc/2h3r28nQJVl/7bKOj4u
         01/g==
X-Gm-Message-State: AOJu0Yyxmcu8UGQ5h5tJGB2WRADq7Lg/coMTqZ9uvP/T3BJSlzjS+42e
	KQg5t8gYnGAEwpLm+5XOj0i2WmnI6QLG1Mmttja2/8lPzm45dB4vDZ2o4aXpeMo1C8YAjjq5KEY
	r0ZsTnWlRSjY63aVr5W5qw9KJJ+nwpdjS1ctbFAX7NyAQPBph1f4OyoCUgjp8zPJxH/mO
X-Gm-Gg: ASbGncs8w6013Qq2OJA8ng2WzuHKAeIQwN22+fJzOfeQe8MeolpNQp0PnUOnpJY6OzB
	p/gJhoONoPdX7akYJOqWhwPI10RA7WjQFIeXkJq6/ArVOQDKQD5l7eDiUrIREmgKcYkoRcjSA+1
	pmO3xzvr2Kflri9jImVfpPhnCK1ZPaodl0HyDAMqaxWKoA55FUlacmOgi+IskrX7NlgEG2u3RUi
	ngFBzQgIprS2NbUv9iP/v+fR+iXnz3oyfb336KjHx1feruHDd4S+1/Dc/g7Zx2NUJacGptjif8g
	drR86K8iNSuHGAwP1NFRtOwUmr1apR71CN6BZMRqtrxjQS2YZUFhi2aZkwEzLWfX1OIinydGWok
	K+9pU4ab1FjaAbFtT2ovkSihKLbC9keth9enZC2Dmh3MV5k7X8wLR7fZEaJA5mzQCPzM=
X-Received: by 2002:a05:622a:24a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee317b3acemr21833361cf.7.1763463808459;
        Tue, 18 Nov 2025 03:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZmaUyKCa1Fx412H3sxAYJlznDamzyjPbyCAcL2w8O6ncTo0L2WOulItniSNvVKCQ6rwgeXQ==
X-Received: by 2002:a05:622a:24a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee317b3acemr21833081cf.7.1763463807890;
        Tue, 18 Nov 2025 03:03:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac667sm1300813766b.58.2025.11.18.03.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:03:27 -0800 (PST)
Message-ID: <5887f8df-1cb4-48f7-a2c1-a13330d9dbda@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 12:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20251112071234.2570251-1-sarthak.garg@oss.qualcomm.com>
 <20251112071234.2570251-2-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112071234.2570251-2-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uheIKuw5ZPCL4db4gtk2UxyWMeKSVgRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4OCBTYWx0ZWRfXwZUqJLnPPKdV
 1+G4p1w1n6kqXRWCHqp6BtuiDV5gezCcAIOiO/p7xcWCN64FGQIkTRrzUAqmy6WuIAM1N5dQF15
 sSYm5aePu1j/S9KPY1QzZf3g/g+6wpOa0yRCNCpzeDdBZ56oDwjAMrQ8Xt8bF4w0Za1JMPWkwp0
 y/1oAflcW6tvHcTyPIbnK7mpUDCDK/NIcDbIVNbbuVIIjteEcOX1zX1VYmB4wTWKKMvwFrIZg75
 Aey1OCqtyCTnquySFT5Kha7kIpgAz8NvCXbKH3LUAu+kYP6AW+gOtgqkDLEHW5NXOIcuNMyCLEj
 l0Gz+m0wXyJYmsTPSKlgQavYlX+cVPMqam6XkzAqx7OWMhs+N9TfAGXEWqVgakl45BNK2SxHPKS
 gPNv1MwyVakilL6Vkctg3KQG9xz/Jw==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c5281 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u5TD_m37DOUvO5gpP2MA:9
 a=raoiqYfqxaO1ECmz:21 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uheIKuw5ZPCL4db4gtk2UxyWMeKSVgRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180088

On 11/12/25 8:12 AM, Sarthak Garg wrote:
> Add SD Card host controller for sm8750 soc.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3f0b57f428bb..ba8c010226e1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2582,6 +2582,60 @@ data-pins {
>  			};
>  		};
>  
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x08804000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;

Nit: the '&'s look better when they're aligned to the previous line

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

