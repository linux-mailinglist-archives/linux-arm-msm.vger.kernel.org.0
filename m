Return-Path: <linux-arm-msm+bounces-90661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGMPFYpveGmjpwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:55:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C990DDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CFC7304FE24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30CF32C94A;
	Tue, 27 Jan 2026 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBkNyNI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9C61E520A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769500474; cv=none; b=G5k4uDhCaXpvvovUvWAZB9XU+YHk1vPdU0y5AAkxET+ZeV229WYOgdVRbSyMi2ye22ohA1TLD2W505wumfx0peoYpNxkn8eHQV/ay9Vg3GJDPJ6iwQuWse92mhCRv/uqKMuHkSQgpP+LLlwU6wC14N1Tvf83utyDZonA/uTqPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769500474; c=relaxed/simple;
	bh=x02G9I5G5FI4Stbx+0yop7O4JlcUUn8AQvXMHpX5C4I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uCP4Ytc4jj+heGf/qYvCgMv+MWdrd7sqSs75N/gExYeZU2qXJcZnzCl7bL9B23GIQqHGRqVp5B8vOAxfnk59PRtBcTOiGtZYsBgk+21p6XglMKZPj/7YTD9o34rN/kRlOzpBRvYNQBa5+KIi/Cj8v+uh1wLJpp8+DqfrAFzfMcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBkNyNI8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48069a48629so2685935e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769500471; x=1770105271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/VxnSF8krGk0nRSnDEyD6IFePycjSGM7bgvmgAJYHs=;
        b=qBkNyNI8TlmJM5gNJHCvaL3kvT+YUbN/DkP8ntJszuh9LSEvsRiqZQAqGnIEQa6cCF
         AxmLdqTZqhXS20Ocb3TZB26/VuYs9k7/p31fnhPb463ZilDY9/yoFbPrgsKCSN6LRctb
         v6bfmgPH4ukhfRZJN3+9MgcldHz4S5xR09zrVy9vH8ui2ryKmYceTU6lhlbGU22wczHf
         lHo7J+d/oFuCRMbNqPFGg7FsTJNbTtr4hORNcgQGZMLINZjxokf6wTFtlel2fb2YRhUq
         xthnb7fC2azu+qk+tSJsmg5vA6p8o1VX5esf6GIMtJ9URyGuYfmUuJT7ehjqLBjVePT+
         zS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769500471; x=1770105271;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/VxnSF8krGk0nRSnDEyD6IFePycjSGM7bgvmgAJYHs=;
        b=UjTPiXysEolPalqjxLWH9ezRKCC7ZFd8dQ5/7OWRjhdjMD5SPwfziMuFZcnEWE5KtI
         n5XMsdVKLJJWT3XZONPkN/IbpI/sWfRGg9//GoZjz4CWJIERzbzSXB0vFbB6ht6JHvGY
         RBXutePB+RDzj/RPXK6av2qLUoUEM2pCGSGA4xx/TvitUmoSd77nFeY0X6ni0df731Tb
         59AAcJ8BNIJJ2EdOjwspd3cPa/8+jmtzbQqJVwkMDHVcWppcPanacUnZQD8Q0W/aUikn
         n2gt5/Npv1mqT0/8Xy/QL2fu8akV+P5rPR7O4o8Kz40InI0lhk/YzUU9RoZvAitlP04O
         2M9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFVdvwzxkCMByFr08eWX8g8CJrc6QbySg+FqMnQoDssprBtIU8aGU+Dt1Y/teIqyDVYZWOuk4WxHXFCD7P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2GqhIPGaew1f8ZF2vuZgZdVWGW1Z3Oyaju4x+selpMK1zVKui
	nQx4s2LpgZI//M2Aa0uuMQoR35VycgWnmOl8EznwZn8qeUTUvZl7xTESgoTmudYr2tA=
X-Gm-Gg: AZuq6aI5JCYEDjl+HFoJwvERfIy4Axl6EblSXp6OTI8S+7fIsQqgsoREw9kIBaZ2c5H
	hvBLWPoy7Y/HcG0lJFgANdu4wnZRY/C9Cnl5L+Ei19CV13apkKTe2MTx9L4rjKkG3xiUkiOERU7
	EfEz4L2Vc0JOYEkv266Uuf/KCYiBZy8OmZoMUNJGEN3+yh+I0zKtfvOkelqXSXoN5gcnBfaoWjy
	TJ/3oWv8ys10bgtzYSDMmTsjxKujBkuF45BTbNGWAWThpps2hInHse0f5PJzq78LGxww0amj20d
	HnGPa6+DNeIWasdppA7PEEB+p7Sh6zyp2IuATD9oxwuU0tREGCh3n/GZNFre81YRchHYorZh2wm
	14RHwKVyXPX+LS5r0qky24duzpDX0wFhXodzHSCjRalc+b05HnV4gI56eEUejNPyz3vEtGwMc0k
	jflT/AYShW9VxWW/T0T60nho+iH576609M/yIDVJTKHJmRe4hMToWC+5gJVtNHX/tu5MefzRgLc
	w==
X-Received: by 2002:a05:6000:4028:b0:435:add0:3d76 with SMTP id ffacd0b85a97d-435dd1cb92cmr1128900f8f.56.1769500471311;
        Mon, 26 Jan 2026 23:54:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d? ([2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e715bfsm38117952f8f.22.2026.01.26.23.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 23:54:30 -0800 (PST)
Message-ID: <7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org>
Date: Tue, 27 Jan 2026 08:54:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: lt9611: Add dsi-port-b property
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
References: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
 <20260127-rubikpi-next-20260116-v1-1-0286c75150c5@thundersoft.com>
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
In-Reply-To: <20260127-rubikpi-next-20260116-v1-1-0286c75150c5@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-90661-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[thundersoft.com,intel.com,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,linaro.org:replyto,linaro.org:dkim,linaro.org:mid,thundersoft.com:email];
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
X-Rspamd-Queue-Id: BF8C990DDC
X-Rspamd-Action: no action

On 1/27/26 07:58, Hongyang Zhao wrote:
> Document the lontium,dsi-port-b property for selecting DSI Port B as
> the input source instead of the default Port A.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>   .../devicetree/bindings/display/bridge/lontium,lt9611.yaml          | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 655db8cfdc25..9b7dba4e114c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -37,6 +37,12 @@ properties:
>     vcc-supply:
>       description: Regulator for 3.3V IO power.
>   
> +  lontium,dsi-port-b:
> +    type: boolean
> +    description:
> +      Use DSI Port B as the input source instead of Port A or Port A + B.
> +      Required when the DSI is physically connected to Port B.

This is not how this should be solved, the ports links are here for this exact purpose.

port@0 represents port A, port@1 represent port B, so you need to describe the HW correctly
in the first place.

Populate only port1 and in the driver check which ports are population and change the
configuration.

Neil

> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> 


