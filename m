Return-Path: <linux-arm-msm+bounces-81510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70183C559AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 04:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 360AC3A64D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 03:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36222853F2;
	Thu, 13 Nov 2025 03:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hG95+bLS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1ks9hSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309582609DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763006267; cv=none; b=Mongn0ptc1oClhCbAkHqcM5qmVFkk+7NJMgQMRfx1m9nzKF/lYofOTbdCKsz9tslph3+QXyISD1yCVsi2+f+Gl1v7Mx0/OliPGDGqcZzHVW4atZRXOC4ItpU7zNW9wSl3u1HrpTGUc+BPAYbGIZ0bKcptWCSmEvwqKr7wKdzqb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763006267; c=relaxed/simple;
	bh=5ACerTRITHaR7iMg8eezglL1j18rhtwjVIwxI61jjPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpL6lAZJEDQj9qhBF6arE1fznpBnUa8O6hwWhD4UcTki9pADaqYia8a6lIgCPcUAVa5qKanEfl/UQDdhwczfiy53+zku1EgBJyhMNekuLyMEEb3FRaSya2Csda3FKqm8hUig9ix1czc7Wg0Qozi9jQGu2m8vpb6p/FxgvG3OQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hG95+bLS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1ks9hSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11puB3071628
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGwPUge2YEPjjd039uXPYVYhS/a+SQX0HemxIV9Dfyw=; b=hG95+bLS3Q5XhZWm
	09JlRJyWWqEQOL5kWvk3C9zrMV3Tr24rWdvAknnbhkLA6Fvd8U5aL5YzKypSFMU8
	tr19b3/MTkgQYBd1dykfG+UIrIbW8HsWtFCE+/Tg40hcBMiFOpiXF3b5Ilbg5ieD
	7H/0YmDRZZrHzyjhH5OdmTarIMQrpnfyIRC53ftbWQRO9HQQjsicjoMX0kgrbiq0
	LVid+OXXoIkECI41/y9VE0MEB23zcheuRzHlokRYdp8kItMrKWkgUx4oqNXF/dQY
	fd93+1DccbNfNcOW9BCt3qc6BMZ6d4O5ik50eBV2WW5iU9pT3banFAlm3Dp0Mzl/
	ZNTKRg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum32p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:57:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b043e2790bso965597b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 19:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763006264; x=1763611064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGwPUge2YEPjjd039uXPYVYhS/a+SQX0HemxIV9Dfyw=;
        b=K1ks9hSf6ngssvCSE+a0AhBvbprdkZZtThUI0Yup8xWAtjvUF7XjUqfu0svOMuqL89
         LqvVqNDnXl6KiOwVpXc7K/frNgKADojpRjFvXC70L6VdyGcGU++CCd8IOa9x2gTeDYxq
         B3e9ZVebNYfPOEU3VZ1dRA8OY4n2LQwNZQ2KJ21tSZ+P1jsjcK3NLeZPXSyJPx7r1sl4
         kTVHLW4vlCDWxFWvY8pikTR25ycpKdAIigRw1+TnOsJOJsc32Qi1JQ51ayR5U0Y1rRRp
         59vmXcu7hFfx0oStILUz6gtxIkfwxOuoPAOSK6IBM7nx8x+IZMvFSrrx5NxKOKr+4zL+
         S0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763006264; x=1763611064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGwPUge2YEPjjd039uXPYVYhS/a+SQX0HemxIV9Dfyw=;
        b=wxSu2+xd1LcrD4lehwlHh15CVEBcLU3F4w0J0cp0iAlkZ9caV7EDZ1VVnqpWsHBx9t
         yu/0ykO9Sl3F+MkJ7/uEyJYq8sQ/egxhrprjA4B7oGD1n1uUsydYZje2PX5M+PZCxQIs
         uN9HjEBIa6rJnD1PYwkTpDo/oYUfHqu7pIjEUhi+WZbZkjirOl2QUKka1EuKy8K+ubg0
         VvMnyYwU9wrbiE61kia0YfLqdtSYn0yIx644YFjeX6WXOyWibCGSwgxPjMAsFtqwM/D8
         M92Khxbe4Fzl2FetexDhq7J9SGgSrIM9tuudJ6OMmZEVIsQ2vFt4+Zjsiq62qTU6Na/L
         AXcw==
X-Forwarded-Encrypted: i=1; AJvYcCWrwXg/oljUaX7cyC1svnig62qAGaAFfd0YqYyek+LwjDAJub/ZANoRYm8LD1mLrWo5I9AaJ5NKLzIakHNw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvhvmbxmsp1afxo5ZcKFltzwr9br1PXq6zICTCe3oIOqLKXxHy
	lyy43IbZ//4pid3ihUzUm+PWaTJ049RuUrj9g7oQQFbdIGwAYxtl0fMubrx/X2iJ8scn3si5TkJ
	59Ihmbk+LVmLXcXQ6PiDYXyRXpvln18bcnT42qDSxZjuc1fPe3XRri/PGaX00RyYR9Pxq
