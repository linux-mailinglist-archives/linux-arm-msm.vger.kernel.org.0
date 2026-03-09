Return-Path: <linux-arm-msm+bounces-96267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGXiJaPCrmmRIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:52:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51123934E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F090E300E25F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3083A6412;
	Mon,  9 Mar 2026 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1t+ykwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtbzPZTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E73093C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060768; cv=none; b=e16oOlzopVp0Z7PAKaeyo1C7QV2qboBUIQ2sRfKlzyqFthuecB8OIRJlL1yV3eyAxeoStoC2Lg6Hgx7CUW9OHFR1S7tUOWig0h0DZPCjdk8UyMhGFGFn8xuOnsazTbWd1usAk9BhWyLMoSuS996fpI16xJscHlzsptqERT3VbKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060768; c=relaxed/simple;
	bh=ePCQ6m0laKIuOq6nhIk1YmPWwno2KDr1pvgdMxF+7gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dW3qbOA4wZ6t17sp8F2SvhxSmI4kQCryyGMuNDzQn9FLUwWOsLc31pU+QBrsy/visA5UCdZ6rUZZfJ9xxInhcFAo/iGQVvESRBkiO6/eUXGhEFoEVOqBds71CkbbOdmhzdeqIB9ta+vROa1+3uMVX0UFCd9taiwYJQ5sVhifE7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1t+ykwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtbzPZTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AQaVD1588151
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwcWNU94OXy3ETGq9rRST1xSdW7sXoKXYRhilNIUDP8=; b=R1t+ykwCyvAzTpEx
	t2JsFLyCxRzKjvkQIp7nrNtWtEthMKiCma3SY2Wvh2CuSbkSlfQ9myZVDjSp2NqU
	MNttzTdzH8jpBkLKF7Yt8RNAeV8Yd4R15jJbPeO1wv5hX8Ui1XJILwOplWGcttDA
	Q/mCaunEFmvQ7MFVRiM4tLHoYn1JKLwUHtFOvH10GqexF+rUEIyD33yj2g3lrLIJ
	zH1275Eu+TAvbiSFQfkv96vcUQSyua19qKPMTiCsZDCAWUt/oF2uxBqxV6yUfKF6
	UUTKt8pSGksqV0j4aJE8bRQmo6EQz2kpx2AFje/4C6U0nkOizUlkGb5b24nNZXLv
	lO7NUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy9je0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:52:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a063277f7so38563766d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060766; x=1773665566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwcWNU94OXy3ETGq9rRST1xSdW7sXoKXYRhilNIUDP8=;
        b=gtbzPZTU1hpNlfKtaoUKVQFL2gba/fJjVVAamYuJIXmvNvu/kQbGjG0XsFCLlNop8W
         VH7tx2pARrOXtSSzGSxhlnUFdjevI/NoelenOwtyjheofZStfwW0GQPd7GDAptAHB+zF
         /05NcZySoIouNxJG5k1Uo5/co3L3HIu70/VaHcx4i0lHx6rouIBgNHyiwB1YEhsUc2r5
         GCUOExWcc5bE2f7GYr4hCi3CfPl1ZGG+hP5nNFDj6MacYqZehGv9xdNdnhXyDJyLXaSp
         sOx+MKpF4uzTZSGgjMh/qU7cKMtKyL1V2o0ZYwlA9FPse6HaeDCu0m0aj/rHK2I95TIQ
         rcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060766; x=1773665566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwcWNU94OXy3ETGq9rRST1xSdW7sXoKXYRhilNIUDP8=;
        b=DBfQrMHEYXhdABaLzqawbRPIkePdOnGQk+6sRSGBpQibH0vkTaA5EVRPqY2Vaf+7Cp
         vAm3I8Ytx3bCwpQAHHcTjkib9xxkWpqFhf5acR1jknxq4Q2duT+iNDtiKbW4PRh3mGrd
         ZQ6lnNK0pMj7wt5AddFYUXLs97Nw7hElpuUibeOLTYiRzasuyu79eoZPekkbrn+Od+6Q
         CkSQBJuXD9JmKC15NCfIIK5NCxMoOOMEbn5kAA9+3RzEfnPkVtBmaaxbqk4XGEIwB9EO
         7DDu+HtK4377WxkNS8Dw1qfCUTX9NXMUkqZE8ziUvDzBvlaOTJz6PHtCPOu/0hw4qzpr
         mF2A==
X-Gm-Message-State: AOJu0YzOwjeIQP1qWe7mF442gySd7boJW1dNlT1M6aRhzftcu7eIAFVf
	Bkm5uc6wVgNH+a+2/fLzVWV2hWgqnDU6hCSnymv50LFDfiQ/5R2gTnRpxYDxqhGMVbH27HjtMLt
	MnTqymiP538p43qCAxwnOlOs+fZxYTpwSKm0PoB7ZEQR8HPKSFws1s3XoufVpDgiwE8aI
