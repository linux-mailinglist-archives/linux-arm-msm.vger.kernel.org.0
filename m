Return-Path: <linux-arm-msm+bounces-110072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLuEJqMSGGrKbggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:02:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D466D5F0227
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B2CF3023F82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592DF3B19CD;
	Thu, 28 May 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umdgNHOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24CC3AF666
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961633; cv=none; b=iE6XazD+ROB5aEy0TySp+43sIDdK1sICPraaLfW3vclnbZS/K1ndXcmNGZh8dZ1eZzqlCs7qciqpYlCxUQnNlnMdQy4E3d38DO5BjkDHOVfsX08aiCDM9B88qG6j6Ae71CblLuKPiKlEyIMvrEedgRwnXWi1t6QnvFm2SvxqEzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961633; c=relaxed/simple;
	bh=2eRDrkUiMv0kQFYC+tmw+qv8V5rFfDZjefneGTg5nKk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qDH7SgUr9h19UKbTI5BSKlhQDoZVgGPFaMtOuvqmVyO3yCB6W0Qn7yy/qdhsrafzjit8+u5AdNSacLBU62OGZYGfBRzMD+l6JuhynE8Uuyga+25asGHiGC8rSlVIDXpIM4ZRg7yRL6yk6/mO0UP5DqpS87EmMSHGqqPPDBJ3g5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umdgNHOK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eedcbbb48so40690f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779961630; x=1780566430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/UF4B76x6jmOob9PiMHS3CrMue0u8lzLT7tvPWdGwk=;
        b=umdgNHOKQpsPRQAO2QKoktGCfNwpWHKA6Fj1bHFzsxcXuJe1sjUFF9nSu7GKsgAhqx
         Zj+BRWKqB1dAAsoPaMopxkkZ1rzoAKripa+bgyeFD8KrbfWEEoiv1l1gIoTNPw1bk+hm
         xmrHZTiI2Ec/WpidRVD2OFnfcoEISFDeDw90sV5TPy6WFQbyW399KZJYoCW7C72oLNOo
         p1XMP2naNfZwLk699oPa0gr3j/8qwm/ZlgzJhU13UdpSp5p/EfqThFGs36HGtdJOQo34
         5v9UEZ4fSc9/wGwWy7W74fi3NUh/XG+0iDROb9LqFKe+tYm5/1HJW/q2L9JyCW1azL8j
         cS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779961630; x=1780566430;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/UF4B76x6jmOob9PiMHS3CrMue0u8lzLT7tvPWdGwk=;
        b=nuxi1+6a3ALhicOibeb0BS+ge4UzUUjxbaHBq4ByCltptHWUtjYO6aTufvQoLGXx0G
         v3zdnTnwJSgYPNJDIG3V4VbFLbXDfUmxIQ+0Zh2cC6mCkX8jO2ZW5bAYtIW5Pzy8FtZ2
         XUnj6bGeFSzxNQ/Z3FWF5ziAPK01+LwgHhKbYaz12J5Z2wVaMONMsmNfFaPjaDaNHT+V
         pN0ddNPmRokqdSL8eK6kHCIdsxgFvYeWOaSz42fXW3Xkg2PO8yOEV9qDz2IgCBDLZ/vE
         uyFFpNbjb5XR4tZvbmx5KZ+maizKfYpiACe+dPH9rt6PIwHwnciE+vwZBkl38Qe2QrQn
         vMeA==
X-Gm-Message-State: AOJu0YxO2a7ODkiGo10aDEGCXEnl5cfXLkMOhuN5uGGbZLdi5sBu+YXF
	mT/wNQPm7gTebY382wZENp6Ri1uK5UBRMPD2Jh6turedRGsNfUchJO56ZLuRb8eO8ZE=
X-Gm-Gg: Acq92OHhktzGaT4nzKOLhddfRHasNayZiLkiVwnXrQtDlJL1DdRyFX+TuYasUzEjgEP
	obnhTVAU8lp4EyiuU1s7zjsYnZzodKAP2fEIkfnC9Sp0LxEDlucG7czV89DsY/sibE9A45vvzOH
	qGGQwwkKFo8qJj/ReShjDfWL44U+RqnoCoyrMYfPCFYMMD+RdocVXI982cWUzVPVfu3IEGu/vdT
	fiqBZMGBQoFVQ1KZmbnHV4uP+e3zPmX/W7mx/9F2ibjFeR8gMfYKv/VeqdiTVP38/7ve0nmNjXu
	MGIa/BCTMkdi+ItSCcyK5ddh8uwabKTxIAk/c7A2iXtO2ie9TW6LGadQa4v+sDs8VnPtvncbVsr
	8MeFTg5VWNaaz95Gh3aZn24CqCPV2zNbG+sWpxtkJJZyZ8nTG3TAYvjNS04ZL7mcLonh2L8Xud3
	CzLrOrBSPfQwGcDJFaG5Fq8GvEwaf9U1z/x0gd1z7gnv8=
X-Received: by 2002:a05:6000:70e:b0:45b:d872:592d with SMTP id ffacd0b85a97d-45eeceac20dmr741447f8f.10.1779961629881;
        Thu, 28 May 2026 02:47:09 -0700 (PDT)
Received: from [172.20.10.2] ([37.167.60.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a296bsm11985519f8f.21.2026.05.28.02.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 02:47:09 -0700 (PDT)
Message-ID: <ec921247-ff5d-4226-9e9e-81a4021d320b@linaro.org>
Date: Thu, 28 May 2026 11:47:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2 0/6] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3
 ADC channels
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
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
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110072-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D466D5F0227
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/4/26 18:29, Neil Armstrong wrote:
> Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
> found on the PMK8550 which allow reading ADC data on the PMK8550
> and other PMICs on the system.
> 
> First, add the PMIC5 Gen3 macros to calculate the channel numbers which
> is a combination of SPMI bus number and a constant for the sensor
> type and configuration.
> 
> The macros definitions were taken out of [1] where it was initially
> in the dt-bindings include directory but since those are not hardware
> bindings but logical numbers, they can be moved to local includes
> instead to make the DT source more readable.
> 
> [1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/
> 
> Finally add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Removed stray line from patch 2, added review tag
> - Added missing header file
> - Link to v1: https://patch.msgid.link/20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org
> 
> ---
> Neil Armstrong (6):
>        arm64: dts: qcom: add PMIC5 Gen3 macros for channel numbers
>        arm64: dts: qcom: pmk8550: add VADC node
>        arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
>        arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
>        arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
>        arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes
> 
>   arch/arm64/boot/dts/qcom/pmk8550.dtsi              |  30 +++
>   arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h |  88 +++++++
>   arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   |  46 ++++
>   arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  |  85 +++++++
>   arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h |  22 ++
>   arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  |  52 ++++
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 279 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 279 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 279 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 279 +++++++++++++++++++++
>   10 files changed, 1439 insertions(+)
> ---
> base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

Gente ping, any other comments on this patchset ? PMIC ADC entries have been missing for too long on those platforms.

Neil

