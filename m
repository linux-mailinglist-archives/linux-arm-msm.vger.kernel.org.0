Return-Path: <linux-arm-msm+bounces-71351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797FB3DA5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD9217669F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 06:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4CA2475C2;
	Mon,  1 Sep 2025 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THgSErlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55A1E9B3F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709773; cv=none; b=VTDPT4PAb8D1X35YEKM6QpfWH7MaVjeU18lpQNuYvnBVG8RzG0D2pMt+rouVCLOjANdEfxmB1cIfGTg/EIgkwQB8eesWnnzzV0/f8ehpdlDYIcgJMrsdlBIeaIEb5PIE4ktUB9yb6r2Q6uWMGv3P/kuuoECaM3eD1f4Vi6JBfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709773; c=relaxed/simple;
	bh=Kr7bzmorPtSCUASbDkgAHM3jzfUg4k7jSAJIfdMlUUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRDEHj2or6P8CAjSUBIWOGKC5iTR6jCWQ2TPtEu5Tx9LzfVzEWASt7ml3NmZWEDfVO16ALJYpMK/eACcUvKr8Tt0poefE6ttK5GfOr0XdmGwWGVfjkiT7mWBZa4h9YEqjXhy5JjGQe6p4wikv8g6v5XkRFC+WEvtLs4ElBEtX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THgSErlX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VMEl0W026953
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 06:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUTMpiJXGYapQKmYjxRPfwmA/QRa+grJXv3ZH9iFjRA=; b=THgSErlXkxFPhrDP
	QdsXzrF1SbsD/3nYOoVqP/InZd+C12uq6dgO3yUcHhVMuniE+IsH5bkq51bT1YYC
	+4tS+P15GoMQti7suWRACpJYSXbJRdPbKntmzXZmRCJc7tgEO/Ar7DISVEwPy5x8
	XKblqNqSKrFOwqyyRC238PKH13UkmLJG+BBGpjMHqVASyfKnS8KRwBm0zSQwm+8S
	iO4/eyP3wM/E/xL3CRI4NvzQFcm91Mcz8peksXHQECckOvYpZmHSGDEe3uKqI2Tf
	wDLoXNxRhaLJZNEOLbm+vNAPmwhG+bHFHwGwiEbz9hwEdDI6Jj7MwRC0RsmTUND+
	Jot0bQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8kmt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 06:56:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7726280f7d0so404497b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 23:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709770; x=1757314570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUTMpiJXGYapQKmYjxRPfwmA/QRa+grJXv3ZH9iFjRA=;
        b=sLEDTy+rRdmrSsXaQKF98MhUAPaU6p8NqX0cgSas6Bq7BaX3drfHwsk7ovTauWbGIk
         8+YDL3dUy+KAlCnnxHibNBSbg3G8RKm9knz8rc+jIEQiMcLi5iGgFT+ow3A6PMZObpXl
         Qf9ranGPCHfpngK2aI4hhzfvN7l0RiM47eZe+IeTHTCNbvlUrvbcxBP5fGWfNoqwbtyJ
         NPeCD0IzesORrSQUgm3eaYZpNZ31BZ8AIZYd0UZK/PVGP5JjDEHx91PBm88r30Jp+WWg
         eCq3NDlwseEyI4Iykw7ZAcbz1DsMQ5efpeLbzreQNg3egyv1PeDYAe0ahNyvdA9pEpLi
         A2jg==
X-Forwarded-Encrypted: i=1; AJvYcCXjcef9AoKB4lUXhaRfc/IuoPehl/3LgZe2LL0GC/3Kc0ru1thKRhBHvuWmxRU6Nw9Q5kIUnmqUD4C1esEj@vger.kernel.org
X-Gm-Message-State: AOJu0YyBe2zw4+EQw4NMSa4aPSbYqLlNxvzTZ0orDMdvRfeb/+1NMZq2
	rLgTlZv89pVJyCwOPuW5vPFvdB41yAf0O9D0dDm8qWJ4tPF2vebtKDbUBFRnhmsqYwGPCRpVcHL
	ocOP0lnvGSbj1B4PZrub3ZuWVUhVY4T+rIUl3dbM0HFUeIFp2YB242dVMKYeYuCCdoRjl
