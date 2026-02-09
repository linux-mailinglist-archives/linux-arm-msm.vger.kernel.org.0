Return-Path: <linux-arm-msm+bounces-92344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJEaEpsVimlrGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:12:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D7330112F04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24DC23001FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 17:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2893859EE;
	Mon,  9 Feb 2026 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czwDN088";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MS60M7Du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B11FE44B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657175; cv=none; b=usdrURl5zR/IgJm38i4hYaG7AiyGJk5inQjs2AaN56xvMH0KJxf6nQcyuNrwTQz4MKylOW2PtW+YapfGXFmYIqh+ZMhiUX1akq5rTTsRCrWzwWqdfVhyv/Rn37zdjQIrUNPUK0PKV6WxGasoiSXW1U1PXQ2efPcq9RE2YrSdoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657175; c=relaxed/simple;
	bh=Y+YbrNjx8nOdu2kUv1BRKaDQpMLOJXV6rYAzcJJR8iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvtlE9X+5lEKh8KIqat/1guZmyngMDCEP7XLVXLVoTJpvXAJjp8Un6OMkv2182rWbgTJknbt8wEtX7u6wRQV/rzq6SR7RxUBH7WrsEGtlcpBKTXyWOzDM6CHFTVB6xmGEciY3ufzloNnjU1i81YYDV5or0ND+dqdcpyhNfhwfPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czwDN088; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MS60M7Du; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619AkiL33699851
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 17:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADX6EWNWZU97KWZj8Gy1UYUheARm5i1jrlb4teDa6GU=; b=czwDN088pKAgLR2y
	90LGsYgHrNRkOOetg4D/VNlsI+1UevidVME0Pg6Xih3XWXBrVtUXyqtjfeYCx3M1
	u0K0HbsdGozOAYxKO4fJhgMd2Psd2l0SIarXVE5Q2zXmQT3vOif9jjWN2DA/dIGa
	Olg3Lgen0Wi3grc8KHpUiaxxWkcMQR2FqTvSBFQJOiJWjaXxrlpqoqSEK/oitRod
	iF7R5VNmgnYWI2jik8OmutgrAfJJD3S4HEl1RImTRTMAi3wsN8qJ+kDi3jb+8XcP
	uD1iuRKXdULhLt2EB2kdHUFTTuqTtM2+tRAcLdlobJIigNp99HvUZ6kTs83un4aC
	dFFWkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m99qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 17:12:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so884797385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770657173; x=1771261973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADX6EWNWZU97KWZj8Gy1UYUheARm5i1jrlb4teDa6GU=;
        b=MS60M7DuJa+mVCEGF0nG/cZoC5p8NZwzIIRakRBL1s+OLY92HRZ3ohG9CgcD0cBfP/
         ABVIqegfVT9+IDX/LWEOScOg7jCLpSprMBogLbd9sErGW8bR0GnmrURuD2orxYQ8G428
         UTb1mdUF0Qs8lR2qh+lu5RU+WW2eSu7fnGATaHdqmffHayB6ExJBP0pOeNth1jFnLyff
         0GQcLcvitBi+j7oYfXIottf1qfy7GHxXYR0NbPLEdbuK3cuYC0I5E+iKG05ah4GEFAab
         XKnPSYL9Z3jlHKQfg1EbBIxLgZnRRZqQfBcZlIapoR6wslgoceZz90gajU3FGU4QF3on
         d4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657173; x=1771261973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADX6EWNWZU97KWZj8Gy1UYUheARm5i1jrlb4teDa6GU=;
        b=e2oCKJAZwBKfddvL6xeaxNXeBDVSBrwcbPp0h+/sgEg6dJG+5exzpRq2PWPlpxAhKh
         xKoUFi/1y4IKANYTZW9ZwjnC6VwsSyPpwC6B+NcmlFwM00MSpV1ab8O1HOtZ0x5LyCGp
         ayb0a/E4mdhkEdSB71sVEgqYhelDqSUGhLVdMRyjYDnV+nCu7sjaQuHttsIg6qOxR/Hv
         2/7nSXKh+rxj9l/9nsWbO/gQED1jD98cv285afNi/MDD19XrCbeurNQUI5YTYzTKsMeI
         iGlGKrMve81V5k4bMRj1dsfacEHEo7X6sTjLgQ5UlcCS9pvvaXg2KKlTrHaZPkzkKSRA
         napg==
X-Forwarded-Encrypted: i=1; AJvYcCWrWXIln9VeUkqyFQT2USHLqIOIe+XgN22GRPBh6O++N8hVkTxZxO6bDLhj1H45K99x8xUP9pXPiWLXKdp5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3C/4OhVBoL0206f8GK1EBI49ecoaZqfERCQSNAyO8UhIm7wx
	jqUrUEWKJsKhtsn2JktUeDxIitG2KQoRk75EKcLGv+u7Imt8MbkwC4rV+0zlEsLoBazaIx5oywf
	Eb1Dcl8H/Cm0WQVhANPg8XPAUw535ODqOgjj14Za8o6Y6ZTZmWdMxSDe/gTkEtOK5q/kT
