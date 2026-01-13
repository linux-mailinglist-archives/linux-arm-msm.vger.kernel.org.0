Return-Path: <linux-arm-msm+bounces-88757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C7D1825C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3169B30133CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DDA369214;
	Tue, 13 Jan 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPej5d/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkdBx1Vg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28C346FA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301270; cv=none; b=JPT33JeuDBbwVR3C2w7z1X+Uq5pv6gF/V+W19I+F2RC3LKz/inrnA+mUd7clNKL5lLv1yEEPswsjeS1HOXnJDkpg26iTM4sO6AwF/XLa9WJmqw4BcygE2+aVSkk0Dq1dIRtdzZ77hEoFbA7tz1QMmVV7f4ALHs8IDFmICCtZZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301270; c=relaxed/simple;
	bh=VmAu7781od/ukoiPo1qxRm614qXoDBcYRBmSfXyOWOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVu1m8PinmT9hEpeiuWl+Fs8/w+ZuFnNL2B+OaEkP95LAHV2+cleyAhGCd/VyBIX5z7lUfy9t7RlFIOzrln1sJnKhuj9Gws8sDQWff/z/yTJVqkFOCk50u0w+36SBTdMukZaqO+6Gms6qYcNUEBOQGYdJ4NlNXId4oJR2KDXkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPej5d/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkdBx1Vg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7nN3m3299965
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kY74zZwO+BeGa7SUmLxjN1G/Hl2RRh15cAmm1kaUr0=; b=EPej5d/PLrlfkize
	RbKJi/mCuaHsj+TAyEsrU7hgwhfIzXjE3k1kn997tD+DlGXH4L0MD4Fp/RfJBkXt
	QTZMQCEpEpJU5VhjU9C5dQRpgzyeuAYhvcZ7YnieNg1YRAzlNuShmzeHHp5dk/KM
	60hxRzor1t3X2NbYPGPNxSrM6ZwZtz7Hzq8MDMO6CUWSrzuOdOPBXqdBDUC1Isjz
	Y8n3o/ZFzev+oBQr+Lh3znl51rseiNX2hrd3vMuXKucdWXdx/WKaGy5uecADtZGx
	/h3ZraNGEaxxHYy8E/O4d/vob03EwsreNkVcgmcavtmlfZQurXb1ZUhXkP5yUFa7
	5vqwFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmaerr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:47:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c2bcf21a58so1996206985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768301267; x=1768906067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kY74zZwO+BeGa7SUmLxjN1G/Hl2RRh15cAmm1kaUr0=;
        b=YkdBx1VgekjEn9UsFz+PaxgbDdL5x1uM9SP4O3OPs17pWT6W7kIOu8QDOu/dU2z9Gq
         6LiV57GLWb0tqbT4jtmFx7hbkjcdqgiDgPapIT/Lksv3Cnv1+m8anbVRHvmvIVE2bQwE
         H/Aie1Ze6lXFPu2LfJvWNtIyodthTIzsmWg9ft1N6TkKOINQV82DB4Q9A1QlTsGfHsbR
         ULHK53TpamnVQx6Hobv331qfNyrMcDx5cTqWstHQHpMLhSvnbvPtoOvRv6LO6OZZr7Dj
         2j0ueotCYySmJy9PmgThiE+KnIb+AeUTi+zsXvVnA9BbkhLABofJV+cfA2Ox6rR+8s38
         B56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301267; x=1768906067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kY74zZwO+BeGa7SUmLxjN1G/Hl2RRh15cAmm1kaUr0=;
        b=WSNdRKJhhVKtNGuoNGdFhg979gknM8fYRSYrUe5HdkbI4IoRqAaj8PJlsQ0vcy9/pU
         q/sRcqX3k0+tSDRkibKkYgDoM+0rfD99ZZT+cH5TvSE5JpQQzFF7wt9ut2YqvS0ablC7
         69ZrYpgIBwloToonDx0QfmQPwa3qYQwW7P6EBriw7Cwp/w4N8WgwE82BJuSNokAM47zx
         dL6HtMg545c1dhcpXUjydPsWwPL6svAhxuDQRYv3Y9BHmb9bm/vSrN4UFRo/dWf2UWMo
         Qrdu+MsJ2/hnLtLoFFKTTeUhN4s0xB6NA2JEIvle+AC86HVUYiSTYbmQUCMibKu4SsAu
         Nhiw==
X-Forwarded-Encrypted: i=1; AJvYcCU7ye0q8JFvdQg6sULO7xgSBUu5hd7WXdcJBS6j7R9HMnquVRoKN5+j+f/pOFRoWRpIDSq79yIqDrKLQ4Ke@vger.kernel.org
X-Gm-Message-State: AOJu0YwZZ48MDtYe9HfY8/wDbz8LKp2dezywCFxq0yRY8ZGC4qalMMS/
	qKZC4/Fq2KaP5dOotSo+YQH5wnUCE5e2I3hmgPIe4+KjM0EibMyQT2vG+GcXZ6pCXJOVXBdyhac
	dR7RV/cNJGFs8uPnNRS807IShGYeFR7Y5H3t4D+LeG/E6Q9qFASR/Ya3Ew8CuNpy3tFeB
