Return-Path: <linux-arm-msm+bounces-89690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB24D3ACA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 678F4301D61C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEE036BCC6;
	Mon, 19 Jan 2026 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/9J/JWq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lig5wHdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3175633ADA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833673; cv=none; b=dY7r1mSAPq3jplL+8QuU3MYND2aR3qfAhdqfvoCwXx8WwI/GJF5l0IvJqGtxTNqiOsLt/5fmzuhN1aOVTndAK/lhGzjY3uwMe+HMZP89hOTj215+tRyDz25RzmvLTWk1Y0Y4hiGXZYiREvw41lpdxhoNVEHL6Jk9S/sCDamD3/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833673; c=relaxed/simple;
	bh=yg6SXcloJGmJLSUFypYVPsO2vcnz5ICLgzuvBEPL1A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKzOG7UJk+qe16Cvwbts+PbnOJuKuiTGPHyCmeWxjkoOB8QPTeoHcW3NVUEWFkaigt3BqrRsqKpAEr9PDxGPBFnedphEruh5YLwx8OQ6y5VZo+BXIrpH41WQlkHaa6g6w9wQ/QOKIB5kH94HYBeYIR8caFUdpBQ/Gqv7ebGO7S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/9J/JWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lig5wHdD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J914Gh903258
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aXbYMXdhaJIz9VzAOKmHA9NGQuHXXe77OASnsSmBNI=; b=F/9J/JWqO7Dnci5Z
	hiccikZ44wG4TVIPeeAEzIRpadHsn/zH9/0nu+73eQzYDWQoYY6K01MbEz0aQfmc
	u6c5OLntOqpxIqPTN65i91um3XO0qdAqCZ0X7UIagzyeAMuXj5BFaavcjN0Srdm6
	sdNLy5X+VX6m6d0Wkqnh283smKFslLKiB2U92elN4HOhgJnwD7OkcgH4bVwOiCnt
	Hxt7B0rrJiUZlv2UbnJUkTGGjzfwrbJbibhglqNnHvDJ8ydSDKstg9HOORLymWiJ
	x4yZBLDiEBrY+R5e+InWD43W4dTrjV0C/CEP2pxlRSpsDWrz4SMp2Ezy/Ust+OU6
	5EV/tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yt5cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:41:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so108953085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768833669; x=1769438469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aXbYMXdhaJIz9VzAOKmHA9NGQuHXXe77OASnsSmBNI=;
        b=Lig5wHdDpCVrtxoFsblq/Pu+4zfV1iMTgvndlCQKYJt+UN7fodEf88yehmNHfF4XL5
         g4j40fXW8iw9BqQR3fNnJPFVr9mDAX6qSoYR1F+OBAHkpw+3TDmAvkAsVBEdlD5BZKFb
         JwVkP81NWZr8Lvb0rhrW9FzhNDyN9xJuq5bhU1mUuBQQSihnC4RgHXVTo6nMK7NcAyim
         K6AVr0Z9+xOM5etp3E5SshKym71TY0o8wsMxy5XN7uaa8opViXTp7bRyrKrQBNUCRjxM
         ZKTy94QW33n5CWQawjo24l/1+X19tFMOFu1rFyTHe+rbqMKBqVjizMAsprRkqIZbZ0jV
         oVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833669; x=1769438469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aXbYMXdhaJIz9VzAOKmHA9NGQuHXXe77OASnsSmBNI=;
        b=mnjF8Zt0EuikMFbf73jBzhdjWXyXPzcgPjdw8YPXjBoRr0+D2PGaaK+BvXy9jAfZn3
         lvoalMWjms1xRK2XhSiw/ADALhoMzHwd/86dKr0bjjjqf4wg1zHwtUpq8shjAlbFjRhk
         skQXRg7vfKc/+l2cJY7TI1qAV/2tFSuShqtx7qRVdcVOsQVSHj1UlsOFUPUyZkTZGv0L
         AEpiPDqai51tZbkhwkWAcnmTPfpBT9rVYjzyWwgCrLwbwpKxFqrRuwmA59iQ+cTxlebo
         /Bl2/l1DV3yjn2x2IJSfqbprE/Y+EjueYAhZ6H2ciz6dSE5iQR0xR2beGkW8KiWfCcCH
         NuFA==
