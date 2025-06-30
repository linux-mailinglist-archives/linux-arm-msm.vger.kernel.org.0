Return-Path: <linux-arm-msm+bounces-63064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ECAAEDCC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 14:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11F3F16D68B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22001242D78;
	Mon, 30 Jun 2025 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNrukPs/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A801DFCB
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286624; cv=none; b=jQaCqHtCYfrNm1K2S17wGZdzUr4+HNunnMpvdQqerMRCcPOmVXuNpS7UiDlGJM4V+MQw30qLiF1eMaVKpHGgRRCh5gv8Be7jXWMgxrc9rWWvyZ6VNo0yc/820RSmgGEf/lQYKmHM2u7/RNRaGt9i+Br17/RvnnII1OTYSEPac8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286624; c=relaxed/simple;
	bh=3f1Py/orZHfiSTe0C6MP8gxhoceXINqIBaCHjb7/zSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byrk9T1KBisn8AuhSVp5wvhafn9jymVYk7CDtXj6gEHA0KFdKbdmWjlSMmUdfrKvJm67yreZGwRZgfNo+hqsCs44MVnAlaitjmDMErGCLj5dQo5l13b20ZacROUbEKNq7YyAiPvXLfmp718lZkPUPRz3imE2KjNDiTbZ7aqxuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNrukPs/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DCGJ032128
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dWxWYq2K7GOUCuWuG1yENQqxzaE0+54jEHV+QMm2Os=; b=BNrukPs/nNJ0qaHS
	LWTu6LjgvbZFBSLNC+oAhIPnl4Us9Elul9jdAnKMZFFftOO8B1obXtZVxfvO7MWt
	shjEpSEADQTPkOSUhhPFsDln/dstCoJv+fn/SCyOWkk+mqZRZPfUxaduo6El6Onp
	PujuZ5mZtOb3wgl6JOnwoMg3F20KBzIzIvOKEU31qhTzUpXpkuXnn0mo+JSk3uo2
	+optlSS+dEXRhNKnoLnzfmU/XAMOkGRgk4JKMcyIbBRMPUzxegd7TNDi0wRzIbWM
	Cu73+s1G02hJSxfvTxdoaPFITrFBdp3D2lN8HLg+N/zSQ2yfYWbQIlJ8EQMwnv1Z
	LouDFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k4w2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:30:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748764d84feso3838293b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 05:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286621; x=1751891421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dWxWYq2K7GOUCuWuG1yENQqxzaE0+54jEHV+QMm2Os=;
        b=HMot3cbvnxznRRL9Zz4HozRvaJOXtavbFJ97xVu+Oz0sdgLx8XDccHZtUNV9NBegEh
         zt0A0Mz1d/PeXjbP1nnupMU9k3zInwFE2fjmgSyID9a8xDfrOX+U0D9HmnkyIIyprUwY
         FbGBryynnLEpGt2nyTzuX+Tcrr8xqnYH5PcWVxcYt+g6FfNe9B3b4L81iLeo70pte7jx
         VExzpM6KFsGvrj452aEm6uiHfbvchYSoz6RAD+IDq0EZHnysY2LQlderK2mp76kDo6UE
         PBtkCAIaukLh7pId1aGp8GwDnU1rQaMOIPNZ8nlfRgXodTwU+9yfp1xSBKO1L4iwxeDX
         jwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzuJ4UKgQ3+yjp631wUt6uqio9AsUIiPjhvGiCV/ZfhA7TyWrq7ti15LM9K8nxjBpaGklmqLLsSr/TyDKB@vger.kernel.org
X-Gm-Message-State: AOJu0YxaseH+TPBH6tSpMwXeVPqe08jVYCUJ/6ldeSovPoxM7x2HceXo
	ouhYy0a7QJVXsK9LPiyuqFfypK8S6zvpb4I5B6FX79GKhnznPpZPbbYpRFYJo7gwNvcqVMBi/D5
	4UdG1eYF+0kchuMOhYZIxI4UJIGW6A0oHaWI/nWYFXbxIOtpFwRyJxMf1Q0ZPH4mZcgPU
X-Gm-Gg: ASbGncsYAUSXwJhxqHDcXJDmfETdk3ybfK2GknDzc69pZA8LoRWUl32Gr3sGGPZRp0L
	ScGGoaTpbuPRWybXC8VYmgrtjVgkOr79CuJNMJg/9qfTXEJ3GiF6iqf4slzMPKtzbPmNXfpOyD2
	ervimoeO3dpFUs0B7drtm3bLkMxMJoulX/44h3VxTDu8NbJVnLKKvMp0rYVSg+PMQp2ftpPscf3
	xEjKD0IyIHSxJmFttUmmaxcEV3kQc9dN1BM5oxxDh4oTeY5t/MnJuFL0jK+v8NuuJz+11ktvhtO
	nfBCf4RV46L2ACnjlHHAVo/8e7VnOiw+jBvG5rTXCHiM8BJPwe8p
X-Received: by 2002:a05:6a00:1988:b0:748:f365:bedd with SMTP id d2e1a72fcca58-74af6f4d4bcmr17197277b3a.17.1751286620551;
        Mon, 30 Jun 2025 05:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkaFNPxqWvP2slDuEpYtj3r5EnhD15Tr2DIQp6ChiI+aHrargB99nmYkj5G7fm4yQY9LxhLg==
X-Received: by 2002:a05:6a00:1988:b0:748:f365:bedd with SMTP id d2e1a72fcca58-74af6f4d4bcmr17197201b3a.17.1751286619834;
        Mon, 30 Jun 2025 05:30:19 -0700 (PDT)
