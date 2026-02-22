Return-Path: <linux-arm-msm+bounces-93554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKH5ASfMmmm1jQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 10:28:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 903FF16EC5C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 10:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CD9D301700A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7332F221D89;
	Sun, 22 Feb 2026 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2nC8NIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FO7wzEHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D11EA7F4
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771752472; cv=none; b=VyXGCNnRc+ZH89WE1R2vI4vo8wqei9VQoFFPOG0frkI99YYfVlMszzvWo1DBsqtX2HTSpKOXjKnx4Op6yv1CUCbLW3k/Z7DJZMl4BKW8R1H0MvqMMAyin5zYNriAWe3ubJWLS2NeFu/gaFtaoW7QVfbOLXEEe1oto4DKr3kJ7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771752472; c=relaxed/simple;
	bh=C1nesU47mMWpdL7AX9nVL/bCsUsBztY8mSL/TOc0Hfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jh09QbNcqRcnrLZmfkoV3P71qdvsxt6khvWE6XaS3woBuUeB2Xz7j6FNcDDzg0+jAWSbmVe5XxoTwrPkIgOwgUUTXfyUUg9pH20qMMG25wUyEFXGfHmqvJPEO/mt+tev3nUp3E9gQCDovmRr56ZCq0T8JaL/Z6HEyPl0/1mRthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2nC8NIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FO7wzEHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61M6jWAD346315
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQodpeAQzStG03RWRLcwcvZQng2G3BD5YFpojdvkK6k=; b=U2nC8NIL2DsM9UhQ
	plN4XtliYj2293dlFXaoNKnI/EQhDN9CLOtWJWApRFUJpFXxm1PvnkF2v2MQsbpy
	3fmkJaMpCdq+KVur6lzBQADaoTUl2ppd/WkzOLrnyku1JX5V9JGtK635JH4VoFIZ
	4QPPzv1BqS3C48LDifmeHaD/CWQiImIVnnZYC1P52BIJAOcroCTTuLLFem6tNQbt
	GXDtytfO/gArgA4nRvEmVBZh2gODBk+ICqdA7dc+B6zkRXVWvSdZv7aIvtuTyNB+
	g/5S+YcAYGi3+J1GTZv3VZk/5l91vNEhkUvLneP/PAhS91HDcOdvVhiDanmqmMzS
	Q+0ksw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vuhyvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:27:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506a936d7afso385609591cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 01:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771752468; x=1772357268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQodpeAQzStG03RWRLcwcvZQng2G3BD5YFpojdvkK6k=;
        b=FO7wzEHUbxy/Igou3lKXLldveFsKqZrA46Nxkl4q44fbIFl9yj5aNbq+OJFb7lTGfA
         KWW6dn5VfT7Sw/o7IHeZspwvOKAfcLb2bkOQnwt1EL5Z6tMxZUxCb4RTu156jG8TlKS2
         fjerTTf2Ca0wnkVOCbIGaolU+oIj0I0DZBl3dFakz+48ntVVUeRzDzrd6WH6J1qk9h8y
         jTtE1sUcV4R4pZAQZrn8s565FB6UDaLr7D2eE2E2g8HvBu+Tmth5w1LPfC8ejmcdRaPA
         IC9wzA60h66c74Fe9PirfTcPnZEqhgQz1Yxl08YwR46sXuZy3GPqCaRa3VCGpVDZd+p0
         gSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771752468; x=1772357268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQodpeAQzStG03RWRLcwcvZQng2G3BD5YFpojdvkK6k=;
        b=Fj2oyQL93fADvvjLPJel/lq29Fss5eUb0y8Ij1jFBNmbicrsAOS+xin7pQFUbB8dOq
         Nf14IbG7il+wDmkbmr3XgU02ZzOwlUIt8HcIIa6HU2/34A9+kBd5B4vfHy12MRiRjOjF
         MtJgeWKxvtqoiLpnL5wi9bUer8gNsllPRHVK+kfTlg34sdlYaHdmOvoaxLVFaX8Xxrhf
         i9op5xtSEo2rFFT9Ab431BnTRNO9fpbJetdz61ctlOlN03scrDQbrsnk+HUjGIMKmBTt
         J7rGtQoexdJfCATtDWBoebi1ZbxWgsmMln212R6sBioDzdbyR5MLRrqRSZ7Vpqe0DSOz
         MOQQ==
