Return-Path: <linux-arm-msm+bounces-55744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF9A9D217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF0083BBEDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7AA218EBD;
	Fri, 25 Apr 2025 19:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOHrzfnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0314885B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610331; cv=none; b=VAZUgpW4BwycLxf3oKZSHVmPNiw3UgQ486t0TxwrEYiQNUPLRBNXPbAwp6BxuyiYr6pXvQj7BiXEzFUjPZ43y+f1x9gs52fTeIjilY6/6SXiezgGm2xuAnS8N6Cg8NRg4EksVF/WHz3X9kwIIZgIR9ZpycHF8bcxIL4z0ZpRjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610331; c=relaxed/simple;
	bh=H5FcDUxhaYKM5O7LhjKQRfFPg/7+kzeMsnb2t9aMKbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRmj/NPTqz/EGy2LeuvrMWKArMS4SX6/uYCVuRiMyeImrvVfeePFBkDLO7q3nGEt8x9IVA8dz5qbnDBuTIF4fwgo35UnPJnpQxRdnQr1ZeTyt6SriDJMgTMbVE9XS03m09n8El8/nktr2Osq6q4rnF6iUUl+4rRMi/Fl3vYGPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOHrzfnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrPI004649
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LOfYZMQ/91UMVPvEeMiVPGWp
	jLbUi9J9o6zxLIbUMs4=; b=bOHrzfnn4wUWvgNhvCahL3AVVJxAg9wKAy8IuvUT
	Rzldm1EwPbMGbgFVOAp+nQOxYqnc/KzhKAHNeOAoHyVKCwuqRj8wFlZ67F9weCJm
	Cdxme/glcgV6KJaPeNNkrHzYoWo5gSKiHNneuddgLgTjAS5waLjVZCka0RYbVbUO
	7+RCk4vYEMgg4Ks9/h96tu+QDAUoJQm75UXhTtIOWNkxnLwkmm2XpsoBweYBKtPt
	oo0bMPf7BqPAaux5FQngQ4TV5cBHCRTyaA+eImyPefazRApi5j+Eq2k4lNM8IJJs
	dmqA6nbHou6BKAghAJ8Ael6L047EBG3oxRIxa0Lkx/4vtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a5hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:45:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e6f5so705428085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610328; x=1746215128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOfYZMQ/91UMVPvEeMiVPGWpjLbUi9J9o6zxLIbUMs4=;
        b=E2a6wIYwlR1G/j+69Yut2Z30yOQEl/I4HEruUoqKZeYt9IupR2vyTg71cqWOG8Rk3r
         sb7VlSra8B2N8KP4fcF+PEYykT+mELJjmdlsmiO1lfFi6DI3zrbYg5OukG1+Xo8RU1Wd
         NAYMyBjFds7S5GUortRIW+ThwJeq6imnpK92ngzxjxZ4ezBytAZTxuMaimflB4vY1Z3f
         hg3uSESTN8gxClTV1hsyeGnlU5RZhM3yg59ldz8JrdJ/gFB9jz4syPTtpGPO9PDC5J4y
         YCrgWMnpXxf/DcqWX0TTNIr5b9pHKSC13+3BUCvEZo7vQpbf2BYJ5zQG6+ol/q4VGTuH
         ym+A==
X-Forwarded-Encrypted: i=1; AJvYcCWl/I9DVPT/CkYbLiAzLY5seL04XbddhHmbta5vdz3j5vJ7q0CrY5u9TGiT9/8tLR7BGUCHIALeZiZ5sYuh@vger.kernel.org
X-Gm-Message-State: AOJu0YyEO79X4JsyHegX8hhthlz8Bi5fLUdlAd4G/HTcPvabHzDTEkYc
	gPjBNTQMlhn9nSzLcy0gZS1vLYH1w6Lw+3Kqlt07xYvBWVtjmrLiBDO4IRF4jn0QbMJphWL1N8G
	D2fYakoI3J4CTDnVdFDxfNBc41jcIyoQ6kfQ1ejTO2UqlGjje1p7EiZe8klYA/uO9
