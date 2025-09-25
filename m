Return-Path: <linux-arm-msm+bounces-75063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A770B9ECE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D634C766A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DFD2F7460;
	Thu, 25 Sep 2025 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvQAuu9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313A2F90C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797234; cv=none; b=NXAmK8n+hp8T19zfQgy8a/Rl54pLbb8ipRm/vPolCqPf8ELBnpqbq3q45iN68AHzBOlKx2i8fFYjjxSH4SFtl5uTlvKpb4cQNMkpBiVVMS5Q4r3Ipz0+Ub1jX7oIj+uWu52O9wd37VCiKMYF+eMG3P0VeyLjF6TKa5vC6nibg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797234; c=relaxed/simple;
	bh=kA/W8j57qUwRf6Pe0hZo/Qn/kO9UwhDxztWC+vH3KNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ma9LpkSzSF2FXNjROX+XqwVVUlWYDqTAl4H5cUZyk6TYWLSZP9M/mPyjtzhkyTn62wK222uWTx3nVIr7HpIv/9hIaNkcoXAKQzr2Ftr11LkhfAGYbRdIM5JlN00fz0GIbWTRyJ/SW57swwCbDUs4esAE9Qvm2YND8nLf62jRF8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvQAuu9q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9RsP2019910
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ap9zsKuKlu5pNRSUb04qd8s5OqnjzWt1Q5GsG3WWIsw=; b=cvQAuu9q6gCUC959
	JgjrF6Rk20T8plh1fWaGVlr/rrKulvhtw091dT1T+gRp137bXcwFuFMl3NDg25G3
	t7gAj3sFXSF+WNSVxbrfdIJ/JXXIBLi8+WDNBIE++Qzaaslm9iWIXm+HOF1m6AuH
	8MOS4OMxb4ICMcOoSwjvHPLlAwA7DR+DuQXbt3oCmx5oh9QaBrnFWd+oy+KFVXNY
	yElK1bXJSOwyZc/JRzGMK4xwcggiIHoF/04Vm8qOkOydGrndpK0I8MNxgLscBIQK
	XIEvOFDfL6D5vRpDe+eweKjc3CKe/rt5JohhEzwdnjA58LJibx5iq5AQgmCeRTqM
	fDUqCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe115x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:47:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-82b15c1dca8so32788285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797230; x=1759402030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ap9zsKuKlu5pNRSUb04qd8s5OqnjzWt1Q5GsG3WWIsw=;
        b=IF7H5dQ4cFfCRc55+sv7hBk7KCH257JEqbcWr0B6a4Qu5faqlKqx0TWNAo9i1og1lx
         ACjRXW3ixRn8stsjg0s2wZPE0uYiEmtxCrCtYoxIek+9JduI9YbNuE/zcKZF4v+xufdg
         4oq8zhl9nx8OHhsxYRiEq8kWSNO4X1BgUl/Kf2Xn+0Y8UmQ/1rngEMhL1C4f1L8mFcgj
         +EmFKqPtB1nF9NXTLXfpJNj8bXt25JBftGd3aV+CX6bp0jOapKKQzc4m52HGwMep4upV
         48/MSFO1GtnLv7rknZbOWBq22S1jhCUMlz0paeiHvceRRSOHTJtTGzzpmIa/qHG7o+30
         ELjQ==
X-Gm-Message-State: AOJu0Yzei66ElIE9AFF8zSw9EWMi+Uy8FnEd1WfMh/nds9LHZ4vE3h5E
	H1xpzkGJlaXkmOqC2mA7J9yYeHCZX0cQOLSVa2GBpUqvy5qzHqlS84GkvEUJVo3y2TNF9M5FODu
	qInzsvx6M+3Jo6whg6DI+iKeWd/OL4rUTuE1SKqxMp737a/y+/xhEr8Pztxj0UEfr1ctm
