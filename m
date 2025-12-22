Return-Path: <linux-arm-msm+bounces-86185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A74CD5673
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E788A30528C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10E7314A97;
	Mon, 22 Dec 2025 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqdMhbHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQR3m7Ke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ECC3126AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396695; cv=none; b=s8aqKUDJO3MsVa3OsdiC0qQs9nXw84YGf0C/arKaZXqjxOeHVhSbnwF+A/XVgC2lVUxaTbM+B3e7x8/HlI5lCF5fE3V84u1+EysbvpRS1L4VcfnuLersm8kEMjxYgRy3BPc62SXam/u9uD1F8GqmhQ8Nns9YpERDe6KN04rBdnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396695; c=relaxed/simple;
	bh=gDeZuqsY/mX4JbrVYw75BFZuw+PuUzU/ico42hhVLSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xh+CULA9R4GQPcnzcX5O1XQjPcR/3/gOzvkvMugbQRNQvQciISzgGALPQ+pGSJt3KVOnba1DMVeYwH/j6/qEGpPj0R7ybi5zPfDbquV55phAxCwV6J9HlCZkCTJjzagtF5o9A4FDKHSyUIVNNto/hcfNRnmQ7CUahQjPT8amsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqdMhbHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQR3m7Ke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7tvfd3732860
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+AccpGqqHKllmisBF66RiETa2U03BGY3xkaEIHS4m4=; b=MqdMhbHwNJ9aXyzx
	UbdszCFY4nclcAoKxJYjiZ/lPp5u21/7AkhlaxK5Uk5Tc7g9MdQLJ35agie5CgAm
	t5HJAFoyjZ3QeW7TjvweZ3L/poeIu0q8CROuRcEJ1GSJryxOYoZOaN4Hi6g7sgZi
	b1U4XPkooX2fM6BWk5aeiZhsZuVeIUnWOZdViSQBvtoXU8hRaN20xAQTQLto/u4N
	3A0N8CGU/twObug4ijdeWOj/oEgB44DMBG+fDntc9oPOpVrv3OJinA/dCfPkoJVk
	LypJLoQNSjDjZpMoVdCUk3os6otcZkygbA3bF5CA/XjzeX1oG2EIASFXN1tg/rfF
	ZW5X5w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtchvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:44:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88fce043335so4206526d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396692; x=1767001492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+AccpGqqHKllmisBF66RiETa2U03BGY3xkaEIHS4m4=;
        b=VQR3m7KeROPlsi/DaJg3Yu8xIaLKoGHlB1vHvzgP9cFUKBxxZ676vrcF8t1bqzrs3a
         VSKM70N0dfN7Ov3Twv+6+loGm1tz6qK+LNTDhQbZFfTMY2M5+0G2G1sMNtZ85EFA59vo
         mjve8GsGYpFINb8b9BeqZuxe2CTcMbFBwNjTlxBaiPmFVsiwv+Ht5oP6vaDNDQdyWliF
         fLgNrTtvmV12pWp4jU8k12nltUILP9DwuyWkFP2bFkZxjGHeexYeyJdqHDXqSs36dQUY
         zObQ8yeDTxBqHJDCiEVuXIsvSglkJpYu0ES7hydg7sxP2+w2GB3gv7iPxkHGp2cdy8Nc
         ZBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396692; x=1767001492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+AccpGqqHKllmisBF66RiETa2U03BGY3xkaEIHS4m4=;
        b=Wvi1RW0l0rclk2SHXF89KReEoZBgQzgNoAkktozb93spSaP0rxCZLXDufQP86wd40j
         nBxjYLiLhoTmdn7JfatIK5dyLFJCftZKFdPvhZkGcIRaGKkV5iC7sUED3EdAvfbIfqtD
         yajKuju+i3ppDKlol5lJIZKthEBsKZvH0+asqf9AT7aHkUtYrzS/kP1xA258mMupb4Mi
         Yt7ZyBi9nLDSLv9pTdLPxfLr+2ENJ8HSxcRj47b1DXFjIFSgl/LrwGjfGwT9zBKYQW7K
         Q5Ewyb/AViVbfbtdun4l1eh+0S2u1/E+PSV6W97P4qKyJIsIYMM+dYp5qyTtf5SJw/Xb
         +Wqw==