X-Gm-Gg: ASbGncv/xtnmzZy62i1ZSMXT04a2zF+tQ9wBKR1T8Hv6P78D0LDyzjD4hHmHY9UM1xX
	ZKTlx0ZifgGYu1GKsAuYax/794A+brjhV8+ZcGLAcnvf4OyoRD4tfeNRmAF6nuLPD4lJ3iLHj9W
	PUElfDTKIZ/nvlqi8Y0zdaVAqrrd6sHOEPOUMwBMucqUANVtkGOej4DrptifjfnFXML4TzMJJTA
	jour91ghlAtnCJQkUFWviQ3u1EYszFAvu8fpYS0xwyvD/9Cpil+VviSzfDvfLkqM7Fb78mqHY1O
	Sa5DsK5A5Bn8E4uyNRSDqoHiAFo8qJqdiRG2JT/uNmsTjSaq5z69DOuQBLcqVuS87FXsx8+SSYA
	=
X-Received: by 2002:a05:620a:394e:b0:7c5:6291:904d with SMTP id af79cd13be357-7c9668c2816mr131908885a.38.1745610327841;
        Fri, 25 Apr 2025 12:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0JmO3FSju392Ty9lmH7ZNg6+Chjqio463MH3nM/hBIQmh+4nIxhv1/ja1zdDQGsYiMwJpg==
X-Received: by 2002:a05:620a:394e:b0:7c5:6291:904d with SMTP id af79cd13be357-7c9668c2816mr131904885a.38.1745610327423;
        Fri, 25 Apr 2025 12:45:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb48299sm8806551fa.32.2025.04.25.12.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:45:26 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:45:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom:
 x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Message-ID: <sxjcmkb5iaevznx2ivmzjuavriu64f6dkwu5xbuhgttaqh3tm7@hbm2ss5vea3l>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-4-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416094236.312079-4-juerg.haefliger@canonical.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX7t0X9+DEoHOD 1b+MpbGmkTS7fqlpZlijKfh5Z/7oQYmgTKGOGQXdqCtu/kbOK3DkfPI0uSqZgN272CXFrZW25PU e75/3kW67M/scR4xjW7HTLVl/KAYXnfWsfJZipMXXSJzyjYKaEX/AP3mbMB9YjA6JxG/7Ia3jTE
 loVePt2dqx9okKffQw/mgGfRcsiU8FzLuI3RFcK6Dzz30ZlrKVD89LI59R538mk/rW+AVegvKGT ZsHhtvUcgLJbgWLoJNWaynupC1l3iT/lW8LV7tlZ3re663mprustuwblPdmo9xBlgbkPcERpJPw 9v1F+m+a9siHWgG1+06y9fQqDWTwyEmeAeW40CsI6PuR7elo0mGOUN2O3fquISC5w1llHoKmV1e
 15gqqeZR1r+0AtX58mrMjT2ZLIooXta54HzUsvyww0gO4O3IUqaJzO0ous5od3Jw+ilYD/jl
X-Proofpoint-GUID: FE38v_4mJERAYHuOI9UVjCCSn1vdlJZs
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680be658 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=DfNHnWVPAAAA:8 a=3eXJRAMpK9HRtNitGqQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-ORIG-GUID: FE38v_4mJERAYHuOI9UVjCCSn1vdlJZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

On Wed, Apr 16, 2025 at 11:42:36AM +0200, Juerg Haefliger wrote:
> Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
> seems to be using the same baseboard as the HP OmniBook X 14 so just use
> that for now.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              |  1 +

You can't merge DT and driver into a single patch. Please split it into
two parts.

>  3 files changed, 32 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 140b0b2abfb5..732cc3f6a220 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -293,6 +293,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> new file mode 100644
> index 000000000000..4ea00d823693
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "x1e80100-hp-omnibook-x14.dts"
> +
> +/ {
> +	model = "HP EliteBook Ultra G1q";
> +	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
> +};
> +
> +&gpu {
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
> +	};
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
> +};
> +
> +&sound {
> +	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
> +};
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index fc4d67e4c4a6..e7262ad11509 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
>  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "asus,vivobook-s15" },
>  	{ .compatible = "dell,xps13-9345" },
> +	{ .compatible = "hp,elitebook-ultra-g1q" },
>  	{ .compatible = "hp,omnibook-x14" },
>  	{ .compatible = "huawei,gaokun3" },
>  	{ .compatible = "lenovo,flex-5g" },
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

