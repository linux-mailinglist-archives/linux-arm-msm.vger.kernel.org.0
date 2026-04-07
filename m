Return-Path: <linux-arm-msm+bounces-102213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NmuCUtC1Wk73gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 19:43:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 807023B2808
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 19:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63C630A4AEE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 17:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A9637267C;
	Tue,  7 Apr 2026 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdlKoQlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32CC33D4E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583538; cv=none; b=MTd5ars8Al/gnQscsW5T/YgaMLCqC9fWffwXSp03fG/6H1cyU8Y0DllszQ+6V+nQRX9QbYLH6f6Ng2F/rAYCu98KSxLSAcBD4fBGEZ8TogQhV7CXRPJOkTNRgLiYvzQpTlNy3nfeaDiqDUI+9AXIwVVc21E0DZJox1/KKz95spw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583538; c=relaxed/simple;
	bh=NwK76Itzw1PhaMWC7SzUXCqcnMYQxd7QLk2nz+lag6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vn/g7siQDa395rJfJdShslVQ0kLpW12OJiV/SJxu9vT1x6Vh8SVR78Jb+IJYyMBaff0EVvW0rgfd4+4T8kwtq3VcXbXBE4O2aOsRTq5vzpb80UF9KZs21ay58z39RWNCERe6pXgCWYrcqh68/DPDV8LnfES76+VYXcOuNoiTTXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OdlKoQlh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a29e6110so34795665e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775583535; x=1776188335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbUGIcy06LrCA6FmDQ0dKvb7SKeujUusEs0h9uIf/mA=;
        b=OdlKoQlh5CiYQbjnVzTNPxMJV7uSiAtVOZnk7fy2mW5eoNMRF4sBLYVvgPZ87uF3gc
         AwPCEy6BUOsp8KamRqAjKo6oig7p0TzpJehNMVc62OqUuXf7xV3raoz+VsDREcv8TAMH
         X3OEv3THjB6wu52SYlaZ4lZ+bm7AUlw4WAdpCXAfOR4dydX5ZdPo5Z8QUINoiTaFss3o
         OZyqlO8yv8ZmzFP+pY0pKkeA+P9EOE+pMy7Rq7b32v7LYmPLV049lEc8UALajAh7bdWU
         fYLaknz2Y1iukmJB4fEkZKp9iJszj4P3Bpc2INBYI6JoHX9s4bcBH3jdRhfDIAA5nYBO
         ujjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775583535; x=1776188335;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbUGIcy06LrCA6FmDQ0dKvb7SKeujUusEs0h9uIf/mA=;
        b=qeZVNH/jhlTZCmOZevtENmUSLCem0TEnXNbCoqoELyOkkoJKBHdJIYAS6aS2lEOXIY
         HG07qVrfNU0NlJYVAqqp1F4GFYoqnRNZZGaKclMvtuESTDqt52yunKIecWQk+Oz/VxxB
         gqZvNiwdvy85p4QzhdMEeuMIL9w7g+d178CXbdDvkLXPgg8/pv5sDL/h3jqM2/Uxgc/o
         J/wjYoZStKMonmdMdZt2iR4D+bP0rgOr2nPHa0jR96DeaUF1oWQRUuF3fXi+UjYcaPnG
         bQTT8EgWkhgo0WsjSZ3QfY1nuRsLxW/nGD2SqswYz1fx8fpBlfjX+9TPA27AWbbNmpRe
         uqGQ==
X-Gm-Message-State: AOJu0Yyf4IPF0j3CMqvHPzOsAIYqHbM238Glq7E7FZQ4dgpDIplOmUBg
	g19DUTUQ0eDrkCSo9WEONIXusG9ETr/zJKzMhoFvZfOodLuEDfUUTld4jduy2+YO668=
X-Gm-Gg: AeBDietuL4oyMAGPyrfr+dihF8owo/A+s31/dgJac3rYv1bGLIvR6vx/UjDFxo5cC63
	kA/G3w0kayB5ycRwZYBle1tat8eFxLl02UEtitIO+gwR+wD8Gmh+wz+DGepU/fmPJNpa2qD6ygZ
	6zSgh+gO/CK0y+pAGFy1ZwoYZvM1/gjLzyg1cbFXNdlrDCynGvhOJfvPA26x9DWeXgFgHMy1i3+
	b/3G9C4t/pL4p7RurOwecHSTYtamQ3B+35mWiVQV+qgh3phGIQR7PVlwk93f6i+r18WVs1n7SuR
	wUWnYiFuVKpLyyP5Yy1akhSzZTZVrbJUr4YD/R+ll/evrXcar5GBEiD5TpTtjSQq8ld/nmV9jw+
	Yly9VD32CujvdmwqGqZawigFAp2LNBxFbmjMiWgp0bOlp6ulJ1ZjO2Y/C4FudpE2rnVEZKl7mKA
	UP//zpBWpLOhzHxeMMeCiMZphbgqYtX0fEdHEWwtqyoChScj5XfuwxPGtdrBJyBWovLA76yCuay
	xhuH30=
X-Received: by 2002:a05:600c:8b54:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488997c3a25mr259251135e9.24.1775583535169;
        Tue, 07 Apr 2026 10:38:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:405b:6cdd:f27a:d661? ([2a01:e0a:106d:1080:405b:6cdd:f27a:d661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm302095365e9.10.2026.04.07.10.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 10:38:54 -0700 (PDT)
Message-ID: <8ed5aeb8-98fb-4b87-a6a9-983e4fa91db5@linaro.org>
Date: Tue, 7 Apr 2026 19:38:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions
To: Joe Sandom <jsandom@axon.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-1-d0c7f447ee73@axon.com>
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
In-Reply-To: <20260407-rb5gen2-dts-v2-1-d0c7f447ee73@axon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102213-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:replyto,linaro.org:mid,1c08000:email,axon.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 807023B2808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 17:46, Joe Sandom wrote:
> Add the MHI register regions to the pcie0 and pcie1 controller nodes
> so that the MHI bus layer can access controller registers directly.

Can you elaborate more on that ? Looking at the current implementation,
the pcie host driver only uses the mhi memory zone to show the transition
count in debugfs.

Neil

> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..055ca931c04859f3a312eb9921aeb7a8cc676822 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1964,8 +1964,14 @@ pcie0: pcie@1c00000 {
>   			      <0 0x60000000 0 0xf1d>,
>   			      <0 0x60000f20 0 0xa8>,
>   			      <0 0x60001000 0 0x1000>,
> -			      <0 0x60100000 0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0 0x60100000 0 0x100000>,
> +			      <0 0x01c03000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
>   			#address-cells = <3>;
>   			#size-cells = <2>;
>   			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
> @@ -2138,8 +2144,14 @@ pcie1: pcie@1c08000 {
>   			      <0x0 0x40000000 0x0 0xf1d>,
>   			      <0x0 0x40000f20 0x0 0xa8>,
>   			      <0x0 0x40001000 0x0 0x1000>,
> -			      <0x0 0x40100000 0x0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0x0 0x40100000 0x0 0x100000>,
> +			      <0x0 0x01c0b000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
>   			#address-cells = <3>;
>   			#size-cells = <2>;
>   			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> 


