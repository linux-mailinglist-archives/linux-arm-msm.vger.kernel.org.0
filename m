Return-Path: <linux-arm-msm+bounces-84516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B0CA94F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65A1330146C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763532C3268;
	Fri,  5 Dec 2025 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ow8DLTOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrCzH15v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB0286405
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764968143; cv=none; b=WtraD/o21ioOwb5IC6kc9H7O9U+v2LzRzve4+Szs/fVWS5/nTmucj62EQUwQKmE5w3k+rseSuq2OaaYqJxGK0gFE0dYcIzrzsepS3DwGs6+/tngBRgU+TqNfDlpP7iT7n0VpE7i9TY/kJI4v3wfPJEmK147rxa4t2AG12geA0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764968143; c=relaxed/simple;
	bh=wM4lbwcfB79jCj7bOmo5B1B5jBZhAiQgdJDkEICE1UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcxvEx93uXDD+xMiHIbWo7wrnY+kbcGn2YlApozw1B9+9GJC+0XGe6jpGhkurNu7gSkr+qpwAHD0NPTWgf9XFAadL1ytXF1I+OjRz13AYZyLBViQ2O3jfaTJD3/nqc2YKw7KZNLDqIU9bbIK1iR0701tzHyKeN7hBOFsaXBVXNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ow8DLTOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrCzH15v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBKTH4177194
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yd8Fe4jZgBDKW3DiZ2oAWRaJ
	+4bjhE/PoC9gNQIeyJc=; b=ow8DLTOWKKeO64T1I13cSXKzliRRrcRNzlayDCUb
	T/zWDdKyx3srzuFp9Ys/2RuNuRjX8/fbUpnQ1V5eoBX0ePEiueODTUzPgHB/bN3n
	Nd5GODPNp5phDBQWU5p6mZZrhFD5EpmzeD9/vmYRyMLH/xfLzqBYSwsF5uFc8fmE
	YTDK1QjINqQDkaEVIF0h3rb/UIBmHSueqeY3zuXPe4GIhNbZWZZf/qTwlLDnQ8wa
	P1qyISAiDFpnNbRWjpr/h25p9w0DRNFs4S+0GqYG20Mldmw8jUixlnfCDQd8f3sP
	nRLMuU8xWLis6AcokGWJZnTz1KDMXvNQQc9ziKliR+D5GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm59p24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:55:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b6963d1624so140406285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764968140; x=1765572940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yd8Fe4jZgBDKW3DiZ2oAWRaJ+4bjhE/PoC9gNQIeyJc=;
        b=XrCzH15vfNDTpMwkbZO+lx8CpVevviJR2kUyQ/xNIrUM0h3yPc0pVW6YydnBMMVhE0
         pBYvUK17ZEWDyIY3mUjSBmAixrS1ZUYPxS/hQhmKLKgpSdyIzX4OhgIlYAqUrdwxwE/w
         1OQfizVw7AoUm0AQrSK4ay34CQI8+P7jfEPvpQTwRc/+4nFGEVKEmhvnKLkz1E4hIF0b
         /KT3io63BG7KyIf3+0Sepgwim81Au1WxqKzafSX3WCU7M3VTNoGgUlMShKTKEKSgWETo
         baMUqCV4jB/uDBATN5vxoZP5Oc4t9ns9WXqLAJbL/dMeWBEp8VDxre7FPs/71yNDochl
         5lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764968140; x=1765572940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd8Fe4jZgBDKW3DiZ2oAWRaJ+4bjhE/PoC9gNQIeyJc=;
        b=oMtXIhirA4/GtQQBJmwgLR/drC9zGynHNrXPUCe0vTjwGhqTJ7hxS44B/LufyJvHD8
         ff1Cg2dtwrSLnl1eyg9ef5yohsV1LroprqUtUBPi/h9kvlxDxeDCECXetDd48VmnsNHH
         OaDgBSehHakowUn2MMUVo1HOfR1loOIYaM/HDeuXagx236ozWBOV05+GQqV47jHPWQx9
         tw48LjWXym9iyRAT+zjmhkVwU8t8k5etTy5t/TiA8shoMqyDYf6S/v6Eg34f7Pm7XtFC
         X4po/fYpYCtJ0d9T74qT/HkZ7crpP/fj6CLfdQ0PIzWgpeGxlGE9Szh4m4Vzh1iqYlhs
         8C0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIktquvZ5KpIDWIEAf3cyPIGx4FiR0KsHPATAndPe73z05oLg2nv3F3Z/Lha1yKjzI4WpnIVU0mkVvdtzX@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWLDg1VvN+PqI+33DQYozXvVzbvnNp3IdMbvBcwO9zmoW6YV7
	6IOgmvoBaYGIE8p5r9UJqtJBoZX0O37BklOiVh2HJjH/Hh/eMDyhQSKk5nxWj4lPNusksrhyh36
	YV3q37zCH7mLPdOkHoqIwsgWrtDEPO1oVCcx0a3EtokdxGe0tVd/wPVSLMJWl2L8smBbH
