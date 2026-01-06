Return-Path: <linux-arm-msm+bounces-87726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71ACF99F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 18:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 172FE3038998
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 17:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A6F33B6CA;
	Tue,  6 Jan 2026 17:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIdR/F6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMi6HFSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35A1339708
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719635; cv=none; b=Tq2JnaSCi5eyA5C/JgpwkyK5PF+KAUMOChfZ7W7yLroboCxtaJR2th3bc+J5aUDRwIrAcn9vL6dZNS9V11w6TuSY8HO3Q8zk1N5P3YQI0tlexquq/O41yk512rg10KmZVrMFL1PPk8it/V6vQmEXUtHNVKvX5kRMyfIrZkYBRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719635; c=relaxed/simple;
	bh=T/73wbQhsnPCQWdbJBZXay476SzJAjgeFVs3Nure3OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diuu11addTsoQjTqxW1tHyw0N1mCiicmTjAll3+x+t2Fpna+4hbFwM/1irvLurhZzjD3UVsNQvLvYxbSy4BAAhLLLQs4H9E+Gp9Af5JiOBuHV2v7FX6bW38XE8q8lvr0ovpx7zemJqjku+a8jTQIKHIAfDwPD8w08CNQJRM6l58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIdR/F6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMi6HFSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GqUO83889118
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 17:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EC3T6rSFC1iUcR4kmgWjUhT3q9obgUoEQgmXTpBn8tM=; b=jIdR/F6b8h+2yG+b
	00G9pyDdzUCqhuQtyS6bDe6ewqVhwJXf25H5JpIXEI6dbN/rOJro5uQtzkr5eFDV
	9rxWoQlG4D1Um5aVm9/A9wuF5fJWq2cXiXj3Lhij8uhcGBXOVBrr9o93fXZamEBx
	W5vP5W/YnzmLv9FVzBmS9enF/k1Dfd6Wti7ett3uwZQhI07avc0aU6kg254iKLtg
	J1sg5sPh2jsqyTl5NIeBVkSi/Q97s2JG+xZ5+b86SX8c2XJurDCxJ0zuCyzK3BrT
	YGRnmwbC1KTMj2sb4+9CoBy9DaAdyk5jO6RKWl/WGIKUi41uJAbL/XHm2RcKB5w6
	O5Ojrg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0g2bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 17:13:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso19924925ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767719632; x=1768324432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EC3T6rSFC1iUcR4kmgWjUhT3q9obgUoEQgmXTpBn8tM=;
        b=EMi6HFSJ6fAFPydv76mGYgNmAMknFR6Y32a/0IBUdtXkMG5DL99KtqilJ5W6iUvb60
         TO/7rYqBVMK/Xf9hkQ6QvQqE9gU4F7sqfWhUsMuEznqP02MACcwfGvTtZnwmy191TNOL
         a737xDpqs7wzxF4J6ahvsHuTvanwfoaHOw6J1Mz2rYZrynRGjCTnjUa/sdP/eQTeS2Tl
         cHdEC+oDQnDJJrOap9yC0LZYTGOFG+mHDUmU1t/IzM2HSruWa18gpmWqt+00AFVlY9Ex
         fgVonoMmSFbKLCK9mbDqnWFkpyU3pApXVKHDNfs07O95pXmj+ukX7m7wamh1BGebKNTg
         8cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767719632; x=1768324432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EC3T6rSFC1iUcR4kmgWjUhT3q9obgUoEQgmXTpBn8tM=;
        b=WPqCoNzWECP7M+Kq8MQOB6pmT2nM4YrBjt1XyAcUVHKfuY2JfacFqbl25veo73V6Gc
         EPTfjpgT5yLH13wXhp7lYOkHPIsv8vE31z4l2Woh4y+gY/XbiYVFpaNGkQUvwKkyFfbS
         eBcHDwMz7s7uYwK+u0mweReJ+5NoKjAPZis2hk11Fn+GiFPZ3ksKg0YyS8EhiS3vY8Ol
         ayRUJWz32ngYmOlKMHkCXwzBy6GCeAQNWtxWxeW7SDc2WSMFrR+LsK8GgpukzuBVvq1Y
         fa3iyZ04PdXqmXT8CdtUZDGnQ0ye/JKHUkXtd3pWhXYS/1ufHjO05GRjGhuWMZGuz2nJ
         KF3A==
