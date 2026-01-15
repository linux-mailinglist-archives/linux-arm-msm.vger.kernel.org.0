Return-Path: <linux-arm-msm+bounces-89124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E01EAD22C7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0D6E3020690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7A9328623;
	Thu, 15 Jan 2026 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbKbqBLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNrkqXJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC32566F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461634; cv=none; b=eix24t/xMt0U0DL4a1PJryA7+eKrP0WHg8zr7AihjCrvzAiybIq9IwZZTUeIZ5EKxRbCUb3Zxp71B8aGccNIXQE9oBdmP2vqIWBXC5fgsfrXOEDWe349pjV6v514q+69wevVRICYX7jXWzF0Ff7hPPc/lh34drugnRYBzytnpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461634; c=relaxed/simple;
	bh=aGPu7lOAxostfIr7Hdv6uuiYt6WlfrfULOUu5vhYRCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGzsdvuhXJ3uxEr129dTVeqjSFOtFawCzkWBfFJg5/71rnesOFNDOt+3cF47sf9KI+RbXt5+2RGk3kFpA4LHa/0/D6QXeXreb5sb/t4+IpDCAsb9vofTXRYtn6muebNU9wPN8Gook80N2K21lDScR1UcQrMJ4d0snPUJGTuskMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbKbqBLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNrkqXJn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g13g1055237
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JsqJ+BcssC0bKx6pEIhys3wH
	xBLuNFT3wIZaKyupUSs=; b=UbKbqBLs3gYRK8Aif7LqTLI9NQ6QZD2JYWykP5Jh
	xGupDlxsUDIxVf+LY5eJjYqDp+tHoqFruP1QrjUBsHXUhpsraovrN36lC1x0I+tj
	X4JKJvsUUU9o0MvFoV3m5fj0rxM1sF1WSjHHKCg2bH0iE5qNsYrLAYlF63hR+4XR
	uoltrvKnxUIy8z2nK+7y4ForH3eCNF8fU0UJYweUOaBqLZXWclB10H/thLBJ3vJc
	EJaz9STd+zxe7RBJbqaXFIXkxsklm4bQQ/SmXxnbw6LmkjgXov0jEXB/KliI6VDG
	iH0OU84es+F3NtoKgkjo3cBELvju5MuSTb7kKpX7+dLewg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d33qcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:20:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52bb3ac7bso102071985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768461631; x=1769066431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JsqJ+BcssC0bKx6pEIhys3wHxBLuNFT3wIZaKyupUSs=;
        b=GNrkqXJn2cXdjdwTcwdr/TAzP9gwmM7irnKBEM8/twMz3XkdLurS3y2EAK3DJKvnpT
         Yt4j2J0zycrPBfpffjBIj3Bk84BylByiHqjPrE6EtOoNyIAiAHoZRLnkBaMA0ywB18vs
         +D7DGqW4Dskaju8Csc7X2ao9Ig7B0OZlPtGmhEf1U9vc3xtLKob3z0h+SmZXrErWw/tz
         iL6tXL6+APF1beZpGBSfWtGrzNMORXqkITzYpPxnNjlG1dSoIxAf7d0NT58CKOee+5ii
         qGaWDCK3N6WisbqhH6PtY/6xJpe0BlGDB4/+yl9knzRLh28XWizEgfmh36moeLJbPeC2
         i2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461631; x=1769066431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsqJ+BcssC0bKx6pEIhys3wHxBLuNFT3wIZaKyupUSs=;
        b=HIuk9ClUAYIDf79TjqdP2ssft9W1+d34q0QCawMqVXi+Gl1dFll7ECu/JXnnIWWsgc
         gHvRib7c2c5/swhaofWPLhk++b5kJKJpFX1DuJbW3xYMwJqQNZh6BA2eop9t1UnJjSSm
         fNdTU7gIzZU6oEgCdfN3VsbH6/LIsgxv5pvtvv2htq0Mya+vaWWOKPi3gAlpWzQzu1CY
         xhAYQAc5rN9LNH2E9K/imDyz0hKtMogFKr2KqBphyx8gVQzbL8rKe8pdsxIb9vrrvKK1
         jCfP519oKJXiXwyMNE0y2yDAE0xVTxKTYVcaBOvNu6NkWHxkvBTIldLdqutvJE4FAQpd
         bFJg==
