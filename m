Return-Path: <linux-arm-msm+bounces-90145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAwJOG/scWl6ZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:22:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C46475B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFCCD7E9458
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AD733AD9A;
	Thu, 22 Jan 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC4DZSlI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TT7K1Ebt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438D329E64
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073315; cv=none; b=U47IbtDj3RytIVG7lZopT7oTQhvFzv1PBfwDB5aenufK0J/gPk7iC71Wavl16YT99gl6a7xVf+pOai1oqJAgZC3Cx5EUTnpr27YFwrbyCTfHiRus5J3J/n+yI3nGgKyCdh7PMEXW58e92eYNcyipI+j9luYEi0zSmY2ioUNb9wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073315; c=relaxed/simple;
	bh=mJ0vgCKye1UqxT59lIrROPj3m8+igVctoYmfCDLJ0RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoEh9HXCdd6eJPibDuQQi3zfr8Gilk0yW6K4otOubEWNFJfiYZ7HL2U9ryWllH/TZF0lxQUt83A03P2HM4yNPZ2QAPxgLfBKyqvRY+2SOLcKU2WuvyCVspLsvUZqVN8JGssDuPpL2eu+8/i+faB54LnkglreaEHvI0dbdARdP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC4DZSlI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TT7K1Ebt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M84C35789677
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hG2JmDsNT8t96Xwz5s7F3bBzVMBIxS6BhytG2Bt0OQ0=; b=cC4DZSlI+K+w/Kpn
	rDghF6SnzjfNcmklfxBJG/MSbuTl+6fTrAqJcc2hnZ5kSs0YdVIcHyR+BaE5vbJK
	y1hjw76tFBctX0vgr3T56YXH7VB+rYWgtibAvEobOuZwedevuBMFT8O9zRbgPn7q
	HFXiGIWTEmylsEP+sywf48qVbZACeJLnY68ZDrLFXYqs4ljlXW39/jUO5bBLVB2l
	9FfEutYNm+rVlk1+uDPDy8CNUYLpMO8k/yF+s4ZmjG0ocrj/3osLrR8bCliycfcS
	3HPqnbt2H170WkXFxGZAbSJPy05oJHAVBCbaSXP4X0neBSc1qZLZ86iiC2QKIIGA
	VV7kEQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6p1httg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:15:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8888ae5976aso2847246d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769073310; x=1769678110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hG2JmDsNT8t96Xwz5s7F3bBzVMBIxS6BhytG2Bt0OQ0=;
        b=TT7K1EbtwshceIQcXN1e9C2DkFh952EJrqk1+WKZqy2wU+mlD1m4j1Uty805YJI+Ig
         UUdm1NCNE2F+x4YcN5sJrPk4Wv3qFFiGjwbebgIf5MJn9nb6FKJUMTFjH+O1eAIogXQr
         fpbSywgY4cjQa6pby9Q3fcRl3TAW/N9ITHFDI1o6XVoMDP7EZDjatjfZb6wZWUOeqskU
         mRlv/8xskRe8TwUwRabkywkdFGVib6cekcFcHrVYPUUaNRjhfjj+DKoCU/EcBEugEfIk
         mrM2teA35BSi813NfUfGrbVYhN1EgDmVzUtmYZvifN4viSNldGheIdtBMGQXEQregbKK
         ppmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073310; x=1769678110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG2JmDsNT8t96Xwz5s7F3bBzVMBIxS6BhytG2Bt0OQ0=;
        b=wdrVFmw6vOn9818kC3dgeRDu5PD84l4CZp4Av83Nd5lczO1YavhkqS3h7z0ar1kQjL
         cJnCgq2s+yH4smO2baZABveSgDe/ipRrEhSs1r1h66KKXMM0+dxL4rgjxRt8FGEAdE+9
         HBXJTmCY27YE+u25fJa1geANVCJA6YFOSuwIk9JMGr9Q6Khn1e2yko0FJ7bKhGuLUQOy
         eXDKUiOYSVDhPtwpefMRfzVbrdrs9JHYpn0/KhLRg0fXZyUF8X16mllsSAUoQuUnukrc
         TCSgIGPbaJDsotseWv9BjGEnpjQW5ssgXHacR30JupClqz/D8Hy+m3Lm8yhvhmORSELu
         f5qA==
X-Forwarded-Encrypted: i=1; AJvYcCW8X5RfWhSMVovJvnh9vYrTKZhbGCdEbLvtq3QPicDrpusTYza8YlDYaL6RxRmKOKAFRo8YKOOoJ8V6Z8kz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CAI19MbSwi8VB1JpKg+WKFmmWAixFc+BgRHrsnDA9e2E5Ua0
	KZCjtoSLi59qpZf4exWpJQ3uy/Tl8Q5vssauaXD1AWZD/pqnkErvTTH+ASnvHDDsq2XgbhrEoS6
	eBtEkiQiGKe9us5S5iZnGaBlRBCo37Xwr3RGFsjQlQuvlcvUXcI1AyyT66SXb+mK/OjED
X-Gm-Gg: AZuq6aK8GfAPe2mNqdwVgHtyPtRM/1PUWLxVpW0nP7JeGIlqsZddojYM8CiOhW7Dka8
	MsWo8A4N9VHEZSgjR1VPg3531jUi6vASgYV+I9blyhp5XPKc3YJa+S4bY1DbBaY6qLzogGzMu/D
	vBXTcSRl7rjkrGRL9z8ttL3KOUS8LD3nbEScijZFF3AdQRQLopVUKM6JOhjb6EM7tID9LPyDaAJ
	xjSq9eBLhQ6Fo1kPylhSDTwSi0J/otEAVJ1GsP1cEp+sTn/50tOdH4ApKk0HzU1cTcaD7EIJR8P
	LCRkvgwfdM8IxZtRLSlBW5h52+N4uydDa6VAXVYh4SM7LH6oWthqicbFvuOg2xzel8h2UgGcywE
	QYQgzhdN/Ph3VWbvXNvWkrMwUoC71iabDrrUF+6s7PlAOvvwWpvTrLWsDeqgnyjIcEW4=
