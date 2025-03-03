Return-Path: <linux-arm-msm+bounces-49979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963DA4BBF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 11:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB453ADE1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 10:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063861F2B94;
	Mon,  3 Mar 2025 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNt3uvV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612511F130D
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997390; cv=none; b=YmDkmhzXyuVz+bNUsBuAa/uk1W5de/MjqCM0L2ZI9Ucq+GeLfV3R6BDzxLq+a2jSEuI1eHH7ua2WEHaTOTZvnW725CTLIRIQ1kh5dFswQOUZ/sXMWyxARtGxe5FO60R52Oq0tlXFhbyrpxig0KrzADSSxxg9w4hRJKyJSqdOAhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997390; c=relaxed/simple;
	bh=45N3CTCQyFNYATVodSXBAL+a94s2+Sf5PekV0GfAnzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CeUSVyg6yQzfFgI3SjZ4wm6HuSzKav+WCAqXtAItX3pvn6rj9VN/AaS4yuBIubosL+NmylA/HfpQScLSINgluvzOARSlRxAcw5yHzQk/SclpnHWCmpBrjVb/j8wrqf6Tsr36SuyAeEE+CAQrYgNczN5pfyHNlNMTtc/VcohSDm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNt3uvV1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522MjvX4009286
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Mar 2025 10:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GKhAMHMv9Qj1+aCKv/F3rYQfkqyHFXlh7B6Upy8lJ2c=; b=VNt3uvV1VYM+zOhx
	a4GpvWlv3sWQkm9TJqOKwNqZ21pPhTc+0p2ybbNPcXQqSWPwMR/N1SUM6kBK5C+W
	4wsvzev9/nqhbmeRPRnkpdCtTmw8yIs36ATAe3oO1VTqXZ8TdZhEY0IqLV8fyshG
	Tm6Ko65Qls5jIOuy7M3HhgPzJd2N6On87zDsizwEggbGu9AtqPKTq0jfIl5RSCdJ
	9QCEWRvj8s+sSdeHpTPkiRK6qWorTEqHe0A9NOn6KaAC06BtdmRON4P335xXO4Z8
	bE0Sqb6S564E88peQ3qg3HO6uyMQ3ymjW/Jw5cuFpK8JRcIhcHGupaCavVDG+8lD
	IJ3XGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t7hvjj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 10:23:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22326da4c8eso78843675ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 02:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997387; x=1741602187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKhAMHMv9Qj1+aCKv/F3rYQfkqyHFXlh7B6Upy8lJ2c=;
        b=OldyTRdSwE6HVbzRLC8YwxGuWd0rxud0AmRT1DhcUt6WYzFBoMoC42xxukAN9PzeKR
         tVoF0Qnx3DOt4Sl7zuL6ivL/f51XERUxkodojSsmbrD/CQWHZFr4+dyEL4JrMduuvbT9
         Xrf3OAK7xiaPZMRXIK+cAgg2PEWY7o49+wJsga5FD1pYwwtOT4XEXdx4QNY31sCj8fT/
         LPPSdOLzGIDFbE3ezOfJ+fbgWTFGeChqH50DPkTAZFD1XW0F7iunv8VS1CEY3FOnq9LB
         PJ8zLzzn3dnltzq8Eo2aAXVGeU8MLox01S3Tb+22XVhTmuaqdelgFKYB1XB0ga8bDYVT
         fK6g==
X-Gm-Message-State: AOJu0Yw1o4jqjfKKXCthP+/qSCnpFCZwvkbHB9mZ0SGT6YgpD3baBbS8
	zD4GYZnEtTh1MwvQYu1qR4kfO7Es0btnvITLzhMTGP6HIlUwZjGZzUlIuSofrUqcuCFWPWAhPUh
	B42InVNpqoxoEIz+UBgY/tK6W99qC7QfCEuhTwvm+fS4F0BqE3NmJMUWe7w1vOOuj
X-Gm-Gg: ASbGncvQQ4W8bfy9vXTmtmZ+FRY4QJrT7PEpo/nYFO8dxoEMRVQl9E1sP/AHi6asN+a
	BgV9dALb6O6yPJh+KuwntrI4SWmazeoRPWH5KDQ07SQhgNL7mBliHO/2UoKBpSkmBMVJDuMoAFf
	HyDBv75h8FhOHVZdpe92tCD8G/tsyFw1J8WSKHf/1o31mknrvx1rjwsLetFTMOlRgyY7oNwhpjX
	yzlhgmElQpYpZvTKfIbRIg2I6UVjVqVj5pXaWRA1goIw+BiTJH9he1BWsEpATxzUD6d9GTlIHCr
	Ky2lVamg4T52Wi+2wjES+tYjg2IUSF0x2TQg1Y0qN+AzBcWQc1wDz+NI2eA=
X-Received: by 2002:a17:902:e54b:b0:21f:7880:8472 with SMTP id d9443c01a7336-2236924fa13mr206373615ad.35.1740997386642;
        Mon, 03 Mar 2025 02:23:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzewlI+MdkavpK5IxUd9OuTeDDFG7whKIl5HH92YgygrrZJJ+26+G+Xae6Q3us5qqTy1cWBA==
X-Received: by 2002:a17:902:e54b:b0:21f:7880:8472 with SMTP id d9443c01a7336-2236924fa13mr206373175ad.35.1740997386280;
        Mon, 03 Mar 2025 02:23:06 -0800 (PST)
Received: from [192.168.1.35] ([117.236.245.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505293ddsm73795215ad.229.2025.03.03.02.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 02:23:05 -0800 (PST)
Message-ID: <8dda7af4-b318-4e39-b79d-738b6084feb3@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 15:53:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/23] arm64: dts: qcom: ipq6018: Add missing MSI and
 'global' IRQs
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
 <20250227-pcie-global-irq-v1-19-2b70a7819d1e@linaro.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250227-pcie-global-irq-v1-19-2b70a7819d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sbPrDawQEWVJCtyFsnR4tFKHBlphOmCH
X-Proofpoint-ORIG-GUID: sbPrDawQEWVJCtyFsnR4tFKHBlphOmCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_04,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=597 clxscore=1011 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030080

On 2/27/2025 7:11 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> IPQ6018 has 8 MSI SPI interrupts and one 'global' interrupt.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>


