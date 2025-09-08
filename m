Return-Path: <linux-arm-msm+bounces-72607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B244B49485
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE6F165DE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9C630F947;
	Mon,  8 Sep 2025 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U97Th268"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074931194C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346968; cv=none; b=SQOQ180drmmZ3dhlDsJyvJEi0Hx49t1OrUYeCbcJlPCACaSIavyVfLYNpVSnRQKEIhrqkgzXrau9KRUJylvGTXePWBCKj/OEEayE/uzAmbX8WmUk7qsk/QIiEn8Bi0h4vKA/+sCIcmVpOLDY5V64cdA7ur3VBO7EDGbQtxcEBZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346968; c=relaxed/simple;
	bh=KAC3wN1aJK43E+9u9yRPapQ08U4z5xBJ5LwIPKP+JAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LImCfwuyafP/Wzq7uwKoynZCn1fRSHfnmVL9+lYDihQ+llJ71pwaT7IPVJ8gDMrHDdmgS+TMmvgIPwBS7FWc8bIeMWN8BvPkQxqVLs/yrIt4OP40kNhFxqYEwb1/Rzo5YfVkxkUt5XNDVvbPQym8o8xJA254AI4ppXphQBCHxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U97Th268; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588AoM7o013469
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xaA2EzI7/V6N3p3V/3RVjm7H6QsTCKQ0e8YQDvM8Sk=; b=U97Th268gp41E2h7
	/woc3CRWfZfL6VAWfnAUpxGirfUDSm28ol7dYOZQghd8IjyDO2BpK9QYsvD05Tp2
	qSHbDzYzK6URki9H+SpQ/duaklPkbwwEXDw3K+DDfxn7ru1guHiFS0JTdMtynkS/
	7CFkoyRGNXv9l7XKLIxJmok2cLkTqkLp44tQA4yhbN3zx1+M18AUbGfncUojLzDe
	2PiH1HWxqznrelpKdtgcoxnNWxLxxHsUwle+M5OKyZtR5HpTDAE6heo8sFVvze2w
	PJzfFSIgiu08PHD+8OPJCAl1H9Wi2MYF5Spx6j+4pSgWsxpBLQZ6+LnPFOQEsnl7
	0apnTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdsx96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:56:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-71ce3c952c1so5121276d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346959; x=1757951759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xaA2EzI7/V6N3p3V/3RVjm7H6QsTCKQ0e8YQDvM8Sk=;
        b=Eu7vECGPAEA6p4RlG6Ocwu8/QRBLjcP84sEzipvP8ZGH9WoY3agkdpdiplTwL+19yy
         CHnjdbDVEFsKZhlWnvk3l6LGAEfwATjbb9x889JB3+5d+s3fr16639oY+l1hW0ygLSxM
         fNsYmYfzn1TrAWPYl6CZYY5HOH+sXD2jjpoTO8qVQM4NTtyCLW8UtQFeaxbxa7pTe7eG
         gKjRh/Da43phQZU0qRq0PzadwbrArhYlEvEiffc4uLgCSyUgiJbvsQfcKFPUDLXB+sYn
         3iVdSYt1yEQrfwYu0StcQ5U9ATeflYi/dX9T9wgKfgfDzRy7GdpdjQ8D2x0LPczOvA97
         tI6g==
X-Forwarded-Encrypted: i=1; AJvYcCWjBG2f2ooykYLICpVNjYbDejfcCqwEgIkhEdZreSdXlAporINK2enWVhUyt5JVGPRWZUaaNzHBhylwtcJo@vger.kernel.org
X-Gm-Message-State: AOJu0YxcNZlUIg7IQHWOxQYNdI9yfM4q6LO9sXr5FlWx6MZHc81E8dKn
	M1TNwXwk1JIDj/bF6XKMtn1RIdcepIODEGCq6OVtFKMT31wATyyb9FSg79wJb2mKvwVDh13Fl2T
	LW2UAPFnHrK+0LyFYHXV7zZNPUiW+IiMfqWuIDg9IEvFUWyQTOWyPN7LoGWzlEVf7Jwr+Czkslq
	EE
X-Gm-Gg: ASbGncv9PZPj5wc5b1TaOqoeA0YfACRea1zLLF4Ef5KMcUcqckdn2m6qq/gq/NkXrgB
	2IfgXUslIolWZbbSjAkuKCO4YOsKKQqOg0b/ktMUsIWorG0cAHp11v2Cjm2foK+Sf7MMaDibOJo
	DTBPtE5s4x4o2otb2iTtbLyjGcKKqX9Fcp7TBVYTizGLsORKM125mdoiheNetNKjwybQPclBKLk
	xNaBNWWIksAxlNnLOiAm9V1hDZbfDJ1n7c8aT7ArXxXRNPrC1OoHLn4tDYitVLRNVAEdyqHVwoe
	+jJTjAF6nn02laO5xSlYEXEvxqqtcLaBCpGfMsTYeX2b2twX1F9jpebkfxN3IJVMnzAg0Y48IGn
	9EdDFWnd7GEEi3YVRkWmxTw==
