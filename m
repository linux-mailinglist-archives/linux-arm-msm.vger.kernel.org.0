Return-Path: <linux-arm-msm+bounces-79831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EE7C240B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B004A4F55CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DC232E68E;
	Fri, 31 Oct 2025 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFrxatGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJSYOBuV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66768329E6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901682; cv=none; b=lTIyhr70bsQi6bATOvXFS17RLy+xCQxZPuqUe2xmcuasmYYCRr8E3XClxyfwxdauAO9RT3sHqgCLmMrxAkKoMWnn/gpVO8W3lxSem5M7aSBGSnRjHers+OIDdHKaqe8FGLWhHReVZKc5Q1h49XUtcxDXyb9uEb4Ypv2G4TPWyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901682; c=relaxed/simple;
	bh=Ewxd37XtG8WkzebUz8uPzzAoNQU9BhX4kJCqJjTT+t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBEGNtioPSYuvSkpltIZVcDwzne2R2j3h8mKRBfS1rul7tudLL4szobIbhVeT3/QdHnv/TDO2Y0SgsN5QSPjMenPDkcT/LgN8AeRU1aCAYFO7q4xewe6mGo4Tr43cR/e4W0TH2Ac2Gns54BXppRWfJyIX31xqgCrZZVYNc7z4dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFrxatGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJSYOBuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73YfF2059008
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5y9p+glX5jcR8CDJg6FMKuFGzTtIc7gtljd6iwbypU0=; b=EFrxatGBZ+RGDv89
	43lUxTbj665W4SCXjkGxIiZYZkwMsCfYsft2OxeL48Wz5oR5pluKwkCWXfOUyLcK
	cnuemXxGjoJYmCuYtquqLTEpgzbO98Z28Jtwd2fmlclgkwR8Vj4b6Ncw5whRQyBe
	kGYg8O5YYfKCJ6fdnyBcW0zn63DnA6Ld7mholFTGCeAgVgTTUVRwcnzcuYoRxhxm
	nUpmhOMNg0KuK7x5Wau2KRGFBsGbfe6QDom5x3KMrwoXHhzenc0oRAcQZQOQJNel
	1CfxHq39SR6WKsjswBgTtqfte62jGo6paqbu0jdASslIt5KlBX5VDasCIneM3RcO
	cT6VAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvgaq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:08:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e887bef16aso3866251cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761901679; x=1762506479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5y9p+glX5jcR8CDJg6FMKuFGzTtIc7gtljd6iwbypU0=;
        b=QJSYOBuVyUAVOAQQ9ew76iJVN+sBTTZqbBCojMcXcR4/yFgtWUAMZkQYGcCDk17EeV
         WPSgh7JMBFp51ACw+vjcKwn42M1u9Nw/Vbp8HDZDbyIPT+nOKMRnQT9jC9ROI3HCb5Jg
         blrOBfmqFeNw4INnxTrsl0Q3SslBK4nMbQcaYiAG9Gr2vhsGPrmo2IevEDslQztAleOw
         lkyfuHHakXompvPZvJfVgjTpxljTGESBtzYVV19d/XKX83ZYVWTxoQXX3CJNMzxhxTJS
         aX+nHVOU/Zkv7uG0VEV7GIyxdOLeRhcchuM2gKXk0eP/PyC0WlbmS29a4AUbzNdcTuka
         Pf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901679; x=1762506479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5y9p+glX5jcR8CDJg6FMKuFGzTtIc7gtljd6iwbypU0=;
        b=CWXg2jfifHu8aYvrDWP4hNoRBYGVB6MHmdg4xsE3DA/FMl/tMmQt/ZzWjZIDVEZdEy
         jehIO5HMONfwIqqxpSbMTmRoF0Urm3QR3eHBqNtX/nOHux8YFMWQv1FNZ5aIw/D45tV6
         Yc4jEvnfKOfJID20oOyj9DtEykvZcH7bBkvmncP+27dOTbILJznZU6/0gDQgDtfXhCsr
         xQM64pbwxyhXN3G2HinkY3ihGoPHt5tqvbLYGj1ndgOJh3VJOEHNCB1xzfn4UrCsx36n
         /21tN2K44o9HwHmna1AjlCx3mbis39HIKyIZ2lQEuj6XgeL16KDVCwZHi8oQvlATWzyX
         49ow==
X-Gm-Message-State: AOJu0YxoaFaKp3vXeIVhs291i63aOAVrB6PlVdq1aWpT5o2KJ9iKPN19
	D6KihfNqCsBrg7bXSLiMqMZWTpoLsaRdygkUTNC6vShBac/wUSzMdkK+4sUgJIBn21sJ3Jt6Z2A
	sJFsxCWUOQY5xmrupgxbtSM1R4rH0dFe877vqQrcQvbDm+D9F48yog/YdGWjPQzTm8XE9
