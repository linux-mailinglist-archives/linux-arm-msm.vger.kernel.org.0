Return-Path: <linux-arm-msm+bounces-46646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E94A24A08
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBBDE3A5744
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 15:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA3F1C2DB0;
	Sat,  1 Feb 2025 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt428S+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49957182
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738424912; cv=none; b=XLZ1Sf9jk3TIno8kksmhPjnnSLS7XfG3RBt9g9XnVkb0/gqTtM7OYjo17J7UZHQYBiV83XQU4T1/BbartcBenpqr8VghR1jjcnfjzdNtOfbIqXXAqI4cxubX77byYOEJq97HiC1axOkACyAjSpxB8gcd6byxPDjtoBLr2xvP19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738424912; c=relaxed/simple;
	bh=uSGnFtAub3eoq47/irBf/Ues9kJZ2R7qUHvedd7kXcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIe3TRfCzFpUrtGA1S4rtVjsGvDwajIXDarR8yBlHu/zY+LRm1YMLvsVMm0gcrxu7/WvtZ79TzRXqul/OXab2g6Q0juy+17tDweuIdFz674ikIsFiGSkJ33DpNwXZu140kX+uhBGjS7yrMiUc7oOLzoop09HR8aM488XI/yMubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt428S+3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5119YBLu019794
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Feb 2025 15:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8n2dQUsAQR8BGbcIRrC/eRUMfmfG1kg18Uqsc42/YA4=; b=Bt428S+3uxH+vEzk
	tnDluDLTVPQSs6ciBolYDkA7uHbbln9oqYOG57YImHkpp5ZMl0letkUDsP/aA7q1
	+4zexevqo/jQRGjiTXd/TwV2XHBkO6VQAYP66XLS+JbTc7QJEvjsHI/fqRuLT5ko
	5SoZO4pbhbCOpqjWnSZ6u7VcxE0jfnGnQbSwntG+h81k4saZ3Gzi1VYMbjw37+uC
	W9KapccKfQZ+KguK95pnyNCX2DgSq50Fa+z2a5yPt5QK4FvsfuL1S42I8YDKj3cp
	8ziqcu38WFZf5AZjyljX+qjL5ndVD6BqWaZF1SGTL41eVf6tAQSbl1NdarzHlQf3
	c3ri6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6a92rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 15:48:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6dfba8de3cdso8709566d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 07:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738424909; x=1739029709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8n2dQUsAQR8BGbcIRrC/eRUMfmfG1kg18Uqsc42/YA4=;
        b=jxVuAu7l5mbEbvjiSK+LfJDKcycu7QJ4/KjQjCF3qsqu479tpi1C//LKdFXMUdgp5X
         2epV+4NmyIIhyigIL/yjUkGSDzZcFtbnEngNdY8zsOmxAciM5fB9s63jGKHE3ZBsMTgQ
         qv5rsDykq+JoF5DRNHtQD4jiOhDVJvq8uiL49R0db5dOrJw5CfRhV58VVAePeQB4LkIC
         ExZ+6d7dBHvFyOzgoGk+66IuN2qw2PqhaawyhoGkqdiK6yKvczEDgUVl4duvWnuZS5Mx
         jsPNqJWj/G/m03y8H05HEjGxr5b4TOWKmH2pEW5Tck1ueYfKGphI8tW9lCcZwli9LOcr
         D4ug==
X-Forwarded-Encrypted: i=1; AJvYcCX4suooVycT0QsK7+xdNPg4HHrHajzd7fEPOD6nUtsC1628qOFXFMp3du+Oe0J0Hchflo0nNpmr0SIN+2yF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4yoW2a1GHOkE1CLuKjRURBC45SFC9iiv0FYzwQ58Rg0xAudQO
	eGDGfFQdVCzDPQfgZ4gomX+bPuZyySO8z9kpR7hNYCW/ItioQATSrr63X2+h90n29/sqRcihvnJ
	73qFwUOHnBQIlmjgDPK881PIsUFgQUqdg1QqIFOnGK6+ne+5Tz90S4JVYmBY2A+Bs
X-Gm-Gg: ASbGncsMWxQtxUb3KbfwsMOzGPnX+nXPCEoqm17tWr7I4FqeBdT3VemC1nQ1/IEPl00
	HratdWQmh1JKxtdAVrHFKguxQnDyV2q5YfApKG2kTjizQ/k1UctJt+KAexMywk7CgrHEYJrptur
	5E712CRsVrAzAZ2/ViQ4TJIaZjwd1jcCLhB1InXJw8WdlkmrJGrNqvBT4iM6hS51jNe1rMw3qTu
	i9dbfN5YdroDTQPqldIVXnCdfu71t9Z2lzGjuH4sM0WJgZM9XW7OFKICE3nMlkO2mSyuYVvPV/j
	QPkyOOnLA+71q22lqn42Gwhxtjw8SLaQ8sWJFZ/Z/JoeXAVhqKg96k8AS1U=
X-Received: by 2002:a05:620a:44ce:b0:7be:5020:6df1 with SMTP id af79cd13be357-7c009b93599mr574151285a.15.1738424909320;
        Sat, 01 Feb 2025 07:48:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxPpR9kTBzdbY+SmZntvSpbA0AmhKdf4LITbXaMdP95XvejXet1vO1PHrcj+dARpvQVLwZIw==
X-Received: by 2002:a05:620a:44ce:b0:7be:5020:6df1 with SMTP id af79cd13be357-7c009b93599mr574149185a.15.1738424908921;
        Sat, 01 Feb 2025 07:48:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff269sm453716666b.118.2025.02.01.07.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:48:28 -0800 (PST)
Message-ID: <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:48:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add ethernet node
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qfodqdln9tXdzChMfx-OiV0EOJ3Jm9dy
X-Proofpoint-GUID: qfodqdln9tXdzChMfx-OiV0EOJ3Jm9dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=669 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010137

On 21.01.2025 8:54 AM, Yijie Yang wrote:
> Add an ethernet controller node for QCS615 SoC to enable ethernet
> functionality.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

