Return-Path: <linux-arm-msm+bounces-70813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5926B35482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6828F6878F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 06:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1392A2F1FD8;
	Tue, 26 Aug 2025 06:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FufYbW21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF4D28CF77
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189454; cv=none; b=OANmbEF6GAmzVPA/5ZQJBfNy7D08/1uKD09pGFeIuk/ryczWamHogJ4J1D+vl3ykeRrAgjbUth+KGdtbgj8PC5dNpswjQ9wbJHwcwqdS4eSaVp9yVqXCrVtXV00D+OpUCEiRGj0OWuqTDaJ1di27HVxjxdVUWNofmuMN3n6Vic4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189454; c=relaxed/simple;
	bh=ul90Ca6MD3k2RmH1jBXkn9THRXThzKvep5Dh7WNSVXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAZFV3O1/PdrFRMf7EEnZizYzdIK87kvxCFH4XrheTGe16uY/lDf/SR72o1YkKjgKG+c6OIQrWPrE+Vl4vNsnk6sjHHNSMfUT0W7UlAXC0UpvLaXzxr1jMaWWAK2c3cXoeLm6pRLdz07MXHkjoAPlraw4i7jKEgv/ZUhuzjbU5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FufYbW21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PMjPoY027946
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aP57du5hI5dY/ksSUGXf2FChqaV+/pIdZ8ikNR5OOB4=; b=FufYbW21/Z4Nxji7
	s7cmCrjLiJ3DMReKZ9VFLLWTkvEcUuPPAFCj/JNLILg70oAgWKnwrsEqQzPgPAsb
	X5tmvr/D39rsUP3kJjnybP+xIzalZKyxxsOrolzwVA8gfiKKpH6JayWVPtzcNqbh
	u52IKh3dbNTe9Ub/MgLF4OKbIYEUNy/14xlerCZLvZbvngMAYw+foYTbbExKJQvi
	qv0Jx1rD4QhdhqQTDowmPLuKKO4OaDWytjcD6nUKVpE/W/ope0TyZajXyds/hSk5
	3fEHkJXj5ee7PhqANeqsqyuWG7QmNvXiuKrpWbUCFGqDD6BQ9N6HVVlCR/Ru5Wl3
	rAxkig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpet1mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:24:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-325017f25aaso6913866a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 23:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756189449; x=1756794249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aP57du5hI5dY/ksSUGXf2FChqaV+/pIdZ8ikNR5OOB4=;
        b=WdS7l0grfUSs5nXk5/7ph95I/3nmlYNB+HcPw4Zwlejhhwdx0szXObeIYQVKXOM4B3
         /ErGUyUUEjfuPo9Lc0Q9ErLpYWPsOTbbkwM7SCfGkRupDQwt7eFYQAEvKeVFBLB9pMo3
         griDV2cZhHLBuSsM84ig500VIvUr8V2OziHhIRfvrCIwtmWGKmQp8CFk1LDQPq5PDV/N
         3jr5Tlx/Pc858o/4DbnMKpsoLnzetDjOqzM/sNd/omqu9beMqtawi5vei/OoIgD7HYng
         MW+bpCuSCjZnpPPDkukaYeNNNE2akJHJ+eGvrKTIpzBa1pI8WYlMPUbr9uCcF+w8+leD
         Pcrg==
X-Forwarded-Encrypted: i=1; AJvYcCVmpwivfcVPRtfISfFYouAMVeTn0MJyFnu3wWzuSzrm2loAC3/cq6hWmsrBaOilmy1WAeFoC8ZuXyxiqGVk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nAaQ2kkNeizNb6Ik/oNLrrhZvfPvZq0w3RmuIG3qQPr+TmgJ
	CHiBOQ6+iFfHTZGxiFjE6UyyC5mBJz3bxZNzhQ8zYkdRfzMpKMhYd35aYO5nHis/9TeD6JxuSMY
	KSB1gGTJ5RU3mfaNlMfakb+GqE9mXLGRGX9tKiMzGQSRF/FYq70NQrigEAeoqvbRfgV+H
X-Gm-Gg: ASbGncsuOuH3AyDFC5qtkO6bGeH4pXtt6CX+fhFo+VyfLbfZF5zvyiATfvOvudgLqi2
	3LAx1mXU9982fpEYg8lkEae1/xtN927l135zyyqTsBR1+LwYc8qj7g7ZZmBIZ2Ho4NEiKaEZlhX
	tB9ate2AcVwEXtlpYZVGT2xUzD9+HujGCndsxrDq0gS+PdYRxacIkk6MMVVFy5/VoKZCHC+6A5g
	gYA4Isp9DdAFNkdXacwf/0UxhSzcejWbY+ZoRdLn3woN70mKLS1Z/JbplOCKlvz734NZqHnH//q
	9HY9ij6PjSXk/y85JZZfHDxodeRvE44xHJfVNmT94qi7BNEyP1IcLg637joKqR7ItmldAtc6
