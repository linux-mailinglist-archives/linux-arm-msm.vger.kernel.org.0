Return-Path: <linux-arm-msm+bounces-115897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lb1rDBI4RmocMAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E66F59FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:06:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=CIaGUlaK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115897-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115897-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B402030E0F04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FB8481253;
	Thu,  2 Jul 2026 09:44:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B131480DF7
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:43:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985441; cv=none; b=ore2WBUbvnX7Nq3cYFdYwgyP+AZFNam89+2Uw8NdS5RPONk8RcKP7VNrH2IhAdh+soJpXR4+nvcfWfglbTupLA1XEWYJgp/wK4t2okqOTGGBX9feBsy5sWcgwmrGaN4ehgzw0pbWWAcp4/imO7qm6LrjKf81FbqLnKctSXyMsV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985441; c=relaxed/simple;
	bh=zuK2n9vTCqYKv0UJYa1tIKwjqgrBK1ZvoKXzIBxmz9M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DWFKeee/ueYwpDc4sVOXGdcrXUv4QBIeES4DQrkrkemEp/z57zRwdali+ErAGpr8Lrs2h2V37i9DMzdSI5JKUWzdmvAjD+6VBG9ZRZkyP0X/8uPYLG6yzd/huAkQUrcIppDza5wvgUEHsKw7qtLHHKUZbX3wo/58kXyFwlf2QsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CIaGUlaK; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493ba701891so11093245e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985438; x=1783590238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bK8KvQmLqTXD/XB1VGo1MPIszZUUe/fxLx+x8ODuUYg=;
        b=CIaGUlaK0G+PA8q8/UrU5r3GbmhqxpGFyEguUFTdHUV1mU03KzxYeHltgcxhjM62GL
         wOgXe68SsMK0FGvjUv8BfwsxhRGFepMOGDi1bIeGlSgCT9ZMjaMCK39xWSvhYB3ZvXid
         SBatuQf4vcMVCFK0aNzueiRj/nwnSsZMIzUkCDBwXQ+SxePXV1pqNxmcGloO5qxyubdI
         XiW05kRo5Ch0hODfncQu2Jh9jAA9RXSePDTOzSRjgisVuc4qMJJUVgoek6mQJ6YpIixP
         OPrdxWRu2W2sAfa3dIe7F00eAm4N98XSp773fGL/arpnqv0de5LVIRgiwzjDM1yTRMWG
         zDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985438; x=1783590238;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bK8KvQmLqTXD/XB1VGo1MPIszZUUe/fxLx+x8ODuUYg=;
        b=OWiSy5N8dkEMgtRYPvKeyqQgMJDpOM7Q2AplnYEcE9tCsKycaLTI+U73H4inxD2mWM
         TweV14bY5efywjHuUcap4R8bdzaj/5rJMwYwoiqVtGBqxsTIzB6pXdqZRgRBSOIDO8NB
         fMv1bXKFlnMR2HQyz5897qqosuWz2ReCGbaOt7RIDPGungkaaGPr2jiV+Glmlofo/xGQ
         turLajKuGWblNJMD+CwEwnU6Nqml534bqT2GhCR8ZQR9K0Cf6p9k357bLjr6cbudfvoJ
         daeaGSbK1RQ08bZ6AQjCIbcqgcxovUfhDl7nMoJ6U6wA1Tc49x0PJ3p2psOsTOvXrdXC
         xl1w==
X-Gm-Message-State: AOJu0Yw2P3vVytueLW2501tW0EJ+/Upgb/vLj5mcxjx1vtD7wCJ1Wo4W
	fjcTogVSHfNGekEzaJDXMSqfyvup94HLJ5JhjhyHVri0odB6GWDdPDzak16+Vqs/mho=
X-Gm-Gg: AfdE7cnLr5HTHJk+5p2tQ+HTTUrJgyaV2nlTGdxJa09T/GGA+Txk3xI06yJwkTm8HiP
	gDK81879qi93IajezGkv1Xr6/TuxtAea/Ncw3T4oVGQYWvQkR4yqXzT8WbXK17S685oNLKHaL/m
	8ympcddxkccYVLBjZupKv/wOuy207Ww5A0szA2gpU/Scz55KOHHPkkJ7g9pkVOIeIxO3zXKuLFo
	3fhAlGcWmMYt7NMTGAzfmbnpM9iOLkL+gYWnDkFyIAn4DKtqOXI1f2zILfa6rfga+99WNABjk2L
	JX0X7Wb+9EusROBZTNd5B0Hkz6mlB860o6p92T7eOvGm70MbbgcDD5VzIA1Km6ePNjtIYIYJA/y
	zR5FD6QDd5Ta0LR95dRytYsbz+RRGjT+g0U1QQglMTJx4wqrIBqHstMc0uob10I5rlXPE56mQMd
	ksG7vaYwZU8SLEtVDk3V/AetG+btGYgWGraKZogAlAwDBcuYFPpdU1x50Uz2E4Ug5fGVN/
X-Received: by 2002:a05:600c:705:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493c3cd54edmr41645415e9.11.1782985437959;
        Thu, 02 Jul 2026 02:43:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:33cd:3431:8a4e:350c? ([2a01:e0a:106d:1080:33cd:3431:8a4e:350c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbc75sm7828195f8f.5.2026.07.02.02.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:43:57 -0700 (PDT)
Message-ID: <19f57744-798e-4b2b-a88f-bf6f43a462d2@linaro.org>
Date: Thu, 2 Jul 2026 11:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
 <7baab74e-1d44-4791-a599-7b2eb802e438@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <7baab74e-1d44-4791-a599-7b2eb802e438@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:from_mime,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B00E66F59FE

On 6/30/26 14:07, Konrad Dybcio wrote:
> On 6/17/26 2:53 PM, Neil Armstrong wrote:
>> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
>> other PMICS on the system.
>>
>> The thermal nodes are sorted by the sensor channel to be
>> coherent with the system thermal nodes ordering.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
>>   1 file changed, 277 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index 2fb2e0be5e4c..9356b40a1850 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -205,6 +205,92 @@ platform {
>>   		};
>>   	};
>>   
>> +	thermal-zones {
>> +		skin-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +
>> +			trips {
>> +				active-config0 {
> 
> trip-point0 (the current name is very misleading)

Ack

> 
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
> 
> 125 degC for skin-thermal with a single passive trip and no cooling
> devices is.. certainly toasty

I planned to setup the cooling devices later on, plugging it the ADC is the first step!

Neil

> 
> Konrad


