Return-Path: <linux-arm-msm+bounces-89796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F1643D3C59B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EFBCC5A5F22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070DD3D3D13;
	Tue, 20 Jan 2026 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSrihVgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d75m6zub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A2C2FB630
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904578; cv=none; b=YYCSl93UyUO+u5t2MecTbh5bTqkhpBSeJ8slHK8wcDEjHRe3U1EjjwJ/YOcsWqo93oV1+HraRdam6xPEjSNurzaZOQBqNv5Rl02/Gbl3n7ViOTjapBBBpOpjurZXnb0Py+AEmNKx47BuscYU91vSFzky8XkPtFfKNriGgxC7B4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904578; c=relaxed/simple;
	bh=aRA/Y/85127uJtAj19FiziVj0c+2QUQd8LxtRzkIWZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9jWQDrr1gRcpcUNqnTpCghB90OQJNzsfpiuY4IG7nSMDBuisANN1tJMYPGTclj2318/w2FoDflOQOM4YHRpwpOk8bYgnKniMz1h88KIp3H7wweA8y2CQSxAxHGQniqyTBGiiVTDDtiH20geHvBwnwOX+LkQbU5aShWfRvlHQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSrihVgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d75m6zub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61XnC3772433
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4OfKdMWQoai8cyNzsWRRAhlzih6X3/oI7QjxUg7ppE=; b=gSrihVgAx9SbcfI+
	qUREDDRw8knv0XzJltP3hPpThnLmWqz/bihTKUD1/K19COR+7aYDtMw9hPQDlqz6
	wET+uk3mPtDKkrNk8snenTfaxtZ87aSjXOAopV4UyBHn4qyyWA2jpYa0veimW8GL
	CX/l6BecYKQrnK3KhU1UNn5XCODAnNpiXcaqLFsbCkL5Bjjc4deCEfLr1psVgOg8
	aIo66eZZJXJd3X/MGrRISdeZwBjHg7iTfU440p5zpb30jrfVUD0/3evdF0TQmD18
	8EkSI11bTWLtvBN74GrXMsRp1mMiUYMysUwYqcBF4vEQ0xcfaJqWwEPGcgSSDm6/
	u6B4MA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wrtk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:22:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-501476535f8so17740211cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904575; x=1769509375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4OfKdMWQoai8cyNzsWRRAhlzih6X3/oI7QjxUg7ppE=;
        b=d75m6zub9kBlzyDp51biXhFLkVkQ4bu+kDf+pMXb+UhE3n0Cu4XeE0UE/ZM0c4zpRc
         f6lEgP0VPxuKPS4/KuNRJQyMcJeO846s8Q0brNV7m4KkHtENtjV5x44qYznpND8mIQjx
         ro3DEbgGtAzgo5B7NuGoNjDHg2Jr+wydsOlbsREriha0CDO769nPOS+ab1xbhfceukxl
         SRElgp+QqB58VgDzIY/wlXvuxf9u0Ih7u3YECQpbOPxaaSTdi4BTzO2Z5M+rF2NnVCA/
         xjODvvZJoby//6kcx1wYEAlfFDbDhad+cIU9TkhubTiIU/XoKu3bfOaS1hZVmVA9/FX8
         Wspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904575; x=1769509375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4OfKdMWQoai8cyNzsWRRAhlzih6X3/oI7QjxUg7ppE=;
        b=DGWhxAbdXT6oBqx+6/qFtVXMH0DBqYg8hNKbDWhi/fGT1oVlnSWS9h/BQpyEDyu+0y
         GAlO0Phl2SHVbZ00SnIqlWnTvEC/ddHTZG8zY0YwpsYoek0IgzKtmAQjIXPdWg21S7KA
         FG4NX3OHO931LmJV/CWPPd9XIyPI+Kkj1VxJx3upeNgigJedheoNREB06VMXlzaW0U5H
         GmKinyifkrXIynC0+8+3AYhOO8GvECqU65VmZ9P6MdjDPbDoZXQsq0pM1j5WnXOJ0gtU
         nj4W2RXPrCy0q9X4Bcoxo/W5m695IT5RX+TqnAN0DmLtLgNUSFTVuC4YZhDC4xMe0q5D
         /FHg==
