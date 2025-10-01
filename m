Return-Path: <linux-arm-msm+bounces-75647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3AEBAFA33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28FC3B9D14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D7C266B6F;
	Wed,  1 Oct 2025 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnHvYfIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2A227AC31
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307456; cv=none; b=P8/Llt1xAn5+i7CHxLgI8+NruT2TrrUMqWTUK2UWs6CaKA93z0vozZyJ6OC/0JE3RsI6fSMmdM60cceeXALspSRWpcRuvUE4nryTFcQh0iX7w/5aTZ1KX74yM+GJ9DLogN1IqmcnVUKJnwI5vM+ZYLi8PY1Unt/x0BQ0QrIlB+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307456; c=relaxed/simple;
	bh=GT0LRKWWLolOUjYL+JFNIRty+gSBWR7OB009rRCYzxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+jpDKNMq2R62x7p+9rNlWLP+shcq4el4DpVcJ4r+WNWqICGHjepMB94Pmkmy1Hau8QXc8dFApbuFMwApXn9iDVGbd+Wro6innptnEdN0eBKmZMSH4KqdHgsq9EE4hBDBo1Q3CdBL+eHFSLISFtzb8FzDzMufyDj0nOwcpVNBcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnHvYfIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917jJis017628
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cjzm3emaoXKpMvDV9sAM1BbWQ575XrXlSZCnkzdhJSQ=; b=TnHvYfIuBM1/HTJz
	8Htws6ocSLKvpEojwbVzmqEr/JXECJzUOe3ZnsVGtsBIk8PRy6zkJZsWMqtGQMdI
	ikgHwZ8WTojLkgIKvkOBmhAhwOkb7DXXqwRak1CoqJtlI+72Crq3MSCO08EZffQy
	KTS2GcgAOPv+JTpu2JUFfEmC6zKLpSJuCLsguo/1q1Nsrv3IWmiCnHFvq2BT0Ypx
	Ps/VsW4qnsXFg9+0RyGtgOhrPUjsyvGXJTXxr6qQaUTwP/ko2lf56/QooglDDm+a
	djwZO3RNZtpTXbanB4aFe8GvP+QLH0c67uG6l29ysOYjbvD74z9O26YY2xn2wu7M
	gZTnlQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tv26k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:30:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-853f011da26so261664985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307452; x=1759912252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cjzm3emaoXKpMvDV9sAM1BbWQ575XrXlSZCnkzdhJSQ=;
        b=APq6TmTwhJQtYkzf2XBEq6pd7awyCOlVmLNsJ6UzStQfGLALdunfO42oLKNEUIPpot
         erUfZdLGDoJAkym/SJdmiqN4znUWyatH5rJEW840gRO+bSYKBxcShdJmaTLiRgia2K/n
         xu/7XRPAUD9g2s2rbWvWKuOIXU7gP8wV5Io+X9Vk7YnCzkLnCvQy4HeuCC1eWA2+30jX
         wp0kVMJftT0YtP0nEAJYw3TZfY6wD/0+04Y0AJUO1ts9hE6T5897Mb5e0k3APi1F4s/N
         fvNKZtvAwcomaOi0s6GSuJkge51jTIxBFvimwzArz9X+NepHkEVQ/8/UzcgIZjfEp4C8
         GPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTuretS0pBad6aAFhSMWGOLNSrQW7Gkp3A/cfKeJawdUlg9uDDwLd37D2rKYeed1VLh70610exnG0Ipz92@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdPH2cU9bWopvCxy2fImS7zrKsei3Wy/KrHdsjXkj2r2uca0Y
	fYQHQLOjeku99J1GU8QW2ggoXmoxp6Smc9xWQc5tJTGQ5RQzgl4jmsqWsqTzFP9EYblyaI2uGXF
	8vTKZy3NNc05TNfb46qCPa1KTInipGnkqsXMmjGBtURh+qNS8YqEXivHoYVrnzC0UDh02
X-Gm-Gg: ASbGncsc/LVwrj/ZIF/0OjhEnI1Qlxu/ZaMtVuQNwuH5R4Rdj4QQysZysK79Rb/37GY
	bA43rXXwS4QDjCEXpUDxDYPAO/Ix3bWuET8Bc6KQbIo4kebPb3xiG7HeH2fDrgD40pHvBhM34XB
	j2EmIMbCTQzg3xJaSZUxrtPFlcLL2zPkP3jV4Gc/gaFVErT2MQUdfuvah33slNRZNBmY7auOeVU
	WnDAjZkW/I1gMwedfv+PlbR4o9SIasgZuqHEHLl27Kn5E6vzizDi8VIGgwbCs8gUuQSA3FdOqgC
	PsRxMzVlk5g2lL46cWucpudOQC0ZG73gu1k7Osq0Dpt9EUvwYZEAqlcFXAhPWDWCQRlGPEzj66E
	PlImFuIQBCXAaZoZ6FPfUIxl4MIQ=
X-Received: by 2002:a05:6214:20e7:b0:7f0:787a:46c0 with SMTP id 6a1803df08f44-873a60f8fccmr24664296d6.4.1759307452347;
        Wed, 01 Oct 2025 01:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG822gD7rUPMNB4okaH11eXrfFzHLQWvCQu6RuTPp8JaGF3dxaajwDtHeT2MS7SE5K8lJJWuw==
X-Received: by 2002:a05:6214:20e7:b0:7f0:787a:46c0 with SMTP id 6a1803df08f44-873a60f8fccmr24664086d6.4.1759307451860;
        Wed, 01 Oct 2025 01:30:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a364ffa4sm11234059a12.17.2025.10.01.01.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:30:51 -0700 (PDT)
Message-ID: <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:30:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX1jo6P3nHb1vJ
 xF66k+lksOhowg6pv/JsW3wyvhDKbvbza+FuLR0JW5XY4AwcJFsfG4v/aUaLSiZxiTUzWPrHUWn
 Emyv8TRJlHaxzlvBXvizgnTWyqa9HdvnCIVFbSu5A0y09ctuDzTFkVmC1tBcLNeoIwJ6cyCOcDi
 UOsnE/bQ9gcX/o4liYekphf4CfEpOmwU9+TyH/qL92h6sMQxO6utONdhTUJqRZA3Syym85jFakx
 JoZOSpzQwNCzK1VuyXQXYo50VDHeNLU3LpW80p7rFcpLHN7hJ6jZGC7C43F36vv4mW+xHLzBNU+
 RBCZY5c0UoCS3i3JjFGO4ttCyHphYaZmDPpK4n/RtKhy1nAw3v5/Yh+Y7wrF+sZqtVyz09mleR2
 W2IRnBcC5D+RC4rXP6QJ8BmN802O+g==
X-Proofpoint-GUID: k9dk36dq3RdT_QUvOLQ5tNJzZ0KC_WzK
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dce6be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=_C6b-tzP-owvyH6gxLwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: k9dk36dq3RdT_QUvOLQ5tNJzZ0KC_WzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On 9/30/25 3:57 PM, Luca Weiss wrote:
> Describe yet another regulator-fixed on this board, powering the ToF
> sensor.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7329335704eee567761 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>  		pinctrl-names = "default";
>  	};
>  
> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VTOF_LDO_2P8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-enable-ramp-delay = <233>;
> +
> +		gpio = <&tlmm 141 GPIO_ACTIVE_HIGH>;

You may want to define the pincfg/mux config for this gpio too

Konrad