X-Gm-Message-State: AOJu0YzYTP4WaHlMAgYO0fSSpqYqBdLiLv9bmMCntTsZnZXM2k7imhQP
	HJaTDXrl8AoTT8K68MBTNfqb9x6GNWhMub81Zyb3FDCPkoLITIpMcEWZGDqF5iFlquRobP/7U0B
	wze7IIQprlvP6GY+rScNnvwwzGlyBcoIxJrnlQeLLp/sbC3gJ03SRwclDOs6WgY29nD31
X-Gm-Gg: AY/fxX6WsFWCMK3h8Ml7cA6vYkyKmwwetWGpocer4COETyesDsIW2x8lk5dm6dIfpMf
	1TnuC4XJTkRt10ELHRpYMeMrTxL3MEYVDLxMN0evyhDTXfLBjz3sbQfutuRK+aqmImsgeiRprfv
	KZxVR0puMM8wUM3zUSLjTkeLP7hUQsQ/ovYFShltpF1jI+2ih/btWt+E7pFYUY/EAewU2SPVYwO
	Q8rqID5Gdh70Iv/jCMgQ3vatIQ9BtxqhM+fFE5P++f1wfB8UqQ0j7yHMni5SAwbAuAa0uF80lAv
	EqM89ugXjJu/9OoCOZMWq4mTvNVaR+34XvqBpi9c09ExxnCNdMgad5eZiW6A5Sqle0x0hUjSgPS
	q5ermjF4IJZtZN3X9ie45EbdWmWin0ocud896A02p/e8aTM0kJndm8TtjVVx7wgiMKQ==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr119886591cf.0.1766396692387;
        Mon, 22 Dec 2025 01:44:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGciiC9QJQfTbMMl50jGBWxbytT1LIvE/yMa+ImnNP8FDTauhEpA+iM44pnGXH17N1WmOVHMg==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr119886491cf.0.1766396691967;
        Mon, 22 Dec 2025 01:44:51 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm1033516266b.67.2025.12.22.01.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:44:51 -0800 (PST)
Message-ID: <76fcf840-e0ce-4647-bff7-4d2f6ac09777@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:44:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add QCrypto node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9gToDgmabyeOAmowUSm9_bBiJbKUPymr
X-Proofpoint-GUID: 9gToDgmabyeOAmowUSm9_bBiJbKUPymr
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69491315 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_OpZ_5cEmvcoVn8VV1UA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfXyohjbgdr5CBO
 mE1PVWbtnhnwJanbIRTrUC8qsA6MOnLwC7HvmDQ3CIDl+1pjzOUNqNG0Vpu7gQVuWaI3GxCgCKr
 lein4z51Gwf6fbd9CQxtKfnkH0f+uku3cS0rtA49MBfrWcPju6B/4Ku7L6+laHEKaQiaVQsZlVR
 B2hVwJfD2hugow9B9XUjVfJmxzqn37I8q4kF5cap6fllArv0hac5FuhZX7YIcTRBDSJOejcDO2P
 kRCNLOiiGGCrrpcbxp4cPFfNn6E33CzUXO5cjgmzY5g1XKmOBoTDk5n1zhDYEtlBIrFzAmvrRiK
 YbbdI4T57+72HWGiSqTEebXRBxlZkGj90BMu+7ISzWzoPW/7cWTnxBocB59aba8CqY/BJD2OKla
 3JLm2QRj5HH3A/KtPywwYIDk/Ga8ezqh35uvs6wv23hN7ptQBDKb0qkmqca/AL68Saxl9PX929D
 fg5eNDJKUW9smQ8515Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220087

On 12/22/25 8:30 AM, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for Monaco platform.
> Bindings and Crypto DMA nodes for the same platform is already
> present in the tree.
> 
> QCE and Crypto DMA nodes patch was applied as part of the
> commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> however was reverted due to compatible string being miss-matched
> against schema.
> 
> Resubmitting the enablement of QCE device node for monaco platform
> with compatible-string being aligned with qcom-qce schema.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..dd0b9ea27fe1cdfbf6aba07e98183871be7ee889 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2350,6 +2350,18 @@ ice: crypto@1d88000 {
>  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>  		};
>  
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,qcs8300-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x480 0x00>,

"0x00" makes no sense - "0x0" is the concise way to write it and
"0x0000" would be pedantic with the width of the SMR mask field in mind.

Please switch to the former

Konrad

