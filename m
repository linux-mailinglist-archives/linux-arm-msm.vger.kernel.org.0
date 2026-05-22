Return-Path: <linux-arm-msm+bounces-109180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHYpMjn7D2qCSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:44:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB15AFA00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D02F8302A7F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD42382F0D;
	Fri, 22 May 2026 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqaGKd+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E184373BE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432244; cv=none; b=oL24UB5FaM4ojWsWXchN0XhWFB07anSyJp8Bfn83iiPmbSeKd2IN6fO1Nyq+9K2ZyJ7DKz10ioRcciIezYoD9osay/waWEw3E0aIW97nXW7V+nUimBT2oExHoGhw20+BWL7U66ygWsW9l75foLdHuTU2735zWF4JKOKYnkL67aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432244; c=relaxed/simple;
	bh=wYDWEomdKSg+Vn09oi+zzsXmAc6O8C8jgK8UqIZwgrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEs/UjLR1PvqP+2aV2VssDlmjoegxkP29xZsRWxqS8798AjQ5fXVPSvp3gbh0hC7eDiHvvJo5sShrRGfsWal9hBspsWIaipo+6jbkBaCPr9CuXcxXU4+lAJQuKe8Zyq+XnRF//pZ76NKxPSjlnNezJyLDBKxONn0F5kx7mL0ci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqaGKd+g; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so7510455e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779432241; x=1780037041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V95QtxOjNpk/eFHCICMdSHCCCiyFoiVHQUBE50qTcZQ=;
        b=OqaGKd+gWAeYDeX1FAFCI7/XDl9e03vdlcI7kPa8NJmX8ZEL6yJongu+5Zye1rRRgW
         +cmVK8JfSmdnQ6bB69xWInM+Vygy+XHnP2MedXWEloHYb8dE8JE5gjCN0+tAxj6Y9mry
         yzXyCvi/PD93/tyNTd7CuJ4sPJReTHL8SMT1+jvCutSvPN1fWx55esdgOOVXFzMaSR4W
         T6rIHc9r7NYzF8DJgCzSlmCzzIHUrWIWm0EgywEPrRkTe6Y4lC05vxgHMi2GLO3aWzDz
         M3fNO6+qTmMdEV+S3YmDb6Huhd8r9+btTX7BO6rdznXNMMxHz3E6qyoWYIlFgmw3VXDA
         sfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432241; x=1780037041;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V95QtxOjNpk/eFHCICMdSHCCCiyFoiVHQUBE50qTcZQ=;
        b=G/fIuwJA3p8V5++n89wzKos+1pkZo0Gozyq8+y5NdBzKAHWaobKUNKeLfgHJ7qCnEa
         sk2VhU3woI+2u3WJN4Wqkw0Pb/6/RBu6pPlcIXfg74hcLf49gRAsB2EYx8ZIRQ0mo0HA
         c9p0Xg8Iw7ZekWm9WffRHID6UFz675rk1Ue1zWG/pCq64h+IMqqVLGPs9tmp1o+zrAfL
         3hZbHTncExIKSabWSounjqFUcyT5kdyTSAEHdkQtrE6cQP31F8n7d8JctDSaa5g0dOWF
         gVWLzG2fdaZfVIn7OWHWYKgFiOcGj1zdJai8gVNuyo8keGbiYc2KHlgRcaSCRQDN0Mvq
         lrdg==
X-Forwarded-Encrypted: i=1; AFNElJ94HTEJGefXRnoIVW03tcnbczFlmTP7mVtUwC9trPwy84yqtYvq0RTBeGmgaYN0OwjSl6x8dlO8pe1aOQB2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8BiUMS4JQo7SnFqlizvkp4YN96ZtEH2KabKBfySsP3J4p1s86
	JgCZf5rOzu2IffCzHa6ZEfn9W7VpenQDt04kWYHJ+436Gd+gZwse68UbGezwJeg4XupzvTaQovN
	5mBO15PU=
