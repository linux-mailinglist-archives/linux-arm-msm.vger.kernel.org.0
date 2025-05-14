Return-Path: <linux-arm-msm+bounces-57986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BDAB773F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 22:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F0A0864329
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C5C29616A;
	Wed, 14 May 2025 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUb7GOAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9637B296159
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747255316; cv=none; b=NuqijeNX7jQdhwdmftVHD0AomzQOj4FJ4QxcPiLZSGbMrVfQBzzuLpLY2m6wPDxZDUH09oifvKLfSe0zomOaqImb5yaZiBZii1ubFte8LK5C6Bc4VmKovJI/Nx11hySgvoA5bTH85pXLDKyZ0th5jIOKkcW9sd3HZ75nOXGnJ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747255316; c=relaxed/simple;
	bh=rUK4scPkzZakFgDXHbi8BfoYHgboRKWeDbAQdsEl4zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ny8Bo6yGuC241h9p3ckMSSf0iHN8JJbJXG27/ODSLudrcSi53g8D38VE0dRXkHoFrnCg+i2Y2BGF9DAOfvfUlF5wxS9BOsBD0V9Q8iP7foqFEcYbXqzFM27lcTqvWr3CSAwDBxbuimuhrNYRU0Q95Fu6aP1Bt131cxK4I2+GABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUb7GOAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuw8W015190
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mjtp2bpakb8zijMOh2vfgyB1
	1iNvN+koMsm1Lt3WJgA=; b=fUb7GOAhZV2NpdRKbTaWEDI5KuVpmLWMoYGqJqy/
	pBtd4TeJ5uWbj/95o4bpffcNXZTqRLrUtRlKKdVt0ghSl93kyHSdR496clxjSSPU
	FrzJXx75Dn/u7A6m4GAoWWLVKTcuBeUrZTk1ETww8r/guLZT6X3JaETba9w0u51L
	vaH8LHxSAfTGy/CdS7VvfD+XzicvcsLnU1qLbCxueshdrf4K+KWso+ihGXP+Qrw4
	9o8IQV1Cn2MP9hkif0I9UXTHALEJMe1UjVGnpbx03isCpSJQUPWmAzwAywr9ZOWQ
	wy2C64awwjjO9dV3X6lYBaUV0i/iI+qIGkUM8XwE6aTK6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3wmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:41:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so31491385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 13:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747255308; x=1747860108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mjtp2bpakb8zijMOh2vfgyB11iNvN+koMsm1Lt3WJgA=;
        b=WM9u2tq+CR9Bk1pCltgmUqARM91S4re+cfZMQI3FuEfYerUxsfIE+kTi6leFafIcrs
         opti063A66RiTapcKg5L06/IxMMWFgVHPcu3bDqZ9MLJBmy0KjXYM2EtJhsSEhhiBxFK
         vvjNDQBzwk3+kI7V/QJxyoO57yWlkYdvvNF69QJA4td3Yi3fz5e3bFixiN76xULDXFU6
         w4354X+TkP/sbXMzLJxhktvQ+P+NVYQcJofU86O8tje/yr5QVptt4b0v7sojSJWG1yIY
         czFiMKZmD2Bg+6pbm7uEdgNaP8aqR3aLD1LkIVwlwsHkqM26qOB3bwxkrfWU/+NGziFp
         ML0g==
X-Forwarded-Encrypted: i=1; AJvYcCXzXLu7DA94tlHOVEbdiXsVpPUvFEQ2czp8kIKHPutxWDjhUybdH7Ump2zdFywgvMX6inC4d+ydp60qWeM9@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPvPxWsibRJb+8gmizFb3gBDhw5aNhYoV9R2DuedW5LPRqSqh
	X73v8nCOChY9f31/tfwoqLXZwE7r1CQngKHFw/E34TNhsTKRy5eONj5e8AZtsbq5TzWbT+DPgC1
	ZsvSqZHBBTC/Vvo4dTIBOyRj94437AMCyHGFSsUia3huTAIuHcr33efp4pCtehsKB