X-Gm-Gg: ASbGncupOsBRfoluVKEVO0rJRGDvqwI1/7Sn2wrA2gDE8Lkx5XO4vJJY1MVGLovfDZ4
	v3tsDvSIMNHQMiWCGB/3SIVFyVoWa0LkX8OpYNpwn3WxdNw2FrmadP6g8VD5Ggam7DPbwW50U7h
	vDhGj2l4/1mCed8Fxt8+psGKwarFscKwtBHgU8AYHtKIdSp6hbMGr/M1JV0eHbDbPQ0TQVUUBq5
	jUrMVN6pv/vLPeze3HkHQeQMlndaw4O5VCINV/nWh9MgjLB9ftePLpgUdR+rkprIdhtf6IGTb0S
	4LQ2O5fxgfupsoRdtmoF47+54LKqrZEPvpg7MZCExvU61g1eqi3DbyWzssrmJnshr71EJwwj1FR
	2kZh+fKpIKO+vd4UM6UdrUcTbJA+O1wRtf5tDYcg6iu6GcM+Ykjmqpjga
X-Received: by 2002:a05:622a:1a9f:b0:4ed:154:1a70 with SMTP id d75a77b69052e-4ed30fbe3a1mr19533021cf.12.1761901679578;
        Fri, 31 Oct 2025 02:07:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnHAzyEkRs64K2/BOqNhCBYrqcMKQ0l8gxEreNmH0fMCJjYKxJseuISAeoQ5NGaAYGYsRUbg==
X-Received: by 2002:a05:622a:1a9f:b0:4ed:154:1a70 with SMTP id d75a77b69052e-4ed30fbe3a1mr19532861cf.12.1761901679065;
        Fri, 31 Oct 2025 02:07:59 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70779abc36sm125468766b.25.2025.10.31.02.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:07:58 -0700 (PDT)
Message-ID: <1398b513-0948-4775-a71d-dd06ee2296f9@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:07:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot' function
 for hpd gpio
To: Amit Singh <quic_amitsi@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251031085739.440153-1-quic_amitsi@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=69047c70 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=7M366yyIwzBhkVEls5YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4MyBTYWx0ZWRfX3YsUD51wTQ/y
 RKs6Tz1jzYmGL1WVDC36XOf11n4trp53eXDqboK+8AzoTtyt8rQ281TjXVO9tbLhSMCi7dgWMSH
 OlO/lF/xSfaJPT9By43dScyS0Lreskgs8V6ORjFNShcVzEWbPVt2XSVvporEOCgi2QfZTw0e7lN
 FdpjaqVrSMwibQJ9Iwe6Eq50+7I5qn60raGScGpRnKoNfll6WEomV0zCHUp+7f/UfCg5TNglABg
 FXH+yQuAwJ1GyOqOfK7hJ83bKDChlPw2c/uqB3+dIirXS9b+rRxdz0ggpfe9VNpTioMAk1zCN5T
 iE6Iu4vMs5i0WFJmArMzFoozdmpLTcKSbK5XjQCIbe4vitwWUUD0A3BoiUpgL2iYNzPZsoT14R0
 BwlTDR6V+G+6R/+sCV4YVY2BQkksxA==
X-Proofpoint-ORIG-GUID: BdxwtEquf9XvTLrDt6LENMy2wB6C6NCT
X-Proofpoint-GUID: BdxwtEquf9XvTLrDt6LENMy2wB6C6NCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310083

On 10/31/25 9:57 AM, Amit Singh wrote:
> Currently, hpd gpio is configured as a general-purpose gpio, which does
> not support interrupt generation. This change removes the generic
> hpd-gpios property and assigns the edp_hot function to the pin,
> enabling proper irq support.
> 
> Fixes: 756efb7cb7293 ("arm64: dts: qcom: qcs6490-rb3gen2: Add DP output")
> Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index c146161e4bb4..caa0b6784df3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -49,8 +49,6 @@ dp-connector {
>  		label = "DP";
>  		type = "mini";
>  
> -		hpd-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;

I think this change will take away DRM_BRIDGE_OP_DETECT which is very
much desired to have.. (via display_connector_probe())

Konrad

> -
>  		port {
>  			dp_connector_in: endpoint {
>  				remote-endpoint = <&mdss_edp_out>;
> @@ -1420,7 +1418,6 @@ &wifi {
>  /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
>  
>  &edp_hot_plug_det {
> -	function = "gpio";
>  	bias-disable;
>  };
>  

