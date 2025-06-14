Return-Path: <linux-arm-msm+bounces-61308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B2AD9F84
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0094816DC36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8702C08D4;
	Sat, 14 Jun 2025 19:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvVdejBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483E2E6D13
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929977; cv=none; b=jRam9s+Tk8bJ30GLwxQnrXUXjEsPrXJhOzhlb2KjYAdt9BsN27cR34rz+WyaV+04qDD9nH3JWthXjrHubIYV7KGjf1EmqvvOetIYDVxj+6unLJwQZkqx785jsgK17CdB/zOkHS79mM/uJwGf3FeJfc8/6XRTCoDtKmMzqCtZi7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929977; c=relaxed/simple;
	bh=zSkcy+9QC/FsH2JbyDzo+e5oYZeRb6hCJ+NReJzsy5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmkdv5ZwOjA5RhudmQozMV5/KZMKqPElC0Dyba5FkymJT56d/fsddOT/zsUfvN94zTkWQw0RNgb/w1atmkKTaiFyjWQAOAUv+UkYlK2tr4ERj1fJ93JBINSU4SwL+ltHf9XPxdnexCHxavHXo0nMpxP9zWA2XggP1q3N9peZR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvVdejBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHcP7q010085
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcxiXXKnkOWfPgGikwQVTCvvEomIPuV/EyKApCfjq2c=; b=WvVdejBKlY5Z5fvW
	qQhz/3eJrRsNKCmoVpRynF2+3ysfqUiq8WbFJGC58zxaZJ1+8dA2kz8Jv5q5KKZa
	o2Y3pEVayJMHLogafs3k7DrkAY9UUlSRcm7x90+NTDy3gP+7jLv5zVMkxYESSMP1
	J6Kfp4OVdnf1KVU3gdo4cDH0I4ao74DWTuB1xl8ImytKoCQkN7TC6WPvotfDq9Da
	HbSToywQHpwF59NOg092OeU26BTNeww/wrBZ+hJJLeLd3bTK5yEO0cddwwK55r08
	BuPSsgxMS60G7EZSBPUAaNnPbHOFoF6CXpD8C1YifYzbYqUy/W0vvBZDQJuF1LwC
	U/paiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsrxbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:39:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a517ff0ebdso7558431cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 12:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749929967; x=1750534767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcxiXXKnkOWfPgGikwQVTCvvEomIPuV/EyKApCfjq2c=;
        b=he0moV/m0dS2+WdBg+W652eyrcFTYeUdWQR2QbeMqdksmLUPLcnXaSVxubkvrjO0jx
         YFbaxwP9WEvPRn304uU7OE/2TONQG/vjZLMCVx5m3upLAeNcRupsd0cU9+jBvIdR2Jxo
         n4S1XUWzXPNmQVwOlByM+y1WsnaODh69G0lHDMSECyLEYxC+sr+AbiiU/hhuHPQMi+h2
         8ybPM4vneGnmn/k2Dzqz7BFdZW3UA1+4uh/+I2kMk2vmXMvihmuzR65zqgbcSk2H7Bzi
         Rn9DhGiFxfoS4TpHKrZ2bA2FMQLKCM/EJSTohAj52x1z4Egx4IzkLkq6QGjt1W/oLwIM
         4i1w==
X-Forwarded-Encrypted: i=1; AJvYcCXE6/i/+W2tsadzr3dgXhIzJqQbmbf9nndnlnTqcpOYPqwPVtpCQi++0dJEu7It4xvMCxlhbD3PaXKhOzkM@vger.kernel.org
X-Gm-Message-State: AOJu0YxFn8e4PPcibFt4U0HEQOSVYXMh037V97w+GpXjv1slFgIG35ql
	AMrsCFxnRpttSbZ6X+/L5uY0ZrxJJsXxwTgetvOkHkOmZqS9COG5KSrceF4gQs4sIqUC25Vj6wT
	9CElJlVimSfiNlEg3we2QU5dXoEG1LRN0DSo3v+vyZPNTS/7Ei4Ip3Aa+x6y5yNLuRK5s
