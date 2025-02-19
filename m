Return-Path: <linux-arm-msm+bounces-48478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D001BA3B8E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65C2A175E8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 09:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869071C5D69;
	Wed, 19 Feb 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwQ3U3eD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD3A1DEFD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956480; cv=none; b=oTIygjdWPVJapflbnVF4HGfxUBmZGiffHHcD/0f1esMNs7scoRZvsecYOi9QbQJXYMRXy/AA0TizOydCWpzcPdD/Zh7o92W1CCuHUfuSPEuyCExyA6j/UpDB1NTCIJ1BvJJDxHv5MnhLAmqCEXa/UnKixsS3HKdS/oXYOV469RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956480; c=relaxed/simple;
	bh=vt4rT9YHovWLbL5WKB4RhLCxhRaR2niAMxbUVN7VX5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qjx1r0r2+MmyeGQB8OTm1Atnn7yqlwTu9iP3UYUFBFgdc2cIYyTzGvRSNTl9QxyFmIFE92yYmTITwzozUrooWi7aNEGWwxp8S5ruuX6z2ZGBJRzdlzrwHO6sZeSCIvaVtXApnkkLeaGfrSgfmXLBv2FJDHxguXa5UaU6RflxuXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwQ3U3eD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8KQOP023289
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeqopofIxMoJ0SF0tmrZIswJs053GwoXuq3tHJKY+ag=; b=JwQ3U3eDjS18rFdu
	QD8RMrO2cnblEPf0uJyUTzJoKimPTv23FaeuItxIakKDUgjlgS25zrmeqRQzjSl5
	wAuPbsRkf1kwzcTVqOFP4kPgR8/gFzjvp24dxGUQvSc8u55+obvKzpTSXbFiIvo5
	zNUKZJ0gQ9KpYwxmP9amgW/L2WmZmQy2to7zY9wqB/tEmzfR+BGlQBEn60ryYKNv
	Z5i3YMnna4PZYKxtFK5fQEIOh+2R3oG1xpPhwBoBXe0WQnFabnBaQhcWVrzjYoz/
	Lq6joAKV4UvwP3pon9UyfuX8V8R2z+3Wb7lx+RtDETStSDW4FwLRTaQr/Q3xHQNH
	7mWAjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3hwg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:14:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e66b3359f7so6797256d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 01:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956477; x=1740561277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeqopofIxMoJ0SF0tmrZIswJs053GwoXuq3tHJKY+ag=;
        b=ogH7JU0B9EF1pxmNWruRjQrBNvJky5e2cg0V8BEzmqQevjCWlZEFHmThWGDZsR64FR
         r4CF2Z3nWFheNkRg3zY0lwLxv4lh8xEBFcta+AAwoRbiZe2TGrynQM/FVMmR06MXV/UO
         tjkQqubevtBjTpFDjtc1/pymtMYXctvLB4UG0v/kKlN3ADvXQn10eyTZ9Lb9i1JPUE2Q
         5Bv4kQWxfD8inFsWSygY2wHt1utezLq5DpmoMrMw9MY4ElVn94FKcr+quQ8K1tJnQ9jO
         FWgWyHn+gjIGGD57WBgB8sckGct22QdU8BU9LDBX/cTYaHo7PFLtXVRnAmFzaPpgt/up
         wPgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDdwrPiKX611Jf4qY5pP7YLGdFhG9ClYfSg8is5PvqA38GEBxMEPXU1UA2C3M0/yJCY2X+19JsRRgvzDUM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7RF0opu/azrs0vMFHbvJnWAn6+iZKcJahk0dHq/RTNKz6Q9Hn
	VYVKL3uf/8dLKT4lGu077qA7KhuRiXvGku5chxHVsJPF10IbNuh41FoJGrzh1Esim2m5KjKFO3O
	ymPe9YoVvUBipg6I4nJXhk1TxBSgg/prNAFORZmOSxCpCxFkC/fWCP7I0cdZBBAK8
X-Gm-Gg: ASbGnctYNahmgVbtw3uruxdmBa0ogFz0gvZF9/UYujIpS9jfQq0Mff2hzbgVUpFviye
	+fbbGm12z0cqSpVAghnv7xtXdeweA6+L6pA4rFvrrOj+WJgUMg/D7OqV7LJwaIbGDxfeSHDuoxD
	j2zwQN04CxloiOX9h2sYIac/QS2/DBC1pdd8jQLPoEa1AkJHZZfn12U01CG3+UQD214SFVe776G
	9ar7oxa51hiXj/kTkZNbn0dSvUh3i+F87YcqLqagNQfUvWOIVE02eK8rMkPNzAwQqkjEWNSx+Dv
	enxwxYGqkril5f9reXiSXp1C+eQTCnfOBWRm5ByaxXbC1lvY1fU0S7r4Kqk=
X-Received: by 2002:a05:6214:2a48:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e66cd0341dmr83145006d6.9.1739956476881;
        Wed, 19 Feb 2025 01:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/zkeorXc646BRrW5otRU2e8zonUuyZQUghLAIsYLF3ZC3687CPfBC9GiCGPZQsJgcV+PUmg==
X-Received: by 2002:a05:6214:2a48:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e66cd0341dmr83144916d6.9.1739956476552;
        Wed, 19 Feb 2025 01:14:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb916db37bsm628608366b.165.2025.02.19.01.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 01:14:36 -0800 (PST)
Message-ID: <3c16c6a5-7c1a-4ae9-b865-7ea3c12767e0@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 10:14:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Corret white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250219090751.124267-1-krzysztof.kozlowski@linaro.org>
 <20250219090751.124267-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250219090751.124267-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l2OOmexYUacYhSb8gaIplnUZz5AOpIab
X-Proofpoint-ORIG-GUID: l2OOmexYUacYhSb8gaIplnUZz5AOpIab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=859 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190073

On 19.02.2025 10:07 AM, Krzysztof Kozlowski wrote:
> There should be exactly one space before and after '=', and one space
> before '{'.  No functional impact.  Verified with comparing decompiled
> DTB (dtx_diff and fdtdump+diff).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index abb92c81c76b..f81a3c3ae334 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -990,7 +990,7 @@ uart14: serial@898000 {
>  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
>  				clock-names = "se";
>  
> -				interconnects =	<&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS

for those wondering, there's a \t after '=' that becomes a space

Konrad