X-Gm-Gg: ASbGncsxqzYf9UFpLGNS/JpbtFkhrSif/lVNhprOBAMfqMEnCsg6HlIFJiRdUAh079p
	AAnGsRv2YUfWRVZvy+EIeBrUuHv/SDxHfhvziBG+fj8L45aoaqX61M+oLd824w4uBKOZ812O5Rb
	7HJSmq4Kk7/FrCuESne4pAxu6q9K/D0DjS/ngolH6O7wx5l0NaTL1ze5n4zgs3n/vLtenW4vhPH
	xVdH8Q38viQSuN7ET7P79IILFwsZ3rx4WGCQYTAV+w2gYUSaoVujSr667RvqDeQvEFhJgNE3f82
	shMhi4tbBxhWSzlt4PCYc30038FreTUzlU06r5TFkIh7MIaAz9FO3y0qFfHxUYZ/KGM+Y8vbMmb
	boOFjKbIaUeIIQv4zn82hINzR+0fELkt/7Q==
X-Received: by 2002:a05:6a20:7fa8:b0:243:a91c:6564 with SMTP id adf61e73a8af0-243d6f431a3mr8852515637.50.1756709769861;
        Sun, 31 Aug 2025 23:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSaKYhdRZRLVbaVGgPFjyPsISXyEB6DA5LnZU9TaTrGjeZVotxSEaTfa85XU0yVwRM0haE6w==
X-Received: by 2002:a05:6a20:7fa8:b0:243:a91c:6564 with SMTP id adf61e73a8af0-243d6f431a3mr8852476637.50.1756709769320;
        Sun, 31 Aug 2025 23:56:09 -0700 (PDT)
Received: from ?IPV6:2405:201:c40a:785d:2c0b:e596:ead5:2f45? ([2405:201:c40a:785d:2c0b:e596:ead5:2f45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724284fa02sm5689324b3a.102.2025.08.31.23.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 23:56:08 -0700 (PDT)
Message-ID: <3cbe6692-2ada-4034-8cb2-bc246bca5611@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 12:25:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] PCI: dwc: Add support for ELBI resource mapping
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250828-ecam_v4-v8-0-92a30e0fa02d@oss.qualcomm.com>
 <20250828-ecam_v4-v8-2-92a30e0fa02d@oss.qualcomm.com>
 <ymsoyadz2gkura5evnex3m6jeeyzlcmcssdyuvddl25o5ci4bo@6ie4z5tgnpvz>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ymsoyadz2gkura5evnex3m6jeeyzlcmcssdyuvddl25o5ci4bo@6ie4z5tgnpvz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U5zubFweFPnQrKLB5ud8Vh6VTdbSvdB2
X-Proofpoint-GUID: U5zubFweFPnQrKLB5ud8Vh6VTdbSvdB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX2XPdpeeqPCDE
 +i9b7t5stmYGxpJAqj9gy3INEVgADmyLAalxOMtJheMjXH+dBu6labTo7WFd4uNlzOQ0c3zoQNu
 Qgv5WIj15c6RugMiqkTXqZvg6TzLE/X9JzMALIbisHIMw/EW7nP9+1N1yBV2KvschBRNUrLUjEC
 yTAW0Q52nbJR89iFrf4/cNwp0wMi9u/GaTyK1PQcrPAXTftITJlmHi4n+fLO/30gFyNJ+OWeAAj
 cfZzA5frRXMav4zZIio2gnzAzivcioBcH+XcwpcR2NP2GJtwEE8AazKwaJH/9reh1atq6lDD0SX
 wn0KcvHaM871xYGuCtdBsMJNW3+3Hi2fBXXUngGbP5XF/SOIrInagzRAVENBSlDJQdsqrmAiBzQ
 XyfjtUIG
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b5438b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8Rd1e7yjQrnBmPj41GQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 8/31/2025 5:18 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 28, 2025 at 01:04:23PM GMT, Krishna Chaitanya Chundru wrote:
>> External Local Bus Interface(ELBI) registers are optional registers in
>> DWC IPs having vendor specific registers.
>>
>> Since ELBI register space is applicable for all DWC based controllers,
>> move the resource get code to DWC core and make it optional.
>>
>> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-designware.c | 9 +++++++++
>>   drivers/pci/controller/dwc/pcie-designware.h | 1 +
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
>> index 89aad5a08928cc29870ab258d33bee9ff8f83143..4684c671a81bee468f686a83cc992433b38af59d 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware.c
>> @@ -167,6 +167,15 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
>>   		}
>>   	}
>>   
>> +	if (!pci->elbi_base) {
> 
> Why this check is needed? Are we expecting any DWC glue drivers to supply
> 'dw_pcie::elbi_base' on their own?
> 
I was following the same way that existed for for dbi_base, where we are
allowing DWC glue drivers to supply if they had any different approach
like ./pci-dra7xx.c driver.

- Krishna Chaitanya.
> - Mani
> 

