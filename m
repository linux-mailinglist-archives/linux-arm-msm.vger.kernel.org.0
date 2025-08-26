Return-Path: <linux-arm-msm+bounces-70848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73861B357F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87A537B2C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C38F2FE58A;
	Tue, 26 Aug 2025 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d236II26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E263129ACDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756199035; cv=none; b=Mc8+BXYqZP3xybYfyMb6pYLpWzZcCNgZtpn8/IfKfThZFz0X8EVyPUdYoSlp1K5qs6aRI5bJAmdpK2794In9jbSld84A6EN8iqgvHeghhNMubNt4q2Bnunk1oqCQLGTulobLgx/ONioJj8FIIrgO0ZfoAsncvEHjVB9wSR3s4/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756199035; c=relaxed/simple;
	bh=S7XfYWroMcqJr4J70jULvhjMOnxLbpFyYuwkU1J6IKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9H/g9Ikh9xZbhVHETrcCEoMVwVsJDANt/iMsLeJwmmc8mfh4JV737ewmh3RByMejTcc0na0a2K98aV1yihdtc+gNFNM95tXtu8Bp6UJRhimug46LXAw3hfcreinp/Fjs90zi6X8C6OmnFQSUWwZ6eIPjVKUuu0UfKKk3xdg/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d236II26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8v8VR003232
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kvnIpYaIhAPbwlvi0dXbhefeFgbqaAlt1t2ncj8BLw=; b=d236II26bVcjXaPc
	JiW3QkPR1qy8gmwZssbR4IQsrKGBqufL3K6hWg9ecioUqjvgHLld/0M5Il1i88kJ
	TQ6c1OQa+tXjgt2XNnj/9bD+PnM7p40m6O6xYhiiTyxkEuKDTeq3JrLDyW5iDcvA
	MjfQUVCP3cpJwzy52HAsLeZ3o4gFg5EMrLCzaj4foQu/jO9dmu6AQ/F0l0pDhsIa
	ti3jz5WjrKPXqfI8Lo1RAmwJ5M2IOVu28GtS3bBWsvCQ1EfU7079ksl/2fbPUPzf
	sRyVrEhK0DU+GY3lmWo7JdE8dWHld5OAPPMsKjAUfUPruAw7s/rtqL5zd12bVzY1
	lqcjMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we00hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:03:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-325e31cecd8so1523603a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199031; x=1756803831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kvnIpYaIhAPbwlvi0dXbhefeFgbqaAlt1t2ncj8BLw=;
        b=PEEk2ShuZkRjH4VUFvjPt71L/c5VTdDzrY1pF+OLBlIrfq9A4+8pYL8+mcJ5CdIbtw
         UKh8PnNd5V1dJsftCnIo611RtpAHN5/MRke1NEfob+X+xgYxgftcQWBNjxiNm9yafOuq
         XevtmK0xjko6SHUowuu+3iSS2Zxz3yEn/DNuwj2TZ1QI9KHGTRhUf3Rv2d6J2ILKDKRB
         X+Z+0EKxyqKeSR2F2IZfpmQh8K7tPXApfjGay2nMESI3/nSMmtU0w2Xo0U1SMA1reAv9
         4px7wXh7spG7hjBUKm9nb53hfqr2/7KgtcTGXopcWConf1hJgIGI973K7+CbJCovu4pi
         epnA==
X-Gm-Message-State: AOJu0YxirCwMVAL6l0uKKQSql6WwMrdmv4Zs/I13ad8Kp5ezwrhzKPRc
	8SELaEwTkU8RqZHxVH/3TL1LDgNS8jV6r4h0CfVnK/Ys98Z5XpSzHGiz+FCv/OsjgBhpsftsgDz
	a3r92KGQPchMlA4v/H0ecMMViELirSajZ5vSGRGutOKo1woodI0vguk3Z56t+cK7fO7Ms
X-Gm-Gg: ASbGncs/GA+eDXY4GUArOH29uEwV4paJ1a/t0B+L3YeZy4Mwq5lv11oqsc7ZtlxqNXG
	+jNUeXAAhE4nm23TUhRVLgogZ+11m9Hbv8ZoRmTQN9I3Py3omp7fhAzxbTrfizOUJG5V2VJiO8V
	VVW8JW0V2RFp9pmBR6gEyffW0t73YfHmmmIiw9BkeAQXLVh86+LmglgJZhaqM5X5xWpcPrOkb9j
	8ynxPm3FxSkDiY2pASPoxQCFBE7/ymS2NioA0GSl33pBVRlu+ie+Y0ypF0BIDa5C5PvmAk41fXB
	+McOf7MlseyKVxfdLGCyanxZ/msfi1hkysLMxbHIwMDsaE7g1i9mYZKCXfcNVAG91tPIkUj6