X-Gm-Message-State: AOJu0YwdysYMVd06zWjCeP53q2qRVT3OUvfdYxeRMwjSl7NJfkVypSji
	3lwrjYQJMJx2zvKtJuynWRc3K6/Tad/9yQSSRyzj+OS80R4j541ItA8fNWaR1Efq2tklsVEf8Dr
	UCYoz5XkSCnK9X32xrtxQ+ih3CeAME+w0SULkyIgOSOKJOk6nQBhc1oUwZZRqrQn8zE2D
X-Gm-Gg: AY/fxX6xMVri6hBfcga4VjCVJGndq1j2wnbf7WtWWxY+cy6+AhHz3S0Bk2bKgtbW3Ne
	GIgD05qLoWr8CnorF7v2P8zQ/CFzWJLOnQy4S0F2Lktg5zIVN8J2c2/XGisscZwscSZ0ggBAHsF
	5Wwyhh9HL2DHYhm7dPF7lCmct1KrgGHNw5kNFr4sjfdJ1AWNLwKjr6UA1a5XoVs7sznjHAKnsI0
	GsYjMNb7ZaUv7fpBVSXNvj5YMrqMN3A1kptcuNP/a9kAEKIHXMJirrdoQrhXfHVJGlrSs+SUH5W
	OGYh2CXBt6y2yASuHs1/5Zfwfs74NqEOruEZ0V5AQ7yQ/dhkYdi1UzUB2qXgmo4hXZ2KgWWvE5L
	/jcAz0noNbSH8hfZ/vyY+/9YIy+yRXWbRWZk=
X-Received: by 2002:a17:903:2f89:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a3e2d0a3f1mr38264575ad.42.1767719631661;
        Tue, 06 Jan 2026 09:13:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZz3g1wavefuaal9cTj57zUPh9JmGbLDBCad8arIAn/WiJ97P5kFVDqKUXngu/jCzAcNE1pA==
X-Received: by 2002:a17:903:2f89:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a3e2d0a3f1mr38264325ad.42.1767719631112;
        Tue, 06 Jan 2026 09:13:51 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc793fsm27745945ad.72.2026.01.06.09.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 09:13:50 -0800 (PST)
Message-ID: <ca66b716-fcf0-42cf-af61-8be5ec333829@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 22:43:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
 <20260106-b4-sm8750-iris-dts-v4-1-97db1d1df3dd@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-1-97db1d1df3dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nrDhveWSOHCUUmE7dQQ57SaSyaFeHXOb
X-Proofpoint-GUID: nrDhveWSOHCUUmE7dQQ57SaSyaFeHXOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE0OSBTYWx0ZWRfXxBD2h2q8SR6y
 wXgwPx1fRYj1j5pqAG2MEbOSj+M/2l/Vcy+dYLa/HyJtXdQt/HRc+wrjd6b5cJ0/CmHwIS83EBE
 r2QAs7d1IEx+ritOWz8TvQUe0dF4ZkOEeneSmTDLxeWzaSugaTeGH5m79sOp10/tYTkQsCuG/B7
 yxfEuj3fhWSh1l9zEjpSifaoCuTCXT5hdzLCT1cxQPEsGwRUdPu4n6hv8OcTsCq1rHdjsD8zUQK
 BtgmJux6IieNYTu4pQ5rQaWDF0CmFl3hpFJ3xXUdvcdjRto9yWqI1baBuR9yeo2nRxDPZD9MJpz
 o0pPrLEShlsB/5XDwia8cDMva8pwLj0GbBP+cnsZCS/hoGZ1CU7Pizo9kbfXzZeEGoff2Uyvu2X
 TpVI7OBoRfqASzilL5YFQwQwlQVdyf/W1gTwoGghhzWCwH0ZD2JG4YvyA7y/hamyJSSJmDkm8Ts
 HPGPuQZES6Mrf/V93Ng==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695d42d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=/LlkvhkGe7jgMzo/w7jhng==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=haDqQUYsBGjX8MXYv58A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060149



On 1/6/2026 2:37 PM, Krzysztof Kozlowski wrote:
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,sm8750-videocc";
> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


