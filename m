Return-Path: <linux-arm-msm+bounces-85871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FF7CCFBA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 761D73005A87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19562F83A7;
	Fri, 19 Dec 2025 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQWK+gld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmkm+qXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E81D5CD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146506; cv=none; b=V3SVgO/z/IWL3X3g3ANIcifn0t0BtoNzTmNvq5lGcWE8pBWN512rCCYFKsLvYFM/LR7NHJCqLzv0MOfnBt4PyPX17ALsWIOLPjMcCtAm9bXh1PNIUhMa1OoeDJpLqWcgiQEumOOZKuO7xxkp1kc5RF9xSnS/aKujjy9wiw+4YDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146506; c=relaxed/simple;
	bh=UQFnqfpoGaxH3DpBNuTdo+sgVnPba6y9y0VF6lSdj8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/n/cBSas8WK5UGy1ChA88/uccje5wQBtfCv5mOhEVMJsI5LGYq7t15FdOtgbQXXZz51dex/xG5A6HKZwEYYc1XTuLFV7nnwNjvBcQZtwOu3yF7zDhq94ewQ7sY4+FW4cIu1GUulVb+N+DtKmoMI8tK/0Orad3BWR/3y0HjDXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQWK+gld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmkm+qXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBunRR3976825
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJw+rSPPz1j+Hiy4cMx22Rygn7YhcBCsDSvGWid4WXw=; b=MQWK+gldS/PiBNrJ
	CunZG5Jb25eEO3waYTaSsU5IAU8BZN2cwx+u+NciyiHK6gXHdEI8IhNZDWUqiIiU
	BnPJoX94BW9iZVjPLOSl3bc67awa3qEOSUGXxs+n75eCljM2jFBGev+UC0/0jn+i
	69Xmy5H/KSKFxAUyx6UeHvrtzzgfq+qMetPrYUYtEnqVKZMK9y/vWyk3hfzeadbW
	u4McahLmaiKLTjdJYIokAHu7O/bLFpV0XZckTaQfGEpjdy+EIMVPGHjrZ5VNKZsC
	TIAQCfM8FEJEZ/LpgQdBROHpwg0+AfpDQ31Q21yOXe4SW1+iN610xaqJjMkI3t9f
	g9sR/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fjgxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:15:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee409f1880so3137321cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146504; x=1766751304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJw+rSPPz1j+Hiy4cMx22Rygn7YhcBCsDSvGWid4WXw=;
        b=hmkm+qXHJJoqV4MLqOb9kEFkLsGY2tj+Y22P3cvyghtoZzLvRltNRKQcca+LYpmN2g
         7xo2mJmQSSf4eK6HoGzmlgvkZZl4+5oYHzd5iiqrvJDjKSXuRDLHA1RKvo8N44x7ZAfK
         n1B/OKBdYGD1fFocBP29BCHpZwcYNsyZJw8HJeoGhKf4umZd5FfJuFGas2/NbmZuzBoO
         WP94q6rXPd5x2A6VOVRVMFuF1tG6nfr7+wlXsYpq826RZau1FI9/3GKmSn/8opFBWhS2
         YTf49s5yg7zrEc1N2x1g4p5Sf+wZHkODkf8BDE3cuziVHTKJIzhZxiGzl/RgDTKEY647
         x4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146504; x=1766751304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJw+rSPPz1j+Hiy4cMx22Rygn7YhcBCsDSvGWid4WXw=;
        b=jdJEQxXv83M8FYmrLw59qxXhP4SZN7dg9zfJypef1Qx9nXqp8rzR76jSI9hN1erJ1r
         y5G/DRZ8owC8myrJn7oWXHzUxcAZtUSKunPqAyTeet09BwhXFXD6ypb511M9J09TnYYu
         eBfgRLoawXIrTvDa22/7TqCbK3QMWPGWk2IS5Dtz7SbQ5o3zl5vP+tQCrg5/iMRvk9mq
         d0HxkJISjk4oDl+oHzStPFsbasVfqbkvNIc2boy4zXpldsrHrvnbnI00AUcxNgzgBWAW
         ZDVglLFcU7E4sThYo4xyA7cxESMfHoSFUtCmlH93+pB8wc22UbnLgU97rW03w26xuTR3
         FArA==
