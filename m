Return-Path: <linux-arm-msm+bounces-82638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D73ABC73091
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D6244E74A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE7F31062C;
	Thu, 20 Nov 2025 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i03Wa1Kl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3+rZumv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD926F443
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629729; cv=none; b=dpLT6Q/DmOwHrIcRRwlIfJqDRHG86/1BzJBel0owi7hjuXNOAouk27JeZYq4W1Lpb7sFtr1AmDaDbF4c+sSG8BIBXEmZ0gsuxSqD1C7T0vH+mfw0KVAa+IwPHGAJPzFYDYAx+ONRohhp7bX0BlKYqZQs5gDlR5anK0dEL0oWOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629729; c=relaxed/simple;
	bh=3XgE8nzjlFnG5w7yTHIlKYeLdGWsQdHgYXqGvq3XWQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=UOQAx/eyCiE9tvMh91pnR+yRrlzdvtDYy94K3yvK7KFPxoTeFVITFwZNIj0m9VJoHjOzJuQOHRetiwws7YFzLm05evlYpKj24w/yNy1HSNTi6D2dqHma8RARGEuBoXvoR9dQ844LRRBXDdz8aQ/O7FaCCNcLjxfU4N+C1wQB4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i03Wa1Kl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3+rZumv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56O844026174
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ai+/yCdmM2wE0r8VW/1OQ/CHWsFY0swhqxkIqvv02i0=; b=i03Wa1KlHJrtWRKm
	nsovooCjguse9mFoVqtRbJg3Msy981FmCPDEPs18DxSXnZ4eDwKbv7+dVVTcZ7pC
	A9yV5s6UwYKxCUM2PU2fcs9xXCRHlMV2Nq3pkmKg7cEQf+khcbohPHUgKOyu1MWx
	Kgbkt6ilT3cCTBZLt0VrFDCchE+S4zumi3QqVC+mXWRtLOoBfCT3gJlqX6qLUdTx
	JaBNXk0xFD9Vap9+83okzpaybwgC0R8KT2C7ckDDgV9hxWxFk8GQkiN7qYvUM3fQ
	vqnR51XDk0XM5iSGPtJiNE2n7tAhcnKpurYwo/bwYDV+uHKKUpe/dkjA1Ll+XQdo
	QduR9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3gnxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:08:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2958c80fcabso21861195ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763629724; x=1764234524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ai+/yCdmM2wE0r8VW/1OQ/CHWsFY0swhqxkIqvv02i0=;
        b=A3+rZumvi4gT25C0FyXNAKrFBL/I99ScBiv/VX+m5zdzSSMIa+eVbxcj5KLEqX+LRJ
         2gmrGqTRvZsqAkwYFUYiV93ebKbJsUI1FQZsrPCYsz5ATvHy7IMtB5s0TMubQtwHaeIx
         S1K5VXAQZmupHnnGU4syt8pEupCOD8YM9fUO61aWCezdBRCUbMW3W/b259uB5lAhza02
         1biJzHcvJyOFkaCmDzPPA5IYaMpSwyCHh5Wk6MqegOV4yRUfNoYUAd0rdMZQbmb+3AXE
         Rgbds6PEYk/epVIo+5JMV0KwtEbuYz9/lcOVom0Ot86encdPDjX8dm3J5GLtkrSIO7+k
         amoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763629724; x=1764234524;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ai+/yCdmM2wE0r8VW/1OQ/CHWsFY0swhqxkIqvv02i0=;
        b=ljmLZYnAKw2f53hu1Vf3fHGoEqeZAfDrcowMJxTJlVpBikIWkyV6fKrwXYW2z589B1
         l56QpEnoC3RCftU/psghWXCO8Gk0fGB15PMrUZZXNGSpTNUsMeiPzgQAiONx6j2aH4Is
         OtkKtamM8Tft4C0wQivkRWrBEI8SeBrRKRl85rqDI2xxU3U4XHxfP9uBnho5SRQNM64P
         oge12apO5YeInJYLj5aUH5jO4r9TP0R6dpVO9h3P2xhw73wNXhBs88QQ9piXTKnw3snB
         7rBu4tBydr2Ak42y+W8zGrv5j4fVlYM1KLGwLBcWDpcw+sFInIwiEXMUnD54i4dtyH1x
         DQYg==
X-Forwarded-Encrypted: i=1; AJvYcCWdhbbk3Cd+48blzUkhfSpE0iGbkiUTCSUH8o1HZdGml59NwqTSfOn937J9yzpRvorqAosPaEZAyQI1EUDN@vger.kernel.org
X-Gm-Message-State: AOJu0YzNClW9HM8MjQWcOPsDlugzVHDNQbbeygrzQIu89ERKfiA68Ous
	oFtmXHOpAEJdW75Bc/gmirEzKbN3k6B+NXSCdKQ1nsr+1uERTOjG3j9biU7YBloFZJ1W76ENEIm
	U9DCpjYVXysPHZdIdhFBHQ+L1lfAbGI3ljUy9FCMqAro68VCOPmr/u6ZjqzVUAB29d1dP
