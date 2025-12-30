Return-Path: <linux-arm-msm+bounces-86990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E924CE9F59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA57F3034367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEC8298CC4;
	Tue, 30 Dec 2025 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GH12eJlw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bX35+Uv2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC4A29A9C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105747; cv=none; b=NOzfd2+gJMbdJQ3/Nuw+E37yD5UZJworASIZsK9wk4htDtEGJsR0FpT/LmnfYjzC1jF6cjoaVx4YcM+O5BfLbyQOdBey+sTOU9IlfFTAt72wlBdH8fvqSVB8wJiCtR6z6nOFxoZh2z9LnaGsAEi2LtZA8OG458JQbt9ueKo+KTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105747; c=relaxed/simple;
	bh=MrnQarmOYV2lac9FGqbfMEvyRYTbLm43zo1p8N/7l9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbtosKdqpc4SL9Y/4+tjVrsGXN3MsHzv4w+vtbyS5NvEbEcRgMpl1SjOt/aw2JF4aqqpmiVKpa00GIhDK5Zx7Jq63+APMGvA/xNok23v9NIU9IAt0kpiM07C+oieJTUrPGAOGKOB5K9s3zeOo00xPMYxDNeBEQMEpUD9d9WjzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GH12eJlw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bX35+Uv2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU5RRMg898833
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6wor9NnrBVDrtADLcVPBxGh4
	umGNzMinOhfj/1NgI2k=; b=GH12eJlwnnupBW1LDcPUGiM+xghsBVil1gWpCx3/
	CPoKRe4iEIXRsDKpIfxeHpxN10fhw6on3Vy2hIfyNXPfe1mZqRymqVc9bG0LO83i
	O0plF4zuLUkh2yuY4SDNdjJMefYpGfv/GW2or38tppxabjigSSvCC+A9PgeyM2rx
	18oZBOUuMnxnWS5jGSm8BQLlQqts0Bu/WJDDXNO29oAkId90Tlkw78TfDYB1ljgT
	54t92L24hyQHcZOKUbCsHpu0I+NTEHSET8HZcxWcHuJJj5bLKNDcmB+atQ+VyrzH
	hydNgQAx48tIubaDr5eG8k92NocbQthS2ca1+KV4ad5hvQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky17fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:42:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2cff375bso229933756d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767105744; x=1767710544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wor9NnrBVDrtADLcVPBxGh4umGNzMinOhfj/1NgI2k=;
        b=bX35+Uv2BHCIbUXXc6rsku+mp8ElvJWdxMZQLfghNmBId8+HH4ZX0ccVlSCalG19LL
         ExOSXj/4c8QfSF5lkDriY5q6GlABE7OeAj+tvdLrnt77CkclHhcdHnUnUgJ39LV9Z8fL
         Fm37b4ZIqgqgqOahUVt8eTQ8qiTp3xpK+IjKk7L1Jtc69O0zWjO6H83cGs8ohJPOnHns
         SV9quZhnqrL6Kg2GwQPtiHfNSfunqfeTCst9CFjIFJnT0k44V1GMKONdMI5LhDyi/aqD
         lP8IFQJ2BbuTbghVRpkcNgaEnc1SxvM9vRydE7e4FX2l8NPlqjjo6RmMLK43UDodz4c4
         py+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105744; x=1767710544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wor9NnrBVDrtADLcVPBxGh4umGNzMinOhfj/1NgI2k=;
        b=r/scD/HgYmGCEDKMrjJuTBzogWf0WL8TgahKrXgSsO41gzcPhrvdMKcYwlww1ly79t
         RODdXNGyg6N/VkB7aRnELk8iOeE2Z+kRgI950Qc5MXfK4IuLFyftseK8F69KASzZGiDY
         4gmu4HezqzEoyvF5iDl7iM/BaVdUE/e7Y2zY7Ue37RrJkO4iodnRibM8Q9Ze8Uf0z2bz
         Boj7Qvw9ZyUUzQzNaQti8g2jByH4f6y5tBbqAq0kNucKm2b5ire1INrhXMRUn8OBS9qP
         tirX07HvuU36Ioif/HgeNKV7lOd0bfaF04WmbrtFmckACO7aodjMfWjf64EK0Q766DrP
         S4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcHZRU7E3XjkWy6rncR5wp/TuBGIRD7yJ3wKCE/FWkIhcTiIThcDCQKeD+eejCbtU2AY1U/AAr5lJNBhLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PVJAGG1TQlH3DkrK81g54cGCqpJvw9vURwEkObJ1A5hgmF5b
	NsRDp8H5JBFbmcZhG62aVbEwbOIq1sHGx0n1gdNGUxNozDRQ2kA29RlTVDcsU3bzW8T3VaQOfoM
	WV7rV2UGFgqbjGq18LBnrTt3UrmO2XY7p5HB8gaziuwfB5E359dtM6IkRx5PxPvRJ2cCn