X-Forwarded-Encrypted: i=1; AJvYcCXaNFIcJgG2cJ8yJwfwUQM2VCNnLBjCzE29Uqg6+GQllDqpQm8OpqlCR4Xomyl3/tdTjCAgusxxG37xkhDr@vger.kernel.org
X-Gm-Message-State: AOJu0YyF1jFUxgSy1WUrMIzsdX6qLq7ap5AzCfBbMgzu/zoRfGzqgPcH
	ydTkkPN4nDvIFqDc1sNHRT0yElh7gdYQYu1aTSXX/nHgdYmNnykk+U8dE65xYZ1L9kCBpNhY2As
	hQjuyMrn2TR0bkezumb975/KYNU81hlr6hZtSTBS0nPNv2NR5Soc3V2N0bgq5f9EK1aQt
X-Gm-Gg: AY/fxX5WGwOOtiyuf3dp4BEdIB9/b4XNP1uMj/k0ArEDPBJSCOI/RN2RDYdFJjqMLl0
	epShvLzAS2KL5L+prTcxAFBfDn5O9HkipPJkMPerWcv5kG0+3GkCuYKwN9OvJimu04uTb+ENM2S
	xlzFN+Lv6Fd2BsTP9h5SC8d5LJ3GmCnrEkrs5jc5kxfo2SHPlxvTdcZpeuk/wGMo2wDpDDfcHMB
	bKDCemv3dx4q0xn4D9ZuTlnUut1vNI9pYkG8aFSm81vOGSTKRCdgk/FhW9hMed1Hyp2mR5HcIba
	a2GW67ZiavJOccCEahIxlmBJDYdb9ryFevb+euNULfFS6zj0KtbZQsapyLndLgxC9ZMBfPiFUwU
	XejntSdnZuTWX5REB4caI4Xu0sxgK1+rPQT1lqpwlLQVatNAjnFgH7Dgb7uODw0DGt1DesSjL0D
	+vd04vo+wQeS3cw6IqHqVpJkU=
X-Received: by 2002:a05:620a:2806:b0:8c3:6f20:2ed3 with SMTP id af79cd13be357-8c52fb2408fmr677710685a.1.1768461630722;
        Wed, 14 Jan 2026 23:20:30 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c3:6f20:2ed3 with SMTP id af79cd13be357-8c52fb2408fmr677709185a.1.1768461630260;
        Wed, 14 Jan 2026 23:20:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba104a397sm1420598e87.92.2026.01.14.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:20:29 -0800 (PST)
Date: Thu, 15 Jan 2026 09:20:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
Message-ID: <mq52brcwos2tzuvwkqsjkii6ldukmpxhauvs4jrgmmwnivn3ex@ar6j7fprdf6k>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-10-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-10-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-GUID: H0LF5A3tIUgNbcUv9arzVsFvZliO0ZZk
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968953f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SSOGFJmjRk5Osm8MSs8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: H0LF5A3tIUgNbcUv9arzVsFvZliO0ZZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OCBTYWx0ZWRfX+hYWf4gMglac
 k8A34ilcW+YewS9WgJmpVqlBMwpudOtxKBrL8MQJ8kRjhmJvONYuPw5sypJHZUpNG8dXAggp9FL
 S/kgn5x0eWm3ok7OpYPgFjyAqnfUhM92fBIOJbrtZXIgOYI5qx95A38zx2d1O2fcpOrD7fH1KSG
 4YcQ2NIwUBKaNwhALAbJDpnhmQK3ETrmmLONnXAZ2ifoY8eKndv3D/hNDd6gNUc8uyuOqcXSyVy
 kRooulqnjUiq3EdbotZj4xZj8veLGa/enhfh+9EyiU63dQmU3Qq/6d15OOWM9azfwkf7L6HQp3n
 x/MQY/yDteIDgRhC6MeLG+RdGo60XXT4jHr0XR1+ChCTHFF0QX0efplDkjMqCEIzvVnTAYTy6vs
 Rs4OdR0h9qliAYQBFVqJIwRHxBqBNCw1dcBDcsMnyWGZ2IwvXYCOqMfGcJ+4qGGGI7jR4DJVUYp
 NJPrvKHZfQ60RmMH8jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150048

On Wed, Jan 14, 2026 at 10:49:12PM -0800, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Enable the Kaanapali display, video, camera and gpu clock controller
> for their respective functionalities on the Qualcomm Kaanapali platform.

On which board?

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c43dcadabec4..84e9d5785de6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1452,8 +1452,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_CLK_KAANAPALI_CAMCC=m
> +CONFIG_CLK_KAANAPALI_DISPCC=m
>  CONFIG_CLK_KAANAPALI_GCC=y
> +CONFIG_CLK_KAANAPALI_GPUCC=m
>  CONFIG_CLK_KAANAPALI_TCSRCC=m
> +CONFIG_CLK_KAANAPALI_VIDEOCC=m
>  CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

