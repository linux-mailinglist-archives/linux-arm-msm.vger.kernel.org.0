Return-Path: <linux-arm-msm+bounces-78350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F281BFCBFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E9919A37F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE606348462;
	Wed, 22 Oct 2025 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBnRqMYI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801734CFCC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145316; cv=none; b=OFKdDIzMUGxFQI4+byRRfJsHIjg3w9xaCCsTjO6YtqCiTnkFkXRBy7tQ1iWB1yP4R8sa2mvIdwo8cv0h77zZByw2SQzDFiY+kdYem7MwG9qGu8ErX6HvgISKs2MeV5oDUSSjug1gQLMtyo1kt1Yz4iZ9087UX29Sx9EKuVieKSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145316; c=relaxed/simple;
	bh=wBgS1XQbHKjwCZWH331tMpBjONLIz9oIPI0AY2nrSCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oeA791UOiXeSr4BJkuDcV2Qezh20w/MpNGr0TAAuAYGKMq5jiTd6IGqTbdfgb0g8zUGjXhdJw16u/EQ1Dmo00JFKbHbUU154P8n8YjUC+YurhUneFKlWF0yJF1j2QtG99dC1jUnzNjQ3DNKb6POuerlIAhZ4VmYR/Nq2k1TH0ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBnRqMYI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBW0a9027617
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMIllqxAxPDQ728CwihRb+R8lpaZm1CZIGmWcY9cBDc=; b=lBnRqMYI2x4D59hv
	/oK3jFg1Yf8tBQxIJZALIjvUWvQ0RQiQAd83EHATeCV1CU3BGhIehXeyyFci7sip
	+sUlxiB/+l1rPikTXswpa1qe9i7w1SpIOHNclXa5Kr4NebCJldQlfETqotG+oUo8
	eiY4bt6fEIdFbaFv4RdagdUjr43M//PD9tDC1BagJz0pPHZyViRPe6Tm7AyQ5BdZ
	IoHcaFz42fUIDpQS3o+aXwT+kD03kQKyRXvbynvCWJMLf6kJ0EEGpKTcSQQnSG34
	AXnoDoi1zsnb/VdwPcpRW22B9Xx5EB0v7okxoVISDtlB18/H0ClRNeAcxDUmwY54
	6xwKAg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j4yuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:01:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54a7aeef682so88702e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145312; x=1761750112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMIllqxAxPDQ728CwihRb+R8lpaZm1CZIGmWcY9cBDc=;
        b=ci5/j0jBgU+EheILj4/Vmp5C9KAdCjqKXB1RlAKxgUWMLjLynft+qfsMo5bNN2s63t
         OXVQBer2AzsGtMhuRg8Ctvp11u0UFYTo5+QSClZWzMYXWOJwJGeYziAXVapdXJQQTG2n
         jEvB5YgQbi0qemIaizcRoz9nK+eroePoMJlACagqm8t3ioekw+PoDdmrlVmRv8Pz804d
         fLnplqUfkgXQAkd8Cw7UL9sRl4WxHEwdwqLbuau1HPUy8wpWPpDuQswLUH6bY1UN+eZk
         Kei7UHbJuqVI7TAcPxj+1srUc9csOtfhPEAtYfyERy5yKQq7eCUEvEpbDJc271U9MQrT
         8j8A==
X-Forwarded-Encrypted: i=1; AJvYcCUiRB1LeeKdnEUu548Gu2njvLcv99Dwgs0g6+HiIYcdvU10k9YSU+aUmtY5gN//99gsCnOkLWy2c/mmStAR@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRIILEmIe4wAIdbU670SPwrl1SWcm7yiUAX9aIdP1DVuSB8Fk
	RTAw84E15v8Hl5LcQidY1sS9IbMg6x02NErfZMPskceecogM5iCbSWs3NPTxVySO7FjzOpDMH/t
	aTqKvxhb9Smmq/lZ3OHMOGE+lB2kBc7gTDgEZdOm5EFotPGnRqnXExL7H1K5wihDhS8Qw
