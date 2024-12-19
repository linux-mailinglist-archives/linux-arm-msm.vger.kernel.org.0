Return-Path: <linux-arm-msm+bounces-42805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128E39F7EA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D028165135
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 15:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECABC22759A;
	Thu, 19 Dec 2024 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2D4kreb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E0226881
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734623782; cv=none; b=TC4GIl6eKdaFxvO268Bi++S+ifH+vR6hEDa5GyYFHenD8hENzPBk/BNZDVsRAUWlCa0H4DeOYu9qn7ipd8ff1WMLZ8P294gCK95KDPcXCNN/3i9ZVUIEb1zZiGUmpFnE1rKAXhiAPTPbqcsoDxKaA8sMu/j08J+Y5c0EsmAdmhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734623782; c=relaxed/simple;
	bh=X+7eCtuuAFOT+5f71rAISxWG4VVudlHgu6ncmGs90f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwmPh6srLPUPGXmmqEleeIM66AqHkH/Fjr1mFwUpWMe1IO4WH+EwwULlMHgrzXqgqJgF99Vb1DmJt/Lw1ZLqainsZUXTsE1PRcqjpLSCV0tj6VnWyXiBXZTwj3yVUTriNwpD7LEt5ujpv8jHvbAnNjBlCrxOSBycxBqLkL5QCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2D4kreb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBWHYx026574
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQVZ+St8cP/DMwgY6b7CIegBtD91hcvRSJsrCeCGi8E=; b=p2D4krebvJwnh1rn
	sUTqDYhIiAO2IH54PyVIT0jOYLl6ZpDxfFl6/s5XvzWSJg/4HXA6b+jtmiD9xUc1
	08JQvjEy9czKkYd3WOrfK0jLW1dR0tB0WXBDJnkF493XVoVNzmuUJL+jbt6lC94w
	E8bsfcOUSnhnD1aaVlgPviCfFzKKMxmfixYDe+CQz+G8i0VHxxagaWo7sxy2vBw0
	zrtPkYVknSCieSvFsl4ROgQrfqdVvkP57YPVlUv8M9EF7NlGFYtwITzUbjBj1tYw
	VXAwjT7Iq7hZb1dT+lb0NsCYDufIH3dmByGFmLVRgtDCWkEKPKAU1BEVgZ/RsKKt
	xC0jbg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjpygqg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:56:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d904ac0ea2so1480126d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734623776; x=1735228576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQVZ+St8cP/DMwgY6b7CIegBtD91hcvRSJsrCeCGi8E=;
        b=Gm37a14U3CA+HIMJloUoaer4TpoOXUvxNdebomej4aTsM8FXH3hFjWPinbK+0pwghk
         Q/ktAWQWZqmfheFllmQmO5ARvd9Sl3nFLRtJDaKjwz4SP3PUueAOT+YU8b5cde3o041x
         p/Obi8h27fMz5z2ZrdwSUR/SVuNlBGzwbiwz4Tkd2dfQUr5wE3kwnAFWHt1/6eM7tFCv
         T68pPc8cX6o8XRmrf8ljEANuTrqXLq9kqSrUK4B6s2NQpZqrIJI8bqHuG8MuyO4Q79k6
         Aag30Xp5LN4WAZGVlt16uKWDe70UzzIFUeB2UJ91d/duroiIltuxuC4edgt5WG8S/RAg
         z6Dw==
X-Gm-Message-State: AOJu0YzcrhCGb9wG8vSQmMsuirFHqUwfFEdOqfh+OYISWSkF9iGwJByT
	gr4IXUgLVdq7WnaLwZ2cNldB2uL1XbJK71/ugJU30HUOfkwN/Dg3yoyTB+dEbxvZeGckGeZZpDJ
	uTwItLBVoAvZJw4SLvlORgFO94jkuGNtAZj747mcmDsIWfVyH+KBubmK114Tof6fA
X-Gm-Gg: ASbGncvqmHa42Er5zUI+2+HCw1nz8s6yVkL6blv0w45XwkTYZiw93D+Lmwbx1ZoSO6R
	eh1M1zNGeQ9tvhZjRlKxKmORd6N7pNjHTpKSPDBxzJmxLLXBYl2cn1m30pUArSOc8juWQKYLM6U
	SnbryDe1ZxAQWHMHNU06HSSOUvOWd/Lqr6GouoFh41ROmMSiTp4CwlYR43sd8VHCH+PbGEE+/bb
	c0F+/ze5UBXiEU/9wk4X6QqIVO5WcFHRehnUlGPrgNUPeg7jYV1IWmtPn0n6uNZsrqj2//Ztfuk
	hskZWL0EgGWS5xHu7749hMy76g3VHYUdf5M=
X-Received: by 2002:a05:6214:2387:b0:6d8:adb8:eb8c with SMTP id 6a1803df08f44-6dd092640e4mr49331536d6.10.1734623776537;
        Thu, 19 Dec 2024 07:56:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErWtDjFEcXFh240vEg6t5u8w+n+H+TIsZjcBAGfXirJYi8k3mR+zpREt2LW2BDL8Ct5Dmb9Q==
X-Received: by 2002:a05:6214:2387:b0:6d8:adb8:eb8c with SMTP id 6a1803df08f44-6dd092640e4mr49331346d6.10.1734623776174;
        Thu, 19 Dec 2024 07:56:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4c1dsm79222966b.109.2024.12.19.07.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:56:15 -0800 (PST)
Message-ID: <97277ffb-137b-4958-9c3c-e3d4973332d0@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 16:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid
 switch
To: aruhier@mailbox.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20241219-patch-lenovo-yoga-v2-1-4932aefcb9c8@mailbox.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219-patch-lenovo-yoga-v2-1-4932aefcb9c8@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MyMSOTD3LGrjwaU8BVVVseH2ObcfhGX1
X-Proofpoint-GUID: MyMSOTD3LGrjwaU8BVVVseH2ObcfhGX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190128

On 19.12.2024 4:49 PM, Anthony Ruhier via B4 Relay wrote:
> From: Anthony Ruhier <aruhier@mailbox.org>
> 
> Add the lid switch for the Lenovo Yoga Slim 7x.
> 
> Other x1e80100 laptops use the GPIO pin 92 only, however on the Yoga
> Slim 7x this pin seems to be bridged with the pin 71. By default, the
> pin 71 is set as output-high, which blocks any event on pin 92.
> 
> This patch sets the pin 71 as output-disable and sets the LID switch on
> pin 92. This is aligned with how they're configured on Windows:
>     GPIO  71 | 0xf147000 | in | func0 | hi | pull up   | 16 mA
>     GPIO  92 | 0xf15c000 | in | func0 | lo | no pull   |  2 mA
> 
> Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
> ---
> Changes in v2:
> - Fixes patch format.
> 
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index ca5a808f2c7df66a861a933df407fd4bdaea3fe1..311202aa9015a30f1d70108bb214d427f811dc3b 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "x1e80100.dtsi"
> @@ -19,6 +20,21 @@ aliases {
>  		serial0 = &uart21;
>  	};
>  
> +	gpio-keys {

If no better sorting key is present (such as base register), we tend
to sort the nodes alphabetically, so this one would go between
chosen and pmic-glink

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

(you can use `b4 trailers -u` to pull tags automagically)

Konrad