X-Gm-Gg: AY/fxX4KiNqQT4NXeEVrqePi2cxgEFEYRgoyEo9myeYAbQPdLgfKRBZIt5m7iey0clP
	hULXzeHbU6WOq4M9A0uucp5h2u337V0VcP+27j+gCGu/gvwZZ4ws/Rr4MXjcMreb/VtmzX6nLWH
	pPHlGHADlzWjGsJLLjVzj2evZLWjVpacCgJf/vBhCiuo8mcrVKvMfSGUL0Uxo7a4MszwL3/NSmk
	g1wNw9b6U0QGI+FSu63+aaEdegx/Vm5TXoh6VHfrXNwy+jpEyOofQskMa1Dx2K/mUjKBGm1GYcH
	RHnr4JOVgQFXfJpCm+rjJL30oCnkHTkE2NdD5nwFgEg+LhUEkaBs50Oas2vcSWv21LHu3sBgAkz
	aFkaVxMzxYFCi/rpRTNgP6XHDH5fr5qhIHatIuJ6c/Q141v6dmi53t9V1/saEjw7Oui4vKae87Q
	EGAlruKrsgEf5UANsdXRSRHOI=
X-Received: by 2002:a05:6214:2dc4:b0:890:26d6:97c7 with SMTP id 6a1803df08f44-89026d6a194mr57810356d6.8.1767105743972;
        Tue, 30 Dec 2025 06:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3qcKT6J9QlY48hLzIyLaziU3BRR0CjBIYGNIjZYvlcvE40bj8TOipEVo2bMWH4KJeIY+muw==
X-Received: by 2002:a05:6214:2dc4:b0:890:26d6:97c7 with SMTP id 6a1803df08f44-89026d6a194mr57808186d6.8.1767105740314;
        Tue, 30 Dec 2025 06:42:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm10103389e87.43.2025.12.30.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:42:18 -0800 (PST)
Date: Tue, 30 Dec 2025 16:42:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/5] arm64: dts: qcom: talos: Fix inconsistent USB
 PHY node naming
Message-ID: <g5kczx6ywgxt6obfq3wgbmjatwuwuadkm2hzu3bs6togdm4gu6@ayflbqxjlvhg>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-5-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230130227.3503590-5-tessolveupstream@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzMiBTYWx0ZWRfXxYiueVZ8zge9
 ObHzlM6P77YWfZ+fbQHI0R5sepDcyUk8c72VN7f0kxdpYTpBL3OszyroWDa3Ffm9XTiT/unwyzA
 HTUn+L4MBeYcyke+rkCQVBLCFO56QQRxF69ct+woxwRxGSbRkndupE7/EXYuWf8NWtbI9q4a/5t
 0kR6l9K5hFFKe8xnMR4bo6rm77moH8DFKwwCRjs3H51PqQHRc8tk+FGdYGlqY7zSFpwtYS27Jg2
 BzzEquqNbG+ZdhnArG9QzAGYbQ4FGOvfd5QD9Z3Hp2hNtYLz2y1cWwT4vh1egEVQ8oRasQyrZZw
 OyuvXraIzvJKNy+NvO11lhatbYyLJc1A5+zdOGDFb1BAG1xR9K4QzpdARyBawBgfa0p2MPyPC3m
 EWbSSsS/rjuMKUed5YkYrBjmqnBchVm+lCcdJ+L64ddltQfhnDXyynw1TQeY5sGXNcfjQwk+mvp
 GhLG3gHXhUUm0urN3Xw==
X-Proofpoint-ORIG-GUID: cMtVlsxAdY7EkAdnpkk6AqP-B31VAISC
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953e4d0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=YpDlA3LpCkOueRwPcZ4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: cMtVlsxAdY7EkAdnpkk6AqP-B31VAISC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300132

On Tue, Dec 30, 2025 at 06:32:26PM +0530, Sudarshan Shetty wrote:
> The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
> and 'usb_hsphy_2'. This patch renames them to follow
> a consistent naming scheme.
> 
> No functional changes, only label renaming.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