X-Received: by 2002:a17:90b:2f47:b0:321:87fa:e1ec with SMTP id 98e67ed59e1d1-32515ef197cmr18057507a91.34.1756189449193;
        Mon, 25 Aug 2025 23:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7DCRIKcIriYxv1vDQ4/mgZOlve2e/tBHGMXP/jORooseUlG1Jd2+iZHB/A+lalVnxpwBTHA==
X-Received: by 2002:a17:90b:2f47:b0:321:87fa:e1ec with SMTP id 98e67ed59e1d1-32515ef197cmr18057469a91.34.1756189448603;
        Mon, 25 Aug 2025 23:24:08 -0700 (PDT)
Received: from [10.92.199.10] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254ae761casm8785891a91.1.2025.08.25.23.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 23:24:08 -0700 (PDT)
Message-ID: <65755189-09e0-44f3-98d6-94e44e9b1dca@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 11:54:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] PCI: qcom: Restrict port parsing only to pci child
 nodes
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250826-pakala-v2-0-74f1f60676c6@oss.qualcomm.com>
 <20250826-pakala-v2-3-74f1f60676c6@oss.qualcomm.com>
 <rurdrz3buvb7paqgjjr7ethzvaeyvylezexcwshpj73xf7yeec@i52bla6r5tx7>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <rurdrz3buvb7paqgjjr7ethzvaeyvylezexcwshpj73xf7yeec@i52bla6r5tx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rf0b2VQU_fyYGmGDmhsbpgOeeleW2fLZ
X-Proofpoint-ORIG-GUID: rf0b2VQU_fyYGmGDmhsbpgOeeleW2fLZ
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ad530a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=Mpemr54xhKQ9MbVj_C0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX4ymJo0Elfc9C
 CxZW5YaKlDGUgeazBhuVxblepIB/ZLMExwmMGDDzQ0tBG5sPu6l/1QEsYsqyRIg2JG3msKj+1XA
 VDHscyBwJufEuupgAohP8JwiSkHVbQfwo5Leua69StMZ8ymAnDKl2DUc0j+jMc5n2Z5dtPETE8G
 mfQF860LaTM/VJDvEqUswt6jWt8PDSuOz4bl5jvUkhwGWtDyEY/ioRW/Jr51Pm94MLYccR7LzvD
 h8dspu4Yj0j2TrZ9Pe7Z2sjUYNoeDjNrDD0f5KDHVYIyACjBeRwESqs2/Cb+YGU/6t3p2PNQB14
 /aCJU2ELmsE/ufcsZ1op+a/ILSjDNcwGLYXQr2IfYKdjqZOWzFO4rvV37M0PdZFFFhOPrG5kZOW
 VEkVJUFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142



On 8/26/2025 11:47 AM, Manivannan Sadhasivam wrote:
> On Tue, Aug 26, 2025 at 10:48:19AM GMT, Krishna Chaitanya Chundru wrote:
>> The qcom_pcie_parse_ports() function currently iterates over all available
>> child nodes of the PCIe controller's device tree node. This can lead to
>> attempts to parse unrelated nodes like OPP nodes, resulting in unnecessary
>> errors or misconfiguration.
>>
> 
> What errors? Errors you are seeing on your setup or you envision?
we see driver is searching for reset in OPP node as it is not able to
find it is falling to legacy way. where there is no phy nodes defined in
the controller node probe is failling. I will add this in commit text.
> 
>> Restrict the parsing logic to only consider child nodes named "pcie" or
>> "pci", which are the expected node names for PCIe ports.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Since this is a fix, 'Fixes' tag is needed.
> 
ack.
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..5dbdb69fbdd1b9b78a3ebba3cd50d78168f2d595 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1740,6 +1740,8 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
>>   	int ret = -ENOENT;
>>   
>>   	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
>> +		if (!(of_node_name_eq(of_port, "pcie") || of_node_name_eq(of_port, "pci")))
> 
> May I know which platform has 'pci' as the node name for the bridge node? AFAIK,
> all platforms defining bridge nodes have 'pcie' as the node name.
>
I see most of the qcom platforms are using pci only. for reference i see
it  in sm8650[1] & sm8550.

[1] 
https://elixir.bootlin.com/linux/v6.16.3/source/arch/arm64/boot/dts/qcom/sm8650.dtsi#L3699

- Krishna Chaitanya.
> - Mani
> 

