Return-Path: <linux-arm-msm+bounces-79984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2FC279CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 09:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AB281899368
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 08:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E8123AE9A;
	Sat,  1 Nov 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiHyVG1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQTz9N+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DC29B224
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761986407; cv=none; b=uH+sQqJS+06CjZy+Ma5SXWy0EoSlOhFEGB0YS7HHaB2MWVZ4gwsPeaHMkST3bJAB0VG+LDlR3bdeZB7OkhH6eSrTRMaom2zuhOHgeiz7cJBOfr7os2572mhXQpSlyDLzElsIhmS2tdZDF9RI7ajwvfCMk0guDcp4DPkrVGlrC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761986407; c=relaxed/simple;
	bh=Da0py1Y0E4x4inIQd2G3+AMVd3teJHimqtvZ03C6K1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=po3vo06rLUzIKZoniwEtPa9lBaRFI/5vAuVp952ZJ+tVQtWyH9FyUF5L3L4LE552lDxo6YisdoyyJkYjkPNVBOGx0H06R0TafONBsQUujHoTQBHIFSQTSpulunmlOQWqoquI9R0cvDdSyScvT73a26fnwtG98QOrv/QE2dzq9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiHyVG1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQTz9N+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A14Cuf7556829
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 08:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiDPYD1MU46TmXyxWiXXTtTFKJuO4K8jYXckjJideXM=; b=YiHyVG1/6H3wiyse
	PlS+APALLWJ3BKu/yiRG/e8AEuOFKTGOxz9TofFfn58A0aHY1W2PShNZp98Z9fmK
	KFEcGgevzKGJ7JL/O97TMIufwY/58Oy/ekUapb/RxvmXoSu3YEYMEwI58lPwAV5x
	ERPJdjU3kTj0feqA7C5SK+Mw0VjAS7tCLp7v1U8FpBTtKF2ztOTfkUqM/B0/6vP2
	U5XFqwCD4/IVHUyvl+Iin1dHoSrUKwoK87X3TjWsExB9T+ZeW9yBVfMThgf3AOca
	VA3bNGzyW3jckxejoAKLLclTyKy9sN1DALHaaz/KDHq2BwFDDWIMLd9APFaAuira
	jUp+Sg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ayf8aff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 08:40:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so39491001cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761986403; x=1762591203; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiDPYD1MU46TmXyxWiXXTtTFKJuO4K8jYXckjJideXM=;
        b=dQTz9N+Z885HYE2TyHkik4d0D9rWoj7Bfg5HpEIYiEHMktBRN0ch+BM1Mlifl8kMoM
         2Yp/lvVMxGJGxOgMjFSEUImfHpcVOd0NkPzYFtNOsyeZn1yJ6dnOsIbwzitJHLHAipkQ
         qIN3IE61rgNwwSfCcjB7dFvQseXw7cys9SYZJyhRU+rN+/LtFdqn9HfTGQxM24tcZG7c
         NzhKs7p+UN/2EHLIofbKznFg5AK5rWYOMEAqMpyb4GhmmlCcMd3YLHDEs1/PwwSJP+GF
         qy7Zs4A/M/m0JusriUoDlUEdL1FmEuIu90+Dr7VazBVL8XbOEoQXHSlf2i1k0kyvJy6v
         8W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761986403; x=1762591203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiDPYD1MU46TmXyxWiXXTtTFKJuO4K8jYXckjJideXM=;
        b=cICePuDL3cfmIZvpwAAtKgiJjtR8+JlIIOKOiozhZ69w7v/RJbATyHeAto9I39Z7RS
         OD/EiVhsqETX/Q4k4bu0R+EOVbsg4Q9X+dOmmWo6P3dvKLRSNuoErmdRmRMtsy22qLKk
         WA3OhjEd2+G2wDnj/yEfJUdFMQU7WPLY7d91O7i9L5ZLOwau+Lq8WYHmco/9+ekDqNFB
         n6mo9ZswBu8KiTVUDV+/Egf43TBha3cCqMME45c45iP5RfpisVywTpa2zMwTXJB4KtFJ
         /98pXKsLqfkIE/HZaJa1wp/GcDlvw5ITwFckS1dXxxIHRBSKz9ifBVIyABbXr4DVg83z
         13/A==
