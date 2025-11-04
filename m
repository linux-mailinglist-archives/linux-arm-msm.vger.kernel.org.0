Return-Path: <linux-arm-msm+bounces-80268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B17C302EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 10:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8F014F7137
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 09:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E412C0F66;
	Tue,  4 Nov 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BveNSdo3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAIfoEvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF992BE7BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247092; cv=none; b=Z7RDzglZXpecp5U8w/5ba9w8bmyHmQ6pUl5nfIkwp1UXTc+iPk7CvEC0iFyXUSj0+iFwuT/ijDA9tV4eK3ikbhXtbBVA75le2r7ReNQ8bqnQBEDa7ZGkIWXmrKOmCmGkVfBYY2me7BTzp9YBotyTrnWHoObi+4vVnj1nuga8qpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247092; c=relaxed/simple;
	bh=M5h8wGHqottmVbN7MO9Ckr4DSLpliKv6IRVS1pyJv1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8iE6dgaAcR3aHk2JXSUJT4AXWMmJ0WAP2rLg7pAYs8JgI3rdb8kOF1xlVuQUoTiGfrnxvdAnnNUhFvRvFaKzoJ9dwx/Ewd8MnRJyZLmkinm/B8vRu2UJbxBf1bi2liI+Non8nA1ktYuYgdbxQB3qbG5EAJ7NKPwdRWaz5HBmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BveNSdo3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAIfoEvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48gX7Y1527977
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9xPLj5OuQTlTyOHnok3W+6HBQLXo5qtNB6Mr1AveDg=; b=BveNSdo3vKcraLbv
	D5W/FrYHC++1d4Y1SenP5D7o/PMLDT7tlrPdHWqQaSbNJKEfUr6vdPweRKI2Ln5D
	feF0F3+ZdO7xoQM1ebGGoLXXOIpM+b9QEC3z27dHYFc3F4iv4cYCrpFIFfhkL2Ml
	rgJEA7PCe+W2qn5OwTdGbpfhSIVMhz1fXHdX21hXwopAnWoOpaISY700LwkZH4NH
	UVKilc361QCE3VHGFiTKQPfYZPv8roEDbFwGr2lf/oTzux2CrD0CHNhReiwjF12a
	VT0ogiiikNgileUuE6quZk7oH7aof+HCHnP0syjmvyvCbOERdlXqA80OcPnMQb+X
	UDTuYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70kcac6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 09:04:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33dadf7c5c0so6718422a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 01:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762247087; x=1762851887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9xPLj5OuQTlTyOHnok3W+6HBQLXo5qtNB6Mr1AveDg=;
        b=bAIfoEvz2QZnz1VjprnRMRvrqkuKbxGhz/fz9ii76Q4nZPijKTo1cnZ2Z9rTX+0RJu
         JPCc3KBzJH2PaYBp/UzZOvmyc0qb2tC7Hu22RFOl0TZjcKkYcSIYZdK5iygUk8Z3KGlV
         xTYTqLd7DvVDp4jKLzFPfI25x3TQYJd7WzGvTrvgm46PIDvBmXPvoAx/pC6pLWZbGnBb
         E20OSGeBULWkWsshz57iKRGXwFBwsqqoX33Y2gdmU4BY6fgIMMr7q7kLI0BjIVQKJ0QB
         x+YYirLElXJ2Dy3V9RmMmQd1vCrkD6c+TyjY2tYYvO4MAloxieqr9iBVOjKN7XeSaR9v
         ocZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247087; x=1762851887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9xPLj5OuQTlTyOHnok3W+6HBQLXo5qtNB6Mr1AveDg=;
        b=ohYUWanyDjmFeBO/l7iA2i8RTCOUTXKODBQWfmv2bXcWVmD4eOmnCEydNmes9vSaXW
         EnYyQCtBZkOGlU9dHaY0QYoJjm8Q8T2FH1sPHlnrEgs7/4qOBrJJD+LdhGSg1WyVmB7W
         5sbEMS4LI8WD9idg2sBYpVfg0iHUIP04bV0+TLwn9TXWQaI+P3DBW4BxZeVqoAV/Ed9W
         Dccjc8RQZXi4HDGUzn9kyGdPQX0LxGsTXtXZWMUAx44GtLyH2hODPSCIUtV0Ga/wIZGy
         lfcysBoYQxkLHsGYNdDQJQOI07QXWaBOvaWf7cKowW65V/KjJ9kYzfF/b36GuDZogYX6
         NBnw==