X-Received: by 2002:a05:622a:350:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5f842e182mr68367851cf.10.1757346958220;
        Mon, 08 Sep 2025 08:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+m3DUDT2VOeoBUBd/sfW/1V6KtiWmR40kAcM7D0XaeflwxuM4VlQhxuoiXlAywg4NPIPM7g==
X-Received: by 2002:a05:622a:350:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5f842e182mr68367571cf.10.1757346957675;
        Mon, 08 Sep 2025 08:55:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm2197805766b.101.2025.09.08.08.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:55:57 -0700 (PDT)
Message-ID: <5bbe50f6-5fa3-4685-8f2c-67986c5171ab@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: monaco-evk: Add sound card
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
 <20250905192350.1223812-5-umang.chheda@oss.qualcomm.com>
 <7bzlof2wyqqorhh4xck46wd43zlehm4vhej2oaxajo4dxn5p7p@oc3vikzxcwke>
 <nphea3rtl3z2tgpyn4g4hf7ticbg4kyhgv4ht25etfxspsgkv6@dm67wp7x4mdt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nphea3rtl3z2tgpyn4g4hf7ticbg4kyhgv4ht25etfxspsgkv6@dm67wp7x4mdt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lk5JI5mi2gklnhQ6koLLWIe2ItNQTxGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX2JOyQkdEcL4I
 DUM0zqaTPQJLY9tvM8nj2YFEIHbFPiSW75d8kPkg/3ZYyTvnd0u1cLY6qicXU2qIcaTWMHFkK5I
 f+TuBee9nDPIeKq4ArgG3IPg0q6m6NFWwrydkFdp9nHemU51f5zEQ06Il2tdlwoUo6VpDvGi0gr
 95XPLFUyhkbAOUY/5c3DwRJ1JgQ1gInSoXufEh26ERX2VWws3s2mDp+E/WsY5yiWowVhyJOR9bk
 XETYZ3HKoxDJzE2z+qgtM6Tm+I4m6C8brA6/yGagdeAFPD1hs9Qk9OmPg9VCDbFwTafhFUG8KMS
 vPgFqheRKL3iCkwrHegnZUqPQ3RgX15NB7+nm9gJbbZSC8hUI6IIqswL8kUaGqp3+1wR9Y9IlOv
 Z+9H53cy
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68befc94 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MWXjAKqjvAffJSE-xswA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Lk5JI5mi2gklnhQ6koLLWIe2ItNQTxGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

On 9/8/25 4:55 PM, Bjorn Andersson wrote:
> On Sat, Sep 06, 2025 at 10:26:23PM +0300, Dmitry Baryshkov wrote:
>> On Sat, Sep 06, 2025 at 12:53:50AM +0530, Umang Chheda wrote:
>>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>
>>> Add the sound card for monaco-evk board and verified playback
>>> functionality using the max98357a I2S speaker amplifier and I2S
>>> microphones. The max98357a speaker amplifier is connected via
>>> High-Speed MI2S HS0 interface, while the microphones utilize the
>>> Secondary MI2S interface and also enable required pin controller
>>> gpios for audio.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 52 +++++++++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi   | 37 ++++++++++++++++++
>>>  2 files changed, 89 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> index 93e9e5322a39..f3c5d363921e 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> @@ -6,6 +6,7 @@
>>>  /dts-v1/;
>>>
>>>  #include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>
>>>  #include "qcs8300.dtsi"
>>> @@ -24,6 +25,57 @@ aliases {
>>>  	chosen {
>>>  		stdout-path = "serial0:115200n8";
>>>  	};
>>> +
>>> +	dmic: audio-codec-0 {
>>> +		compatible = "dmic-codec";
>>> +		#sound-dai-cells = <0>;
>>> +		num-channels = <1>;
>>> +	};
>>> +
>>> +	max98357a: audio-codec-1 {
>>> +		compatible = "maxim,max98357a";
>>> +		#sound-dai-cells = <0>;
>>> +	};
>>> +
>>> +	sound {
>>> +		compatible = "qcom,qcs8275-sndcard";
>>
>> qcs8300
>>
> 
> If the Monaco EVK actually is QCS8300... But, I presume qcs8275 and
> qcs8300 are identical when it comes to sound?
> 
> @Mohammad, if this is the case can't we just support the
> qcom,monaco-sndcard instead to avoid this confusion?

Commit 34d340d48e59 ("ASoC: qcom: sc8280xp: Add support for QCS8275")

Unless we choose to ignore that compatible and add "monaco", but I don't
think dt maintainers will love that

Konrad

