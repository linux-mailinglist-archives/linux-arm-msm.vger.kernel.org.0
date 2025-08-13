Return-Path: <linux-arm-msm+bounces-69081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA3B25751
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 838349A190D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7EB2FB991;
	Wed, 13 Aug 2025 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JukDwkr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5852F4A06
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755126557; cv=none; b=Rh3Evc5+uadbFCow6S5PThc9ozA0AYD7IKLfVKsPqTp7hJbVKQqaj37NTuaYZ7MJexomsKTuGdF01yvtmyOby2tIHIvgKmzp3yKSDV2FcgqIbI1v+lNxBE9GA5pfWYOqyn0OFoVxuClurWZEjiRppEhs3NmoxFJ2ccicPymgxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755126557; c=relaxed/simple;
	bh=T82FpN5osHxI2y1iccKhkwVh6JluhHia2thiRO8gHWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wyc//WdGmJeF75xgQe/ODZZD73urlo0LKVF1nmvB2S1EY4OikXUYu20WycytKdSAc/waaqbPfZ547TyC7GsBnOjGd1FE8xrcDfAv6PuXyL7RxzFbCSD9cIYgNv+fu5gEYAfOslK9x46T1tB7u80deXu+dIyeSnOrkw8Y84tD7zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JukDwkr0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DM6T4j012161
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FW0Xg35JatzTxpNZ0mth0/VPTJXslvs1Vzzt18fSrD4=; b=JukDwkr0hdcUloBE
	0Pwz3thW+Aamrdc92pJ54L+QVhN1XdYWu/ebx7UYEc8fMsL19o3UwgkZLrJn+/TB
	zZPCxGmFWFarR6cXMeViL3ubA4LgNbsXFMATUqk3UiV43tTh0p78FGQXDmWSJWN+
	JfIRg45FLC+Jl+5sEC19nEot2JC6IHtvzjgOVAqZc3C7R3SGO1WBQ/CaHcHUmY7j
	vcbTgDyETQfzv+FCKAt6vn9I/4D7z3R54Ori80S+5hkbxgqbQ9hUbrWBU5FMw3iQ
	Ybtxn+YMo+nMdtwxYwqlMJNW9C5PtTmOjzf/B/tuUzb5vBXPPjwZJY4eFZVtCcLc
	hh3oiQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxbnwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:09:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b1099194ffso1477801cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126554; x=1755731354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FW0Xg35JatzTxpNZ0mth0/VPTJXslvs1Vzzt18fSrD4=;
        b=Tu7c9+vqWf2emUoYxKBvJcDMjH4yc+x9PbOjAwRtBNqb/IqSqEtkCjnK4HzzKn2T0+
         FynI+buYnZxkxD9+7cvGX1hlsqplxYK3Kc2ANkA6HQPeORiiEPGjczaxhSADZUL5b41O
         rfRozDf6t4QsvsUxXo65/JtAGgaEE2XMpDMyptVX/IyuUF0dSiRv3nuKJfgXOVoKN6EO
         EWQMLDXtcdzJFZqjcuqN91/PXIJlmLKMLTQFvmdItuEAjuGFESk80TkAkSUdv9lPsceG
         5p4f6oJP6l3o70pJdjaP5y8qiGtX5U2nzZ3bVmwrQIF0HUAd91qsNKh0Ylz1aoTtAwzT
         05Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXk/Au9NCm0miZjcwmac6a9Hazfgf4eW3E+3POt/C5lv2CBgunwHr0C43Ga2SKKA43YLznZ6us52EpNHxE9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl3+wv0ffoQt2OIEzFSnXtRIyxwwFRYkFGZyLte/FnmghHzsuS
	6l/78FEilwBqy+4/2QEkJA31+jAWRJN9aP7k3A3BwdnOigxicGE3hHcMMguZ53ZGEfnjaB3LBkJ
	cV9NKcl0CM4m7temjPRjTCoTxuLLAQyAcWGnTFoDMCwUZZmL6ay0BqyysDrhrKySkqdUS
