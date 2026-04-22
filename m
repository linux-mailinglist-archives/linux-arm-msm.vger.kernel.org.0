Return-Path: <linux-arm-msm+bounces-104131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGswMu/W6GlJQwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:10:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBED44719F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCD593040C70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CB03ED105;
	Wed, 22 Apr 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/ThnQrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C23ECBF6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776866965; cv=none; b=O07kMw5DJL5ioGgtoLTFLOKjvLLgT+EvNLSLtKT1gNLkovhsbhZT0OSAfzydN7szPX9XUceVHoViivVGMdFkN2KFF0X9CVZvxFAN57Nki2rhp20pMY9m5WdS4f7laSWY6MPguNb3k/+WWvvw090wLTyD67bWKx8OrEh37JBbflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776866965; c=relaxed/simple;
	bh=oXsXDlDpr6Z8h2sfymmW4mccK0oDOAXpPjJkMEQdK+8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pbD5C15OTRHt3lcjIyM2rWjASxu/wxSJ0AU8Fxh7vFmAZQlCd5wVKuBt9gqB0IuhH2oSbB4mfN1slwdNPVzdyqPmVxw+or7wy7iq3TekmFDGcrFUF8UpgbocSHSdriHpKKXUNILSpkC34mPezcyFx7cI2MPrFKFMAdYtfP9V42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/ThnQrB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891f625344so38662975e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776866962; x=1777471762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMlRG6nfIwVLZpYsvGlw0C5ymmwHkKVzY8PzkFLAMGo=;
        b=K/ThnQrBuB/LLnZl854INqPS0UfG+k03wj6/wEev8Kevf/Wk6zF3c9hMiFY8mNhtAy
         I+UjpXWxwW6j4YlQCaIvYjuZytBwmj3PaneP10L6IxSv6V1m4TLnWQP2cpMZXR7z4UzI
         7+igRWwRmh8rR0RNuMB45S/Bi78eGvPC2EzFGO/1V6lkn92pOjMeWQjyvKXrjA6Faw2P
         KRADQk2gqWdC93SlJmqcxvdPUdRLqtXk9ViYgDUB846PzkBxaPHVnwh/Vtj/SWmeCYss
         jUhMxHnFIfBFjahWUc71dsZ6YdMIsTwA1rtoU2ZWZEVbnrL9bHkLEHCGfOwC5veVgiaZ
         y9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776866962; x=1777471762;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMlRG6nfIwVLZpYsvGlw0C5ymmwHkKVzY8PzkFLAMGo=;
        b=iZXlVkHLtSKAv0Z7dNGB4kLu5L6Pj0BqzIkr9by9ep1L6zn48wIW6zWX4vCZY0Wn/3
         S4MegLiJrXfXp0F8yzJSc31SZrPJ/SL4CXchwe5w59zsKXwgKbO2XlVQ6sLTiZzCNsoq
         DdIyDsmmb/pC3t6e2QvFjz+//M56Rhua3hw7F01kw90TIJKORC5vUvrYJ0GBNURN5Cjn
         318SV4pVV8CJyzimCqH1TSAM2KztvthC8xVTcomVttq2XBx8/li3peKMM6DsKBOTsmUn
         oAk09z1LEbQpgQuLrw5ZCE5vP5v79kfKHlhT9G4gDUvS0KThwdG0H8Abj51CG5GJSGie
         Or2g==
X-Gm-Message-State: AOJu0YwHwZQTbQQpdegqkooVXUtJyrWGv+xp4nfTKzTVj5ys16aN5wrj
	SXfuMYGy4W2P12oIy5f0uRNYfFMoqxXNvrTViRMTpXb5FMicZqf9iR810ObA2/2uWeg=
