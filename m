Return-Path: <linux-arm-msm+bounces-59528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C9AC4D40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4742C17DF59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321DE25C82C;
	Tue, 27 May 2025 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtKlxpad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCB52494F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345122; cv=none; b=n64HCKiIcunEG5O/xG1PVfqFVbQZFELLFBkgFTPzCijdOvebJZM0yN3xClQyw51xk6JKykAp4U/673DPils7BxzwobZcZPlSJTy58x+jU9qshh74ue//Pw+QAcxAcK6ZNprV/3jwRdcCbXWGoU21eIghzhGQHaJf2eTFbgc2Yqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345122; c=relaxed/simple;
	bh=IjYCkaz0vdLZNHpHQfeQHn8VelyKTW2bL453QEqv/S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4xQ6ZYXkzbFCEJJDWT37Xl9DlKFVUHVPP7gXBHxeukCRxl4FM4shp7BYQ0LxyVmEHfDlw7MRb5zrejRfHqqBIIG2DWrL153dMs4BuQ3CNns+QoDU6//xAxaxhBbbBrWxbDSF5HfUdfkFo/MsRYpgHJHoeHGLM13IkUg13QUtzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtKlxpad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAYMg0003475
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+EtwIED2VJ1CyFpdm5+4R02rvjaaRQ1G+TwJkZUU998=; b=EtKlxpadYqWlNZGo
	bVbKqu+LpRGPMJLr9sVh7i1zk+bwgcBtlzXXfkT7fXAyGsX54XX+ZHj1YgQEQ+vu
	SmiZkJrzAnn98IZradGQYtOx4FTzYvezqyrwgkFH8G0RWwjPl6Q3b0h9YmmMn1YT
	5OSWkBbAQk6eMgKFaPzO3FxHXlpGWoKLZR4xn+Hq6ng/bF0jMONZJP7C7YDB0Ils
	12ErRd6R36hYlUZWOhWzVF8YhrsfShqAAfCpWTKcFoKfVaNtu2djsVJsJ1JOdo+h
	1MesTbGzvp1RcIaCwSHZmgof8CE7ZV2QbovBOriNVcQ06H+tdr2ALvNnbovtVuMb
	uUm8uQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549en81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:25:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-48f812db91aso11106701cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 04:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345117; x=1748949917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EtwIED2VJ1CyFpdm5+4R02rvjaaRQ1G+TwJkZUU998=;
        b=EZTLkLPLtnRn81adp2iFHpg8AZdt9N7AZZc6IayTi7b8htxmG91n4z/VAHK3cGa8Cm
         IR0nxzBKcGzeOHGoswzBgDejVX+FeYYyhN+5XlH9K1vAtipb4htykSfWdQy2jxKi/4L8
         I/nwtZFN8x6IlHEHwI+mG9lw64impVKbu324ii+s0iFxv+CczYy+P3wYnkN5tk/temka
         JDlwZBTkfzkIMUpDvlPKbk0G9bopkYcU8lMDNWTzViOxmtjxwC0sBXD2+T1Kz/Y4AfVj
         GqStPaGgW4bc00mtm+Crm5/zjV9FbeVu4H8Mt+NIawTZGbLCAf4Ce/LOxyLMKrBX9w1Q
         MPhg==
X-Gm-Message-State: AOJu0Yyf0/7iI0q7Iiag2cnsl7BfQh3BNzq3wY34B7eh4wBzl4WDXQ0m
	LAqmcC2HaKiNx7+mZ3/HNrIanGpOp1szWmq5NH0jy7UhpwLlutFV1hCKh/szJrSrMQxb01iZcP3
	Zg3ApNMV94rxvM4f1Oyi/oq0qaLN3gaUwbh4F7UfUFzIadp2yJeKsRwmSvW9zuAfx9l+q
