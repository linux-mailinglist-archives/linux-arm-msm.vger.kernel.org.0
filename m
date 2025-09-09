Return-Path: <linux-arm-msm+bounces-72707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD7B4A623
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21189188684C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99828274B4B;
	Tue,  9 Sep 2025 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu32bpPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009992741B3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408172; cv=none; b=nIJ4MiQ0hF1A73+7TvZakxttHdbXhip3xWz7dtsDyfQpzT18Cmgo35XXJyixRxBo+6n5cDI4/TGTfw1BUrBWVz4mFTYQ+kNlOXm5/ORgvj0BeukhCftEbQk+/y0s63hc3rvPgFqHCAT1ukMwGbzP6n//VzPzZle7WXvjC+BBIvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408172; c=relaxed/simple;
	bh=HEr1BW2CyFXSjAp5IHF1LeICiVM9EMNs83h9onsJJ40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIm9BdHnKaloojyyEO4LPFv81dNXvttJQt+1rSP1PzLb1jvMls4J244Sqkrf/b3vR4HCsE3GU4vhuW4mkCZGczOVbPRTL/ndZLAzb+PddXDI6GF7TPEwCwWglGKKyeD70GD/0SUUfpMyyyH8VHYr/UdiM6uXaVz3NBbQ7vDMRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu32bpPb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SjEn029080
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCzw1uK2cApp7VoxRq8nIM7edWjezcrHv5GLBEAENTI=; b=Fu32bpPb1qDD0kt5
	7KNTHaBpEDpvqtdQSdELmxstGrZAtUyZNJxX3hkfEWNyIEIWzIH/juJl5u3USICt
	ExqQRugwoY5MVbHLHvtTjU7IcDEaaLUO3/UirbkK4WmYCN1xnSde/ZJpwHYe0fQu
	bUnkPNFHOcrAkpVC7/B3PFXoJlLsMK1RzYDg44iw3mwD66xj2NFNQBnrErwtybYk
	pNzUeswF1no8kEZ7j8LMikCCW/Nd8sOyg3kMN5PtWnWvxK72QsulfyV3QJcYkZAL
	ykkGOw3tZ0yHqzeTjIRUSXVF69qucFr7CwI34MN4tljVfEhjIxhLxaLet93jlUCL
	lw0a1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapfvwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:56:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-720802c209dso7744446d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757408169; x=1758012969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCzw1uK2cApp7VoxRq8nIM7edWjezcrHv5GLBEAENTI=;
        b=v7Tj9KnCr9XJQCm78KaUGu7vpJ+tCOiTEIy1QGIoPZZQFGbUPIQqkBzxR+5npAXyP0
         4auXEDdYWEsDWpM9ANpwa+JzV3sCdQHOlQcc0Z7YrE6M9T830PE5QqjM2c2cHgDBvScx
         jCcjxFt27PwESmiZG1A3/y4pY71W/CnkYZHxYR7Y2Zex137DBZ2bU956RGJ3Opz4O11m
         ABHIIHEPt5A7laNWBnSvvEtAc2/fCr2coRz5mGpuKP3pE76lOOk2jzHpTRjrn9MSlecS
         fVtJMEpDfrH348mom6a+5DLPOjBH1cXxlhtWAilNjBbw1kb/Z9LGqOk2X0yl3nZQiCOO
         Xz0w==
X-Forwarded-Encrypted: i=1; AJvYcCXP8iTBCrTCJ6vRnP9iizzsBDfZZHNetq10QbKAXMxqbuCigVzn/HDJkkMOzgwtDfLKchsABS6d0OPNaawn@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2EzVztYnS/VIXvc+beD/oyXZUAZjyvuOSOGmn25epb9LGxqu
	DhBs2o3X0EiLQszooJ6f+ZNKh9/cKjUsDH709DjeVlQCTKhXlYqaItrNrif6odCuXxZunNsQErt
	0HL/YgBARJcdZZtEsaMoKzeDFlGAJiv+QqoR/arVm1ZZPRF94ZrWsV63Kwjcz1YwOwEYD
