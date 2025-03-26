Return-Path: <linux-arm-msm+bounces-52553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9AA71DC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9561888C9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543A22405E0;
	Wed, 26 Mar 2025 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMaLDRUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6304223E332
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743011772; cv=none; b=qQMAWFSng8RrWWi2uFdIsy7H72NOnyRoBzTH7CUZJCIskvHU7ylfNEdfV12294ViL78yV8kThwilx3UvYgXjnKfo/iSrPoDwXdBMWBQf3bZsAq4Ut1hQu7k8rUtrHYq3vHygfPDDfwjqvtFxBrJEqiRzqhNay5fUpWExwgPcCAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743011772; c=relaxed/simple;
	bh=FOIE47d2wp0LC0VDLsB3snc29xU6ss8U478EjWgM9Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmsk0giVvGQPoWjvl5Jvst/6UvBAT9Z7E82Mnkvi/G1YG1ysw8QXuEhC6bj6Nf9U9ZKe6HsY30UbKEe38UH5ZOH3HLraKGjYQ59SUrmAPz6BEd8VJAF0Qm7gpHZKZNo01EJZOul+2YYR+ie+CdtOkCerFkJ89IjlEkI733y7kRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMaLDRUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFIlFM006139
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lxqno0230pcqB0H6Ol9XwwTC6E/yX89Z1LsI9uh3Cpc=; b=MMaLDRUCBI435iSA
	aGUj+zJEParOZXAr3hFQYuqXY29BDofFSZbsPunJ1/4bkUMNbmhKkFa/AT/QTHJU
	deOdmcufix7pePxdTkCP9L9hLSl8RP+J7YPks6WkzgGRG08tYpqYe2iRaHMG3iLM
	UhxVjWce6vrYHPBzRWJ7ddEYccu7YTjnMqDfwatbP75/o+auzdxDaGDY+xTrzwQ9
	+f+C+gObVekxoXb1ibmLI0xUtBzi2PXnPEgCZTKcplNaaIi6B20xMeP9CQhgigPN
	QJK3QrjfrDXR2cBcTWHIyXuVdEBLpC8lyaBprzLcBwu+H9tWyKiws/DM1N9KYZng
	UOoLpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj28es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:56:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso3431685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743011767; x=1743616567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lxqno0230pcqB0H6Ol9XwwTC6E/yX89Z1LsI9uh3Cpc=;
        b=VOyTue89054DCqq9+sfCOZRIBwtU4mDNfB94ujNDFWoCcxZks3tarJzN8Ui7YqW1Bc
         RUE3w48DgYnRE6ywiK8LD+5vSS/nWG5SGf7ByxuQHcB7HNB0eyp+HTT5P+jr6bTt75Uv
         9uNR3dpp/ZG5XocsYWdmturRbGyqtkx17OL/KpQuoricS41IpgiBFDMTyu/ya4eso4AD
         f9cKgWN3w2qyvxG4tLaqQ03Bba+HzU6XyRtuRYgMLvABRJyhUkWInURNLTnGw/7OusQw
         S/euQsX3NRh+R4dD9cM3nZAUuSKf38q6sEwUx04Aq71jVgJbvKqPqDJl/snLekzuWTQo
         jnyQ==
X-Gm-Message-State: AOJu0YxS3VZKUGjw/J8ckhQTBjfeT6eZhnSpiuSuH13yUMPb6AXElhaz
	buD6sD4JujPcz78U7idHn9jSqexpYtQfknxeKvi4MJVkaeni5FVdZ1OKYJ8nFZUx9XpA3cAr5NE
	mtUlHueUDjA054xpdesIEKrzgnIZSxbZQVczyJ8dEN/dc+GFu4FjetRLvEtTmSGfs
X-Gm-Gg: ASbGnctprXP1Vente1TLJ2whCWIV2uU7bCBhweT04orXEsRcUDUcE5UmUr7DG0jNGsS
	ISW0EBL3XSREan9W0KMKnMiPA6xQHsjBb5mN4GuYh890EQ/jbqsyp2ZW5wiLQlyRdSHEIL/sVGF
	gDbD22zL5RXjWw+WHzUqox1IwvaQLmHyrimLR7ykWPaXBNJhNG554H8O3wM6OUPBzwRFcSL0Ci1
	ytyOWxjReAHBhr6d7Qd+OXbyWR1OUU9XWSjnK7bKjb/+8diEbi0BfU2zcfx9a8Be69VxR04Q6+i
	YU+sBEpGa95xoigaJ16obsTEQUjV0CYF82cT04rHGfDPIYOni0tjMDTxyq3BtzXZdiaYpg==
X-Received: by 2002:a05:620a:4588:b0:7c3:d752:f256 with SMTP id af79cd13be357-7c5eda1ef32mr33501685a.7.1743011767161;
        Wed, 26 Mar 2025 10:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPo1a1tkN/XZXeNGAAUJcp1b82A8YyOkx8pDC2Hf99u7C+rn8fvVrRAP5A3JMYBukqijRm1A==
X-Received: by 2002:a05:620a:4588:b0:7c3:d752:f256 with SMTP id af79cd13be357-7c5eda1ef32mr33498785a.7.1743011766592;
        Wed, 26 Mar 2025 10:56:06 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef93e5cfsm1073652266b.82.2025.03.26.10.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 10:56:05 -0700 (PDT)
Message-ID: <0cc247a4-d857-4fb1-8f87-0d52d641eced@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 18:56:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-1-8eff4b59790d@oss.qualcomm.com>
 <3332fe69-dddb-439d-884f-2b97845c14e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3332fe69-dddb-439d-884f-2b97845c14e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PpCGu-O78VVnzETVEF5Ld7NBeF_y4fod
X-Proofpoint-ORIG-GUID: PpCGu-O78VVnzETVEF5Ld7NBeF_y4fod
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e43fb8 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=hNMOycGrYB8S6Zk86AkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=849
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260110

On 3/11/25 12:13 PM, Konrad Dybcio wrote:
> On 3/9/25 6:45 AM, Krishna Chaitanya Chundru wrote:
>> PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
>> maximum of 256MB configuration space.
>>
>> To enable this feature increase configuration space size to 256MB. If
>> the config space is increased, the BAR space needs to be truncated as
>> it resides in the same location. To avoid the bar space truncation move
>> config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
>> iregion entirely for BAR region.
>>
>> This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
>> of DBI and iATU register space in BAR region")'
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I took a second look - why are dbi and config regions overlapping?

I would imagine the latter to be at a certain offset

Konrad