X-Gm-Gg: ASbGnct4kxn9SlQr/3YQHUW94WzcavBUKqEaO6JSlgVTSo+KmXdLAYOr9mwPKm62ZX4
	7IPvfCVToRMs5X3HvKBNbtuwrHxKNc0mle1ywCAz8jz/FDqkg0HENjKV81GsjseUEUUaS6iwVCN
	12m2nOSZnw7VJgi9wmH09qbHInpQmCgguq6wuG7cEhIUuh3CRkmkCEne0+RyEyJBE0zThM6GYbU
	lN3jwP9PHUfKwrzdbcyWHbZ2KSYNuWA9nTK3zDI2IHjLQqGqIIeH4BL2B/EbFfouvAKZBVyGHkI
	nyjX0zQQpLl2YpbJeckWOhwR/oTXeZ3Lq1RD7bA5Op39VK/sT/ZcADm+aVFv3fmKEu5WDnyeE1V
	aI5FfQJgkOKcVl2i28AJGRNNCWUCExTY=
X-Received: by 2002:a05:6a00:1399:b0:7b6:363b:c678 with SMTP id d2e1a72fcca58-7b7a27a429amr6423963b3a.6.1763006264037;
        Wed, 12 Nov 2025 19:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7IduW8OEUCs1R9PNoNwVWicsKHQ9VQ4Fd1cEmT7M2Z91KTvLlfdEdEG5Ogm2o7odqrbFCWg==
X-Received: by 2002:a05:6a00:1399:b0:7b6:363b:c678 with SMTP id d2e1a72fcca58-7b7a27a429amr6423928b3a.6.1763006263552;
        Wed, 12 Nov 2025 19:57:43 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cda04sm603906b3a.19.2025.11.12.19.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 19:57:43 -0800 (PST)
Message-ID: <d6a33801-d4fe-40fc-ae19-6a2ce83e5773@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 09:27:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 0/5] PCI: dwc: Add ECAM support with iATU
 configuration
To: Bjorn Andersson <andersson@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250828-ecam_v4-v8-0-92a30e0fa02d@oss.qualcomm.com>
 <176160465177.73268.9869510926279916233.b4-ty@kernel.org>
 <e9306983-e2df-4235-a58b-e0b451380b52@oss.qualcomm.com>
 <zovd3p46jmyitqyr5obsvvmxj3sa3lcaczmnv4iskhos44klhk@gk6c55ndeklr>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <zovd3p46jmyitqyr5obsvvmxj3sa3lcaczmnv4iskhos44klhk@gk6c55ndeklr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyNCBTYWx0ZWRfXwMriSDorBE7L
 hvuKTCDPZaV+7q5L9GJcK6QemZVI77EHJ/l5bA41/J5vny4kKEA6ZtOvtpadR4CJHX1NYO6axX7
 MdByewP5zIPoUeSsW1MmUNXTsSucYm/ueCughZYFY4rkVsg/yNhFQ9eYbeOqZKMmWh8XCpEMfCK
 ux4sGYj/ICHaadLFyhLtGN5v7FoUYKpsUPebdwGJirAN/8lzRMmdnxAasTLiC3hNMIZAXciXDA2
 aubjhqS3sEjwfB/syjeRtSeY7cR4+gAn/vJlZjklzOCgkhokDm3ZsYTbQaBkVfmfV5+D1e27nLC
 AlH3hW8Rx0dduP4F+OJvwg8fyQysubkkHAMEpjRbJ1mCDWzwe7DYcn0yVqEMlGiJSuaCMRbcpa8
 9xVKEuYQOlfPn1oH1H7kvZ1PFMqfww==
X-Proofpoint-GUID: 8vghC4ALOl-jJvIo0_31Ukd4ej3Q4iWm
X-Proofpoint-ORIG-GUID: 8vghC4ALOl-jJvIo0_31Ukd4ej3Q4iWm
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69155739 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=oNbEpEU07NhVOHX3m2YA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130024


On 11/10/2025 11:51 PM, Bjorn Andersson wrote:
> On Tue, Oct 28, 2025 at 11:12:23PM +0530, Krishna Chaitanya Chundru wrote:
>> On 10/28/2025 4:07 AM, Bjorn Andersson wrote:
>>> On Thu, 28 Aug 2025 13:04:21 +0530, Krishna Chaitanya Chundru wrote:
>>>> The current implementation requires iATU for every configuration
>>>> space access which increases latency & cpu utilization.
>>>>
>>>> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
>>>> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
>>>> would be matched against the Base and Limit addresses) of the incoming
>>>> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
>>>>
>>>> [...]
>>> Applied, thanks!
>>>
>>> [1/5] arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
>>>         commit: 03e928442d469f7d8dafc549638730647202d9ce
>> Hi Bjorn,
>>
>> Can you revert this change, this is regression due to this series due to
>> that we have change the logic,
> How is that possible? This is patch 1 in the series, by definition it
> doesn't have any outstanding dependencies.
The regression is due to the drivers changes on non qcom platforms.

- Krishna Chaitanya.
> I've reverted the change.
>
> Regards,
> Bjorn
>
>> we need to update the dtsi accordingly, I will send a separate for all
>> controllers to enable this ECAM feature.
>>
>> - Krishna Chaitanya.
>>
>>
>>> Best regards,

