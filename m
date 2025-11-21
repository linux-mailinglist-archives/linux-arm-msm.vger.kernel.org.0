Return-Path: <linux-arm-msm+bounces-82863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB67C7A381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CEDC385524
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD0735388F;
	Fri, 21 Nov 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPTfl/ZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfIJNBeZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1333CEAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735279; cv=none; b=IDPx1wYinWVRh9v6E/o86mEF0hJWlFSH7IhqW58s8/xwzg7aX2Ez2N9M071aelO+kuecDAO5UbeRlRanJfEwQCg7rrX50NJedWTVSPi4OF9G84eIev66K3FeGajC2lY0r0Ru/ZzGs1I0HuciJfCTGR+pgY7bbkzBnBF8mID+hvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735279; c=relaxed/simple;
	bh=wUkh/mA7UXzEpu2dfAzT82Tp3jTQmu50WJCMbHGKJbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzccYCGdgOIB61I7cV+G3DQMnoPyebZNHoNqmdtkEIQCIjFLGWgvo/9FJZWHUtMOS9qNcGgW30o8BIvsWWtw/mTI1JbHUAyJI5tvHNnMrdapTNgm4AfUw0vFQgDGdo36iyUaLG1sLS1k39Sno2435lhjp/sCmXpK/R3+hCZpfAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPTfl/ZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfIJNBeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7qrbW1390836
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNvNNydzFcqtzPPQd0uumLEbg50M+dE9GK8gmZ+m4YA=; b=UPTfl/ZSd73ms0fa
	XCu0VJF47+3IEUzEpZWKr0/TMhetX0B20awXHYlyBUeHLgcynnlkWwZJOKIth/Ll
	aB3uXyjtLygbyXA0FnRTmTtoVAmXN7AXBZsb2wvoUIq/Kx8mReUMhBM8AhkC4RxM
	FtCUbxE5b0nqeOqqPYms5HxVv1DKKHSNrnGCn5y+KzQv+nY07VCYHpc2wNs8PKLK
	QnFl5vF165Xe2kKwS40nvV16kaTcW+JqmIomfQUEptz085m/ApfKRFxZ/aMhXWSN
	QIunUxg082efyFl0R5gwAIZt84m0ytZxg+VW3Dv8lyu6+HARwwo8do0ml7fj3QPq
	fQu3RA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb532t0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:27:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so27486185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763735273; x=1764340073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNvNNydzFcqtzPPQd0uumLEbg50M+dE9GK8gmZ+m4YA=;
        b=JfIJNBeZ4+jME/Uem8H+Y+dyESSOgBOWt0NY/P/RievbwgGkfz99Ccl6bfV12roAYm
         Sy8MPnFlVJaU1SJYifPTm3irdeP/bgbqNNREg1MTI+yGN6vDggBoMao/vqewEVbDZH54
         75ywObn8qJSkO1Q+IjghImziZRabalk6LK4+1EWm1hKM6mdQyYmUgKamnbkRcvAvFhY0
         AeZiAULh2LzmF1+7+MyBc1SAoZpZPwotqwxmtCXX1lsFdVAmMrfxQWgRBZe+8aHMnPm+
         7UJs8qknyq+bWIwL6dZjp295T9VgtPMRCN+7Ca5FpWp2bF0y9o3SpXWOYy4aTKMtVrXj
         MRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735273; x=1764340073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNvNNydzFcqtzPPQd0uumLEbg50M+dE9GK8gmZ+m4YA=;
        b=JjTFjCbDj61QEuCPm9LGhJ2auqFbxNTkfScmzoyNBQpyHsf/Y5kSajEpPR5XXJj6hS
         Jv3Em1c4/wvhl6PIMMkLiS6/xO7OLP3sHpYrgELHKKpJ2Oc3Sz49aZ7MheuX2CZJn+0o
         4h/2KpI1IlWz1GxgZGN+4+CNwUTRCDY0Ub4fQpD9BRy25Mjs+c/FzkKnGZBMO2jyvA+h
         L78HtxLlr1vHVRMQHa6NtzOziLxcAuK8wYbR4cHLiDwQcN7I8WSlORsXRGgpSZLYbRll
         f7jnmZmq53LZwmJWuTKDVSmWQappJxe6dPyOibq48cbr3njO5nM+piXVY536bD7xRWTM
         6hkg==