X-Gm-Gg: ASbGncsQafC8/TIJZvaZFVYQ/0TtSELKGCf6k0x8NX2UTxAckb651YhcIXgixtMm0x9
	2dJawTzcV2twtFKSDXiRX5iCrXY928TDt1YqQuPcAbq5l4UA/+/M1+moVP1Wh/nzJ0UG6SKjMyE
	DQ8fJgdzhwtzpg1dCwtWB9Q+H9ts93Xtb/p9VupCgbHe8zxHHzWqc5mKqlQEhtCgdsRplnGVbVU
	+7UpaT41iPe9FsRo5E9YVtw7I9JpdED0LsFgYhrxr+DQBXEDG3cHVk9TfULc9eJ3ShSCgSn5+qC
	sD/spUqyXtL1l3WC23zBo57ILID+sM/3wuhuDHFrGXVDFNIiaVPlbR70pQgfRTBQ0A==
X-Received: by 2002:ac8:7f4c:0:b0:494:b722:141a with SMTP id d75a77b69052e-49f47cf0bd0mr71401391cf.13.1748345116954;
        Tue, 27 May 2025 04:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2ruzyLpYqP3ZgSZCU5zmljRjhSOppccrtHdLEaHwolv/pBEbpZ1ykF4CBKUG18Jhw4r79wA==
X-Received: by 2002:ac8:7f4c:0:b0:494:b722:141a with SMTP id d75a77b69052e-49f47cf0bd0mr71401291cf.13.1748345116568;
        Tue, 27 May 2025 04:25:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60461463b01sm3971225a12.27.2025.05.27.04.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:25:16 -0700 (PDT)
Message-ID: <673898ed-bc6b-46cc-bc60-aece7c6bde59@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:25:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Add support for X1E80100 Dell
 Latitude 7455
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-4-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525095341.12462-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dth3zNnKJoSSISQuup_ET6lFR0_xLWWu
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6835a11d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=vswN9AVew7ZQbwbRgEAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfX3jlRHfsB5Xmx
 bKiQK0v5pzn2DOFg3jJHkCbbjvqlFVVRwCjW3Mvd5bnT2yrnKmlB453+2EKwMZ8rI6YC1Mnbb8y
 6eetlkxMByIDT7ue6of8o7k4p9BsveY8qFMUZaTX5+7ZEJd9LG9zqqDo6fqEDR8HuTsxrmNqeI9
 dR3tSeaXBy7KfVjLjtvX4RKGnN6HJNs79sKtgT5JPLDbJffneT4hE6lnIAHGE/+HCszoT5s4M2Y
 bWlR0MaPzrU8ctSylURNBQNUaXUljU3WlRo6GkA9Kf287HsVjCKdrcOXd2SNg4zcSffvGj+ip3l
 sjaR7BSmuma76Ah/LEyhEIwa8zZ+RMCvzETovtTShyp/DfuQWMcfLfUKp1sXlNZXJE9lC2uuMTV
 ma3ODYnuPtAHadN6txEZpUT+m1zoQhsLXszsPGCQyJDLwE31ONQR5QLprZQLHtebKTf2znLT
X-Proofpoint-ORIG-GUID: Dth3zNnKJoSSISQuup_ET6lFR0_xLWWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=977 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

On 5/25/25 11:53 AM, Val Packett wrote:
> Add a device tree for the Dell Latitude 7455 (X Elite) laptop.
> 
> Working:
> - Wi-Fi (WCN7850 hw2.0)
> - Bluetooth
> - USB Type-C x2 (with DP alt mode)
> - USB Type-A
> - USB Fingerprint reader
> - eDP Display (with brightness)
> - NVMe
> - SDHC (microSD slot)
> - Keyboard
> - Touchpad
> - Touchscreen
> - Battery
> 
> Not included:
> - Audio
> - Camera
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";

I'd assume these are ps8833 instead, IIRC there's a pair of ID registers

[...]

> +&sdhc_2 {
> +	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> +	pinctrl-names = "default", "sleep";
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l6b_1p8>;
> +	bus-width = <4>;
> +	no-sdio;
> +	no-mmc;
> +	status = "okay";

A consistent \n before 'status' would be appreciated

Konrad

