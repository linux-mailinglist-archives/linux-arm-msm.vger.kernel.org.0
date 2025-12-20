Return-Path: <linux-arm-msm+bounces-86033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4FCD3334
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AE2B300DC8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E712F619D;
	Sat, 20 Dec 2025 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTQ+Aw+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Py55YGAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E452E6CD2
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246832; cv=none; b=froN1ST3gofyFaCVAd99ZFuE2oew8ns4qBH3vM/2s8BeNvF7C9U4xbz0IHl1oF64/icBoX/ibb0/xktkqaFRlg7fMwgtMszqRCayZCiDdxNFVafbLJSGCFE59BcDZ8iVeyPSSd+VgeCRHJklFohuTZA2Qz0T/ul+0cGjYhc7jWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246832; c=relaxed/simple;
	bh=7iLc15MgTuwmTLVdSfU5GvO1YoBOurOOB6j8L7l3QjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2JM9zRFARrqEhHNO++gX9Y02WyKogetMeFb03rqwB7r+D0K16yL35fruzD5hQVhNfdXnnRuU50yzyzNBq3LzsiBC3ovRL0TVmSFX4gEea2Cic6ERx43dYDgRfMEJ9OMT2+m3uyMcicsaN/0e6iebIPxGRIvEet7ynybnSPBu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTQ+Aw+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Py55YGAM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPTRw4137511
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6NZl6z/SL9Mum7SVO9rZG/Qz
	izYvtSD9+Rl/4uDxMBY=; b=YTQ+Aw+AW9on5Zoo7nB8e22DJ+REvaitvxbgaOgd
	yHRo3kCFj+GWjaBkQjV54hoaLaMEPyALweCkWNIuqG3/q315+yNGEE5Bi4d796g0
	dRhvATItrK64RlTycDoZ/eF6g5Qc/qXUC1DRmfyoyu2hzh8tyrS3ZOcbDZ1CFAfn
	ZwFmptJIHCAtgTYABBIGOvzPp+9UnXkDE3KNpaslUqrfh0jBXEolBZ1lmCAodfYw
	JkIPq3UR6oKy77koY2UJwEXbfEINOIsPiUmb32x3GWwdWahnHO09LC6TUnX2rTus
	p9zUO/+XSGGRehL/T/c7zZhhYMpHEZQrG2KePTdvTQ7ucg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfgwk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:07:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso62311531cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246829; x=1766851629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6NZl6z/SL9Mum7SVO9rZG/QzizYvtSD9+Rl/4uDxMBY=;
        b=Py55YGAMlqIqzmo405I/pGiotS9IhfXBcatNqFDKmQJkxIIbD1qpdsTzBkpa/n41PJ
         I+S4rT619BHqg1bHAEGrq7rUiBc9SJ2oljz9u4bG1pLaXgLhqygZdhpJLoBtNcGETiDW
         PCnCOH8ZItTk0MiKZE565VyDkrPEEA/fHdRA/BPkwii1xPTZ0CFKMM64Zd+RyLskfQ0D
         kqbGiMFjwo0/w34LmfxzRupVmGBG/R1rq1A7phwjT+F0xbiaIRSsxB7Ayfmkemsn8Zm0
         v2ekgIrIr/+f2AYh8/4zjijFKH90o5JxaCM4JMCIS/hx55N5h0X1ejmNrCLCDFxZ2ru4
         I7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246829; x=1766851629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NZl6z/SL9Mum7SVO9rZG/QzizYvtSD9+Rl/4uDxMBY=;
        b=K3cFUMa2oSHvRuhLgqcYx3O7jC+MBxBeqV6TiwBVVZ/m6QVW4uI14bpA6rJM5/kOyR
         vWR29uA2jYVk3OMGbOZCQ7l6iUwkPCaG2EV3w54KgLuxiMIO+6tGoQFByyh9dzuewe2x
         qv0zOR6byYXDGoKBk62Gb5tFz2lWZgLmiilVUK1Q7SKBj37WQ/Zfvv7jxbGqunCoQCiH
         UlGPrT5QAiV0mL9myak9Ml9S3nLW8QJoIYqceSmjSeYUOS6SHwjwolb8EZ7xHR1kL/io
         mKRpUkCN6OIb8jHwaVPGCQDjew+JM3aDdg47kFnau217/IBCiUPLlMdO5yxu13t3qplu
         W21Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIZGgbvB1N0SjTTpzl0cj03McvpSAPCwNXHqxS9/1w5/agR9X+nb5gBvpi2O+ls69bZTqmmg7as2OQhuNA@vger.kernel.org
