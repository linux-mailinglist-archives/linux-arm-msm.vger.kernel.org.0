Return-Path: <linux-arm-msm+bounces-62226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8D6AE69A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 16:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DBC31C209B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 14:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F348E2D5433;
	Tue, 24 Jun 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTHBkXZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423AF2C3252
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775911; cv=none; b=MzTRBC6emJWyMCr+ZBUkGmzkFPiNSY5IT5JaSyo+bQrqKU3th/ka+rMHDOuzwYKiyxwF0JAA6CIgNpriDx4uAWJiVrU1iFrCkcfJJFkAGNsKnlNXlHMkrvR/1BIUiCjrtjhkM1LZ9n0UlkEZgUjliWhMiRwXURYGW0TAcsGpURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775911; c=relaxed/simple;
	bh=jqMDmMENWLRbCBOnq0ZVNeFnU2Eo6RNLnlJ3ig3iJEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2lsoTNj1Hvk9psD+rIzsNkV0TpJqqCeQAviGka0JjWL/7w+cM+LGPPgkNyaRezvg6x4PNgS2H3eHvwEF8qzIDYCqnxJvKGmK2LcHKZExhLL1lga/+Q08yckI42SYiP7mljt66OAzaz9DAB1tWRRu6mHKNhQDbkEP65qmmpjtaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTHBkXZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OC9pol025021
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 14:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46eqylrIoJ6C03WJIbQg3Uxk+6crYEmZoHpQ1nqIRD8=; b=OTHBkXZJ+Zsoy5dU
	w6HIIZexKvV8k20JtNrqdeLFP0//ANTEWY38Op083p785fra1GUekhhhgJzJyumd
	7Wy10ENjG2AgZNgnmTXvH3EkENUvZIcAzj5IBEceBjU+1tYViRhmKRJQlX6nFv/g
	7UiXHtcOXtq8iYZQujJfmCC9ew0QByPUAz7puVsDjdxiekcZ7aixDNtgXUaEINyi
	tmicmuKnjSFog+OkpQi4L2lyv+TlFzc9FfIaJy7XESoLFOCxTf8ZfUDzy5GuEBcV
	JN+XOWU1ZqGgRpRIRQ0Bkx8A6Ip10+h9JmjmOno4kvmxg3wXs7ailjJn7tbzdpP7
	qI1soA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymugkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 14:38:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so84702385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 07:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775908; x=1751380708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46eqylrIoJ6C03WJIbQg3Uxk+6crYEmZoHpQ1nqIRD8=;
        b=QyKPfzv7mkKAyIlNaVPM8dM+ZrSjY+RL45alEtjYCX5fExXUE7ejPEwuqu660ahjlz
         rHkTzkNGwy3VDNS59Mt/7/Hn1LpjhxJvJDa5Qem9qeTVUWQhUPquflIeUbEp0d+RuB83
         OSUGBK1uq1YOUsUa+/ao1C4HLDXk2+9A2r3sbgg235ktwOZuC1U4OulLSAILYB7JPgYB
         u+pHJsAXvtqO1s64ED6qhC9HyUjSP9nDaE1RsDDbY28onoLXNRXanwrGfvCpX72xQKpp
         oNMviTQ6vKis2SNmkLDlB2CVikfuCqXjF8ojSqNw7Scve2/6nrXvoheQA8SZnfH81KxH
         Sabg==
X-Gm-Message-State: AOJu0Yyv6VjMaY7ScaFlsTAhYW+8ppDx1T+SL2ocWlZwjJ1xv9fD7UlL
	3jjld3eUDrf9WoDTQP3Fivc08HbR4jLl1rFh2KIU7cmysjglKf5pWi1Ui5LB28jqX8/aaOTT4/N
	GwquHiFlCNXkhsmLOz/K7ZvJ7+Er+8tKU06CjUUVHsFh4+i4LaFDLITQEMekmnPIYAa1q
