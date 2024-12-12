Return-Path: <linux-arm-msm+bounces-41818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 299619EFAC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B7C1891CE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3140235898;
	Thu, 12 Dec 2024 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhpSIOeN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEBD23588B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734027269; cv=none; b=AM3NejDFWc7Q8KSy2uezlfQV34gDZM7Bb76gnOmb+t/J3TSTizPY/A261BjG7LPZNOhW2drgnHUdb+IwYAUfY8d6LIizDbKUPjzLb3in3USyejQOGIe/KQSCoKGzCU6pUQKGwwyJQ8dR+8OicpgGpPcoV6/VWcpqfKpLQRE7JDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734027269; c=relaxed/simple;
	bh=Sn9GVodiqQXusNkw7kIy8Xvi9IXwgT0D7m6ej9XhxbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/5vsqrTTOose9Gn6hpXmm0PGGfwgetZ8bYARuWLFnFEK/EBnQNgMSZmgVCKqCZfmpieGlyfw65cgg/gJqi3V0bkGz8NWgnBU+IwFFd6fRzpVFRj+jTnZl8w7XwIFp4hxfqG66jX4w5m7pLGzjY971D/+OKHr1DpIG0LRMj5zGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhpSIOeN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCIDp4Q024961
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6o34CuDQjqWiE8aD45SAkl6xdvZg04LXk295AhQ9dnk=; b=KhpSIOeNJqIpvTmS
	Z1vWCmRrq94q/A/BDuVv8giCFroqTGYrviWy0Kt3BSY2UyZOjUEM7islDrxBKRLR
	N5LmBgSPgTppk78NTQfS8jzUmEp/HYIMNacwbHiX1VmFa0RCKLvjAw5gKrY+Ryon
	dc3qZfzDIgrVeSq1IafqxNhoWmmLnNt2i3NZ2eZPE20fhbEQ5OrVeGy3lt4yv4nv
	GgBZpUGXvduSGYhqMF/xXpaPJ8zxI9/YjEr7FcUFnFZ/Zl0Nlusrft74cNVUQd6l
	I9pgraVZgf2+/hfkMktUjwcU8nHZHvkV8U8jdNrZUPP8LTK0HF4KmE6Y7u4hSlxA
	ZmVFzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wn805k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:14:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679fb949e8so1111761cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734027266; x=1734632066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6o34CuDQjqWiE8aD45SAkl6xdvZg04LXk295AhQ9dnk=;
        b=PC5p6SCEgN3RQNY0+HhCXsIPRKTHVitbvGbYm4cam+05yoQOy5+/EwMwcNpgkDY/tQ
         XSmXGt5Xc74WksImdjjZc4+kHhp9ZUjBf0xk5r/pG9BdVnpYSH220CRHZdhhwP59Y57A
         9bYI7tE0K2IY7wCjDf/cAls7HykDKYElHusDV2re8MbndotEmndbTY/UwWQ1pBJx1QxY
         SWych9FLRPCPEw4xWLbgOhlgmyCaKpwzjleRbZz2vbTk2BxJyUrTcLmQVi/CO8H3bpSo
         urXV5z5GahobNC792disPHRc91kFDqoGff9xABer2JLrZHPvqsdMiXerwBrKP8v3XYzW
         /cqw==
X-Gm-Message-State: AOJu0Yzb5t6AsTf3cbyTl3TlMMXX1GsOHTHhrQ9s6XXzK/MiVZ8s/5LI
	DzALpeXsJ0350g3YeLjRwK5IIXj45XyisW8TNsqZxSIsXZ0EGj3AVSQwvQp2ajWhj16UGeX8Xcq
	lA9hv75qdVAWTrLwwEGoATuPER+R2xGOj0nJaHUa2Yar5am0eXbSOIymcBQemv2RE
X-Gm-Gg: ASbGncv3oMna+sdYNNW2/Mn+g79uivh96+gl8uC7Cmu3iWjmOrqcKh4Pm+FxsgIq+3c
	i+WToE/2QjIZZbSGcNPtVARpRYkjc1NcrRitdR4W6RWVAhiZJ86XxEsvur6aRaRwvKDGE4HVgGZ
	E00OJC0sWgzUFho4MF6GBehRH4pEVEAM12lreh6Vw0EYKuVB7uZ/bSZb3avJGh+vZVu4Inaz/Vj
	xGIWjbVppl3wTpo31LZZBJIzLXnzikf9Ax98TazQA9vjqdMRD2OlMu+kgM4pFwuSKzf0+5q962/
	WdtxVR0WjLqq/DQ+uua7vVZx5v/aWJ4JTr4/0w==
X-Received: by 2002:ac8:5a42:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-467a163b4ecmr8814071cf.8.1734027265792;
        Thu, 12 Dec 2024 10:14:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKbq+dtOAlzlx2ehxizjdJv4gj61PxcCVIU8dDvhWJcrDcq8P5cGakB8RjCzSrBsZfln6jeA==
X-Received: by 2002:ac8:5a42:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-467a163b4ecmr8813801cf.8.1734027265386;
        Thu, 12 Dec 2024 10:14:25 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ea09245bsm7296597a12.78.2024.12.12.10.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:14:24 -0800 (PST)
Message-ID: <cc3edfc6-f53c-401b-b766-f8e560eb24b9@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:14:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable secondary USB controller
 on QCS615 Ride
To: Song Xue <quic_songxue@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
 <20241211-add_usb_host_mode_for_qcs615-v2-2-2c4abdf67635@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-add_usb_host_mode_for_qcs615-v2-2-2c4abdf67635@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fLPrDXdB9WsQjS356DnLyCr0YMEqzA9r
X-Proofpoint-GUID: fLPrDXdB9WsQjS356DnLyCr0YMEqzA9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412120131

On 11.12.2024 9:26 AM, Song Xue wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable secondary USB controller on QCS615 Ride platform. The secondary
> USB controller is made "host", as it is a Type-A port.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Co-developed-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index f41319ff47b983d771da52775fa78b4385c4e532..26ce0496d13ccbfea392c6d50d9edcab85fbc653 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -203,6 +203,15 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&pm8150_gpios {
> +	usb2_en_state: usb2-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		output-high;
> +		power-source = <0>;
> +	};

Does this go to an enable pin of a vreg / switch?

I think we settled on describing such cases as fixed regulators
(that are always-on for now) - would you remember, +Dmitry?

The rest looks good.

Konrad

