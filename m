Return-Path: <linux-arm-msm+bounces-60087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586CACC03D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F31E188F88E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 06:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E851F948;
	Tue,  3 Jun 2025 06:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwCnRELw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C111F4607
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748932392; cv=none; b=PyWmjfIRLUayh10ISMxnMrjrFCQ1yVW99aU3pJd5uGgqeWY18HhrBRFR9Hrh/opRokUHVMYT69n9rpWTNqFN9IPW+VxmSpnZ/IGnhzdp2BAs2s3e6ElGjOtG4WWNbpBCYDvjb44hGelSrMr6Hk2LaTtp4X5iBPDEbuAjNsN3R90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748932392; c=relaxed/simple;
	bh=RsGYtgtdANl/zO/ogZLbFhtRUx9OmRHuZoXn6BxbNqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcjJk0+AVBIUQ7lO3qt9tpVBPTdlqhenQi42ag+SRE4p2XiovgZw3ZaQ1/IXu8O5Gci+in2Z9ipQWfZjs4h8yhuHeHU0OJrEHm/zY2A8rk6VG3ms6Tjo9J1iBcOaMaX7mt+v597iOMhH+vdtfDxXPVoeqYrj+YZAp5jOKxUe5lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwCnRELw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HL4jD015190
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 06:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9pc6PHB6crm3zwpJbt4GLLT2Ce8F7PkqjaaH7vHbgPE=; b=cwCnRELwNaVxYI9M
	oAPlIZxDlM2BMVIyXkDlK9iqnPBgw5INiD+AWntbERFLygOOPqW3akmCQIgx4Cw+
	VxNPrJ/sWpruPI1wwdJ9aNHapyWx10lyun/QWBp24Gg/uF1iHtUgdTK+n/IlLv3K
	TdIxcK6eSFl50o+ws9cjHcaueCfeJkpLJElxBTZKozc+cf8Rg0J6Q1ecGpho+M8i
	6IA9JgU5/H2rYxqiifbwhNt4pm917bmrH37AxYlv5onlWBqpMXbbShtvbCnWiauw
	wi+L0TOOAHiDR33qj3JuRgeEwqlZRbnEzE41Pe6BVxRFy8JCdOL1wV6M0YLi9BP9
	8q9l/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g91hjpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 06:33:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-310c5c2c38cso5044258a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 23:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748932388; x=1749537188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pc6PHB6crm3zwpJbt4GLLT2Ce8F7PkqjaaH7vHbgPE=;
        b=XhOxAJjFGhGTWzyTgwYNrDTnuObjuauIDDzgn/iuv8wUwYjhQIKKZxCpKIh0XuDRYC
         aKl+QnDgR1/W+AtoLUx0fPREtQCMxz3JvA9Yw3KYyS143xS7fFVn84XurXIixcFHChqT
         7IMwYAsaLpS5Q2udWVRF87RCcNOIFYcA5tDkJ047E5W5GsGOd1OEHmw1kmf51a7x9K1o
         duDl7yHJz3k5kNUAhnvSZj+zcRRcWOI1rtemV13bRVMsEPVyD+5Rd7DYuXl2EowJjHmz
         nUlDcqAodBT+ea2iPHmjR0ZDkq6pDDPQt5JsinEdBg6TNF5dkt1R6qWGFbUtRtxoEsYv
         OO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoXLTRRPu44QC8gW7LsKA6yrFZ2Mf77yiGyRPGTyo6GOE/4qEc2zseu0Ay7gZTKMHUqvgdcz1Ul17vsXLE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Fi94hAHSa2/C21NTwxcFI4K8nxyCAhTrrVfh7EvzKjGc4Ja3
	nVQ80sKBgV+AwykKyHoumBqbKMLzQ+K/f8wprHjF/xHhasPLoh4rEmVqpwwKjF0AxDMM+k4m2Wg
	8DDWq9XypHsLFSG2iG+5ulkhLX6SN+tR4jK71DiIldxpHCoX6ht00shUmyEwXyDARZSYE