X-Received: by 2002:a17:90b:37d0:b0:325:6d98:dfc with SMTP id 98e67ed59e1d1-3256d98121dmr11898082a91.14.1756199031260;
        Tue, 26 Aug 2025 02:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa938tockH71GPIpyoO592wnzyXoNF3Ptho2VIjZN7GrxlXvdRpZ4Fvj3uY5yE/wnOsjtSbg==
X-Received: by 2002:a17:90b:37d0:b0:325:6d98:dfc with SMTP id 98e67ed59e1d1-3256d98121dmr11898041a91.14.1756199030665;
        Tue, 26 Aug 2025 02:03:50 -0700 (PDT)
Received: from [10.92.199.10] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f045b687sm2926609b3a.109.2025.08.26.02.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:03:50 -0700 (PDT)
Message-ID: <e2d23d22-de22-47ee-b715-e7b6c36976b1@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:33:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] PCI: qcom: Restrict port parsing only to pci child
 nodes
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250826-pakala-v2-0-74f1f60676c6@oss.qualcomm.com>
 <20250826-pakala-v2-3-74f1f60676c6@oss.qualcomm.com>
 <4583bf66-737d-4029-8f14-ce6d6a75def6@kernel.org>
 <0c732ac6-2d1a-4341-94d4-dc6734bfb959@kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <0c732ac6-2d1a-4341-94d4-dc6734bfb959@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DRkPjJ7byqD1pShd60tpY9KIXhZul0VJ
X-Proofpoint-ORIG-GUID: DRkPjJ7byqD1pShd60tpY9KIXhZul0VJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX25ImPv4rM7nE
 NQgvhKYUbjMmmkNV7ce8ahT7x3GEGG01pl14LDv82XSMcrFdqnRJXjgUl+fHg+kx1rObC02EhWl
 uJG+lGP5Khc04seTJPejuPhcrDd8/0W+HANSADoyNbTthmAZR3ndX8D54Ggk4KnI2Xzp9KjfiJo
 GMwwd5jNF1LazVwryHsB8RKEplh/114YU1YPeU/hk8m75Zzlr4v7JQL5CGxabSpxuLlzJIkLTWy
 RXiXul2gyRGGwaKuPnPUMtP7TcUItR530/+jYUQ6vCPqaAQLUL9sMo1G4HtzrwVkaiEUQGeekjV
 UxXJ3nU4E+C0OTPVEmKy4pdIKhVBy3NgDhUhmXNUqZ6KQVCwp8bIQNYZloexyqyZ12ike+NX1Iy
 j/4nBM+D
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ad7878 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vYAcZcmFI8d52SuQJuAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/26/2025 2:02 PM, Krzysztof Kozlowski wrote:
> On 26/08/2025 10:27, Krzysztof Kozlowski wrote:
>> On 26/08/2025 07:18, Krishna Chaitanya Chundru wrote:
>>> The qcom_pcie_parse_ports() function currently iterates over all available
>>> child nodes of the PCIe controller's device tree node. This can lead to
>>> attempts to parse unrelated nodes like OPP nodes, resulting in unnecessary
>>> errors or misconfiguration.
>>>
>>> Restrict the parsing logic to only consider child nodes named "pcie" or
>>> "pci", which are the expected node names for PCIe ports.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>>>   drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>> index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..5dbdb69fbdd1b9b78a3ebba3cd50d78168f2d595 100644
>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>> @@ -1740,6 +1740,8 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
>>>   	int ret = -ENOENT;
>>>   
>>>   	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
>>> +		if (!(of_node_name_eq(of_port, "pcie") || of_node_name_eq(of_port, "pci")))
>>
>>
>> Huh? Where is this ABI documented?
> 
> I see it actually might be documented, but you did not mention it at
> all. I doubt you even checked.
> 
> Please reference exactly where is the ABI, so reviewing will be easier.
> 
> I still think though that it is wrong - we don't want device node names
> to be the ABI if we already have compatibles and the children here
> should have them, right?
I intended to check for device_type to be pci, my mistake I went with
the node name, I will update the patch with this logic

if (!of_node_is_type(np, "pci"))
	continue

Thanks for reviewing it.

- Krishna Chaitanya.

> Best regards,
> Krzysztof