Received: from [10.92.200.128] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c6a3asm8487704b3a.118.2025.06.30.05.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:30:19 -0700 (PDT)
Message-ID: <4bae822e-e7bd-461f-99cc-866771c0b954@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 18:00:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] PCI: qcom: Move PERST# GPIO & phy retrieval from
 controller to PCIe bridge node
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250605-perst-v4-0-efe8a0905c27@oss.qualcomm.com>
 <y3umoz5yuofaoloseapugjbebcgkefanqzggdjd5svq5dkchnb@rkbjfpiiveng>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <y3umoz5yuofaoloseapugjbebcgkefanqzggdjd5svq5dkchnb@rkbjfpiiveng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6862835d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qGq9QQooCmLM_m6diiQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwMiBTYWx0ZWRfXxlBilKeL1HCk
 oUX8AvgGjwAyGgyPrXm8SeFx+v8dp2eAY9DrW4dY3HmvFAbt5JC02kkOLMgOKBAd25vsZsrxU6Q
 mFuoXXK0R551W5Yadpl65y26MN8Fakr3NDtGKyKx8jUvtoPYlJUW08E3REVPcp6reWMhMopkgir
 Z9OlWnULPs9wOtdJcM8lXto9OfDzjW1H8VH5JiEzHhMG1jwQV7RVk9e0f7A36tsEsbJ0VPB0Ocn
 dExs/wmS4frf2mw/OZ0KoIAiODwGIO7v9KazlT0AlqxRoW23w0Pj7iUT6bFA99SfnkJQOy9oCC+
 SQ4uhnYhCybkrZjwS/pjOzHWGbvxagB16ifVzjNu37r6ZdRcBjRZh7ZB+drHuvJjoBcYNQhQEBf
 ULFv34Z63lv9f3Iigeie3OnovEA8gUYSEnlgW2wZQdbjqpBM3SqG30Lgq9GH97OpeAFmkgGm
X-Proofpoint-ORIG-GUID: a3aM3YHiVisX2cEeGe0-4tzwEV4uh60c
X-Proofpoint-GUID: a3aM3YHiVisX2cEeGe0-4tzwEV4uh60c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300102



On 6/23/2025 4:37 PM, Manivannan Sadhasivam wrote:
> On Thu, Jun 05, 2025 at 02:00:36PM +0530, Krishna Chaitanya Chundru wrote:
>> The main intention of this series is to move wake# to the root port node.
>> After this series we will come up with a patch which registers for wake IRQ
>> from the pcieport driver. The wake IRQ is needed for the endpoint to wakeup
>> the host from D3cold. The driver change for wake IRQ is posted here[1].
>>
>> There are many places we agreed to move the wake and perst gpio's
>> and phy etc to the pcie root port node instead of bridge node[2] as the
>> these properties are root port specific and does not belongs to
>> bridge node.
>>
>> So move the phy, phy-names, wake-gpio's in the root port.
>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>> start using that property instead of perst-gpio.
>>
>> For backward compatibility, don't remove any existing properties in the
>> bridge node.
>>
>> There are some other properties like num-lanes, max-link-speed which
>> needs to be moved to the root port nodes, but in this series we are
>> excluding them for now as this requires more changes in dwc layer and
>> can complicate the things.
>>
>> Once this series gets merged all other platforms also will be updated
>> to use this new way.
>>
>> Note:- The driver change needs to be merged first before dts changes.
>> Krzysztof Wilczyński or Mani can you provide the immutable branch with
>> these PCIe changes.
>>
> 
> You've dropped the DTS changes in this revision. So the above comment is stale.
> 
>> [1] https://lore.kernel.org/all/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com/
>> [2] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
>>
> 
> I don't have a device to test this series right now. So could you please test
> this series with the legacy binding and make sure it is not breaking?
> 
> Once you confirm, I'll merge this series.
> 
I have verified with legacy binding with this change and it is working fine.

- Krishna Chaitanya.
> - Mani
> 
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Changes in v4:
>> - Removed dts patch as Mani suggested to merge driver and dt-binding
>>    patch in this release and have dts changes in the next release.
>> - Remove wake property from as this will be addressed in
>>    pci-bus-common.yaml (Mani)
>> - Did couple of nits in the comments, function names code etc (Mani).
>> - Link to v3: https://lore.kernel.org/r/20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com
>>
>> Changes in v3:
>> - Make old properties as deprecated, update commit message (Dmitry)
>> - Add helper functions wherever both multiport and legacy methods are used. (Mani)
>> - Link to v2: https://lore.kernel.org/r/20250414-perst-v2-0-89247746d755@oss.qualcomm.com
>>
>> Changes in v2:
>> - Remove phy-names property and change the driver, dtsi accordingly (Rob)
>> - Link to v1: https://lore.kernel.org/r/20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com
>>
>> ---
>> Krishna Chaitanya Chundru (2):
>>        dt-bindings: PCI: qcom: Move phy & reset gpio's to root port
>>        PCI: qcom: Add support for multi-root port
>>
>>   .../devicetree/bindings/pci/qcom,pcie-common.yaml  |  32 +++-
>>   .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  |  16 +-
>>   drivers/pci/controller/dwc/pcie-qcom.c             | 177 +++++++++++++++++----
>>   3 files changed, 192 insertions(+), 33 deletions(-)
>> ---
>> base-commit: ec7714e4947909190ffb3041a03311a975350fe0
>> change-id: 20250101-perst-cb885b5a6129
>>
>> Best regards,
>> -- 
>> krishnachaitanya-linux <krishna.chundru@oss.qualcomm.com>
>>
> 

