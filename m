Return-Path: <linux-arm-msm+bounces-83985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F54C97BA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CEDF3421BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE925311C05;
	Mon,  1 Dec 2025 13:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzXRc28r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iyf7MYT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595523128BF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597195; cv=none; b=DjAIStpiWu6SErGT+rI7vFkBmDSvP19kXGwy0vubKvtUtH+Eb9a4O9bZz9wm5GH9otBv/wdA77b1Oc539zRPzMj0ATv9yMTKHvHmFy4Z8gm5VHGLEsF0NKbfr6yIY9VUxTs6pvNvbPaA5XraQLKLaW72wZhsH58+Sfz1JcMszwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597195; c=relaxed/simple;
	bh=Nq+G3avRDSDgJECHICzai2G1D0ja4jtll3UcIZCR51U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/wXvROj3Tar5M6Uowo2M6sSkWrM46Z7Ut3hqFMpR3bHrUWIoNdl1zoawh6sV3cU6QO/CKnINJ17tIfFgtJOG7Kaa7aslY55Lu63l+LijNYkB86oa0Wf16DpK0HdojxC7k0F6kAfehjcTOzkG+b+jPI7ojEgAIAXTC644iZjCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzXRc28r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iyf7MYT2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B16irHM3689426
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5MDGNBDVHdT9FzvIqVGT59U8KZh5yYJvovosLmlBeU=; b=UzXRc28rQr7+5GY1
	OehBogeEHf1CErK/dPOD1cmmw3jWHLe/0qV0eIHXgdLAx9aIW1bDWx23sFAcB8oI
	8pgNMCfMVQZdZ+SdEPyjDnbRi82UqrtJmnYW9v/+XuIAykNXpLM2OhL+ZhXZHqBe
	UmK5H12a1VlHP8lYpAxFs8KxOBVRXoGz9Mn+jlceRgHoQG7fwWrIWqfwVm9ROy9M
	HoKvLtrrgxfSxi8IE9USQUz5NkzG3kMRRWwWzd+2IPIc2U3gLFIYfEw2wBv2SKB7
	qJ89ynfHCoigo8AEJND52TMwoeZ9H1npETAGzappACu0sER4LcJs77SUp4CUCJvg
	Rq8ceg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as61418d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:53:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6a906c52so7646711cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764597192; x=1765201992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5MDGNBDVHdT9FzvIqVGT59U8KZh5yYJvovosLmlBeU=;
        b=Iyf7MYT2nD91p/ckWTerFpa/uccgOTOmufF3HFq8A/3gFBAFD0ddeuLc7zQS7MUHn+
         9Khcw+4J+Joga/+mF9UBais4yvPAeqAoM6u1l/NODABxCJbRZLcUCG36ZQhM6eAdU1Aj
         k2+e1TaLMftPq6K23o6KaNWlfks4mA8kN/UFdBtf671DmcsAsjsIMddHwAsmjd+9gZqe
         AXMt2l0Rn+LCRyForSagDCHRVCpFrP6JYut8MFnqnQNdWus+U5595DcsQXzgU5U9r7Gr
         GFL/oVAPiPVW5DXbkVVktKnxXGELSR/tJMihm3i5OEEa+HsBoUeTXXAK0kVCDttK687v
         2Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597192; x=1765201992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5MDGNBDVHdT9FzvIqVGT59U8KZh5yYJvovosLmlBeU=;
        b=JeDRcuJcjFScg5L8u10KxH3yur/n+Vl+yMGRY7vWUjAYqd3LeQ2vi0nVzwEB6LAW2J
         oVybj2i90+5oKLeyk1hNgNdfCqym/kk1PUWLUzBZPFnghmWLOz0gD4ZS0KjnywRbkJzp
         bcO2FBZWG/zCOVEVqdM6btcahRyv8K/VbZmvfSpU9VYxaD5dK+NOEB5N/ky6N0dAiu6/
         s/UxGJHhSn0M50GaVRNyiPp1hf46XpqPJTjxugJDiQeObXGamWDy2QkB4IZoQI4aanFE
         x8ZJUj47OcAjijo6XG0w9ijpeQJ4NQsWrezOCxByUtsENVh/tt/r+ADKZCsss+Yjefen
         G3KA==