X-Gm-Gg: Acq92OHKMXxZjeBXM+lbZcAYZWP4S5jVGBo5EXun/KA0dk4OPaHyiUR+r/BvziKRB9m
	zt20BXr5v8k0CSjyyNr4NRaEeIvL7/r5wnexkRtmtdzharoQEpQVtgNjyjJLVCptllTJNejXk8C
	i4BuQQb6oUCqnRMNmoj4sqoi10R9j40eP9fcwjJGujqlL3o9q3cGohKWBDoU+SDAKel2VwxCveB
	OTiC+wvAmF2HYQura3pm1wLqBdu4qDG8QYL7lrJmZ4uI7/bEOPYdyKwHFoPnMT0zfMzOsnE6ouV
	rd82GTGH0DQN5BMXw3sdSuxJXT4VDTwtG4JYEevfELgFbmFvF831RH6b3GEo01JZvLKBbh1tTbD
	9cZblg9k5ahsLLj6CDaJ/OP+z70zxUjy64Tf27Cas6OvkCNrKMO7auIKdaHuk+Y0QXiK2k3wyIV
	Z7FE7gRVkH43+JyNTqQIDwLEhwYTY91F/EFQ61kMwOrB5h7ClUJeNpXuWSSwOutReUVViSw9lsq
	OrNV1E=
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr26027355e9.22.1779432241368;
        Thu, 21 May 2026 23:44:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:192b:8d21:b456:cb51? ([2a01:e0a:106d:1080:192b:8d21:b456:cb51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490417ac7dasm10859115e9.7.2026.05.21.23.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 23:44:00 -0700 (PDT)
Message-ID: <def01730-bd5d-4c61-a302-a9ca625cda7a@linaro.org>
Date: Fri, 22 May 2026 08:44:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 GPU and display pipeline
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-6-graham.oconnor@gmail.com>
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
In-Reply-To: <20260522060645.4399-6-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109180-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,linaro.org:replyto,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 3BAB15AFA00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 5/22/26 08:06, Graham O'Connor wrote:
> Enable the GPU clock controller (gpucc), GMU, display clock controller
> (dispcc), and MDSS display subsystem.
> 
> Add DisplayPort HPD pinctrl state for GPIO47 and wire up the DP output
> pipeline through the RA620 DP-to-HDMI bridge. The RA620 is a passive
> hardware bridge requiring no driver - it converts DP to HDMI
> autonomously. Add the dp-connector and hdmi-connector nodes to complete
> the display graph.
> 
> Disable DSI, DSI PHY, eDP, and eDP PHY as these interfaces are not
> present on the Radxa Dragon Q6A hardware.
> 
> Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
> connected to an HDMI monitor.
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>   .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 85 +++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index 4003837ad..e8ad6e666 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -1113,3 +1113,88 @@ &pcie1 {
>   &eud {
>   	status = "disabled";
>   };
> +
> +&gpucc {
> +	status = "okay";
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	dp_hot_plug_det: dp-hot-plug-det-state {
> +		pins = "gpio47";
> +		function = "dp_hot";
> +		bias-disable;
> +	};
> +};
> +
> +/ {
> +	hdmi-bridge {
> +		compatible = "dp-connector";

This is not the right way to enable the HDMI connector.

This patch https://lore.kernel.org/all/20250914-radxa-dragon-q6a-v2-5-045f7e92b3bb@radxa.com/
is the right way by exposing the HDMI bridge and setting the right usb_1_qmpphy data lanes.

Neil

> +		label = "hdmi";
> +		type = "full-size";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dp_hot_plug_det>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +				hdmi_bridge_in: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out_dp>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				hdmi_bridge_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_bridge_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +};
> +
> +&mdss_dsi {
> +	status = "disabled";
> +};
> +
> +&mdss_dsi_phy {
> +	status = "disabled";
> +};
> +
> +&mdss_edp {
> +	status = "disabled";
> +};
> +
> +&mdss_edp_phy {
> +	status = "disabled";
> +};