X-Received: by 2002:a05:620a:1aa9:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c6a67cc5b2mr2004301785a.11.1769073309705;
        Thu, 22 Jan 2026 01:15:09 -0800 (PST)
X-Received: by 2002:a05:620a:1aa9:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c6a67cc5b2mr2004298785a.11.1769073309034;
        Thu, 22 Jan 2026 01:15:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168b9bsm1693992766b.16.2026.01.22.01.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 01:15:08 -0800 (PST)
Message-ID: <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:15:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K1MTPUC3CAJCMQm7zAXFELVmCwmAk2wo
X-Authority-Analysis: v=2.4 cv=N7ck1m9B c=1 sm=1 tr=0 ts=6971ea9e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=BfLt2Qf9Yghiec0bZR0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K1MTPUC3CAJCMQm7zAXFELVmCwmAk2wo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2MiBTYWx0ZWRfX1gHWHgqSC65s
 NnMBRj/CDxXK9vLtaunsDL87/gxuI1OokjAvtd9vv9pVVc8aYhlLKkZ+O5g68d134ruLO3ViBRH
 Yn11k/1Lom5ncwKs+hc2EpX64kpe4r7oX77CEc2sxEXe3tRBYGa04ozw+BInsWqGdFhBb2N8ByQ
 eENwm36BnE8Mltp4Tq41709Lcvselb5zS9AjXOhnxcHTPUy/LekC11V8W8hGRWMB9RbWATsMWn7
 zShZkD767ci9m8aSTE63QLZpwvNpxXG32YebdoWkfu3gY5OUIP+73QwFFia4X9wYafMEXkphakF
 dWZSZaVJycjb1bNMM+zJn4o2eVCX0sAOehUhBjvGC70SaHfo7UfHD0C3DZhzT7ufgfdI1nyjr3A
 +jCj4ZTkBUySsdQIIvnwRn4kQEOgW4g6zES2b9nZlK9TVj2l17sPeXXOSs8wnjskvpBBl0eNJLK
 aUvR/WhLrtuInADM21A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-90145-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,0.0.0.0:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 509C46475B
X-Rspamd-Action: no action

On 1/21/26 5:40 PM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
> 
> The design is similar to a phone wihout the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
> 
> Display support will be added in a second time.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +	fan: pwm-fan {

I'd call it fan {} but gray/grey

> +		status = "okay";

You can drop this line (nothing disables it)

> +		compatible = "pwm-fan";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended looks neater

> +
> +		pinctrl-0 = <&fan_pwr_active>,
> +			    <&pwm_fan_ctrl_default>,
> +			    <&fan_int_active>;
> +		pinctrl-1 = <&fan_pwr_sleep>;

fan-pwr looks like an EN pin of a GPIO-controlled regulator

> +		pinctrl-names = "default",
> +				"sleep";
> +
> +		pwms = <&pm8550_pwm 3 50000>;
> +
> +		#cooling-cells = <2>;
> +		cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;

Does this come from a preexisting map?

> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_n>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8650-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +			self-powered;

Is this property interpreted at all by our setup?

[...]

> +	sound {
> +		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8650-APS2";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"DMIC1", "MIC BIAS1",
> +				"DMIC2", "MIC BIAS2",
> +				"AMIC2", "MIC BIAS2",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT",
> +				"TX SWR_INPUT7", "DMIC1_OUTPUT",
> +				"TX SWR_INPUT8", "DMIC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wcd939x 0>,
> +					    <&swr1 0>,
> +					    <&lpass_rxmacro 0>;
> +			};

'co'dec < 'cp'u

[...]

> +	wcd939x: audio-codec {

'a'udio-codec should be way higher

[...]

> +	thermal-zones {
> +		cpu2-top-thermal {
> +			trips {
> +				cpu2_active: cpu2-active {
> +					temperature = <38000>;
> +					hysteresis = <2000>;
> +					type = "active";

This is shaky.. let's perhaps reference each thermal zone that you want
to extend with a label.. Or maybe a pair of labels for trips/cooling-maps
per zone?

[...]

> +&pcieport1 {
> +	pinctrl-0 = <&upd720201_active>;

Is this a regulator?

> +	pinctrl-names = "default";
> +
> +	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */

DON'T SCREAM! :P

> +	usb-controller@0 {
> +		compatible = "pci1912,0014";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		pinctrl-0 = <&gamepad_pwr_en>;
> +		pinctrl-names = "default";

Is there a hub connected to it? Or does it go directly to the
aforementioned (game) controller?

[...]

> +&pm8550_pwm {
> +	status = "okay";
> +
> +	multi-led {
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_STATUS;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Would a label="xyz" be useful here?

[...]

> +&tlmm {
> +	/* Reserved I/Os for NFC */
> +	gpio-reserved-ranges = <32 4>,  <36 1>, <38 6>, <74 1>;

double space

Are they all for NFC, are they all required?

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 07ae74851621..fcd5a1a45803 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>  				};
>  			};
>  
> -			pcie@0 {
> +			pcieport1: pcie@0 {

pcie1_port0, please

Konrad

