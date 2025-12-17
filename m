Return-Path: <linux-arm-msm+bounces-85460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFEECC6F76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C534B303F4EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24AB2C11F9;
	Wed, 17 Dec 2025 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PE/g4CNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6wIfyRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5F2D7DDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965620; cv=none; b=sg0BqgYhDAZ1Mpxo0Zxlt26yv4ZOCRMVnbBNUiE8L8xd2VhCP6m42UzjT6Q9NtWh50QJG75EwwY4/2OpufiUu24wb1RlVd/RdCMrniFCf0lsl2Ipz4gi1x/4/M3z2tTUgiCqXnBHr+WlmN4yE4YrFoR0fL9JIf2B1G88Oh0O4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965620; c=relaxed/simple;
	bh=J+gaD7pb5SfxzaG8FQbr97ESOPqysZ33V3fyNbEkYOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpj5W1ifx/7hkXdMXrdW8xC1uAp5odjPLnF7Y/IHfg6ddHnLDyRHl1afVgGXv8zrUnc6DtUNAg/bbJj2w8AGL1ucqWMNM+CcXGDMy7fGmlZklXNBA6tDN8nUg86NgyRjhIyhhElyMl2Eda0D+U7PYkXEIadlVplvs7nziRN8Zog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PE/g4CNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6wIfyRO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9pLOO008983
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1tSSHoAveB5RbtZjtvi7dGmKmeXw0cJbrfnkezGAvU=; b=PE/g4CNhDwu0r3QD
	b0+uE66NEBPQQ/rD/YMT7LvPPvhbaiAcTWe/bBopfbSlzu70N+I0iSHF+12TFuVD
	c19OMRv5TRvswg+7A7mP91QMzMeaOKH3GGyMuySTYg1XXQajEkZOf+MhXRL1/n8r
	UVBwziuytfJ7W1A4A8M4vXksn5DDNW5gcEVgR41iPtNxBqec4XxsFYV8oTtFGfkg
	QrJkiDL15u8RSHQvZaBkA1L2qZmFBNraMU9TWkNNkUBdZcFmiyXRjR5AWP1XqpFc
	uT2X2TiQopyMuJy4xdmdRucQ+RRMuJHVGfe4PFbEhYtkzXYVe5Z48kagIkllHSzW
	rq1N+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e014s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:00:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29efd658fadso160115595ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965618; x=1766570418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1tSSHoAveB5RbtZjtvi7dGmKmeXw0cJbrfnkezGAvU=;
        b=X6wIfyROZwP0TB3ZMX1UDbO8fwnTXka66hagxTOKhX2oyLb1EfPRoXo7wD6lr4C/ul
         ADBrCCfSNE4/eA6FskG8Ci8VTw4t9GED5J2K9CcLNZ2CKjVibds9e5/m/fjVJXkr/3Hx
         6s/yOw83bNGOa+e+y9L6/FX3fRfZ6lIeD+iVjNzIZNs4IcEQmCK2nVEKDQa2VFd8mFoX
         e/M/CiEJbKL1L2H48UL6uC6TKyaorYnTqBnw340IjyWVaOkioqMaVTvdnC1pQQDVORTr
         xV/DXyl1N+d0C86TA1bichmhedAJaI7r3bI4tP5bnQT/KajWU4GAQjm/3x88OQVVL9nW
         i1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965618; x=1766570418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1tSSHoAveB5RbtZjtvi7dGmKmeXw0cJbrfnkezGAvU=;
        b=eNQn2n2iPIn9jOTb+w19Xlwfr8x5B8CHmJhoEmgMXyqhGJ+xJy3QpstWT9WFn9HUE9
         dgfKTJjfDRR1lr9Hyp7C2FgJJjbHxsw2X8K/ZFFOBq7cKKj4SUiBUZW2mnCUXfRI6Pkh
         kXzGiLmRZLBnZFFLYgI4veaIJ4SGysYFlmqk+cp9wiLeMFJVSX32SLaAkOcXBzHMZAB+
         sS7IqszZcfZIJNL03wG4+rN+FmWle0VpP14cmd9RvVyBRabYmCjmgJ7Rd9A6fnolp+eL
         3Sl+IWjSXgwiEgJqRzXrad9baxo89NGXvTwa1Qtpjr54IpZBzDtlcURSJliefbjvoLmA
         YRCg==
