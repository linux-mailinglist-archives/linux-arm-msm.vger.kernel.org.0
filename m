Return-Path: <linux-arm-msm+bounces-46370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02360A2097A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B25918838F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A2C1A071C;
	Tue, 28 Jan 2025 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqZt8Z2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98C19F416
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063109; cv=none; b=RzdPumnzccb5jQ6VfCnrfvUeHVBa8dKggsArz2UaitagoV9/9MNyDlRRWo5zdyQ0Q37bo37sD01RK1+9BGe9vQnJwUf9O1y15IBv6uYAQOlx9NKJ8PfUIWibBgWIlm5XmptPgC2s949TA/qr8A8Ypr1SsLoPpaEsWXNcFY2GJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063109; c=relaxed/simple;
	bh=G4IXUxY0eg6+F1xyidjDa7PWyYO0U0p1OsiU4kTAz9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3+y8JsV55AVslZaGt2jRP4LeQRda+VAomoPHfRjjIihBZkz7SZ+7K3ovDEspcquv1Hu8B7iTvfv2MN2eottZ2rqlFcaaajJPNOfpgGjHUH98/5eYaC14e/DxbFPCUzBnNTMmIJgM0a/K1aYiEM2VUpq0HucNMtImUORj/xHLc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqZt8Z2K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S63Z38011372
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnQ3BJoNG/cIl5ESS1LSuP7uYH+r71cLcYw02kBKVsg=; b=QqZt8Z2KtYt+IS6a
	LMIFmD2hDqCwc/9ScY1uz68ml73udBUE+rq7vcf08wqwtHOYLD+41szca9vHn1Ij
	EoPOibtBCPuCM17AzCebecj8NdBoWsPicC6AuFV+eTqcf2NCIQUUYmPRgc2ZE1RU
	dxOnhIy/lAFJz7D20GyxmdZkDel/X1FlPQqpIw/T0h9pLD0fGgZgt1TlL5sT0LpN
	WWXOeIdDS+w4WMir4jBK+9aa0FZqTtIZf60ZDH0mF8VqiXJRY4Fgdojckn/NzYNb
	qizeQFlgXYUIShUGotr8grH36LGkncrxeQpUpxLgp4K/HG/1a9ngitj2p3UnmRwW
	8CaoZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44esmw8q11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:18:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6faf8b78aso113246585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063104; x=1738667904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnQ3BJoNG/cIl5ESS1LSuP7uYH+r71cLcYw02kBKVsg=;
        b=EC4BX2j/7ALBcu49vxpEJ5nd9OARW++Zul1Ud3qLZd7vNbkZzwTzHsAwAw4Gf0iLEV
         gfg1R4w7WXms0N5yMM0BKwweT0cBfcSmMxpm6uMkA57EpfDVjdDPydBmfzbWfObA5fsI
         Y2ieaRgWogEQKjZWiy3NHLREezZ59zzO6v7p/Mo9c3ME3UMQkQIHQqA3bZl4EIadq6ZS
         qA2Echo1jVSSGqsFMWZ66S/c4hXDavNRmpa272qYvGlT8dWly2DyyZ9h3zZYkD8rO82O
         cLXvQhiH4D23Yu85CAvpCxkYQGE/jp9eolqDOMi636zQUb40d7dKBeUlq7q4G27DBLVx
         3y7w==
X-Gm-Message-State: AOJu0YyqS8ZLJH8spU2iXnITUrpxWJ/wvT54z8xm41ZftNc1U5Zk2Kfy
	+UJJVYE9+agU31EJ0erw6wdPGUhqk57+1Fv1jzkQQGkQAam4NZU8k2QwXpLvltTSRYivabP+/Qo
	0HJXOXrtYa9NTi0IlVqj7IhntHxFSC3Di6yhAmsDUz7BEeRUUM3qv+2emFh0nRb/R
X-Gm-Gg: ASbGnct/WuTwDGdZrW3u8ZhmWllCkccXa+usgM/daAa9K+4/oh0fnxXWo3V2kZyrVx/
	fAe/6L3a7fygb2Rz4HtGBB+MSRnfKiBos7gR8NOWyu+WiJuoNMMDZJ7DmXGZnkWq/0GHya9dc+g
	sw+NjOblfTJuvHk1HinjXH/hndwraYEMXRSw03WkKg7e238vZA9Qe3kdX0un32bdoW5X4OVkhTO
	gugoc/woiCE3TNXDmColJ1EZMBcuY2Ani206xUQtpMi50Ey87YdcpDdWyt+456sLc4+qwwR20Dp
	SD85bjpJDl30FMd1Yff3kHpXKOEpKRD8RgYIqKTzQ6S4hci46hzY4hlzbME=
X-Received: by 2002:a05:620a:4713:b0:7be:3d23:c2f5 with SMTP id af79cd13be357-7be631f2589mr2253480985a.4.1738063103922;
        Tue, 28 Jan 2025 03:18:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+BRRCO1ize68T9xsA9iF9cy7G8Hnv1+z12Ow3DxpvImONNGP1T3VSheGvbWSKwJmPegPofQ==
X-Received: by 2002:a05:620a:4713:b0:7be:3d23:c2f5 with SMTP id af79cd13be357-7be631f2589mr2253479285a.4.1738063103492;
        Tue, 28 Jan 2025 03:18:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18618835sm6783501a12.1.2025.01.28.03.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:18:22 -0800 (PST)
Message-ID: <d503fda5-20d2-4c6d-8c8a-52b1accf29fd@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:18:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250128-preset_v2-v5-0-4d230d956f8c@oss.qualcomm.com>
 <20250128-preset_v2-v5-1-4d230d956f8c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250128-preset_v2-v5-1-4d230d956f8c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N3Pr7nFNVQ7fSXkKc59WekNaF-ENH2CV
X-Proofpoint-GUID: N3Pr7nFNVQ7fSXkKc59WekNaF-ENH2CV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280087

On 28.01.2025 10:37 AM, Krishna Chaitanya Chundru wrote:
> Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> rates used in lane equalization procedure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> This patch depends on the this dt binding pull request which got recently
> merged: https://github.com/devicetree-org/dt-schema/pull/146
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a36076e3c56b..6a2074297030 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2993,6 +2993,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phys = <&pcie6a_phy>;
>  			phy-names = "pciephy";
>  
> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
> +
> +			eq-presets-16gts = /bits/ 8 <0x55 0x55>;

Think these should be 2x longer, for the 4-lane port?

otherwise the values seem in sync with what the bootloader does (good)

Konrad

