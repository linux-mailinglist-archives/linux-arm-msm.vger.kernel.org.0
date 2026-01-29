Return-Path: <linux-arm-msm+bounces-91137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEMJJT8ee2msBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:45:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EABADACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A1E030BACA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EED01ADFE4;
	Thu, 29 Jan 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uP3UdMvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552737B400
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675758; cv=none; b=o9Iky7Lz2hSnGvTF4ABw4aXRildyKQkVSlNUUVse+duky2xuqOabJyuG/hq83Hk+vUIyTQD2eLws6rsJ5iK1ZmF2ZmnBi6T1uT/VMKMyvNN20Uwa13ADliyFNxOiKs7ATK/OsHPQ/iE7Z7eUqqHhWB+p3/nzTTBhQWBik1Tr83Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675758; c=relaxed/simple;
	bh=HRp4IAatLqEZjR3TaxQkKAoA71vf1lbF9Iv0OOnHR+c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PIKBIZs9rWdOUqTgpDjeFvpWm2cRBATf1WCIFzJCOXJHSn3VkY/Uu5+VOFhErFDVD4uzrojjpBAt8S7+WDLY2c+XxjT5Z34PtRdTavUVK7m7Z3EZ/fAfratmRZYJVT29wtEU4UiU04T/Iu5UEXVUPTpz6I5HHzUdTRH59kjlzV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uP3UdMvM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so4751045e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769675749; x=1770280549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLJo4p207VCq5w7vEIL+AFmewJQJE6XG7weT5mAvfDM=;
        b=uP3UdMvMxax4B/rMdd2CerBBIRkthxtP1a3QId6EEwCf7a3qI4tXpJi3pppX9Olyq6
         xZJ9bJcOViZRlfG5J2m0OZ0rxUAGOdx4Ef9zjHz/2KRiRoJWUOYeh4+i1I5ZfBdHmGNv
         QAFO0kU0AnEejJPgyXG/gc4Bnf8AYIFuQzgQNBh4uBAigWD5N9YOCLEm7/5+dvMHbrgJ
         CRQpUbIOY2n/1Fh1CXiBLbS2WeVA1YH03UK46AzBWJi/zYJUjty9RlWhFUobSVTIXhab
         EsYux+E8wIi0ipKq4UnA4EQj0YuuhuPoCcQzB2EqN4FgF9jJOD4An/07dlAjrdBgJ9gy
         WhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675749; x=1770280549;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLJo4p207VCq5w7vEIL+AFmewJQJE6XG7weT5mAvfDM=;
        b=K7KLc7GKt/iXsUhopMJ98gn5mws83wc6uliiuOmJVuL6ErNEp+M9Zvg21ZGjQCG6KS
         lNJhyz42L6asN20Pv/TpxESHxaIPkUeTq5uFkA9QpBCo3C9DbrwNLBgO7d/CVKzUOu9h
         uuM3V/JEqd7EHyZaRpKYm7hc7dj1uyEUW4+54eT4Lf7Iehh+5mo8d45Owooa5hpsqL0k
         FQv57Ba/YLaY425iQiRmplz61b1nxDTNrlT185vONLxC+UOSd3WBFgL2qW6i/iKndiAu
         JwmXLjj3G5UiFQ1R26Vo/+5RoKwwYHStvOzSVkIwK8xPWUkYClZlY9uIkWhCsBwsBWbn
         oJnA==
X-Forwarded-Encrypted: i=1; AJvYcCXwQ1wss3AgZtdX24aUewwYLMd3g5ZER4qQnhfs3ZvKv8lF0nvjkAXpNd3jmIShbtgUvVytqQmHtaWQOLlt@vger.kernel.org
X-Gm-Message-State: AOJu0YzJZ6yJ7z2Ko8IfDHgjUA7DPdPVvl23PBB8m4N5co7uHwI9WqM5
	aE9azRT9ezBtFzPxVopshkKxCfF7gB9rv+nxIhDjVHa8fXS3VnF6ucOj0PRr13Zq384=
X-Gm-Gg: AZuq6aJS5de5Zdr5J3y5EowIyvqqAquYQCbDOjvVoVHFkCPIXHl+pr7uobkLbCHYkyn
	VV+VvQrb+wescoCnR73V2ynV0gntlD4Wb3fnloUHzMVv2r7QA6Z3uo0LgRE7iPTlm6GVLztR7hz
	uztqSbS6R13I+E7URJA601pgVo76oHy1c7aEu/8NP3uiRllgZueVgAdH5DAIpT15zvMm6ISnpKu
	68CV08oHhi7wszi2EByNjaELp46qa3Q8qg99uVOGg5kk5WioIMhBP/+/BGlaOxHLCqvTLW6+EP1
	YVgemZtfWzVLLQyioT5caY4gmWTKmkK+km2M+3/FcrPf7rsfT2wFF3EHBP01c0K3fk//j+6eif8
	5lHMha0DLCcrQePHgnO/kbK1fwqwJ4XpzGEAxoqx9u9zpuXnuwy2lDI2yAP79tehZsbBfDc5A7N
	SDQUTzPj825hksRmpGQqacxTlYrIyiw1eN/keVQCBr0xEIUFYJr869QisWj+eVH3o=
X-Received: by 2002:a05:600c:474d:b0:480:1d0b:2d15 with SMTP id 5b1f17b1804b1-48069c53fdbmr85904995e9.27.1769675748622;
        Thu, 29 Jan 2026 00:35:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:ae8a:f349:da93:8d6e? ([2a01:e0a:3d9:2080:ae8a:f349:da93:8d6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm180119335e9.13.2026.01.29.00.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:35:48 -0800 (PST)
Message-ID: <9042eca8-8b44-4804-9013-c21f1fc0d2b7@linaro.org>
Date: Thu, 29 Jan 2026 09:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port
 B input
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Roger Shimizu <rosh@debian.org>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
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
In-Reply-To: <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91137-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[thundersoft.com,intel.com,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,0.0.0.0:email,thundersoft.com:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: E1EABADACE
X-Rspamd-Action: no action

On 1/28/26 12:15, Hongyang Zhao wrote:
> The LT9611 has two DSI input ports (Port A and Port B). Update the
> binding to clearly document the port mapping and allow using Port B
> alone when DSI is physically connected to Port B only.
> 
> Changes:
> - Clarify port@0 corresponds to DSI Port A input
> - Clarify port@1 corresponds to DSI Port B input
> - Change port requirement from mandatory port@0 to anyOf port@0/port@1,
>    allowing either port to be used independently
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>   .../bindings/display/bridge/lontium,lt9611.yaml           | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 655db8cfdc25..429a06057ae8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -44,21 +44,28 @@ properties:
>         port@0:
>           $ref: /schemas/graph.yaml#/properties/port
>           description:
> -          Primary MIPI port-1 for MIPI input
> +          DSI Port A input. directly drives the display, or works in
> +          combination with Port B for higher resolution displays.
>   
>         port@1:
>           $ref: /schemas/graph.yaml#/properties/port
>           description:
> -          Additional MIPI port-2 for MIPI input, used in combination
> -          with primary MIPI port-1 to drive higher resolution displays
> +          DSI Port B input. Can be used alone if DSI is physically
> +          connected to Port B, or in combination with Port A for higher
> +          resolution displays.
>   
>         port@2:
>           $ref: /schemas/graph.yaml#/properties/port
>           description:
>             HDMI port for HDMI output
>   
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
>       required:
> -      - port@0
>         - port@2
>   
>   required:
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