X-Forwarded-Encrypted: i=1; AJvYcCX89dF7eZMSWINiG497oVNjf/QRJslLizPJPV6a9comJsutlCtZ5pb2XHq39g8ClUd+HDtHjqHz1JkMRYeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YypK6yq0h26qBbEp++9SRiF1b2z3kgtZlvOyN6f2NdT8jmFNJpb
	wRyaZ+JEcNpVBByxhqEQ3uGJnfG7IdzKNUchxDEQ7N+PU5SGs1CWhdQhVreJfh68e4QHqou0+Sn
	bBdptQr7LZJQZg67zlSinqF31gI64gVtMkN+p1RqMXxH9rKrs8otl/rqCJkcG7DhSfj5y
X-Gm-Gg: ASbGncu3zVnlAm0aBfWJz93Fiy6D1WR4rIOMvchUGDjrpMeRxKcB2VrsfT0guQWAwSi
	vzh81e3hY51C8WwIG8WaLAm2rcGRy5d0h9rdtPpmEHW9BwCr5cm5VGMTovluELeeP0gTb1BM8gA
	Pol28izWIqzpnMbvhgxO5CQAlivrR5WNzmn1tLq/tYa/5vaNf0A4GWIX8rR02rQI5NDviZDVzBR
	tdYm8FHhIy5Mi+MsvrWsQB2nZ9yHo6dZkxZdxMrxmXBpTZX20/BFoZzSI47IlnZb8jxvNLGy+We
	pC98nWpPb7iZI5w6EOWwq3ghpSO9m0MFKbbrEPh4WpgNxK8MJYd0MWl2HRLVBw8qOoZEhNoShRA
	GI8Qasx8ew0xSt6jNDhHLuTvv2MsdTvyh77oYkZVrzMDGJt3DLk/87nTcaWodE67hIsD8b3PVzq
	IUt5DIRw9wjpnE
X-Received: by 2002:a05:622a:1b19:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4ed31077a89mr88339481cf.64.1761986402654;
        Sat, 01 Nov 2025 01:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU9EgMJhiC16qX9D2bKMP+GqfW3n0SmoSciun4HYpBFMbXg5yU0XcuPEvAwldmaDJv1QV+1g==
X-Received: by 2002:a05:622a:1b19:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4ed31077a89mr88339241cf.64.1761986401945;
        Sat, 01 Nov 2025 01:40:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f39d2c0sm1081455e87.46.2025.11.01.01.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 01:40:01 -0700 (PDT)
Date: Sat, 1 Nov 2025 10:39:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for
 dual-channel LVDS panel
Message-ID: <mit5xey5rorafacljgnayvjpnbkvtpxis72pzhgnuvjmzmc7sg@c2v4bl6dm6wq>
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <20251028061636.724667-2-tessolveupstream@gmail.com>
 <d05fe82a-640f-4a09-9d83-39bb5aff179d@oss.qualcomm.com>
 <9208d2ef-79da-4e80-ac1f-e01fa5feae0a@gmail.com>
 <sfxvtfzzstdbt7in6z6ztsjfy6e555fr3sjbi5kqkv5sk77b26@kl57zs7iuuvk>
 <ae9021dc-e0ca-4631-b45b-3cf9f526bd14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae9021dc-e0ca-4631-b45b-3cf9f526bd14@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDA3MiBTYWx0ZWRfX/OvjsoGuHt/f
 UQWpiLwBlkxTUY2uVO9mUKqeaGjySu4SABqpwp67XRuZfLR99C0AGcHQ6/ZnTpcCMYNizKd2uMi
 5b00MZNiRHO3bjYqYSyLacQL1LX0ts5swF42SXgWQnnLHAZ+uPGkKge7QJoXx8OkGDgBzYLGhBO
 SPXqt1UkFylZ4q4ckHWhZg2Vrr4mzhysQxVhQr5UyuaO6sVSpzLmY6HCZlPEP1X1RSBuNTuMvNm
 yX6/M2Sbdj7qH6AK6l4zNIVOR6uyV5ripkcYjOxgfhNilsNAuobzJGjHsnabpQ2fZq5+kNW80GD
 ocpOGA8nUSYK2QITyXEbBv5iVtCnMdTQzs6Dnai6JEv6ah6tR9Jz41IXHB+XHpNH9N+h8h2rlUg
 HKeXmUWT+0ekQ/7partcj5/OQFcbGQ==
