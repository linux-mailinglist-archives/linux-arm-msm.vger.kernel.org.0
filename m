Return-Path: <linux-arm-msm+bounces-89973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN53BpKjcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:59:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B416754CEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6B7B60314F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFF5480DC0;
	Wed, 21 Jan 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tckXVLWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5848096E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989073; cv=none; b=sF2ypBdEVehgatgME98iFYBQLN8wW6b15qsq7EE0fga00HD02Q6jdD+QQVJHzlpGAJvHQOB1E/eMYuZZcKItofRYXq4h14yIhskPXgrvhvpNzECbbH0UB0Q+NVrkzpUctmx5dYnJAGFHK4b9hiuXk+eDlH6ZsBS6OhWw+wLkHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989073; c=relaxed/simple;
	bh=Vfy/7YC662hAM+GAFuZhIoPkRBd1dwGhvPNeakMPM7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R21r44an2iCEJNBN/ypJKeJxnTSsRkCqrtONJ9NNrhfH/RLP4tv2W0xNFeZNXEi4A7BTDNJbVkgB5r/8kJms/zcBJy+KIULJr37loBBRunhXQOtsfCnGjJP930aeMTUp5tJCfuhEZUIBprnR3Tckmo3AKKPkJfODVmTrgNOk9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tckXVLWP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801bc328easo55360975e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768989069; x=1769593869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBJUElWuhwE3q3MLB3VE93xamoIHkqUdh2GNEp2nbps=;
        b=tckXVLWPH/IhaJ4KLEli5yjGoWx4t9bwOdX+o/nmfb+RxiopF7L/l8jHM2f3ysXION
         UgQmTDkzGfef7OlGfrUGrTsGCPuP/QGo1Trdv357gLtcuLbg9Ma2gAOESXH4gi6yb1gV
         82+GXl8j9ZOaUiG6lcP+/uFnIQBYYfu5RWANZ+gXZo/PuL/MzJB3QvAB8Wpl1bMd0wjt
         4aXryoqTQ+vj/6089KGzmm/fHkLxuu6VRMFGrtD6PY+zJAlRrKwrhriMDeyvzn8wryts
         R62o9sAwoROex54qc/7yQwLfI3J3oxlZ5WBqTev/o32YEddfAB24w6p3DIn0oU3ju05u
         aoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989069; x=1769593869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBJUElWuhwE3q3MLB3VE93xamoIHkqUdh2GNEp2nbps=;
        b=wixz7PMcsYUsAOsegmFzv6Kov6+PjtlRm22T/AqhdR1k5K+x+6yvAH68ImmuslSH4V
         jfwNQ1dVzQX0QgTs56eqYQJy+HOxOuviYiESbDpXe1DlK13/wRUXwIfT8QdODirV1Vrb
         nRNcFQv5raxGw5LzwQVFR1qHvbIaVWp9Aet0gZVcuYFRUEhn2E7Y6bUpX3afjjKF9TRK
         eMd3lbWxKmzgkuesUoA7bw9TR2pyUiUjo4HB2fsyRotH/BccNdc6+t+ZUoiJ2svgbJQj
         7kBHknTWhuyVlEeeQNdQUbvvk/RYMVrwXeHEqGXBrflpcMqn+43Jr91pE+CXDsh8DW4Y
         +gbQ==
X-Gm-Message-State: AOJu0YyxAf1wfrVb7sDAaNlttuOqf1GRq7LzsybfKYjMIjYl/HmC2Cj+
	zMrdiO9AuuS2HsAOfYumsSqk4DI0FusuAj2XQeSByrhB7lFN4iUALzuMRVGO9oB9FL8=
X-Gm-Gg: AZuq6aJ047TyMCLJXt90wKkA+rgZcN+HqH4R7NysiWO1JxbyWpviqj6jVWYl7M5kdux
	55G+VEGMtCnyVbndDd1CrukHCPgkLk+juu9GybjC5rVGj23R22EnrsmyZ8Obi7elmRFvrlUVsQ7
	7LkijTKH4L1TN/VKMM3Uids3/DgmUv4TAnVLcksRTKf+oDUI7XHPXeY/LZECARsvNg1l+qn3f8n
	4Gg5+DZLnT/LyGkxYDWfeEP2GDANCnlspAmb4+5LG/JqctRaiUxl96RyvGxH5R3V7PVgWG+5ggy
	S4dRdtL+sAKqDuJk49myazaYaJIl47Br0eIhF1Ye10XQ4HIc/CreHiOlbQUJQ9VNmg7H5zolJ/B
	f+cQ0SWOyyQzcmbwqviObdOrVm8UKnZ6coewP0x9LJCAa6ygmJLYTs3iSKRrO18XLdGUz93b5eE
	ixeooBfcgMCwxZJwRARzL3JHJNFfGwL/eTb0QY4KIcbeTNytnw34BrWIoPfuquYtdBw0SGT0FHI
	A==
X-Received: by 2002:a05:600c:3581:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-4801eb03348mr260126345e9.21.1768989069215;
        Wed, 21 Jan 2026 01:51:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:8ae8:f59d:ae95:f372? ([2a01:e0a:3d9:2080:8ae8:f59d:ae95:f372])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm352015945e9.10.2026.01.21.01.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 01:51:08 -0800 (PST)
Message-ID: <ddb69470-db7e-4ec0-afd4-4f1631e45baf@linaro.org>
Date: Wed, 21 Jan 2026 10:51:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: vendor-prefixes: Add AlgolTek
To: Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260120234029.419825-2-val@packett.cool>
 <20260120234029.419825-4-val@packett.cool>
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
In-Reply-To: <20260120234029.419825-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-89973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,linaro.org:email,linaro.org:dkim,linaro.org:mid,linaro.org:replyto,packett.cool:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B416754CEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 00:30, Val Packett wrote:
> AlgolTek is a Taiwanese chip manufacturer specialized in high-speed
> signal and power transmission and conversion.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 63730f75a578..f2bd32fbb717 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -86,6 +86,8 @@ patternProperties:
>       description: Aldec, Inc.
>     "^alfa-network,.*":
>       description: ALFA Network Inc.
> +  "^algoltek,.*":
> +    description: AlgolTek, Inc.
>     "^allegro,.*":
>       description: Allegro DVT
>     "^allegromicro,.*":

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

