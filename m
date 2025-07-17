Return-Path: <linux-arm-msm+bounces-65541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BBBB09474
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89ABA1887455
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C442153D3;
	Thu, 17 Jul 2025 18:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRZyiPw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D4E2135B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752778349; cv=none; b=kl2jD2ArR+Q79o4MHtFNhtBNX7+zEz2kEvtShC5ZT6ThxcCGXdvtjmW0oD/0j3MFdNLinLYgFOgEGvPInBKnp8RC6Jk1aBGZ0YLtMHzgXA9Ibnu4H0zx6/QZ1LhOb8QF4WA3fA9UJ+4FRuBuNuElb0GONFmaJOXZorVZu7iEsCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752778349; c=relaxed/simple;
	bh=78JI1/FfqMPzK+79CvGubp0kjxFRxs/Jcwii3KSkawo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsyI9QUW142yjZNu/WCES1e+klzHXDU7JTv6Rjv/PfAU06eL0CJw34A4DgC7oVhhYOAhTktQBA+EjNc6JUF9Ma659zyuoWs1Grco/kBkNqVXOA6PPQ883aE6VL0UUIqZ+geG51BnDMnxthMlKP1aYjjKmcfWLaxt2J1IxEzBNCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRZyiPw9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCakOJ016545
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 18:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrkyQj2h8WWy7OgZiBBtyyS646DmSEdm9ifAy5URrnc=; b=NRZyiPw9j6nbhnIV
	SGq0f9E5rQCn7mRL85uf4NL5R018NEqH56s1aab9YRGU6Gh+YcNmybSyrm5rRARg
	MTzqmeXCc6EOpjU6SOI8RI8J+4OQakatNqyzpGFuvUFGS03Iv0Y0OHq2UsvcMM5l
	Tk4HSx48S/7qj6AobnHBY6hVIVpUmLNZm0l1dzPrtVbg987Q0N3Ivg4OTRvLoDNl
	tOgGybheYZ/Hz98lCzQCmbwKukjTpBLgXRM14HKQ+YljfyfeTDeRiEEtjc5wVSjx
	vapa0iPU4huB7sgRbfpRKlr2KtwCtYn/P2EZh8nglCAM9/M8U+tFSnq3iaiwUqEh
	G7sumA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyuvph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 18:52:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e350826d99so136000985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752778346; x=1753383146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrkyQj2h8WWy7OgZiBBtyyS646DmSEdm9ifAy5URrnc=;
        b=Mh1BIAQqKjMTsdjB2vaNP2AsgM1Ka0X4ZP/JTa3Z5WpUFZUkP6W6E8y9kOpVgTfaeo
         IiobH4pLFkovf5feQXMHDGtpgmgbXqx1mh3BoZCT62BanKsJHjHDQv6HkQiFOLTwYhTt
         EARic22T9qGukGJtjs0r8GGE29Nkkm6G/WlPSRNFesc1K6Tj7uFXmlEu8XI4I/X4O0oW
         FEZ56A0hiYHyLlc1m599i0XzfNmBufXIykSaAJDBMhSdb2skvsyYnCnjIYDWkuIHOx9I
         szrTslwRFuqoqesWAZ8dTBVnv6+KlWnuaAopYaHWYq4uOFaSdg0uguy0X/SXPaCsY+Xa
         rjWg==
X-Forwarded-Encrypted: i=1; AJvYcCWn6pMd7uKQW2/Glmye5RbbNCVcc+SfFNtuOGpFrgM7aqfrG5SdV/xIhyRpZVrUvHcCuzSiRA6IO/OFaCcX@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZJ+af+yMyosYzg++VGnvkqFWjFzmUI0wgAd7xFCDoMs+T2qM
	qzwlSKR0mt6KJ3BPzl1epHt/Q/BfQ40w43gWM1laxFlE9owB9AK0d3r0apcyMh3crlTvmmefnyE
	LhdR2w9iSad6BG2BdflosuzqaZH1NMn8ad4YrPX10VeY161f0JPKnJdTTv3qDII6Z4KXe
