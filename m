Return-Path: <linux-arm-msm+bounces-76379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F553BC4984
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39EC94E0FF3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D582EB878;
	Wed,  8 Oct 2025 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWBYwcD9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7484C2C3259
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923531; cv=none; b=cW/J90atDni0vZol4NBWUFGddXEERoJni9n0YbIf6sfhULRANzce/m6pFCQL7shXxk6szv4DWUpGfbB1AhN55xyOBUGRrEgigYpv0eIpXGmF2bBP3MqNXMH4NG+cyGpu26W4Od3qG+V7ppsVQawjtl0UD2qLPkTA7UAbJM+PHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923531; c=relaxed/simple;
	bh=6cCF2LvbGpbslhl10HwoVuuROYSKzmo8yAWwSaQlewY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyJVOV3OiuwMHrsGNAOJdmAoUPBD4qJ5100c6CbdQ/8bhS/I8JsNotfelFsfegdzdcGkbJYAUlVfP/wiTyVxQJn6t76IIoSMhejwuMKEoifRH8hg9wIArfTIj2NRAxoEJwNNH/ZD7jg+gfJs0DwvIcFkVeA41o40ARaVPDGbFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWBYwcD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890exg010088
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktF9PzCzZcJEY3eWTWWmqTdv5VI7UzhEYtnCUHGqeRM=; b=cWBYwcD941nJAH5m
	5tJXXvUAOqWfhkRWM2SV8Xiib7SYanDX7hnzdxjAsa4kgC3aylWwMNroFJpPwxCm
	b7fCISias3S6C1jHuspaPpVuecVm5kB5X+3Yn/klDd+1jRg8zQGloPg9l3zwHIL2
	2vcQJy49UXuNOJOGSvIOpuSoE7EGbenEZo/Y/PGiBRrwEjQ4+bLs3fXBB3pRLjzn
	Mv9bO9QEiaIYb7eu7IXGtWWBDGyD9qunX8vLxyXKfB4x3s/hi5FXe/HwF614C+nT
	MzHLLQ68qMXSDYL+KAitM3fqKv8WksE2g5q15VVI/yIUZpxV+UlgEi7oqiI0mjRv
	RRL/gg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junua925-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:38:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d8c35f814eso16642691cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759923528; x=1760528328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktF9PzCzZcJEY3eWTWWmqTdv5VI7UzhEYtnCUHGqeRM=;
        b=ntwQuQ/weTnG/dYjj/9QxHrv2aIEUh3JjSJHCliLUd2lp+1IO3qe9T7iRpVX2JZ53j
         OhUMVxFzxgglyg5Y1XcdyyTkBXZg0tbqEtsonfVeoDZY8i2tLpRpDvzsGZV30CfVznfD
         vVz2sQImqG9lulQUBsRfyeSIOsK85sGMT9cI6xwqt/HisXZesYH3w8uMzY9ziVGJyQXo
         ZfjEgkkhhHRiYRupJexEl+qHfeKuY9RENWhana00atK2s3+M+ijnNQwnaDVtUU4Cqzf1
         oa0TcdkalfU0xgT3vG12KTLWZ/PduceOpOyJodhkHwZ8Ba0wJ7n7KZp5ChECO4KQ5jM3
         RUJg==
X-Forwarded-Encrypted: i=1; AJvYcCUUzwzCjICr47sJWaZLoTE0m50osrnyVjZpsqTxq/8JH8iG50GiOtEWBZqyp+X6IjJ0LFNLA0WZ7hZ+wbID@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6J4qgZ6lh2KCqWGPCdE62qygk3wMMQpChR+j5baomBSOBVAkj
	bCaIiVobgQQsWwnB6ID5oS0eUErJQJlR9eV0Wf/uT3xe8vZw33WK6Vvo9PQFbtsVTiE8GUi70F5
	xfKLkBvB9B7x0LPJL/AsceSRNpS1wEdXbcLDTBbc3AB729AAQfcSIs8BcBQonR2LOzTvI