X-Authority-Analysis: v=2.4 cv=Scj6t/Ru c=1 sm=1 tr=0 ts=6905c763 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=DJbqY3hvPHzaRxFNiBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: y5cCWOkzOKuODzbHPjt4FbkkK0Cmc9nN
X-Proofpoint-ORIG-GUID: y5cCWOkzOKuODzbHPjt4FbkkK0Cmc9nN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010072

On Thu, Oct 30, 2025 at 02:24:15PM +0530, Tessolve Upstream wrote:
> 
> 
> On 29/10/25 18:04, Dmitry Baryshkov wrote:
> > On Wed, Oct 29, 2025 at 05:50:01PM +0530, Tessolve Upstream wrote:
> >>
> >>
> >> On 28/10/25 14:55, Konrad Dybcio wrote:
> >>> On 10/28/25 7:16 AM, Sudarshan Shetty wrote:
> >>>> This patch introduces a new device tree for the QCS615 Talos
> >>>> EVK platform with dual-channel LVDS display support.
> >>>>
> >>>> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
> >>>> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
> >>>> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
> >>>>
> >>>> where channel-A carries odd pixel and channel-B carries even pixel
> >>>> on the QCS615 talos evk platform.
> >>>>
> >>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>> +	backlight: backlight {
> >>>> +		compatible = "gpio-backlight";
> >>>> +		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
> >>>> +		default-on;
> >>>> +	};
> >>>> +
> >>>> +	lcd0_pwm_en {
> >>>
> >>> Use hyphens instead of underscores in node names
> >>
> >> Okay, will update in next patch.
> >>>
> >>>> +		compatible = "pwm-gpio";
> >>>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
> >>>> +		pinctrl-0 = <&lcd0_bklt_pwm>;
> >>>
> >>> I think your intention was to use pwm-backlight and wire this node
> >>> up to that
> >>
> >> Soc does not support the PWM interface hence we are using gpio 
> >> as "pwm-gpio" by setting the duty cycle to 100%(i.e. "no pwm")
> > 
> > Why do you mention PWM here at all? It's perfectly fine to use
> > gpio-backlight. That looks extremely suspicious since you are not
> > referecing the pwm-gpio device at all.
> 
> Thanks for the feedback.
> GPIO59 (LED_PWM) connected to the panel’s dimming input.
> 
> Since we can only drive the LED_PWM pin high (100% duty), 
> it does not provide true PWM control.
> 
> I’ll remove the non-standard "pwm-gpio" node and model both lines
> using the standard gpio-backlight binding, like this:
> 
> backlight: backlight {
>     compatible = "gpio-backlight";
>     gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>, <&tlmm 59 GPIO_ACTIVE_HIGH>;


You will have to adapt the gpio-backlight bindings and driver to handle
multiple entries here.

>     default-on;
>     pinctrl-0 = <&lcd0_bklt_en>, <&lcd0_bklt_pwm>;
>     pinctrl-names = "default";
> };
> 
> &tlmm {
>        lcd0_bklt_en: lcd0-bklt-en-state {
>                pins = "gpio115";
>                function = "gpio";
>                bias-disable;
>        };
> 
>        lcd0_bklt_pwm: lcd0-bklt-pwm-state {
>                pins = "gpio59";
>                function = "gpio";
>                bias-disable;
>        };
> };
> 
> Let me know your opinion here,
> Thanks in advance.
> > 
> 

-- 
With best wishes
Dmitry