X-Forwarded-Encrypted: i=1; AJvYcCVnL+dc49W48CjnjNv1YJFTGpzhaXoVZ0RnLKUTCk2+kcQe3mJoNz3+qx6ZtN8DMkH9OFrY04wuQzJ0k8Rh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+8qXes1shM8TheLzeuuSRF+A7kTF0U9GzLUVmAVKLs0ljb4v3
	SZ6G9A59LzAgv/rnmFYoIsfU/hB6GsHVVRdK6aLHXN9caWHW5wY0CEHz082WFGA5RQ3XmQ+d8nt
	n4NqGeZ5TQ1XLn+fIgLhwoGNQh6YQMEuqEZicYzS+wUqT9mwN36INqhrLIo7TlXbkL841
X-Gm-Gg: AY/fxX7W1H7u0PEfhZ5ybLV9x/UtTtkT5Y4BCpLcr55gPFnXrbWN4NtEdD9O3ShQ7j+
	QW1utwIZzgj0t6cbVPazLvyI220CF8Q7WRCCDgdSilKY/r0tESFI5jC+WDCHnkYsLLzLkr9p28T
	wJZoQPndPkQhwHOsbWuZsZYZ0ra5MWvzr28O6ZoRcVVk2/vl/j0m6cPlW9pg10NjWcD6v/b8rHk
	IYdQnX88XauFROnwv0CgpmECqMDgcbLjSs8u6AqtMDUB1+C+viy+ObhhacEDoZowKzFiSmIWR8o
	Fa88r5PDvoua/ajyMaXL57mhS0N64zwc7rXCpeajgDTYeVRHHZc8Y9X2hcyVc2Rq/4Hfp/MYQQs
	qSob8YEA1URstQ9atIz8ki3Un3qEs72g1daKn
X-Received: by 2002:a17:903:19e4:b0:2a0:ccb9:2f0a with SMTP id d9443c01a7336-2a0ccb93179mr116769905ad.8.1765965617712;
        Wed, 17 Dec 2025 02:00:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV7ZapyMML5t0Xq4q7vbALOFcMTu5uv5m41cy8s8nzbS4pxCsGLqHlPfoAKUE8LaKzN6OkJQ==
X-Received: by 2002:a17:903:19e4:b0:2a0:ccb9:2f0a with SMTP id d9443c01a7336-2a0ccb93179mr116769415ad.8.1765965617202;
        Wed, 17 Dec 2025 02:00:17 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c6esm194247995ad.59.2025.12.17.02.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:00:16 -0800 (PST)
Message-ID: <008a9d80-9427-45bf-86bd-58e05fad694a@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 15:30:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add camera clock controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com>
 <eef2f002-22b5-4582-9fc5-df1c8b8bb0ce@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <eef2f002-22b5-4582-9fc5-df1c8b8bb0ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MCBTYWx0ZWRfXwz7moxUrfXQV
 mjE9q9PYXUVM9Cy1ZsOhWYe6g/OlErlG1M1zT2LXaBCBoP3M6MaF9ejg7A86cfEyG1vYEQMLUVn
 o8/Isly61N/ZMcBMvJkZnIShg8iMVAR0pmbBua+L663r9LgHdC8C1CFrTWgGBKbpVSUNhWNiKS7
 jvliN2zaPW6DP9aRHm9wxHLRUvDtqVF7TKHnRjdnO9vYPvt1dgmMXGsM/VDoC+NmiDLPsK411jR
 UD8i6kB/Lt+9DCl6rMnqZWoB0aCWfNuD5ajUW0YqzVAmdNtzpmMp84J3j7Pk2v5rcED1RDPkOXL
 C2LQxMVpyl4+PGfLq10PWReoHfFhdcn58Y1jjCFkP2WlpO9C9Bh0zheXUfTfXSO8EJ2SQSlgEvZ
 2QvS2Oxs7J4HkuU7hTqH0jxInJSd7g==
X-Proofpoint-GUID: 48Xu1rMOCEbA5O0WnhyCbG1r7xA2Msg-
X-Proofpoint-ORIG-GUID: 48Xu1rMOCEbA5O0WnhyCbG1r7xA2Msg-
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69427f32 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=c9pHKBabw8uT7j5izdkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170080



On 12/3/2025 6:39 PM, Konrad Dybcio wrote:
> On 12/3/25 11:32 AM, Taniya Das wrote:
>> Add the camcc clock controller device node for SM8750 SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,sm8750-camcc";
>> +			reg = <0x0 0xade0000 0x0 0x20000>;
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&bi_tcxo_ao_div2>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +					<&rpmhpd RPMHPD_MXC>;
> 
> I see that a small subset of clocks here also needs MXA
> 

Sure, will update the phandle.

-- 
Thanks,
Taniya Das