X-Gm-Message-State: AOJu0Yy47PjpgVG9r1oySaX8aini5dm7Rub2ugqGeh0JtQY9W869sXXp
	aLWFwHSaD36W31UZGFzMcDC/QMlQeEuIhxwNOk3YZzcsKavSCG8s2Jez6iJE9S6tK4SGVO8Y6tR
	MNKnM5ubqSxhLViZq3Sx/LyQ0zLW9xj4fcUa4B1ie04RE3K6VZZbB2I3zs7j9paX5Ewp1
X-Gm-Gg: AZuq6aIFUnk+AIzR4WfhW9YJXzN3Kuv6REvW+Ilh1YGdbo/UFAELktrmQ4WagG8EF0p
	TPRyjZZe+X8uf8GMXsvnwjygDTZy7Kf9IAqB6/4GIR02nFH5qTSwLrY7aSbqwUbIQTXxSjYT132
	vk9zvEs1tVvHNeThpoZ2i56umbCysXGfohvmnn7PfCGuRzpzZ0243yx+ywB44njWOAxVzCWAX/3
	aXYwEjUIxgMmnsBker2s3eP2e8HmUZ+9o4eRrvX8kWS9VN9+00/br1KleVq2d6tT9GgXtaewnUN
	YL+nWU9WeJF0t1EQhnHgQ3Xv65JnTir2EBS37zCXaeuM6+NB4JS/NZe0xqyImd+f5sz/fUHvYC0
	4XjwnJd7UQCj9aNyGbIPlZ7AnoTvH7Eyf0j3ppeL3PTAM7dvT
X-Received: by 2002:a05:620a:1aa7:b0:8b2:e922:5297 with SMTP id af79cd13be357-8cb8c9ff111mr646834285a.21.1771752468108;
        Sun, 22 Feb 2026 01:27:48 -0800 (PST)
X-Received: by 2002:a05:620a:1aa7:b0:8b2:e922:5297 with SMTP id af79cd13be357-8cb8c9ff111mr646832285a.21.1771752467604;
        Sun, 22 Feb 2026 01:27:47 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm203462815e9.3.2026.02.22.01.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 01:27:47 -0800 (PST)
Message-ID: <c94921b6-dd17-448f-b7ab-c0dfdae77df1@oss.qualcomm.com>
Date: Sun, 22 Feb 2026 09:27:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: agatti: add LPASS devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
 <d388ffc1-5e4d-4331-9a8b-a553261edc6b@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d388ffc1-5e4d-4331-9a8b-a553261edc6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699acc14 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RvN6zFoaEpqDBN6Xa2YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OnYa0yJIFzFtdO_7gWbB6UdRNx40zTqJ
X-Proofpoint-ORIG-GUID: OnYa0yJIFzFtdO_7gWbB6UdRNx40zTqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDA4OSBTYWx0ZWRfXwcW5osFWFJQ4
 2wOVAQfn4USoxIV0GDNWhD5P6ICSb1bXxDeP6VV8DUIUCUWTL8CQQDJhG13djuy4IvwTGB3tjG6
 u+hYdFAcrjqSsaSMVxX4n8wfknce9CDWYzG/XwNXcA01hK9p2HFG4hqItRTThe7Df9/AzNlrkEj
 KfNOvu9TgkPDMtj9dEaPUju18+/FIrMlMKCVZLUtXTF2SmAWBClD1RzxLT8Vo/SJl97LbEsqQ4E
 1UQgxVXqJZMOQ/qQ4SEw/qg+vHS47RcoQ+Bjayb2R1SZT48m4t1zsm6Pp0CwPpwV/j3NS1U3b/Q
 d9rFhPDIcUjPsJeRujR60xgikv3U1kL/Jq3UezdHU7y+izcLPpCgfcsBjHPQbHhOGmH+sxLwIFo
 Oekr06yikbaznMfgGJVlsc6ND5nvnUNkXB/Esg9PBd2Qfjad/O6CoaMvbsc59eW/BmC+4yGhZyA
 /pr0gN2AQa3i7Ep15Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93554-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,a740000:email,a610000:email,a600000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 903FF16EC5C