X-Gm-Gg: ASbGncuNL82EsXqjLBdbWEEfrKhLJ447Gaa8Xwq8XEu1kEVW5TZA6UtPl6XLENTIBhB
	HXax4tp4S9HuIVy7dKHEGHhCT1DpxH/ZcnYQDrX3fLUrZ+l5vHhB0wy5eeuZqpVIdjICrMiJiK7
	l0eAacTN4N8NGWAfsQp5VQMYWeWY9njMsVjei+vp+Q19JAM2U3+Sr+Hz+HpMroAM0h4+ZGcE3Sd
	j+yc+xxbJfL8dbL3hEuYaweAsRfM3SrtQ9tYKljsvPFGmGobQni4fRoOcyngnrN21Asl7e9Cxto
	kfdfDOwxkaMmyuKJhr7qM+oUcZcml5taamSsqCfZw2V1wkVv3vAig+2sNmbz5wnbsvpVUluyekl
	vuZJyU3d4WvZwWUgB+FIJ0ZZebjn9vb8krVa3JHGQ12saxEgi/+3s3jAx/YG0HZ0mSNaesOfQ28
	c6te6RRxwCI5gOXG1aUPDNuJg=
X-Received: by 2002:a05:620a:31a4:b0:89e:d562:7b93 with SMTP id af79cd13be357-8b6a24f62d6mr72632085a.83.1764968140146;
        Fri, 05 Dec 2025 12:55:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1UKoGW+OU3HoBP+57I8OZyoowEZ6rmtvKcXoHR/rznEQPXCdbsUBrzEYztZBhcWzbpRyq+A==
X-Received: by 2002:a05:620a:31a4:b0:89e:d562:7b93 with SMTP id af79cd13be357-8b6a24f62d6mr72627085a.83.1764968139576;
        Fri, 05 Dec 2025 12:55:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e7062413bsm17163141fa.42.2025.12.05.12.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:55:38 -0800 (PST)
Date: Fri, 5 Dec 2025 22:55:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
Message-ID: <fxf66ulont7wnmozqww2cklpp3djkzsgvc3znew4m7t47qlye7@32hxp3yze7h5>
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204044644.3072086-2-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: eb2GamAQ7RRucS_DmN0M-_UMhQZU5UgH
X-Proofpoint-ORIG-GUID: eb2GamAQ7RRucS_DmN0M-_UMhQZU5UgH
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=693346cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0amjCnnjamoAI58UCHkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NiBTYWx0ZWRfX0dbhAfaDsssF
 h7v5NZ5jwxd6Gei637OPXNdcORwk0JNwkojZMYl9mZWc5YRLPZ6zcrs25WtVlMvB8bN7iq0wHGr
 T6t0U3Ahvrw5k/qPdrMadh9MpHJ1Cc45fCdSxjeuZvyiFGowXgdcXlkqsSu2uPL4i5FQDr2yKo9
 5PccDhaLY9V70IRprQNADcY1oHltd0owL2LHn3465x3HUZGtHr7JetLbLZxsDBaXkqQIvKfYwfx
 3BokmWnD8n4p2+NheFxhsPTYIceAuNysFDHT3Qc6/HNkdFOz1rr/SmUFj/6HWudglfwBxPJo0Tc
 c6br21Yp+bV2GxR+68j17sNvQgUlUFsX2J+A//md096vv4kwVfFal1nFozQLgLN3KP0humOYjZy
 RbTfhNgEhlPq7J9OVgeRD1IwklP5EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050156

On Thu, Dec 04, 2025 at 10:16:42AM +0530, Krishna Kurapati wrote:
> Add squelch detect parameter update for synopsys eusb2 repeater.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> index 5bf0d6c9c025..f2afcf0e986a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> @@ -59,6 +59,14 @@ properties:
>      minimum: 0
>      maximum: 7
>  
> +  qcom,squelch-detector-bp:

-uV? -mV?

> +    description:
> +      This adjusts the voltage level for the threshold used to detect valid
> +      high-speed data.
> +    minimum: -6000
> +    maximum: 1000
> +    multipleOf: 1000
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