X-Gm-Gg: ASbGnctV1LV16+Xlp8nNXWBBAuQr7k/aYy/r0kEZ4NY+Ilq4EQ1Hg2Cy7CM9rXMDtjb
	yAJl+7n5FxT1vjHJ3ysQTcFNZ7yVdSzOwW/0L9fbn9G84Mu1G+MqZYiI5QY6SzF0p8a5FlZIrHC
	2RRdPnXKSGiZb1olKpthAzXRmozBRrYcEvl1eOSANLwE7EM8b+ZwZ716laEfMg0mKP8g1YMoNSt
	BX7uR8we4jbi7p6BCqD3O094SGRZupMAtkuMX+kgHLtUF3tURbZhzuf8QvZOvFYFhl/rVnUMm2a
	SSeWUZj5DiW3s8jBtgEYjqzURKwb6Zmi/M3WG4U0oepaMQMcqNTSIJNxnyB+qE61PUbNr30W+e8
	va2J05BimzgPcJkD6HIE/7aHOyTNxZwSA8JXLHTQA8b+uPiVdgqqi
X-Received: by 2002:a05:620a:454d:b0:7e3:3fac:b679 with SMTP id af79cd13be357-7e3436353f4mr1044841085a.52.1752778345578;
        Thu, 17 Jul 2025 11:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdNjK2UCt2oKspwymCVWfIJVTAsgjsbMOTdUvDq28EVYpDczXqAuW7gocVbG8NYtCqLKGREA==
X-Received: by 2002:a05:620a:454d:b0:7e3:3fac:b679 with SMTP id af79cd13be357-7e3436353f4mr1044837985a.52.1752778345128;
        Thu, 17 Jul 2025 11:52:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6be39sm3137456e87.181.2025.07.17.11.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:52:24 -0700 (PDT)
Date: Thu, 17 Jul 2025 21:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <b4nxjsx4fu4xmookpxukumw36wlcpzelh6axjucqe4lyswptm4@kczsldalq53n>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2puoXefMrpo4IFikb9GWOsd-DD2EV3bG
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6879466b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=PhgHo22kut4TJJxNvVMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE2NyBTYWx0ZWRfX4OHR1Z6DQNeQ
 pECf6d16b5GYJFN0PXLQ3z6DQfHZNsHXvGjtR/I2W5pWe0hVFZqDymG6uKNkZwoHZuihf1ZGC5D
 ezUx0T7xc0pVDuEWz7lmOgBPpN2SZzsXJ4dtH/toNFXg+RgeW8cnhDnu0GHpNfvtbwCizrSdNuZ
 yw9awP3PIzayXJl1eC0OE4qgtNnDCk33xaGfcfJmhaHOWGsWsXmrT+bgxXR6S8O7GD+8FL2baD5
 Lw3YD9kp3JQU9sAZLw+IDj2IOO8ikkpKZokPsD8sP5zDbefupj9EuSb/Ugdx+M+JRiomIB9t++y
 KYGw9+TTozG8JYlsDVP2CIOK61NHO8+HjqDj38KZhy0W4DYH8KgQORSERpJaq6fWhnrY+RzppKU
 BJgYTrLibuB4ozOJu7LB1ngQ03TmU7VeE94mayc9+cOozMgDJQW3z2zMckbY+r0Rqnmwoolb
X-Proofpoint-GUID: 2puoXefMrpo4IFikb9GWOsd-DD2EV3bG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170167

On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
> The HAMOA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1e80100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> This change enables and overlays the following components:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> 
> Written with contributions from Yingying Tang (added PCIe4 and its PHY to
> enable WLAN).
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 607 ++++++++++++++++++++++++++++
>  1 file changed, 607 insertions(+)
> 

> +&remoteproc_adsp {
> +	firmware-name = "qcom/hamoa-iot/adsp.mbn",
> +			"qcom/hamoa-iot/adsp_dtb.mbn";

Is there a significant difference qcom/x1e80100/adsp.mbn ? If not, can
we use that firmware?

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/hamoa-iot/cdsp.mbn",
> +			"qcom/hamoa-iot/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