X-Gm-Gg: ASbGnctYY110ICvpv+QadOb++Vw9asOukxxfSIbcYTlPnSDFitOmhF7h5iR+8yuOBCZ
	coKQefCqdnHK6q4Mheu2mtVp5NlFPWvaKY91ybV9CMmmGK6FTpgqvtvv07sY1+WcoT7Ccz3YedC
	OLP0OIZJ9jzmfC0mJKo+4S+qgLr+AlH4IwQQewdHHm6uljJZ1gWacIf4VC6OX4g8v3M/NkHaLwC
	AkMgbW6aQCxwSg8BTixaTvOt7Isn8XJSROiOj0TsYQuoN0BoBVWUZVvOPY1wLW2Pukb8mLWm388
	M5UCzheKU05ZrU4jFEcpzpwT6HxPqjOVI3v/zJQdrDxl8zDn5XHzxotquKbfr5Jx2k8mzJwyqBG
	HkW2PTrcCug0EdesBzg==
X-Received: by 2002:ac8:5f8b:0:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4b10ab1409cmr7447281cf.10.1755126553475;
        Wed, 13 Aug 2025 16:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFksB5csn2J3qmtm/tHxIR/kI2a4tn8gLl4tYqT+oofHMStplfH8BbgDxQxUxAzjW7zZrDbTQ==
X-Received: by 2002:ac8:5f8b:0:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4b10ab1409cmr7446991cf.10.1755126552867;
        Wed, 13 Aug 2025 16:09:12 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a1bf9sm2482327766b.31.2025.08.13.16.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:09:12 -0700 (PDT)
Message-ID: <5de00c2e-2b81-42f4-ab17-6db0f1daf7ff@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 01:09:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] arm64: dts: qcom: x1: Disable audio codecs by default
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX8jFsdtPLwaeF
 Tfw8SQa6EHTghOqYtY1Fwuh8TCCuNZs7wwAr/3ctgDKTPa4wPzLM44D/ZcCYMAYXAibPyk6P6FJ
 CzeUXCp1NQaFOt30TotpNc5j3lVeDwcU9+JcymS5qI0lcG2P1OAA7Q3pkYo9Wwpi5cBIdIUH0rJ
 JG+8amifjtrn6VTAg1HwFFVlxtxhp9W2tiopJV28BiL5yNRR2/kUQxUUeuHuQzMLCz0dJQgaLIX
 2Yi3pHBaE09g8OrvN0rndLDcBJb6+ZyjEjruSTR7PodxxT+P1uxSIyNKUVw3t76b4OL/5ezO/Tr
 LS80xUKvYnYtKvOL5AQrvmkn3IO0TNcDkIjB3fYDbfHLx6zK+YP0RYpGcHtGzXxJIQRGd/QcAG+
 x1fS4ArT
X-Proofpoint-GUID: jlEjecY5fiUg04Kq0u8THnylmBJPfL2M
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d1b1a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=fBsYT2r0rtnNRkE0zdoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jlEjecY5fiUg04Kq0u8THnylmBJPfL2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/13/25 5:58 PM, Stephan Gerhold wrote:
> Currently, the macro audio codecs are enabled by default in x1e80100.dtsi.
> However, they do not probe without the ADSP remoteproc, which is disabled
> by default.

FWIW if the ADSP doesn't start, you can't really consider the platform
working.. It just does oversees too much of the SoC to even seriously
consider using the device without it

I would maybe perhaps even skew towards removing the status=disable from
under remoteprocs instead.. that the user may not supply firmware doesn't
have any negative effects as compared to keeping it disabled (other than
a line or two of fwloader complaining)

Konrad

> Also, not all boards make use of all the audio codecs, e.g.
> there are several boards with just two speakers. In this case, the
> &lpass_wsa2macro is not used.
> 
> Disable the audio codecs by default in x1e80100.dtsi and enable only the
> used macros for each device.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (9):
>       arm64: dts: qcom: x1-asus-zenbook-a14: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1-crd: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e001de-devkit: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e80100-hp-omnibook-x14: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e80100-microsoft-romulus: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e80100-qcp: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e80100: Disable audio codecs by default
> 
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                 | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts         | 13 +++++++++++++
>  .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 16 ++++++++++++++++
>  .../arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 16 ++++++++++++++++
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 12 ++++++++++++
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts            | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi               | 12 ++++++++++++
>  9 files changed, 140 insertions(+)
> ---
> base-commit: 33a21dab19b31540dfeb06dde02e55129a10aec4
> change-id: 20250813-x1e80100-disable-audio-codecs-ef258fcea345
> 
> Best regards,

