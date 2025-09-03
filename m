Return-Path: <linux-arm-msm+bounces-71910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47675B425E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DF754E51E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFF928980E;
	Wed,  3 Sep 2025 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2+sutGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8712874E0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914608; cv=none; b=aR2PoY2vVvgThg1tDIc147JMG3X3/FUZuwdvdhEnICdRvb9Y6pqF+OO+bcwlPeMcHJLem7pP0PoQRhhU6LjRN5Qot6VWl9wmSHulQ/X5h8as44qeqoWnaaoXBdcWf2NJzazJYb3wsjPg556d9K/fnck5iu3+uaWsT6xIFv/2hQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914608; c=relaxed/simple;
	bh=H5qfSjclHJYp6VlMCGtyMvRXByBYpsPV4yiw5eNY7so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHqEqc6WCXFmyriosA38jS2VpXRXACmB5zYCpxWNj7pBXiR+hW/+T4jU7d0QYtZU2hrR41L41pmlLmc+Ja/BsA4BeMWdRp0ve7j30aXp1U9LxCOigXgXWmMDlpvSr9KGXXr5LkW2HeWEtfe7BRGooZ7C7XMF/Hl5kEw7xhuQxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2+sutGY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dwp8f005224
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wix1g4uaPabNljAYVNfcf6lXHFclM2pJ4RBkrprNZ6o=; b=p2+sutGYPslM6Z2C
	j5bJtXi8oO7ulNmoKt2MenR5taVhx+NdfhbmAHyq2GpQfZ+/kNTELUfVaBaKqkAN
	C0fb1Z15DYrLLhlwpWMWBpIuYuaxi1hj773G9nIunQkRH/aOFK49y6E+6aN+AXqT
	NkgDVHvVjodweK3/0SiOUM9V3j/KzauwIuPixykixjLBVzR/ar/000pLuY3ca3Rd
	aNdTLLHG4br25j4f6s8eCHn+jONf2tPzTReOrRLPq1ipf2KO2YAFbJFQL0IcrcMe
	zl9x7R1TBj8k0l6Wji5EZkktqJdIyOVMbDUNcBNNr445xB9l/gYo6LQ3aS7lcq7o
	IgWBWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjm6pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:50:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7f7e24d88acso2158085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756914605; x=1757519405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wix1g4uaPabNljAYVNfcf6lXHFclM2pJ4RBkrprNZ6o=;
        b=V4CH/+WQx9KHLdU1QZZSFBddYH6AWmgVcEJ3we9rqXTTPyZsks1Q4hMEdupPfB5rN1
         eppknVFmA+EFPtE+5aF7vHCIOXuuW4ykxRFlm8b9JOC4OydFaY7FA5vkxxuTmhS4vyRq
         YdZU11xJHHtSfUOaLG5k6w2t8fDi6SXFmV2jSmt1Sx307M0KcRobi1mENBNd6j1Nn4Gr
         T9P5mg2rrOkkQy5qRlf6V77xiy70SrK+LJGcvgVq1UCxMKREIUTkAU8tXUUkPINt9jj5
         pBObDxpa06l/d6sZ7IPEtNxZ71tHKAJyph2bBrZvX6VxiAi/KCxIoNWv4i9nOv5fDW2d
         u2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUuCQbM5LWIM+GIxLlq4QzqA9B+SbwtBmlHateC670dAUJqnp/78Yqg7psUFJkZOmhK7YoAw165DrlTWEGS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz07S6fGbQM2CZN2j/IJaJ7cAfwR42kZbagKZUsd5/UiANz7jqH
	g/4We2WkbAceZDW41+Fhf5m6un8uA6YI/yAAggJAMayGrJb6hGyOGFlPpSQ0ASFaho0aKAZz4Ww
	6mO2N8bt+MSWfBSHemh4vFKw9QSLdadzXXHS5rEJ1Y9dS+9gTO8eb80D390JW4RNCGXay
X-Gm-Gg: ASbGncs+LSL0h5rU3ZbDcEV8zkneGezCiUhpETt84xPqTcbg+kEzHLqFqn00sQLv2Y9
	QbL/42mjf9+PI1PqOMSGagOAoEyllVfQgQbr+JyQwvfIrEoN0PuXJ9QTxhyjD5aH0wdTfIVtoZK
	0/vaIhxZsrZ9H6Y84zmrIoydBxAjFcXpTlFpRIGKKrS6cI8OF5WacEYwoQaZWVxCOsI/ZUb1GYc
	N64BP78TnEaqjMF9QdRRNWBrWA320y2FaUvda27iN6p7DcNwA2lXTk91V6neIxtDTse0dosrXa0
	ePy6kNQ5rjQ2dLdIPnTa7OVjXvFUkNRjYbL4kjFK7SBuCaG6uKG6UE6ZcPyPd0ANCAXJlijGelX
	odvgBw4OLfAEu6CxUfvZyqw==
X-Received: by 2002:ac8:7f53:0:b0:4b1:2122:4a51 with SMTP id d75a77b69052e-4b313e59df0mr162339101cf.4.1756914604676;
        Wed, 03 Sep 2025 08:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYKt+soWuAENoVdQ9j/e/O6Qu8NlsHabjBSI6xYSgRI5GQL7c5Sk7w14RsYRKa3ZHe4HcE9A==
X-Received: by 2002:ac8:7f53:0:b0:4b1:2122:4a51 with SMTP id d75a77b69052e-4b313e59df0mr162338661cf.4.1756914604015;
        Wed, 03 Sep 2025 08:50:04 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5306e6sm12116057a12.47.2025.09.03.08.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:50:03 -0700 (PDT)
Message-ID: <facc2270-e700-49e4-a7ab-3b473e343ccb@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:50:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-6-bfa381bf8ba2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-6-bfa381bf8ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b863ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=g-wiT8vaiPKb6nfFgJ4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0ZJcOq-PBRNjhf2jeGD-RKv1dfx2RB4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX8Qc+ZF9CpS3b
 zQmHOOJW7B8pWYVP7LLAfYiM0RgTse5O1jSg1w5Ez87XMv9IQ6bk0MmEYSaN6LnBvhJ18n5e44D
 SwIe3Sdhi7MaWFW7Efo41Va1l5kDzhuws/ZzOJkIYAApZPQ/4Gi0zZMvqc8zX9nUquskBdDENBT
 MsUa51Qrp9h8dtDpBGrSMGIoRd386COMJmA6bWvA4zl8RB2tEAHTOFlN0ToYl9qBOaVXLiRoPLL
 DRrtUMUkrxJsZQ8zsRmx1GzW4UauriT4ZXvC8emp2c0RnkhkZPsP6nAsUxIfKZaSZp+4G0Lf77V
 CBdrYGyqSNj5f1pQgdNpXU89IqTEQMhnhCwCAGCmcWcErpyrOdua4kvmxS+tQf73KRa2aOOisSu
 Rp3jWyu+
X-Proofpoint-ORIG-GUID: 0ZJcOq-PBRNjhf2jeGD-RKv1dfx2RB4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/3/25 1:47 PM, Wasim Nazir wrote:
> From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> 
> Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> 
> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> 
> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 196c5ee0dd34..7528fa1c661a 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -379,6 +379,40 @@ &mdss0_dp1_phy {
>  	status = "okay";
>  };
>  
> +&pcie0 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_default_state>;

property-n
property-names

in this order, please

Konrad

