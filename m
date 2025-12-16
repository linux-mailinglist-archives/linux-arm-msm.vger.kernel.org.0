Return-Path: <linux-arm-msm+bounces-85322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98FCC1AF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 10:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10E503011742
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64FC3396F8;
	Tue, 16 Dec 2025 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUhqv9nS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZ70GUf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF02F3622
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875860; cv=none; b=tsk1+0bIS2SJUFweqpXR3H23M0m6Tv46JCLTIsK29jPs1AfgCNW89U+7eCYjiMxOIOwQic2PHtEZ2yfQom8SBBc7M+NzjuKJ3p1kTDua6MhtPJDnjhh/tmbbIZ3yu+JE9H89PALUai8jibekN8XS6kap8BeZARyDbvgQhmtWnRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875860; c=relaxed/simple;
	bh=3XT/0FcGB/tV+4GKPwRgKdrInL6MAJD/Ux2SBaNPymA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8baEIB6lv6/Z+6Tyt9JTYEK5twr/nxLLDJ1JkmMfjVhfswYhcTYTt3xpvE/wWaHqJYRvfOq0lUkaoeFdROwpMe7wRXQ8NB8cI6U9X8awiZjf0G0JjqSvNaH88bQMkej/7fIrsOtNgggp59SjKBI2iodta0y4sdhj6KS9C7LDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUhqv9nS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZ70GUf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG65PKP4174108
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eTtNWs2HtU4CllgC4so4tlnbnYLGXXoz4SXM7DbLkQ=; b=CUhqv9nSMKxquEoe
	2DSwU3pdIG5t6Jpd+lrNfvWEQBRscvCzEDP7SwNm7F3m8rPSV3YzYaeGSWEMmB5r
	Ngje9YmTXI6FSj2mYYKfepQX/Gh7SSSXt0lndBhx51kBMOQykVYxkx4rj2rj510y
	6PAvnnAGaWnIflq9ucMUuhS59hKVMLZcg6BQAYwAcEamqkZhVXI0KOdzXmLGSS8q
	bqw0Fx9Y2eD1LnQX8EFtuqHETRNSuyv7K8/Eo/TwjHkhqFSzqdWyRBICfIP5P3JU
	PRnXG9BdCrVVWqXoZjsowoCdzBkw0YPGCV0jo4J5CKTx38SnbMRLGfNQOOn70t7p
	0z2XHw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks03nc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:04:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso2535605a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 01:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765875857; x=1766480657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eTtNWs2HtU4CllgC4so4tlnbnYLGXXoz4SXM7DbLkQ=;
        b=DZ70GUf0iVlVNGVx9d4YWVxz5i6E8z/fYhUsXcpmrNlpbCjGs9jztUPvZNw4uDUG78
         OFtfcQjr+Md9MWF3xokSPbCEWRen+1Y21+rYTLNd+y1LxD3AzTzJNvZgu3P7byV9st+C
         u2y4dPVSCKS5nLN7ypeiojSgCe+cArqF8zBwfiRArSmSoyQ05LYWcouSKuXh4sktpUsy
         sAaH+LlveuMrIxhwWB7Yk/TQgcf5lG/OpYCyrF34gMQJfI0DXWKrQCX2juy7lajufLic
         71axWElsdRq5fcHzRHj/RqEYfRnyqb7YIb7zoLmTPT/ZdG2ftv0rTT8txcbkAMGikCnQ
         Fv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875857; x=1766480657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eTtNWs2HtU4CllgC4so4tlnbnYLGXXoz4SXM7DbLkQ=;
        b=HGSPoq1WMadA19+WyfHH+0SyvHqnqHxO0u8nQQNtjC8hj/rLIz6/tkF27hafD7G+/C
         aLhA78f5pXcoQyJZKZxzF0TgO0D8mACJ/AZ1rkZ1Ef+3E/PeoJTB1ceJetw3pDML4fjk
         m7caEbap84YoE16qbQvUijczRTN4QRQ6pYl21fDaD7r1X4+jhg09EQylOJrJVePVpGp+
         vRFFcnndRfqmF1IkDnVI7bk1g/VHD3Bz8KCWGLm3kOWjjCsfD6NlkcK6I0QwTtaUzCnE
         L3g0SoZ1ViZK3jByfnHGjN6mtd1PwMZTUZfFnYZ8+uXt+/ladCOtmLq9/03zeyWultxc
         wY1A==
