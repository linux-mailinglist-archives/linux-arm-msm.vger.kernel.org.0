Return-Path: <linux-arm-msm+bounces-55027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2728EA97D30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 05:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FB143BFDF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 03:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DC2264624;
	Wed, 23 Apr 2025 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McQeihew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D245948
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 03:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745377868; cv=none; b=GVkIPENLz8U1u2MGSPEUI+vwi4u3WyTPILXrqKtfjd0Updkq0/yGTE9SsphycRhod9/wAskq3taxaudgfYqk3HRaE//daJnAcw8f4IDdblBVI0/9qkgZ5taVkqZipXuuhcOuc1RyP3yKwvVOnWJFTbgyN7szXl77ZoPl6XBUesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745377868; c=relaxed/simple;
	bh=gNDyOiqvvJnSJH9LoREom7MMlXsJ1YgY/lC4EhEpN/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXUZ8S1lFGPu7ZiCywg69qiVfTe+WLC/B+b92CQ/61YSC3WUseiihQt4eQYeXCsxUEJHWNfMhaCiVl9ewikN9jSIuyc4HwBgpIP/tt+6vBhlmhpyYEWoxlG71APVZhLm3+PXLHIs1grUSAiGwA/XW5ih42bkXm5qxP7Mwva7JsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McQeihew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAcL016178
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 03:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUzM1IQQBSoW4Yzoz+0un0e1UZB9NVH9M6aYGCfVdkg=; b=McQeihewsgL9ZGYk
	hvNAa1i78p6iRXk7f/FwnMreYxzUpj2qVSssrdqA1h7coGU1vlzvd8D6F7fIqDM7
	ex9WWgUPu0swBXETxRZk8fk5Q6NFopc8beq7y+OuJ7NWj269NrhcGAMa46iVGz6z
	c0NGDdV/uFtmAeHvIV9TnIhYYgfuYIVPN8Veu4b2YVumjfwRWS8R4x0tfB++U4fb
	3T3Vx/eTaZPVahcSAfm9qcWgPpxX7FXc15dNKGQCVX8W0vBhtFccBh3y1znBfoWt
	fxz2g+Qc/gzWWVhPUe+6JJf819aLdBiGQW7Z09pU/zGfvkMPtF4C5kQG1X0soIoE
	752Q4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gp5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 03:11:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff68033070so5139800a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 20:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745377864; x=1745982664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUzM1IQQBSoW4Yzoz+0un0e1UZB9NVH9M6aYGCfVdkg=;
        b=HIe2KQadqtu8QXwTMZ5TtjuhS/1iZMK8yjLq8jVJre+9FQ5K3DpA8gRcdPV9ME/O8I
         E0nuF0YjVnsszScDBMWs6BMEAgRSbjCTFzuuf+p/cq7xfb2AdTi0tCw7vqjj+6B890tK
         wegKcVYosz2je/fnIWN7quhbspSMGH5YqCat0NOHMwyNOg9Tgd2ntK9hQBTFT1RNOEq5
         YQfrmEIaLeASGmH+oNODnAqehU7BhHpToKGYt4bPYRlamnMouEMycXfVSxT9CkDnHuew
         n5Qda3g68aMwUL4tLY+Pl0G0y1ZPvsmx0N/CLrIOxCws6cEW8tMeOKx1yLnmENtrXbmr
         U8Fg==
X-Gm-Message-State: AOJu0YweqUStehFzKhpVfUCSr44NpugEY0NsydnnulJfuHxny+Ve9tlM
	L7sKF8yxBuL05KHy3aRR+RTP4qFOFMJd4VYRo/ngjk1u4ze7vOVwco3z5vKSdah7vk1KVqUKn90
	7Flh6Y0Yx3kqlLhcp0Ipzsc/NVF/bOXE4OcA2EetvdnKHuVrKW4uKmieBH3Zc9A72
X-Gm-Gg: ASbGncv7IYER/3VEBRJC7i0VoSbniDZpPN6VXa8W669tyugBOHeiz7nbJOvZ/b6To1u
	SoNNXusL1vSSzR6xlokJRXVcQOdOr0nCZIrM9wL/aHO2Ls6dIYnZLbc5fchJYJHL8LqZ4ZBZDGh
	GM8HEKJV4MSos9iri08nrEaBErCxC5Yy0TUG2SUpkTUQ/nesUuhbCyY2mJhinlCbUZM/dsyo/oA
	tbl++yw4f4PuZtqi1QUmd21JmDe8y85eIvXnu1oVuuirUAkkiNkmyUwidZBARekDFS/mNzxoXz1
	qmRw/uAf/frA8dO2PVjLXqvdLjnEZ9Ln5ag/SbxM+A==