X-Gm-Gg: ASbGncsmSYWGA9zLlwDLJ7Wj+7bt7+siJM+v0enZOZ1ZkN5ygJUjMl75IsB8Rws7bs0
	jUdPb8l+C7FKExG88YByknfBqi5xaro2yvIoo9cmltxvDfvWKJaih2uZEtZn1/oCDAgK/UCXyoT
	KLbuuF7claxRmv2GQfUS9rXIt3rcKlay/XnWXv4CYbcigg9CqSsrJUQs/qsKoKI+r1Kz/cdGJl3
	kOPoliyisdLC4fOmvBXHmzOyXR2lvK/ii85Ndtg7vkoBSEb5JHDO6k4WJDdVaDjYdHK/b0kRaB/
	gPd7koCHVglETvyZhBsovGAGRT2VPPxXiMHvi+8R/EIrFQkROMlggjiZVwGFDH7TUJ2Q3G7aC0M
	Hg1KcWi3wuz/3Pa13ALHBOA==
X-Received: by 2002:ac8:5d56:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4da482d67b4mr26593141cf.4.1758797230201;
        Thu, 25 Sep 2025 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPlsCdSBp4lVFO9DqRFAK2J6u8/Y0Vcz4TcgQGFKzP4hjuFZPhw5/Mpkap+CC2vkrjuvanDw==
X-Received: by 2002:ac8:5d56:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4da482d67b4mr26592921cf.4.1758797229601;
        Thu, 25 Sep 2025 03:47:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa4696sm141562866b.27.2025.09.25.03.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:47:08 -0700 (PDT)
Message-ID: <2eff7705-8d85-4c48-820b-bb9d2095995a@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:47:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com>
 <20250924-radxa-dragon-q6a-v4-2-10d584f2c806@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-radxa-dragon-q6a-v4-2-10d584f2c806@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oV9jloTvSun9S763CaxfM-IcOswZKhnj
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d51daf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8
 a=JC7H1UVUsGpFjcbbhlEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: oV9jloTvSun9S763CaxfM-IcOswZKhnj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX2SO0kAaQ7URd
 m+sTVd1X+YrUi1N1QP/QOfd5h2jhkMxzaoJ76E7XQWXyxkRcqQcGYLdb9VZZWtDSGEzPIxq4t13
 SNxM/9LV3hKTX7/Dt7/YSiTfHN3d7LeuEPAx0qed3CFnrNup3BoupoVHbsfS3gg7P6aGH3PL9BH
 /jm/f6EtLALzrtYd/PmuFOZgjrMhbsZWmjXgR+AaNwg9InMF5DxX5/rElAAtERuGVWjT97lb/3C
 8Fd5Rn0PNT5Z2m2+jgeNTJ1FZsp5RpRizpni6c2KYlfPrIYN2eMQciGXiYLfYPc+jVyjqggphGM
 9y3rLJ6Z1gofIYSimGXsdW/zudmFFRqB8EJH/KY+SFUZsPyLWUgMR6oDVPFbQFdWofNpQRVJWEZ
 pHGvPuMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On 9/24/25 5:07 PM, Xilin Wu wrote:
> Radxa Dragon Q6A is a single board computer, based on the Qualcomm
> QCS6490 platform.
> 
> Features enabled and working:
> 
> - Configurable I2C/SPI/UART from 40-Pin GPIO
> - Three USB-A 2.0 ports
> - RTL8111K Ethernet connected to PCIe0
> - eMMC module
> - SD card
> - M.2 M-Key 2230 PCIe 3.0 x2
> - Headphone jack
> - Onboard thermal sensors
> - QSPI controller for updating boot firmware
> - ADSP remoteproc (Type-C and charging features disabled in firmware)
> - CDSP remoteproc (for AI applications using QNN)
> - Venus video encode and decode accelerator
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-0 = <&user_led>;
> +		pinctrl-names = "default";
> +
> +		user-led {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";

"panic-indicator"?

[...]

> +&qspi {
> +	/* It's not possible to use QSPI with iommu */
> +	/* due to an error in qcom_smmu_write_s2cr */
> +	/delete-property/ iommus;

I would assume this is going to apply to all non-Chrome kodiak devices

[...]

> +&sound {
> +	compatible = "qcom,qcs6490-rb3gen2-sndcard";
> +	model = "QCS6490-Radxa-Dragon-Q6A";
> +
> +	audio-routing =
> +		"IN1_HPHL", "HPHL_OUT",
> +		"IN2_HPHR", "HPHR_OUT",
> +		"AMIC2", "MIC BIAS2",
> +		"TX SWR_ADC1", "ADC2_OUTPUT";

odd line break

[...]

> +&usb_2_hsphy {
> +	status = "okay";

odd status-not-last

lgtm otherwise, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