X-Gm-Gg: ASbGncsWiPHksrhNVcyKoEJ9Gf0YeJBvO2tK/3BsYaDcnVsRmAZMC6FT/97eiI+8fu8
	EuwLK2UTHTgFgFm4GxWT/plnCCOjD7A5dIzcqvvPvvx0usexxJwA6nrL0gj7SJ2v4M8z7rWw92R
	8O2sBzz6oxFDBx11sMUGM9j5K94/ALVJEmdl8THaUWH4ykLYvsqSfav1HDYGvnsJ7f+QeqE5OmT
	B1LmLcU4B+WFDjC3hwd7XcTHy+hO5loNZISTZadINWW42uCOa2zgUOGUt58iUNCkugejvHIhB3d
	2QgSNjZNv7UxEknVlGbEPa8MfaAysMDfQaOLVmQdbWdUmub39hKJGMlj6yYrtfwHXisfMa9j/yW
	AmniNwHu83g7t5uQi5RUKvg==
X-Received: by 2002:a05:6214:2601:b0:70d:fce4:1103 with SMTP id 6a1803df08f44-73923522d01mr76507036d6.2.1757408168963;
        Tue, 09 Sep 2025 01:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFomYED4Eza1A+e/BtNTXXoKFDMJfCxthpkjrk2o70p/W1ZuHNFlj0kbfmL3qCOaJ0P4xf/8Q==
X-Received: by 2002:a05:6214:2601:b0:70d:fce4:1103 with SMTP id 6a1803df08f44-73923522d01mr76506916d6.2.1757408168393;
        Tue, 09 Sep 2025 01:56:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c0123f3ffsm809455a12.27.2025.09.09.01.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:56:07 -0700 (PDT)
Message-ID: <67de95ac-38d4-452f-8285-c2da89aa725b@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:56:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100-crd: Add charge limit
 nvmem
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250826-qcom_battmgr_update-v3-0-74ea410ef146@oss.qualcomm.com>
 <20250826-qcom_battmgr_update-v3-8-74ea410ef146@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250826-qcom_battmgr_update-v3-8-74ea410ef146@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bfeba9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-3kHGih9VurzyBn-70A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Zb2T4cpI62FsQR2rompOacRmCDaTyTx0
X-Proofpoint-ORIG-GUID: Zb2T4cpI62FsQR2rompOacRmCDaTyTx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0WxkvFg+u+UY
 Z+6thfF+GhDCtH+S2N5P3L6WEnGtHpFigtv/+kPcU8KtK9zQMgK0cdUYBEDUvM5WkTeFEQlAfnx
 NBnxj8MBdBPaG2jvnyNKOTO7SZ4zvMc3X/Da6yS/EyI2MoElRfslysEGOswIvAtltZmdAz2DD2M
 7OLsABI1dxKkjfi+wB/FEG05v034hUn/Ncz0XMSoR7ba/4HrCqFAlOG1fyo46dOUi2YQD1vTyS6
 4fJoEHCbUWYM6yiBzqLi/ic9HbAbidZY7KfsEs7UI9cr8fEUhPii1w0Z+Jon6tvbu3mlYgga7gu
 1ws0MFsFqGMHP2NRNHAqNuB1yHHbozdqFTBjsmVlHoonagkrTaSeMpaN2x21pm7ROQPQdHEZIV/
 dUTxKssY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 8/26/25 9:18 AM, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add nvmem cells for getting charge control thresholds if they have
> been set previously.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi         |  2 ++
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index c9f0d505267081af66b0973fe6c1e33832a2c86b..8c3d30dd936ef9b12867971f5f237dd12484072d 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -82,6 +82,8 @@ pmic-glink {
>  				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
>  				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
>  
> +		nvmem-cells = <&charge_limit_en>, <&charge_limit_end>, <&charge_limit_delta>;
> +		nvmem-cell-names = "charge_limit_en", "charge_limit_end", "charge_limit_delta";

1 a line would be preferred, and we try to keep a newline between
the last property and the following subnodes (i.e. before the
comment in this case), please adjust accordingly.


>  		/* Left-side rear port */
>  		connector@0 {
>  			compatible = "usb-c-connector";
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..abf7afe5127d7b8b572513234e00009ce837837d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -239,6 +239,26 @@ reboot_reason: reboot-reason@48 {
>  			};
>  		};
>  
> +		pmk8550_sdam_15: nvram@7e00 {
> +			compatible = "qcom,spmi-sdam";
> +			reg = <0x7e00>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x7e00 0x100>;
> +
> +			charge_limit_en: charge-limit-en@73 {
> +				reg = <0x73 0x1>;
> +			};
> +
> +			charge_limit_end: charge-limit-end@75 {
> +				reg = <0x75 0x1>;
> +			};
> +
> +			charge_limit_delta: charge-limit-delta@75 {
> +				reg = <0x76 0x1>;
> +			};

These addresses look in line with the SDAM assignment document.

Konrad

