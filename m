Return-Path: <linux-arm-msm+bounces-48689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEEA3DA8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 13:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E62ED18916B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3457A1F63FE;
	Thu, 20 Feb 2025 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnBk9UNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443B1F4E37
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056122; cv=none; b=F7qSxRFkyfOCGNxEz7tFTWVZe8cdd83DeVUKCmPPSk2wg1L9+yg7mpUtmF6jx3fSnXwp2GiDPT3AuCdM8ri40HOSpibmV90amSgtlOfIDoh3ED8fnRvbuxV+Bt0sr/aBmT0gLQ+zmiexYxcW5LMFvMSzqC/85wEP6h13Lye5nEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056122; c=relaxed/simple;
	bh=EbKQHVN6oqgGEPf9FAfCApk/KurNujl89PUvcnXOba4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SALY/eHiKRjR94rj/hUGd+FCPqAeLpFXDW39Rz0y1NHl/6wg8zwdsqLohVbbUxH3LRZIOkllssNdf8WDD1+H1Fl3695Kudk2eeSRbOOnI1ogIT+Zq2+H8IHbiDnJcq+oSKoO9b9iOOiwpqYmdsNjj5S5D3oCt+F2KaPk4W30Vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnBk9UNn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6Z1kB011183
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 12:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNhc2GfFkA5G5m28sQKj/yG3aqunIu5PTbHW/iVqw70=; b=EnBk9UNn4IcfPy8L
	UTg7XZRzk2Kfd8N05llR1kh5xrh41l580AwTl9OwC4+p+KxePAycVPS97hXnGYYh
	RHD955I5ju8P1f81JKUGLfGRJu5pDh2hcwZsAfyagj6izM305a6o/ZUdyIJx1NZV
	jf6sJcMN2zWu9877ksQ8ld5ywpTeodAzXYuDoRlEk7i6TYUhEQxYdGJdm2lhagWY
	ACCDcjH1XZkObzALJKElWN23jWEqZdC6/jP4663AEEdsgKDKbqDKvMT8TFGIpWom
	yXzEhplWZ+bIDAy5IA5J/yrPIXxV9APlsSVTsFv0ud6T546HIUzaBF1Jcc6JRvtx
	DuBGwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1x7gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 12:55:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c09e78ac63so21668785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 04:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056118; x=1740660918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GNhc2GfFkA5G5m28sQKj/yG3aqunIu5PTbHW/iVqw70=;
        b=DwHVx8jS1T4Ta0BgYOVtgU+2fDqK0EOg0c8aMX9qPPnr2B9jsnHKu3xyPYud3XareH
         QeV/iciwzmAGlYjkinUbkRk2J5uhsrQHO0K6fbmBmJ3sKxr25xETuKe5yOuVAgtoK2+n
         mbjTG6ic2Xp0H3Luz3R9c6wW4DvtDB021e0i7fCZaTVo7ZiCWjP9H0Cb5IviTZ8+wrxD
         phZnafeZcLCwQzN+ptsWrKJ9102BA9YeJw2ivp4RKc9XYKIGGPSYJPt1N/fkWPWjh/En
         nlYzXUKTt+6TNSGODY2tZXzcJ4fou5UEbzzrXrno08AOeFddbXRApZqyVlcuKPZwCxkd
         05lw==
X-Forwarded-Encrypted: i=1; AJvYcCV3BSgg4fFPFsqfu/qIKTzczANTnXFoabNCRJL6XKZ7ORF62wM2CrL2zFbmi32/RXQXvNAu7sfa4STKF+5S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/DCP9mmZhh7Qr9oVVxN0YoSMCqEX01KLOuQ0N/h0Rle7ZVWD
	ivu/iYJ0ZkY9mjBZF9K5vTixGtWa2WrcooVbiJYAtPS+dw8XaaSzS85hhaPuAJIZzXrp0nQiRXE
	NstVPDr17H6fpag2arcmy2zmcHUlWwjtJK33TArhq627n17DWD0tu9Qn9oKmnRqO4
X-Gm-Gg: ASbGncs+EPdiIxdzglJrGMwu9WdEatj/bn3C1xEc8zrcOPsrPUX1NGXDpKuWHrNjXWQ
	h6sB9gRRy6z4oePNuox9w1Zv+FYsOT9Wf/ZWwbjcHRyHaSDspqsi2YRGvBNsAD+UGA1MjOFg8VM
	4VNnrCAjkQ9HMiYmNSp6bLvVLZTIgZXH3WQaEMftwOWXrsJt5F30AebcS+tVqJ/J2R7/3bzQJYz
	O6oWNYDxU9Dzjd1LgW5duCw1OS4Oi7k+cboTMhtuEeNBMe/JsdU6kLs9RLO5esQoUpPXfE/H/cF
	RmPbF+fD90KQkEsJoM6dCa+Z6WXLg3A9GRtyaW753y+VH4AVIR32cviKIn8=
X-Received: by 2002:a05:620a:c43:b0:7c0:8786:d538 with SMTP id af79cd13be357-7c08aa79fb1mr1144491085a.14.1740056118411;
        Thu, 20 Feb 2025 04:55:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP6GaZrJbFArjMHLjuje1C+cb4fAwXFftytGq/49s+mRWX+kFjF6e1BU0c5BZw2Yh4URqaZQ==
X-Received: by 2002:a05:620a:c43:b0:7c0:8786:d538 with SMTP id af79cd13be357-7c08aa79fb1mr1144487985a.14.1740056117697;
        Thu, 20 Feb 2025 04:55:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2867a1sm11941017a12.66.2025.02.20.04.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 04:55:17 -0800 (PST)
Message-ID: <258bad12-38bc-48fb-8b74-9e87928b235c@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 13:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: x1e80100: Apply consistent critical
 thermal shutdown
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
 <20250219-x1e80100-thermal-fixes-v1-2-d110e44ac3f9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250219-x1e80100-thermal-fixes-v1-2-d110e44ac3f9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xlUCmvXKlgBoXtGwoAhOUYpGIpezwvcO
X-Proofpoint-ORIG-GUID: xlUCmvXKlgBoXtGwoAhOUYpGIpezwvcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200094

On 19.02.2025 12:36 PM, Stephan Gerhold wrote:
> The firmware configures the TSENS controller with a maximum temperature of
> 120°C. When reaching that temperature, the hardware automatically triggers
> a reset of the entire platform. Some of the thermal zones in x1e80100.dtsi
> use a critical trip point of 125°C. It's impossible to reach those.
> 
> It's preferable to shut down the system cleanly before reaching the
> hardware trip point. Make the critical temperature trip points consistent
> by setting all of them to 115°C and apply a consistent hysteresis.
> The ACPI tables also specify 115°C as critical shutdown temperature.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4e915987ff5b ("arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