X-Gm-Gg: ASbGnctc39KP4XrNN//qqElyh2jfaqY9mE7u6e+v/0PBVjOu1RWidjUJcpi5IZ0Icob
	uB9ak5h3SAS9GxYrPT7pE1kWW4QkPDxJBsmLHB03S+ZLYK1+QmQq3wweUJfUfUro8F9BBaokv43
	RaPezHrYP05/USm9MUbznEddCldLdnDi/mNtobQCCE0oj+yAT5eVN56NCtlDeORcAwROHTI4YNW
	+q/96qa6mat6RqqJuVt3hPOYefcotq4JvcURhk7mBKYkQa4oeR2GG0Zuw1Lk+s4/OXNwwJO332Z
	kAP0RZc+u8i6fbRG7CQl2RYH7NOmYEk2JKKH4gRKWycaUJkkUd5d1z4P/TaPT9nxfDj1IWG6cwS
	DNKs63Wbwd6UhmIZj1z65m+Kiir5g5wjHBg8jwkZ3N63uQSVGLaaiWExAo0/mMmIAhKIVlD6EJH
	7v8oah
X-Received: by 2002:a17:902:ebca:b0:298:485d:5576 with SMTP id d9443c01a7336-29b5cccdb92mr23444545ad.8.1763629724367;
        Thu, 20 Nov 2025 01:08:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAH62cUQ+tdqLl8UgT0ThXtjWfj7cqkt5nH/Im2b6NF937Lzu04lbfzZwMTb2BWazn175b3Q==
X-Received: by 2002:a17:902:ebca:b0:298:485d:5576 with SMTP id d9443c01a7336-29b5cccdb92mr23444225ad.8.1763629723913;
        Thu, 20 Nov 2025 01:08:43 -0800 (PST)
Received: from [10.133.33.205] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b00e1fasm19903285ad.0.2025.11.20.01.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:08:43 -0800 (PST)
Message-ID: <63fea0e6-1ce5-4f71-8531-a01535326374@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 17:08:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Add memory region for
 audiopd
To: Bjorn Andersson <andersson@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
 <20251117070819.492-1-jianping.li@oss.qualcomm.com>
 <mnmfh22usps4xy4hdck4ts2p6rej7iynsifzrqtmlklffnxrwh@f3gn5hz6yemx>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, ekansh.gupta@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <mnmfh22usps4xy4hdck4ts2p6rej7iynsifzrqtmlklffnxrwh@f3gn5hz6yemx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691eda9d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hviViZdL3PNssb8YJeMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: emTp0PniRqdocD41v14ZffTghmE58JhP
X-Proofpoint-ORIG-GUID: emTp0PniRqdocD41v14ZffTghmE58JhP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NCBTYWx0ZWRfX+BzuaWdaYldY
 4uIp1u49gBS1M6O0Uw7fIe3fB7kzMnhLNvDO3J9uyhviY5T2Svwhu7MM6WckVRIab4wuJKuHSJB
 j2Vk/7CEvkgTDyuOBZCgDZibmmE/FC3kSpxIKi0RX80p4yDGg7Q9Ej7bCTvliAJrljHbaGlBHtw
 pQLGXg3hNua9IUnZjb/7T9WetB7Udnw5gen6hUVlHoafTThfEI/ksf1WuUORWtbbcPgA0ppoHIr
 3MroTq7sTqDT31svF9EM9jSIjVQPFywLvVsxzIyHrQL4prTiggQ8cDCLZ5aagwTOmSgx4kLqPwo
 n/XBx7gHhzoWrRMhc3qHL2j4eBrGB3e4DblS9diA9RNE4KdIIOQCuDDpSnvEAyLj2xPY2jiy7f/
 jeB5anWfp3y/dCvy1DB9opR9dVZIjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200054


On 11/18/2025 11:39 PM, Bjorn Andersson wrote:
> On Mon, Nov 17, 2025 at 03:08:19PM +0800, Jianping Li wrote:
>
> Please don't send new versions as replies to older ones, and please
> adopt b4, it will take care of these practicalities for you.

Ack. I'll fix this going forward.

>
>> Add reserved memory region for audio PD dynamic loading and remote
>> heap requirement. Also add LPASS and ADSP_HEAP VMIDs.
>>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>> Patch v1: https://lore.kernel.org/all/20251114055639.1050-1-jianping.li@oss.qualcomm.com/
>> Changes in v2:
>>    - Fixed the alignment issue of the qcom,vmids properties, aligning
>>      the values in the second row with the first row.
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 3ef61af2ed8a..7957a9151055 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -190,6 +190,11 @@ rmtfs_mem: rmtfs@9c900000 {
>>   			qcom,client-id = <1>;
>>   			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>   		};
>> +
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
>> +			reg = <0x0 0x9cb80000 0x0 0x800000>;
>> +			no-map;
>> +		};
> Is the placement of this carveout hard code somewhere in non-HLOS
> software? If so, its location and size universal across all Kodiak-based
> devices?

This information is not hard-coded on non-HLOS. Any region(irrespective of placement)
allocated by fastrpc is moved to LPASS using qcom_scm calls.

> Also, the presence of arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> tells me that we have different audio stacks in play on Kodiak. Does all
> of them have the same PD loading capabilities/needs?

This DT looks to be audioreach specific. The one I'm adding is mostly used for audio PD
dynamic loading purpose. Adding @Mohammad Rafi to give more details about audioreach.

>
>
> PS. Others might ask these same questions in the future (I will probably
> wonder in 6 months from now...), so let's make sure the git history
> carries the answers to why things look the way they do.

Ack.

>
> Thanks,
> Bjorn
>
>>   	};
>>   
>>   	cpus {
>> @@ -4139,6 +4144,9 @@ fastrpc {
>>   					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>   					label = "adsp";
>>   					qcom,non-secure-domain;
>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
>> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>>   					#address-cells = <1>;
>>   					#size-cells = <0>;
>>   
>> -- 
>> 2.43.0
>>