X-Gm-Gg: ATEYQzzC2prNbZ0I3RBWQddcHOK5MYWFpfdKjdLOZ0CEtkh9pCkQuLeAH5/x+wvrzS4
	sqWPrgvWo2iVnsqCy1iZEOMB24qZHAe8QyJweNem981IfPnYEZIjTbiaQ8ySSwlWrKjk3/pBR2o
	LClSaGmM32EsHpfCUJiUN/xtm+WLn868FNQb6pE19XkmHFIOJ1DhPFmOkRqu4YAco3Gq5RKM+SN
	7OeqvEPlxenI1dU0NV0rjMGVUGdAWbvVCRPSvdlbpEflAzEQUFmAgv40D2FTmBsLIgCGu3C2rde
	bFiiqknG/e7oRlN1RUNvkhw94/4grjzTOpaO0pwbMl2lxL4TS7cCMEKi7R5PBeAPUBgxcacxEyT
	eGwNp/BtEIGSyGbiv05VDqtBNRXnfa61WHyx0bgpjQbkFmRcSAiU4DDLuMxfim4FUpAwOTWC4P2
	4WPe4=
X-Received: by 2002:a05:6214:5e09:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a46fd344bmr41416466d6.0.1773060766239;
        Mon, 09 Mar 2026 05:52:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5e09:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a46fd344bmr41416196d6.0.1773060765740;
        Mon, 09 Mar 2026 05:52:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96dbd03678sm244588966b.13.2026.03.09.05.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:52:44 -0700 (PDT)
Message-ID: <098cf81c-d3a4-4591-948f-0517b0430343@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:52:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Redmi 4A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-3-436f1f4b7399@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-riva-common-v1-3-436f1f4b7399@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExOCBTYWx0ZWRfXxqL4VOmnTak4
 aq3vsETrAScpb1DlmU0t+nB5Ztd/U6SWe0ijIVWgpBO0LahcwW1C86GLHohdUu6n50sHq+XBCzB
 evViEGftpniRNDTxmAqncMnFumgZ/nX3IFoXeBtuQHWRU5gBrhiXHrdQyUQeZRoq35pjASx5So6
 KR0orkhZlIeeT+ODcjS+TOIndGoNbA/2u87qyRIRUHjHynyG8WgN+BcU+pt+B2AMBkP9LMBoYIq
 QK62JPmGurk68ZYOPBv8jDpdx/46BApH+NYLpGlFoqal+Z0HjrYnAkZPZoFzeHqeB6MdZVlV77g
 oQR0OxOzsjjHHluC1/QO4owqTlXuynzn6avFmH1xrW2WOe6q1w5ngcQZLhd/OhotBr2gr5fUiic
 nYwNfi0e2v6KNNF5kmBhcj14GU+8zh7sE7YuLHZUOMzh3aQz9H3ne+OuKhMdD80PRPvZCz+eNVA
 ACk0FQU1Z5/pZcvUEvA==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aec29f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=A3-p6XzUPt2pthl3_K4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: qOlG9WfsujCyJ3oc2pfVTo5suiN0QHB3
X-Proofpoint-GUID: qOlG9WfsujCyJ3oc2pfVTo5suiN0QHB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090118
X-Rspamd-Queue-Id: 0E51123934E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96267-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,5d:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 6:28 PM, Barnabás Czémán wrote:
> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
> fuel gauge, different speaker codec configuration and display.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                     |  1 +
>  .../boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi     | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts     | 19 +++++++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6d87be639aac..20e161e843ed 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -82,6 +82,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
> index f0a534106e11..50868c679693 100644
> --- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
> @@ -104,6 +104,22 @@ edt_ft5306: touchscreen@38 {
>  
>  		status = "disabled";
>  	};
> +
> +	goodix_gt911: touchscreen@5d {
> +		compatible = "goodix,gt911";
> +		reg = <0x5d>;
> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&tsp_int_rst_default>;
> +		pinctrl-names = "default";
> +		AVDD28-supply = <&pm8937_l10>;
> +		VDDIO-supply = <&pm8937_l5>;
> +		touchscreen-size-x = <720>;
> +		touchscreen-size-y = <1280>;
> +
> +		status = "disabled";
> +	};

I think an easier thing would be to just add a 'touchscreen' label
to the original one, /delete-node/ &touchscreen from rolex.dts and
add the new node there (seems like it's the only used) and do nothing
in the other two using EDT_FT5306

Konrad

