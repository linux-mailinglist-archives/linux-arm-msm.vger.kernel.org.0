Return-Path: <linux-arm-msm+bounces-79409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054CC198EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051E9407332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D94F2D63EF;
	Wed, 29 Oct 2025 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6elBAIv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7rCmTOw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DF23BD17
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732065; cv=none; b=ls18VVQd0n9Zm6dj8kn6TFJhrbx0aiqEHDtZ1PZkCiicxvpUNH0st6lv++he4fjv6V0RDdknJ01ldgJEK9WJmciU9OZqUR3E1BOcndK2bCzkXC5IB2G0fCMd6O2nde2T9+W0UbOVrEF+eSlXvOHg+K79eu4fUDk2FwGSPwzowOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732065; c=relaxed/simple;
	bh=q1a+cRy8t1d4Idu23Ds5LKgiMgaTqXhVpL8M3QMBjw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBwogpG+jUuKExg5RkCjrZ/q9tRCTJhRKsWtM3l+eg7dHNEFHQijW9sEfYzRKjYI6H4a9INg2X5D2NlGjAux81OcLm6BfbsT8QgE9GN8TSxBUZD3VFxBw0EWie9wTJ21vin6vuuQS2sXU1V/sAzw5vDG1rprH8k5PVMJmjrR0OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6elBAIv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7rCmTOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v3a93755359
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TePNPalHMwIQZy41qp0xadoCq64yzmdgEKfirFQHl+Y=; b=A6elBAIv2QDswVvs
	0YUo+0l2ZqvSTWozu2jqV/6/G1H0Pxu7JARdj3e/pAKG293HNhnznz471P+783M+
	yD9LJynxYXixNkKayWj4NPP+UD5nis/AWSbXRrEfCmu/ezIR72Fqn/UJUNlOJosI
	rlf9g48bTLJ5B8Q3nJAViOb9AqLbXrxNQ3qmQRM1lVJRRFdLdZdT6wyVdgAAoI7N
	1YGXbikG0dI8+CB/pgAS1Pec757jlj2xE0K7E9t/opec22VELUjxMlpwFujwlOCm
	pK2kjQ4Z4T9HUpjlb/MywwwQsQpx8sRLuOPe0c3GFzX5j/qjW5Y/yn/9fRBNwbRP
	6sG9Ng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0j3cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:01:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce25bea3eso4987988a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761732061; x=1762336861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TePNPalHMwIQZy41qp0xadoCq64yzmdgEKfirFQHl+Y=;
        b=C7rCmTOwCE84tPWIPiJzx3YKGMLRYRRkvSCpjoZFk/leVmh3IuRld4uGZVip1OzPpd
         GS0xIXtdZYfPi4loovVhpfg6WG+RMmoK/+S7kUHbcjH1JynzgioKIQhU2PlT2dha9C0f
         nxYPEmlj13pYI57zXGKnL+RzPXxwb6k2z3oRJ3dy8iLuIvTcWbmnwOS9NuPXxjaz3uYE
         9h6B+r9E5oJmPmYf1VK4+RR7PlPGFPJJvtOlthg7UQwzidCYnsYSD8OXKgA69R97KtOp
         vzXH66Q/tfk+1px88Ecqs/PLM6oNwa+TcN/FrXQGeBMoTdnXWwMvssyAlNRzDMPEqqPR
         JKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732061; x=1762336861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TePNPalHMwIQZy41qp0xadoCq64yzmdgEKfirFQHl+Y=;
        b=XXTOd6Yr+bD4KiayJaWn9hWlHQbS4HtNKQjZ7ScxqPnLVVzf4z9mSNuc3vTGloRg0m
         sZJComi/Eog7+JvG/NJM/VOR7geEUy5xfjuqgxswBDUP9zf1BjPv5OnIPNpgOweXOsL6
         0btyKyKtxqcsDGjWlKA3mPNjD1+flxfbpMy0lbDQUT5jWreW5nWGt0ASjGBIj/Xgj/nl
         1AxLPR+6YGAE+lPhnKLEt0Lv4LZ2Kd8uGBS0Ctew2T44c5IuXD09GwyRM4tYAEDV/3/W
         peZpEPDTdnOiOiYDpi8ePhR2Z2hh92c6bxD/EerYtjxpZ6I84NPfPh7d25G+64jYZGi1
         93Hg==
X-Gm-Message-State: AOJu0YycbI1EaOkpTGLFrfDbh+ejgyqpdHY9RU9ZwUzsoFV+Y/xSYwNH
	03PHkPD837odSRDobc4RoRrasxsn3FYIGB9Z3jUZmK6daigGHQG7P0l7nsHnP2aOBAy8ek1+2d6
	q98hAvUdLKgtRu4kpQIT9lpRihFmU+mfNjDGweuhaXoPFG4uIGtxa142p+jrPqc9PayCm