X-Rspamd-Action: no action

On 2/10/26 10:16 AM, Konrad Dybcio wrote:
> On 2/9/26 3:24 PM, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>> controllers are required to support audio playback and
>> audio capture on sm6115 and its derivatives.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		rxmacro: codec@a600000 {
>> +			compatible = "qcom,sm6115-lpass-rx-macro";
>> +			reg = <0x0 0xa600000 0x0 0x1000>;
>> +
>> +			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
>> +				LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&vamacro>;
>> +			clock-names = "mclk",
>> +				      "npl",
>> +				      "dcodec",
>> +				      "fsgen";
>> +			assigned-clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
>> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +					  <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
>> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +			assigned-clock-rates = <22579200>,
>> +					       <22579200>;
> 
> Is this necessary?
Not required tbh.
> 
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		swr1: soundwire@a610000 {
>> +			compatible = "qcom,soundwire-v1.6.0";
>> +			reg = <0x0 0x0a610000 0x0 0x2000>;
> 
> Let's set size=0x10_000 (it's got that much reserved for it)
> 
make;s sense
>> +			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&rxmacro>;
>> +			clock-names = "iface";
>> +
>> +			resets = <&lpass_audiocc 0>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			label = "RX";
>> +			qcom,din-ports = <0>;
>> +			qcom,dout-ports = <5>;
>> +
>> +			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
>> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
>> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
>> +			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
>> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
>> +			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
>> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
>> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
>> +			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
>> +
>> +			status = "disabled";
> 
> No need to disable, I think
Ok
> 
>> +
>> +			#sound-dai-cells = <1>;
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +		};
>> +
>> +
>> +		txmacro: codec@a620000 {
>> +			compatible = "qcom,sm6115-lpass-tx-macro";
>> +			reg = <0x0 0x0a620000 0x0 0x1000>;
>> +
>> +			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&vamacro>;..
> 
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		lpass_audiocc: clock-controller@a6a9000 {
>> +			compatible = "qcom,sm6115-lpassaudiocc";
>> +			reg = <0x0 0x0a6a9000 0x0 0x1000>;
> 
> This region is called 'LPASS_AUDIO_CSR' with the correct size and length
we should.

> 
> 
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +
>> +		swr0: soundwire@a740000 {
>> +			compatible = "qcom,soundwire-v1.6.0";
>> +			reg = <0x0 0x0a740000 0x0 0x2000>;
> 
> sz=0x10_000
Yes, we can add full range.
> 
>> +			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&txmacro>;
>> +			clock-names = "iface";
>> +
>> +			resets = <&lpasscc 0>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			label = "VA_TX";
>> +			qcom,din-ports = <3>;
>> +			qcom,dout-ports = <0>;
>> +
>> +			qcoze-cells = <0>;
>> +		};
>> +
>> +		lpasscc: clock-controller@a7ec000 {
>> +			compatible = "qcom,sm6115-lpasscc";
>> +			reg = <0x0 0x0a7ec000 0x0 0x1000>;
> 
> This isn't quite right.. it's at LPASS_TCSR (0xa7e0000) + 0xc000
> 
> Not sure if we're gonna need the rest of it in the future, but it may
> be smart to describe the whole thing.. Too bad I didn't know about it
> when I first submitted that driver...
Yes, the driver needs fixing, we do it correctly for sc8280xp

--srini
> 
> Konrad