X-Received: by 2002:a17:90b:280b:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-3087bb48e31mr33085516a91.12.1745377863731;
        Tue, 22 Apr 2025 20:11:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqND8/PeqFUb5GQNFXy8yeKg5wopuUfA3/3IcqnNMYrM8oX9zPImajp1J92zZXyURB0FbG8w==
X-Received: by 2002:a17:90b:280b:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-3087bb48e31mr33085475a91.12.1745377863263;
        Tue, 22 Apr 2025 20:11:03 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb448esm93082285ad.152.2025.04.22.20.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 20:11:02 -0700 (PDT)
Message-ID: <347a7348-664f-3636-604e-8dc6429691b9@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 08:40:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/3] PCI: qcom: Add support for multi-root port
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-2-1afec3c4ea62@oss.qualcomm.com>
 <9be69535-08dd-4d60-b007-e9c50e706a58@oss.qualcomm.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <9be69535-08dd-4d60-b007-e9c50e706a58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6edcnobgqbntArzQ8RFOIQ9jHZg3lt4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxOSBTYWx0ZWRfX5X3ntSaCX1Vi 192KORtDZkQFPD/qJtBKAli4CEaUY1gIGXA2Hk1doXP3lXiIF+Ay+FmbMWUGTOtvN2k3ZnloGSk MwzIi22exlFQ5IP6B3dge36jVm3uyud2JcGuwrQ/Scl8kqB+iueO5AyRD4Ae2XF7cHm3SWAz2RS
 ivKKevIDKuECaCUSrWF+h0XgqCvVABQREra2PiZKa67VJ831DmcP6hkLoJntl/GmEUOO2ZXtlAH 1061O8ZUAwjeNKUYwURTGGmg4pAvNZiU7G/UPDas7e/5MWoO/i+nUiGz133V/lvmtQmD9BRp3Je t98C0VyOgITzqb3iu9cdi0UDB1hf0C2ukiDzAm3SZf/k3EVwNu92M4T4f5q0e4Dlsa6ROk0m2SJ
 KjVv8q8WwjU9IVxb9ds0k2xXFe9NdWC3R5O8dkNTajloFMJ6GjAGsff+E9xhMWTfG6p0Dbxe
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68085a49 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=1RYYy9rr-L5vwPXD2fUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6edcnobgqbntArzQ8RFOIQ9jHZg3lt4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230019



On 4/23/2025 2:15 AM, Konrad Dybcio wrote:
> On 4/19/25 7:19 AM, Krishna Chaitanya Chundru wrote:
>> Move phy, perst handling to root port and provide a way to have multi-port
>> logic.
>>
>> Currently, qcom controllers only support single port, and all properties
>> are present in the controller node itself. This is incorrect, as
>> properties like phy, perst, wake, etc. can vary per port and should be
>> present in the root port node.
>>
>> To maintain DT backwards compatibility, fallback to the legacy method of
>> parsing the controller node if the port parsing fails.
>>
>> pci-bus-common.yaml uses reset-gpios property for representing PERST, use
>> same property instead of perst-gpios.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>> +static void qcom_perst_assert_deassert(struct qcom_pcie *pcie, bool assert)
>>   {
>> -	gpiod_set_value_cansleep(pcie->reset, 1);
>> +	struct qcom_pcie_port *port, *tmp;
>> +	int val = assert ? 1 : 0;
> 
> assert is already a boolean - are some checkers complaining?
Ack, I will remove this in next patch.
> 
> [...]
> 
>> +	/*
>> +	 * In the case of failure in parsing the port nodes, fallback to the
>> +	 * legacy method of parsing the controller node. This is to maintain DT
>> +	 * backwards compatibility.
> 
> It'd be simpler to call qcom_pcie_parse_port on the PCIe controller's
> OF node, removing the need for the if-else-s throughout the patch
> 
There is difference in perst property name for controller's OF node and
the root port OF node. controller use perst-gpios, where as the root
port node uses the pci-bus-common.yaml defined way of perst i.e
reset-gpios.

It's better to have this way then having if else condition in the
qcom_pcie_parse_port.

- Krishna Chaitanya.
> Konrad
> 
> 