X-Forwarded-Encrypted: i=1; AJvYcCXsmGSVglZyKuOtTePDkfnYgLuzCw1bgN7VxfEIJlMUxiBFKOv7h5YhOGlLNGZav19C8BhM7oerqUudewyS@vger.kernel.org
X-Gm-Message-State: AOJu0YxVIIhwYwqqZnqfmS5D8fqY/apJWZuJoZXTwercm6DBrtZ/3Tw+
	6m1VUL5NRt/h0VMXXsvajw8UByB3Ora779BjHs3OMCJyO9vmd8leHwQC7PLAmrmyqK2I1+l4j+z
	weGT5l8iudSEkCgsvwRG11ke58Cdx1+ovAUA8Pjkarr2iawpVTxidb3BxCdEQSqW7bbfi
X-Gm-Gg: AY/fxX5swejc8h298oybgJTLhR46S5Lyh9ZMsK+kuOKZxVraG0/ZRNZpjdIiDXBbysA
	rJdwsA7QFTBIxZs8UG7aLC6xgVh+xmGuRnEm4qtmLwNkFItfmjQB4DE85Z8frSYjoR/hduH35LG
	mOqFsgDlKEdesqWPQz3QHEblJsDCN3+hzPjIwl3ulQmOD1gtGE5cXbeQ7DgGsADnVY2ftKWNLI2
	6RDNSUvAk5A2Id8lQ1+iITSvbNZGiopLZpVVPvk4cFU+z8KeLYQ+UbIIkQtmD8xXBFIScPcJ2vz
	2Hn737XltZXk0Q6U4YZMnrHrPj2JKkoSCqU9Or6LyOIA4vmrIAc1nZsupxi1KXaX+DLA+yjZTjv
	QCm9cpzdD4Ixt44DFpSKQbcZS2Ht//n+nNEw75tE208TO2kyZjmxmGiktGoqbnduDdQ==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr26037901cf.1.1766146503784;
        Fri, 19 Dec 2025 04:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS4HkabLGuyRUOhz91CuH/IhIGHY6gRirFt8zT8c/tJwWScu7wuSxZ8hMer6BGze7hP0Yq0Q==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr26037681cf.1.1766146503352;
        Fri, 19 Dec 2025 04:15:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220723666b.62.2025.12.19.04.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:15:02 -0800 (PST)
Message-ID: <3fcd274f-2502-4b3b-8a39-daf5e1938bed@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-2-fdfc6ba663e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-2-fdfc6ba663e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=694541c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aBc-ZM-XDHzdhv_eksEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: tThS-bHE0959DXNOw8lV5cHksM8Go0MA
X-Proofpoint-GUID: tThS-bHE0959DXNOw8lV5cHksM8Go0MA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfX69VrPJE9ylgG
 /f/fzWcB/1Um8aws7UyghIkPJ7Z4DKAIcixkGayUTNlT3/E6sh1/Po/hy12u3mY6/7oXHG/U6wP
 P0kYwNzh+YVE0Natw1P/qIbpsef6489YFzT4JSXjVHHOOmO4wttIUxSm8puaZpmXOFdGq+dB08j
 ka+mYmUG+T3UFMelytkYa/pPZRdLwngDbRli7Dkh492pNO2zaHL+ZIfZrLpLuHgPMIsRJpjBr8k
 2HQw5EqxjW25Nr9PKmvJYKwfDQgc0pWIfQdqs7xqBuTUGpncPffWZaAYOAk91bGCKoy534zZmKJ
 HJBPhjR4DrG1rPLdSiB7K0guGVTDfQRCV3vDsXJO9pQ6ujHE1f/IsVc7pMHCMI5V02kwvTf7GIB
 LpvTnH2zvzk7Rharfw1zjEk+Z+G0s5TYa1wF/pfGX1KVvXunHviFM48+lwM25m+GM9lOB5mm4Z+
 4EezC8n2CjA6RkRQy/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190101

On 12/19/25 11:00 AM, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node and mark
> it as reserved, as it will only be enabled in EL2 overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20..b65dfad71c2f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -8302,6 +8302,14 @@ gic_its: msi-controller@17040000 {
>  			};
>  		};
>  
> +		apss_watchdog: watchdog@17410000 {
> +			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
> +			reg = <0x0 0x17410000 0x0 0x1000>;
> +			clocks = <&sleep_clk>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> +			status = "reserved"; /* Accessible in EL2 only */

This is technically incorrect - it's not accessible if Gunyah is
present, which is only somewhat related - if you run a different
hypervisor which doesn't explicitly block access to this region, you
can still access it even though Linux may be running at EL1

Konrad