X-Gm-Gg: ASbGncsg9J6nghb/jO0zLamzsUlk0yDd8x2QPMv+2HWgv2MWAxuB4Mpq9EYn+Fr3qwy
	2Z+3om5T29YqTqBekASiGNod9KDQYp4U8PYh0ssfhT8o0yW7877uqdZwl1pCyecvx47ZzHbT3n/
	ORHhz1Ghm0yZh7bSAExD+POOFZPVG8CM3/RGF7g5+WuKnSxRzfBfykYQssVVjelKJGMVItQULdo
	Wn0dPi5xnqmeu1WQzWigftz3mRX5TAQZoaYAepoDbq7PppwLofOcuSSR9IdzeEcFVXW9BFyOdGu
	M2x4EnKGtSc/sa6CiAuZZImJAFHkepdSOsXP6OoypwUSJAfPN75Mz2jnpSXXpNjvBGjVELjdzb5
	0Gjk=
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22710871cf.6.1749929966897;
        Sat, 14 Jun 2025 12:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8dmtvab1DD72NJPA+fqrTATOvFUC8Y320lY5T4Vp6J43nwiKHvw9BkAW22BjuNAMnhrTD7w==
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22710791cf.6.1749929966424;
        Sat, 14 Jun 2025 12:39:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48cb761sm3224336a12.17.2025.06.14.12.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:39:25 -0700 (PDT)
Message-ID: <ee088b5a-e792-4704-8f1e-e709f1b0c5fc@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:39:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
 <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NCBTYWx0ZWRfX+ycnrvL9OGHs
 /cKy1BNc7LcvSWpHkoq0sZln49AChJtBHz2j/50IdejlA9mgYqpfI8pbW8kxv0POfzC2v4XrW8Y
 9V5iSXQTZTH/hLXUwLYh1Av3kRBbp9pdyOJiMYGJe+kVmuCyhPA+L8NOT2T5RGE5/IBrap98+ue
 gEqdwNbOSl/oXqzzs9T+urNmgw8RPPNJne3gRt2/xmirbzIZwh5PofnFUKHKGzofoU2MKcfEdRd
 dsVddCrEF7CP/XqQ2k/yavokH6IpUg/ZX7fpOA4terrL90R8AetDtSZUg40cJ4fK48QpiDBSATt
 LiCWzsSA72Ya6tlt6vdsco7b/0n5pVVEhSDp/hsTtvJmzOIh19G7uLwKVTJbsNjgMTKY03oh1j8
 QQ1P2avmRqLMSEwhqVkvCpcIdIj4N8XNG2FXGBGjHk6FFUwCggkYGSVLR8laGPhdrKvhnVgv
X-Proofpoint-ORIG-GUID: rFfhkyEksqrRbM7180d_Rv5GE-mN7U_W
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=684dcfef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=Lh12ZzDr1oTyhi1fLBkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: rFfhkyEksqrRbM7180d_Rv5GE-mN7U_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=996 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140164

On 6/7/25 9:19 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> 
> Not supported yet:
> 
> - HDMI port.
> - EC and some fn hotkeys.
> 
> Limited support yet:
> 
> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not UHS-I (SD104) and UHS-II.
> 
> - The GPU is not yet supported. Graphics is only software rendered.
> 
> This work was done without any schematics or non-public knowledge of the device.
> So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> ARM64, and pure guesswork. It has been confirmed, however, that the device really
> has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> @43).
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

please

[...]

> +	/*
> +	 * This is an odd one. The camera is physically behind the eusb9 repeater (confirmed) but
> +	 * if it is placed below the usb_2_dwc3 node, it will be switched of after ~30 seconds.
> +	 * The whole reason it is described in the dt (as an USB device) is its requirement for
> +	 * that additional regulator, and to get power management to switch it off when suspended.
> +	 * Defining it stand-alone does work.
> +	 */

Looks like DWC3 only does of_platform_populate() ("probe drivers for
child nodes") in drd.c, and your dt sets everything to host-only..

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +		<72 2>, /* Secure EC I2C connection (?) */
> +		<238 1>; /* UFS Reset */

Please align the '<'s

Konrad


