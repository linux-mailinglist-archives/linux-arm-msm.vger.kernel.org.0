Return-Path: <linux-arm-msm+bounces-103734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDrFOkn/5WlEqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:26:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543A429563
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F00305DEE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFEC39935D;
	Mon, 20 Apr 2026 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6qU/ZrC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CE39A05E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776680733; cv=none; b=KgVMLG2PZI6KpxvVpKDRtTgF2e5kdTmKSkUD884GYgM90JzTR/WWRKjnf8ejmv5v9r0IDMCNdoo9P3RDsJlRpwv+7xI4dXJ1uQdHz+dH7xNwZ+XGNcCNeh8AJe/feZpq0RPjj2D5fXNtxr63RO9rfUOU2OugF3g7G5py9UtHObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776680733; c=relaxed/simple;
	bh=ltFkoAnr1YJzgqo6rJi7LT79ugfvdYEbKMb4BJxS2eM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbW0mens+jpLgIfxCVTrk6GjnAGEjX5yM/VWDeAWOJIx1fI9xBWS02yOtyKiGbmDwqw71dIOdhWZ2BmBc5DQnbOVDp/0fW+0/0GZ8BcfEeF21MG4pQa4gU6MBAQzxkndiM176x3YHRGSuaHvtEQ3kMLD5qAXUt/TRQ5MH/0HQak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6qU/ZrC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfbd17589so2156754f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776680731; x=1777285531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPEykyYBP8QuV/+bEqBcB7dK9AJ+54ZKlg7bIddLSxQ=;
        b=k6qU/ZrCXOWi6M4ZtoKeOcZA4rYvLE1DVT+RonJRVTqPpuOPyzCRUuJ9f61wtesQbU
         TXgUIaMlsVVqP9w9rYkv4dlWwxW/AqeqytJCzWpRtOSJv8GqPEzZ+vFWdK3ZV/rGxLjS
         SQ5XF0aBnfVbo6C7nIpvGcpGSIxyNmCJmBx4xXpjFz45/BMqoaewwOEx647sHpDHKxdz
         11w0X3+keaOE4VBNAzizxO76R5HIpoUgN1eof9x37h5UVlnl3lN6YZ4fqhKvnapuSRqZ
         us6WyPArmc9dDDnXnhfZdwiURFT+L64ynfU12z3o1vCuyqkdX56v7t7uu55MAt7Vo446
         V5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776680731; x=1777285531;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPEykyYBP8QuV/+bEqBcB7dK9AJ+54ZKlg7bIddLSxQ=;
        b=Jw4E7UGDfa8d3nNYKbqtLvaNfPYtXBkeMJSoWuo3cPoWrbkvbATsDBfijeNRJtVYFV
         H77I3URnLwsLsNJUtiQ9FDK6faU/waALbpL3SV4ulEyX5WeOrg9z+SuAu9hcc4nfWFb5
         saXk3Z8/7pappweloJ6l6bPtuwr0Mu2p0u3JvildowNS8Kc4rKQ4kTrrhzb5UfgqZaRn
         2lBx0P7010oudnjYTSEnpNE4o5PI7DMktjJRKCQ7g0AY3WhLnl1xyX3W55/7YeRKLU5K
         yRwd8hklqIOIRMpAW79qGgY59iBJQLlOxnoy7jGulPh966MQxlE5alnNTIJotBqAed81
         766w==
X-Gm-Message-State: AOJu0Yz7FwHF4Td2tBWAMVTQ5mDtyIpDg7SL2+wN6oWEAvv/eZQV5R3V
	RK+sUc07XdERvtdzPDWUsROTkKPmGsNCpvpW5y9047ws20QDOFAuq38LGEM6cgqvgew=
X-Gm-Gg: AeBDiet5bTIFEAYGhsDLlbd0CZ+X4+SvEB54hUksmN6GKK/E8T63gf6nXsReJkhxew+
	mo2Cl/0kHGpTe1wb2d8fSxPPFBVedGR8boF0wMVU05P+wZ3x5RV+CD2Xtbnxzh9U3MKb2aMlEkn
	nWAlI4l6+G0B/pMNNah2QW/Lgsj5eqTk7sNBib6oCEtM9mhjQbjBp2HZlspWpWeIXo1BI/xUkHn
	Jd4HzXYzGj1yU8TQ9nKGElrz3Qb3lAPN/evr7jkU5Dujsb3C/FCD1UVKTugdCPVl9PbfHtiuPKn
	1IEpYzAAWb1tjD2XQR+pE0jp/TSInFpmWuNms61WcoYSSj7Ol6NjvMgsmnOghM9m55LT8a6v9mQ
	gsfBFAEZDo4rn8AZD+TLGF4H/Ib4yzGPyfQFtrFzqDwj4M/9t8Aiky1zXlP30H/2rPycc/1QRAt
	FzyvcV34n4Kw+9XrZg61KpCPkmK8C5bWqxNNRioST3sD1ebiWDARQ8Vttgia1QVh45GE3Me99Ok
	FBJc9mwQYyh5eypcg==
X-Received: by 2002:a05:6000:1888:b0:43d:3088:76ab with SMTP id ffacd0b85a97d-43fe3da63famr19480259f8f.6.1776680730456;
        Mon, 20 Apr 2026 03:25:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1682sm29683675f8f.1.2026.04.20.03.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:25:30 -0700 (PDT)
Message-ID: <ad02acc7-2311-4ca5-b745-265d90366e0a@linaro.org>
Date: Mon, 20 Apr 2026 12:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
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
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-103734-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:dkim,linaro.org:mid];
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
X-Rspamd-Queue-Id: 5543A429563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 12:00, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e393ccf1884a..0c180e49816f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -789,7 +789,7 @@ &mdss_dp {
>   };
>   
>   &mdss_dp_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;

This property should be moved to kodiak.dtsi

>   	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>   };
>   
> @@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>   	vdda-pll-supply = <&vreg_l1b_0p912>;
>   
> +	mode-switch;
>   	orientation-switch;

Same for those.

Neil

>   
>   	status = "okay";
> 
> ---
> base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
> change-id: 20260417-kodiak_4k-891ef2221e4b
> 
> Best regards,


