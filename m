Return-Path: <linux-arm-msm+bounces-49980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B14A4BBFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 11:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8165166352
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 10:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C501F181F;
	Mon,  3 Mar 2025 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6qLtJnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628581F0E3D
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997486; cv=none; b=LsRSjk3Z4Usd93F+Osvnf/QZKc4SSzASsbtFyt6ckNXOlUAaigBpHPYNr2zUf78oMdiGobBXdThcEXDgNfBN+aW8P11sHUuh6qJ2ccJeqZ9+25bzmsqNeJBn1zd4yooivdKSHEVQs+s3UzdtkKge8qcDTBSA3kVMOGPqEhAb9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997486; c=relaxed/simple;
	bh=oNannqQPiN20GZ+BHfvaroWwQhuHDZI4eMqVKF/YwNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k20aQyXMPI8AQeghcRQv+/JJbztc42wh0wFmwV9FWab8+OVNPf6/x7D1clZH/wp5EbdoRTo+GZIW/fKcaWUUIEuVyr6S6mpYQpQcTCR5m1cH9t5A2K53byXknD8y2SQ7/Z/PNtv5SKMk9TlDNhLM7gdpHMqQo4IOHpSJPVzaoSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6qLtJnb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522MrVl6021852
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Mar 2025 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5ahGViu7mWHfBE/U6LabXy74q9ltD+IEs/cbzuNlcM=; b=T6qLtJnbfCJhPlGv
	EkgU3kDNr6HKJCP4M5wBdVg4Yz9ZTmUqZ0yBItZAkrZkn98XAwouH7ZtlikkwPax
	GCEsRJMvhKRfmxzdDMLRpRtZdlXQJtUq7tOSgn2Ejld8dmcykaR8N/uLUEAdpleI
	fA39wVaq0nKIFHyWEtozFD12JNHxyGL4ynZzBk+nJrwrHrhPxAd4JFyPzo737jPW
	aAYFnQobvcEUXmhIOIoW35JMaT/Xn1/XJN5FsPvfPl09s829Dj4OwZjZcNGb7WpX
	vGiP0g9lMLw10YL+aC4Y87M5cre5/k3doIseW2/UDl4wc3dA6Z7PvvdikSL8SpJo
	8Vu/9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tf0mdbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 10:24:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fed5debb85so3463745a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 02:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997482; x=1741602282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5ahGViu7mWHfBE/U6LabXy74q9ltD+IEs/cbzuNlcM=;
        b=qe737G6HAxnLJ/HyZtHuPChz/TN2Gw79DISWcBf2KdgveJJPH6KSjOXbJvI6ajviBf
         KEt4jsrzsF/c5o8t6R4BBgKmQRDbPvtDrV8TvfoVgNDApesOz4Ow9g2X+Rx+ISSw472U
         VPl4z9uX/5fh0c4LzOzkJRR+Jf55XOMBHgPxBcgfQp7lBsmmOdjPyOWn6b/j4AmJa7nZ
         xx0NJug+xZO/iuJ+YIwtMpHQ/J7bZ27IEyERk2izqQOah7nY9CyRVxg7WSdDFbbSzl7A
         spgGBfIADiOx/xcSULrDC+oBoWEp8Gfk7z1gD8AypnkPc5s3E10ptYFfwyFqLh8dhlV7
         qURA==
X-Gm-Message-State: AOJu0YxipUxBYCJPDv7UaWXDRg1R4c4/KCkzXCTg2LrI4lWBjr5eyc1r
	GA31ahWyS9Lkx0Qqw8XtTCGdqU741vqx5R3Etmfdhn9vzFKchaz5eQc2zshKNTFH40gZszcqVqT
	dk3YfUDek286E3jxne+KuTxj7UkV/EeoKR4319VMZpSLhIZkkiJJk+mKcTKGmwe93
X-Gm-Gg: ASbGncv02jKWVWHHeCZdDm8VDkGvAflmwImbJ7BxL/FO3xvMOuqPEQu/faChw15PzK2
	1bUGvaa+nY/sPy39yztpoiiV3knW6/ZgoKL5MNcYLZCUVeCAj6NIYggpfM99NVdPDHsY8saVezZ
	TlKHRd1mCrw0VDHFOVpR9a5MDyoD/BnG8RvwxlMiBXPvkzgvZWSf+WnIscih6k+L5uC6rLSNxLI
	fHVJtabcpJJbEYOmFuIhJv3Js6Ha4X2WMKre3t0MnttWMHdcOHLryoEwjS8crD0BGZSrwMZ4dGk
	nsh6PPuq4j57rCtwJLCm9zMa1BU8Zq4SgYvCKqLU+h0HL2ukjNiybRfPiMc=
X-Received: by 2002:a17:90b:4988:b0:2ee:a76a:830 with SMTP id 98e67ed59e1d1-2febabcb0c7mr21393578a91.24.1740997481655;
        Mon, 03 Mar 2025 02:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEALCniW+g8dNGDdCDI6uEm0eVuwQCKj33EnrSZUUlmNAZ/nXpTsx/74bSfs7XoeJdEM7XvHg==
X-Received: by 2002:a17:90b:4988:b0:2ee:a76a:830 with SMTP id 98e67ed59e1d1-2febabcb0c7mr21393547a91.24.1740997481289;
        Mon, 03 Mar 2025 02:24:41 -0800 (PST)
Received: from [192.168.1.35] ([117.236.245.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505293ddsm73795215ad.229.2025.03.03.02.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 02:24:40 -0800 (PST)
Message-ID: <8c416213-8f46-40b0-aa04-a2a89d5dd0a3@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 15:54:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] arm64: dts: qcom: ipq8074: Add missing MSI and
 'global' IRQs
Content-Language: en-US
To: manivannan.sadhasivam@linaro.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227-pcie-global-irq-v1-0-2b70a7819d1e@linaro.org>
 <20250227-pcie-global-irq-v1-17-2b70a7819d1e@linaro.org>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250227-pcie-global-irq-v1-17-2b70a7819d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MgHrfBMnF4gcLwwtpKN5ImzN1OAnja_v
X-Proofpoint-ORIG-GUID: MgHrfBMnF4gcLwwtpKN5ImzN1OAnja_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_04,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=571
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030079


On 2/27/2025 7:10 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> IPQ8074 has 8 MSI SPI interrupts and one 'global' interrupt.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 40 +++++++++++++++++++++++++++++++----
>   1 file changed, 36 insertions(+), 4 deletions(-)
> 

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