X-Gm-Gg: AY/fxX6NF2MaWDSkY63ZHHld38fcxNFXKT6c3AQHx7xXKvNeAfAks+bl1MF8OQQqS3+
	2vN0sBIc4kxfGE9Ae4A0hWEyff0avFWhTUKC2epZ20PkCJlQ9194O/9vxAnKdOdquB9djWoOl3B
	t72pcoLLsNjYb5De8+7qZp6MLj9G6q+8cs9TzGKvn9eejpSeb53dGfgSMmpY6Sld1m3X+wOlCFD
	sjc4K7sI8wf2Qps/DnDPjWHBubTwps6S4wOgFiZpEOLjVfV6HPW7QDoWD+jfU/kbRlTMcPqbnXC
	iG+2JVfkosMal9LgwtQtMn5EkrFt2u218K7pJNvF7Y3cwzDn3KBIZnqFFGzjIMQWj1vJqTTU5uW
	+3L9KeYWzXTNQOsUgKCq48VYc+wLmvdDDWUtDhe5vssa4T6+jqeYcLQ1wIwyyGkUPc7HcG9mynh
	MpOGOxLUhUadRq1BWDezGYdeM=
X-Received: by 2002:a05:620a:2893:b0:8a2:3be9:1d7e with SMTP id af79cd13be357-8c38941cddbmr2987240985a.66.1768301267090;
        Tue, 13 Jan 2026 02:47:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnYTSpd5qLZ1/2FR5eDQz9ikykMs08iZtFQQji9lmWPm+/IZPBjKPf+lj1yKkj8yvyDYvcvA==
X-Received: by 2002:a05:620a:2893:b0:8a2:3be9:1d7e with SMTP id af79cd13be357-8c38941cddbmr2987238185a.66.1768301266648;
        Tue, 13 Jan 2026 02:47:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a02e3sm45182831fa.10.2026.01.13.02.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:47:45 -0800 (PST)
Date: Tue, 13 Jan 2026 12:47:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Message-ID: <nfhjbfqflsrye7hqbtgwr5hwkwdtq5z4tbvnta7lk7p7jtvhl4@zbttn6coc7br>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-3-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113102822.590677-3-yijie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: lq6JoItSLKd-HKhuaZKur4a4TRtDlEN4
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696622d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eQA81Jyt6kpvTzy5W_wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lq6JoItSLKd-HKhuaZKur4a4TRtDlEN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5MSBTYWx0ZWRfXzROCH8y5s5Nq
 AdG/NgElurt0FEhXUFN9KRsCLQU52FUFpYO4k7D23kHPiJfipj05901lQAK8cAR+CkpBMPiP7Ft
 dRvx9kg1E2CxqkqlJu6grlnHbUtz/kBc80sOye5Pv/7M5B33TZIAvddxpD5JSyff/fHWiaRERm6
 7ObYJTQYQHl2ITPCmND9DrlEKUWcA6gsGNSxNesKMY41fe4HCN8wtS1POyiNpNFrOcCFNk4ub1C
 Zf8KeFdBdYPSsp++rLPFRif7BtRqS9TTVirZITd+ajZh9V7EwH/gIzgG0u1biIlYqoZl6/xvNy7
 +nvRBw2qg7y00FG9GSk4WsUZFV0FfuBkNehTypyrIBzu/wRu6qkvZ3ZRfscm/b7ec0Q8EPQ3Rub
 XQToUIieyshhJunf0E+O/2koc8aZG1EHYnKqg9hMcyLd7NveZk6gFeUcR/CA2rPsS57cFgfdi3d
 4/ySZIDobLFaq3mUtdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130091

On Tue, Jan 13, 2026 at 06:28:15PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1p42100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> Make the following peripherals on the SOM enabled:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe3, PCIe4, PCIe5, PCIe6a
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - Graphic
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  .../qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> similarity index 99%
> copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> index b8e3e04a6fbd..fb90beb1096f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> @@ -3,11 +3,14 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> -#include "hamoa.dtsi"
> +#include "purwa.dtsi"
>  #include "hamoa-pmics.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +
>  / {
>  	reserved-memory {
>  		linux,cma {
> @@ -378,16 +381,12 @@ vreg_l3j_0p8: ldo3 {
>  	};
>  };
>  
> -&iris {
> -	status = "okay";
> -};

Why?

> -
>  &gpu {
>  	status = "okay";
>  };
>  
>  &gpu_zap_shader {
> -	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
> +	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
>  };
>  
>  &pcie3 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