X-Gm-Gg: ASbGncuLRD106nzMUQpDuZ5/xSrj5cxCFkGIJmSTpVCuSvoFJP42lZDhMEtKXdHdzX5
	YQW8A7yQyaffs8QsWg0BHQChaZKtlNT4FNV7finHe+7TUJDuCDhLTSTPS+EFfZCjZAkkKTHyJUJ
	ArB/0iSeT9MtqzbQQey3Oo3ZEMw2HtJcNsDBEAPYQmtr2cqzhLjIQGA9F3jrEtnHTMZb/uArBIL
	ehMwcFzueqvxvjF3NuuH/H8R1IQ4We87baTmbnbjvO5IyUXgV1r5E2th+6SPTZm/TO5R3Sfb+yx
	hGVilN9Q6+Rjyc8gHn+eNISV3UaFrzIPGzSEkkEM5DpIUg5HdaaRu2uP6KYb5AvF/Tb5iOjt0hY
	OW2GAYdga1Ny7ibNZVsl2mEqcMxs=
X-Received: by 2002:a05:6a21:3386:b0:342:e2ef:3323 with SMTP id adf61e73a8af0-346553f732emr2780365637.42.1761732060829;
        Wed, 29 Oct 2025 03:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvHLDqBXrIHqT5BhdcfrUajorIAMA9uhhTRhKCPx2T/Ja47LZZ5K0xA7gJ350vkbHObhXNJA==
X-Received: by 2002:a05:6a21:3386:b0:342:e2ef:3323 with SMTP id adf61e73a8af0-346553f732emr2780316637.42.1761732060183;
        Wed, 29 Oct 2025 03:01:00 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bd810sm13323143a12.6.2025.10.29.03.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 03:00:59 -0700 (PDT)
Message-ID: <0a47016c-1d7e-4026-92bb-a13ac2ce169b@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 15:30:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] arm64: dts: qcom: Introduce Glymur base dtsi and
 CRD dts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
 <2960a6fc-106b-4280-b4d4-9c1a3a449454@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <2960a6fc-106b-4280-b4d4-9c1a3a449454@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=6901e5de cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=HDE9XZ7bw9bohbkjgD8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ShzMHX8UL5QIlE_kSzo7AJIPM_EPhVTD
X-Proofpoint-ORIG-GUID: ShzMHX8UL5QIlE_kSzo7AJIPM_EPhVTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NCBTYWx0ZWRfXze0KBoX4k4k5
 l6Td5iWI42IHz4e72sFdMWwMR+LFiL21Ognf+fnzlUWrnNu3B5NxUKFZmSB4jJZxr+rV4a71Wvz
 8UhT6Oz/TnIP1Nud197bOxek09Ub6l7RK+Lxbn2cwPO+eW86r+u7YbQMSIoDJlvJUi05z1zSBTA
 6hfnE8Z3vlPVe7j1Qn1S24lL/oaPf2UJ32n6fgz/KABJfY3Xpd6opOq4ChQIAOBmRNqX6rB0WN5
 jAbGCeDi2qtLmxFV/hV+Obi0//Bs5XvLfHbcjuwzyx5Cp8VkZznamz7DqLzH0Fcv1+/S0KHsguP
 xHlk25bDCjamURenD70oFydwqDLlc5HUf0orF9Ilr8dYvSD9wKxS16O7DmhBNDtkxpYtmhS1tgy
 CNbrm4CXZTisctBmoJZDk7uoq9HqSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290074



On 9/25/2025 3:46 PM, Konrad Dybcio wrote:
>> +		tcsrcc: clock-controller@1fd5044 {
>> +			compatible = "qcom,glymur-tcsr";
>> +			reg = <0x0 0x1fd5044 0x0 0x48>;
> We can map 0x1fd5000 - 0x1fd5094 inclusive, as that seems like a
> logical subblock (this would require adjusting the driver)
> 

Konrad, we encountered issues when trying to map regions beyond just the
clock reference registers. Normally, we map the entire address range of
a clock controller (CC) module in the device tree. However, for TCSRCC
where CLKREF_EN registers are located within shared modules like TCSR or
TLMM—we don't own the whole address space, and mapping the full range
can overlap with other devices.
To avoid this, we propose defining the base address as the first
register actually used, and the size to only include up to the last
register we use. This ensures we only map the relevant subblock,
preventing conflicts with other device nodes.

So want to keep the mapping same from the start of clockref clocks.

> There's also a laaaarge pool of various TCSR_ registers between
> the previous node and this one.. but we can leave that in case we
> need to describe it in a specific way some day
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
>> +

-- 
Thanks,
Taniya Das