X-Gm-Gg: ASbGncv9p8nfXauVJ+hy83u0rK3DDY8nM5+EG3Fl+qIHp2F6AubWZ0yhxsPdxdWe/v9
	GaNiStYKt1Byv8pK1HRHFhE1iFan6XxdD9tduQDgc6Z+rkv/jQfgTAkrOz84GZvlUa9IBblbhoW
	IvwzK+W6d9lz7xTgKGTuCnJYR3VuUgeNWkl1EmUq0yxd0xSnhhj2lfWoAVP2YEgw/H9IBGSERQj
	r0Y2vvIUL8z7rJbPRFlUyrvznKGkdcxAnE33Mxs0XsCb2i/WD+/J5g5MDK2qugpdSF1RQGEJk5+
	jOPFMKoBaasSTHho05LhiWgkgglX8LymA1O7ciGyCBTmvA/JqL5/od+7z05j0wdet9E6njyefHW
	rJyyUfKx5pQLciaM2ByF5UMMluwg=
X-Received: by 2002:ac8:7d8d:0:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e6ead4d187mr28105581cf.8.1759923528394;
        Wed, 08 Oct 2025 04:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxXdxXLKV4c4vK741eJCYPaC0LrPYDOhy1QH4L6lPiyVX/KVRS60uwDKYl774T/rgeiZSNvQ==
X-Received: by 2002:ac8:7d8d:0:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e6ead4d187mr28105351cf.8.1759923527915;
        Wed, 08 Oct 2025 04:38:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881011e9sm14525558a12.25.2025.10.08.04.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:38:47 -0700 (PDT)
Message-ID: <7abe83dc-5469-48e1-8964-ce3377d82a4d@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:38:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250930132556.266434-1-xerikasxx@gmail.com>
 <20250930132556.266434-3-xerikasxx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930132556.266434-3-xerikasxx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: elpI2K-ujHpiFnSgbbJmIl6LTIkMFjt2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXxXuojAAUvn6h
 M+bdQ6SCCE0ta8yb797uJU3CwyNDvWlMhQasuraqPFSRnd6DZzRACy7c+ls8+11NmEHKMKsbpCr
 92VczEQzAvjF5gw+de76JpUw7EvWP7zo4DzvDh8eSDLprB8h38bEbVHkOIq/KM7DdtMg7T+pWz3
 w1tdL1bRNjbZAmxCKdh8UQyHetqcznOcJeWH1EzxmTHDDs9JCFfc9PMaWJGVmnD58sgN/m/jeeu
 mZDQUqswcoHBicVLKH72XFo+05wwXBNCsh479xckCN+lAVbVfOka+/OSbeSQjL0hhnIyzYBHlnG
 pnfP/zPLmTdoXlaT/YRldiWV+W/HNmkCwe+OlbMq7PrJD/fcW+tYGDUMNpfUOeXUNXuZwpyXWOR
 C2Te82EnNjN6o2K4v9j8mTlC3TVGpg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e64d49 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=wSXgXpi4_rt3d5ynXFgA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: elpI2K-ujHpiFnSgbbJmIl6LTIkMFjt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 9/30/25 3:20 PM, Erikas Bitovtas wrote:
> Add an initial device tree for Asus ZenFone 2 Laser/Selfie. This
> includes support for:
> - UART
> - USB
> - Internal storage
> - MicroSD
> - Volume keys
> - Touchscreen: Focaltech FT5306
> - Accelerometer: Invensense MPU6515
> - Magnetometer: Asahi Kasei AK09911
> - Vibrator
> - Audio input and output
> - Modem
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

[...]

> +&blsp_uart2 {
> +	pinctrl-0 = <&blsp_uart2_console_default>;
> +	pinctrl-1 = <&blsp_uart2_console_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";

nit: a newline before 'status' is customary

[...]

> +&tlmm {
> +	gpio_keys_default: gpio-keys-default-state {
> +		pins = "gpio107", "gpio117";

pin configuration nodes are best sorted by their pin number, please
reshuffle them

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	imu_default: imu-default-state {
> +		pins = "gpio36";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	mag_reset_default: mag-reset-default-state {
> +		pins = "gpio112";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;

odd \n-s in some entries, please remove them

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

