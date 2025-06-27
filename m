Return-Path: <linux-arm-msm+bounces-62806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D0AEBA42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9284B5606B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55DD156F3C;
	Fri, 27 Jun 2025 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EabCxAAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447617A586
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035604; cv=none; b=XyLa/5zw4dmUrWg1UI6f02Uz/xuG6lvn3wGDHN1hTTiV445dCtH0CuRiYy87aMGsST9CMJHtruVQUAIM+PhTeQmNZEBC5xhaCzsAokVngU+M+7Wi57IvcE/zUm1uQwR4s7CgpAe9KnzKcizA5SEVNnV0+c4iizfGW3LiSwlJa/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035604; c=relaxed/simple;
	bh=sILD8tH6zENV0PMgxasm3/T7rbz9dx26TywcRHXzI5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bo9m2qbcU3y4pfiONQFPTvlsBpb3JDRnFe56D6LSk2eV6tMXChY/844h660+Sxg22WkNT7k7AXr1F22cMemhCscDsF9e64wgRvPqKL50XaDl0AuT9lffVRrlq4zDD8vmByJhtseAu3eSFwPqOFRkmxi4WAUC4OjWMXZKGkQaa7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EabCxAAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC5WR1006912
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7w0AhAyV1EY4/EuI5ZGZ02Oew6JczUUcSc2eq7tlKQ=; b=EabCxAAVRoUDc93t
	K6OrEqUCQSXe5+lQY78gK3u85dD7rNH8onA9bEt/keU6pKEvJ0Yt+fGdvT9JM/kt
	1QnJ/Jh8fTC2gVgFpFvxajJmoVE5SM0XRcHpD86wqy63MfUoWISs3ItrykWCtfob
	L/hgwGbS7Ik5ZEcUtG+lmwDgdEhIp31fwAYdthh/gWwaeVNSkBats17hfiIj/vqP
	ZpOw48txSUU2+5vmuSPkvSrJfWFzra9kUF+wjr3oBZ0jCsqU5fZL0M42bSzRF/s+
	GCnKRI/SNLt6xG+S1U2aQwqW87qvvQeH+lH3nOQ9z/Fboit2VtyRz784Q/PADtN6
	+5MttQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60c01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:46:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so19275785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 07:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035601; x=1751640401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7w0AhAyV1EY4/EuI5ZGZ02Oew6JczUUcSc2eq7tlKQ=;
        b=kbcD6Y2x6b8s4DhR3Lm7MBBs8S8wt3tbWzBkD2tQFfnbSiW/00n4LJoNRBps2ptNu/
         h3B8Yt6lYiS98OQvk4qCeCp3mUrPtUnM1K9Fl+ZaFT/MbX4AahDTnkBvIMdr3XXWx+zW
         vCCIkITOKX8oGPClL0kf1/JD03zV7xiUN2Vp6VbdymUclrz+V6CHmde0oeB461oSXWsk
         yfVNpTbt+Hrty0MSbtSAvAngKbJ2N6kuutGtz9HWflzBmFL7Eid+LTyau3+UtzvGILtH
         00+NtSytKZhCCQxMwP3ovHCgqdcUCdQkT9KbpMct5k59XaBj1ujUHtHuNHC+ziGZeOXZ
         3rkQ==
X-Gm-Message-State: AOJu0YxTKQFHUX1/5zb7I29l3imgFuuO8bVcCEuh16bju/8eyz7USE4l
	14yeSAh7ENxA2nLK2AaSW/McZ8StCrVDCZ0Rq9x8ftEuKi0hCnRjGOdpWBknl0lC4o0jptcNsQP
	xgGtgmCf6esInspAxyCVJSk7fU+IBg6hb0wHeuLciJJ8NYhIVSgpPzaRaGDtQPskrBv+C
X-Gm-Gg: ASbGncvSatEMGzoAvZ31XmEhgrcToAVevhaP0jGiSFY14VRF3BfF+vNNi9y7eIyWcJX
	aVXwjCNB3ASpuN+lW/1wTHjdIwT9dEA5akrmB407pEvErSubVlEMcKNMqt1IXPz7XunSpKBWUmh
	gFhwe1lX0YQjSVxlhChNOwSuroc/69jBiwMi+TcBtULDVS5oENC5gPoZkn1u6J9qI6CgUIBiP1+
	W535GikzSKDaaT4n2Rjyglsi8Wj2Em+8kzk+ngql9v1urBSdCWVdv1wB3nYk7txo//g3yel4Yhc
	vbmM4C7KyGzr+/mAzraDQpmBfbcKMskZVCtwc7f1sStcuspgoDOoxam2IYynI/X/mFT6G1M0iRo
	D5Es=
X-Received: by 2002:a05:620a:bd5:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44396ed30mr191585085a.5.1751035600855;
        Fri, 27 Jun 2025 07:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3cvaIDX4f1oVAr8XxkmqXufKIqRhKzHxi4yp4lSQHsKZaATQyS6r3lewgu4Ei9TeYFwKmKg==
X-Received: by 2002:a05:620a:bd5:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44396ed30mr191582385a.5.1751035600310;
        Fri, 27 Jun 2025 07:46:40 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365973fsm133783366b.48.2025.06.27.07.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:46:39 -0700 (PDT)
Message-ID: <e824ea10-303c-4d78-bb92-24320c26f84a@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:46:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250616070405.4113564-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250616070405.4113564-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tltucyIYGwmqn5J6ngNYMjKhJXJhuODD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMCBTYWx0ZWRfX8Umgwg27VL7N
 /NlY3qP637lIDkZ+H91Zm+2q53IJPl/Q8PxWvyzoh192swANN59kBRJns0x5ftZQMbeXokzoSZ8
 tirGkYwNpJaIy5FyodC+mLD4KThjZGO6m4JCWUTdVLxfwEhNcSf3L/wK5DQVDHVR89pZW1k8iDF
 eXyrnbVaiMvaJQG3Ei2otm0oIDPaBMXB7sV+scK5j8zXCveKELinOetKADlgScnZ1nJa9TS/89B
 rWgH+IKxkfMyi5ZNoW/BuU+qraU64KCO2K7Nxb7xobD7E4czGuRMqxl1s6fKhhG1lBSBl1w8iwW
 ba+/8oOm7+tZ6WWXyf32IfxYC8FqMS4m7Is6y0LTfMY33FRGbVQU3+N3UUwWh5lnF/qQn9i3Mg8
 wKSQUtyopbE4C3nA8qEvsZQt0uoReNHO/xUtwggcc93PV4ukNH35lUsPv8FPh8/tTw3jzoez
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685eaed2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=RUmmF2Cuiqa3jFE6LK0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tltucyIYGwmqn5J6ngNYMjKhJXJhuODD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270120

On 6/16/25 9:04 AM, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> I2S speakers amplifier and I2S mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index ab161180d1d5..d073c6f95d4c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

'r'egulator < 's'ound>  
>  #include "qcs9075.dtsi"
> @@ -21,6 +22,57 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	max98357a: audio-codec-0 {
> +		compatible = "maxim,max98357a";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	dmic: audio-codec-1 {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;
> +	};
> +
> +	sound {
> +		compatible = "qcom,qcs9075-sndcard";
> +		model = "qcs9075-iq-evk-snd-card";
> +
> +		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
> +		pinctrl-names = "default";
> +
> +		hs0-mi2s-playback-dai-link {
> +			link-name = "HS0 mi2s playback";

"HS0 MI2S Playback", please, similarly below

lg otherwise

Konrad

