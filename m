Return-Path: <linux-arm-msm+bounces-54454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E53A8A993
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 22:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D99941903014
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 20:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1920E257444;
	Tue, 15 Apr 2025 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iss8FBiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32DE256C77
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749998; cv=none; b=WXV0rN+vDMZS+jq9DNAhLnd5afqqYOgouNOmQZYzuwT5FSN6pOgTxXKfbRNh2uGe+FZIzs6tusrVjtAMzt1yp+yt44blWGfLisap+9lyVI/TFL5BAIpALwT0MuXHW0bXIXCpjPf4U4ib7Ak8/e2OckwP5Eh6M7WuIYu4mTqWfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749998; c=relaxed/simple;
	bh=vfr/VRykqbJeKWTK4pwPjRELlnhBE42z2Z4846zXLMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbFHAUY/NPvFql9uR4uPiHWs36c92XviRqyB0NvarX3PkT/LZAVYlnmagK1i+GO/5Tu43u6GD+G6+VKDyS62Rp74k6kTr+pi037AdndLWyVN1+bRdrTOSs519B0Nr3XBrqesUDrCaRQFqVh7RrLgzi2v9o42GPYYiAEo2AmIF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iss8FBiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FI25UN002488
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTYA/YX4Ow0hsnVmRfwm8pQaD7/pmsS8NyHfWH3V9lA=; b=Iss8FBiLOrFcd6Jy
	H0CURZTsJspn0Xsve+G0FX+hEIooHW7buVCSacyDgHIk/IAJT3uXCJmMusciEWiR
	7icmBl1QuL+O4MAIellDYSg0mLIOtUhBekSfnW1eeaaBGTVGPUbvqybRpKcXEEhv
	ZfSoBnzQR0dhmEzYlJfURUEbJ/LpfB6f1j625NDiimOzg/qEEeLdtIintSzAuNGo
	f7gxt6KPV8HpUNMrE7aUXKhRMuJbgMky4x8TUo7bSi3tZ34jOunI3G1d+gi7mHpD
	c0tbOywIPfJRE7UeNX1SHg8hc56bkUlIPFArdj331gFZFyA8FdmJo85NWgtZPE8v
	MsKTvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk18mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:46:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so141105985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749994; x=1745354794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTYA/YX4Ow0hsnVmRfwm8pQaD7/pmsS8NyHfWH3V9lA=;
        b=d+gqj/H+n3ICGyr3uR8tmN16z1GD+RkeZgyX+Ss+Z6Sg9fyUawj7xUS82wCQWzaLKM
         OCauk2z2AWtvJmNQXcjHCKUgoiZN4bqNlKiCM5kYQzJGMTD1PBGkEbi6/V4lg27tPWxp
         oe8l2vhDuTi3Y+u4cKhSZVRRz0ext6TjnjEmlpcJXUyZcGHIPlGDe1CCkP0Tfe7Sug66
         dNNRs9D1TIqUtB1YA/h5cPYSq66FmfyUoTtt4ejMbepwbpywDffc9syE89iOPNC9BizJ
         ZW6siHgk5V0AzGdOF/bL6vxqk/QbSXymWG9wPyR7Ry1PtxdPweFGs8ZXVASpkg9g5YZP
         HNhw==
X-Forwarded-Encrypted: i=1; AJvYcCXmbBpvz69gcwyDZXmtX01/JE8Cn40/7gY8q9Ee7PwjvPm78t1ARnCpHofxqZzShvNhQ9lfmm+1BUxfzLi4@vger.kernel.org
X-Gm-Message-State: AOJu0YxifwwVs9N/G0IzasnK6K2gs2q8iuspaIBZy6jehl7vnDNzWaXb
	qJLb+JZipV65XgCR3biN5r2F69995g1UkPuf8S30bXFN4YJg1DgyAmB7OWMmx5mWxfrZ0ptm4MX
	tYGGcwx0KOG0mAPjDW3tbXFnQ4OTP1jtv99cF/Tj8a5TmlqNZar+braxMwknzHGrF
X-Gm-Gg: ASbGnctpdqZUe6jrKdoQ13+qMOfWUD84XxyzYLh+h72KXPLO4fBqK8CKwNQJq6oRy54
	pBfcCyRS1zkOdD3ZHkPBlKUAEMlHKSUCb+u3nTRP3irtMcB5cdqOyDkc2liIH+ukuv+Tvyr8Glp
	ALY7e7DE0VQdqJVVxNzrkhmTUJOpVEMZ5KzqSOLcAWgekGzFPq08NEzlbTW4T4UEnJl1bJ7GYgI
	cK1RIZFCBr+/Kt4/he2pbtn2UXBB6j1OmBp9SWHgDkdrQnqd+xW1FFFbSoUfcFDv+IzwdLzaXOZ
	DaGZDl+TsJdOuzgrVwZWsHcBK+pYAkAyyUnbzKH67I9eGdDGMsu1DiK7ipkMytd3mSU=
X-Received: by 2002:a05:620a:2408:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c91426a799mr51602085a.14.1744749994199;
        Tue, 15 Apr 2025 13:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe2uVrJ0l4+MP0qlXvf/lUk4eaGJqZesswmBSmdDqzmucTn9AiaoIA1RcrmIUWXdghTgZOgA==
X-Received: by 2002:a05:620a:2408:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c91426a799mr51600185a.14.1744749993888;
        Tue, 15 Apr 2025 13:46:33 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee54dfasm7504765a12.10.2025.04.15.13.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 13:46:33 -0700 (PDT)
Message-ID: <d31a17f9-6aed-4b23-b67d-908a673c31e8@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 22:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: apq8016-sbc: Move non-console UART
 pinctrl to board
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
 <20250415-msm8916-console-pinctrl-v1-5-a1d33ea994b9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-5-a1d33ea994b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fec5ab cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=1t5JXeF_XfhXocsUcwUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fs2PdyWlVcGVinD3h2HB82UFxo7wHIrm
X-Proofpoint-ORIG-GUID: fs2PdyWlVcGVinD3h2HB82UFxo7wHIrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150146

On 4/15/25 3:52 PM, Stephan Gerhold wrote:
> Prepare for removing the generic UART pinctrl templates from msm8916.dtsi
> by copying the definition for the 4 pin UART1 instance into apq8016-sbc.dts
> Having it defined separately in the board DT file makes it clear that the
> set of pins/pull etc are specific to the board and UART use case.
> 
> No functional change.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

I think it'd be better if patches 5,6,8.0 and 7, 8.1 should be
squashed instead

Konrad