X-Forwarded-Encrypted: i=1; AJvYcCUaVxd0/9VylqfQobyRBqPgWhIOFfi7ocAKeoRHlCNz/ZXdMiK+23HmODepHnvXK6XhXzPuJT00qm+d+X0u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5WOzbfy3L96pfXif7BpuIPQL7I9PsVEjIx4SElAytumZ7431
	uavTW27v9P93vloWyGHhhGasIvPeNv2pD+ycV/lH1sVb/YP4lwRNRbK59TFp2/mVFOxcX57VnhC
	RbviZBywAWI+kz6S7mPzS2eV0cx7p0EwiZaj6VnV20rN+2OTXHq6t+WBZFzEiyB33KWx3
X-Gm-Gg: AY/fxX79gjjifgYTl629JZ2qHUsyKwXt2Ph5t1ASO3ic6Yf1Z5h7SZOn6KKvnP/ixW0
	UzvrywA3R5h8S5PDojPhO4xji3/6BhDrj3vRRnTfdWKpm0jMQxSkZ4j8ONsuU+ryLlYtUwOwyEY
	E9KEXD/CvFtdEjzHw11//lM94MIClcfoFIKlFFXfCptmbGn0Q0i+ixHTrmo5hxIP0C5b1UPjTXH
	BjwlW8TLtU1WH3K/ttGrm9LXCCi2sQuatBTbErdvcxC5BQPxhFo02DtI/aHH5pzP4WxE7iKhBpr
	L0XWgJgIGf8IKb7R954Xow7UneVrnMVSeF2u8iu5OaVd5hPEOOqxNvY6qM/fJZZU1ppQCDKAFvJ
	FUT5qGmUZ9c95+ogSh0UIdapC5gXNGBACyJSmugJ8DvgTm3gwJWSu/rbNs9btSr5Csgo=
X-Received: by 2002:a05:620a:2a05:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6a67bc788mr1133450785a.9.1768833669394;
        Mon, 19 Jan 2026 06:41:09 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6a67bc788mr1133447285a.9.1768833668948;
        Mon, 19 Jan 2026 06:41:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c7bsm1178573966b.20.2026.01.19.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:41:08 -0800 (PST)
Message-ID: <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:41:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e4286 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=p04JXNiKSxiIgApV0UoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMyBTYWx0ZWRfXyOdlCXyFO5C0
 XCND7NEFtN+52C7RYpzOdlHfHfi0ZF6IDMYiheC2P5wtZFBktQDQcDQGJ/gBHQsiR6BPLNawAyM
 u+H6Ao74fLCCDyhPHKL+gWOdLkKC54m5viCaKcaldiviETU0tm1g0ysHt9cFXDRWhgFpASiE1WR
 0NHX6u7XyJXIu0ds5pc+Mdn8x3YiPGPz138YvWOZcYryYSQiV01r6JWNgXW0bNbYqVoN8hbaZw5
 n2LGjbibRAUCRIeb4qwOm4mywHs0OTEk7dcJHfMXdi0CnkrNAVlSA+31BRg1C64vJ5FJL8AsipW
 eJplGPldc05nwx7OHvfSPh7qpSsA6oIJfpMBnRHQzPmWpcmma2F5driVfS/p2PEaOLlIzfLJsrh
 /4YanmlkrH1Dz5F8Jqpa4IDA3RAr73hYg5KyZtT50TUBa7hnxa3/jA5mkMvaWZ0G+dLXifkkMff
 G2wsjjYJ5C4UYHGzDHw==
X-Proofpoint-ORIG-GUID: UW5b3LqKEVvv2wE-EmjDvGbXHKPYf7Zb
X-Proofpoint-GUID: UW5b3LqKEVvv2wE-EmjDvGbXHKPYf7Zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190123

On 1/16/26 3:22 PM, Luca Weiss wrote:
> Add a node for the Hall Effect sensor, used to detect whether the Flip
> Cover is closed or not.
> 
> The sensor is powered through vreg_l10b, so let's put a
> regulator-always-on on that to make sure the sensor gets power.

Is there anything else on L10B? Can we turn it off if the hall sensor
is e.g. user-disabled?

Konrad

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 7629ceddde2a..98b3fc654206 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -32,6 +32,16 @@ gpio-keys {
>  		pinctrl-0 = <&volume_up_default>;
>  		pinctrl-names = "default";
>  
> +		/* Powered by the always-on vreg_l10b */
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
>  		key-volume-up {
>  			label = "Volume Up";
>  			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
> @@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			/* Hall sensor VDD */
> +			regulator-always-on;
>  		};
>  
>  		vreg_l11b: ldo11 {
> 
> ---
> base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
> change-id: 20260116-fp6-hall-sensor-1049f2f872ac
> 
> Best regards,

