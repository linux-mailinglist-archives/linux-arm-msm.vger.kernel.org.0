Return-Path: <linux-arm-msm+bounces-67203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AACCB16911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 00:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21025620D00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 22:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CF22153D3;
	Wed, 30 Jul 2025 22:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3V/EC2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11F21FF4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 22:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753914794; cv=none; b=iR7IQw4UHqQJ6hVZ1ByQXQW0/HOxXP/bDth1NXRtil1iaDr26H6yG8wFOqvf92gtIcu41HLGcrma+gP3RmeDx0mL5j6wHY8YNtB3OLcOmqg2u0+NMS+cuZrJ9mBwTnKVRrFhgcEKLn/O244zZgqqk3rjCaimMkopHJr4Z1cg7JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753914794; c=relaxed/simple;
	bh=XD8mWT7+uwBdZy8KdwpfcJE94eBSheB6SpO3Eck7/ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uY0sCtZuxx2X5ME+/uzn/x/e+rBSFNhsjNrs5Lkirp7MwLXEtMrdGTKNmy8yQlUXgRFfqQIsvNfQxSpWpPLum5SCoPzV3mpbiAYUL3CFNqV1CdGBy7tHcBaYfFP+4fxDzy6H6l+IgB/rE67++kltZTnlVoi5DcAFgUqnt80Sjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3V/EC2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb9kw005853
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 22:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIB9+SMIMAIs+ix0aXzyrQiRdkqV0NUTde9TQd6wMzQ=; b=a3V/EC2z4ipyNlKh
	gqW7ffq3BvDUgYszA1pR7+aguXmkDMKR1xggTDN6Ox9S0p1JpSYg1LR0Y3NQO50F
	cvZY2ft2pW0qFV/IpFJHabsA9Y2WbIzDF19K23efnVSeyXlMD5YVUC9JeCDN3PwC
	ub3AU3ws9uOW7ojAv5hfV4pIT/IWYhi8pHy1RNwuX2RT48anj5+MluXB5u8zsqcF
	ZqjuKBYasKn8Ubwb7ThH8qxGLsrSz85Pc2gukXb3BZxWy24COmDWsIJ6k8sqiBUC
	srB/A4CelybrjPyIHWUucIYUoEIW5ZHfzJR6js8+hCvgVr7bGFT5g+IhjxwlKxjz
	XMhEkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwg9wag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 22:33:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab60b83e11so659651cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 15:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753914784; x=1754519584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIB9+SMIMAIs+ix0aXzyrQiRdkqV0NUTde9TQd6wMzQ=;
        b=ByeDX0M+dbE7nxKXB0GYm4yr2OUoAPo/gnyNCXjGzDW9APdCfHirEfR+yBZTQ7MQ+n
         nIoCFNlPCUoW0ZPYcv+XQePg/qAKCl64305zX97GrAajG9On9lw9Mfb0VK7dM9wmeoup
         HUa2zqOu8ITTzSTvVW+Qs5NyqaFNByECisnZgDEJq7yBkfwiOAINFsuKzRK+lHfMb/fc
         FedG4q6mZNGtC8Sddc8yFTJ+WoKfWJ4UNWVyY5BapwxDIg7H9aACF1nLKeaFE5u+8hyg
         dsXiYiW0UFtXZrTY5J3zDr67UtlbWIAX4aMJZf5mdYelZFTcdW4o3m3E9mLNjrrD98HH
         neZg==
X-Gm-Message-State: AOJu0YzGYLYGPGTGb0zfUFTOIJTYCcwVpQc39QKr/sniB3yWBDN0eMIS
	2aTD3ardAD9wacAW0V00HpSq2uh8pwIdjVvjhWJxTVgM7ElZGAL0af3hhXMvxp/1BEMY07EP41V
	APmgWgRuGFDO3ErNIb0tHNK7trfAoi+Fyw6DybI70gAJedrHOBD2OIIQMHmTpfoaApKTi
X-Gm-Gg: ASbGnct9mhDAeRyMI7AvEH7YxFBz/EOb/SK4nDdQ6O1QjkHpPbJ3N/eanXrai1NCG/R
	IdAbgscMtoOSFt4NzlBRGDpRanRJe0BqyCGXYMRli0jZgVuXy7oRDvqghfGXfzbCxHaKbbzIUSJ
	+3NZBuY1sTk/qvzuH0hSGyxTnC3m41WsweHZNZZej5iBMu2AVwnpHOjndkNCrWntkSsWUSBIz53
	YXHUjAC6imB7TQaQh4FS9tapnVuKzdSyUjrdmp+s6peA4Jd2crG7MgNWYqtxeWRNXFQzpB9WFkK
	H33lCuDnuXsrshj4Vocqw+fqvfpBavnm/seEkGRhzmBwrcE+4M1Y89jb92wVdoL5NB9UuTSlHMm
	sI2Z37QeWwCu32pgZyA==
