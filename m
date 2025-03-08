Return-Path: <linux-arm-msm+bounces-50703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F6A57B62
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C951A188B382
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3381DE2D6;
	Sat,  8 Mar 2025 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QStkJoM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6311C84C1
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446220; cv=none; b=Vm9QEiurXq8SlUBlQbR2XVhBMVa6LKgmTdW6Evmzi7Dr1iw815sLDMjqEzT3pEDhTg3wH8cCpfHHk9N31hz79ZxzLHsD0j5n+T0o54cHF4cTT/IdZKMoAg6GH9SuOxSNggk81xa6hjsjqTtl3uJZhKEe9G0/d9j2aCHVkRbB780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446220; c=relaxed/simple;
	bh=e8SexFMLy+V7m84HKtVT7FdSZ56Nzyx3ZfiZYFbyK0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSlbD41poD2UXeyqjmyXXiaFcToxm8Hoi5CvQVYJOKCS5G/CfgwVNKMFldwlfLT7ZHETq9pl/yQ5HENTlTN+LZ6UETMPMgAVSbqy8HNPdYU0NemI4S3NLzeACc5ZP4EPpZj+S0O4+kGGYCFtE3hqEZcVGN+FiRxOWxLnTPB5tXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QStkJoM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528DTvfv011340
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 15:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKPlg8KpcdilLw+MDQw3ribbQkf1W3yXLlwbnkUFVEo=; b=QStkJoM9yFDPRuKP
	TAlN9Nx3GZ8AzY7PwGE6cY+IUQALBrunGtJ71X91Iydk32xhzHGO51JIXEG0/rVW
	iSoEx9rxOAMom7RXWhrXa4KQHWX3Giv0qYI2bJIDaSizeOBOJFAFjZzWZkuCtLXE
	KMrgw86aP/ossoee9Y7dn9i5D3NyfRy+6DVTn9vVIpTCkLkvOYN/9OgicGe9iA2l
	bIzWZCP9i633tpIVaOpMKHGWRbEbSYrkDqsvrYfi4hrihwwr/5JpB8GaW3NnKmsm
	plGuhK6NVVX4M6Fervj4CyTeD5QUU6MsXdfYyHzI7vGmqla/DFMRW152l8+7hIoE
	hYoZVQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0prqdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 15:03:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e19bfc2025so7239336d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 07:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741446216; x=1742051016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKPlg8KpcdilLw+MDQw3ribbQkf1W3yXLlwbnkUFVEo=;
        b=eCZ+UtxZbgIGh5OQIYELLPeTBeVn+lrwJMZLlMQxBrlhN88uZyUXKNRJaSwede0T12
         2nc37e8PTXRSbmOQRx74Ht5tc1jf3rTQVdao3p+LSVVlrKD9coakses4+yUMH6b23Vt2
         1G+ymrqNNuwopus03rrI1CjPuZdDu7EFD1XmzP+D/MXvRezHOP32kcNTsde6+M6o8Fw5
         yNzk5/Blx73+mTKC9sSS24JirtlBrzHkF2pHuJilxdj/+faE05jDuiTwfF3w7BZwcuH4
         8/JWjUUKIhw+785u9ID9Nli3cG/yov3vTNx1UDsHrfyAjCt8Rjz7yEaDEZ9N05pHNRLg
         VpCQ==
X-Gm-Message-State: AOJu0YxMcYJ2URmPgaHMi+a1Xzh22uiX3s//QVLDDw7LjT+1AYSDz22A
	ns0yzPJu+uCF3YMEMNNfU7fWpCr4YNzRqyNc+s7IEgO5y/0Rt13v+zEA8OuK0OfG8iSmRW5TkXZ
	2WAbvFG3Y6BCrSM7NqeWzAiTrUMoeSL//hLmKi//ZqiCFKeJcEP+mpS/xdY3h4T5l
X-Gm-Gg: ASbGncv16LU0OCRLyEMDLm1S1Jr4v0FZsfkW/creWEyUzN96IAgXr6edsw0UQX7ZhdQ
	vFVbHzf6tvDYG1YLVXnR90vuO6SybQyYBT6tErW8B3tTgldAEBoDQMNqU1xS2acc8htCYmn5I8J
	gC+UhpBiRyYdHjtOrJd/APf1FBipWrFehtbIrK46WgVNmKu3U1sGs4hWMM54rOjA7JEzgCpeFqL
	8IeRfoU4gpHlswX6+7N0ibvfBGslYGEkvdT5DK2PxPOm1ddGj3Pgpf+DLocH3EVOITNKXOF69ed
	1hOzhSx7cqYbPvwXNwPVnJnEPnN6WvUd9lSqdY6qfgJDpb6FlsUA7HS9Eh3OqltImTu2UA==
X-Received: by 2002:a05:622a:2b0c:b0:474:e7de:8595 with SMTP id d75a77b69052e-47666ca49c3mr13703051cf.14.1741446216612;
        Sat, 08 Mar 2025 07:03:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2C1ER2UZOIAo7ctUzp4nSuh/7gNp2uvGTLVNBhuB4jYEmqZINWmCWfInxvDC01eRy/YRnlQ==
X-Received: by 2002:a05:622a:2b0c:b0:474:e7de:8595 with SMTP id d75a77b69052e-47666ca49c3mr13702851cf.14.1741446216104;
        Sat, 08 Mar 2025 07:03:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768f98asm3999255a12.68.2025.03.08.07.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 07:03:34 -0800 (PST)
Message-ID: <df2f0bfb-665e-45a8-8103-5c6217dd194a@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 16:03:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] arm64: dts: qcom: sc8180x: Add 'global' PCIe
 interrupt
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
 <20250227-pcie-global-irq-v1-21-2b70a7819d1e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-pcie-global-irq-v1-21-2b70a7819d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PRnNqfwcVEUgjh9S7LyDM8UJQ0tmbDZ6
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67cc5c49 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PRnNqfwcVEUgjh9S7LyDM8UJQ0tmbDZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=567
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080113

On 27.02.2025 2:41 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> 'global' interrupt is used to receive PCIe controller and link specific
> events.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