X-Gm-Gg: AZuq6aLQ34m7pNCrkFalp3B28fah3C4oq+ulamn/0G/V1MK7h44yD6aADlZEn+g+8Bb
	Vd4oCwaJW2RqXiINGq3eGNWsJJ3gA4M/yL6lPj09KUGW55DcEifSmIscAWASFcZ1vzxFqPqigqr
	u9vy3Q/z8XEl0+eUwhyEvwU9T0I8kywfS3lv1LUtSXPjxQcWe/LL+M0ewaSQTv8Ioir++Pwgt94
	Sy0xILDMix+epEw5BmTn0fFmlmZDobdl7ufeYj6HamhuS18Bm3YhP4HpIP+Zgdw6jxiEX+kVNEA
	gt4Ci6rvUjp21imJoVJ1Z9YtsLwsCTe1E29mDIu+qPpGLhA9xBCWavDePeXJ7F+60JmmV7zvLKy
	4d3mjyABMqbEmOMgNNXUfAbezrCswbne9bAyw
X-Received: by 2002:a05:620a:31a7:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cb1e0a0fcdmr22230485a.6.1770657173341;
        Mon, 09 Feb 2026 09:12:53 -0800 (PST)
X-Received: by 2002:a05:620a:31a7:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cb1e0a0fcdmr22227085a.6.1770657172830;
        Mon, 09 Feb 2026 09:12:52 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8ebfsm4446795e9.2.2026.02.09.09.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:12:52 -0800 (PST)
Message-ID: <da4cbbf3-d558-45f6-9aa4-fcbd5614b653@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 17:12:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: agatti: add LPASS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
 <pybu54sir7vxjlrgfqlplulxgnafyemnpebrf6jl2qeldax6jk@icoefmculftb>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <pybu54sir7vxjlrgfqlplulxgnafyemnpebrf6jl2qeldax6jk@icoefmculftb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PAGSH4TopFSNioLWhadPf9fPku5KBcgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0NSBTYWx0ZWRfX2Kd5pjworod2
 EzAqI6yvkqKGjJBDi1e72ED1a76SfRYi2YAMTKeAZlbuzulRxISgNeiLrGwsDYZWgNm2imEnMlU
 osgRh5keRPLmYdTajg5D2Gh5FzbOUcCWOfWez8Ie45H4INXEvVzmO8I0h9SDKIxMbQtcDDZ14MH
 2KOAHw074uHlGPf1QtxbfYFah0uFsKDGJcquQPiR+CO5CljWPA9GZsVcujSbJQzS4D1HtWLKqjV
 +K3YW3fvAj+LuNkF8nhodQWGAP8IURnYP86XMTPzlsoShdQX78VXjmYoRLpmXJDPReLXhRTUwb4
 DPiWRjCq/L7PV2tQ2eHzSw1VxRL8Ct5xQv29U0OSFw3zydNNyEzmrVA9TUVqokXWIoiY/JH+3zM
 l6UUEwRvSmJCX6lcy19jBlP63Eg2fJ2Gi2NhWTz2I4QQN6MwUqpsV/8FsczeRAV9eVszDJzUa3d
 g6YbQFOSZEVj+yB9kFg==
X-Proofpoint-ORIG-GUID: PAGSH4TopFSNioLWhadPf9fPku5KBcgn
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=698a1596 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=MpFykiw6ONw43vFGCnsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92344-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,0.21.92.192:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7330112F04
X-Rspamd-Action: no action

On 2/9/26 3:28 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 02:24:26PM +0000, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>> controllers are required to support audio playback and
>> audio capture on sm6115 and its derivatives.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 189 +++++++++++++++++++++++++++
>>  1 file changed, 189 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
>> index 76b93b7bd50f..79cd8bb8e02c 100644
>> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
>> @@ -758,6 +758,42 @@ data-pins {
>>  					drive-strength = <8>;
>>  				};
>>  			};
>> +
>> +			lpass_tx_swr_active: lpass-tx-swr-active-state {
>> +				clk-pins {
>> +					pins = "gpio0";
>> +					function = "swr_tx_clk";
>> +					drive-strength = <10>;
>> +					slew-rate = <3>;
>> +					bias-disable;
>> +				};
>> +
>> +				data-pins {
>> +					pins = "gpio1", "gpio2";
>> +					function = "swr_tx_data";
>> +					drive-strength = <10>;
>> +					slew-rate = <3>;
>> +					bias-bus-hold;
>> +				};
>> +			};
>> +
>> +			lpass_rx_swr_active: lpass-rx-swr-active-state {
>> +				clk-pins {
>> +					pins = "gpio3";
>> +					function = "swr_rx_clk";
>> +					drive-strength = <10>;
>> +					slew-rate = <3>;
>> +					bias-disable;
>> +				};
>> +
>> +				data-pins {
>> +					pins = "gpio4", "gpio5";
>> +					function = "swr_rx_data";
>> +					drive-strength = <10>;
>> +					slew-rate = <3>;
>> +					bias-bus-hold;
>> +				};
>> +			};
>>  		};
>>  
>>  		gcc: clock-controller@1400000 {
>> @@ -2188,6 +2224,159 @@ glink-edge {
>>  			};
>>  		};
>>  
>> +		rxmacro: codec@a600000 {
>> +			compatible = "qcom,sm6115-lpass-rx-macro";
>> +			reg = <0x0 0xa600000 0x0 0x1000>;
>> +
>> +			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
>> +				LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> 
> Plesae correct the indentation (or just use single line for each entry).
Checkpatch was not happy with more than 100 chars, which is why I folded
this out, I will fix the indent in next spin.

--srini
> 
>> +				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&vamacro>;
> 
> The rest LGTM.
> 