X-Gm-Gg: ASbGncsEekae58jcqdVWuu4Q5RKbw85zS4rpeL713ruhX5o9nPwvQ/pS+24JVqNULyQ
	EYaNy96/1rp5OOMFw2jGUqnKosWlET6Dfgobkq2VKlVe7v2CJrp7/KLKPBhGLUPSUQAf7lC35jU
	Knwd/hughILqCdnst8+du7GcpUVGg19HFb4xRiEvtIRhD3NNYccuF7rYvx85+Usl73V1HLxAyBb
	pfvv6NhIX2cQmH3yhcbb82ykdpFrMAgfrshC28PM9V0S94/zJ4zu+D2bSr/fqWm6ulfayqJHwWM
	2Alyyq8Ue7wOSf2Kzn74a8Ip9F8/dMpqIBTJOl3jDdcxD6OeG4fdx68deUEHdWg+WJ8n+2hT/6R
	hcmA=
X-Received: by 2002:a05:620a:2b84:b0:7c3:c814:591d with SMTP id af79cd13be357-7d3f98b4fc9mr932118085a.1.1750775907595;
        Tue, 24 Jun 2025 07:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRqvGsol/GE2aqt4yUEI9G6WdeEe6JbvbFKo6KtdQLEdH2V4CXkBo/5R5g0TJ8S64kcKTjBQ==
X-Received: by 2002:a05:620a:2b84:b0:7c3:c814:591d with SMTP id af79cd13be357-7d3f98b4fc9mr932114785a.1.1750775906918;
        Tue, 24 Jun 2025 07:38:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ba7a3fcasm15026566b.117.2025.06.24.07.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:38:26 -0700 (PDT)
Message-ID: <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:38:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyMiBTYWx0ZWRfXy4i+BRiXds4L
 4lrKUY5FW5ZNo526z7wFeKLE7/+jlXQa2sE0aCiZlVnIrhhYgeMYze9Ta6+q9J/YUgyz1/KF9VP
 NSNYuK0fRN5VgNjyQiMwj0OqMUQEuTgXEJ3jngHOLn3A4Or94NjTksZz3vJyyrHYQeYqryv1nBl
 m6pj7pPg4dbjgk/9eMrB7LOqXkrvJrktZEm1Dv64zXsZ5nic6IsH6/SYU0mu5CgPUv/9B8GAYMn
 VV04q2IZvMzOvsyteqNO60BGiAPFeXfINEqFbiM2TXAmCPFG+pltVI0tZIS5zkHMiAmwJHCnbFw
 Fp4cBdsVqZO/9Ba07bTMyVjH71B/YidDKbH4e6I+jmrrgjaWlVqNy4drZSb9TGJBib0t0MzM3Qz
 gexbQisqnCwhKOZWv7E57syYNPUg0huQneq5IXUr6+GXgFgjNQjFvghlz7LAgVJu6ExIBu/a
X-Proofpoint-ORIG-GUID: 8Fsr1qHrbabVDkhvYjC_kWisT-2vjMiP
X-Proofpoint-GUID: 8Fsr1qHrbabVDkhvYjC_kWisT-2vjMiP
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=685ab865 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9lBeFAbR0IUyOWdzi5MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240122

On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
> first SE, which supports a 4-wire UART configuration suitable for
> applications such as HS-UART.
> 
> Note that the required initialization for this SE is not handled by the
> bootloader. Therefore, add the SE node in the device tree but keep it
> disabled. Enable it once Linux gains support for configuring the SE,
> allowing to use in relevant RDPs.

Do you mean fw loading support?

> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Correct the interrupt number
> - Link to v1: https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 66bd2261eb25d79051adddef604c55f5b01e6e8b..2b8499422a8a9a2f63e1af9ae8c189bafe690514 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  
> +			uart0: serial@1a80000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x01a80000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};

I'd normally expect to see a pin configuration here as well,
especially since you mention the bootloader doesn't configure
the interface

Konrad