X-Gm-Message-State: AOJu0YwVs3LVihw38fm46PxB55/jdLS61JwEWPW4fkV2wtoLidq8H/fl
	5bey6onrlnwQx94J/ytwo2AcJaJ1ARYU2Vz9VUbLg/sEH2OjuJK6wGlgPywyPAdZK9buCpZ2KPh
	siM4VpePfmhwuKxZLxd3wgrgQYT0pL7BQOESGnYsWHYzEqqveeNOjg2BQfo/Nlun2pX7O
X-Gm-Gg: AY/fxX7zA6eyGd2HuOpN8QpBhCqHTtRHvu8KEbKM3dnT9ghEdhEebkby4SORiL8i8rT
	DTz3ZLvfPSp6amSHLwUPBIVMxWb1GmX7Hn6koI1X7dIcVqJ8v2QgC0lW4U1FbROEr5rlJGp5DIj
	QrOBXaVeTG6Th0a4McQ22loMY/wzu4wNxQWG1zWQYNWA1wGqMjtCEinFKy5ncU/R1XTsnMXSr5N
	6B4ngTuplz81iZKW0v9eRgqn2V4Fnxw5MSvAWAJmJHng1fuDgn9I5jTLjmihtJnFPazYNG/0zxN
	Fahem2ZZBkvjEWRhFQs7rF/TrHiDgXS4es5acHaxbdhaF9uNLrKN9P8je+LXVn4ogflQS8hcEZy
	5OtZjwOHS3uM5VaGpwldNq9PAqCHfGFwycT8gJBWG+1zcku0mjVKVB/uVkkOINO241vaagDo8IP
	Pm3u9dO/PSkUDVPHVNA/LxJ7A=
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr100583231cf.18.1766246828701;
        Sat, 20 Dec 2025 08:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4XJPCsLN/SRIhrjlGIfx/XwLthxux8VMCRbzDyRXsyNHre2vMF1MkAyAsYxUuO5I0f26HUA==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr100582661cf.18.1766246828257;
        Sat, 20 Dec 2025 08:07:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f4d9sm1578047e87.78.2025.12.20.08.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:07:06 -0800 (PST)
Date: Sat, 20 Dec 2025 18:07:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] usb: misc: onboard_usb_hub: Add Genesys Logic
 GL3590 hub support
Message-ID: <3dxv26cwshuoxjqy3436fcwxabctb33aclahals2xzt2o5jl5v@axwollef45bx>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220063537.3639535-3-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=6946c9ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wDdryF7JnC3PY3xeqaMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Jv8fCBN0cnB59B0oSuF_JpG6FRUWkRh_
X-Proofpoint-GUID: Jv8fCBN0cnB59B0oSuF_JpG6FRUWkRh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0MCBTYWx0ZWRfX9jzOBexSMeF+
 WwaN4CG9+cUT1LaRk5C2m8bpKCRDL5/eoYliI/ddIMPejeZ143+AbIa1N8g/ZCKDHl3AKAqf98r
 Cf7pHJDu19AG/kqAtq01Xpuz6NoHrp9ULwg1s8eLYl/1q8BXAw91TUQiUv+DRpiYtEuccDkrpc2
 RuAmcWbMapD7U9W+h8JUtv/fzdUbfS3rwY4/MWvSQtKmtaUCUMwULw9CIKVff+8/4ckhHuXPXfp
 ix/CpNBdoHugOxaimAAYZsjDYyCj62nBSDTi27z9QZtgjNTQiaE4nw+Wa3cVJNV6WJmHUR1ekSN
 1hy08ySegtYSoG9KI/8MRIrY9FPmbmp9HcAqt/GhX7zi49LlQFkochO12nh/ThmQU1zUOabpecP
 iG8idKwM/HoJ1wpYyvPd+qvAwm99RR/jFweuRwwPbUiIjxAsd4dejc8bqmmiZNqAmLHLuYZYFsV
 vJdtIaOD6ClmiBjEl4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200140

On Sat, Dec 20, 2025 at 12:05:35PM +0530, Swati Agarwal wrote:
> Add support for the GL3590 4 ports USB3.2 hub. This allows to control its
> reset pins with a gpio.

Nit: please read Documentation/process/submitting-patches.rst. First
describe the reason for the change, then the actions to be done.

> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 1 +
>  drivers/usb/misc/onboard_usb_dev.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 41360a7591e5..bde303b820d7 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -661,6 +661,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
> +	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
>  	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index c1462be5526d..7706a04f2630 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -140,6 +140,7 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
>  	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
>  	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
> +	{ .compatible = "usb5e3,625", .data = &genesys_gl852g_data, },
>  	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
>  	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
>  	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