X-Received: by 2002:ac8:5709:0:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4aedb93aec3mr46218041cf.3.1753914783960;
        Wed, 30 Jul 2025 15:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzJ1DWPgTqRJxs6el7saUaAs1Unr4la0oOLT0iT+JU7OrzOzfJloiF82fDLMEGg79NNIYk0w==
X-Received: by 2002:ac8:5709:0:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4aedb93aec3mr46216811cf.3.1753914781653;
        Wed, 30 Jul 2025 15:33:01 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e82b0sm8695266b.87.2025.07.30.15.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 15:33:00 -0700 (PDT)
Message-ID: <36f3ef2d-fd46-492a-87e6-3eb70467859d@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 00:32:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc8280xp: Describe GPI DMA
 controller nodes
To: Pengyu Luo <mitltlatltl@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250617090032.1487382-1-mitltlatltl@gmail.com>
 <20250617090032.1487382-3-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250617090032.1487382-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688a9da1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=3m9cAMs9dPIHispIsJUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NiKtcKEhne6aQz0iG2d1dX7RXeLo1gzt
X-Proofpoint-GUID: NiKtcKEhne6aQz0iG2d1dX7RXeLo1gzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE2NiBTYWx0ZWRfX1ey5g3oiCBd1
 /NpTlEZdDoMelqhbrT1uPdXorAobLuzn0Dej7EOLv0VoM+3lRNrZC7RLhb2OAnt8JkbztZaPY9o
 MYNS4YuIPfJUgpXo8ewI+k5s4gFBDsqZtyeGZHi0zjazBbN62Myk75bf4BcYSubceaxSu/bwC+F
 +oULISC5ipHzhat9MSGJtJxkneUPbk0hD198OTvePTiN5y19vQgGVqxGh5FMM3Gq46j5MmiExm8
 YTelybCCp68RqOj+MOBB2bxZV0J0LxubvhGqXvYJRlFXx/Hjr04KFOGAdGqO8V7wRSuHy7yeSrL
 Vs+O5KKSjraQFlh9CpEVRSDMXJOBkeB+OfMh5ljjqxHhOxUZLQsYOJH9ahwO+2vjxCKd20vge61
 1kI6IBdeYS7GGjfgm4MJrM2Udj4/icFppwlD1RiJn6T/JJAYtA50heyuPgEy2SBXw+iJDP9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=998 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300166

On 6/17/25 11:00 AM, Pengyu Luo wrote:
> SPI on SC8280XP requires DMA (GSI) mode to function properly. Without
> it, SPI controllers fall back to FIFO mode, which causes:
> 
> [    0.901296] geni_spi 898000.spi: error -ENODEV: Failed to get tx DMA ch
> [    0.901305] geni_spi 898000.spi: FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode
> ...
> [   45.605974] goodix-spi-hid spi0.0: SPI transfer timed out
> [   45.605988] geni_spi 898000.spi: Can't set CS when prev xfer running
> [   46.621555] spi_master spi0: failed to transfer one message from queue
> [   46.621568] spi_master spi0: noqueue transfer failed
> [   46.621577] goodix-spi-hid spi0.0: spi transfer error: -110
> [   46.621585] goodix-spi-hid spi0.0: probe with driver goodix-spi-hid failed with error -110
> 
> Therefore, describe GPI DMA controller nodes for qup{0,1,2}, and
> describe DMA channels for SPI and I2C, UART is excluded for now, as
> it does not yet support this mode.
> 
> Note that, since there is no public schematic, this is derived from
> Windows drivers. The drivers do not expose any DMA channel mask
> information, so all available channels are enabled.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

[...]

> +		gpi_dma0: dma-controller@900000  {

Double space before '{'

> +			compatible = "qcom,sc8280xp-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0 0x00900000 0 0x60000>;
> +
> +			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;

The last entry is incorrect and superfluous, please remove

You can also enable the gpi_dma nodes by default

lgtm otherwise

Konrad