X-Gm-Gg: ASbGncuqP080akZtLaTcOAGkI/wgue7Sll05nWbmTqabxWOna3PgFxSgUn+I0FaSwaR
	xLjgIOb0po0XhrmzXYlF1mHLqo4uZOIe23+uAkz1+iwt2PORZdv8ISk007lK9RWO9L1j8EpvWtl
	65IqH3r/wCLubMTnBTTTEt87TQnxvIQx1N3rbrzZepG4DmyxBWsqhAH3EEj98QpH2zp+a47q9nZ
	8nVEXEPHl8t+nOFUu1OCyGlvHNxs59mmG7E9k0JN7e1hy7p9bf9sEU2YcYm9trEfbiLyiEpNUMB
	c6X34vYiJyZQ9VNaz4meLXy558mkKr8kgzpnoymokEqqBIqv1Y/blBXIxp/Yr778fen6Kas8dKq
	9MNzF0ttN5ujHGPYrbizhWnRUp8sUulbng13YHncu4tQSOcYv2dgB7uUk
X-Received: by 2002:a05:6122:8891:b0:557:594c:54bb with SMTP id 71dfb90a1353d-557594c61b3mr67743e0c.3.1761145311472;
        Wed, 22 Oct 2025 08:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfgRrt5iXa7DFomRJIQGJ8VDhlVThbjhKqjcQAvv0iCP92sfGzYuCXXxlj2xPk/Du2wJYrKg==
X-Received: by 2002:a05:6122:8891:b0:557:594c:54bb with SMTP id 71dfb90a1353d-557594c61b3mr67646e0c.3.1761145309915;
        Wed, 22 Oct 2025 08:01:49 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725f3fsm1354965566b.68.2025.10.22.08.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:01:48 -0700 (PDT)
Message-ID: <295c775e-852c-436b-84eb-1084e549598b@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:01:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] arm64: dts: qcom: ipq5424: Add QPIC SPI NAND
 controller support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20251014110534.480518-1-quic_mdalam@quicinc.com>
 <20251014110534.480518-5-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014110534.480518-5-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXwPDvfm/bON/Q
 4MvsoFrzVN2F0RspxpJNQWNHCLmfZOIgiNgCz4rexSqc7e80JeuCSyn3RJWoy5FpE9gDFha5/dX
 Flz3nTR1hd4V1YkWPBKwZFjEZU3RJqQhMzwp1uFnuG4l+BGel51J38c/cKeFDsjo/EWfyZwfauw
 ZsqnokDmmBaK4Rgl8Tqs35ikuGDL3N/Y6zt8EWf7NTm2YeWpIzBXDkvgqCwTgbivhAn/3mdSqC/
 6nNb/wyolNpz4mbVJ1h/hj51QGYi7YuMBgglh607N1vWFHcw2LEUJZhL4JUq4oQ+824eL5t3AY5
 /5K6mDLjbWFZyBSe8wJw/giraeuJqR+v6LqBrs/KTPk2XC3YdH4EaRYHoTrKPjMW3WSXcAvRXpG
 avWnpcXxUsT91k2sEYm0lWZHEjZ0HQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8f1e1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=eg2IErnvy-Z71prtMQkA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AYjYzU3Xi_p8HrmNhVTkvSlufUI1x4ov
X-Proofpoint-ORIG-GUID: AYjYzU3Xi_p8HrmNhVTkvSlufUI1x4ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/14/25 1:05 PM, Md Sadre Alam wrote:
> Add device tree nodes for QPIC SPI NAND flash controller support
> on IPQ5424 SoC.
> 
> The IPQ5424 SoC includes a QPIC controller that supports SPI NAND flash
> devices with hardware ECC capabilities and DMA support through BAM
> (Bus Access Manager).
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