X-Gm-Message-State: AOJu0YycfvV40AxXZbWdNHP9A7jCEdBigmSoucSlOFFDOzLynJ0488Ao
	7Ba0sifCZxdzz0fdRX0Mz1FBJGq14GC6odXt02FqjuxI0MfuKSBABHulupgbR4cBfaWBBOdlWWl
	kHPvpyoa7f/H1+NCa/8M9odYziVXBooCUbX0Z7lVVVHApOGbxK1lbm5qYSb23OdYij+TP7OH178
	eP
X-Gm-Gg: ASbGncsd3nQG/F5MCI47mjojCAWJb81gcoe6Ie/yANNFgD7mKqB3mCjJCFgSRHY+E/h
	oEYmCDDnKj7V9BDsgqm/MRjJGR2lwBxtm+zRxxCAeYN+UJwOpiNWEQOifB0hS5aTDZUVeI6V7n3
	NzpSK+/0NikEW0xGazyhg8vHQ/fWuRdpU8NRYQE8vRhRJl18KBEj9F2qKGYOIj7YkguAk38/pON
	JjI1x/25ww+6IU/AS+mJvoP2+VSm93Kdiv8iwP+G+OTJqPeec6LVThG3ZPrkbQ/Re65TW1CilhW
	45hoyI1YW0TOclNoqS6FeTikK1OXlZNrzIkRpHR/NzMWxlh5+dg207kBvhHXvdzDj5JYkKKUWU7
	TkrAEdDJZQnL/gKPhTfqTZ0BWsPwM/LrnevcFPUtGS+0luotfN/hNsa53hbLOKNTnFqU=
X-Received: by 2002:a05:620a:3190:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8b33d1bdc37mr194450085a.2.1763735273228;
        Fri, 21 Nov 2025 06:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRmFB1GxC6Q+zoHdmsKJyIPaTMFy7R3exQ75WgnZMbkuvFthtmdv6PD5GBKDlm/9diAPNtlA==
X-Received: by 2002:a05:620a:3190:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8b33d1bdc37mr194445185a.2.1763735272471;
        Fri, 21 Nov 2025 06:27:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4f4esm469143966b.45.2025.11.21.06.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:27:51 -0800 (PST)
Message-ID: <9115c560-45f3-474d-8290-78b44f2b2b35@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:27:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ARM: dts: qcom: msm8960: expressatt: Add NFC
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
 <20251121-expressatt_nfc_accel_magn_light-v2-3-54ce493cc6cf@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-3-54ce493cc6cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5XPV7v-UuRBBkgV_yqLksikW59eSc77U
X-Proofpoint-ORIG-GUID: 5XPV7v-UuRBBkgV_yqLksikW59eSc77U
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=692076ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=INxY3ozUAYpN26jWuhcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwNSBTYWx0ZWRfX2w0zfwGEDsuX
 YGsAdFoUvj5Y/9ZiwU5X7YGsapsbcSygdVeix7ngKkMXzZ5I+v3/kBTIlQPHADHCRkMcSc74Ekb
 yjRkZTNTHwCjA0i+qcbM3adIcM08reKwYmN+Ge3fKNRxsRIHO/KvKmeEczikbmJLv3VRLuzoiQN
 ENlZFYmNsftiQlGr+kJqymHrc3aoXppY+YiET+DvI6feOz4Mnurz7G8RoPQ4Ae66gzgRBBRMixT
 0ylmEEdbImpBSV9ajdZAzvRYqvQQgQAPM0tSNpWwwfThDIPvBMKHV3LmnpkXrGc5/lUE6MoiU0u
 dhTljhLEzaV4rEWa9dLr+hTT2wBsy1VZLK2G36t4Oc1NZL1JpdPixS6LXkkW8Io6ybhG1rVGojy
 Fv8d7rCBKux4GuqfmE3x5ANcEkiMng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210105

On 11/21/25 12:44 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add pn544 NFC chip
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

[...]

> +	nfc_enable: nfc-enable-state {
> +		pins = "gpio21";
> +		function = "normal";
> +		output-low;

output-low should be unnecessary, since there's a gpio reference
on the consumer node and one would expect the direction/state to
be configured through that

> +&gsbi7_i2c {
> +	status = "okay";
> +
> +	nfc@2b {
> +		compatible = "nxp,pn544-i2c";
> +		reg = <0x2b>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <106 IRQ_TYPE_EDGE_RISING>;

Sorry for not catching this earlier - interrupts-extended would be
"neater" in all cases

Konrad

> +		enable-gpios = <&pm8921_gpio 21 GPIO_ACTIVE_HIGH>;
> +		firmware-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&nfc_default &nfc_enable>;

property-n
property-names

in this order, please

Konrad