X-Forwarded-Encrypted: i=1; AJvYcCWa3yeUKxENHVsOMvS4qtymABzFJjYReABwJZT37f0DMd8I1t2xW0mWQ7DwOesGsWjinxG3HZ+tWFZSxQ13@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbjqrZ6wcd1mWBIoq9BL5ifMsKVecLo9pGsn5vRjwLxHOv3rE
	wst/Jl5cW7iDZRxtZGkNj8ke79tRMZXnGG8RayrELgmmr3SYC6MK5smQRHdXMQpap+gXsORbQ5Z
	JCO2/+wfJUNSSQm0sIePWEAEwrKrGaYIECbDsbeTlz6Cuzp4pG2koxKFaSMxKrwOLjvqk
X-Gm-Gg: AY/fxX6uL8IevuePBXnFgbDGIPUSyBb3ezFljAemAbBttU+ICibJG0RkKw5dxUOyfMv
	4GUaasqjE/IlBp4/bhUAlJvKDKNN/xyRleioQGSW3Ty2NDkcZ/oyZRhhXItSRcpuvrIfq5rPcGU
	4FjDgkR5y6mIP5QQC2psbU2q9v/um+V8McMSmw/88Nf1jbflqRA9k1Rc7f8P9wK+sABrmG5Cw9T
	fssmUooCi+yWyrV+32OsO1lQBnzMfyAiff6ZwlrGOLayAOiN7dvNjU8S2Jr7Rc76PKmGBh6XEfC
	/ZJeEFuSsxdeBqbSTYA8+2kRisYHWtAN7rFIL++IZELpz0QCBJpqpW3H5ImjmNtQ+7d6rf5Mnl4
	/no52ks3nPRVKIEOS8KN+pGC9SESlC1bQCzA3sadkiu60cnrtVF+d2oA72WdlQwqUAem1dzyf7S
	ilpuMudkwe6/MEbVwtYVDmmL+onEw=
X-Received: by 2002:a17:902:cf05:b0:2a0:e5c3:d149 with SMTP id d9443c01a7336-2a0e5c3d2c3mr69128975ad.23.1765875856687;
        Tue, 16 Dec 2025 01:04:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd0ymq26RHV/DEGI1h2UHg5v5cvqbPfhHWyklfp8aadTGhgzhs0xCn74+G6Y6A3S3BFC+kTA==
X-Received: by 2002:a17:902:cf05:b0:2a0:e5c3:d149 with SMTP id d9443c01a7336-2a0e5c3d2c3mr69128635ad.23.1765875856144;
        Tue, 16 Dec 2025 01:04:16 -0800 (PST)
Received: from [10.190.201.184] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0b465de71sm76633145ad.41.2025.12.16.01.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:04:15 -0800 (PST)
Message-ID: <5fc90779-6792-4cc8-9428-57b38e53b64b@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 14:34:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZiTshAatiANdJQBvIMGZglCj4O-U_99M
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=69412091 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PptT_Mh96ff8s3TZVEoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ZiTshAatiANdJQBvIMGZglCj4O-U_99M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3NSBTYWx0ZWRfX0pU1UlVyzN3I
 sSGvxKhXvP29wMP5kd6I2aPcWe5EUyDXQ53TjmaJyN3PJT3nHfMgNtQOrQmdo9QnOelFljWac9B
 +W5o/Vh9VwOJqU1ItHJrIa46/iRd1oBznYmXGhPSij/kyl8SF/rCooeF+Sogk9cvMKcYyZb2L9I
 dgsHVwbRM+KzmNzhq0TvVED5o9Yv6RBsU5JHHBJU+mf3uPgpx1dZ2v0+gxDJ7xuKpI8xxpD3fgJ
 oJvuBVN8LlJQXU7r/qUVLz/TDOkjVr/nMJMvbjbRWFvcNH06GBp0ymkJQBqnItG8sOuFUCDrXVK
 m32PCJV6h2xUWhzh+T+BttKdHXtvelL3sojMi224oRa79PKdxybJ8Z2li1559axHEUCjM4LeVAX
 aDQQbKBAbk4bh5Lifi6qxn/t92Tpkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160075


On 12/11/2025 12:32 AM, Jagadeesh Kona wrote:
> Add the cpucp mailbox, sram and SCMI nodes required to enable
> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 73 ++++++++++++++++++++++++++++--------
>   1 file changed, 57 insertions(+), 16 deletions(-)

Reviewed-by: Sibi Sankar<sibi.sankar@oss.qualcomm.com>

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi

