Return-Path: <linux-arm-msm+bounces-75762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B513EBB255C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 04:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ABD73B6792
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 02:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574248634F;
	Thu,  2 Oct 2025 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAz5CVLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC178F20
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759370752; cv=none; b=NtBBJZvQb2WpLS9nURTYFJNBSyYDnpJW1ZUMisbD68Wu5cOBxq1PK+UBXYytrlmKrWLExYtutMyEYMrfSS7+0rXJLK50oadjQ1A4Yfr0zYOFIwgerYYIPkV3/+ov2jLkVd4+au1Xo7q18JLPT4DI2aDP1KUoiBo08h69ztKpMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759370752; c=relaxed/simple;
	bh=l+FS39zuBet15cZverAsMFAIByn00DrueloAdz9PJpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVh9Lh7HDF0Qs58WRLwnjqMY280DMo4aE7ACUx8Fs9iTqhInBNftmmzyF+ZMaAcz389hpJ6uFJBZsE+zA1yEyEyPHt4JRi+w2/mXNwSms+S/JqC5Kg2xwC0EBvp/FMN/XLF9hSLdSk8yXS5Tf25dRn6EjfNDHyOGHhT9r0nDbmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAz5CVLc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic9Kr022669
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 02:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uz1KimgaPZysBciMTXlV3quW
	2Pafl+wJkK/SdLwaPRI=; b=HAz5CVLcqd6snzgMN3wupPDdbrO9CO10y6s+mb2a
	jTBQkGCJemULnonhbChlDoh6HFUCDMXQYiK60v3mtoHxAvPq7WBMrsuCEim6pna7
	vUsSm+xhfm3C8gIkL+yBfLezbQivISIIpWPgVJatQJR3HZNL3SLAfrpo2v3MNtja
	PFMtpou+wzD6cKdg54AC79PoAtAP1UGQ98S2+HBp1YrnZFQZVGdHFYqopTHoEBwh
	S+cbtrZCw8l1Qt13eKn1yZ4n7xbXplQsZFUrd9P1UHg8gM/bgYGCaHq+at9C64/4
	tOqRel8VrUr3t/0E9GHkXB0D14RU/aI7ukeXk3BTTJGR7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6swq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:05:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e484dccaafso11854381cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759370749; x=1759975549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz1KimgaPZysBciMTXlV3quW2Pafl+wJkK/SdLwaPRI=;
        b=C+PsqyC3v+Sl1LLCHmIHyKwCFhyomk7ypVDwe39UFSkbqKefvzgUxp2wiq0S02yGk9
         qlZCfw3HqdkMjPpirKaXfSVLjc5+MWmX/d/50SY6PNzn6N8HtpZZ65bJ/I5T+y1TbjOy
         I3q6b9CRIYLExdbAVx2zEQ9zbm84NY60+EGpZ06EM5hlwX6uTYN/Hf/mV0O1FMqrcvJp
         x8a3d0SR3UtumKe7RczaDMmLXHN2zZGWRn+hbUfiW9DxK6TZkrS10DQW5fYEyn+01IJA
         7cD9UIPHnNjCaNy5VA9zOeR4pADzw5sGZwYb0+otR7cB44QzMwYyuBOE6JDWqtH9UnKD
         wofg==
X-Forwarded-Encrypted: i=1; AJvYcCVsG9QPaSOcWoAOKlaoF6AJ9ZZDNPtM3cLUPOz2bDoUEb8U8NffMEAFrtafNy1GMcIZLFiGUTX+o3YgJ3rt@vger.kernel.org
X-Gm-Message-State: AOJu0YwHFIY86qKEIzboCGlhAwUQb4XB/Pg+YcchkQhVGrLVG6YD0nW9
	tb+EeSS+GbuCAVDENxWPCqQ0reemDZfReHPj3NWNwIepX6efFmD7mKBh7PfR2B6wwTccehQkrhP
	SerWkk5+kmGdhLjL1TG9OSfuHiF6pha6v5NwWXbnhB7oknvelQQvJwbMFAN7gjXRHMTin
X-Gm-Gg: ASbGncu1jnpYLuuM/cgE0GnqoQTAnm8ULdhFOhNAUQbyzxkxl2I7PHKKykWZmrKyAue
	1GwxElXQGSOmHm8QgaWheLdcZZDy8ZLHvdJgSSq5GRh2KAXAOyyk2Je2FrY7f3H+ZFsavddLqzB
	CyAHRXmVNjdW2i4k+mgmpTketzsXj2mIAAH1i4xAJOSYNuSd+Gcn0u/3WeaVHkXuCYX4l3lAKfe
	jHjgHQP6+uRcT62fp+jgGerLn7qo9wc9m+JL1YhMojiuKpcak435O3sZed1nZGv/BCfSvd74TOc
	ZTX+qFK7vfTL2lqhL3jH5yLiYMgkR7ATtvhvGVUU3o1sQTd3c2l3VgHDZj5wVSFi1fXLYxQWyLi
	ewwm+A1g7CSZj6LugfQ9WL3EaXMR88Xk4MbPjEGd1nLq2iA6CLEeHuIJYfQ==
X-Received: by 2002:a05:622a:95:b0:4b5:dc4f:7d67 with SMTP id d75a77b69052e-4e563187372mr23583731cf.27.1759370748747;
        Wed, 01 Oct 2025 19:05:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbsN9NaYdc9BH/Kc5pOw7R8dTTMpmEEhKeBrFOgWNN/l2YW22WBhqpVIAeq3Paja6wI0ndaQ==
X-Received: by 2002:a05:622a:95:b0:4b5:dc4f:7d67 with SMTP id d75a77b69052e-4e563187372mr23583561cf.27.1759370748314;
        Wed, 01 Oct 2025 19:05:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba444501sm3181091fa.35.2025.10.01.19.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 19:05:44 -0700 (PDT)
Date: Thu, 2 Oct 2025 05:05:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Devi Priya <quic_devipriy@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Baruch Siach <baruch.siach@siklu.com>
Subject: Re: [PATCH v16 6/9] arm64: dts: qcom: ipq6018: add pwm node
Message-ID: <46ymqf46lgarsozjt23rokzoqam5xmbgt4hlz3wya5eu5fnppl@7t4ayzzkjsi4>
References: <20251001-ipq-pwm-v16-0-300f237e0e68@outlook.com>
 <20251001-ipq-pwm-v16-6-300f237e0e68@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-ipq-pwm-v16-6-300f237e0e68@outlook.com>
X-Proofpoint-GUID: hxtD52lSwLwJNo3ztkIa-7xdZnNtTVAQ
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68ddddfd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=Lh10uZTOAAAA:8
 a=UqCG9HQmAAAA:8 a=HU31luCS42qLushI0i8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=h7PWpkqlkWt1jHQZSjMD:22
X-Proofpoint-ORIG-GUID: hxtD52lSwLwJNo3ztkIa-7xdZnNtTVAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX0A5EX1mxc2CO
 IevZTULGRWjX9SZ1Sez8xr10x3EbJNkBHjj4WIBlp7/668JbrW2t2X0Ag/J0/N3pu1DbF1PQXQk
 qJD70mPI8XcEc3SvNkPjehI6VMCmVLEUH6zHLJO3C5Ag1FtdgHy9qHorMNa13Gn8H38mv9ZbHcS
 1ihmwiz9N/pkYcYJuwK7dOKFdH3YM8xq0m5VLur8TDo/vbBBuqDcNjFYU8Z4EGcfGbv9pqLa4rF
 AoZicG+FEpkgJbv2SLL9EEmPQoKY9gkOcUp+i0Nq1k04hrIL1ECRJcm3zPqjswObdCg15hluIYh
 Y0VjFQ4KGOAMbdL4U9kw/9aPxfmIbmsLsuuH3Z9EV5fwMg3pMjGdPbfbUBKBxSYiQbEVZeER8z1
 G83YfIIMtRAipDDUE5rMQR1VWRiOUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Wed, Oct 01, 2025 at 06:04:22PM +0400, George Moussalem via B4 Relay wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Describe the PWM block on IPQ6018.
> 
> Although PWM is in the TCSR area, make pwm its own node as simple-mfd
> has been removed from the bindings and as such hardware components
> should have its own node.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Co-developed-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 40f1c262126eff3761430a47472b52d27f961040..84bc2dec2b22f9634d4ec926daeebb9b40cb112f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -413,6 +413,16 @@ tcsr: syscon@1937000 {
>  			reg = <0x0 0x01937000 0x0 0x21000>;
>  		};
>  
> +		pwm: pwm@1941010 {
> +			compatible = "qcom,ipq6018-pwm";
> +			reg = <0x01941010 0x20>;

It should be <0x0 0x01941010 0x0 0x20>;

> +			clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clock-rates = <100000000>;
> +			#pwm-cells = <2>;
> +			status = "disabled";
> +		};
> +
>  		usb2: usb@70f8800 {
>  			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
>  			reg = <0x0 0x070f8800 0x0 0x400>;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