X-Gm-Gg: ASbGncvjL/dYV7/n+5HYDCWTr1kKmHO589q1h5kTI6gfqDEyOJ3TVqFtdzm/pQokeSm
	eg5foo53Zjd/BdK221ng3IbEb5K2JQ3tbA+IP+L8EPX80rVDo0GH7lj1Ghuff5keinQVDmnniOd
	dtwoOK5IxGAAPjbx++xe1dRuZFvEhLylXZD9KgfbYM0ENxmF9RYePdGbm+9ovbX/ZEh0E2VoDut
	XuVT+RFVcmJHSxRxSwWQOSor9k17EUrkZfChURHYbmWby33tNTGGzPKOEmikx5SM+ztNQTde5gn
	dpwaEaaSGxexSgOB5teEQGFIavJeWhZgv1c0A0PKkp+fMRdu9dlZvgYLLvx39CsodcOyUBXBAhM
	=
X-Received: by 2002:a05:620a:2904:b0:7cc:7704:bf87 with SMTP id af79cd13be357-7cd28847321mr718008885a.42.1747255308109;
        Wed, 14 May 2025 13:41:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIv0FZP5V22QFAaqy0UmracF7uLbzENjoAZw0LJM2m+3CM+j1fWH7H1eegN8tzKPugcHv6GA==
X-Received: by 2002:a05:620a:2904:b0:7cc:7704:bf87 with SMTP id af79cd13be357-7cd28847321mr718005185a.42.1747255307745;
        Wed, 14 May 2025 13:41:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b700dsm2396390e87.130.2025.05.14.13.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:41:46 -0700 (PDT)
Date: Wed, 14 May 2025 23:41:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: qcom: x1e001de-devkit: Enable support
 for both Type-A USB ports
Message-ID: <knljchftq4rl7ve735jmqso2lhybjrmz2axgd2xrqr3k64g6zy@f2fx6auvb4bj>
References: <20250514-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-8322ca898314@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-8322ca898314@linaro.org>
X-Proofpoint-ORIG-GUID: djf7756ogjgCd5YO-LYFQa9uaKE9L1Zc
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68250011 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-ogRkZ1lWjz2smMNko0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: djf7756ogjgCd5YO-LYFQa9uaKE9L1Zc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5MSBTYWx0ZWRfXzEFIZRWrsdrq
 b2e4ow7mF0m/h8RA9f26LrnpNQc8jFVLNx2sd9Et3sHUAciDgbJAytvOECH+Us2SoysZWTgB3At
 Pmeha1DIh1muUAl4OKDg2aGxmlFZhm4Yy6p9ODQGHq+7pHuLWJmw02kYT3pzJEFSwSMlr5x+jXs
 F4MrRuGC0bSvVK4DCgosm6lk11QhYDDsZbRGHLFlKxDi22TpmaM1kN8UrB8hu2RQXa/bIIqhfJV
 rvSxIsQPKXIpYCXng59J7vRgetQFPlAgMpgqcXWbO2R5hUbYnrn/9NpXiKU+p9HXBPS3BGMqyKD
 hSENAwvJF4SBwrN/FQGJiRBE6sUOfiXF25iZGBToITlAKc1qEPcFGOQX+Nsojj0oy9ZC37DULbO
 9VzzYzX3qcJM9nM35ZKGwbZ8FYI1UFKqV2ones1P1ltYofp0I9HR6Ky/9XRwOKcY90AtzWbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=404
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140191

On Wed, May 14, 2025 at 11:14:30PM +0300, Abel Vesa wrote:
> The Qualcomm X Elite Devkit has 2 USB-A ports, both connected to the USB
> multiport controller, each one via a separate NXP PTN3222 eUSB2-to-USB2
> redriver to the eUSB2 PHY for High-Speed support, with a dedicated QMP
> PHY for SuperSpeed support.
> 
> Describe each redriver and then enable each pair of PHYs and the
> USB controller itself, in order to enable support for the 2 USB-A ports.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 86 ++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

