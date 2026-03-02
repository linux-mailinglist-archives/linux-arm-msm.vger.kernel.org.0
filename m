Return-Path: <linux-arm-msm+bounces-94957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJDmKQWfpWnACAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:30:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D2D1DAD0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 224103069A27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3C13FD14F;
	Mon,  2 Mar 2026 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGeUqWTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ovc2aNYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351D40149C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461176; cv=none; b=HjAb19FAxb5ZmQqLW7PX8ZmryN3v1XPA0oMw987hvNfH4NKtkKy8cwue/yDb2bg5RGERON/sQZ9cseTHiMr3ElrO2wFH9uqnB8Qk5CDs3g/iSFw5jZA2PKvhNu/7Zy6rtR3dPCYQ4GpKwEY1zE5gOCP6BEbM440WcX6tuthVwpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461176; c=relaxed/simple;
	bh=pATfqLu+e2vqZ4O40YVHYShR1JR8UGne+lTZ9RVoEQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8e5JlSSqnzp4SLKQoFFRLb/vYFNq/XUm6egZqo6BzGhDD3/EuRRe0Xoudhn7byuAS3MZdM9gokfA2msfvOVk0143C8/NJ7Z4JMpFmcQbKH3FLU5WwHTZazVA/dmwaWcK3I+TKGlJIZqrWJGh5+zJ5EOtGdFPbBfttz9AcRJZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGeUqWTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ovc2aNYL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EmaP3630787
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=; b=RGeUqWTVOt4Re0fA
	Rw6mJufAeAi28bVyMVkohFE5iZY6p6n0as0LiN73UTDEsoZKYEp5ZCqFWswmT106
	Td5LGDPwwjcuZG8GJQEI6i/P0ijVSG+Fu8iy4sFUPBrsSeMU4ZwZ8xLBGtmeq1BM
	dzgZ9FVkL2ahEuOrhHaM1PuNEkNXdcQ85GJpXQDyxHLUtQi95wK/XblaRoTugFgD
	v6AgbcIR0MEuVA3mtTJwybgNBA9BcRHOKpqWs23pS3GBRFDKWtPd92C6wHav9wqQ
	sYhfFK8xTHknlr9iWUSjsA1fEohCcZ11Pstvv1O+3VGjlCUpJq69xhSPyleZH3vi
	LUvOcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhry0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:19:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4025302aso383889985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461173; x=1773065973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=Ovc2aNYLfZqQfRo0WGUnLB2vo7F5ZawB1O9fbqe2nWRBhQfx5zDYz+81ONLNEDSNSi
         ioev076ovPEyo7U0qHpVvRmzz7IgK6ZYA945ZdaYp2SGpWojMN+aFzjj7eQR8AgHGukh
         VonRgbfuZg73GEWKBFsirwZvWMLsS3U8mPbNuHIQHsqY9uYISJAsH/on5UAyUXoNUwGm
         SqmpVu9G9mlXbBo7qy/2RfXs1pygwmgHdMa7+5JcgjS+wRL31imsyjAweQOd8jdMEnGZ
         U3CWFX7oNeZ3JhF85GM0SsL3cpUmjRAxqZV7SgHB5YqtB8jiQYlGQ54m/ODLs6Id9ffV
         IUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461173; x=1773065973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=M0Iijz01NwMndCdKWR0SMqc+/g6IE6xwXBcJZ7Y2VZ9KRUZi126O7HPT/2bES39qFr
         eyII424Sio0F9gspgzEy9g8Vmu6xIHMPn0YzqqvFxLgabZDu/HF5PaBNd8JNPpNiZGuP
         7ItYZQJNfKDL+74cBTOtjYXcnqLzkgt+ZaL0dNXdz7kbZAZNCM+ykZU4mbVYRrpThyLr
         +ofCc6kF8GB+quSdk9wciYMlaIn5zng5pmXqAaJnjZRr8R3eyaHZRGFJEBjrrjfscsuT
         MkFcfcoF2t7JGqlJnyiaOCk6Pp7Nm0u+xjQRFRyhSqOTO/9sgI3bIPR2EQmaYHq85QVy
         UgVw==
