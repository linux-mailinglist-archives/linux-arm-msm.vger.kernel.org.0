Return-Path: <linux-arm-msm+bounces-99807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBi1JFWZw2myrwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:14:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04888321448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E83430649DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC3939449F;
	Wed, 25 Mar 2026 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xW/hH1c7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEA32EC081
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426126; cv=none; b=Wm3W3+mdiXKNmQWyUTH3BBG85cqHoz7rSF1wY6TgJdoCA4pcJss2lGb0D06QWh8KNq0dPPGNShT6Poe1zfl2MdTNntNxWHak3Jx2OoGogj25qn6gqGGLkQ0VhXQRdb0794S8AHr6n/zcqnhJZBsAWyfPVIekHcdTewk+Tq2eOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426126; c=relaxed/simple;
	bh=qGb1bL9DgdGINg8iQ68DjQNdaaMxLbe4cRJ7bBrakdg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RVI+IT7vyPS+nFl5gyUybdJHiJ/UYUFQg3gKYvbZ3BpAb+Gela6hQharo4QhpRiIiiXMGmuUXnfOCTf5vaXpLNfy6yzmrBrusuuYZt/ASnMkMN5jpUgLZENBAxkuBJ+gwi67/k9/JmV4reoAB4Z4oTC7qSOe7c0VTb6qsJSXmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xW/hH1c7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so1973973f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774426122; x=1775030922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGtfZugx6qGzB9L9OH7bygfJL7iwyyf8p4sO411xjfg=;
        b=xW/hH1c7ulBjoaBeVt5SOmQVhRBjGSmx5ksEnX/6w40vTbR/Y2SqrqUUeOYyeY3Yns
         ZiQxvY62dktMnk0fBLCQnonpwF8k9x7XioVtU8rHPc8fQs40MXR4fxnO5exENypztSqd
         z5xjNJUJlNFMu1UndgK/+OafUiLkq33JvLe4BfpsVUAWsJYRPTBB0tITA73FbGc63/qa
         JMxYk6TlZh8Iyd0C+BcCjKsRPyEY+zXe+3L/gQNLnc30HVopcY09OJmOkNWQ8MX1GqF3
         XashfRbN+tmffol2J55MgGJRo2T6tMJeIhxjrvrFx+0fpYsq7aLs9MQWyki8D8Cu6mRM
         L1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774426122; x=1775030922;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGtfZugx6qGzB9L9OH7bygfJL7iwyyf8p4sO411xjfg=;
        b=FXNemuAXdKqlr18EmoU9HwGf7TttAfYgb3Ig90rngTQS//jpM1F0KyfYmWxrvCUse8
         1ltloj19sTWpaD81VLav3s2pFBioYVgabrY9/UHzDOt+/brwDo5fgv5xNR9W0kmA+yA1
         MUhcz1zziCIKmIRfZvY+dF8zdVEEI9Oh5dcQESWITNGHKfupAcBn/tF5LcVRMZ2Eglv1
         xKs0ytqAuoAQfbjmrx2NrcSz91KQ66zpTLmLh4gMaBoIgyzG3z5zpMKje6/cTf/f6hcP
         hfUEJVFObrCgTFx4wXcl6Yr3k5jWQIjCS2YD6Q06G5wLo1qFIwAN+quTmUbVIJRQ8FAy
         D8WA==
X-Forwarded-Encrypted: i=1; AJvYcCWSV9Q3qBxnHaKo2JOFHsYku1mY7QgIf3xTEKV7ZYHg0KGwtGZKna3mDUy0IX2N0sP1XCiSyMyQBRW78IEa@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGJrGPQce+wA7WS7BDBh3X3lwzWuviFy1Pu5sGdsjjEDcUFXY
	P2Ks/0ylgCpEQNHPEz9wx6/TaCF9uLWVdHcJU6McMQnLS2hAj7IqZob23Be9Sr8RNxQ=
X-Gm-Gg: ATEYQzxMGuHe8DMoPeyZWyusCTNK4IzEZNiSiWvU78CHsvMBmngvvj+8pWc5maKIx0P
	TxFWN5x7V6P5WJXrkSwwTbkTKGBSt2SSBlwl4PLVDDnlD8TJ9J0QJnuQwfVTDU/cu1vSYOG2nof
	3+PNJLYm8nSrvStB2P/dnxlFvSd1wTr0RoEpkB9Z+Aa4/XTV41eRSVgybPQTAF50nH8WZVZdeqy
	iKxk56Vy5SqO6KfRSGAHJnBnjcxLpBSikkO3EkNj8wKrxfycHxl/stpa5jnXszPnbHBhn8/hf4L
	BbfqQ8rpM8WTOw0oelM5efibjUkN2dm/2ai6k2aJontdPOJ/tjQhM6Td9mFluay2ph9QQW2mGYj
	ZSx0fOpWnb2be8Ey7m1UO7h8iVMMFEhGaecTSMbmN+U/vcy0gKTpp6y2W7luI47Wu5owD39dm4W
	iBHBR8KjvoH+0eERwKd+XaiM58IMaJNRDVi+iB6zPUZviHO5RbefZ2SQQEScsQ3c0V6TPtx7l7+
	aqU4dM=
X-Received: by 2002:a05:6000:3112:b0:439:c1ca:82be with SMTP id ffacd0b85a97d-43b88a2171emr3257849f8f.28.1774426122254;
        Wed, 25 Mar 2026 01:08:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c160:8cc2:c60a:b843? ([2a01:e0a:106d:1080:c160:8cc2:c60a:b843])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6cdfdfa9sm36075748f8f.9.2026.03.25.01.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:08:40 -0700 (PDT)
Message-ID: <15674376-21c4-4403-8e0f-bcb80985743b@linaro.org>
Date: Wed, 25 Mar 2026 09:08:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/5] drm/meson: use default case for unsupported DSI
 pixel formats
To: Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
 <20260324-dsi-rgb101010-support-v5-2-ff6afc904115@pm.me>
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
In-Reply-To: <20260324-dsi-rgb101010-support-v5-2-ff6afc904115@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99807-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,googlemail.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 04888321448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 12:48, Alexander Koskovich wrote:
> Use default instead of listing unsupported formats explicitly, so the
> switch statements don't need updating each time a new pixel format is
> added.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 66c73c512b0e..4412bd678108 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -119,8 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
>   		venc_data_width = VENC_IN_COLOR_18B;
>   		break;
> -	case MIPI_DSI_FMT_RGB666_PACKED:
> -	case MIPI_DSI_FMT_RGB565:
> +	default:
>   		return -EINVAL;
>   	}
>   
> @@ -232,8 +231,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>   		break;
>   	case MIPI_DSI_FMT_RGB666:
>   		break;
> -	case MIPI_DSI_FMT_RGB666_PACKED:
> -	case MIPI_DSI_FMT_RGB565:
> +	default:
>   		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
>   		return -EINVAL;
>   	}
> 

Feel free to merge it in msm-next or other drm branch:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

