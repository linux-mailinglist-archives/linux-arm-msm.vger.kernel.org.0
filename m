Return-Path: <linux-arm-msm+bounces-73591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75DB57DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9B92A1AE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6D130DD06;
	Mon, 15 Sep 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMi6KRQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472D931A55E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943765; cv=none; b=No4K7a3ixmiUtg5Bw8/zLKzL628Qlc9XRV9LoPBidhbC8gYBnHkVpTzItlWZN4wXEUg9WOWTNfLlJQVmcVEi6lB0AK4HC2ufxhfx3Avh5K03D4PKYl5jXyprTYmsD9My54H9gnPtefhd41h1mERhg6Ek0sHtaIDs1trtb19HHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943765; c=relaxed/simple;
	bh=nY+B3iWxUdqO+53Ff8OTtL2gOC9tys4ywe9XnxPl3pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2ZxKM9hgZkTxQrzPwICCLAGy2RLAXNv7hPLJKuMhFXXPAoo89U/RdK8kW4TkjybKHL6MH7bX+JgZX+cQdXEeLQe/7WcelXujJs2FRs/WWfGs4FSWH4OHPvNpXwTm10UyzcCcc4tkhlGj/8RGQj2QwyeKHcy+0WyB531iR46p+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMi6KRQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8G24j014503
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umjNBqAvrgVn/Uf+D/vu8WD+62B9lRTpRfb+uTwmRE0=; b=hMi6KRQwrE4cX7fA
	71Halunw8s+xG8Cj1s4Uci+WTEijX2/p9drAYaRP2Meg+MLw2ZtumbXtU+FPx/gs
	9gHbO/3WOsY74AVoEj8WEibVOlPgO9/FKYlGhLh/NXbx68D48+3pKv4MQPyZBG4X
	xQYesM6Lvm7uw4EfYOxj/IwwQg3tGyakQnRSwCkuO0s1X2GGHA0/DMeoWDONSK81
	w0C+cgcqcpIz1ttk7DLGjGPOvvOwWLEzwOnGL20UYhB9x5M8u5GaC18k3wP8mcpH
	rJvMPxDz59Al/THOuaT4IYqPECJS1yk/bLxhX1ZDzEdECPC2Yz2GG9P1cnDXZDpH
	inXQ6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr5c5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:42:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-811582abee3so51851185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757943762; x=1758548562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umjNBqAvrgVn/Uf+D/vu8WD+62B9lRTpRfb+uTwmRE0=;
        b=csUO6GVkZenGTTn31SPhuvlZTJvP2kNWzLo1KDFad0DxszlXydXqHoL5SJMgPbGPJE
         VlazbqDz2H1Bcq15QlVHxWJ0iXPUC77uHyvbD8AmWnh056ybZ9nXHqY0HceXOvq49xuG
         XlBkh/ExZ2iibVrnUKbgAA+mkA72fqgZwgYR3n8gPpUiLurI+MhCNYxzutPmfJrmz2Mk
         /dfPw4jt07dZ3E78/Z5vfc+JYypNKOwJA7cMsKDFKHiE5UMslSGPNwTNzCHO4UjDWvwH
         57b5s1L/KlPGgkeS0JGnQY0YgBznwwUBSPwF+EucHfBIOgIe8yB6FcOShJkVSuCXpv1S
         +vEw==
X-Forwarded-Encrypted: i=1; AJvYcCWtuYFCBtmoSBbzmeRhE7kRmPfOJ+RBlHk2jzr3B30fIYKgEwx0GMqKbVR8LUPoNblA8JcOJF2w/ID3nUPj@vger.kernel.org
X-Gm-Message-State: AOJu0YxM85oPLEhTEeBhQSZFfxz+EobVdFh9o/sD1BImd8RZ9970Qe8O
	/lIMEXi/gBnF4LYubD1bB8LXh3KkqjafNa2yUoXCGbgEmY8/GbG5hsqaseynghB9XfInAMxWmE7
	70amXsgKFblTiQqRUHsL3p3Jtkbf0TTwNJ9ZmKUSNwHla7FTw571Q8OEe2QyE4WzpzetCXt0InU
	jB
