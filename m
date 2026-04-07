Return-Path: <linux-arm-msm+bounces-102212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGhbOnBA1Wk73gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 19:35:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C23B26C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 19:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 668EA3019B92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 17:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3953412FF69;
	Tue,  7 Apr 2026 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FHn6q41D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBEF3370EC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583154; cv=none; b=mRWLW2rQPQAHSu4L+Gz+XtrF5VdNWxKVB1L2sjOIaQ0tShECK1B9tMJDrU0cDhQloZpWwdvs5ubJE/1uhvhUCwm4pl+IyuojY8fD4l4shvRPdEOqJ2vid4bZYl7w1orCOuf+OfwHm4uyytNt92wsPmRXQsWehzatAYHezF+W4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583154; c=relaxed/simple;
	bh=3iTaWqF8+gWTPbH2uoiDam/URnuG24c+X7Vqq65/fIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CP1t3TMwIVcnx5edAQboeFX3/XbWSuIHgWCoFlkoSbS4DWk/fcFyUZ9YU3Z2PETNEBZQorOhWwY4oYdx5sSFu/c1Yvmd065QlpGW6Vsn+D8fJ45e7tkr7T87aKLP17lq951RyfG6BNLrwNgMql9kHODqjiGsFBSTv2hWb6nNkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FHn6q41D; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b983bb07eso3097782f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775583151; x=1776187951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4d7m9Tc639YX9TJeHeW7NZzxdH9MumFBbuDN7m5vKk=;
        b=FHn6q41DYSh0khfygtQHJxjyAalGmMr6OfMsruhZO+5Jp6hGcMoeEVuxsRptcbPxWF
         0PNA8g3qYF62WkL53vk03WdxJ7PrWNAgm81onY9FwfPBVxtY0KME/8PBpP0itWAcjTvB
         5ff2j9caGrUaNblAYxJSs7/IuaAzQDhNFEkbfg2XpZuCt157I0ntpXxGuqhFBtV/WTEh
         jP2qON9fabbmIQaK28niDt8plIXzAtxmxGNNc4HLz3hMmjDoTI/OHmgfoJRcw72ayzkj
         jV3ODj3+jT8cS3CG0nDVLqYyueYV9u59SZK9b5zezDfTUhPc32ukViwsRVYtEcnwKgsS
         22ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775583151; x=1776187951;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4d7m9Tc639YX9TJeHeW7NZzxdH9MumFBbuDN7m5vKk=;
        b=McDGeJrIp1X2Ps3QDSNw3pueyGvpTOHn+av2SHDhfPDMRlvHVxOdYzoT/CgmYlWkks
         7iziiIAQxF0wndk/0uVfqqfOvEArxvm/wQP/Exb37KUwXPNNR4WX7SpMKNcCjEC2E1zd
         +O0xBMr2hIG7ufosIpNejx+IYDskH/y4D/0O+Is40avV+tO7zVk0cCWGYKrUhIbMyzrR
         Lua67lb76XIEJj3/7ylh4Z8LmdWllzYeB32jNCryNBbvuFodI90FESLM/FvqSuVEsnBK
         NqgaCtVhAPcG9WcxASM4Gj5Yh8dfa5f4BzB/nR2fZwKZHAWShkCx1DVPRLy2y2mfiE02
         vKHQ==
X-Gm-Message-State: AOJu0Yyli48t5wKjsbAsIraZ5CrEOZFkNgwavSjo2vImDUA3w7k2S8OJ
	jrt3wsRbFQ/cr9fzDFzXCBUjNiAfBeHqn/8zDnhnmx+SNqLbpa13DaUOYcr8Fj8ndgs=
X-Gm-Gg: AeBDiet9ukOpjEuS4Ntz4kj3NaKOMbV7OKBBxpTNHSidXsyqn/7NZUAho5y69B2I1Hv
	ehbc9GrVxtB7SF80ND+/6ltG2K/+95ve5j5QgmGf80WhJmN06qz4vBPVdrdmfulvn9v69PEQMZ0
	62krko0K4GC3Dyd0izox2aBeeYzp5zWdTQFnOCpw1odGZQuKoKVbGJN7lOy38QZXQXjmE3fIAyI
	gjMF+QDjuKyYYfGwy9K2ju6/XKg6wdqdrQCoAx2cekF72oZkVCYuuQQEHuqGQdYtnYNUFC2JmWv
	4Ofdy/aPSrCt0I49qVlJ5dr7u+sq2hPnCaH4gAOICKjvjHW5RN2RHbnK5aS+H1d1L3YJ92VKS5t
	LC6Qm9NjbLhPHq2sOT1leYXXsk3cHGp+jjCnyoTD0L/JH8YT8h8FrE4UjAw5+mkvnpIWtmMZKz9
	/RxDAqYGCyIBHeKQ9+ZQNN3tgUQ29IMz9Uu/i1HhxgaS7m/gA+RgHhnIvb6NJiip4WOyhQAQjzX
	R9FcD4=
X-Received: by 2002:a05:6000:1842:b0:43c:f3c9:3815 with SMTP id ffacd0b85a97d-43d29277055mr25949772f8f.3.1775583150955;
        Tue, 07 Apr 2026 10:32:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:405b:6cdd:f27a:d661? ([2a01:e0a:106d:1080:405b:6cdd:f27a:d661])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm52635802f8f.21.2026.04.07.10.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 10:32:30 -0700 (PDT)
Message-ID: <ab8e8dfb-1b89-4533-9d00-b7b09de5dee8@linaro.org>
Date: Tue, 7 Apr 2026 19:32:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm8550: add PCIe port labels
To: Joe Sandom <jsandom@axon.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-2-d0c7f447ee73@axon.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260407-rb5gen2-dts-v2-2-d0c7f447ee73@axon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102212-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 391C23B26C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 17:46, Joe Sandom wrote:
> Add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> allow board DTS files to reference them for adding endpoint devices
> to each pcie root port.
> 
> Update the pcieport0 reference to pcie0_port0 in sm8550-hdk.dts and
> sm8550-qrd.dts to match the label rename in sm8550.dtsi.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
>   arch/arm64/boot/dts/qcom/sm8550.dtsi    | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1012,7 +1012,7 @@ &pcie0 {
>   	status = "okay";
>   };
>   
> -&pcieport0 {
> +&pcie0_port0 {
>   	wifi@0 {
>   		compatible = "pci17cb,1107";
>   		reg = <0x10000 0x0 0x0 0x0 0x0>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c6b597f20f332cdf063daa2664205..cf63109ff7bf7b6fc827f108e22e82b8b04273c1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -912,7 +912,7 @@ &pcie0 {
>   	status = "okay";
>   };
>   
> -&pcieport0 {
> +&pcie0_port0 {
>   	wifi@0 {
>   		compatible = "pci17cb,1107";
>   		reg = <0x10000 0x0 0x0 0x0 0x0>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 055ca931c04859f3a312eb9921aeb7a8cc676822..54308cbde40732da072177eab533582c155df590 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2098,7 +2098,7 @@ opp-16000000-3 {
>   				};
>   			};
>   
> -			pcieport0: pcie@0 {
> +			pcie0_port0: pcie@0 {
>   				device_type = "pci";
>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>   				bus-range = <0x01 0xff>;
> @@ -2300,7 +2300,7 @@ opp-32000000-4 {
>   				};
>   			};
>   
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>   				device_type = "pci";
>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>   				bus-range = <0x01 0xff>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