X-Gm-Message-State: AOJu0YwPWLz+JVm8bsKVDD9DzcTSYqaVDJNLHNHX21z6GNIKQ3TJeAgl
	cWkcka9V1vMxIKSc77IQx8L/7kD1fxcE/Uol+ALAv/fRZsLMvhyPawrBRm6PtS8f7JJHiIIcOze
	oQxOLwVJkIp6dXsKIuUgUpj3ed9Mqt98Kkas17h/CH9ie9/c6DvvdOB8QLGXhczx9THmv
X-Gm-Gg: AY/fxX5YCP2SY2mz77EbchAPqbr+hFYS8JLpkAfbEs/3Dx8uCcM+IQwrF1u5Qq3pWTo
	4xljjnawH0lj//EERC9CoEd1d7E7YmQBfmtHEFtKE7W2fWGdb7hseDWKtM6ZsWY1uBApFVbSpwT
	3vRrJ5AHdKU58B61F8SfDBzfnjGt2uzSB6/CYJCbiP1Ulzub10hdQtVZLuH50bX17t0KgQThcGB
	KE69yPaQRKTsAc+vuiptPTcmckqlHDx60sA+emzPFxUuJmN0IVNnqPJOkISwUWNAafbEuoLeNnM
	eWaUoZbwciuc5CS+LXz4k6tBD4rV0myNnOj1+ssiY9bsVFhKVCh1cc4LAR4euWb0S6peOoMpiQI
	puBO/r0qRBR5S/YtqtxWbwYcCceogoL5IINo2gVRMaByvrxlB+3PeGvunbxHMy1Py2q4=
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr166361331cf.4.1768904575103;
        Tue, 20 Jan 2026 02:22:55 -0800 (PST)
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr166361151cf.4.1768904574630;
        Tue, 20 Jan 2026 02:22:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8791sm12664677a12.24.2026.01.20.02.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:22:54 -0800 (PST)
Message-ID: <865f145b-2170-48c3-a412-a4f22fbcba8e@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:22:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
To: petr.hodina@protonmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g-ZAj3Q_jbTO-AaPkT6n3G8hL3YYju5o
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f5780 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=ne8vudJ6NvtqW7c4UygA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: g-ZAj3Q_jbTO-AaPkT6n3G8hL3YYju5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX5eXbK33u2uzc
 xY9cfqczwQQJC43DMd9MdjHO/e1QklG4ff0lZ+DphKgZkqkkNEcyHuulFGlgu3BHoVF5q17+BtK
 lfX1Cu7pyH3eyla8g7ZBrR/IdGkLZ0rvBzKwaoQLb9S/4f4jAQSssJA+VRZeF4bp5JQ3XxKNa6k
 fsyFKSvfLC9ybYL3QXrCWXuBIsRQx2zzyfJBWnW8Z0glq1x25mwKKl24iNCpM9cdRgjcHHbp08P
 8OFC/RjUJgy240RJ2nzfJ2VeEg/jphuLa6voR4CacIVUXXW1lZ+z6N9W+/kpNHedVbfue5WtbRy
 VMyVSv4MCpms9r1+LU6m11L29FewBw83EVxZz5vfjnJmjiTOofoJ3lw7gbJXSq2SoC4giSb1dD1
 4IR+rhcFMip7WEuN8jFPyUjcaeMrZ+UZp73zUDGvo6OKbdXK69yaOcMV2Ks9A/ftV9GSttDYyEU
 Oo59IiptMFoPHvyRfgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200086

On 1/19/26 12:58 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Enable the bluetooth interface on the uart6
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 68841e036c20..f23f9757a08b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -755,6 +755,23 @@ int-pins {
>  
>  &uart6 {
>  	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		/*
> +		 * This path is relative to the qca/
> +		 * subdir under lib/firmware.
> +		 */
> +		firmware-name = "akatsuki/crnv21.bin";

'akatsuki' is the codename of the Xperia XZ3 specifically, whereas
you declare this in the common file.

If they all should/can use the same binary, let's rename the path and
if they have to be separate, let's declare that

You can probably grab the firmware images for all three (four actually
but I don't know if anyone has the XZ2P) devices, dump it from the
bluetooth/vendor/firmware partition (can't recall where specifically)
and diff the files

Konrad

