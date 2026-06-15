Return-Path: <linux-arm-msm+bounces-113223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ojUIMkgMGr5OQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:56:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD7687F8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:56:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pNg4LYxG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IZMwiFLr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113223-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113223-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C9213006B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D1B4071FC;
	Mon, 15 Jun 2026 15:56:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C064403E96
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:56:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539015; cv=none; b=kIHIO+7pC16vWjCsNW1rl2d9xsGeTLXQggxjgk7e4fllMxPP8rByw1qdiaBwk1tbEgPVoXoN6Y7iEeLBU0Nl8YZPneaa/mlfHzq0+vywCv3M6M+1dBfLtWf8rRrYVgeB9KTaTw8YYLdEaRBVhIwIkxb8ms+01zoeCb9/dvyIoN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539015; c=relaxed/simple;
	bh=VC4ByHWhUnEY9FgLt9VYI53AreHcL/oYIeZhf09f3ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQLlmEP4nMeL6mlvU4h+QTqGSOiO804C2HUWI8vESja8kd0ytWoQnNEo6JTroEAwQeMjMnud6XtUwqlDDCyg6eUh5bMBKCBrTYMfJp2kioEcNp31MJBVyguvm5MwBJzfNo3UJbBJLuJxtuzYm9XsSdbVhN3DirQ1Aok0DxGDBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNg4LYxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZMwiFLr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhWt7430545
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJpg6TL0Li8c78MGRrrP7ZdsT1joHJVHeC0IPMlRV/Q=; b=pNg4LYxGnJo1YLrt
	JHGSSXZ8d7vc0xwLIS30M2ktRnCS0DFopofofc7jU9FNC6yQaqFb4jaOY5y7ivd+
	klX7wuClE+8iYKkucw1aar8fnc7XJTpUh7MAe3Tkb3mBmwtbtsjKIO9ffZHzRqzt
	uWlud+LwQD96K4/i0PgrOY6nywBiVGqsfabNVvniPsnDkXlVkApOTczH6dQWIonk
	2j+NIvrFHhGcFIohspRATPthTdoudOoYFOL+nVmTdgb6bzvoLk3tPI7tJkBjU7aB
	QOzlOypUAyKwW51g+SgSV7EPbk0gskVP8yLIol/C0wxFTZWK/po8G4mAqiep9dnr
	OKMX7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd9jnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:56:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915732517cdso10760985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781539013; x=1782143813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJpg6TL0Li8c78MGRrrP7ZdsT1joHJVHeC0IPMlRV/Q=;
        b=IZMwiFLrwljCHbq/236VMtSY0ZP2lu2qRNy8P4K8SKdBNoGbAha/GgHMKni33ZtaGx
         Ba1pNc+RtBl6b+txwQPDcWHq4bIzbVY10FAfhYhlKaqUqCMfAm2iM+dkXzzeHl2gWfD1
         PRGUFnVqSIxXdaict4Gdnbv0NgMNWKkfFsuXnPR2RCQKhESDLlngfkAurHbzH8h3vrLS
         JI3qYjUT9TwAf2I+hN8NR9I+M+zshWOfDwOZGxJe5pwIJlYPojmcrO5Pm1+0DBRu3Y85
         4SSSECh1hlAkNYwK/Vdp6EGu0hga0anCYQnTImMELLNywMjcx7eRR41WNkApz048Y4gm
         7UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539013; x=1782143813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJpg6TL0Li8c78MGRrrP7ZdsT1joHJVHeC0IPMlRV/Q=;
        b=ZVUgZr/676wcpZUSoocQRrESezfVdg0xBH6RjL6kuQ9BNSdlsOBBp/7IoRJJA+fPKa
         qkGi5wkAwMa/jY+5Zk8/t9NvHhaJD8Yvj6dqkewQg10+tCawGrs6BL1Z9kc2YsCO3PwT
         FryoEOBQGUvANdampv1nWOvL8jR1SrW6Rai+Ana5wF/gnhrGkSlZCP3nSJcbNLUZheIZ
         q6+CfmI3WfZfYJ/BZRdWc0zBfILuLMRBIuQ8SjM1H7kw4JNdbtYVsKnj/HvnxWQEnp1K
         xFVnxhcYAPSH0N+dLzMVN165ke9fDLorZP0VlATkNmjoqt1oCbp7vB9hmpww2QcILAV4
         J/Og==
X-Gm-Message-State: AOJu0Yxqn/ufiPymKe51O6XLzLaJgeKmzxBhV/lN9iPvWsF785Xna7le
	PPJKHuC7Y27deJwKcXkvwCb5pq8nH0YORYlW/IGXHUp9IVQCl5+TcUoEPLxf6SzhlPVqJS5pcBZ
	aLbyVi6YAChevoNIts5YpZhEPbkaxsPBRuq7c8oy/zs63hVr7GVgg5volsQAlm6b62pLB
X-Gm-Gg: Acq92OFeSGo2tQgGTj69oYwkrU3jUDVbpcuelzFn2ViSNQXvQQ0ac9MJ+MWiPsOElZ/
	EKMX2DmpSr0gFkNM4bLb5GdptGXkfPvem03aPkZ1Mclb96x1UfwsjycbekA6+moUnbEgjKgHPsm
	b2sVDYWD5jt737PNKuqZs9WCeC8Lo9xuHlCbGxK5EN1vN/X9sGgniJngTZTfJiKgEawDKUv83cf
	AKcU0rotOKjK5WhPmL2eJ+pbFdCzJq8wyf2HRXf/WjSjWaUrBm5RJqAVqX890P1w5B88PhVK0gH
	CPh1PPfnHnQPaAZJDVwEHdd+z3ZSajrHW4PyuS2mIcGZZKsoUN8YgTIlVPnAxxFVRkcK7NAwHc0
	RTKPwJ/SRkWcAFMsNg1SJcqoE3pAXWgKaDjmFV7mKQ2fIIg==
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1367739385a.8.1781539012584;
        Mon, 15 Jun 2026 08:56:52 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1367735385a.8.1781539012090;
        Mon, 15 Jun 2026 08:56:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c03ba328d6dsm69770866b.49.2026.06.15.08.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:56:51 -0700 (PDT)
Message-ID: <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:56:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KnOyZZuMZKE0njqwIxUd9u17M4R8HmJK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfX3lv/hb4A7ycC
 DLVEoDkqWKrfDq9L8PtVzttEPmlcgLh6tEcELSjqxcqF05gcdcv1pY71y0JGbIga74DaKcFcTtC
 lMC2JN+2xl7c2KVgc1GHkIAr9OFnb4s=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3020c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6xfqC-53WEIPg_2uNRIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KnOyZZuMZKE0njqwIxUd9u17M4R8HmJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfX1SxtektN17WW
 2RdshyjejXOwjx+mRYeCYaBDzgGWvPyX86VB6Qd2F3uGSXnP2UwQyLP2mlEBb0LSbcoMb/5lCF0
 GSolA8uhi7ZibSdmEl9IuEV/E11Fosp5ZMFJ4mIDOC2mSd7LBEbY048M+thO6oBxDWX68IQN3OW
 wI1MM09XBRm3tV1B1u5N0aL+ftx7h/PcK58CGGlqRpK9AjQjnl5vrtAAolUUKtPAUD0nKE/EMUZ
 g+LIpV350jXjy7Pw5urcdtE7hZ0YzjiiFW5jS/1ApNdbRcYxt65N0+LDbPlcrd4fe9imi1DPv4N
 wL22raWlFJ60SihzGk3UW7+jcfbQw67Um3TyApsOGZe495wG7Cw7nf72kH5eLf0U1kHsbceRwbN
 6dTH2KiIAjSyeUOswN/lcLTw2/6tYg3cyDiwSCjiNqwKLpXNlW7eJeLtHwREDh5h9NYbklKpgKX
 cWQE5hxFyiUUZugODQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24FD7687F8C

On 4/30/26 10:58 AM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
> pmm8654au_3) on the Lemans platform.
> 
> Each ADC node exposes the following ADC channels:
> - DIE_TEMP: PMIC die temperature channel
> - VPH_PWR: Battery/supply voltage channel
> 
> Also add the io-channels and io-channel-names properties under
> the temp-alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> index 341119fc8244..6caec3e4df4b 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"
>  
>  / {
>  	thermal-zones {
> @@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
>  			reg = <0xa00>;
>  			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>  			#thermal-sensor-cells = <0>;
> +			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
> +			io-channel-names = "thermal";
>  		};
>  
>  		pmm8654au_0_pon: pon@1200 {
> @@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>  		};
>  
> +		pmm8654au_0_adc: adc@8000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x8000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;
> +
> +			channel@3 {
> +				reg = <ADC5_GEN3_DIE_TEMP(0)>;
> +				label = "pmm8654au_0_die_temp";

Are these labels namespaced, i.e. can the label be just "pm8654au_die_temp"
or "die_temp"?

Konrad