X-Gm-Gg: ASbGnct2JQ2wFLZZHl+gmUrn3/RpZQk/An15l8OKk31rMbAxp/DEPU21JeNr6avxzyg
	dl34i1jnqclUWcqyPCTnXT9uL+4MW8AiR3N9uOMtZ7VuxPC2Yf8DxIksg4XsfMppZ5Vt/Jjffb9
	Ys0DSw/0qXiPB6SLyGffWgBhQzs5dS1xGMzvc4GTKOK71q7Hx/XbWCdhhuIpPHUQ4zo33QADe+C
	D0Wm8zVxHkNN0jVtse8sAv4Yp2cjD4Q5yImT6ppYerIm604ho+DdhJea8BR9A2wWOfV6P43NIN6
	wazMpPHTE3XuqW9smBBoThYpooE0KV5RaubwmOJnLw==
X-Received: by 2002:a17:90b:2249:b0:312:1e41:3a5b with SMTP id 98e67ed59e1d1-3125035317fmr20383228a91.4.1748932388106;
        Mon, 02 Jun 2025 23:33:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG14BrL2PlcTbB07wK/qZ6PgKdgYBcfapOLCfQTa+Dc+QD3aVcsU8s27xf8IUVdxud5j5tkbw==
X-Received: by 2002:a17:90b:2249:b0:312:1e41:3a5b with SMTP id 98e67ed59e1d1-3125035317fmr20383183a91.4.1748932387543;
        Mon, 02 Jun 2025 23:33:07 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b3bsm6562535a91.31.2025.06.02.23.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 23:33:07 -0700 (PDT)
Message-ID: <0e1d8b8e-9dd3-a377-d7e0-93ec77cf397f@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 12:03:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
 <r4mtndc6tww6eqfumensnsrnk6j6dw5nljgmiz2azzg2evuoy6@hog3twb22euq>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <r4mtndc6tww6eqfumensnsrnk6j6dw5nljgmiz2azzg2evuoy6@hog3twb22euq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1NCBTYWx0ZWRfX9e1F4mrxPHyK
 aP5Xrnw+cEYx6PcUzOVqczwa9VLITkBMOXb4/eDZE5MdDLPUuiZi9KxzVbcFHqqIvqiPTLDm0+2
 bAdODZ2VTYlrCaHSGpVZbE4AQTAsHVqqc3Gs+6DoXJ7qXq3vSw60YV9p7HufgxX2mNPhK87ewjN
 R58fUN426JKyIcaMreorKgAgOL0b7PR1PIQBxoKaDzvc3DrOzaUvUT14Bv68q7JG58UOtDkCqQj
 TEOrmkuPwFDdhcAC/rJpEhFmKBgJGvxFzuEj6qqxMsnwiBxw8S2b2nK3qjsY0Ve3jSWxXDt/cy3
 jKjPiwkprN2J802cA/N9KT7axBR20DpJSnHC0rcPqkFhiNpDQUEuAIJa57bvNM4eZmamFV3gsui
 /HmSMSZZLNiGiNETBrlIV4VrN9kmHRj063qXDpE5Qv5XN3nmgGmlkr4stEr4oN5LyBkiB9F/
X-Proofpoint-GUID: DCL4PfQSypfYPuFXPX-0kP23Q44iguDg
X-Authority-Analysis: v=2.4 cv=KYHSsRYD c=1 sm=1 tr=0 ts=683e9725 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kQES2RtodgDv6MKcoUgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: DCL4PfQSypfYPuFXPX-0kP23Q44iguDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030054



On 6/1/2025 12:35 PM, Manivannan Sadhasivam wrote:
> On Sat, Apr 19, 2025 at 10:49:26AM +0530, Krishna Chaitanya Chundru wrote:
>> There are many places we agreed to move the wake and perst gpio's
>> and phy etc to the pcie root port node instead of bridge node[1].
> 
> Same comment as binding patch applies here.
> 
>>
>> So move the phy, phy-names, wake-gpio's in the root port.
> 
> You are not moving any 'wake-gpios' property.
> 
ack I will remove it.
>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>> start using that property instead of perst-gpio.
>>
>> [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 5 ++++-
>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
>>   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 5 ++++-
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi           | 6 ++----
>>   4 files changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..3dd58986ad5da0f898537a51715bb5d0fecbe100 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -709,8 +709,11 @@ &mdss_edp_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcie1_port0 {
>> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +};
>> +
>>   &pcie1 {
>> -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>>   
>>   	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
>>   	pinctrl-names = "default";
> 
> What about the pinctrl properties? They should also be moved.
> 
pinctrl can still reside in the host bridge node, which has
all the gpio's for all the root ports. If we move them to the
root ports we need to explicitly apply pinctrl settings as these
not tied with the driver yet.

- Krishna Chaitanya.
> - Mani
> 