X-Gm-Message-State: AOJu0YxjjfKwlGKblotov4f0xCypKmI8SJDSgFRnz0PlxXJP+R0xqy/T
	iDMU8CuA26iV7emnELWIVIGjGlbSn/OaTtotIsbyY5eK/oZLv3J+UJfvNzYoLrNfXiTNWZgVSS7
	CmYsxg0FLwKjBJP5jZCIxyCPk25Vm4NeJRvu/0jBYHZ0wpzLuXxgWVALOJxUfKi9CTcf/
X-Gm-Gg: ASbGncuzREK8A+yHqCgsO8x9zrJagmqfOw+Xgp/2Kavy6LiSoE98hwGfqwsyhX2yfaT
	g0LaovwK4x6l9PWUfTCy1gnzEoS0fDzHkDWKwJ5GjDDoz+vFkVrV5J9Nf4F7tMck5TKB5s1V0nR
	sLxrcr80RyO1DH2H+my+OBY5V17LEkwjOz4n1b79tQw7i7n40v+DnwpV5nUs8S7BsYpf5Oa6tec
	JUUDeVbStlS8gfCVDkAly6VdyHvE5ancWAu7LWbRyHIsHlqC4hdha0h1XrWeRsw8sqcthq3xZnQ
	khQsWCVR8sHlfK4+9pf4FcdneUColIXlKB3TQ43lce1k0okfERVApsnUWRoYbFb35XoqVIP5U1l
	+vSu2S8MxW+WLImhoejQ1PUCKRNjhD4qKS6zKB6lHVXYS3dgoW8jmbU06mVrZAd9NhOY=
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr391677041cf.11.1764597188807;
        Mon, 01 Dec 2025 05:53:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwzqYjN9xLAgASRb7iVSQqOyCv0TQjsaBpUSAb6z8ODxHfZUAAN+UALIMWqbYqGWJWD7EkkA==
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr391675081cf.11.1764597185974;
        Mon, 01 Dec 2025 05:53:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d14sm12615163a12.10.2025.12.01.05.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:53:05 -0800 (PST)
Message-ID: <259a997c-eebe-4361-9043-676d77ed85d4@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:53:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Represent xo_board as fixed-factor
 clock on IPQ5332
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-5-55127ba85613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-5-55127ba85613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692d9dc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yS86qH7rw_eMqjCuMg4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: oYFoqNZPRsODyAZsN9dZZKFJmtv5v1YC
X-Proofpoint-ORIG-GUID: oYFoqNZPRsODyAZsN9dZZKFJmtv5v1YC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMyBTYWx0ZWRfX9l6quLtMoiyB
 nuDSMXWyJGfZ5nLTZWoVocKrlHW77bQMbxnaT5kfLTuAZ2B48cwwElVW9pkRk5MkCinHYalXjM4
 YoailyJki9xVrFW5tJ4xOunBq1gCxi6COlfxryA5orzWiuf+Mzz7nViYUuRdtkTZ/mNZMIJoNUr
 CZsXwlv1GXsY9HmB6IC4/iQUzBi4TtOPBFope+LiEnOnsF8rooU5GdiBsW6/PabUEWTZpWzHvGO
 PGx2vq2Iwj3MxYd0r9dCQjH+Lr0z3PTZGBNkYjnWLbk4b4c7kFou33fSdrQNNYmwUW25uCCe42n
 JWlgh/6+lyLMF7S2i8ma8bl55W22DAdP4Yqq2ltRXWAm5ABpxUAPbkm2VsG5jJANV7zqVuDVRz0
 8MTFp7J8kPcBdYtXnBoa6KQ3Md264g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010113

On 11/28/25 9:40 AM, Luo Jie wrote:
> The xo_board clock is derived from the 48 MHz WiFi output clock (divided
> by 2), and not a standalone fixed frequency source.
> 
> The previous implementation incorrectly modelled it as a fixed-clock with
> fixed frequency, which doesn't reflect the actual hardware clock tree.
> Update for fixed-factor-clock compatibility, and properly reference the
> source clock.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

