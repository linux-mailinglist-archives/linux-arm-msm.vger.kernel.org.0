Return-Path: <linux-arm-msm+bounces-85684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8ECCBC7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 284283005D3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8B532E73C;
	Thu, 18 Dec 2025 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGKf7Hix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTSK/9km"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CBF32E6AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766060764; cv=none; b=WagRcJew0mg8d3oCC8hGFml1LFMdlgY9EF9+ES2VCn7w9ssBNIgcKpRCw4ef7XzXZUNaaoeA5VPGkpU6+P3Dw96iO8xdylXlzAAHkEZHlFNo19TjFcdO4evu6FiQBrim+VJeXL2jEI7gUM+Mpp4i5lsraPO5L7M+wGbXWqwbiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766060764; c=relaxed/simple;
	bh=pKmU0fwG5vsNUByzsdzUiSnAznD5hFkczWB8RpIVjnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2Zs55qPubZX8K5koTVJMd392TYwSGNT3QZJHOC8lNQh2/LuLSvMomrvPGCW/eD4eRjfh2OyjNCKv+lHSpQgivirQJNrJE6xx7IKJ6AZkosCiZu/hM+1eO3K9/u7s2j6Ktrl7svWx8E73vfTcNh8nup6czzAqds5W1A3ztTf77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGKf7Hix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTSK/9km; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIATKGQ754806
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1kei3VviQUzx7YE5/174xV34BfK+CaqS8GVwkzgtt0=; b=eGKf7HixctNSAkSt
	UMWag1Py5IDuQYaD9Mvf9vZLBrscJoS0uzT7FdibRHY+sZc93cz7uWKYg93u+FBt
	7Do+u3N9DqYTpi3s+Yz6CUWdpas7m46YzPT/ppXtqkqa4JTx2YtcpOz4hghhJRdP
	n3q7MUWv8xLBVyFZCvfGdrT9G2Sg4DuiPImGgZ50soY0SOS9+/fjecvKPrDrAYjm
	akEZucxJxdkcrrBUptZYcr8nYjaR5jjyHdVANjW40lmXa4OHkW7ev7ibuFohSOPF
	jPro6m49qpoXb8FGVV0qsslnAomxYRW2V65jvTTGW1pMRAiuNvE96snxC4NaA/Zr
	ODVWmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0sjhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:26:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso1477931cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766060761; x=1766665561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1kei3VviQUzx7YE5/174xV34BfK+CaqS8GVwkzgtt0=;
        b=cTSK/9kmgilDx3xvbA6BYdSAYaVMSIqXGlo9CgNKzvv+qxNEmXSU8YBUOwlklxvxZo
         DIekAY8u09J1pwV8ktu/eHm0S+hXg3FDMOY3vCUoN6iKDPvD3RPKoESZphRFvPy0E4e8
         Bsm7fOYf0Y1yS1NOLRoyS8x+tMBM5d8A4ZGRa/2/HdWF+M+3sECIyL6CoKayPUsx5FV1
         z8s46MZlWFfv4IEY4B2LhnS5i4ZRnbNJ06aNagBpFbXz3Mg+NvTstAximZp+ChG2VWhH
         UodL/f/GlkgrKh/xIHah601Z7AWdwgdBohSVVUhHuQ+UDmxAg+rylyV8HO/xm2+0wlwp
         pnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766060761; x=1766665561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1kei3VviQUzx7YE5/174xV34BfK+CaqS8GVwkzgtt0=;
        b=V3U2MMwEv4vd68DrnVtvbklavG50uDjQHb/tlFw52vwfDJ1kYWCmJL6n3WG2NQoRCx
         mW72pymDqH7Qaxf30yRDzh3TwNpT5Z/LI0pgOY9aBsoGkhXQkt86y6pMzsAS07nGkQFX
         Bj2LUF1Rxbf5I0Jl4t+xD07sfTM77aaGwQRLGvdYYSaszNgpSTGP8opDTCCQfGUn5Dns
         n/IRbAcC1vZtR5MxnTfSjvTgbvHfITiNxJItc+5cHYUeLlpc2HABj0Rb87tRYc6Jma3z
         v8yxK7XR7G83tfEjzKRr/5wopvbWjuQL1u9pQuPN3HieEgSywcnZRikwDDAxGusXiCTq
         6luQ==