X-Gm-Gg: AeBDieucU7hz4pSWSzRCf53NJzT9P9Z7jXNB7Qbm8AABFQrElbUO5yPeAAiIaanx01H
	+zcV7Iy8Z8o7iiQlooffJ69Cdd8ECzLhhh7LkBjz5+GQxnFc6J2GyGdiEI5UNIgfT3kUm80uGPA
	Xo7oRQNydvJH7m3tzhbomPIabn99J21tgw+USEvi/rZ4pNiJwgRA9SCsLoovDlNr2XR8mMGckXo
	zac+YyraZfqneGw3t1ZxEOOrKxt3yZ2N4U07yMGEQ7RdSFO2IQzEG7O7H/eMTDSDc+tw/WHoRS4
	fuuHtDYf4tednSYjWwEfrWUnphKjlZaKmGMM9L7KKuJdkExieaueK1BMubBjbv2Xex3+xGAIZ8g
	svQ+6ZFUujpX96HKu045sMxwvkvEQqvu/zN8QGW7WDij6u8Ov5c7YgLVJz4Nz6Z5bCea1KkKqNS
	IKK/gygPLuNP6tQ0xgARPlKswHAX01FIXePV60TK3OoPYEhmgKuGKXWZAGj2RETEaqiDju9sKTe
	qKSPySqMfXHB5RkUQ==
X-Received: by 2002:a05:600c:a410:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a5821692dmr73406475e9.4.1776866961517;
        Wed, 22 Apr 2026 07:09:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7d92:9cde:4eb2:46d7? ([2a01:e0a:106d:1080:7d92:9cde:4eb2:46d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm91904395e9.12.2026.04.22.07.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:09:21 -0700 (PDT)
Message-ID: <7df498b6-485d-4997-8e0f-4916935b8eef@linaro.org>
Date: Wed, 22 Apr 2026 16:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
 <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
 <923c851b-17b9-4a8c-8b63-1e48fac5d1f4@kernel.org>
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
In-Reply-To: <923c851b-17b9-4a8c-8b63-1e48fac5d1f4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104131-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,6ad0000:email];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 4BBED44719F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 13:22, Krzysztof Kozlowski wrote:
> On 20/04/2026 21:26, Neil Armstrong wrote:
>> Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
>> the ports are checked against the actul hardware configuration, leading to:
>> qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
>> qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)
>>
>> Fix the ports count and properties of the corresponding soundwire
>> controllers.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
>>   1 file changed, 21 insertions(+), 21 deletions(-)
>>
> 
> Thanks, the change is needed. I saw the mismatch as well, but getting
> these values was just too much for me.
> 
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index c5358894fbb3..2cccfbc6d008 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -4730,18 +4730,18 @@ swr1: soundwire@6ad0000 {
>>   			pinctrl-0 = <&rx_swr_active>;
>>   			pinctrl-names = "default";
>>   
>> -			qcom,din-ports = <0>;
>> +			qcom,din-ports = <1>;
>>   			qcom,dout-ports = <11>;
>>   
>> -			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
>> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
>> -			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
>> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
>> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
>> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
>> +			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff 0xff>;
> 
> So the last port values are marking it as unused (0xff)? Aren't you
> missing the sixth item instead?

I checked against downstream, and the last din IPCM port entry was missing, here's the default table:

	{3,     0,    0,    0xFF, 0xFF, 1,    0xFF, 0xFF, 1,    0x00, 0x00}, /* HPH/EAR */
	{31,    0,    0,    3,    6,    7,    0,    0xFF, 0,    0x00, 0x02}, /* HPH_CLH */
	{31,    11,   11,   0xFF, 0xFF, 4,    1,    0xFF, 0,    0x00, 0x02}, /* HPH_CMP */
	{7,     9,    0,    0xFF, 0xFF, 0xFF, 0xFF, 1,    0,    0x00, 0x00}, /* LO/AUX */
	{3,     1,    0,    0xFF, 0xFF, 0xFF, 0xFF, 3,    0,    0x00, 0x00}, /* DSD */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* GPPO */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* HAPT */
	{49,    0,    0,    0,    15,   24,   1,    0,    1,    0x00, 0x01}, /* HIFI */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* HPHT */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* CMPT */
	{0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}, /* IPCM */

Neil

> 
> Best regards,
> Krzysztof