X-Gm-Message-State: AOJu0YwFpOr6u1+n2tl0N0aQyakCcI0UKBNsAWSndcU/R6AyjNXA84C5
	U8yjh6j1wYspj4Nzcy7va0kw4bLcVUr7ZEi9OG2ah16qSpJ2evOo/u+fkWAewplB26LIjrI0Q2c
	nfQYOEt6rmDg6t/HkRm5/dtOAkBckqHBgDqepZVIiz15Yq2leqfTD+utAxdWPdigqQv3p
X-Gm-Gg: ASbGnctOSygFXd3C7GXYifQeW1yYs8xZbHo5+QX5MIVj7Aw0BsyBa1WQ+aQpyQNrAqU
	dd2u9uEShyVgfRjwpw89hAYwK6RgGX3q7PI8NL9Lu6MAnaM9j2f8kFVufEpiqxbTyUNQ2jVDGDz
	FORMWYEkQBEhIZR8Mt5aB3sZHBbZTJ2Q+QggAOJ4LYt5I0+JD/FSvPkowd+3zOVW+VXJN7r3/4u
	8cxQZgITWGIq+HKDuwSW1VWkktv1nNex3w4nxO+zdTyUbQKMdgiwN7x1DULuvIoOdvRrkyqYYSi
	6SEpgmVhb+VdHOb26Wu22o8OpTIKYmzZg5d7if10O4sZvPbSCx49y3BPUOYMQGHdKFuBIC6yFj+
	lA0No4u2R6065tPnfpNxmUAukfihuhLtoe7MKkks4lt6JdVbxTGaJXfWvJRhMOs0PvU1VZA==
X-Received: by 2002:a17:90b:3c49:b0:33b:6bff:35fe with SMTP id 98e67ed59e1d1-341718b2361mr3097137a91.16.1762247087251;
        Tue, 04 Nov 2025 01:04:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJApJqx3lrXFfpDcrgrSMCEpUiaPyHMY1h3YbxI1Rwfo2sneImhYdBZuyhjjp1R6yRMH6THw==
X-Received: by 2002:a17:90b:3c49:b0:33b:6bff:35fe with SMTP id 98e67ed59e1d1-341718b2361mr3097078a91.16.1762247086692;
        Tue, 04 Nov 2025 01:04:46 -0800 (PST)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d1fab3csm897778a91.11.2025.11.04.01.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:04:46 -0800 (PST)
Message-ID: <7fc6ab09-44c9-434c-ab19-764c74b1176b@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 17:04:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
 <36fcea98-06a6-4ca7-a378-77b44b196a9d@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <36fcea98-06a6-4ca7-a378-77b44b196a9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA3NCBTYWx0ZWRfXxwJXrZV/bv/g
 QMs/mL8e6o9Tb67h+TyjCaHT5w5e69j5HND0GjRaYL3AgwnmeYE1QI2MzNR/0U8b1zS5VVGJcH3
 pDKSUraO4WouCZYkIF9W7xQqesl6nH+SamtUX1fPAcbV2WdsE5wuMi/aI8f4kDpRgAT3wFRIAqb
 TRMM+VyX5y1vc7oWVD2DOqDuM7LWbxHQjgyba6xLfTcoCANgQ7dYfeT2jETQqEcEMGXI8jtlLXp
 R9R1BjoiTul6CSdNky0mS47nx24zNFHrS4LqRPtW3b0aq3/kpjYBpCsZuftucrogMnIwVWwt2g1
 ZAe34DfEdnLtjrt0CZcYO26BA72AD09VRtvIzTMNYPg7HGJ9CU7jLGJ7nEUYlbNQ8etuFE5O1CT
 ytJvPmgC+j12C1+o1vfxBhONxTCTLQ==
X-Proofpoint-GUID: cEEQp7hpVeIXm5uGmGhRwtNTxIcodd9D
X-Proofpoint-ORIG-GUID: cEEQp7hpVeIXm5uGmGhRwtNTxIcodd9D
X-Authority-Analysis: v=2.4 cv=TIJIilla c=1 sm=1 tr=0 ts=6909c1b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=x9Fsha1zsCYNIy44pjYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040074



On 10/14/2025 7:46 PM, Akhil P Oommen wrote:
> 
> 
> On 9/25/2025 5:47 AM, Jingyi Wang wrote:
>> Kaanapali is Snapdragon SoC from Qualcomm.
>>
<...>
>> +
>> +    reserved-memory {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
> 
> This is missing a bunch of reserved regions which causes device crash when you stress memory allocation.
> 
> -Akhil.
> 

Hi Akhil,

We will not add all the reserved-memory in dts, other regions are designed to
be added in bootloader.

Thanks,
Jingyi

>> +        pdp_mem: pdp_region@81300000 {
>> +            reg = <0x0 0x81300000 0x0 0x100000>;
>> +            no-map;
>> +        };
>> +
<...>
> 