X-Gm-Message-State: AOJu0YxYcJLaLCDlqmNzINhTlQQGHxb7RYzR+b7Vd8QPDnN75kNcCm8L
	jX+elK+Mr9Evrl4QAyeNKjnke3eMWRTDJpy3M1ExD9Iml6LxUTjDAQX7Jqu22ILnBPUyAjnZ8NU
	/FBRtEg3RBCDRKl98FjF4s82TolP8/LWfwU9EhX7Pq1RuM04ZqET9DsVkCHAo06Gqm/DC
X-Gm-Gg: ATEYQzwC62Pvtsxlk4s0Cn3XeiNsAyUSXloiJisiqK+Se0zPTftBkcHYZr4USgNQdXU
	BUfCmaH0ej7whOsZWdMXmaZvGjRs2StsbXKL4qdH6m9I/XTk3Zw4EFGhJ1fnfykp4IZYpu9e5mY
	mHPpsAf450DJbgrFePLM3i9wuM0njk3+5esRUrmMUZkEAbip8NDj952MyTsiQKY2ZtzH5WQ8WuZ
	1EJW0kwqAP17Lko42fInsOeuMuDXsaWItCOqFpz5KRpV/nnQvd9JRUAODvNqCrQNAx39e41ILiF
	Aci7ip52g3gvXxDUCczcjpKLaYPaEIJ8Coq0qjp4Z75rT2lpGvfIQPtU+xWadI9snDEfDcM6VaR
	hbvxuiWz5lyBOG3kCwflTk3DmtMfUuUUFChpWbH7PhF2fKL1to0HD2jraalFflfhqNO1qdEVsFa
	8C8JQ=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228838385a.10.1772461173143;
        Mon, 02 Mar 2026 06:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228833585a.10.1772461172660;
        Mon, 02 Mar 2026 06:19:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac07c09fsm3499457a12.32.2026.03.02.06.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:19:30 -0800 (PST)
Message-ID: <9cb20af1-c2f5-4511-a066-24bc689d2fa5@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:19:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
 <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VVSKmfe9krJur8BRS2UmJs3uBSB21p1c
X-Proofpoint-GUID: VVSKmfe9krJur8BRS2UmJs3uBSB21p1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMCBTYWx0ZWRfX0G4SIf5QUtnI
 dlMSdJdOU2IUbEDcgzrCj8fYAyUXuqo+yJqWR8GJ5sM3OPyurAa8/elEMS/PQYU6G8oZpIcxAir
 OGKqlyObw3C4UIZN1x/H5iwFcZhl/ZcRlbEceUJP34TRwcWjG5T48ppxhjEW5Wr4GrGQVyniJ6+
 tG9jCWiuDuSjxhpV2EkU0AjAfm5kSBFeyADz5wi2rq/0uzPO457Ky7elOySgtCipB0BD81viUiz
 20apo8q12J8aYzwXNGQy+5xP35Tg4tw3mY2M8oM2ac+QUfW3NvOwZ0LSFK650Vi7nixqFoCi4JJ
 hfLSEq8XTGaQ3WzE+0BciwKKJaQz37U0jikgMH5K74oRfiDyo5HLFLtX5Fl+YX9u4A04UZ5Fxbu
 qaf9qPaJXMeJld35fQMt5rUymjdy7KCOjpJ9IEix957Vw0/6bZA/IozDi6DAm4QJb77IjEM7DEl
 9gakdHBN9tZyLb+Zplw==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a59c75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=__G2b6sp-w7MuTAc3JcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020120
X-Rspamd-Queue-Id: A4D2D1DAD0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94957-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/27/26 6:29 AM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

I think this mandates regulator-always-on, as we don't have a 
better solution for that now

Konrad

> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	/* PM8010_M */
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

typo: 'vreg'

> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
>  
>  &iris {
> 

