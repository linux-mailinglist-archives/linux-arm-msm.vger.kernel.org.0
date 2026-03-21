Return-Path: <linux-arm-msm+bounces-99000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pebvEv9mvmnFOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 10:38:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674C2E46F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 10:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0572E301F998
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 09:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1E730AD15;
	Sat, 21 Mar 2026 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H3RcpQBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CCC218ADD
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085884; cv=none; b=e99ZNI8MO0ghEMoYCLa1S78+SVc177VvRAYbFDCXSTx+euiYNAglTmxRGqMlOhPl0CzlFpqHLly/TsFhSGKE9Ap/Xw5syEBfbEF0TaYesTLR3wbHNN0v9BMNwN0K0APrDLTdwXlQWC78di2ioCSU2F/n6o5oT8P+/24osINNPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085884; c=relaxed/simple;
	bh=Ch2bjEJYvEZnbr/3/ECZct18B8i4dkTNJuTXIqsuIT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvGowIkesylkfyLjMXbRD9O+wALTftGSOn3D8fUa/Xf30m9A1pCJUxjVfjXNiquNkqUKbQ9/xwxaa3Nx7fkad0mD3IVJ3OiUm7eld/uc4SJGTbJeU3LGPxTCBERHdo7U5c7x15ibB/gvDhoa8eXq0th28kH4113usRa2vu20/8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H3RcpQBv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b41b545d9so3286667f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085881; x=1774690681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFpg1mbZW3Ctniu50/V4S1EGhLRWMwZR4yXu0pZ0YM0=;
        b=H3RcpQBv05k2Q0ee2Yj8MicnRVQk/aqi56SCjbV/3T+X7WWucYpj1jDuDG9ElAPFfV
         RtHBbGXvGHLFO/CClmdC8c5I3Mst/EZbOBs1jZOV7pkcAkw/Tgvq+OsMMB3OxoqDc/cT
         cegoo0CPFl41sC7Rw1CK5ubCq+iy65C5aa9m5eiF0QGrWOVADBg3oqsCEq06hYHa26CN
         86DmsytDdIpU/QMEpIkF85BI5ZA8cOTLFPqjXWYoxUv0WvVwsnR5t8FjRlZFquOs4yOn
         NHZm0l03O3Or2tczop/AgdnSKRiLykh2iSOlKetHy41uFPHc8xG+8ZsrvRvSYnWd444H
         BxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085881; x=1774690681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFpg1mbZW3Ctniu50/V4S1EGhLRWMwZR4yXu0pZ0YM0=;
        b=DFRqIVQFBf+xY4ZGnxKdjD+ZckPQ+FW5f+oNQmdtHkwPMS9GtIVvz30uA3kr9Lg0Lo
         Sm0LGoQOCrAsaS3FYG9j+ikjtWfZbeq2avIUkSKy7Q85gqt4ukAC7R7bqVQg41tRLKN/
         lnayIyY5k8DEbwvGNbJ6j6/wpGSiv3xPMp87Oa3s6yA93rNSY9oTW+kJmNUml2FFjtFm
         mMEUGLB6EYP3x17ImAEiP4X4f91XzNPhW0fkCWjiDNoTcICOdq/mM3Xxth/1wNKmkPDa
         Lcck+gd99oeeR2glRotihF5kSb9xLGP4tjnjLAO/HyR+4zTDuf3Z7RYrZTMrqwsKuiSK
         HrGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZf9xxGh4zM9OWpTVGL1+fQpQ6/5nPL87DKixpp5cgcrvmWVGVWe3o6P9Se7m9SiCVYsD3tTScqGSwzlP3@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQxlwg6yfebaqiq9JjIjoDvxwbc3XUrx6ENApIAqLYLeZdtsU
	a3odUvBMbvv5kyTy+YhpLhPzkdhL4+fz8KhlG27ubUiHAVl6fJRWb3MEB19rSV+XfQ8=
X-Gm-Gg: ATEYQzwVAgJrjmLPm8gGmPZsGaziszfzalOZKWNkBPb1IgIQqlwzgD548vp/Ujd/+fl
	33x3wfm3/h60fNgcoJjB7cr6Cxuk6WEk/oDUvaBkvyqShYEAr2NPz5WqxU8y9a5qg12xeb3N5NQ
	7hQxqgbYz4XdsvJ0Ory1c8Um5u6muh+BpjUgQz+mg15skKeiVPi0yoWQo5LJEepqbCvGZ/m9wCk
	r6uq9DNLhL64oWiEcSWhTs7i/YksHN5P4qRGfvoazPSNE1U/4JiID0TokaJ9ds7ZwUPOzCWhoKz
	46S0ZFShXk+IZyc8XItFaFW6Q0eN8iVFFVmM6xlyDtXPZstKyP1TGAtXQTdQqNsWzIlCgnhIGhw
	THVGb+tf9pbDdtcUgCFASp3/PXH2Rf7jfeNsJ908w9IUHnwmNUgFu9QJWFmQB42ywqB1gI8XVBB
	zfdwr4Yymia0ukyj3Pdg7DAEKnBDMe/X0EOV2o+b5ZkMj6moVkd1oUkWvkHlNncPTyhVskUh62R
	40C38wn5sM4dIfBn3Tosm4=
X-Received: by 2002:a05:6000:4021:b0:439:b1c3:84c8 with SMTP id ffacd0b85a97d-43b6423bc21mr10398940f8f.21.1774085880444;
        Sat, 21 Mar 2026 02:38:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm13770100f8f.35.2026.03.21.02.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:37:59 -0700 (PDT)
Message-ID: <8462ee30-7e58-46ae-97f4-bc208dd40f27@linaro.org>
Date: Sat, 21 Mar 2026 10:37:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
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
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99000-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,pm.me:email]
X-Rspamd-Queue-Id: 9674C2E46F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 21/03/2026 à 08:52, Alexander Koskovich a écrit :
> Add RGB101010 to the unsupported format cases to fix -Wswitch warnings
> introduced by the addition of the new pixel format.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 66c73c512b0e..59fc0083d318 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -119,6 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
>   		venc_data_width = VENC_IN_COLOR_18B;
>   		break;
> +	case MIPI_DSI_FMT_RGB101010:
>   	case MIPI_DSI_FMT_RGB666_PACKED:
>   	case MIPI_DSI_FMT_RGB565:
>   		return -EINVAL;
> @@ -232,6 +233,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>   		break;
>   	case MIPI_DSI_FMT_RGB666:
>   		break;
> +	case MIPI_DSI_FMT_RGB101010:
>   	case MIPI_DSI_FMT_RGB666_PACKED:
>   	case MIPI_DSI_FMT_RGB565:
>   		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