X-Gm-Gg: ASbGncvWf6TGmygq4J+yAdCIJaTX1hyg7zUgLeO11rxOD4elPuHej8emFPtVmyB75Fc
	xoj+64fNKoGt8ou1n6FDaT32bJf+qKyEuM8REm1gKO0oPAwVD43VFv3IMQxsMJGnLJQK8K0xhhR
	gvHw3wo9qlNRkrUu/Pc/9/lYOOT26bryfTfSYLCkDh5K01G9ap+NHEjTuaK/2loyB7oJ2+riknN
	Vmk4DdhABmIWzMTrR2UAh0PGZoG7hn0ql9cfD/Duza7Vwc1w83R1ZvWwR4olAic5vQD27iRK2pv
	Vv3PWq99dREGHAhNsIRFs1pj23XVX+3HFgoOZSUpLgW02YPf2iBRzmIaDEQ6SDFwj9J9ZAmdtWU
	TEX0+pdg3kiAkywT7UeagMw==
X-Received: by 2002:ac8:5d50:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b77d06eb82mr107913081cf.4.1757943761875;
        Mon, 15 Sep 2025 06:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMieom0duFgTQwQgXDdaD7dzvvL/ronB0yG2Mh0a+jgIpaG3E2ChM9WS6en3jM6N1/9TNSew==
X-Received: by 2002:ac8:5d50:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b77d06eb82mr107912781cf.4.1757943761171;
        Mon, 15 Sep 2025 06:42:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32ddf93sm940209866b.69.2025.09.15.06.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 06:42:40 -0700 (PDT)
Message-ID: <59f77780-b81e-4d09-b949-a62bf029e7c4@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 15:42:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Add missing MDSS reset
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
 <20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JKgn_mqPlXbIhodX4dd7DLMHrfWkiG0M
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c817d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=DXmGxE4PG6Zmd65NNY8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX2nt8/EukoT/C
 b+dbOX9MKVREd1vYGe+vhqPbjQ7SJHf2/1804waSSD3lwcwzFjtzAS+VAUzIU4gFZuzgQf6NNdC
 QzuiVv67AT6nXn6uE2qV5wOJa/ubcR9RCV24dubh2LTqNcdoYRy503wnze4ITnzWmJkf8XfNohg
 XqA/09WTD2PrrCdZfkx2zAynuJ+D1k/LB8TGX4WSP5DTct9RZRhrXP5jlrU7ezp7/E7ev0C6jKO
 WmbOKDj9egmBhTo+/wiYagdFCr/q7JWOr4AF2pFrLkTu/6OC/vODS+Vu3oizgFlAjr3YWKBgZbc
 TkrwDnlFIG1tpc4c55edaDCRDLumD7/1NaSVCbQfYPuWJZPUosFREHREV0MTEclvKVwNdLnH329
 g+XT9yed
X-Proofpoint-GUID: JKgn_mqPlXbIhodX4dd7DLMHrfWkiG0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On 9/15/25 3:28 PM, Stephan Gerhold wrote:
> On most MSM8916 devices (aside from the DragonBoard 410c), the bootloader
> already initializes the display to show the boot splash screen. In this
> situation, MDSS is already configured and left running when starting Linux.
> To avoid side effects from the bootloader configuration, the MDSS reset can
> be specified in the device tree to start again with a clean hardware state.

This is really just Linux behavior and not necessarily the effect
of specifying the reset in the DT, but w/e
> 
> The reset for MDSS is currently missing in msm8916.dtsi, which causes
> errors when the MDSS driver tries to re-initialize the registers:
> 
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  ...
> 
> It turns out that we have always indirectly worked around this by building
> the MDSS driver as a module. Before v6.17, the power domain was temporarily
> turned off until the module was loaded, long enough to clear the register
> contents. In v6.17, power domains are not turned off during boot until
> sync_state() happens, so this is no longer working. Even before v6.17 this
> resulted in broken behavior, but notably only when the MDSS driver was
> built-in instead of a module.
> 
> Cc: stable@vger.kernel.org
> Fixes: 305410ffd1b2 ("arm64: dts: msm8916: Add display support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