X-Gm-Message-State: AOJu0YwOpoP4Aa5ozgRfJqvETJE7R1OygegfNhgncNOu02xVNc7LrIuo
	j8A18OI+AXrKEJrWFVxR34NmiJlU4Cu/ilmf+QNuauHDafvuSVuN3rmWZPruK14AAoOeIqkKbVd
	rzYs6yolAgx+O+Cc7NdACjZPth8jrA/U+iQ/qThXH993qz4AvhI5ZLxaRBqxdBuuCfRUv
X-Gm-Gg: AY/fxX6t6/YccAe0lsw+VKXVJNrh8aV/6EhLDTPXcMb0O5i6RsGQF23BvhLsgMjYfMY
	ItqXmP/Yo/z38Gwutvp5JLZoi8rWDDKXV5sZHSF84538i/P2zdTVD/B782ExETLAHttBg8Qxg/z
	h9Dp5byyYDjOyQAvlPThvpHRvua1Fp8sEfN3x5MJhBFtFv1c7dsAMrKALO751hS6jjHd852mEnb
	uFN+diLnXM+npZ6g7lYeh/6T3YLrXYeZZ5Bf2DgPGtJZI7ZVpR9z4SXgUaSks231c2984rP2OpS
	f5SftkTmmHmC/2JTLBLKvQoOr8SlhLUOOqrQ6Iwfx5RPjKGbKqw7YzayqryjAW1pgNZTxDhWpWP
	y6eh85zpeE4jT3324rW6q80uqheaQFWySe8ZL3MXFGmj8mGPL5jVENvLKdIzhPjeoeg==
X-Received: by 2002:a05:622a:834d:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4f36108e8efmr15386801cf.2.1766060760474;
        Thu, 18 Dec 2025 04:26:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGxOsD6vYrUp/zDUbJN3vsyK2mh6VD2QunVUUWpY5pcH2SGoXhlbu5E2ZPMIl+YBcRjc1A0A==
X-Received: by 2002:a05:622a:834d:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4f36108e8efmr15386441cf.2.1766060759889;
        Thu, 18 Dec 2025 04:25:59 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b588b0b3asm2410527a12.35.2025.12.18.04.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:25:59 -0800 (PST)
Message-ID: <f86b483d-c674-4901-b2c8-19a535df4234@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:25:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-db845c: Use pad fn
 instead of defining own
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
 <20251217-sdm845-mclk-v2-2-7028c2d09145@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217-sdm845-mclk-v2-2-7028c2d09145@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BdNNsqBLPJclU5IZBvNJlH5ErALrDWAD
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=6943f2d9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e_nn8CCX7OWYOPDVI2QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: BdNNsqBLPJclU5IZBvNJlH5ErALrDWAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwMyBTYWx0ZWRfX1ahK4742KmgT
 SsRjPVdCIJGH2cYWSXIqe8eARR6kIeZG/fTGStJRlhkO4qn/ATvSEOu4a880ZQaty7Z4JAF9KPV
 ECQgxziaeLn+119o9DybmOD2ZvRNjQvAOe4XwcvW/JjDLI5/z0b+mccJepyiiGUA4cRPR0b2g51
 pZvgKQ9I+fV+RWrXNE2hWxF2SbF4PDiEF/mVVhC6md1cjp+BOXg7kjrQJrd8WKPjAyi0ZPkEoz7
 TVctr8NaugnEKx8Z3KJ3Fx0i8rc9isXd7KXSfYCO+oBtZDK2prlzd0dKzjR9HC8LdOxqPLWOPc8
 ombhjVs+iP5zEB9LrxWRTIGbFv7AgsKWuBK3IhTNs/92UrQnybceGJ8ziE7ySmSzz8Sj0xLajwh
 YI5YVfQzZrAHUvXpAxmSzJPUjSIfXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180103

On 12/17/25 12:39 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of defining own pad function for master clock, pick one offered
> by sdm845 device-tree include.

I'm a little bitter about the wording - the pad function here is "cam_mclk",
whereas what you're doing is inheriting a common pinmux/pincfg node that
refers to that function

[...]

> -		mclk0-pins {
> -			pins = "gpio13";
> -			function = "cam_mclk";
> -
> -			drive-strength = <16>;

This patch changes the drive-strength (16 -> 2 mA)

FWIW it's 2 on reference designs and Sony boards, check your
downstream kernel

Konrad

